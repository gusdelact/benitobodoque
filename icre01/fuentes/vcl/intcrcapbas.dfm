object WCrCapBas: TWCrCapBas
  Left = 506
  Top = 178
  Width = 413
  Height = 453
  Caption = 'Capital B�sico'
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
  object lbFecha: TLabel
    Left = 264
    Top = 4
    Width = 30
    Height = 13
    Caption = 'Fecha'
  end
  object sagCapitalBasico: TStringAlignGrid
    Left = -1
    Top = 65
    Width = 201
    Height = 321
    DefaultRowHeight = 20
    RowCount = 20
    TabOrder = 0
    OnSelectCell = sagCapitalBasicoSelectCell
    Editable = False
    OnAfterEdit = sagCapitalBasicoAfterEdit
    OnBeforeEdit = sagCapitalBasicoBeforeEdit
    OnValidateEdit = sagCapitalBasicoValidateEdit
    AutoAdjustLastCol = True
    ColWidths = (
      0
      101
      76
      -1
      -1)
    Cells = (
      1
      0
      'Capital'
      2
      0
      '%')
    PropCell = (
      1
      0
      1
      2
      0
      1
      1
      3
      2
      0)
    PropCol = (
      0
      1
      2
      0
      1
      1
      0
      0
      2
      1
      2
      3
      2
      0)
    PropRow = (
      1
      3
      2
      0)
    PropFixedCol = (
      1
      1
      0
      0
      2
      1
      2
      0)
    PropFixedRow = ()
  end
  object rgTipo_Entidades: TRadioGroup
    Left = 0
    Top = 16
    Width = 390
    Height = 49
    Caption = 'Tipo Entidades'
    Columns = 4
    ItemIndex = 1
    Items.Strings = (
      'Federal'
      'Estados'
      'Municipios'
      'Todos')
    TabOrder = 1
    OnClick = rgTipo_EntidadesClick
  end
  object btModificar: TBitBtn
    Left = 299
    Top = 286
    Width = 91
    Height = 25
    Caption = 'Modificar '
    TabOrder = 2
    OnClick = btModificarClick
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      20000000000000040000C40E0000C40E00000000000000000000000000000000
      000000000000000000000516002D21530DCD0000000100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000364D21296314F120620DEB0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000074B7F22276621EC428A40FF21650FEB1F5D00DA1F5E00DA1F5F00DB1F5F
      00DB1F5F00DB1F5F00DB1F5D00DA1F5D00DA1E5C01A000000000000000000D4B
      7C2529631CEC458941FF378B39FF37A43BFD2FB535F229C033F223CC31F21ECD
      2DF219C725F211B61DF20D9B15F00E7C13F51E610CF00000000000000000225E
      1CD547893AFF378E3AFF32AC36FF2EC436FF2DD638FF28E137FF23E934FF1AE7
      2BFF10DB20FF06C612FF00A105FF006F02FF186108F800000000000000001365
      A3351A691AEB0DA310FF28C936FF45D856FB57E767EA6CF37BEA74F482EA67F4
      72EA52EE56E840CE4FF029BF39FF018F06FF186709F800000000000000000D68
      C338087BD85D248427F049EB4FFF2F8B20EA1F5F01BA206101BA206001BB2060
      01BB205D00B6226606C748D957FF08AB10FF187109F800000000000000000F6C
      BF710981F7804EAAE78B3B9B39F43E902AEA0000000000000000000000000000
      0000112AA2BE267D32845BF25EB20EB91AC21A7208DF0000000000000000106B
      BAAB027EEDCB3C9DFEBE1143908132861AC000FF000100000000000000000000
      00002A4BB1E32B50A8F359E9786A14C61A561C6B05BC00000000000000001066
      B3DE0077E1FF1F8DF9FF1F8DF9FF000079A801047BAD00027BAD00027CAC0001
      7AAB1C41ACE23499FFFF0E3E97EC10B1262E19B2190A00000000000000001561
      ACE10672D7FF0E7BE0FF2188F2ED3F9CFEE261AFFEE46FB8FEE466B4FDE44DA3
      F7E4278FF7F90177ECFF1671CDFF06356EDD1297251B00000000000000003671
      B1E24796ECFF3899EDFF32AAFDFF47B7FFFF60C0FFFF60BFFFFF4AB5FFFF28A4
      FFFF0B8AF3FF1A86E0FF2788D8FF1B6AC4FF0B3266C900000000000000005279
      A1D279AEE6FB6CADE3F467B2EAF461B6EFF461B8F1F559B4F1F54BA9EDF5469E
      E2F54999DFFD4295E0FF428FE0FF183B85E91071202F00000000000000000207
      746501057692010278B2010479B2010479B201057AB301057BB401057AB30002
      78B2233791E594C1FDFF3A5D99E90C79182A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000333D8DE3646EAAF106481E2A000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002A3065B91712253600000000000000000000000000000000}
  end
  object btAceptar: TBitBtn
    Left = 298
    Top = 317
    Width = 93
    Height = 25
    Caption = 'Aceptar'
    Enabled = False
    TabOrder = 3
    OnClick = btAceptarClick
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      20000000000000040000C40E0000C40E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000227D287035963BFE217D288A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001B79236545B850FF81FF8DFF3DAD45FF2898327D0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001E7B265D32B03DFD62FD71FF66FC74FF5DFA6AFF35B53EFF2FA2
      397C000000000000000000000000000000000000000000000000000000000000
      000007750F6227A633FE58EC66FF83F08CFF8BF595FF58F467FF4BEE59FF2993
      31FF1CA8297C0000000000000000000000000000000000000000197F190A1474
      1B6520992BFE5EDB6AFF8CE494FFA4E6ABFF90D496FF81EB8BFF49E758FF3ED4
      4CFF298D32FF207B277C00000000000000000000000000000000298831EA3D9F
      46FF75D47FFF9BDFA2FFB6ECBCFF519F59F4227F29CA91D396FF75E17FFF38DA
      48FF33C841FF2A8F32FF208028770000000000000000000000002B8934EA5AA8
      61FFC8EACDFFC1E6C5FF55A15BF813791F2800000000298432D091D498FF64D5
      6FFF23C933FF27BA35FF2A8F33FF207E287D0000000000000000197F190A197B
      206568AB6FFF5BA262FA157B1E3A0000000000000000000000003A9943D090D2
      96FF52C75DFF0FB71FFF1CAC2AFF2A8F33FF207F297C227F2E16000000000000
      0000147C1F4A157B1E3A00000000000000000000000000000000000000004B9B
      52D292CC98FF41B44DFF00A00CFF159E20FF278E30FF24852BEE000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000063A267CF93C398FF3A9A42FF0E8511FF3B9442FF2B8034FA000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000070A876D584B689FF6DAB72FF34773AE422632892000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073AA76DF69A66DF21F6F1F1000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
  end
  object btCancelar: TBitBtn
    Left = 299
    Top = 351
    Width = 92
    Height = 25
    Caption = 'Cancelar'
    Enabled = False
    TabOrder = 4
    OnClick = btCancelarClick
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      20000000000000040000C40E0000C40E00000000000000000000000000000000
      0000000000004B4EADFF696EFFFF000000000000000000000000000000000000
      000000000000363CF7FF3E40B0FF000000000000000000000000000000000000
      00000000BFFF2928FFFF2828A6FF0001E8E10000000000000000000000000000
      00000104E4D71716A5FF1A17FFFF0000C9FF0000000000000000000000000E14
      C2FF0000D2FF0000DCFF0000F9FF1516A6FF0307E4DA00000000000000000204
      E0CE1817A6FF0000FCFF0000DEFF0B0ED9FF1819CCFF000000003528BB13908F
      FAFF0000CAFF0000B9FF0000D4FF0000F0FF1010A6FF080DB9AD090FB5A20F12
      A6FF0000F3FF0000D0FF0000BBFF0000CFFF5752ECFF0909931A000000000000
      7F040B0BBCFF0101CAFF0000B5FF0000C6FF0000D9FF3332CEFF3939CFFF0000
      DBFF0000C3FF0000B4FF0604D0FF0F13C0FF00007F0A00000000000000000000
      0000000000001A16C8FF0001C1FF00009CFF0000AFFF0000C4FF0000C7FF0000
      AEFF0000A2FF0503C6FF1716C4FF000000000000000000000000000000000000
      000000000000000000001918BAFF1311BBFF000088FF00008DFF000090FF0000
      86FF0F0EB4FF1F1CBAFF00000000000000000000000000000000000000000000
      00000000000000000000292579B81F1CC2FF000099FF000096FF000096FF0000
      96FF1715C2FF1B1874C300000000000000000000000000000000000000000000
      000000000000000015C90C0DC3FF0000B3FF00009BFF00009EFF00009EFF0000
      A1FF0000B5FF0302B6FF000015D5000000000000000000000000000000000000
      0000000000D41312DEFF0000F8FF0000C0FF0000C1FF2925F0FF1919EBFF0000
      C2FF0000C4FF0000F6FF0000D8FF000000E1000000000000000000000000170F
      04F63431D4FF0E0AFFFF0605EAFF100CEAFF2320FFFF736FEEFF5A56E6FF231F
      FFFF1511EAFF0A07EAFF0F0DFFFF1F1DE0FF0C0501FF0000000000000022C3AC
      F9FF9C8CFFFF4B40FFFF5D4BFCFF9180FFFF2D2FD6FF00000000000000003732
      D0FF8D7AFFFF5E4EF9FF5A4EFFFF8374FFFF6F58D2FF0000002A000000000000
      0038373399FFD8C9FFFFDFD1FFFF3F41D9FF0000000000000000000000000000
      00004946DCFFE0D0FFFFDDCEFFFF48439AFF0000003D00000000000000000000
      00000000052FE9E0FFFFB8B8FFFF000099050000000000000000000000000000
      000000000000A4A2FFFFBAB3FEFF000009350000000000000000000000000000
      000000000000110EA5670003C441000000000000000000000000000000000000
      0000000000000008DB3A0E0CA569000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
  end
  object dtpFecha: TInterDateTimePicker
    Left = 370
    Top = 0
    Width = 21
    Height = 20
    CalAlignment = dtaLeft
    Date = 40984.5241594444
    Time = 40984.5241594444
    DateFormat = dfShort
    DateMode = dmComboBox
    Enabled = False
    Kind = dtkDate
    ParseInput = False
    TabOrder = 5
    OnChange = dtpFechaChange
    Formato = dfDate
  end
  object edFecha: TEdit
    Left = 298
    Top = 0
    Width = 73
    Height = 21
    Enabled = False
    TabOrder = 6
  end
  object sagReservas: TStringAlignGrid
    Left = 268
    Top = 65
    Width = 124
    Height = 214
    ColCount = 2
    DefaultRowHeight = 20
    RowCount = 10
    TabOrder = 7
    ColWidths = (
      34
      83)
    RowHeights = (
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20)
    Cells = (
      1
      0
      'Reservas')
    PropCell = (
      1
      0
      1
      2
      0
      1
      2
      1
      0
      0)
    PropCol = (
      1
      1
      0
      0)
    PropRow = ()
    PropFixedCol = (
      0
      1
      2
      0
      1
      1
      0
      0)
    PropFixedRow = ()
  end
  object btAgrega: TBitBtn
    Left = 216
    Top = 96
    Width = 25
    Height = 25
    TabOrder = 8
    Visible = False
    OnClick = btAgregaClick
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      20000000000000040000C40E0000C40E00000000000000000000000000000000
      000000000000000000000000000041743A23397739D5318031D3338335D33A7B
      39D541743A230000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F6E392C338933FF11A719FF1EBA2BFF3896
      3CFF3F6E392C0000000000000000000000000000000000000000000000000000
      000000000000000000000000000042673C2A299E2AFF00C111FF08FC22FF37BA
      40FF3C673C2A0000000000000000000000000000000000000000000000000000
      000000000000000000000000000042673C2A2A9D2AFF00C711FF11F528FF3AB5
      41FF3C673C2A0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000416D41232A9A2AFF00BC10FF09EE21FF37B2
      3EFF41653A2300000000000000000000000000000000000000003C703C223F6E
      3F2C426D422A426D422A42673C2A4664434C309130FD00A80CFF00D416FF2DA6
      35FD3C5D394C3C67362A3C67362A3C67362A396E392C3C703C22387536D62882
      29FF15921CFF15991DFF149F1DFF169E1EFF0DA313FB008608FF00B711FF30BE
      3BFB4DA64EFF4FAD53FF51AE54FF52AF56FF489148FF3F793DD6317530D40B87
      10FF009503FF00B012FF00C813FF00CE13FF00C412FF0FA61EFF20A52EFF2EC9
      3BFF3DE34CFF4AE958FF50EB5FFF54EF64FF4CB152FF3F813FD4317A31D412A0
      1AFF00E415FF27FD3DFF52FF62FF60FF70FF44F956FF2FD73DFF2EB13BFF3CB0
      47FF44C751FF4ED15BFF56D363FF63D670FF55A55AFF437E43D43A7939D63595
      39FF3DBE45FF56BE5BFF69BB6DFF66B469FF5EE567FB4EF660FF3FD64EFF52B3
      59FB509753FF57A05BFF5CA25FFF62A565FF528D52FF417940D63C703C223F6E
      392C3C673C2A3667362A3667302A325A2B4C5EB561FD74FF80FF52E961FF4FA5
      50FD3961324C366D362A3667362A3667362A396E342C3C703C22000000000000
      00000000000000000000000000003A65322360BC64FF78FF86FF5FE86BFF55A7
      58FF3A6532230000000000000000000000000000000000000000000000000000
      00000000000000000000000000003667362A5DBA5EFF6DFC79FF67DE70FF5BA4
      5CFF3667362A0000000000000000000000000000000000000000000000000000
      00000000000000000000000000003667362A5CB65FFF72F67FFF7CDC85FF64A6
      65FF3667302A0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000396E392C4D904DFF61B565FF68AE6BFF528D
      52FF396E342C0000000000000000000000000000000000000000000000000000
      00000000000000000000000000003A743A2341783FD5478246D3498247D34378
      3FD53A743A230000000000000000000000000000000000000000}
  end
  object btElimina: TBitBtn
    Left = 216
    Top = 136
    Width = 25
    Height = 25
    TabOrder = 9
    Visible = False
    OnClick = btEliminaClick
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      20000000000000040000C40E0000C40E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000B0D6AE30F12
      70FC0F0F71FC0D0F74FC0D0F78FC0D107EFC0C0C78FC0A0A6DFC0D0D74FC1212
      75FC131473FC121272FC131371FC12126EFC12126EFC07085AE30D0E7AFF2225
      B0FF2F2ABDFF2725B8FF2624B6FF2624B1FF19147CFF110B5EFF241C90FF3C3A
      CCFF4047D8FF444ED1FF4656D0FF4B5FD0FF3F5ACBFF0C106FFF090868FF0A06
      A7FF140AC5FF180BC2FF1B0BB4FF1A099DFF150A7EFF120B72FF110B79FF120D
      A5FF1313CAFF161ED4FF1A29D5FF1E36DAFF1D36D8FF090B6EFF0B0C6FFF2331
      C0FF4153D8FF5160D9FF5466DEFF4F5EE5FF4951D7FF4142B8FF3B3D91FF3B3D
      80FF4140A2FF4243BDFF464AC8FF4850D1FF303DCEFF0A0B70FF121484FF2C3B
      A9FF4157BAFF455BBAFF3E50B6FF3748B8FF3540BAFF2C32ACFF282C93FF2A2F
      8BFF2B3190FF2D32A0FF2F34A6FF3036A9FF272FA3FF0B0D68FF0C0D74E11217
      77FA15197DFA15197CFA13177AFA111578FA11137CFA0F1177FA0E106DFA0E11
      6AFA0E116DFA0F1071FA101173FA101172FA101174FA0B0C68E1000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
  end
  object chbModificaPorcentajes: TCheckBox
    Left = 8
    Top = 392
    Width = 121
    Height = 17
    Caption = 'Modificar Porcentajes'
    TabOrder = 10
    Visible = False
    OnClick = chbModificaPorcentajesClick
  end
  object InterForma1: TInterForma
    IsMain = True
    msgSinRegistros = 'No existe un Registro para realizar la operaci�n.'
    msgModificarRegistro = 'Imposible Modificar el Registro Actual.'
    msgEliminarRegistro = 'Imposible Eliminar el Registro Actual.'
    msgCrearRegistro = 'Imposible Crear el Registro Actual.'
    msgAceptarRegistro = 'Imposible Aceptar los cambios del Registro Actual.'
    msgCancelarRegistro = 'Imposible Cancelar los cambios del Registro Actual.'
    msgPreguntaEliminar = '�Desea Eliminar el Registro Actual?'
    FormaEstilo = feHorizontal
    CanEdit = False
    IsNewData = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowBtnBuscar = False
    ShowBtnAyuda = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 235
    Top = 96
  end
  object qCapital_Basico: TQuery
    SQL.Strings = (
      'Select *'
      
        '  From Table (PkgCRGPViews.VW_CR_GP_Capital_Basico (Sysdate, '#39#39')' +
        ')')
    Left = 243
    Top = 160
  end
  object spUpdCapBas: TStoredProc
    Left = 235
    Top = 128
  end
  object qReservas: TQuery
    SQL.Strings = (
      'Select *'
      '  From Table (PkgCRGPViews.VW_CR_GP_Reserva (Sysdate, '#39#39'))')
    Left = 235
    Top = 48
  end
  object spLimpiaTabla: TStoredProc
    Left = 240
    Top = 199
  end
  object spAgregaCapBas: TStoredProc
    Left = 248
    Top = 239
  end
  object spUpdPctCapital: TStoredProc
    Left = 248
    Top = 271
  end
end