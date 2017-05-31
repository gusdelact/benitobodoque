object WCrVtaCart: TWCrVtaCart
  Left = 242
  Top = 96
  Width = 867
  Height = 625
  ActiveControl = edImporteVenta
  Caption = 'Venta de Cartera'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sbLogCobranza: TSpeedButton
    Left = 645
    Top = 421
    Width = 5
    Height = 5
  end
  object bvSeparador: TBevel
    Left = 0
    Top = 138
    Width = 825
    Height = 7
    Shape = bsFrame
    Style = bsRaised
  end
  object sbLimpiaGrid: TSpeedButton
    Left = 0
    Top = 176
    Width = 23
    Height = 22
    Hint = 'Limpia la lista de créditos'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      20000000000000040000C40E0000C40E0000000000000000000000000000B2B2
      B2BEB8B8B8E3B6B6B6DBB6B6B6DBB7B7B7DBB7B7B7DBB7B7B7DBB7B7B7DBB7B7
      B7DBB7B7B7DBB7B7B7DBB9B9B9DBB2B2B2BE000000000000000000000000B5B5
      B5DCF4F4F4FFECECECFFEEEEEEFFEEEEEEFFF0F0F0FFF1F1F1FFF2F2F2FFF3F3
      F3FFF3F3F3FFF4F4F4FFFEFEFEFFB5B5B5DC000000000000000000000000BBBB
      BBDCF8F8F8FFEEEEEEFEEFEFEFFEF1F1F1FEF1F1F1FEF3F3F3FEF5F5F5FEF5F5
      F5FEF6F6F6FEF6F6F6FEFEFEFEFEBBBBBBDC000000000000000000000000BBBB
      BBDCF4F4F4FFECECECFFEEEEEEFFEEEEEEFFF0F0F0FFF1F1F1FFF2F2F2FFF3F3
      F3FFF3F3F3FFF4F4F4FFFEFEFEFFBBBBBBDC000000000000000000000000BBBB
      BBDCF5F5F5FFEDEDEDFFEFEFEFFFEFEFEFFFF1F1F1FFF1F1F1FFF3F3F3FFF3F3
      F3FFF4F4F4FFF5F5F5FFFEFEFEFFBBBBBBDC000000000000000000000000BBBB
      BBDCF6F6F6FFEEEEEEFFEFEFEFFFF1F1F1FFF1F1F1FFF2F2F2FFF3F3F3FFF4F4
      F4FFF5F5F5FFF6F6F6FFFFFFFFFFBBBBBBDC000000000000000000000000BBBB
      BBDCF7F7F7FFEEEEEEFFF1F1F1FFF1F1F1FFF2F2F2FFF3F3F3FFF4F4F4FFF6F6
      F6FFF6F6F6FFF7F7F7FFFFFFFFFFBBBBBBDC000000000000000000000000BBBB
      BBDCF8F8F8FFF0F0F0FFF1F1F1FFF3F3F3FFF3F3F3FFF4F4F4FFF6F6F6FFF6F6
      F6FFF7F7F7FFF9F9F9FFFFFFFFFFBBBBBBDC000000000000000000000000BCBC
      BCDCFAFAFAFFF1F1F1FFF2F2F2FFF3F3F3FFF5F5F5FFF6F6F6FFF7F7F7FFF8F8
      F8FFF9F9F9FFF9F9F9FFFFFFFFFFBCBCBCDC000000000000000000000000BCBC
      BCDCFCFCFCFFF4F4F4FFF5F5F5FFF6F6F6FFF8F8F8FFF9F9F9FFFAFAFAFFFBFB
      FBFFFCFCFCFFFDFDFDFFFFFFFFFFBCBCBCDC000000000000000000000000BBBB
      BBDCFCFCFCFFF5F5F5FFF6F6F6FFF7F7F7FFF9F9F9FFFAFAFAFFFBFBFBFFFCFC
      FCFFFDFDFDFFFEFEFEFFFFFFFFFFBBBBBBDC000000000000000000000000BBBB
      BBDCFDFDFDFFF6F6F6FFF8F8F8FFF8F8F8FFFAFAFAFFFBFBFBFFFCFCFCFFFDFD
      FDFFFEFEFEFFFFFFFFFFFFFFFFFFBBBBBBDC000000000000000000000000BBBB
      BBDCFDFDFDFFF7F7F7FFF9F9F9FFFBFBFBFFFBFBFBFFFCFCFCFFFEFEFEFFFEFE
      FEFFFFFFFFFFFEFEFEFFFFFFFFFFBBBBBBDC000000000000000000000000BBBB
      BBDCFEFEFEFFF9F9F9FFFAFAFAFFFBFBFBFFFDFDFDFFFDFDFDFFFEFEFEFFFFFF
      FFFFFEFEFEFFFBFBFBFFFFFFFFFFBBBBBBDC000000000000000000000000BBBB
      BBDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFDFDFDFFFFFFFFFFBBBBBBDC000000000000000000000000B4B4
      B4D3C4C4C4FEC3C3C3F5C3C3C3F5C3C3C3F5C4C4C4F5C4C4C4F5C4C4C4F5C3C3
      C3F5C3C3C3F5C1C1C1F5C3C3C3F5B4B4B4D30000000000000000}
    ParentShowHint = False
    ShowHint = True
    OnClick = sbLimpiaGridClick
  end
  object sbSelectAll: TSpeedButton
    Left = 32
    Top = 176
    Width = 25
    Height = 22
    Hint = 'Selecciona todos los créditos'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      20000000000000040000C40E0000C40E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000066FF660500000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000095F0DBE1F8022CD8DFEA909000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000045806BB4DCA57F977EE81FF207321DC5FFF7F080000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000015304BD36BF3FF860FE6FFF69FF78FF58F065FF127215DD38E2
      5409000000000000000000000000000000000000000000000000000000000000
      0000014F01BB23B130F94FE95EFF78EF84FF79F284FF58F567FF4AE756FF0C6C
      10DD1FBF1F08000000000000000000000000000000000000000000000000064E
      08BC23A030F953D75FFF88E491FF8EE596FF9FEAA5FF71E77CFF4AE759FF3FD6
      4CFF08620BDD008D1C0900000000000000000000000000000000045207A45DB3
      66FE6FD179FF9DDFA3FF98DF9FFF228227F41F7D25E299E5A0FF69DB74FF39D8
      49FF31C23DFF035605DD007100090000000000000000000000000B7F1716448E
      49ECB5DDBAFFA9DAAEFF2E8F34F608AA153C00AA2A0617841ED1A5E2AAFF60D0
      6AFF28C937FF22B02FFF034C04DC003F00080000000000000000000000000099
      0C14338F3AED3F9243F900A00B41000000000000000000AA150C117E18D1B3E3
      B7FF55C460FF15B725FF13A320FF024A04DB0038000900000000000000000000
      000000A10D1304A313350000000000000000000000000000000000A2170B0D77
      13D1B4DCB7FF51B25AFF069E14FF0B9517FF105312DD004F0F10000000000000
      000000000000000000000000000000000000000000000000000000000000008B
      000B0F7717D1B6D7B9FF529F5AFF3A9941FF499351FF014401B2000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000A2000B0F7817D0BAD7BDFF569E5DFF004C01B400000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000A2000B117617CD0F5D10B70000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000007F0004000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    ParentShowHint = False
    ShowHint = True
    OnClick = sbSelectAllClick
  end
  object sbUnselectAll: TSpeedButton
    Left = 64
    Top = 176
    Width = 23
    Height = 22
    Hint = 'Desmarca todos los créditos'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      20000000000000040000C40E0000C40E000000000000000000008B535356AA7F
      7F60A277745EA577775EA577775EA577775EA577775EA577775EA577745EA577
      775EA577775EA577745EA577745EA277745EAA7C7C608E555556A2747460CEC5
      C56AC4B7B568C4B7B768C4B7B768C4B7B768C4B7B768C4B7B768C4B7B768C4B7
      B768C4B7B768C4B7B768C4B7B768C4B7B568CCC2C26AA77A7A609769695EBFB2
      B068B6A5A566B6A5A566B9A5A566B6A5A266B6A5A266B6A5A266B6A5A566B6A5
      A266B6A5A566B6A5A566B6A5A266B6A5A266BCB0AE68A0716F5E9767675EBAAE
      AB68B4A0A066B4A0A066B4A0A066B4A0A066B4A0A066B4A0A066B4A0A066B4A0
      A066B4A0A066B4A0A066B4A0A066B1A09D66BAABA9689D6C6C5E9564645EB7A6
      A668AF9B9866AF9B9B66AF9B9B66AF9B9866AF9B9B66AF9B9866AF9B9866AF9B
      9866AF9B9866AF9B9866AF9B9866AC989866B2A0A0679769675E9261615EB0A1
      9F68AA969366AA969366AA969366AA969366AA969366AA969366AA969366AA96
      9366AA969366AA969366A6929265A5919164B9ABA971A07070668F5E5C5EAB9A
      9868A58E8E66A5918E66A5918E66A58E8E66A58E8E66A58E8E66A58E8E66A58E
      8E66A48D8A65A38C8C64A996966BB9A8A879CEC4C388A276766C8D5C5C5EA693
      9368A0898766A0898766A0898966A0898966A0898766A08987669F8885659D85
      8363A18E8E68B5A4A279C5B6B485C9BBB98BD3CACA93A37676708A56565EA18E
      8B689B8282669B8482669B8482669B8482669B848266967F7C649B858367AF9B
      9976C2B3B187C9BCBC8ECCBEBE92CDC1C195DBD3D29FA47676748754545E9C86
      8668967D7D66967F7D66967D7D6692797963947B7B65A6929073BFB0AE88CABE
      BC92CDBFBF95CEC2C098D1C6C49DD4CAC9A1E1DBD9ABA57777788451515E9581
      7F68917875668E7572648D7373639D898771BBAAA888CABCBC96CEC1C19ACFC4
      C29CD2C7C5A0D6CBCAA4D9CECEA9DBD1D1ADE7E3E3B9A578787D824E4E5E8E78
      7566846D6A62947D7D6CB3A0A084CABDBD98D0C3C39ED0C5C4A0D3C8C8A4D7CB
      CBA8DACECEADDCD3D2B1DED6D4B5E0D9D8B9ECEBEAC5A67A7A817B48485B8D78
      756AAB989681CABBBB9BD3C6C5A3D1C7C5A4D4C8C8A8D8CCCCACDCD2D0B1DED3
      D3B5E0D7D7B9E2DADABDE4DEDCC2E6E0E0C6F2F0F0D2A77B7B86895A5868C9BD
      BB9CD3C7C7A6D4C8C8A9D5C9C9ACD7CDCCB0DBD1D1B4DDD5D5B8E1D7D6BDE3DB
      DBC1E6DDDDC6E8E0E0CAE9E3E3CDEBE6E6D1F8F8F8DEA87D7D8A9C6E6E7AE9E7
      E6BBE1DCDAB8E3DEDEBCE8E3E3C1EAE6E6C5EDE9E9CAEEEDECCEF2F0F0D2F5F4
      F3D6F6F6F6DBF9FAFAE0FAFAFAE3FBFCFCE7FEFEFEF5AF8684947B444461A174
      74839C7070819F727283A0737384A1747486A1767688A3777789A377778BA479
      798DA57A7A8EA67B7A90A57C7A92A87C7B93AA7F7F9A844D4D6C}
    ParentShowHint = False
    ShowHint = True
    OnClick = sbUnselectAllClick
  end
  object lbImporteVenta: TLabel
    Left = 0
    Top = 40
    Width = 80
    Height = 13
    Caption = 'Importe de venta'
  end
  object lbF_VALOR_PAGO: TLabel
    Left = 128
    Top = 40
    Width = 56
    Height = 13
    Caption = 'Fecha valor'
  end
  object lbComentarios: TLabel
    Left = 0
    Top = 80
    Width = 58
    Height = 13
    Caption = 'Comentarios'
  end
  object sbPaste: TSpeedButton
    Left = 96
    Top = 176
    Width = 23
    Height = 22
    Hint = 'Pegar disposiciones desde el portapapeles'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      20000000000000040000C40E0000C40E00000000000000000000000000000000
      0000000000000000000000000000414E5393817C7AD77B7B7AD17B7B7AD17B7B
      7AD17B7B7AD17B7B7AD17B7B7AD1818180D5606060C600000000034E77510D52
      7B9B0B517B990A527C98004874934F6B7CDCFFFFFDFFF5F4F3FFF5F4F3FFF5F4
      F3FFF5F4F3FFF5F4F3FFF5F4F3FFFFFFFFFFAAA9A9EB000000001D4C75D25076
      A6FF3D689BFF3C6599FF2C5890FF56738CFFF8F4F1FFE4E2E1FFE5E3E2FFE5E4
      E4FFE5E4E4FFE5E4E4FFE5E4E4FFF4F3F3FFA0A0A0EA0000000020537CDB5A84
      B4FF4374A6FF4273A8FF2E66A1FF5A7892FFFFFEFDFFEFF1F3FFEDEEEFFFE9E8
      E7FFE9E8E8FFE9E8E8FFE9E8E8FFF9F8F8FFA3A2A2EA0000000021547CD75C86
      B5FF4576A9FF3A6DA4FF2D629DFF60738DFFE7E2E3FFDEDCDFFFE1DEDCFFECEB
      EBFFEBEAEAFFEBEAEAFFEBEAEAFFFBFAFAFFA3A3A3EA0000000022557DD7618B
      BAFF467AB2FF5B6C81FFBD8323FFCB8C20FFCB8821FFC37E1AFFAF8D6AFFF3F5
      F9FFEEECECFFEEECECFFEEECECFFFEFCFCFFA5A4A4EA0000000023567DD7678F
      BDFF5181B3FF497DB5FF887B60FFF3C068FFF1C37FFFF0C17EFFB28A5CFFF5F9
      FDFFF0F0F1FFF0F0F0FFF0F0F0FFFFFFFFFFA6A6A6EA0000000024567ED76C94
      C1FF5286BBFF547BA6FFAF8945FFF6B13BFFF0B555FFECBA72FFB69061FFF8FA
      FEFFF3F2F3FFF3F2F2FFF3F2F2FFFFFFFFFFA8A7A7EA00000000255780D77099
      C8FF5F81A5FFC18E38FFF7B751FFE6A240FFC08A4FFFE0AA5BFFBB9159FFF9FC
      FFFFF4F4F5FFF4F4F4FFF4F2F3FFFFFFFFFFA9A8A8EA00000000275880D7749D
      CDFF768A98FFE2B678FFDE9F44FFAE8A5DFFE9E6E6FFEAD5BDFFDFBE9BFFFFFF
      FFFFFFFCFAFFFFFDFCFFFFFFFEFFFFFFFFFFAAAAAAEB00000000285A82D77BA3
      CDFF6795C2FF7D90A2FF73797BFF728294FFF3F7FBFFEAF0F5FFE7E8ECFFE8EA
      ECFFE8E9EBFFE6E9E9F9E5E5E5F7F1F0F0FD9A9999E500000000295B82D783A9
      D1FF6592BDFF4C7DAFFF477AAFFF436A93FF406489FF3B6287FF3D6187FF486B
      90FF436B94FF2B465DAE3E3431523A37375C3A3A3A60000000002C5D85DA86AE
      D8FF8197ABFFC0CBD6FFBAC5D2FFB9C5D3FFB9C5D2FFBFCBD8FFBDC8D5FF5D79
      98FF4C7CB3FF1550788C00000000000000000000000000000000305F86D28CB0
      D9FF899DB0FFF0F1F0FFF0EEEBFEF0ECEBFFF8F5F4FFF7F6F6FEEBEBEBFF617B
      96FF567FB1FF135B859100000000000000000000000000000000164E754E4775
      9C963A6B958C497493ABC5C5C5FEFCFAFAFFFFFFFFFFC7C9CBFB3267928D2B5C
      86922E5C88950C5B853D00000000000000000000000000000000000000000000
      000000000000486D893FA4A2A0E8AAA9A9ECAFADACF05C65698F000000000000
      0000000000000000000000000000000000000000000000000000}
    ParentShowHint = False
    ShowHint = True
    OnClick = sbPasteClick
  end
  object lbTipoFiltro: TLabel
    Left = 96
    Top = 156
    Width = 90
    Height = 13
    Caption = 'Grupo de Producto'
  end
  object Shape1: TShape
    Left = 192
    Top = 176
    Width = 25
    Height = 25
    Brush.Color = clRed
  end
  object lbLeyendaGarantia: TLabel
    Left = 224
    Top = 182
    Width = 134
    Height = 13
    Caption = 'Disposiciones con garantías'
  end
  object lbTipoConsulta: TLabel
    Left = 384
    Top = 12
    Width = 79
    Height = 13
    Caption = 'Venta de cartera'
  end
  object labSit: TLabel
    Left = 384
    Top = 32
    Width = 80
    Height = 13
    Caption = 'Situación venta: '
  end
  object labSituacion: TLabel
    Left = 472
    Top = 32
    Width = 3
    Height = 13
  end
  object sagDATOS: TStringAlignGrid
    Left = 0
    Top = 221
    Width = 827
    Height = 169
    ColCount = 10
    DefaultColWidth = 87
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = pupDATOS
    ScrollBars = ssVertical
    TabOrder = 15
    OnDblClick = sagDATOSDblClick
    OnDrawCell = sagDATOSDrawCell
    OnKeyUp = sagDATOSKeyUp
    OnMouseDown = sagDATOSMouseDown
    OnSelectCell = sagDATOSSelectCell
    ColWidths = (
      79
      23
      87
      87
      87
      87
      87
      87
      87
      87)
    PropCell = ()
    PropCol = ()
    PropRow = ()
    PropFixedCol = ()
    PropFixedRow = ()
  end
  object cbB_COB_ORD_PER: TCheckBox
    Tag = 17
    Left = 478
    Top = 538
    Width = 15
    Height = 17
    TabStop = False
    Color = clBtnFace
    Enabled = False
    ParentColor = False
    TabOrder = 6
    Visible = False
  end
  object btnVentaCartera: TButton
    Left = 643
    Top = 416
    Width = 180
    Height = 20
    Caption = 'Venta de cartera'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
    OnClick = btnVentaCarteraClick
  end
  object PnDatos: TPanel
    Left = 0
    Top = 564
    Width = 689
    Height = 21
    TabOrder = 7
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
      Left = 248
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
      Left = 248
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
      Left = 312
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
      Left = 312
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
  object MErrores: TMemo
    Left = 0
    Top = 416
    Width = 633
    Height = 145
    TabStop = False
    Color = clInfoBk
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 18
    OnDblClick = MErroresDblClick
  end
  object pnColumnas: TPanel
    Left = 0
    Top = 204
    Width = 827
    Height = 18
    BevelOuter = bvNone
    Color = clBlack
    Enabled = False
    TabOrder = 5
    object edTitCredito: TEdit
      Left = 1
      Top = 1
      Width = 80
      Height = 16
      TabStop = False
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      Text = '         Crédito'
    end
    object edTitSel: TEdit
      Left = 82
      Top = 1
      Width = 23
      Height = 16
      TabStop = False
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = ' Sel'
    end
    object edTitMorComision: TEdit
      Left = 106
      Top = 1
      Width = 87
      Height = 16
      TabStop = False
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = '   Mor. Comisión'
    end
    object edTitMorFinanAdic: TEdit
      Left = 194
      Top = 1
      Width = 87
      Height = 16
      TabStop = False
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = ' Mor. Finan. Adic.'
    end
    object edTitImpInteres: TEdit
      Left = 458
      Top = 1
      Width = 87
      Height = 16
      TabStop = False
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Text = '     Imp. Interés'
    end
    object edTitImpCapital: TEdit
      Left = 634
      Top = 1
      Width = 87
      Height = 16
      TabStop = False
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Text = '    Imp. Capital'
    end
    object edTitMorCapital: TEdit
      Left = 282
      Top = 1
      Width = 87
      Height = 16
      TabStop = False
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      Text = '     Mor. Capital'
    end
    object edTitFinanAdic: TEdit
      Left = 546
      Top = 1
      Width = 87
      Height = 16
      TabStop = False
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      Text = ' Imp. Finan. Adic.'
    end
    object edTitImpComision: TEdit
      Left = 370
      Top = 1
      Width = 87
      Height = 16
      TabStop = False
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
      Text = '    Imp. Comisión'
    end
    object edTitScroll: TEdit
      Left = 810
      Top = 1
      Width = 16
      Height = 16
      TabStop = False
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object edTitTotal: TEdit
      Left = 722
      Top = 1
      Width = 87
      Height = 16
      TabStop = False
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
      Text = '          Total'
    end
  end
  object edDESC_FILTRO: TEdit
    Tag = -1
    Left = 312
    Top = 151
    Width = 449
    Height = 21
    HelpContext = 1007
    TabStop = False
    Color = clMenu
    TabOrder = 8
  end
  object btnFiltro: TBitBtn
    Tag = 17
    Left = 284
    Top = 152
    Width = 22
    Height = 20
    HelpContext = 1006
    TabOrder = 10
    OnClick = btnFiltroClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      0800000000000002000000000000000000000001000000010000000000008080
      8000000080000080800000800000808000008000000080008000408080004040
      0000FF80000080400000FF00400000408000FFFFFF00C0C0C0000000FF0000FF
      FF0000FF0000FFFF0000FF000000FF00FF0080FFFF0080FF0000FFFF8000FF80
      80008000FF004080FF0000001F00000000000000000000000000000000000000
      A000BA7F0000000008005B00C4005B00B800B87FFF00FFFFA8005B002600B77F
      F4005D00C00000000A000000010000000000000090005B00FE0000006300F7BF
      C00000000A00000001000000000000005700D8843F000000BC005B002300F7BF
      0000000047000200E500F9BF7900F7BFF8000000E0005B002E00F7BF5700D884
      00000000D80047330000000046000000360002002E0000001F0000003F002701
      000047333F0027013C00FA3B3F000400000000000000F91AB700000000000100
      00000A000000FA3B10000000000000002800D379FF0047333C00413C3F00FFFF
      47000000000047333F0008E8780000000300F91AB700E7820700000000000000
      01000A00C0003F010000080000001F175900B77F00005B0080005B000700B87F
      FF00FFFF8C005B00E200B77F00005B0098005B00C200B87FFF00FFFFA4005B00
      B000B77F00005B00B0005B003500B87FFF00FFFFBC005B006100410000005B00
      C8005B006E006D307700CE4835001A3D0000528700000000E0000700DC004100
      0000FFFFEC005B0018004100500020001000200001000000FF00E0FFFF000000
      5E00E0010000FF10040000040000CE4800000000000000008200150000000000
      00000000000007400100000000000100200010000000E74850000B0195000C01
      01000000B700F4FEFF0000005E00F0A60100B710040000040000964800000000
      000000009B001500D400FFFF030000003C005E0004000000A000010020000000
      0000AF4808000700000000001B00240054005E0000000000F200B87F00000000
      00000000C800BB7F00000000000000004200736361000000E7000000AF00683D
      A7004840D700F7BF37000000C4005B003F002000CC00000074000000F4005D00
      20000000F8005B005D00B77F0100000000000000000000002000000034001704
      00000002F4005D00A8005B004700B77F20000000000000200000000205000000
      000000004400071852002A009000301200002011000034875000E01000003012
      0000408750001701A8001405000000000200920400000000A200000000003012
      0000828700006A87000000000000010000000000C80000007600507F1700537F
      E00027112F00B0876E00170164002F0100000000C8000000B0000000A0000000
      200000002700000001000000E000000000002F01E0005E0020000000BA00507F
      1700537F200029798600A233A200A705FC00AC1157001AEC5E00030303030303
      03030E11110E110E111103030303030303030E01010E010E0101030303030303
      0311110E110E0E110E0E0303030303030301010E010E0E010E0E030303030303
      0311110E110E11110E110303030303030301010E010E01010E01030303030303
      03031111110E0E0E110E03030303030303030101010E0E0E0F0E030303030303
      030606060E1111111111030303030303030F0F0F0E0101010F0F030303030303
      03060111060E110E110E030303030303030F0101000E010E010E030303030303
      0606010E110611110E110303030303030F0F010E010F01010E01030303030306
      0601060F0F060E11110E03030303030F0F01000F0F010E01010E030303030606
      010E0F06060603111103030303030F0F010E0F0F0F0F03010103030303060606
      060F06060303030303030303030F0F0F0F0F0F0F030303030303030306060106
      0606060303030303030303030F0F010F0F0F0F03030303030303030606010E0F
      06060303030303030303030F0F010E0F0F0F03030303030303030306010E0F06
      06030303030303030303030F010E0F0F0F0303030303030303030306060F0606
      03030303030303030303030F0F0F0F0F03030303030303030303030306060603
      0303030303030303030303030F0F0F0303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303}
    NumGlyphs = 2
  end
  object edValorFiltro: TEdit
    Tag = 512
    Left = 192
    Top = 151
    Width = 89
    Height = 21
    HelpContext = 1005
    CharCase = ecUpperCase
    TabOrder = 9
    OnEnter = edValorFiltroEnter
  end
  object tbarTipoFiltro: TToolBar
    Left = 0
    Top = 149
    Width = 93
    Height = 25
    Align = alNone
    ButtonHeight = 21
    ButtonWidth = 76
    Caption = 'tbarTipoFiltro'
    EdgeInner = esNone
    EdgeOuter = esNone
    ShowCaptions = True
    TabOrder = 13
    object tbTipoFiltro: TToolButton
      Left = 0
      Top = 2
      Caption = 'Búsqueda por '
      DropdownMenu = pupFiltroBusqueda
      ImageIndex = 0
      Style = tbsDropDown
    end
  end
  object pnlMsgs: TPanel
    Left = 610
    Top = 564
    Width = 175
    Height = 21
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
  end
  object Panel1: TPanel
    Left = 0
    Top = 390
    Width = 827
    Height = 18
    BevelOuter = bvNone
    Color = clBlack
    Enabled = False
    TabOrder = 16
    object edFootCred: TEdit
      Left = 1
      Top = 1
      Width = 80
      Height = 16
      TabStop = False
      BiDiMode = bdRightToLeft
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object edFootSel: TEdit
      Left = 82
      Top = 1
      Width = 23
      Height = 16
      TabStop = False
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edFootMorComision: TEdit
      Left = 106
      Top = 1
      Width = 87
      Height = 16
      TabStop = False
      BiDiMode = bdRightToLeft
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edFootMorFinanAdic: TEdit
      Left = 194
      Top = 1
      Width = 87
      Height = 16
      TabStop = False
      BiDiMode = bdRightToLeft
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edFootImpInteres: TEdit
      Left = 458
      Top = 1
      Width = 87
      Height = 16
      TabStop = False
      BiDiMode = bdRightToLeft
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edFootImpCapital: TEdit
      Left = 634
      Top = 1
      Width = 87
      Height = 16
      TabStop = False
      BiDiMode = bdRightToLeft
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object edFootMorCapital: TEdit
      Left = 282
      Top = 1
      Width = 87
      Height = 16
      TabStop = False
      BiDiMode = bdRightToLeft
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object edFootImpFinanAdic: TEdit
      Left = 546
      Top = 1
      Width = 87
      Height = 16
      TabStop = False
      BiDiMode = bdRightToLeft
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object edFootImpComision: TEdit
      Left = 370
      Top = 1
      Width = 87
      Height = 16
      TabStop = False
      BiDiMode = bdRightToLeft
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object edFootScroll: TEdit
      Left = 810
      Top = 1
      Width = 16
      Height = 16
      TabStop = False
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object edFootTotal: TEdit
      Left = 722
      Top = 1
      Width = 87
      Height = 16
      TabStop = False
      BiDiMode = bdRightToLeft
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
  end
  object edF_VALOR_PAGO: TEdit
    Tag = 17
    Left = 128
    Top = 55
    Width = 62
    Height = 22
    CharCase = ecUpperCase
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    OnChange = edF_VALOR_PAGOChange
    OnExit = edF_VALOR_PAGOExit
    OnKeyPress = edF_VALOR_PAGOKeyPress
  end
  object dtF_VALOR_PAGO: TInterDateTimePicker
    Tag = 17
    Left = 191
    Top = 55
    Width = 19
    Height = 22
    CalAlignment = dtaLeft
    Date = 37825.7332781018
    Time = 37825.7332781018
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 2
    Edit = edF_VALOR_PAGO
    Formato = dfDate
  end
  object cbReportaBuro: TCheckBox
    Left = 215
    Top = 56
    Width = 217
    Height = 17
    Alignment = taLeftJustify
    Caption = 'La institución reporta en Buró de Crédito'
    TabOrder = 3
  end
  object mComentarios: TMemo
    Left = 0
    Top = 96
    Width = 825
    Height = 33
    TabOrder = 4
  end
  object btnAgregaCreditos: TBitBtn
    Tag = 1
    Left = 768
    Top = 152
    Width = 25
    Height = 25
    Hint = 'Agrega créditos a la tabla'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = btnAgregaCreditosClick
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      20000000000000040000C40E0000C40E0000000000000000000065444BCE6543
      4BE565434BE565434BE565434BE565434BE565434BE565444BCE000000000000
      000000000000000000000000000000000000000000000000000065434BE5FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF65434BE5000000000000
      000000000000000000000000000000000000000000000000000065434BE5FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF65434BE5000000000000
      000000000000000000000000000000000000000000000000000065434BE56544
      4CFF65444CFF65444CFF65444CFF65444CFF65444CFF65434BE5000000000000
      000000000000000000000000000000000000000000000000000065434BE5FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF65434BE5000000000000
      000000000000000000000000000000000000000000000000000065434BE5FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF65434BE5000000000000
      000000000000000000000000000000000000000000000000000065444BCE6543
      4BE565434BE565434BE565434BE565434BE565434BE565444BCE65444BCE6543
      4BE565434BE565434BE565434BE565434BE565434BE565444BCE000000000000
      00000000000000000000DD9031FF00000000000000000000000065434BE580D0
      94FF00941DFF008610FF007A07FF007200FF007200FF65434BE5000000000000
      000000000000DD9031FFDD8F31FF00000000000000000000000065434BE580D6
      99FF00A228FF00941DFF008611FF007A07FF007200FF65434BE5000000000000
      0000EEA923FFEEA923FFEEA924FFEEA924FFEEA924FF0000000065434BE56544
      4CFF65444CFF65444CFF65444CFF65444CFF65444CFF65434BE5000000000000
      000000000000FFC42CFFFFC42CFF00000000000000000000000065434BE580DA
      9CFF00B539FF00AD32FF00A128FF00941CFF008611FF65434BE5000000000000
      00000000000000000000FFC32CFF00000000000000000000000065434BE580DA
      9CFF00B539FF00B539FF00AD32FF00A129FF00931CFF65434BE565444BCE6543
      4BE565434BE565434BE565434BE565434BE565434BE565444BCE65444BCE6543
      4BE565434BE565434BE565434BE565434BE565434BE565444BCE65434BE5FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF65434BE5000000000000
      000000000000000000000000000000000000000000000000000065434BE5FFFF
      FFFFFEFEFEE5FEFEFEE5FEFEFEE5FEFEFEE5FEFEFEE565444BCE000000000000
      000000000000000000000000000000000000000000000000000064434BB96544
      4BCE65434BE565434BE565434BE565434BE565434BE565444BCE000000000000
      0000000000000000000000000000000000000000000000000000}
  end
  object btnReemplazaCreditos: TBitBtn
    Left = 800
    Top = 152
    Width = 25
    Height = 25
    Hint = 'Reemplaza los creditos de la tabla'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = btnReemplazaCreditosClick
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      20000000000000040000C40E0000C40E00000000000000000000000000006543
      4BB265444BE865444BE865444BE865444BE865444BE865444BE865444BE86544
      4BE865444BE865444BE865444BE865434BB20000000000000000000000006544
      4BE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF65444CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF65444BE80000000000000000000000006544
      4BE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF65444CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF65444BE80000000000000000000000006544
      4BE865444CFF65444CFF65444CFF65444CFF65444CFF65444CFF65444CFF6544
      4CFF65444CFF65444CFF65444CFF65444BE80000000000000000000000006544
      4BE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF65444CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF65444BE80000000000000000000000006544
      4BE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF65444CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF65444BE80000000000000000000000006544
      4BE865444CFF65444CFF65444CFF65444CFF65444CFF65444CFF65444CFF6544
      4CFF65444CFF65444CFF65444CFF65444BE80000000000000000000000006544
      4BE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF65444CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF65444BE80000000000000000000000006544
      4BE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF65444CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF65444BE80000000000000000000000006544
      4BE865444CFF65444CFF65444CFF65444CFF65444CFF65444CFF65444CFF6544
      4CFF65444CFF65444CFF65444CFF65444BE80000000000000000000000006544
      4BE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF65444CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF65444BE80000000000000000000000006544
      4BE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF65444CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF65444BE80000000000000000000000006544
      4BE865444CFF65444CFF65444CFF65444CFF65444CFF65444CFF65444CFF6544
      4CFF65444CFF65444CFF65444CFF65444BE80000000000000000000000006544
      4BE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF65444CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF65444BE80000000000000000000000006544
      4BE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF65444CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF65444BE80000000000000000000000006543
      4BB265444BE865444BE865444BE865444BE865444BE865444BE865444BE86544
      4BE865444BE865444BE865444BE865434BB20000000000000000}
  end
  object edImporteVenta: TInterEdit
    Left = 0
    Top = 56
    Width = 121
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '0.00'
    MaxLength = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 0
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object rgOperacion: TRadioGroup
    Left = 0
    Top = 0
    Width = 289
    Height = 33
    Caption = ' Operación '
    Columns = 2
    Items.Strings = (
      'Venta'
      'Consulta/Cancelación')
    TabOrder = 19
    OnClick = rgOperacionClick
  end
  object tbarTipoConsulta: TToolBar
    Left = 297
    Top = 4
    Width = 80
    Height = 25
    Align = alNone
    ButtonHeight = 21
    ButtonWidth = 66
    Caption = 'tbarTipoFiltro'
    EdgeInner = esNone
    EdgeOuter = esNone
    ShowCaptions = True
    TabOrder = 20
    object tbTipoConsulta: TToolButton
      Left = 0
      Top = 2
      Caption = 'Consulta por'
      DropdownMenu = pupTipoConsulta
      ImageIndex = 0
      Style = tbsDropDown
    end
  end
  object edValorConsulta: TEdit
    Tag = 512
    Left = 472
    Top = 7
    Width = 89
    Height = 21
    HelpContext = 1005
    CharCase = ecUpperCase
    TabOrder = 21
    OnEnter = edValorConsultaEnter
    OnKeyPress = edValorConsultaKeyPress
  end
  object btnConsulta: TBitBtn
    Tag = 17
    Left = 564
    Top = 8
    Width = 22
    Height = 20
    HelpContext = 1006
    TabOrder = 22
    OnClick = btnConsultaClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      0800000000000002000000000000000000000001000000010000000000008080
      8000000080000080800000800000808000008000000080008000408080004040
      0000FF80000080400000FF00400000408000FFFFFF00C0C0C0000000FF0000FF
      FF0000FF0000FFFF0000FF000000FF00FF0080FFFF0080FF0000FFFF8000FF80
      80008000FF004080FF0000001F00000000000000000000000000000000000000
      A000BA7F0000000008005B00C4005B00B800B87FFF00FFFFA8005B002600B77F
      F4005D00C00000000A000000010000000000000090005B00FE0000006300F7BF
      C00000000A00000001000000000000005700D8843F000000BC005B002300F7BF
      0000000047000200E500F9BF7900F7BFF8000000E0005B002E00F7BF5700D884
      00000000D80047330000000046000000360002002E0000001F0000003F002701
      000047333F0027013C00FA3B3F000400000000000000F91AB700000000000100
      00000A000000FA3B10000000000000002800D379FF0047333C00413C3F00FFFF
      47000000000047333F0008E8780000000300F91AB700E7820700000000000000
      01000A00C0003F010000080000001F175900B77F00005B0080005B000700B87F
      FF00FFFF8C005B00E200B77F00005B0098005B00C200B87FFF00FFFFA4005B00
      B000B77F00005B00B0005B003500B87FFF00FFFFBC005B006100410000005B00
      C8005B006E006D307700CE4835001A3D0000528700000000E0000700DC004100
      0000FFFFEC005B0018004100500020001000200001000000FF00E0FFFF000000
      5E00E0010000FF10040000040000CE4800000000000000008200150000000000
      00000000000007400100000000000100200010000000E74850000B0195000C01
      01000000B700F4FEFF0000005E00F0A60100B710040000040000964800000000
      000000009B001500D400FFFF030000003C005E0004000000A000010020000000
      0000AF4808000700000000001B00240054005E0000000000F200B87F00000000
      00000000C800BB7F00000000000000004200736361000000E7000000AF00683D
      A7004840D700F7BF37000000C4005B003F002000CC00000074000000F4005D00
      20000000F8005B005D00B77F0100000000000000000000002000000034001704
      00000002F4005D00A8005B004700B77F20000000000000200000000205000000
      000000004400071852002A009000301200002011000034875000E01000003012
      0000408750001701A8001405000000000200920400000000A200000000003012
      0000828700006A87000000000000010000000000C80000007600507F1700537F
      E00027112F00B0876E00170164002F0100000000C8000000B0000000A0000000
      200000002700000001000000E000000000002F01E0005E0020000000BA00507F
      1700537F200029798600A233A200A705FC00AC1157001AEC5E00030303030303
      03030E11110E110E111103030303030303030E01010E010E0101030303030303
      0311110E110E0E110E0E0303030303030301010E010E0E010E0E030303030303
      0311110E110E11110E110303030303030301010E010E01010E01030303030303
      03031111110E0E0E110E03030303030303030101010E0E0E0F0E030303030303
      030606060E1111111111030303030303030F0F0F0E0101010F0F030303030303
      03060111060E110E110E030303030303030F0101000E010E010E030303030303
      0606010E110611110E110303030303030F0F010E010F01010E01030303030306
      0601060F0F060E11110E03030303030F0F01000F0F010E01010E030303030606
      010E0F06060603111103030303030F0F010E0F0F0F0F03010103030303060606
      060F06060303030303030303030F0F0F0F0F0F0F030303030303030306060106
      0606060303030303030303030F0F010F0F0F0F03030303030303030606010E0F
      06060303030303030303030F0F010E0F0F0F03030303030303030306010E0F06
      06030303030303030303030F010E0F0F0F0303030303030303030306060F0606
      03030303030303030303030F0F0F0F0F03030303030303030303030306060603
      0303030303030303030303030F0F0F0303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303}
    NumGlyphs = 2
  end
  object btnCancelaVenta: TButton
    Left = 641
    Top = 448
    Width = 180
    Height = 20
    Caption = 'Cancelación de venta'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 23
    OnClick = btnCancelaVentaClick
  end
  object btnDisplayConsulta: TButton
    Left = 592
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 24
    OnClick = btnDisplayConsultaClick
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
    OnDespuesShow = InterForma1DespuesShow
    Left = 122
    Top = 490
  end
  object ikValorFiltro: TInterLinkit
    Control = edValorFiltro
    OnEjecuta = ikValorFiltroEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 752
    Top = 105
  end
  object ImageList: TImageList
    BlendColor = clWhite
    BkColor = clWhite
    Masked = False
    Left = 88
    Top = 478
    Bitmap = {
      494C010103000400040010001000FFFFFF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00000000000000
      0000FFFFFF00000000000000000000000000FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300636B7300636B7300636B
      7300636B7300636B7300636B7300636B7300636B7300636B7300E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300636B7300636B7300636B
      7300636B7300636B7300636B7300636B7300636B7300636B7300E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000FFFF000000000000FFFF0000
      00000000FFFF000000000000FFFF000000000000FFFF000000000000FFFF0000
      7FC07FC0FFFF00007FC077C0FFFF00007FC063C0FFFF00007FC041C0FFFF0000
      7FC048C0FFFF00007FC05C40FDFF00007FC07E40F8FF00007FC07F40F07F0000
      7FC07FC0E03F000000000000C01F000000000000000000000000000000000000
      000000000000}
  end
  object pupFiltroBusqueda: TPopupMenu
    OnPopup = pupFiltroBusquedaPopup
    Top = 145
    object pupGpoProducto: TMenuItem
      Tag = 1
      Caption = 'Grupo de Producto'
      GroupIndex = 1
      RadioItem = True
      OnClick = oeTipoFiltroClick
    end
    object pupAcreditado: TMenuItem
      Tag = 2
      Caption = 'Acreditado'
      GroupIndex = 1
      RadioItem = True
      OnClick = oeTipoFiltroClick
    end
    object pupContrato: TMenuItem
      Tag = 3
      Caption = 'Autorización'
      GroupIndex = 1
      RadioItem = True
      OnClick = oeTipoFiltroClick
    end
    object pupDisposicion: TMenuItem
      Tag = 4
      Caption = 'Disposición'
      GroupIndex = 1
      RadioItem = True
      OnClick = oeTipoFiltroClick
    end
  end
  object pupDATOS: TPopupMenu
    Images = ilDatos
    Left = 160
    Top = 296
    object Desplegarlainformacindelcrdito1: TMenuItem
      Action = actDisplayCred
    end
    object Pegarcrditosdelportapapeles1: TMenuItem
      Action = actPaste
    end
  end
  object ActionList1: TActionList
    Left = 720
    Top = 104
    object actPaste: TAction
      Caption = 'Pegar disposiciones desde el portapapeles'
      Hint = 'Pegar disposiciones desde el portapapeles'
      ImageIndex = 0
      ShortCut = 16470
      OnExecute = actPasteExecute
    end
    object actDisplayCred: TAction
      Caption = 'Desplegar la información de la disposición'
      ImageIndex = 1
      OnExecute = actDisplayCredExecute
    end
  end
  object ilDatos: TImageList
    Left = 480
    Top = 176
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000414E5393817C7AD77B7B7AD17B7B7AD17B7B7AD17B7B7AD17B7B
      7AD17B7B7AD1818180D5606060C6000000009081728A907F72BE907E6EB88E7C
      6EB88E7C6DB88E7C6DB88D7B6AB88D7B6AB88D7B6AB88F7D6CB78E7C6CB78D7B
      6AB88F7D6CB7917E70B6927F70BE928172880000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000034E77510D527B9B0B517B990A52
      7C98004874934F6B7CDCFFFFFDFFF5F4F3FFF5F4F3FFF5F4F3FFF5F4F3FFF5F4
      F3FFF5F4F3FFFFFFFFFFAAA9A9EB000000009E8E7DD0C1B3A6FAC1B1A0F6C1B1
      A0F6C1B0A0F6BEAF9FF6BFAF9EF6C0B09EF6C0AF9EF6C1B0A0F5C1AFA0F5C0AF
      9EF6C1B0A0F5C2B0A2F5C2B2A6FAA08E7ECF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001D4C75D25076A6FF3D689BFF3C65
      99FF2C5890FF56738CFFF8F4F1FFE4E2E1FFE5E3E2FFE5E4E4FFE5E4E4FFE5E4
      E4FFE5E4E4FFF4F3F3FFA0A0A0EA00000000B19E8CFDFFFFFAFFF9FDFFFFFBF6
      FFFFF7FAFFFFFFFFFFFFFEFFFFFFF9F8FFFFFCF7FFFFFCF7FFFFFCF7FFFFFCF7
      FFFFFBF7FFFFF9FDFFFFFFFFFAFFBAA592FD0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000020537CDB5A84B4FF4374A6FF4273
      A8FF2E66A1FF5A7892FFFFFEFDFFEFF1F3FFEDEEEFFFE9E8E7FFE9E8E8FFE9E8
      E8FFE9E8E8FFF9F8F8FFA3A2A2EA00000000AF9C8BF5FFFFF5FF66BEFEFF42B8
      FCFF4EB7FDFFFDFCFFFFECF8FEFF36BBFDFF3EC2FDFF3EC1FDFF3EC1FDFF3EC1
      FDFF3BBFFDFF5BBBFDFFFFFDF5FFB8A590F50000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000021547CD75C86B5FF4576A9FF3A6D
      A4FF2D629DFF60738DFFE7E2E3FFDEDCDFFFE1DEDCFFECEBEBFFEBEAEAFFEBEA
      EAFFEBEAEAFFFBFAFAFFA3A3A3EA00000000AF9B89F5FFFDF4FF6BC4FFFF00F8
      FFFF3FBAFCFFF8FBFFFFEEF9FEFF3CBAFCFF00F9FFFF00F5FFFF00F5FFFF00F5
      FFFF00F3FFFF5EBFFEFFFFFBF4FFB7A390F50000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000022557DD7618BBAFF467AB2FF5B6C
      81FFBD8323FFCB8C20FFCB8821FFC37E1AFFAF8D6AFFF3F5F9FFEEECECFFEEEC
      ECFFEEECECFFFEFCFCFFA5A4A4EA00000000AD9886F5FFF9EFFF91CCFFFF6CC2
      FCFF5ABAFCFFF7FDFFFFE6F5FEFF5CBAFCFF70C4FCFF70C4FCFF70C4FCFF70C4
      FCFF6CC2FCFF5CBCFCFFFFFCF4FFB7A38FF50000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000023567DD7678FBDFF5181B3FF497D
      B5FF887B60FFF3C068FFF1C37FFFF0C17EFFB28A5CFFF5F9FDFFF0F0F1FFF0F0
      F0FFF0F0F0FFFFFFFFFFA6A6A6EA00000000AF9B88F5FFF9F2FFFFFFFFFFFFFF
      FFFFFFFFFFFFF8FDFFFFF5FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFF9F4FFB9A28EF50000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000024567ED76C94C1FF5286BBFF547B
      A6FFAF8945FFF6B13BFFF0B555FFECBA72FFB69061FFF8FAFEFFF3F2F3FFF3F2
      F2FFF3F2F2FFFFFFFFFFA8A7A7EA00000000AF9A86F5FFFBF1FF60BDFCFF57BA
      FCFF4BB6FCFFF7FDFFFFECF7FEFF55B8FCFF58BAFCFF58BAFCFF52B8FCFF61BD
      FCFF57BAFCFF60BDFCFFFFFCF5FFB19E8CF50000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000255780D77099C8FF5F81A5FFC18E
      38FFF7B751FFE6A240FFC08A4FFFE0AA5BFFBB9159FFF9FCFFFFF4F4F5FFF4F4
      F4FFF4F2F3FFFFFFFFFFA9A8A8EA00000000AC9583F5FFF7ECFF6AC4FFFF00F4
      FFFF3FB9FCFFF6FBFFFFE8F5FEFF26C4FCFF00F5FFFF00F1FFFF00F1FFFF00F1
      FFFF00EEFFFF5EBEFEFFFFFCF4FFAE9C8AF50000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000275880D7749DCDFF768A98FFE2B6
      78FFDE9F44FFAE8A5DFFE9E6E6FFEAD5BDFFDFBE9BFFFFFFFFFFFFFCFAFFFFFD
      FCFFFFFFFEFFFFFFFFFFAAAAAAEB00000000AD9784F5FFF9EEFF70C0FFFF27CA
      FDFF45B5FBFFF6FBFFFFECF7FEFF28BCFCFF2BCCFDFF2BCAFDFF2BCAFDFF2BCA
      FDFF27C8FDFF62BCFDFFFFFEF6FFB09D8BF50000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000285A82D77BA3CDFF6795C2FF7D90
      A2FF73797BFF728294FFF3F7FBFFEAF0F5FFE7E8ECFFE8EAECFFE8E9EBFFE6E9
      E9F9E5E5E5F7F1F0F0FD9A9999E500000000AE9683F5FFFAF1FFE9F6FFFFE9ED
      FFFFE5F1FFFFF8FDFFFFF3FCFFFFE6EEFFFFEAEEFFFFEBEEFFFFEAEEFFFFEAEE
      FFFFE9EEFFFFE9F6FFFFFFFEF9FFB19D8AF50000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000295B82D783A9D1FF6592BDFF4C7D
      AFFF477AAFFF436A93FF406489FF3B6287FF3D6187FF486B90FF436B94FF2B46
      5DAE3E3431523A37375C3A3A3A6000000000AF9885F5FFF4E8FFFFF9F0FFFFFA
      F0FFFFFAF0FFFFF7F0FFFFF8F0FFFFFAF0FFFFF9F0FFFFF9F0FFFFFAF0FFFFFA
      F0FFFFFAF0FFFFF9F0FFFFF7EDFFB19D8AF50000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002C5D85DA86AED8FF8197ABFFC0CB
      D6FFBAC5D2FFB9C5D3FFB9C5D2FFBFCBD8FFBDC8D5FF5D7998FF4C7CB3FF1550
      788C00000000000000000000000000000000A28C7CF6C8B3A6FFC4AEA1FFC5AE
      A1FFC5AFA1FFC5AFA1FFC5AFA1FFC5AFA1FFC5AEA1FFC4AEA1FFC5AFA1FFC5AF
      A0FFC5AFA0FFC5AFA0FFC8B2A5FFA4907EF60000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000305F86D28CB0D9FF899DB0FFF0F1
      F0FFF0EEEBFEF0ECEBFFF8F5F4FFF7F6F6FEEBEBEBFF617B96FF567FB1FF135B
      859100000000000000000000000000000000A89788F6E6DCD9FFDCD1CBFFDACE
      C6FFD8CBC2FFD5C7BFFFD3C1BAFFD0BFB5FFD0C0B5FFD2C2BAFFD5C6BDFFDACD
      C6FFDFD5CEFFE2D9D5FFE8E3DFFFAB9B8CF60000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000164E754E47759C963A6B958C4974
      93ABC5C5C5FEFCFAFAFFFFFFFFFFC7C9CBFB3267928D2B5C86922E5C88950C5B
      853D00000000000000000000000000000000A7988CD5C2B4ABFFBBADA2FFB9AA
      9DFFB6A79AFFB4A296FFB29E92FFAF9C8EFFAF9D8EFFB19F92FFB3A296FFBCAE
      A4FFC1B5ABFFC4B7AFFFC8BEB4FFA89A8ED10000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000486D
      893FA4A2A0E8AAA9A9ECAFADACF05C65698F0000000000000000000000000000
      000000000000000000000000000000000000A495869D9B8A7CCD978577C69583
      73C6928071C6917C6DC6907B6CC68C7968C68C7A68C68E7B6AC6917C6DC69483
      72C699887AC69B8C7FC69C8C7ECDA49689980000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F8010000000000000001000000000000
      0001000000000000000100000000000000010000000000000001000000000000
      0001000000000000000100000000000000010000000000000001000000000000
      00010000000000000001000000000000000F000000000000000F000000000000
      000F000000000000E0FF00000000000000000000000000000000000000000000
      000000000000}
  end
  object pupTipoConsulta: TPopupMenu
    OnChange = pupTipoConsultaChange
    Left = 296
    Top = 32
    object Grupodeventa1: TMenuItem
      Tag = 5
      Caption = 'Grupo de venta'
      Checked = True
      GroupIndex = 2
      RadioItem = True
      OnClick = oeTipoFiltroClick
    end
    object Disposicin1: TMenuItem
      Tag = 4
      Caption = 'Disposición'
      GroupIndex = 2
      RadioItem = True
      OnClick = oeTipoFiltroClick
    end
  end
  object TVerificaCambio: TTimer
    Enabled = False
    Interval = 250
    OnTimer = TVerificaCambioTimer
    Left = 696
    Top = 16
  end
  object TInitStatus: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TInitStatusTimer
    Left = 728
    Top = 16
  end
end
