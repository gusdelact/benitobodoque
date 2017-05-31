object TrasCheq: TTrasCheq
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = qyTrasCheq
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  Functions.Strings = (
    'PAGENUMBER'
    'COLUMNNUMBER'
    'REPORTTITLE')
  Functions.DATA = (
    '0'
    '0'
    #39#39)
  Options = [FirstPageHeader, LastPageFooter]
  Page.Columns = 1
  Page.Orientation = poPortrait
  Page.PaperSize = Letter
  Page.Values = (
    100
    2794
    100
    2159
    100
    100
    0)
  PrinterSettings.Copies = 1
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.OutputBin = Auto
  PrintIfEmpty = True
  SnapToGrid = True
  Units = MM
  Zoom = 100
  object QRBNombre: TQRBand
    Left = 38
    Top = 1015
    Width = 740
    Height = 0
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      0
      1957.91666666667)
    BandType = rbGroupFooter
    object QRExpr61: TQRExpr
      Left = 320
      Top = 2
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        846.666666666667
        5.29166666666667
        156.104166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyPrVeA.IMP_CREDITO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr62: TQRExpr
      Left = 381
      Top = 2
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1008.0625
        5.29166666666667
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyPrVeA.IMP_CAPITAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr63: TQRExpr
      Left = 436
      Top = 2
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1153.58333333333
        5.29166666666667
        156.104166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyPrVeA.IMP_CAPITAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr64: TQRExpr
      Left = 496
      Top = 2
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1312.33333333333
        5.29166666666667
        156.104166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyPrVeA.IMP_FA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr65: TQRExpr
      Left = 556
      Top = 2
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1471.08333333333
        5.29166666666667
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyPrVeA.IMP_INTERES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr66: TQRExpr
      Left = 610
      Top = 2
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1613.95833333333
        5.29166666666667
        127)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyPrVeA.IMP_COMISIONES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr67: TQRExpr
      Left = 659
      Top = 2
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1743.60416666667
        5.29166666666667
        111.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyPrVeA.IMP_IVA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr68: TQRExpr
      Left = 702
      Top = 2
      Width = 49
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1857.375
        5.29166666666667
        129.645833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyPrVeA.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr69: TQRExpr
      Left = 752
      Top = 2
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1989.66666666667
        5.29166666666667
        156.104166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyPrVeA.IMP_FEGA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr70: TQRExpr
      Left = 812
      Top = 2
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2148.41666666667
        5.29166666666667
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyPrVeA.IMP_BINTER)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr71: TQRExpr
      Left = 873
      Top = 2
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2309.8125
        5.29166666666667
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 
        'SUM(qyPrVeA.IMP_CAPITAL + qyPrVeA.IMP_FA + qyPrVeA.IMP_INTERES +' +
        ' qyPrVeA.IMP_COMISIONES + qyPrVeA.IMP_IVA + qyConsImpa.MORATORIO' +
        'S)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRDBText2: TQRDBText
      Left = 2
      Top = 2
      Width = 151
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        5.29166666666667
        5.29166666666667
        399.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'NOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText9: TQRDBText
      Left = 160
      Top = 2
      Width = 153
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        423.333333333333
        5.29166666666667
        404.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'NOM_PROVEEDOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 5
    end
  end
  object QRBand2: TQRBand
    Left = 38
    Top = 38
    Width = 740
    Height = 977
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      2584.97916666667
      1957.91666666667)
    BandType = rbDetail
    object QRShape1: TQRShape
      Left = 8
      Top = 362
      Width = 343
      Height = 140
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        370.416666666667
        21.1666666666667
        957.791666666667
        907.520833333333)
      Shape = qrsRectangle
    end
    object QRLabel29: TQRLabel
      Left = 8
      Top = 119
      Width = 31
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        21.1666666666667
        314.854166666667
        82.0208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'PARA:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText12: TQRDBText
      Left = 50
      Top = 118
      Width = 405
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        132.291666666667
        312.208333333333
        1071.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyTrasCheq
      DataField = 'NOM_TESOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel1: TQRLabel
      Left = 8
      Top = 83
      Width = 303
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        66.1458333333333
        21.1666666666667
        219.604166666667
        801.6875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'INSTRUCCIÓN PARA TRASPASO ENTRE CHEQUERAS'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Californian FB'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 9
    end
    object QRImageABONO: TQRImage
      Left = 1
      Top = 3
      Width = 238
      Height = 44
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        116.416666666667
        2.64583333333333
        7.9375
        629.708333333333)
      Center = True
      Picture.Data = {
        0A544A504547496D61676586170000FFD8FFE000104A46494600010101006000
        600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
        0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
        3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
        3232323232323232323232323232323232323232323232323232323232323232
        32323232323232323232323232FFC0001108004F017C03012200021101031101
        FFC4001F0000010501010101010100000000000000000102030405060708090A
        0BFFC400B5100002010303020403050504040000017D01020300041105122131
        410613516107227114328191A1082342B1C11552D1F02433627282090A161718
        191A25262728292A3435363738393A434445464748494A535455565758595A63
        6465666768696A737475767778797A838485868788898A92939495969798999A
        A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
        D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
        01010101010101010000000000000102030405060708090A0BFFC400B5110002
        0102040403040705040400010277000102031104052131061241510761711322
        328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
        292A35363738393A434445464748494A535455565758595A636465666768696A
        737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
        A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
        E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7D7
        60A858F41C9ACAFF0084934A048FB5A9C7B1FF000AD1BAFF008F593FDD35C7F8
        592D5A3BA37222CABF1BB0302B831588A94EAC29C2DADF73AA85184A9CA72BE9
        6D8EAAD750B5BDE6DE74931D403C8AB79AE374A8124F14C93D8295B445DACC07
        CAC6BA4BED445904020966924242220E4FF85561B12E74DCAA69676F5157A0A3
        51461D517B3466B04789163BB8E0BBB29ED8C87E567C11FA55DD57554D2ED567
        78DA40CD8C29AD562A938B95F45B90F0F52EA36D5EC68E68CD609F12A3DBACB0
        58DCCCB8CB141F77D8D5DD2B58835680C9082A54E195BA8A54F174AA4F922F56
        12C3D48A7292D11A3466B2351D7EDAC2510EC79676FF009669D69D65AB4B7372
        2192C2780152C19C8C1FCA9FD6A973F25F513A1351E66B43573466B26FB5E86D
        2E96D238A49EE5BFE59C7D6A387C411FDB16DAEEDE5B567FB9E67434BEB7453B
        730D61EA357B1B745206CD2D7498851451400514514005145140051451400514
        5140051451400514514005145140051451400514514005145140051451400514
        51400514526680168A33499A005A29ACE1464F03AD62C9E2CD2E39190C8C4A9C
        6429C56552BD3A7F1C9234A74A753E0573728AC6B7F1469B7132C4B232B31C0D
        CB815AFB8514AB53ABAD377154A73A6ED3561973FF001ED27FBA6B89F0DE9767
        A88BA3751F98CAF80338C0AEE2652F0BA0382C08AE62D7C3DA8D8EFF00B36A21
        039C9FDD835C18DA3295784F97992B9D786A8A34A71E6B376B14A432683AF436
        F6D2B3DBB9FF00544F4CF6AD8D5359921BB8AC6CA20F752F3C9E145258F87445
        7DF6DBD9CDCDC0E84AE00A4D5B439EE3508AFECA611CEA3182383584696229D2
        928689BD17646AEA51A9523CDAD96FD1B317C450DF426CDEF6ED2572FF002844
        DB83FD6B47C53F36856E39CEE5FC78A7DFF86EEF5058A4B8BDDD3A939F97E503
        D00ABFAB690FA869D15B2C814A107246738150B0D55AAAD47E24AD7DCA55E9AF
        6577B3771FA3AA8D12DF6A8C18F3C0EB585E13C8D46F80FCBF1AE9AC6D1AD2C2
        2B7243145C640C56768FA249A5DD5C4CD2AB897A00B8C735D32C3CDCE869F0EF
        F71846AC396AAEFB7DE64680125F135EBDC0FDFE495079EFCD75E475E809AC3D
        47C3D24B7BF6FB0B8682E7E9C1AB16169AB2DC092F2F50A6306345EBF8D1848D
        5A17A5285F57AFA862650AB69C656D36317C3FF3F8975079399017383DBE6FF0
        AB3E3354165049FF002D1641B4D5CBDD0E5FED0FB7E9F30867FE2047CAFF005A
        8CE8777A8DE473EA9346522FBB0C638CFD6B0742A2A12A1CB76DEFD0D956A6EA
        C6B735925B75F435F4F676B180C9F7F60CD5BA6AA6DC0030053ABDA847952479
        92776D8514515420A28A2800A28A2800A28A2800A28A2800A28A4CD002D14668
        A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A000D26714A6A391
        B6A16EC064D26EC9B029CFAC58C12B452DC223AF504F4A67F6EE978FF8FC8B3F
        5AF3BBE9CDD6A13CEC7259CFE438152E976C2F353B780A960CC370CF6EF5F35F
        DB556557D9D34B5763DCFECA84697B494B5B1D37886EB529E3786D6DE416E065
        E41D5BDBAD71A323F0ED5E9BA94DF64D2E7909036C640FAE2BCC81279C75E7F3
        AE7CEA9F2D64DBBB6746553E684925644B6B1B5C5DC30A82599C0C0AF52863F2
        A144249DA31935C1F852D7CFD651C8F96242F9F7E9FD6BD076D7A190D1B51751
        F538738AB7AAA11E836E25582DE499F3B514B1C7A0AC4FF84B74B232647C7FBB
        5BAEBB9483D0D71BE3182389ADD923552C483B475AEECC2B55A14FDA537A2393
        074A9D5A9ECE69EA6ED8F882C6FEE85BC2CC5C8C8C8AD6C566E8D6F147A5DABA
        C6818C6B960393C54E754B20C41BA8411C11BC641ADA8546A9A9566AE6756317
        36A9A762DE39A31CE7350477B6F241E72CA862FEF678AAFF00DB7A779813ED51
        E4FBD6B2AF4E36BC96A66A9CDEC8BE7A555BCBE82C21F36E1C22E703353F9C8D
        1EE56054F3BB3C572FE2BBBB79F4F558A78DC87E42B035962EBFB2A529C5EA91
        A61E8FB5A8A0D1D1D9DDC57D6EB345CA374CD58C5606817F690E910A4B750AB0
        1C86700D6E473472A078DD5D4F42A720D561EAAAB4E326F5689AD4DD39B56D10
        F2334639AAF35FDAC04896E2343E85B1490EA16939C45711B9F40C2B4F694EF6
        BAB93C92B5EC5AA2A39678E08CC92BAA20EACC702A0FED4B12EA82EE12CC7000
        70734DD48AD1B128C9EC8B74553B9D4ED2CFFD7CE887D09E6A5FB5C22113348A
        B190086638147B485DABEC1C92B5EC4F45526D5AC13ADE41FF007D8A920BFB6B
        938866473E81A92AD4DBE552571BA734AED32CD1485A9924F1C2BBA575451D4B
        1C0156DA4AEC84AFB1251541B5AD395F69BC873ECC2AC437515C26F8A4575E99
        520D446B5393B45A65CA128ABB44F45452DC4502EE9A458D7D5881550EB7A707
        09F6B8B27D18512AB08BB49A411A7397C28BEC703D6B2A6D7AC60BF166EE7793
        8C8E80FA55D37D6DE4894CF188DB80C58004D73D3E95A4DD6AEB71F6E8CB3BE4
        C6AC0EE35CD8AAD3492A4D5EFD5F436A14E2DBF697B1D3A9CE31C8F5A7D46BF2
        80318C5473DEDBDB0FDF4C89FEF3015D7CCA2BDED0E78A72768EA58A2AA41A9D
        9DC3058AE62663FC21C66A792648A3323B054032589C0149548C95D31B8C93B3
        44945526D5AC1064DDC18F6706A69AEE0823DF2C8A8BEA4D2F6B4ECDF32D0392
        5A69B93D15422D674F9DB6C775196F4DD57776467B5385484FE177094251D24A
        C3A8A8DA64452CEC1547524E2AB1D5EC036DFB5C39FF007C512AB08BB498284A
        5B22ED151A4A92207460CA7A114925C4712EE91822FAB1C0AAE656BDF4159DED
        D4968ACF6D6F4E56C7DB22CF4FBC2AD437314EBBA291641EAA41C5446AD39BB4
        5A6370947744D597AF5DFD97489DC1C315DA3F1E2B4CF2315C978CEE8086DEDC
        7F11DEC3BF15CF8FADEC70F291BE1297B5AF189C77400FB5749E0EB5F335196E
        08FF0054B807B64D739F5FC7E95DDF846D8C3A519483BE56DC7FA57CAE5347DA
        62937D353E8732A9C9876975D0678C6E7CBD3120046657191EC39FE78AE20F3C
        56F78BEE7CED596118C4498E3D4D601C9381D68CD2AFB5C534BA683CBA9FB3C3
        A6FAEA76BE0CB6D9672DC904191B03E83FFD66BA9ACFD1ADC5A6976F101D1727
        EA79AD0AFABC0D254B0F08AEC7CDE26A3A95652607A571FE35FBB6BF535D79E9
        5C878D7A5AFD4D619B7FBACBE5F99BE5DFEF31F99D0E93FF00207B5FFAE6BFCA
        B9FF0014693636F6325DA438999C648271CFB5743A4FFC822D7FEB92FF002ACD
        F177FC81BFEDA2D4E2611960AF257B44586938E2959EECE7B44D3AEB578C5BB4
        AC96311E76F1B8D6C6A3E15B08F4F99A05292229604F3D2AC78480FEC65C000E
        E24FBD6B6A1FF20DB9FF00AE4DFCAB0C2E0A93C2F34B56D75E9E86D88C5558E2
        1C62EC9339CF07CCF3DB5CDB48CC5063009E991DAAAF88B44B3D3ACC4D6EAC1D
        9F072C4D4DE0AFBF75C7A55CF1963FB363F5DF5CEA10A996F34D5DF43772953C
        7F2C744DA2BE8FE1FB1BDD2A29E5572EC39C39157359BB5D0348486D7866F953
        273567C39CE8700F4FF1AC3F1A9224B5049D9827F1ADEA4634303ED69AB49A5A
        99439AB633D9CF55764BA478761BBB75BCD46433CB273C9E9ED51EB9A1A69D10
        BEB0631B467E60A6AE5AF866296DA171A85E0DEA1B0B27038A95FC25048855EF
        EF194F505C73FA54AC24E5479634D5FBDF51FD622AA733A9A76B742CE9D3C7AE
        688BF684DCAE36B8F715C8EB56B1693ACA8B44C040180CE79AEDF4CD2A2D2ADC
        C30C8EEA58B7CF8E2B93F128CF88D011D9296634A4B0B0753E24D26C7819AFAC
        C943E177D0BF67E1937F1FDAB529A469A439DBD80AB5E22B295B4682DAD6376D
        ACAB81D715BEA3E45CFA76AA3AAEAD06956FE6CBCB1385507926BB5E128D3A0D
        3D2FBBEA7247115675636D6DB22943E19D305BA0780976519C9E735CFEBBA6A6
        89736F359394DF9207718F7EFD6B512FB5FD5144B6F0C70479E377248AC7F10C
        3A8C260FB7DC24A5812A17B57998C745D0BD2A76B5B5B1DF85F6AAB2552A5EF7
        BABDCEE239C7F67ADC49D3CB0EDF966B90896E7C4FAAC81A564B58CF4070315B
        F7FB878524D84E7C8EDF4ACEF059536B724633BC7D7A575D77EDAAD2A12F85AB
        BF339A8DA952A95A3BA762DCBE14D385BB0447DE070771E4D41E1D5974CD1AEE
        4BA8DA30AC582B0C6462BA5E73D33CD6378A1986892ED27EF0CFD335BD5C353C
        3A788A6ADCA9E88CA9D79D57EC66EE9B460D8DBDC78A2FA5B8B995D2DD31845E
        07B0AD4BDF0AD8AD94A608DFCD5195F989C9A778371FD94FD3FD69FE42BA3205
        6384C153AD414AA2BCA5D4D31389A94EB7243451E8733A3E8E975A1476F7F032
        E1CB052706B08D9C569E2A8E084111ACAB8C9AF4223906B84BCFF91CD7FEBB27
        F3ACB1F86A74A149456B746B82AF3A92A977A59BB1D46B7A9FF6669E651832B1
        0A80FAFF00F5AB9DD1F44935A26FB5195D9589C2FAFF0080F6A9BC6DBC8B6CFF
        00ABE4FE38AE8F4A09FD996DE5E36F96318E95A38AC5E2DC2A7C31E866A4F0F8
        55286F2EA616A5E138921F334E2F1CAA3382C4E7F1A3C3DAA7F694326997C373
        AA9193FC4338C1F7AEA0F3F874AE134C1FF1581099C79AFD3E9FE353898470D5
        E12A7A2968D742A8D496228CE353571D53EA37C4FA5DAE9B3C1F665DA240CC46
        73C8C62AFE97A2CBAC22DD6A6EED19FF0057183818F5A678D8033598C7F0B7F4
        AEB2DFE5B68B000010703E95143094E78CA89ECADA742AAE2671C2D37D5DF539
        1F11E836D6168B7369B930D861B89CE6B7FC3F3BCFA15BCB2B6480431FA1AADE
        2D1FF1246FF7D7F98A7F8738F0D459E987FE66B5A505471F28D356BC6F6F999D
        594AAE0E2E7ABE6B1852CB3F88B5B36A2631DAA67201EA077ADA6F0B69260F2F
        CB01B1F7B3CE6B99F0EE9E9A8DE3C6F3C90B042D98CE09E4574A7C2D11FF0098
        8DEFFDF63FC2B9B0719D783A8E1CCDB7AB67462651A5354D4F96DD9197A2DC4F
        A5EB8FA64B296858E1493D38ED516B33C9A8F8852CE490A5BABECC6EC03EE6B6
        13C256D1DCA5C1BBB97911C302C4738FC28D67C3ABA8CC2781FCA9C753FDEC74
        AB961313EC1C2DD6F6BF4EC42C4D0F6CA77DD5AF6EBDC99BC37A6F90516DD738
        E1BBD2786F4FB8D36DE586750B990B2E0F518AC891FC43A3440B113C2A7AF535
        B9A16B49ABC4E76EC9633F30FEA2BA70F3A12AF15CAE3357D3B98D6856549B72
        E68BEBD8D73C0AF3AF135D7DA75A9718DB18080D7A29E95C76A1E12B896F249A
        DA48F63B6EC30E4519BD1AD568A8D257EE196D4A54EAB954763943CA915D7E87
        E2066860B05B3779506DCA9E31EA6A8FFC21FA87FCF4887E35D4E93A343A5C01
        506643F798D7999660F150ABCDF0AEA776618AC354A76DDF431EEFC292DDDE4B
        70F7383236718CE2A387C1C52E2377B8CAAB06202F5C1CD75DB79A315ED7F666
        1B9F9DC753CCFAFE214796FA08ABB703D29F498A5AEF4ACAC8E3192C890C4D23
        B05551924F6AE17C4FAAD9EA0615B6943F97924D776E824428C01046083DEAA8
        D32CFF00E7D61FFBE0715C58EC3D4C443D9C5A499D584AD0A33F6925768CED0B
        57B2B8B4B7B44981996300AFD0566F89F57B3B8B36B48A5DF2AC837003A11DAB
        A64B1B689C3C7046AE3F8828069A74DB4624B5B444B1C9250726B3A987C44F0F
        ECB995FD0A856A51ADED2CCE73C33ABD941651DA4B2ED9777008E0E6BA2D439D
        36E7FEB937F2A51A659AB065B58430390420E2A768F72953820F5CF7AD70F42A
        53A3ECA6EF6D8CEBD584EAFB482B5F7381F0DEAF6DA5C937DA1880F8C1C56FF8
        950DFE86B3DBFCC8087E3B83C56BFF00665A67FE3DA2FF00BE454E21558C2055
        DA0602E38C573D1C0D48D09509BBA77B1BD5C5C2555568AD56E723A27896D2CF
        4D482E0386427040E0F357B5A8135DD192EAD32C50EE4E3A8EE2B55B44D3DA5F
        30DAC65F392715712258D02228551D0018A74B0755D2746BB4E36B682A989A7E
        D3DAD24D4AF738DD17C4AB610ADA5F2380990AD8E47B62B4DFC61A6853B7CC66
        0381B7AD6BCFA6DADC64CB046C4F7C73445A5D9C03F776D18FF80D14B0F8CA71
        5053565E413AD869BE7E577F5238F5384E9A97D36628CA82DBBB66B88D6B51B7
        BCD6D2E217DD18DBCFD2BD09E0492231C88AC87F848E2A1FECCB3C63ECB0FD36
        0AAC6E16B6222A0A497C8585C453A32736990D86AB67A82116F3062A30C3B8AE
        6FC650CA2EADEE3696880C1F40735D6C3670404B450C684F5DAB8CD3E481265D
        B222B2FA115A6230D3AF41D29BD7B99D1AF1A35BDA416873F078AB4D4B38C124
        38500A01DEB9CD765BABE905FCD1345031DB12B75C57731E8D6113EF5B68F39C
        F4AB125AC5280B2468EA3A0619AE6AB81C462297B3AB25F2FD4E8A58BA546A73
        D38BF998DA6EA961A9DA0B1590F99E5ED2A783D2B9CB69EEBC35AA387899A263
        83C7DF1DB1EF5DD47636F136F8E18D5FD42E0D3A5B58A718962471FED2E6AE78
        2AB52316E494E3B344431508392B5E32E8618F17E9BB4313229EE0A1AB305CC7
        E21D2A7C42C88F945DDDFD0D5B1A4D946DBD6D62DDFEE8AB2B12A2ED40157B00
        315B53A55E5A57926BC96E6552A514AF4934FD4E0B4EBFBAF0E5F4904F0B18CF
        55FEA0D743FF00098698232DBA4CE3EEEDAD996D60B8C79B146FFEF2E6A25D2E
        CA36DC96B103EEB9AC2961313875C94E6B97CD6C6F531142B3E6A917CDEA5687
        5DB66D392F27CC08C70037535C75C6A1049E2317AACDE4F98A49C738AF4092D2
        0951524863651D1594102A35D32C979FB2C3FF007C0A31583AF5D41732D35DBA
        9387C4D2A4E5EEBD74DCCAD416D7C49A530B4955E48CE54FA1F43F8564E8FAEB
        E903EC3A844EAA870A40E7FF00D55D7C36D15B82228D2304E4ED18CD36E2C2D6
        EC113C28FF0051553C1D49495684AD3EBD98A9E269A8BA538B71FC51CFEA5E2C
        80DB98AC43492BF038C629BE1DD34E9F0C9A9DF9D8ECBFC5D87AD6EC1A4D8DB1
        CC56D1A9FA55A7895D4ABAA952318238A2384AB3A9ED6B4AED6CADA2096269C6
        9FB3A4AC9EEFB9C1789B53B6D467B736F20658C104FE5FE15D6697ACD95F2245
        0CCA650A32B9E7A5591A5D9E3FE3DA2F6F9453E1B2B781F7470C6ADEA1403450
        C2D7A75E556525EF6E156BD29D28D349FBA64F8BBFE408DFEF0FE62A8F87B5AB
        38B4F82C257225E472383924D7532C11CF1EC9515D7D1864542BA75A23064B68
        430E8760E2AAA616AFD67DB53924AD62618882A1ECA4BADCE2EEA2B9F0EEB86E
        638D8DBB3120F6C1ED5BB1F8BB4D64CB9914F71B7A56EBC292A14911594F6619
        1550E8BA79937FD922DDFEED650C1D7A0DFD5E4ACFA33496269558AF6D1775D5
        152C7C456DA8DF0B7B749186DCEF238154EFB5A6D3BC4A229E522D4C43231D0F
        35D0C76F0C5FEAA354FF007462A1B9D36D6EF06782391B18C91CD744E8E2254D
        7BCB993BFF00C031854A2A6FDDD2D6FF008262EA3E28B116B2C701F3A5618550
        38E69BE12D327B48A5B99D7619800AA7A802B663D22C60C7976B10C7B55D518E
        9D2A29E12A4AB2AD5DEAB6B153C442349D2A4AC9EF70C734B8A28CD7A2720628
        0314519A56402D1499A5CD300A28CD19A2E07FFFD9}
      Stretch = True
    end
    object QRLabel3: TQRLabel
      Left = 8
      Top = 167
      Width = 19
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        21.1666666666667
        441.854166666667
        50.2708333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'DE:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel4: TQRLabel
      Left = 50
      Top = 136
      Width = 43
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        132.291666666667
        359.833333333333
        113.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tesorería'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel5: TQRLabel
      Left = 50
      Top = 183
      Width = 83
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        132.291666666667
        484.1875
        219.604166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Operación bancaria'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText1: TQRDBText
      Left = 50
      Top = 167
      Width = 404
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        132.291666666667
        441.854166666667
        1068.91666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyTrasCheq
      DataField = 'NOM_OPERA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel6: TQRLabel
      Left = 8
      Top = 260
      Width = 51
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        21.1666666666667
        687.916666666667
        134.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'ASUNTO:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel7: TQRLabel
      Left = 70
      Top = 259
      Width = 170
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        185.208333333333
        685.270833333333
        449.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'PAGO PREMIO POR CUMPLIMIENTO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel8: TQRLabel
      Left = 8
      Top = 329
      Width = 384
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        21.1666666666667
        870.479166666667
        1016)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'POR ESTE CONDUCTO TE SOLICITO REALIZAR EL SIGUIENTE TRASPASO:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape3: TQRShape
      Left = 8
      Top = 362
      Width = 343
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        21.1666666666667
        957.791666666667
        907.520833333333)
      Brush.Color = clScrollBar
      Shape = qrsRectangle
    end
    object QRLabel2: TQRLabel
      Left = 156
      Top = 364
      Width = 50
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        412.75
        963.083333333333
        132.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CARGOS'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape5: TQRShape
      Left = 8
      Top = 379
      Width = 343
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        21.1666666666667
        1002.77083333333
        907.520833333333)
      Shape = qrsRectangle
    end
    object QRShape7: TQRShape
      Left = 80
      Top = 379
      Width = 1
      Height = 123
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        325.4375
        211.666666666667
        1002.77083333333
        2.64583333333333)
      Shape = qrsVertLine
    end
    object QRShape8: TQRShape
      Left = 177
      Top = 379
      Width = 1
      Height = 123
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        325.4375
        468.3125
        1002.77083333333
        2.64583333333333)
      Shape = qrsVertLine
    end
    object QRShape2: TQRShape
      Left = 368
      Top = 362
      Width = 343
      Height = 140
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        370.416666666667
        973.666666666667
        957.791666666667
        907.520833333333)
      Shape = qrsRectangle
    end
    object QRShape4: TQRShape
      Left = 368
      Top = 362
      Width = 343
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        973.666666666667
        957.791666666667
        907.520833333333)
      Brush.Color = clScrollBar
      Shape = qrsRectangle
    end
    object QRShape6: TQRShape
      Left = 368
      Top = 379
      Width = 343
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        973.666666666667
        1002.77083333333
        907.520833333333)
      Shape = qrsRectangle
    end
    object QRShape9: TQRShape
      Left = 441
      Top = 379
      Width = 1
      Height = 123
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        325.4375
        1166.8125
        1002.77083333333
        2.64583333333333)
      Shape = qrsVertLine
    end
    object QRShape10: TQRShape
      Left = 538
      Top = 379
      Width = 1
      Height = 123
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        325.4375
        1423.45833333333
        1002.77083333333
        2.64583333333333)
      Shape = qrsVertLine
    end
    object QRLabel9: TQRLabel
      Left = 516
      Top = 364
      Width = 50
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1365.25
        963.083333333333
        132.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'ABONOS'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel10: TQRLabel
      Left = 8
      Top = 515
      Width = 51
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        21.1666666666667
        1362.60416666667
        134.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTALES'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape11: TQRShape
      Left = 80
      Top = 514
      Width = 98
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        211.666666666667
        1359.95833333333
        259.291666666667)
      Shape = qrsRectangle
    end
    object QRLabel11: TQRLabel
      Left = 368
      Top = 515
      Width = 51
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        973.666666666667
        1362.60416666667
        134.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTALES'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape12: TQRShape
      Left = 441
      Top = 514
      Width = 98
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        1166.8125
        1359.95833333333
        259.291666666667)
      Shape = qrsRectangle
    end
    object QRLabel12: TQRLabel
      Left = 8
      Top = 579
      Width = 49
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        21.1666666666667
        1531.9375
        129.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'MOTIVO:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape13: TQRShape
      Left = 8
      Top = 602
      Width = 703
      Height = 54
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        142.875
        21.1666666666667
        1592.79166666667
        1860.02083333333)
      Shape = qrsRectangle
    end
    object QRLabel13: TQRLabel
      Left = 17
      Top = 629
      Width = 237
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        44.9791666666667
        1664.22916666667
        627.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'PREMIO POR CUMPLIMIENTO DEL CREDITO: '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel14: TQRLabel
      Left = 8
      Top = 706
      Width = 107
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        21.1666666666667
        1867.95833333333
        283.104166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'A T E N T A M E N T E '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel15: TQRLabel
      Left = 295
      Top = 706
      Width = 27
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        780.520833333333
        1867.95833333333
        71.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Vo.Bo.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel17: TQRLabel
      Left = 27
      Top = 380
      Width = 35
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        71.4375
        1005.41666666667
        92.6041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cuenta'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel18: TQRLabel
      Left = 110
      Top = 380
      Width = 43
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        291.041666666667
        1005.41666666667
        113.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Importe'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel19: TQRLabel
      Left = 244
      Top = 380
      Width = 38
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        645.583333333333
        1005.41666666667
        100.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cliente'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel20: TQRLabel
      Left = 387
      Top = 380
      Width = 35
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1023.9375
        1005.41666666667
        92.6041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cuenta'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel21: TQRLabel
      Left = 469
      Top = 380
      Width = 43
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1240.89583333333
        1005.41666666667
        113.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Importe'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel22: TQRLabel
      Left = 604
      Top = 380
      Width = 38
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1598.08333333333
        1005.41666666667
        100.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cliente'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText3: TQRDBText
      Left = 11
      Top = 401
      Width = 68
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        29.1041666666667
        1060.97916666667
        179.916666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyTrasCheq
      DataField = 'CUENTA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText4: TQRDBText
      Left = 83
      Top = 401
      Width = 92
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        219.604166666667
        1060.97916666667
        243.416666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyTrasCheq
      DataField = 'IMP_NETO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText5: TQRDBText
      Left = 182
      Top = 401
      Width = 164
      Height = 77
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        203.729166666667
        481.541666666667
        1060.97916666667
        433.916666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyTrasCheq
      DataField = 'NOMB_CTA_BCO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText6: TQRDBText
      Left = 371
      Top = 401
      Width = 69
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        981.604166666667
        1060.97916666667
        182.5625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyTrasCheq
      DataField = 'ID_CONTRATO_DV'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText7: TQRDBText
      Left = 443
      Top = 401
      Width = 92
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1172.10416666667
        1060.97916666667
        243.416666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyTrasCheq
      DataField = 'IMP_NETO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText8: TQRDBText
      Left = 543
      Top = 400
      Width = 165
      Height = 78
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        206.375
        1436.6875
        1058.33333333333
        436.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyTrasCheq
      DataField = 'NOMBRE_CLIENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText10: TQRDBText
      Left = 82
      Top = 515
      Width = 93
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        216.958333333333
        1362.60416666667
        246.0625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyTrasCheq
      DataField = 'IMP_NETO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText11: TQRDBText
      Left = 443
      Top = 515
      Width = 94
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        1172.10416666667
        1362.60416666667
        248.708333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyTrasCheq
      DataField = 'IMP_NETO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText13: TQRDBText
      Left = 17
      Top = 609
      Width = 616
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        44.9791666666667
        1611.3125
        1629.83333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyTrasCheq
      DataField = 'NOMBRE_CLIENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText14: TQRDBText
      Left = 257
      Top = 628
      Width = 77
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        679.979166666667
        1661.58333333333
        203.729166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyTrasCheq
      DataField = 'ID_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel16: TQRLabel
      Left = 241
      Top = 784
      Width = 35
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        637.645833333333
        2074.33333333333
        92.6041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Importe'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel23: TQRLabel
      Left = 241
      Top = 802
      Width = 18
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        637.645833333333
        2121.95833333333
        47.625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'IVA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel24: TQRLabel
      Left = 241
      Top = 825
      Width = 35
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        637.645833333333
        2182.8125
        92.6041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText15: TQRDBText
      Left = 292
      Top = 784
      Width = 94
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        772.583333333333
        2074.33333333333
        248.708333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyTrasCheq
      DataField = 'IMP_BRUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText16: TQRDBText
      Left = 292
      Top = 802
      Width = 94
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        772.583333333333
        2121.95833333333
        248.708333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyTrasCheq
      DataField = 'IMP_IVA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText17: TQRDBText
      Left = 292
      Top = 825
      Width = 94
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        772.583333333333
        2182.8125
        248.708333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyTrasCheq
      DataField = 'IMP_NETO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel25: TQRLabel
      Left = 8
      Top = 214
      Width = 42
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        21.1666666666667
        566.208333333333
        111.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'FECHA: '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape14: TQRShape
      Left = 292
      Top = 824
      Width = 94
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        772.583333333333
        2180.16666666667
        248.708333333333)
      Shape = qrsHorLine
    end
    object QRDBText18: TQRDBText
      Left = 58
      Top = 214
      Width = 71
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        153.458333333333
        566.208333333333
        187.854166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyTrasCheq
      DataField = 'F_AUTORIZA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Californian FB'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
  end
  object qyTrasCheq: TQuery
    DatabaseName = 'BCORP'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT pppd.id_credito, pppd.id_grupo_transac, '
      
        '       (SELECT cve_moneda FROM contrato WHERE id_contrato = pppd' +
        '.id_contrato_dv) AS moneda, '
      '       (CASE '
      '           WHEN (SELECT cve_moneda '
      '                   FROM contrato '
      
        '                  WHERE id_contrato = pppd.id_contrato_dv) = 484' +
        ' '
      '              THEN (SELECT id_cto_binter '
      '                      FROM cr_ppo_param) '
      '           ELSE (SELECT id_cto_usdd '
      '                   FROM cr_ppo_param) '
      '        END) AS cuenta, '
      '       CAST(pkgcrconsolidado.fun_nom_tit_cred('
      #9#9'           (SELECT id_titular '
      '                      FROM contrato '
      '                     WHERE id_contrato = '
      '                              CASE '
      '                                 WHEN (SELECT cve_moneda '
      '                                         FROM contrato '
      '                                        WHERE id_contrato = '
      
        '                                                    pppd.id_cont' +
        'rato_dv) = 484 '
      '                                    THEN (SELECT id_cto_binter '
      '                                            FROM cr_ppo_param) '
      '                                 ELSE (SELECT id_cto_usdd '
      '                                         FROM cr_ppo_param) '
      
        '                              END)) AS VARCHAR2(80)) AS NOMB_CTA' +
        '_BCO,'#9#9
      
        '       pppd.cve_ppo_mov, movp.desc_ppo_mov, pppd.imp_bruto, pppd' +
        '.imp_iva, '
      '       imp_neto, pppd.f_autoriza, pppd.id_contrato_dv,'
      
        '       CAST(pkgcrconsolidado.fun_nom_tit_cred((SELECT id_titular' +
        '  FROM contrato WHERE id_contrato = pppd.id_contrato_dv)) AS VAR' +
        'CHAR2(80)) AS NOMBRE_CLIENTE,'
      
        '       CAST(pkgcrconsolidado.fun_nom_tit_cred((SELECT id_operaci' +
        'on FROM cr_ppo_param)) AS VARCHAR2(80)) AS nom_opera,'
      
        '       CAST(pkgcrconsolidado.fun_nom_tit_cred((SELECT id_tesorer' +
        'o  FROM cr_ppo_param)) AS VARCHAR2(80)) AS nom_tesor '#9#9#9#9#9#9#9#9'  '
      
        '   FROM cr_ppo_mov_premio pppd, cr_ppo_premio comp, cr_ppo_mov m' +
        'ovp '
      '  WHERE 1 = 1 '
      '    AND comp.imp_premio > 0 '
      '    AND pppd.id_credito = comp.id_credito '
      '    AND movp.cve_ppo_mov = pppd.cve_ppo_mov '
      '    AND movp.b_genera_factura = '#39'V'#39
      '    AND pppd.id_credito = 355640'
      '    AND pppd.id_grupo_transac = 21561171')
    Left = 645
    Top = 6
    object qyTrasCheqID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyTrasCheqID_GRUPO_TRANSAC: TFloatField
      FieldName = 'ID_GRUPO_TRANSAC'
    end
    object qyTrasCheqMONEDA: TFloatField
      FieldName = 'MONEDA'
    end
    object qyTrasCheqCUENTA: TFloatField
      FieldName = 'CUENTA'
    end
    object qyTrasCheqNOMB_CTA_BCO: TStringField
      FieldName = 'NOMB_CTA_BCO'
      Size = 80
    end
    object qyTrasCheqCVE_PPO_MOV: TStringField
      FieldName = 'CVE_PPO_MOV'
      Size = 6
    end
    object qyTrasCheqDESC_PPO_MOV: TStringField
      FieldName = 'DESC_PPO_MOV'
      Size = 40
    end
    object qyTrasCheqIMP_BRUTO: TFloatField
      FieldName = 'IMP_BRUTO'
    end
    object qyTrasCheqIMP_IVA: TFloatField
      FieldName = 'IMP_IVA'
    end
    object qyTrasCheqIMP_NETO: TFloatField
      FieldName = 'IMP_NETO'
    end
    object qyTrasCheqF_AUTORIZA: TDateTimeField
      FieldName = 'F_AUTORIZA'
    end
    object qyTrasCheqID_CONTRATO_DV: TStringField
      FieldName = 'ID_CONTRATO_DV'
    end
    object qyTrasCheqNOMBRE_CLIENTE: TStringField
      FieldName = 'NOMBRE_CLIENTE'
      Size = 80
    end
    object qyTrasCheqNOM_OPERA: TStringField
      FieldName = 'NOM_OPERA'
      Size = 80
    end
    object qyTrasCheqNOM_TESOR: TStringField
      FieldName = 'NOM_TESOR'
      Size = 80
    end
  end
end
