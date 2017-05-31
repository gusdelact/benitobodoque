object WCrLCbVsCr: TWCrLCbVsCr
  Left = 258
  Top = 197
  Width = 953
  Height = 368
  ActiveControl = VST
  Caption = 'Límite de Capital Básico contra Cartera Total'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 33
    Height = 13
    Caption = 'Fecha:'
  end
  object Label5: TLabel
    Left = 814
    Top = 39
    Width = 112
    Height = 13
    Caption = 'Índice de Capitalización'
  end
  object sbPopupExportar: TSpeedButton
    Left = 784
    Top = 297
    Width = 14
    Height = 21
    Glyph.Data = {
      56040000424D5604000000000000360400002800000007000000040000000100
      0800000000002000000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A6000020400000206000002080000020A0000020C0000020E000004000000040
      20000040400000406000004080000040A0000040C0000040E000006000000060
      20000060400000606000006080000060A0000060C0000060E000008000000080
      20000080400000806000008080000080A0000080C0000080E00000A0000000A0
      200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
      200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
      200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
      20004000400040006000400080004000A0004000C0004000E000402000004020
      20004020400040206000402080004020A0004020C0004020E000404000004040
      20004040400040406000404080004040A0004040C0004040E000406000004060
      20004060400040606000406080004060A0004060C0004060E000408000004080
      20004080400040806000408080004080A0004080C0004080E00040A0000040A0
      200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
      200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
      200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
      20008000400080006000800080008000A0008000C0008000E000802000008020
      20008020400080206000802080008020A0008020C0008020E000804000008040
      20008040400080406000804080008040A0008040C0008040E000806000008060
      20008060400080606000806080008060A0008060C0008060E000808000008080
      20008080400080806000808080008080A0008080C0008080E00080A0000080A0
      200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
      200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
      200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
      2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
      2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
      2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
      2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
      2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
      2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
      2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F6F6F600F6F6
      F600F6F6000000F6F600F60000000000F6000000000000000000}
    PopupMenu = pmExportar
    OnClick = sbPopupExportarClick
  end
  object sbExportar: TSpeedButton
    Left = 670
    Top = 297
    Width = 115
    Height = 21
    Caption = 'Exportar a Excel'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      20000000000000040000C40E0000C40E00000000000000000000D8E6E0FF4C77
      57FF3F7450FF396B4EFF38684CFF356549FF336246FF315E42FF2A553DFF2954
      3BFF254F37FF204A33FF1B4630FF18432DFF1A482EFF173827FFD1E3DBFF5B92
      6AFF87BB95FFA5C8B1FFA0C4AAFFA0C4AAFF9CBFA7FF99BCA3FF97BCA3FF96BB
      A2FF91B69DFF8FB59CFF8EB59BFF93BB9FFF659D7BFF19492FFFD2E5DCFF598B
      68FFB6D5BFFFFFFFFEFFF3FBF2FFF0F9EEFFEEF9EDFFECF7EBFFE9F5E8FFECF6
      EBFFF1FDF1FFF0FDEFFFEEFCEBFFF7FFF4FF94BBA1FF18432CFFD3E5DCFF6090
      6EFFB1D3B8FFF5FFF4FFEBF5EBFFE9F4E9FFE5F3E5FFE3F2E4FFE2F3E4FFBFDD
      C1FF8EAE92FF8BA792FF8EA693FF9CAF9DFF86AE93FF1D4832FFD3E5DDFF6A98
      78FFADD4B5FF719075FF436B4CFF496E52FF4D6D54FF507157FF406E48FF4180
      48FF347742FF18582CFF185128FF436549FF85AC92FF244D37FFD5E6DCFF719B
      7EFFBADBC1FF8CB893FF3F894FFF529C63FF559661FF347940FF287232FF68B3
      71FF53A461FF2F8943FF1D722CFFB1DCB5FF9CBEA7FF244F37FFD4E6DCFF769F
      82FFC1DAC7FFF9FFF9FF99C69DFF6AB273FF4FA156FF37883DFF78BF7FFF63AF
      68FF45964EFF1E7029FF1A6025FFA3C4A7FFA3C5ACFF29553BFFD5E7DDFF7FA8
      8AFFC5DBCAFFFFFFFFFFF4FFF4FF86B989FF34823AFF7EC484FF6BB470FF539E
      56FF4E9353FF84B289FF98B89EFFC4D8C5FF9EC1A9FF2A553CFFD5E8DDFF84AC
      90FFC7DCCCFFFFFFFFFFE6F6E8FF8EBC93FF8AC68FFF77BC7FFF5EA764FF4E91
      52FF448247FFCAEACCFFF5FFF7FFF0FBEFFF98BBA4FF315E44FFD7E8DEFF8AAF
      94FFCCE0D1FFEEF8EFFF95C09AFF90C898FF87C68FFF69AE6FFF57985CFF6AAF
      70FF54985AFF49814AFFC5E0C6FFF5FEF5FF9CC1A7FF346347FFD8E9DEFF94BA
      9EFFC4DECAFFA8CAADFF97CC9FFF8BCB96FF74B77EFF7BAE7FFF89B28AFF6FAF
      74FF73BB7BFF4F9453FF477E47FFCAE3C9FFA4C9AFFF346549FFD7E9DFFF98BF
      A2FFBFDAC6FFA7C4ABFF95C19BFF86B58CFF88B08DFFD7EAD8FFEFFCEFFF9CBE
      9FFF7CAB80FF7CAB81FF58845AFFAAC2A9FFABCDB6FF38684CFFD8EADFFF99BE
      A2FFD3E5D8FFFFFFFFFFF3FFF5FFF3FFF4FFF9FFF9FFFFFFFFFFFFFFFEFFF9FF
      FAFFEEFDEFFFEBFCEEFFECFBEFFFFBFFFAFFA5C8B1FF396A4DFFD9E9E0FFA3C5
      ACFFBAD2C0FFD8E3DAFFD4E3D7FFD2E4D6FFCDE0D1FFC7DCCCFFC5DCCAFFC0D9
      C6FFBED9C5FFBBD8C2FFB7D5BEFFB7D6BFFF87BB95FF3F7450FFDDEAE2FF9FBB
      A7FFA3C5ABFF9ABEA2FF97BB9FFF93B89CFF8BB095FF86AC8FFF81A98BFF77A0
      82FF6F9A7CFF689674FF62916FFF598B69FF5B9269FF4C7658FFF8FDF9FFDDEA
      E2FFD9EADFFFD9EADFFFD9E9DFFFD8E9DEFFD8E9DCFFD8E8DEFFD7E8DFFFD4E7
      DDFFD6E6DDFFD5E5DCFFD5E5DCFFD3E5DCFFD1E3DBFFDAE6E0FF}
    OnClick = sbExportarClick
  end
  object sbExportarDetalle: TSpeedButton
    Left = 813
    Top = 297
    Width = 115
    Height = 21
    Caption = 'Exportar detalles'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      20000000000000040000C40E0000C40E00000000000000000000D8E6E0FF4C77
      57FF3F7450FF396B4EFF38684CFF356549FF336246FF315E42FF2A553DFF2954
      3BFF254F37FF204A33FF1B4630FF18432DFF1A482EFF173827FFD1E3DBFF5B92
      6AFF87BB95FFA5C8B1FFA0C4AAFFA0C4AAFF9CBFA7FF99BCA3FF97BCA3FF96BB
      A2FF91B69DFF8FB59CFF8EB59BFF93BB9FFF659D7BFF19492FFFD2E5DCFF598B
      68FFB6D5BFFFFFFFFEFFF3FBF2FFF0F9EEFFEEF9EDFFECF7EBFFE9F5E8FFECF6
      EBFFF1FDF1FFF0FDEFFFEEFCEBFFF7FFF4FF94BBA1FF18432CFFD3E5DCFF6090
      6EFFB1D3B8FFF5FFF4FFEBF5EBFFE9F4E9FFE5F3E5FFE3F2E4FFE2F3E4FFBFDD
      C1FF8EAE92FF8BA792FF8EA693FF9CAF9DFF86AE93FF1D4832FFD3E5DDFF6A98
      78FFADD4B5FF719075FF436B4CFF496E52FF4D6D54FF507157FF406E48FF4180
      48FF347742FF18582CFF185128FF436549FF85AC92FF244D37FFD5E6DCFF719B
      7EFFBADBC1FF8CB893FF3F894FFF529C63FF559661FF347940FF287232FF68B3
      71FF53A461FF2F8943FF1D722CFFB1DCB5FF9CBEA7FF244F37FFD4E6DCFF769F
      82FFC1DAC7FFF9FFF9FF99C69DFF6AB273FF4FA156FF37883DFF78BF7FFF63AF
      68FF45964EFF1E7029FF1A6025FFA3C4A7FFA3C5ACFF29553BFFD5E7DDFF7FA8
      8AFFC5DBCAFFFFFFFFFFF4FFF4FF86B989FF34823AFF7EC484FF6BB470FF539E
      56FF4E9353FF84B289FF98B89EFFC4D8C5FF9EC1A9FF2A553CFFD5E8DDFF84AC
      90FFC7DCCCFFFFFFFFFFE6F6E8FF8EBC93FF8AC68FFF77BC7FFF5EA764FF4E91
      52FF448247FFCAEACCFFF5FFF7FFF0FBEFFF98BBA4FF315E44FFD7E8DEFF8AAF
      94FFCCE0D1FFEEF8EFFF95C09AFF90C898FF87C68FFF69AE6FFF57985CFF6AAF
      70FF54985AFF49814AFFC5E0C6FFF5FEF5FF9CC1A7FF346347FFD8E9DEFF94BA
      9EFFC4DECAFFA8CAADFF97CC9FFF8BCB96FF74B77EFF7BAE7FFF89B28AFF6FAF
      74FF73BB7BFF4F9453FF477E47FFCAE3C9FFA4C9AFFF346549FFD7E9DFFF98BF
      A2FFBFDAC6FFA7C4ABFF95C19BFF86B58CFF88B08DFFD7EAD8FFEFFCEFFF9CBE
      9FFF7CAB80FF7CAB81FF58845AFFAAC2A9FFABCDB6FF38684CFFD8EADFFF99BE
      A2FFD3E5D8FFFFFFFFFFF3FFF5FFF3FFF4FFF9FFF9FFFFFFFFFFFFFFFEFFF9FF
      FAFFEEFDEFFFEBFCEEFFECFBEFFFFBFFFAFFA5C8B1FF396A4DFFD9E9E0FFA3C5
      ACFFBAD2C0FFD8E3DAFFD4E3D7FFD2E4D6FFCDE0D1FFC7DCCCFFC5DCCAFFC0D9
      C6FFBED9C5FFBBD8C2FFB7D5BEFFB7D6BFFF87BB95FF3F7450FFDDEAE2FF9FBB
      A7FFA3C5ABFF9ABEA2FF97BB9FFF93B89CFF8BB095FF86AC8FFF81A98BFF77A0
      82FF6F9A7CFF689674FF62916FFF598B69FF5B9269FF4C7658FFF8FDF9FFDDEA
      E2FFD9EADFFFD9EADFFFD9E9DFFFD8E9DEFFD8E9DCFFD8E8DEFFD7E8DFFFD4E7
      DDFFD6E6DDFFD5E5DCFFD5E5DCFFD3E5DCFFD1E3DBFFDAE6E0FF}
    OnClick = sbExportarDetalleClick
  end
  object VST: TVirtualStringTree
    Left = 16
    Top = 80
    Width = 913
    Height = 201
    BorderStyle = bsSingle
    Header.AutoSizeIndex = 0
    Header.Background = clWindow
    Header.Columns = <
      item
        BiDiMode = bdLeftToRight
        ImageIndex = -1
        Layout = blGlyphLeft
        Options = [coAllowClick, coEnabled, coMovable, coResizable, coShowDropMark, coVisible]
        Position = 0
        Width = 144
        WideText = 'Tipo de Entidad'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 1
        Width = 200
        WideText = 'Población'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 2
        Width = 50
        WideText = 'PI  %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 3
        Width = 120
        WideText = 'P1 Capital Básico %'
      end
      item
        BiDiMode = bdRightToLeft
        ImageIndex = -1
        Layout = blGlyphLeft
        Options = [coAllowClick, coEnabled, coMovable, coResizable, coShowDropMark, coVisible]
        Position = 4
        Width = 120
        WideText = 'P1 Capital Básico $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 5
        Width = 80
        WideText = 'P1 Saldo %'
      end
      item
        BiDiMode = bdLeftToRight
        ImageIndex = -1
        Layout = blGlyphLeft
        Options = [coAllowClick, coEnabled, coMovable, coResizable, coShowDropMark, coVisible]
        Position = 6
        Width = 80
        WideText = 'P1 Saldo $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 7
        Width = 100
        WideText = 'P1 Dif Saldo %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 8
        Width = 100
        WideText = 'P1 Dif Saldo $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 9
        Width = 100
        WideText = 'P1 Excedente %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 10
        Width = 100
        WideText = 'P1 Excedente $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 11
        Width = 100
        WideText = 'P1 Remanente %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 12
        Width = 100
        WideText = 'P1 Remanente $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 13
        Width = 120
        WideText = 'P2 Capital Básico %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 14
        Width = 120
        WideText = 'P2 Capital Básico $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 15
        Width = 80
        WideText = 'P2 Saldo %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 16
        Width = 80
        WideText = 'P2 Saldo $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 17
        Width = 100
        WideText = 'P2 Dif Saldo %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 18
        Width = 100
        WideText = 'P2 Dif Saldo $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 19
        Width = 100
        WideText = 'P2 Excedente %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 20
        Width = 100
        WideText = 'P2 Excedente $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 21
        Width = 100
        WideText = 'P2 Remanente %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 22
        Width = 100
        WideText = 'P2 Remanente $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 23
        Width = 120
        WideText = 'P3 Capital Básico %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 24
        Width = 120
        WideText = 'P3 Capital Básico $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 25
        Width = 80
        WideText = 'P3 Saldo %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 26
        Width = 100
        WideText = 'P3 Saldo $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 27
        Width = 100
        WideText = 'P3 Dif Saldo %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 28
        Width = 100
        WideText = 'P3 Dif Saldo %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 29
        Width = 100
        WideText = 'P3 Excedente %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 30
        Width = 100
        WideText = 'P3 Excedente $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 31
        Width = 100
        WideText = 'P3 Remanente %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 32
        Width = 100
        WideText = 'P3 Remanente $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 33
        Width = 120
        WideText = 'P4 Capital Básico %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 34
        Width = 120
        WideText = 'P4 Capital Básico $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 35
        Width = 80
        WideText = 'P4 Saldo %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 36
        Width = 100
        WideText = 'P4 Saldo $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 37
        Width = 100
        WideText = 'P4 Dif Saldo %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 38
        Width = 100
        WideText = 'P4 Dif Saldo $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 39
        Width = 100
        WideText = 'P4 Excedente %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 40
        Width = 100
        WideText = 'P4 Excedente $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 41
        Width = 100
        WideText = 'P4 Remanente %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 42
        Width = 100
        WideText = 'P4 Remanente $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 43
        Width = 120
        WideText = 'P5 Capital Básico %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 44
        Width = 120
        WideText = 'P5 Capital Básico $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 45
        Width = 80
        WideText = 'P5 Saldo %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 46
        Width = 100
        WideText = 'P5 Saldo $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 47
        Width = 100
        WideText = 'P5 Dif Saldo %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 48
        Width = 100
        WideText = 'P5 Dif Saldo $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 49
        Width = 100
        WideText = 'P5 Excedente %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 50
        Width = 100
        WideText = 'P5 Excedente $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 51
        Width = 100
        WideText = 'P5 Remanente %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 52
        Width = 100
        WideText = 'P5 Remanente $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 53
        Width = 120
        WideText = 'P6 Capital Básico %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 54
        Width = 120
        WideText = 'P6 Capital Básico $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 55
        Width = 80
        WideText = 'P6 Saldo %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 56
        Width = 100
        WideText = 'P6 Saldo $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 57
        Width = 100
        WideText = 'P6 Dif Saldo % '
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 58
        Width = 100
        WideText = 'P6 Dif Saldo $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 59
        Width = 100
        WideText = 'P6 Excedente %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 60
        Width = 100
        WideText = 'P6 Excedente $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 61
        Width = 100
        WideText = 'P6 Remanente %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 62
        Width = 100
        WideText = 'P6 Remanente $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 63
        Width = 120
        WideText = 'P7 Capital Básico % '
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 64
        Width = 120
        WideText = 'P7 Capital Básico $ '
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 65
        Width = 80
        WideText = 'P7 Saldo % '
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 66
        Width = 100
        WideText = 'P7 Saldo $ '
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 67
        Width = 100
        WideText = 'P7 Dif Saldo %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 68
        Width = 100
        WideText = 'P7 Dif Saldo $ '
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 69
        Width = 100
        WideText = 'P7 Excedente % '
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 70
        Width = 100
        WideText = 'P7 Excedente $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 71
        Width = 100
        WideText = 'P7 Remanente %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 72
        Width = 100
        WideText = 'P7 Remanente $ '
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 73
        Width = 120
        WideText = 'P8 Capital Básico % '
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 74
        Width = 120
        WideText = 'P8 Capital Básico $ '
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 75
        Width = 80
        WideText = 'P8 Saldo %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 76
        Width = 100
        WideText = 'P8 Saldo % '
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 77
        Width = 100
        WideText = 'P8 Dif Saldo % '
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 78
        Width = 100
        WideText = 'P8 Dif Saldo $ '
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 79
        Width = 100
        WideText = 'P8 Excedente % '
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 80
        Width = 100
        WideText = 'P8 Excedente $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 81
        Width = 100
        WideText = 'P8 Remanente % '
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 82
        Width = 100
        WideText = 'P8 Remanente $ '
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 83
        Width = 120
        WideText = 'P9 Capital Básico % '
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 84
        Width = 120
        WideText = 'P9 Capital Básico $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 85
        Width = 80
        WideText = 'P9 Saldo % '
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 86
        Width = 100
        WideText = 'P9 Saldo $ '
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 87
        Width = 100
        WideText = 'P9 dif Saldo %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 88
        Width = 100
        WideText = 'P9 Dif Saldo $'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 89
        Width = 100
        WideText = 'P9 Excedente  %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 90
        Width = 100
        WideText = 'P9 Excedente $ '
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 91
        Width = 100
        WideText = 'P9 Remanente %'
      end
      item
        ImageIndex = -1
        Layout = blGlyphLeft
        Position = 92
        Width = 100
        WideText = 'P9 Remanente $ '
      end>
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'MS Sans Serif'
    Header.Font.Style = []
    Header.Options = [hoColumnResize, hoDrag, hoVisible]
    Header.Style = hsThickButtons
    HintAnimation = hatNone
    HintMode = hmDefault
    Images = ImageList1
    ParentColor = False
    TabOrder = 7
    OnAfterItemPaint = VSTAfterItemPaint
    OnChange = VSTChange
    OnGetText = VSTGetText
    OnFocusChanged = VSTFocusChanged
    OnGetImageIndex = VSTGetImageIndex
    WideDefaultText = 'Node'
  end
  object GroupBox1: TGroupBox
    Left = 154
    Top = 12
    Width = 287
    Height = 43
    Caption = 'Tipo Entidad'
    TabOrder = 1
    object cbEstatal: TCheckBox
      Left = 16
      Top = 19
      Width = 65
      Height = 17
      Caption = 'Estatal'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object cbMunicipal: TCheckBox
      Left = 76
      Top = 19
      Width = 69
      Height = 17
      Caption = 'Municipal'
      TabOrder = 1
    end
    object cbOrgDesc: TCheckBox
      Left = 154
      Top = 19
      Width = 127
      Height = 17
      Caption = 'Org. Descentralizados'
      TabOrder = 2
    end
  end
  object dpFecha: TDateTimePicker
    Left = 16
    Top = 32
    Width = 129
    Height = 21
    CalAlignment = dtaLeft
    Date = 40951.3967984722
    Time = 40951.3967984722
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
  end
  object rgFactorMoneda: TRadioGroup
    Left = 444
    Top = 12
    Width = 353
    Height = 43
    Caption = ' Información expresada en: '
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Millones de pesos'
      'Miles de pesos'
      'Pesos')
    TabOrder = 2
  end
  object edIndiceCapitalizacion: TEdit
    Left = 814
    Top = 55
    Width = 115
    Height = 21
    TabStop = False
    BiDiMode = bdRightToLeft
    Color = clBtnFace
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 3
  end
  object Chart: TChart
    Left = 552
    Top = 288
    Width = 33
    Height = 33
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Límite Capital Básico Vs Cartera Total')
    BottomAxis.LabelsAngle = 90
    BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
    BottomAxis.LabelsFont.Color = clBlack
    BottomAxis.LabelsFont.Height = -8
    BottomAxis.LabelsFont.Name = 'Arial'
    BottomAxis.LabelsFont.Style = []
    BottomAxis.LabelsMultiLine = True
    Legend.TopPos = 5
    TabOrder = 13
    Visible = False
  end
  object rgInfoDesplegar: TRadioGroup
    Left = 121
    Top = 288
    Width = 177
    Height = 33
    Caption = ' Desplegar '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Porcentajes'
      'Importes')
    TabOrder = 8
    OnClick = rgInfoDesplegarClick
  end
  object cbDisplayMarks: TCheckBox
    Left = 306
    Top = 286
    Width = 169
    Height = 17
    Caption = 'Desplegar etiquetas de valores'
    TabOrder = 10
    OnClick = cbDisplayMarksClick
  end
  object rgProyeccion: TRadioGroup
    Left = 16
    Top = 288
    Width = 97
    Height = 33
    Caption = ' Proyección '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      '2D'
      '3D')
    TabOrder = 9
    OnClick = rgProyeccionClick
  end
  object cbMuestraInfoReal: TCheckBox
    Left = 306
    Top = 302
    Width = 113
    Height = 17
    Caption = 'Infomación Real'
    Checked = True
    State = cbChecked
    TabOrder = 11
    OnClick = cbMuestraInfoRealClick
  end
  object cbMuestraCapBas: TCheckBox
    Left = 413
    Top = 302
    Width = 97
    Height = 17
    Caption = 'Capital Básico'
    Checked = True
    State = cbChecked
    TabOrder = 12
    OnClick = cbMuestraCapBasClick
  end
  object cbCartasCredito: TCheckBox
    Left = 15
    Top = 58
    Width = 137
    Height = 17
    Caption = 'Incluir cartas de crédito'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object cbInteresesAnticipados: TCheckBox
    Left = 151
    Top = 58
    Width = 217
    Height = 17
    Caption = 'Incluir intereses cobrados por anticipado'
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object btBusca: TBitBtn
    Left = 814
    Top = 12
    Width = 115
    Height = 21
    Caption = 'Inicia Busqueda'
    TabOrder = 6
    OnClick = btBuscaClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
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
    Left = 632
    Top = 120
  end
  object pmExportar: TPopupMenu
    Tag = 3
    Left = 706
    Top = 120
    object Tablaygrafica1: TMenuItem
      Tag = 3
      Caption = 'Tabla &y gráfica'
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = PopupMenuGraficaTabla
    end
    object Solotabla1: TMenuItem
      Tag = 1
      Caption = 'Solo &tabla'
      GroupIndex = 1
      RadioItem = True
      OnClick = PopupMenuGraficaTabla
    end
    object Solografica1: TMenuItem
      Tag = 2
      Caption = 'Solo &gráfica'
      GroupIndex = 1
      RadioItem = True
      OnClick = PopupMenuGraficaTabla
    end
  end
  object SaveXLS: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Archivos de Excel *.xls|*.xls|Todos los archivos|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Exportar a Excel'
    Left = 738
    Top = 120
  end
  object QIndiceCapitalizacion: TQuery
    SQL.Strings = (
      'Select  Imp_Capital_Basico'
      '  From Table (PkgCRGPViews.VW_CR_GP_Capital_Basico (:Fecha))   '
      ' Where Pct_Capital = 100'
      '   And RowNum      = 1  ')
    Left = 674
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Fecha'
        ParamType = ptUnknown
      end>
  end
  object qDatos: TQuery
    DatabaseName = 'BCORP'
    SQL.Strings = (
      'Select Tipo_Entidad,'
      '       Cve_Estado,'
      '       Cve_Ciudad,'
      '       Cve_Poblacion,'
      '       Desc_Poblacion,'
      
        '       Case When Tipo_Entidad = '#39'ESTATAL'#39' Then Count (*) Over (P' +
        'artition By Cve_Estado) - 1 '
      '            Else 0'
      '       End                                          Hijos,'
      '       Pct_PI,'
      '       Pct_PI       PCT_PI_Cal,'
      '       Nivel,'
      '       '
      '       /* Producto 1*/'
      '       P1_Pct_Capital_Basico,'
      
        '       Round (P1_Imp_Capital_Basico  / :Factor, Decimales)  P1_I' +
        'mp_Capital_Basico,'
      '       P1_Cve_Moneda,'
      '       P1_Sdo_Pct,'
      
        '       Round (P1_Sdo                   * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P1_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P1_Sdo,'
      '       P1_Dif_Pct,'
      
        '       Round (P1_Diferencia            * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P1_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P1_Diferencia,'
      '       P1_Pct_Excedente,                                       '
      
        '       Round (P1_Imp_Excedente         * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P1_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P1_Imp_Excedente,'
      '       P1_Pct_Remanente,'
      
        '       Round (P1_Imp_Remanente         * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P1_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P1_Imp_Remanente,'
      ''
      ''
      '       /* Producto 2*/'
      '       P2_Pct_Capital_Basico,'
      
        '       Round (P2_Imp_Capital_Basico  / :Factor, Decimales)  P2_I' +
        'mp_Capital_Basico,'
      '       P2_Cve_Moneda,'
      '       P2_Sdo_Pct,'
      
        '       Round (P2_Sdo                   * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P2_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P2_Sdo,'
      '       P2_Dif_Pct,'
      
        '       Round (P2_Diferencia            * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P2_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P2_Diferencia,'
      '       P2_Pct_Excedente,                                       '
      
        '       Round (P2_Imp_Excedente         * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P2_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P2_Imp_Excedente,'
      '       P2_Pct_Remanente,'
      
        '       Round (P2_Imp_Remanente         * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P2_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P2_Imp_Remanente,'
      ''
      '       /*Producto 3*/                                       '
      '       P3_Pct_Capital_Basico,'
      
        '       Round (P3_Imp_Capital_Basico  / :Factor, Decimales)  P3_I' +
        'mp_Capital_Basico,'
      '       P3_Cve_Moneda,'
      '       P3_Sdo_Pct,'
      
        '       Round (P3_Sdo                   * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P3_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P3_Sdo,'
      '       P3_Dif_Pct,'
      
        '       Round (P3_Diferencia            * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P3_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P3_Diferencia,'
      '       P3_Pct_Excedente,                                       '
      
        '       Round (P3_Imp_Excedente         * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P3_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P3_Imp_Excedente,'
      '       P3_Pct_Remanente,'
      
        '       Round (P3_Imp_Remanente         * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P3_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P3_Imp_Remanente,'
      '                                       '
      '       /*Producto 4*/'
      '       P4_Pct_Capital_Basico,'
      
        '       Round (P4_Imp_Capital_Basico  / :Factor, Decimales)  P4_I' +
        'mp_Capital_Basico,'
      '       P4_Cve_Moneda,'
      '       P4_Sdo_Pct,'
      
        '       Round (P4_Sdo                   * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P4_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P4_Sdo,'
      '       P4_Dif_Pct,'
      
        '       Round (P4_Diferencia            * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P4_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P4_Diferencia,'
      '       P4_Pct_Excedente,                                       '
      
        '       Round (P4_Imp_Excedente         * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P4_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P4_Imp_Excedente,'
      '       P4_Pct_Remanente,'
      
        '       Round (P4_Imp_Remanente         * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P4_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P4_Imp_Remanente,'
      '                                       '
      '       /*Producto 5*/'
      '       P5_Pct_Capital_Basico,'
      
        '       Round (P5_Imp_Capital_Basico  / :Factor, Decimales)  P5_I' +
        'mp_Capital_Basico,'
      '       P5_Cve_Moneda,'
      '       P5_Sdo_Pct,'
      
        '       Round (P5_Sdo                   * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P5_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P5_Sdo,'
      '       P5_Dif_Pct,'
      
        '       Round (P5_Diferencia            * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P5_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P5_Diferencia,'
      '       P5_Pct_Excedente,                                       '
      
        '       Round (P5_Imp_Excedente         * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P5_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P5_Imp_Excedente,'
      '       P5_Pct_Remanente,'
      
        '       Round (P5_Imp_Remanente         * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P5_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P5_Imp_Remanente,'
      '       '
      '       /*Producto 6*/'
      '       P6_Pct_Capital_Basico,'
      
        '       Round (P6_Imp_Capital_Basico  / :Factor, Decimales)  P6_I' +
        'mp_Capital_Basico,'
      '       P6_Cve_Moneda,'
      '       P6_Sdo_Pct,'
      
        '       Round (P6_Sdo                   * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P6_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P6_Sdo,'
      '       P6_Dif_Pct,'
      
        '       Round (P6_Diferencia            * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P6_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P6_Diferencia,'
      '       P6_Pct_Excedente,                                       '
      
        '       Round (P6_Imp_Excedente         * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P6_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P6_Imp_Excedente,'
      '       P6_Pct_Remanente,'
      
        '       Round (P6_Imp_Remanente         * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P6_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P6_Imp_Remanente,'
      '                                       '
      '       /*Producto 7*/'
      '       P7_Pct_Capital_Basico,'
      
        '       Round (P7_Imp_Capital_Basico  / :Factor, Decimales)  P7_I' +
        'mp_Capital_Basico,'
      '       P7_Cve_Moneda,'
      '       P7_Sdo_Pct,'
      
        '       Round (P7_Sdo                   * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P7_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P7_Sdo,'
      '       P7_Dif_Pct,'
      
        '       Round (P7_Diferencia            * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P7_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P7_Diferencia,'
      '       P7_Pct_Excedente,                                       '
      
        '       Round (P7_Imp_Excedente         * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P7_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P7_Imp_Excedente,'
      '       P7_Pct_Remanente,'
      
        '       Round (P7_Imp_Remanente         * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P7_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P7_Imp_Remanente,'
      '                                       '
      '       /*Producto 8*/'
      '       P8_Pct_Capital_Basico,'
      
        '       Round (P8_Imp_Capital_Basico  / :Factor, Decimales)  P8_I' +
        'mp_Capital_Basico,'
      '       P8_Cve_Moneda,'
      '       P8_Sdo_Pct,'
      
        '       Round (P8_Sdo                   * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P8_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P8_Sdo,'
      '       P8_Dif_Pct,'
      
        '       Round (P8_Diferencia            * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P8_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P8_Diferencia,'
      '       P8_Pct_Excedente,                                       '
      
        '       Round (P8_Imp_Excedente         * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P8_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P8_Imp_Excedente,'
      '       P8_Pct_Remanente,'
      
        '       Round (P8_Imp_Remanente         * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P8_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P8_Imp_Remanente,'
      '                                       '
      '       /*Producto 9*/'
      '       P9_Pct_Capital_Basico,'
      
        '       Round (P9_Imp_Capital_Basico  / :Factor, Decimales)  P9_I' +
        'mp_Capital_Basico,'
      '       P9_Cve_Moneda,'
      '       P9_Sdo_Pct,'
      
        '       Round (P9_Sdo                   * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P9_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P9_Sdo,'
      '       P9_Dif_Pct,'
      
        '       Round (P9_Diferencia            * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P9_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P9_Diferencia,'
      '       P9_Pct_Excedente,                                       '
      
        '       Round (P9_Imp_Excedente         * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P9_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P9_Imp_Excedente,'
      '       P9_Pct_Remanente,'
      
        '       Round (P9_Imp_Remanente         * Nvl (PkgCrConsolidado1.' +
        'Fnc_Obt_Tipo_Cambio_Regul (P9_Cve_Moneda, '
      
        '                                                                ' +
        '                           '#39'D000'#39', '
      
        '                                                                ' +
        '                           Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                           Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                          ), 1) '
      
        '                                       / :Factor, Decimales)    ' +
        '                                                                ' +
        '       P9_Imp_Remanente'
      '  From (Select *'
      '          From (Select T.*,'
      
        '                       Case When T.Orden_Aplicacion = Min (T.Ord' +
        'en_Aplicacion) Over (Partition By Tipo_Entidad, Cve_Poblacion) T' +
        'hen '#39'V'#39' Else '#39'F'#39' End B_Aplicacion,'
      
        '                       Case When :Factor = 1000000 Then 0 Else 2' +
        ' End                                                            ' +
        '                     Decimales                        '
      
        '                  From (Select 1                                ' +
        '                                                    Orden_Aplica' +
        'cion,'
      '                               FM.Tipo_Entidad,'
      '                               FM.Cve_Estado,'
      '                               FM.Cve_Ciudad,'
      '                               FM.Cve_Poblacion,'
      '                               P.Desc_Poblacion,'
      '                               FM.Pct_PI,        '
      
        '                               Case When FM.Tipo_Entidad = '#39'ESTA' +
        'TAL'#39'   Then 1 '
      
        '                                    When FM.Tipo_Entidad = '#39'MUNI' +
        'CIPAL'#39' Then 2 '
      
        '                                    When FM.Tipo_Entidad = '#39'ORG-' +
        'DESC'#39'  Then 3 '
      
        '                               End                              ' +
        '                                                    Nivel,'
      '                               '
      
        '                               FM.P1_Pct_Capital_Basico, FM.P1_I' +
        'mp_Capital_Basico, FM.P1_Cve_Moneda, FM.P1_Sdo_Pct, FM.P1_Sdo, F' +
        'M.P1_Dif_Pct, FM.P1_Diferencia, FM.P1_Pct_Excedente, FM.P1_Imp_E' +
        'xcedente, FM.P1_Pct_Remanente, FM.P1_Imp_Remanente,'
      
        '                               FM.P2_Pct_Capital_Basico, FM.P2_I' +
        'mp_Capital_Basico, FM.P2_Cve_Moneda, FM.P2_Sdo_Pct, FM.P2_Sdo, F' +
        'M.P2_Dif_Pct, FM.P2_Diferencia, FM.P2_Pct_Excedente, FM.P2_Imp_E' +
        'xcedente, FM.P2_Pct_Remanente, FM.P2_Imp_Remanente,'
      
        '                               FM.P3_Pct_Capital_Basico, FM.P3_I' +
        'mp_Capital_Basico, FM.P3_Cve_Moneda, FM.P3_Sdo_Pct, FM.P3_Sdo, F' +
        'M.P3_Dif_Pct, FM.P3_Diferencia, FM.P3_Pct_Excedente, FM.P3_Imp_E' +
        'xcedente, FM.P3_Pct_Remanente, FM.P3_Imp_Remanente,'
      
        '                               FM.P4_Pct_Capital_Basico, FM.P4_I' +
        'mp_Capital_Basico, FM.P4_Cve_Moneda, FM.P4_Sdo_Pct, FM.P4_Sdo, F' +
        'M.P4_Dif_Pct, FM.P4_Diferencia, FM.P4_Pct_Excedente, FM.P4_Imp_E' +
        'xcedente, FM.P4_Pct_Remanente, FM.P4_Imp_Remanente,'
      
        '                               FM.P5_Pct_Capital_Basico, FM.P5_I' +
        'mp_Capital_Basico, FM.P5_Cve_Moneda, FM.P5_Sdo_Pct, FM.P5_Sdo, F' +
        'M.P5_Dif_Pct, FM.P5_Diferencia, FM.P5_Pct_Excedente, FM.P5_Imp_E' +
        'xcedente, FM.P5_Pct_Remanente, FM.P5_Imp_Remanente,'
      
        '                               FM.P6_Pct_Capital_Basico, FM.P6_I' +
        'mp_Capital_Basico, FM.P6_Cve_Moneda, FM.P6_Sdo_Pct, FM.P6_Sdo, F' +
        'M.P6_Dif_Pct, FM.P6_Diferencia, FM.P6_Pct_Excedente, FM.P6_Imp_E' +
        'xcedente, FM.P6_Pct_Remanente, FM.P6_Imp_Remanente,'
      
        '                               FM.P7_Pct_Capital_Basico, FM.P7_I' +
        'mp_Capital_Basico, FM.P7_Cve_Moneda, FM.P7_Sdo_Pct, FM.P7_Sdo, F' +
        'M.P7_Dif_Pct, FM.P7_Diferencia, FM.P7_Pct_Excedente, FM.P7_Imp_E' +
        'xcedente, FM.P7_Pct_Remanente, FM.P7_Imp_Remanente,'
      
        '                               FM.P8_Pct_Capital_Basico, FM.P8_I' +
        'mp_Capital_Basico, FM.P8_Cve_Moneda, FM.P8_Sdo_Pct, FM.P8_Sdo, F' +
        'M.P8_Dif_Pct, FM.P8_Diferencia, FM.P8_Pct_Excedente, FM.P8_Imp_E' +
        'xcedente, FM.P8_Pct_Remanente, FM.P8_Imp_Remanente,'
      
        '                               FM.P9_Pct_Capital_Basico, FM.P9_I' +
        'mp_Capital_Basico, FM.P9_Cve_Moneda, FM.P9_Sdo_Pct, FM.P9_Sdo, F' +
        'M.P9_Dif_Pct, FM.P9_Diferencia, FM.P9_Pct_Excedente, FM.P9_Imp_E' +
        'xcedente, FM.P9_Pct_Remanente, FM.P9_Imp_Remanente'
      
        '                          From Table (PkgCrGpViews.VW_CR_GP_Fina' +
        'n_Max_Vs_Real (:peFecha, :peTipo_Entidad, :peInt_Cob_Ant, :peCar' +
        'tas_Cred)) FM'
      
        '                          Join Poblacion P On P.Cve_Poblacion = ' +
        'FM.Cve_Poblacion'
      '                         Union All'
      
        '                        Select 2                              Or' +
        'den_Aplicacion, '
      
        '                               '#39'ESTATAL'#39'                      Ti' +
        'po_Entidad,'
      '                               Edo.Cve_Estado,'
      
        '                               Null                           Cv' +
        'e_Ciudad,'
      
        '                               Edo.Cve_Estado                 Cv' +
        'e_Poblacion,'
      '                               P.Desc_Poblacion,'
      
        '                               0                              Pc' +
        't_PI,'
      
        '                               1                              Ni' +
        'vel,'
      
        '                               0 P1_Pct_Capital_Basico, 0 P1_Imp' +
        '_Capital_Basico, 0 P1_Cve_Moneda, 0 P1_Sdo_Pct, 0 P1_Sdo, 0 P1_D' +
        'if_Pct, 0 P1_Diferencia, 0 P1_Pct_Excedente, 0 P1_Imp_Excedente,' +
        ' 0 P1_Pct_Remanente, 0 P1_Imp_Remanente,'
      
        '                               0 P2_Pct_Capital_Basico, 0 P2_Imp' +
        '_Capital_Basico, 0 P2_Cve_Moneda, 0 P2_Sdo_Pct, 0 P2_Sdo, 0 P2_D' +
        'if_Pct, 0 P2_Diferencia, 0 P2_Pct_Excedente, 0 P2_Imp_Excedente,' +
        ' 0 P2_Pct_Remanente, 0 P2_Imp_Remanente,'
      
        '                               0 P3_Pct_Capital_Basico, 0 P3_Imp' +
        '_Capital_Basico, 0 P3_Cve_Moneda, 0 P3_Sdo_Pct, 0 P3_Sdo, 0 P3_D' +
        'if_Pct, 0 P3_Diferencia, 0 P3_Pct_Excedente, 0 P3_Imp_Excedente,' +
        ' 0 P3_Pct_Remanente, 0 P3_Imp_Remanente,'
      
        '                               0 P4_Pct_Capital_Basico, 0 P4_Imp' +
        '_Capital_Basico, 0 P4_Cve_Moneda, 0 P4_Sdo_Pct, 0 P4_Sdo, 0 P4_D' +
        'if_Pct, 0 P4_Diferencia, 0 P4_Pct_Excedente, 0 P4_Imp_Excedente,' +
        ' 0 P4_Pct_Remanente, 0 P4_Imp_Remanente,'
      
        '                               0 P5_Pct_Capital_Basico, 0 P5_Imp' +
        '_Capital_Basico, 0 P5_Cve_Moneda, 0 P5_Sdo_Pct, 0 P5_Sdo, 0 P5_D' +
        'if_Pct, 0 P5_Diferencia, 0 P5_Pct_Excedente, 0 P5_Imp_Excedente,' +
        ' 0 P5_Pct_Remanente, 0 P5_Imp_Remanente,'
      
        '                               0 P6_Pct_Capital_Basico, 0 P6_Imp' +
        '_Capital_Basico, 0 P6_Cve_Moneda, 0 P6_Sdo_Pct, 0 P6_Sdo, 0 P6_D' +
        'if_Pct, 0 P6_Diferencia, 0 P6_Pct_Excedente, 0 P6_Imp_Excedente,' +
        ' 0 P6_Pct_Remanente, 0 P6_Imp_Remanente,'
      
        '                               0 P7_Pct_Capital_Basico, 0 P7_Imp' +
        '_Capital_Basico, 0 P7_Cve_Moneda, 0 P7_Sdo_Pct, 0 P7_Sdo, 0 P7_D' +
        'if_Pct, 0 P7_Diferencia, 0 P7_Pct_Excedente, 0 P7_Imp_Excedente,' +
        ' 0 P7_Pct_Remanente, 0 P7_Imp_Remanente,'
      
        '                               0 P8_Pct_Capital_Basico, 0 P8_Imp' +
        '_Capital_Basico, 0 P8_Cve_Moneda, 0 P8_Sdo_Pct, 0 P8_Sdo, 0 P8_D' +
        'if_Pct, 0 P8_Diferencia, 0 P8_Pct_Excedente, 0 P8_Imp_Excedente,' +
        ' 0 P8_Pct_Remanente, 0 P8_Imp_Remanente,'
      
        '                               0 P9_Pct_Capital_Basico, 0 P9_Imp' +
        '_Capital_Basico, 0 P9_Cve_Moneda, 0 P9_Sdo_Pct, 0 P9_Sdo, 0 P9_D' +
        'if_Pct, 0 P9_Diferencia, 0 P9_Pct_Excedente, 0 P9_Imp_Excedente,' +
        ' 0 P9_Pct_Remanente, 0 P9_Imp_Remanente'
      '                          From (Select Distinct Cve_Estado'
      
        '                                  From Table (PkgCrGpViews.VW_CR' +
        '_GP_Finan_Max_Vs_Real (:peFecha, :peTipo_Entidad, :peInt_Cob_Ant' +
        ', :peCartas_Cred)) '
      '                               ) Edo'
      
        '                          Join Poblacion P On Edo.Cve_Estado = P' +
        '.Cve_Poblacion   '
      '                       ) T        '
      '               )'
      '          Where B_Aplicacion = '#39'V'#39'     '
      '         Order By Cve_Estado, Nivel, Cve_Ciudad Nulls First'
      '       )')
    Left = 776
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Factor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peInt_Cob_Ant'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peCartas_Cred'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peInt_Cob_Ant'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peCartas_Cred'
        ParamType = ptUnknown
      end>
  end
  object ImageList1: TImageList
    Left = 596
    Top = 120
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFFFD00FCFFFD00FCFFFD00FCFF
      FD00FCFFFD00FCFFFD00FFFCFB00FCFFFD00FCFFFD00FFFCFB00FCFFFD00FCFF
      FD00FCFFFD00FFFCFB00FCFFFD00FCFFFD00F9FDFA00F9FDFA00BED2C900BED2
      C900F9FDFA00F9FDFA00F9FDFA00F9FDFA00F9FDFA00F9FDFA00F9FDFA00F9FD
      FA00F9FDFA00F9FDFA00F9FDFA00F9FDFA00FBFFFC00FBFFFC00FBFFFC00FBFF
      FC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00FBFF
      FC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00F9FBF800F9FBF800F9FBF800F9FB
      F800F9FBF800F9FBF800F9FBF800D5D4DA00A1DACB0076C4AC002CA98B0076C4
      AC00F9FBF800F9FBF800F9FBF800F9FBF800FCFFFD00FCFFFD00FCFFFD00FCFF
      FD00FCFFFD00FCFFFD00FCFFFD00FFFCFB00FFFCFB00FFFCFB00E9E2ED00FFFC
      FB00CECAE000FCFFFD00FCFFFD00FCFFFD00F9FDFA00F9FDFA006B9291006B92
      9100BED2C900F9FDFA00F9FDFA00F9FDFA00F9FDFA00F9FDFA00F9FDFA00F9FD
      FA00F9FDFA00F9FDFA00F9FDFA00F9FDFA00FBFFFC00FBFFFC00FBFFFC00FBFF
      FC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00FBFF
      FC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00F9FBF800F9FBF800F9FBF800F9FB
      F80076C4AC0076C4AC002CA98B002CA98B00347973002CA98B00347973002CA9
      8B0070A09400F9FBF800F9FBF800F9FBF800FCFFFD00FCFFFD00FCFFFD00FCFF
      FD00FFFCFB00FCFFFD00FFFCFB00FFFCFB00E9E2ED00BBB5D600AFA7D000B9B0
      D900AFA7D000C8BCDA00FFFCFB00FCFFFD00F9FDFA00BED2C9006B9291006B92
      91006B92910075CEA50099D6B300F9FDFA00F9FDFA00F9FDFA00F9FDFA00F9FD
      FA00F9FDFA00F9FDFA00F9FDFA00F9FDFA00FBFFFC00FBFFFC00FBFFFC00FBFF
      FC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00C9D7BE00C9D7BE004B115200BC9B
      BB0081DEDB0081DEDB00FBFFFC00FBFFFC00A1DACB00A1DACB002CA98B002CA9
      8B002CA98B002CA98B0034797300587ACD00A0969400A0969400BAB1B2003479
      73002CA98B00A1DACB00F9FBF800F9FBF800FCFFFD00FCFFFD00FCFFFD00FFFC
      FB00FCFFFD00FFFCFB00FFFCFB00CECAE000AFA7D000AFA7D000AEA3D300AEA3
      D300AFA7D000C8BCDA00F0F0F400FCFFFD00F9FDFA00BED2C9006B9291006B92
      91006FA3880075CEA50075CEA50099D6B30075CEA500BED2C900F9FDFA00F9FD
      FA00F9FDFA00F9FDFA00F9FDFA00F9FDFA00FBFFFC00FBFFFC00FBFFFC00FBFF
      FC00FBFFFC00FBFFFC00FBFFFC00FBFFFC006BB37500A6A436004B1152004B11
      52006BB3750081DEDB00FBFFFC00FBFFFC00F9FBF800A1DACB0076C4AC006666
      6E00171F3B0066666E00D5D4DA00D5D4DA00F9FBF800F9FBF800D5D4DA00D5D4
      DA0070A094002CA98B00A1DACB00F9FBF800FCFFFD00FCFFFD00FCFFFD00FCFF
      FD00FCFFFD00FFFCFB00BBB5D600AEA3D300AEA3D300AEA3D300B9B0D900F0F0
      F400DCDAEA00B9B0D900AFA7D000E4E4EF00F9FDFA006B9291006B9291006B92
      91006B92910075CEA50075CEA50075CEA50075CEA50075CEA500F9FDFA00F9FD
      FA00F9FDFA00F9FDFA00F9FDFA00F9FDFA00FBFFFC00FBFFFC00FBFFFC00FBFF
      FC00FBFFFC00FBFFFC00DCCDE2008664A3008664A3006995CE003C68A000BC9B
      BB00C9D7BE00AF7E5C00AF7E5C00DCCDE200F9FBF800F9FBF800F9FBF800A096
      9400171F3B0066666E00F9FBF800BAB1B200BAB1B200A0969400F9FBF800BAB1
      B200D5D4DA0070A094002CA98B00F9FBF800FCFFFD00FCFFFD00FCFFFD00FCFF
      FD00FFFCFB00E9E2ED00AFA7D000AFA7D000AFA7D000AEA3D300DCDAEA00FFFC
      FB00FFFCFB00DCDAEA00AEA3D300E9E2ED00F9FDFA00BED2C9006B9291006B92
      91006B9291006B92910075CEA50075CEA50075CEA50075CEA500AAD7E300F9FD
      FA00F9FDFA00BED2C9006FA38800BED2C900FBFFFC00FBFFFC00FBFFFC00FBFF
      FC00FBFFFC00FBFFFC00AF7E5C00706C64006995CE003C68A0006995CE00FBFF
      FC00FBFFFC00C9D7BE00706C6400BC9BBB00F9FBF800F9FBF800F9FBF800BAB1
      B200A0969400A096940066666E00A0969400A0969400171F3B00F9FBF8006666
      6E00A0969400D5D4DA0070A0940076C4AC00FCFFFD00FCFFFD00FCFFFD00FFFC
      FB00FFFCFB00E9E2ED00AEA3D300AEA3D300AFA7D000AEA3D300FFFCFB00FCFF
      FD00FCFFFD00F0F0F400BBB5D600CECAE000F9FDFA00F9FDFA006B9291006B92
      91006B9291006B92910056ABA20051C1CB0051C1CB0051C1CB00AAD7E300F9FD
      FA00F9FDFA0056ABA2006FA38800BED2C900FBFFFC00FBFFFC00FBFFFC00FBFF
      FC00FBFFFC00C9D7BE00A6A43600A6A436006BB37500706C6400DCCDE200FBFF
      FC00FBFFFC00FBFFFC00234CD900BC9BBB00F9FBF800F9FBF800F9FBF800BAB1
      B200A0969400A0969400171F3B0066666E0066666E00171F3B00F9FBF8006666
      6E00A096940066666E00F9FBF800F9FBF800FCFFFD00FCFFFD00FFFCFB00F0F0
      F400FFFCFB00CECAE000AEA3D300AEA3D300AEA3D300C8BCDA00FCFFFD00FCFF
      FD00FCFFFD00FCFFFD00FFFCFB00FCFFFD00F9FDFA00F9FDFA00BED2C9006B92
      91006B92910056ABA2003CA2BA0051C1CB0051C1CB0051C1CB00BED2C900F9FD
      FA00BED2C9006FA388006FA38800BED2C900FBFFFC00FBFFFC00FBFFFC00FBFF
      FC00FBFFFC00FBFFFC006995CE0081DEDB006BB37500A6A43600FBFFFC00FBFF
      FC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00F9FBF800F9FBF800F9FBF800BAB1
      B200BAB1B200BAB1B20066666E00A0969400A096940066666E00D5D4DA006666
      6E00A096940066666E00F9FBF800F9FBF800FCFFFD00FFFCFB00F0F0F400C1BC
      DA00F0F0F400AEA3D300AFA7D000AFA7D000AFA7D000BBB5D600FFFCFB00FCFF
      FD00FCFFFD00FCFFFD00FCFFFD00FCFFFD00F9FDFA00F9FDFA00F9FDFA006B92
      91006B92910051C1CB0051C1CB0051C1CB0051C1CB003CA2BA007AB5E600F9FD
      FA00BED2C9006FA388006FA38800BED2C900FBFFFC00FBFFFC00FBFFFC0079B1
      A400FBFFFC006995CE00234CD90081DEDB00706C6400A6A43600FBFFFC00FBFF
      FC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00F9FBF800F9FBF800D5D4DA00D5D4
      DA00D5D4DA00D5D4DA00F9FBF800F9FBF800F9FBF800F9FBF800A09694002C21
      B00066666E00A0969400F9FBF800F9FBF800FFFCFB00FCFFFD00CECAE000E9E2
      ED00C8BCDA00AFA7D000AFA7D000AFA7D000AFA7D000AFA7D000F8FAFF00FCFF
      FD00FCFFFD00FCFFFD00FCFFFD00FCFFFD00F9FDFA00F9FDFA00F9FDFA0086AE
      5D0047AD6D0056ABA20047AD6D004B8B120056ABA2003F96DD003F96DD00AAD7
      E30056ABA2006FA388006FA38800F9FDFA00FBFFFC00FBFFFC00C9D7BE00C9D7
      BE0081DEDB00234CD900234CD9006BB375008664A300AF7E5C00FBFFFC00FBFF
      FC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00F9FBF800F9FBF800948ECD00D5D4
      DA00D5D4DA00F9FBF800F9FBF800F9FBF800F9FBF800D5D4DA002C21B0002C21
      B0002C21B0002C21B0005E5CB400D5D4DA00FCFFFD00FFFCFB00C8BCDA00E9E2
      ED00AFA7D000B3ABD300AFA7D000B9B0D900AEA3D300E9E2ED00FCFFFD00FCFF
      FD00FCFFFD00FCFFFD00FCFFFD00FCFFFD00F9FDFA00F9FDFA00F9FDFA004B8B
      12004B8B12004B8B12004B8B12004B8B120056ABA2003F96DD003F96DD003CA2
      BA0047AD6D0047AD6D0047AD6D00BED2C900FBFFFC00FBFFFC0079B1A400FBFF
      FC006995CE00BC9BBB008664A3006BB37500706C6400C9D7BE00FBFFFC00FBFF
      FC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00F9FBF800F9FBF800F9FBF800948E
      CD00F9FBF800F9FBF800F9FBF800F9FBF800F9FBF8005E5CB4002C21B0002C21
      B0002C21B0002C21B0005E5CB400F9FBF800FFFCFB00C1BCDA00CECAE000C8BC
      DA00B9B0D900AEA3D300AEA3D300AEA3D300BBB5D600FCFFFD00FCFFFD00FCFF
      FD00FCFFFD00FCFFFD00FCFFFD00FCFFFD00F9FDFA00F9FDFA00F9FDFA00F9FD
      FA004B8B12004B8B12004B8B12004B8B12004B8B12003F96DD003F96DD003CA2
      BA0047AD6D0047AD6D0047AD6D0075CEA500FBFFFC0079B1A400C9D7BE00BC9B
      BB00AF7E5C00AF7E5C00AF7E5C006BB375006BB37500FBFFFC00FBFFFC00FBFF
      FC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00F9FBF800F9FBF800F9FBF800BAB1
      B200BAB1B200F9FBF800F9FBF800F9FBF800948ECD002C21B0002C21B0002C21
      B0002C21B0002C21B000F9FBF800F9FBF800F8FAFF00CECAE000C8BCDA00AEA3
      D300B3ABD300AEA3D300BBB5D600BBB5D600E4E4EF00FCFFFD00FCFFFD00FCFF
      FD00FCFFFD00FCFFFD00FCFFFD00FCFFFD00F9FDFA00F9FDFA00F9FDFA00F9FD
      FA004B8B12004B8B12004B8B12004B8B12004B8B1200BED2C900AAD7E30047AD
      6D0047AD6D0099D6B30099D6B300F9FDFA00DCCDE200BC9BBB00BC9BBB008664
      A300AF7E5C00AF7E5C00AF7E5C006BB37500C9D7BE00FBFFFC00FBFFFC00FBFF
      FC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00F9FBF800F9FBF800F9FBF800F9FB
      F800948ECD00F9FBF800F9FBF800F9FBF8005E5CB400587ACD002C21B0002C21
      B0002C21B000948ECD00F9FBF800F9FBF800FCFFFD00C8BCDA00CECAE000B3AB
      D300AEA3D300B3ABD300E9E2ED00F8FAFF00FCFFFD00FCFFFD00FCFFFD00FCFF
      FD00FCFFFD00FCFFFD00FCFFFD00FCFFFD00F9FDFA00F9FDFA00F9FDFA00F9FD
      FA0086AE5D004B8B12004B8B12004B8B12004B8B1200BED2C900F9FDFA0099D6
      B30075CEA500F9FDFA00F9FDFA00F9FDFA00FBFFFC008664A300DCCDE200BC9B
      BB00AF7E5C00AF7E5C00DCCDE200FBFFFC00FBFFFC00FBFFFC00FBFFFC00FBFF
      FC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00F9FBF800F9FBF800F9FBF800F9FB
      F800D5D4DA00D5D4DA00F9FBF800948ECD005E5CB4002C21B0002C21B0002C21
      B0005E5CB400F9FBF800F9FBF800F9FBF800E4E4EF00C8BCDA00BBB5D600CECA
      E000CECAE000CECAE000FCFFFD00FCFFFD00FCFFFD00FCFFFD00FCFFFD00FCFF
      FD00FCFFFD00FCFFFD00FCFFFD00FCFFFD00F9FDFA00F9FDFA00F9FDFA00F9FD
      FA00F9FDFA0086AE5D004B8B12004B8B120086AE5D00F9FDFA00F9FDFA00F9FD
      FA00F9FDFA00F9FDFA00F9FDFA00F9FDFA00BC9BBB008664A300BC9BBB00DCCD
      E200C9D7BE00DCCDE200FBFFFC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00FBFF
      FC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00F9FBF800F9FBF800F9FBF800F9FB
      F800F9FBF800948ECD00948ECD005E5CB400587ACD00587ACD00587ACD005E5C
      B400F9FBF800F9FBF800F9FBF800F9FBF800DCDAEA00BBB5D600F0F0F400FFFC
      FB00FCFFFD00FFFCFB00FCFFFD00FCFFFD00FCFFFD00FCFFFD00FCFFFD00FCFF
      FD00FCFFFD00FCFFFD00FCFFFD00FCFFFD00F9FDFA00F9FDFA00F9FDFA00F9FD
      FA00F9FDFA0086AE5D00BED2C900F9FDFA00F9FDFA00F9FDFA00F9FDFA00F9FD
      FA00F9FDFA00F9FDFA00F9FDFA00F9FDFA00DCCDE200BC9BBB00FBFFFC00FBFF
      FC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00FBFF
      FC00FBFFFC00FBFFFC00FBFFFC00FBFFFC00F9FBF800F9FBF800F9FBF800F9FB
      F800F9FBF800F9FBF8005E5CB400D5D4DA00948ECD00D5D4DA00F9FBF800F9FB
      F800F9FBF800F9FBF800F9FBF800F9FBF800424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object QLeyendaEntidades: TQuery
    SQL.Strings = (
      
        'Select '#39'Incluye información: '#39' || InitCap (Replace (Replace (Nvl' +
        ' (:peTipo_Entidad, PkgCRGPViews.Todas_Entidades), '#39'ORG-DESC'#39', '#39'Ó' +
        'rganos descentralizados'#39'), '#39'|'#39', '#39', '#39')) Leyenda_Entidades'
      '  From Dual             ')
    Left = 774
    Top = 154
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end>
  end
  object QDetalles: TQuery
    SQL.Strings = (
      'Select Tipo_Entidad,'
      '       Cve_Estado,'
      '       PobEst.Desc_Poblacion Desc_Estado,'
      '       Cve_Ciudad,'
      '       PobCiu.Desc_Poblacion Desc_Ciudad, '
      '       Info.Cve_Poblacion,  '
      '       (Pct_PI / 100) Pct_PI, '
      '       Id_Acreditado,'
      '       Nom_Acred_Reg,'
      '       Id_Contrato,'
      '       Id_Credito, '
      '       Cve_Moneda,'
      '       --Producto1-- '
      '       (P1_Pct_Capital_Basico / 100) P1_Pct_Capital_Basico, '
      
        '       Round ((P1_Imp_Capital_Basico * 1000000) / :peFactor, Cas' +
        'e When :peFactor = 1000000 Then 0 Else 2 End)  P1_Imp_Capital_Ba' +
        'sico,'
      
        '       Round (P1_Sdo_Insoluto * Nvl (Pkgcrconsolidado1.Fnc_Obt_T' +
        'ipo_Cambio_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '                  '#39'D000'#39', '
      
        '                                                                ' +
        '                  Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                  Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                 ), 1) / :peFactor, Case When :peFactor = 100000' +
        '0 Then 0 Else 2 End) P1_Sdo_Insoluto,'
      '       --Producto2--'
      '       (P2_Pct_Capital_Basico / 100) P2_Pct_Capital_Basico, '
      
        '       Round ((P2_Imp_Capital_Basico * 1000000) / :peFactor, Cas' +
        'e When :peFactor = 1000000 Then 0 Else 2 End)  P2_Imp_Capital_Ba' +
        'sico,'
      
        '       Round (P2_Sdo_Insoluto * Nvl (Pkgcrconsolidado1.Fnc_Obt_T' +
        'ipo_Cambio_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '                  '#39'D000'#39', '
      
        '                                                                ' +
        '                  Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                  Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                 ), 1) / :peFactor, Case When :peFactor = 100000' +
        '0 Then 0 Else 2 End) P2_Sdo_Insoluto,'
      '       --Producto3--'
      '       (P3_Pct_Capital_Basico / 100) P3_Pct_Capital_Basico, '
      
        '       Round ((P3_Imp_Capital_Basico * 1000000) / :peFactor, Cas' +
        'e When :peFactor = 1000000 Then 0 Else 2 End)  P3_Imp_Capital_Ba' +
        'sico,'
      
        '       Round (P3_Sdo_Insoluto * Nvl (Pkgcrconsolidado1.Fnc_Obt_T' +
        'ipo_Cambio_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '                  '#39'D000'#39', '
      
        '                                                                ' +
        '                  Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                  Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                 ), 1) / :peFactor, Case When :peFactor = 100000' +
        '0 Then 0 Else 2 End) P3_Sdo_Insoluto,'
      '       --Producto4--'
      '       (P4_Pct_Capital_Basico / 100) P4_Pct_Capital_Basico, '
      
        '       Round ((P4_Imp_Capital_Basico * 1000000) / :peFactor, Cas' +
        'e When :peFactor = 1000000 Then 0 Else 2 End)  P4_Imp_Capital_Ba' +
        'sico,'
      
        '       Round (P4_Sdo_Insoluto * Nvl (Pkgcrconsolidado1.Fnc_Obt_T' +
        'ipo_Cambio_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '                  '#39'D000'#39', '
      
        '                                                                ' +
        '                  Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                  Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                 ), 1) / :peFactor, Case When :peFactor = 100000' +
        '0 Then 0 Else 2 End) P4_Sdo_Insoluto,'
      '       --Producto5--'
      '       (P5_Pct_Capital_Basico / 100) P5_Pct_Capital_Basico, '
      
        '       Round ((P5_Imp_Capital_Basico * 1000000) / :peFactor, Cas' +
        'e When :peFactor = 1000000 Then 0 Else 2 End)  P5_Imp_Capital_Ba' +
        'sico,'
      
        '       Round (P5_Sdo_Insoluto * Nvl (Pkgcrconsolidado1.Fnc_Obt_T' +
        'ipo_Cambio_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '                  '#39'D000'#39', '
      
        '                                                                ' +
        '                  Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                  Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                 ), 1) / :peFactor, Case When :peFactor = 100000' +
        '0 Then 0 Else 2 End) P5_Sdo_Insoluto,'
      '       --Producto6--'
      '       (P6_Pct_Capital_Basico / 100) P6_Pct_Capital_Basico, '
      
        '       Round ((P6_Imp_Capital_Basico * 1000000) / :peFactor, Cas' +
        'e When :peFactor = 1000000 Then 0 Else 2 End)  P6_Imp_Capital_Ba' +
        'sico,'
      
        '       Round (P6_Sdo_Insoluto * Nvl (Pkgcrconsolidado1.Fnc_Obt_T' +
        'ipo_Cambio_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '                  '#39'D000'#39', '
      
        '                                                                ' +
        '                  Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                  Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                 ), 1) / :peFactor, Case When :peFactor = 100000' +
        '0 Then 0 Else 2 End) P6_Sdo_Insoluto,'
      '       --Producto7--'
      '       (P7_Pct_Capital_Basico / 100) P7_Pct_Capital_Basico, '
      
        '       Round ((P7_Imp_Capital_Basico * 1000000) / :peFactor, Cas' +
        'e When :peFactor = 1000000 Then 0 Else 2 End)  P7_Imp_Capital_Ba' +
        'sico,'
      
        '       Round (P7_Sdo_Insoluto * Nvl (Pkgcrconsolidado1.Fnc_Obt_T' +
        'ipo_Cambio_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '                  '#39'D000'#39', '
      
        '                                                                ' +
        '                  Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                  Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                 ), 1) / :peFactor, Case When :peFactor = 100000' +
        '0 Then 0 Else 2 End) P7_Sdo_Insoluto,'
      '       --Producto8--'
      '       (P8_Pct_Capital_Basico / 100) P8_Pct_Capital_Basico, '
      
        '       Round ((P8_Imp_Capital_Basico * 1000000) / :peFactor, Cas' +
        'e When :peFactor = 1000000 Then 0 Else 2 End)  P8_Imp_Capital_Ba' +
        'sico,'
      
        '       Round (P8_Sdo_Insoluto * Nvl (Pkgcrconsolidado1.Fnc_Obt_T' +
        'ipo_Cambio_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '                  '#39'D000'#39', '
      
        '                                                                ' +
        '                  Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                  Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                 ), 1) / :peFactor, Case When :peFactor = 100000' +
        '0 Then 0 Else 2 End) P8_Sdo_Insoluto,'
      '       --Producto9--'
      '       (P9_Pct_Capital_Basico / 100) P9_Pct_Capital_Basico, '
      
        '       Round ((P9_Imp_Capital_Basico * 1000000) / :peFactor, Cas' +
        'e When :peFactor = 1000000 Then 0 Else 2 End)  P9_Imp_Capital_Ba' +
        'sico,'
      
        '       Round (P9_Sdo_Insoluto * Nvl (Pkgcrconsolidado1.Fnc_Obt_T' +
        'ipo_Cambio_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '                  '#39'D000'#39', '
      
        '                                                                ' +
        '                  Extract (Year  From :peFecha), '
      
        '                                                                ' +
        '                  Extract (Month From :peFecha)'
      
        '                                                                ' +
        '                 ), 1) / :peFactor, Case When :peFactor = 100000' +
        '0 Then 0 Else 2 End) P9_Sdo_Insoluto'
      
        '  From Table (Pkgcrgpviews.VW_CR_GP_Consolidado_Edos_Mun (:peFec' +
        'ha, :peTipo_Entidad, :peInt_Cob_Ant)) Info'
      
        '  Left Outer Join Poblacion PobEst On Info.Cve_Estado = PobEst.C' +
        've_Poblacion'
      
        '  Left Outer Join Poblacion PobCiu On Info.Cve_Ciudad = PobCiu.C' +
        've_Poblacion '
      ' Where Pct_PI Is Not Null'
      '   And (:peCartas_Cred = '#39'V'#39' Or Tipo_Credito = '#39'CRED'#39')'
      ' Order By Tipo_Entidad,'
      '          Cve_Estado,'
      '          Desc_Estado,'
      '          Cve_Ciudad,'
      '          Desc_Ciudad,'
      '          Id_Acreditado,'
      '          Nom_Acred_Reg,'
      '          Id_Contrato,'
      '          Id_Credito')
    Left = 632
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peInt_Cob_Ant'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peCartas_Cred'
        ParamType = ptUnknown
      end>
  end
end
