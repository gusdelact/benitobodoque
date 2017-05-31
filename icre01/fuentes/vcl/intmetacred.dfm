object WMetAcred: TWMetAcred
  Left = 298
  Top = 33
  Width = 719
  Height = 670
  Caption = 'Configuración de Anexo por Acreditado'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 713
    Height = 47
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 15
      Width = 51
      Height = 13
      Caption = 'Acreditado'
    end
    object lblPeriodo: TLabel
      Left = 552
      Top = 16
      Width = 57
      Height = 16
      Caption = 'Periodo : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtAcreditado: TEdit
      Left = 67
      Top = 11
      Width = 65
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edtNombre: TEdit
      Left = 139
      Top = 11
      Width = 361
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 47
    Width = 713
    Height = 562
    ActivePage = tabConsumoRevolvente
    Align = alTop
    Style = tsFlatButtons
    TabOrder = 1
    OnChange = PageControl1Change
    OnChanging = PageControl1Changing
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object AppModelo1: TAppModelo
        Left = 0
        Top = 0
        Width = 705
        Height = 531
        Align = alClient
        TabOrder = 0
        FechaEmpresa = 41346
        Modelo = Modelo1
        Interforma = InterForma1
        PuedeNuevo = True
        PuedeModificar = True
        PuedeConsultar = True
        PuedeDesactivar = True
        OnActualizaBotones = AppModelo1ActualizaBotones
        OnBtnAceptar = AppModelo1BtnAceptar
        OnBtnBuscar = AppModelo1BtnBuscar
        OnValidacion = AppModelo1Validacion
        OnCalcularCampos = AppModelo1CalcularCampos
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object AppModelo2: TAppModelo
        Left = 0
        Top = 0
        Width = 705
        Height = 531
        Align = alClient
        TabOrder = 0
        FechaEmpresa = 41346
        Modelo = Modelo2
        Interforma = InterForma1
        PuedeNuevo = True
        PuedeModificar = True
        PuedeConsultar = True
        PuedeDesactivar = True
        OnBtnAceptar = AppModelo2BtnAceptar
        OnValidacion = AppModelo1Validacion
        OnCalcularCampos = AppModelo2CalcularCampos
      end
    end
    object tsAnexo18: TTabSheet
      Caption = 'Metodología de Anexo 18'
      ImageIndex = 2
      object AppModAnexo18: TAppModelo
        Left = 0
        Top = 0
        Width = 705
        Height = 368
        Align = alClient
        TabOrder = 0
        FechaEmpresa = 42275
        Modelo = ModAnexo18
        Interforma = InterForma1
        PuedeNuevo = True
        PuedeModificar = True
        PuedeConsultar = True
        PuedeDesactivar = True
        OnBtnAceptar = AppModAnexo18BtnAceptar
      end
      object Panel2: TPanel
        Left = 0
        Top = 368
        Width = 705
        Height = 163
        Align = alBottom
        BevelInner = bvLowered
        BevelOuter = bvNone
        BevelWidth = 2
        BorderWidth = 1
        TabOrder = 1
        object Label40: TLabel
          Left = 244
          Top = 46
          Width = 10
          Height = 13
          Caption = 'PI'
        end
        object Consola: TLabel
          Left = 304
          Top = 72
          Width = 38
          Height = 13
          Caption = 'Consola'
        end
        object GroupBox1: TGroupBox
          Left = 11
          Top = 38
          Width = 224
          Height = 115
          Caption = 'Severidad de la Perdida por Contrato'
          TabOrder = 0
          object sagSevPerdida: TStringAlignGrid
            Left = 3
            Top = 15
            Width = 218
            Height = 98
            ColCount = 3
            DefaultRowHeight = 18
            TabOrder = 0
            Alignment = alRight
            Editable = False
            AutoAdjustLastCol = True
            ColWidths = (
              1
              96
              114)
            Cells = (
              1
              0
              'Contrato'
              2
              0
              'SP')
            PropCell = ()
            PropCol = (
              1
              1
              2
              0
              2
              1
              2
              0)
            PropRow = ()
            PropFixedCol = ()
            PropFixedRow = (
              0
              1
              2
              0)
          end
        end
        object edProbInc: TEdit
          Left = 256
          Top = 40
          Width = 39
          Height = 21
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          ReadOnly = True
          TabOrder = 1
        end
        object btnGenerarLayoutAnexo18: TBitBtn
          Left = 304
          Top = 8
          Width = 161
          Height = 25
          Caption = 'Generar layout Anexo 18'
          TabOrder = 2
          OnClick = btnGenerarLayoutAnexo18Click
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000232E0000232E00000000000000000000427750427450
            3F704D3D6C4A3561433A64483A62483459402E513A2C503C244A391D48351744
            3115422F153C2B0E3120618F6E709C7C77A1837AA2867DA1897B9C867B998579
            948277928073917E688B77688D7A608876608A77436B59173928698B7293B49B
            D9F7E1DBF6E3DAF4E2D3EADBDAEFE1D6E9DDD7EBDED0EBD6CAE8D1CBEBD4C5E7
            D0C4E6D1688976203E2E748D7A98B19FE0F8E7DCF5E3E0F6E6DFF5E7DEF2E4D7
            EBDDD5EADBD3EED4D2EFD1CAECCDCCECD0C9E8CF6D8A7428433178947E9FBBA4
            B6D3BC8CAB9189AA8F86A88D89AC8F8AAE8F7FA585527F552B5A2C204E222C55
            2F5075556D8D732846317297789CC3A18CB59143704A47784E497E513C74442F
            6A3736733E68AB6F48894E438049356C3DA3D3AD669073274D367CA3819ABE9F
            D2F4D78FBD9475AD7B6DAE745298583B854271BB7855A45F46914F31733A4B83
            54B8E9C469967928523C869E8AAEC0B1EAFBEBE3FAE482B1845797593E89407B
            C67B5FA75F53A15A3A7F40437744527754BBDBC3719481294E3E91B09AA4BDAD
            E7FBEFDEFDE5C7F4CE599C607AC68169B56F5FA664458F4D81C086CDF5CDD3F4
            D3D1EFD872938230554581AD91A4C7B2E1FCEDD4F4E088BB9389CC9575BE8167
            AD7258996252975C4F8D55ADDAAED7F7D7D1EFD8769886385D4D8ABA99A2C8AF
            D5EFE094B89F9BCBA686C19179B885669E706EA07776B3805E9765578158C1E0
            C2D4F2DB799D893A604F92BF9CAED2B7ACC7B3B3CEB89DC1A28FBC9580AF87B0
            D4B590B1947CAE847FB1856D936F59785BC5E5CC799F88365E4A99BE9DB9D3BB
            CADBCBB7C8B8ADC4ADA0C0A1C8E5C9EEFFEED9ECD99FC8A795BD9B96B59794B3
            97CCEDD47CA48B416B549FBEA1B6CDB8F2FEF3F4FFF5ECFEEDE8FEECE5FDE8EB
            FDECEEFBF0DEFEE7DAFDE2DFFBE1DEFAE0D7F6DE789F87426D55A3C4AAA9C3B0
            BACBBFBBCBC1B5CCBCAAC9B2A7C6AFADC5B5ADC0B49FC0A99EC1A6A1BFA596B1
            9993B49A6E987E4572588FB49BA4C1AFA4BAB0A1B6AC98B5A58FB69E8AB19889
            AB98869F947A9C87789980739077728F756B8D735E896E48755A}
          Layout = blGlyphRight
        end
        object btnCargarAnexo18: TBitBtn
          Left = 521
          Top = 8
          Width = 160
          Height = 25
          Caption = 'Carga masiva Anexo 18'
          TabOrder = 3
          OnClick = btnCargarAnexo18Click
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            20000000000000040000C40E0000C40E00000000000000000000000000000000
            00000000000000000000000000002AAAD4060E78DB24005CD0211E83D821227C
            CE251B91DA1C0000000000000000000000000000000000000000000000000000
            00000000000000000000000000001999E5140E77DB7A005AD1711D84D6701F81
            D0781E91DD6B0000000000000000000000000000000000000000000000000000
            00000000000000000000000000000F64B9210560CAB90167E0B92696E2B934A5
            EAB90F56ACA00000000000000000000000000000000000000000000000000000
            00000000000000000000000000000754A924035CCBCE0065ECCE269DF1CE55C9
            FDCE1561B7AA0000000000000000000000000000000000000000000000000000
            00000000000000000000000000000659AC280468D2E5007DFBE51E99FBE53BBF
            FEE50C5AB7BC0000000000000000000000000000000000000000000000000000
            00000000000000000000000000000B54AF2D0474D5FF0199FFFF18A3FFFF1EAC
            FFFF0450B7D10000000000000000000000000000000000000000000000000000
            00000000000000000000000000000558AB2B087CD6FF0AABFFFF19AAFEFF13A4
            FFFF0250B9D10000000000000000000000000000000000000000000000000055
            AA0300197F0A001F7F0800006D0700288733097ED6FF0CB0FFFF1AABFFFF0FA2
            FFFF023CA2CA00006D0700005F080019660A0055AA03000000000034A3350035
            9B940045A6F50248A7E9023B96E30133A3E40273E0FF049DFFFF16A3FFFF12A5
            FFFF0D5DB8EF032D84E207479CE9235796F5064EAB950063CB36003AA9390047
            B792016CD8FF1CB9FBFF09A8FFFF0391FFFF007CFFFF0172FEFF1390FEFF0D9F
            FFFF1AAAFFFF24BCFFFF49E4FFFF3CA5D8FF0A68CC8E0068D13800000000004E
            C40D0035A8990253B7FF1CB9FBFF008AFFFF006EF5FF0269F0FF1186F8FF048A
            FFFF11AAFFFF3CD3FFFF2679C2FF003FB595005CD00B00000000000000000000
            000000000000001678890045ADFD1CB9FBFF006DF4FF026AE6FF1087F3FF0191
            FFFF1CB9FBFF165EA2FB001B8881000000000000000000000000000000000000
            00000000000000007F0200043B77002D78FD1CB9FBFF0269F7FF118DFDFF1CB9
            FBFF08478AFB000045710000FF01000000000000000000000000000000000000
            000000000000000000000000000000000064001B52F71CB9FBFF1CB9FBFF0132
            6EF60000105E0000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000054001D52F3002860F00000
            004F000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000001600051CB4000822B00000
            0013000000000000000000000000000000000000000000000000}
          Layout = blGlyphRight
        end
        object ConsoleAnexo18: TMemo
          Left = 304
          Top = 88
          Width = 377
          Height = 65
          ScrollBars = ssBoth
          TabOrder = 4
          WordWrap = False
        end
        object pgAnexo18: TProgressBar
          Left = 392
          Top = 67
          Width = 289
          Height = 17
          Min = 0
          Max = 100
          TabOrder = 5
          Visible = False
        end
        object btnExportarAnexo18: TBitBtn
          Left = 304
          Top = 32
          Width = 161
          Height = 25
          Caption = 'Exportar Anexo 18 Vigente'
          TabOrder = 6
          OnClick = btnExportarAnexo18Click
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            20000000000000040000C40E0000C40E00000000000000000000000000000000
            000000000000000000000000000000000000000000000969158303640F870000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000E65167D14671FFF0E6919FF035D
            0B80000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000F67178010661AFF006000FF007C04FF0D8E
            1BFF015B09800000000000000000000000000000000000000000000000000000
            00000000000000000000156E1C842E7B35FF087D14FF009509FF00A70DFF06B8
            17FF1EA92DFF005A078400000000000000000000000000000000000000000000
            0000000000001F7C268B509054FF3B9C43FF30B23AFF28BC36FF16BC26FF24C8
            33FF2EDC3EFF2FBA3FFF005E038C000000000000000000000000000000000000
            00002A88349B77A979FF6EB172FF5DC463FF59CD61FF59D262FF2ED33EFF3DE2
            4CFF48F258FF51FF61FF3ED34DFF006E089B00000000000000000000000052B7
            65A4AEDDB1FFADD5ACFFA0E4A2FF9EECA1FF89E38EFF7AE581FF41EB52FF5DFF
            6DFF77FF85FF78FF89FF6FFF82FF5FF774FF1B7629A500000000000000002362
            2A6D1E5B259E134D15830442096B558E5CBCB2F3B5FF95F59BFF56FF66FF92FF
            A0FF0B5211B3073B09670A460E7F08480D970019006F00000002000000000000
            00000000000000000000000000000038004DB6EEB7FFA8FFAEFF77FF86FFBCFC
            C3FF002B00410000000000000000000000000000000000000000000000000000
            000000000000000000000000000000720064BEF1C0FFB2FFB7FF88FF96FFD0FF
            D7FF003A00570000000000000000000000000000000000000000000000000000
            000000000000000000000000000000940267BDF3BFFFB1FEB5FF7AFF88FFBBFF
            C4FF003B005A0000000000000000000000000000000000000000000000000000
            00000000000000000000000000000EB01A68B3EEB5FFA7F4AAFF5FFF6EFF8BFF
            9BFF003F005D0000000000000000000000000000000000000000000000000000
            00000000000000000000000000001DBD2E69A0E5A2FF90E795FF51F85FFF6CFC
            7FFF0041005D0000000000000000000000000000000000000000000000000000
            00000000000000000000000000001DCB2B5E7ED584FF6CD673FF3BDE48FF58E8
            6CFF004000530000000000000000000000000000000000000000000000000000
            00000000000000000000000000000C8C132858C362B036B9409619C1289641D7
            57AF002500220000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000002F8F3F10007F1F08009F00082DC3
            3C11000000000000000000000000000000000000000000000000}
          Layout = blGlyphRight
        end
      end
    end
    object tsAnexo19: TTabSheet
      Caption = 'Metodología de Anexo 19'
      ImageIndex = 3
      object AppModAnexo19: TAppModelo
        Left = 0
        Top = 0
        Width = 705
        Height = 377
        Align = alClient
        TabOrder = 0
        FechaEmpresa = 42275
        Modelo = ModAnexo19
        Interforma = InterForma1
        PuedeNuevo = True
        PuedeModificar = True
        PuedeConsultar = True
        PuedeDesactivar = True
        OnBtnAceptar = AppModAnexo19BtnAceptar
        OnCalcularCampos = AppModAnexo19CalcularCampos
      end
      object Panel3: TPanel
        Left = 0
        Top = 377
        Width = 705
        Height = 154
        Align = alBottom
        BevelInner = bvLowered
        BevelWidth = 2
        BorderWidth = 1
        TabOrder = 1
        object Label2: TLabel
          Left = 16
          Top = 16
          Width = 103
          Height = 13
          Caption = 'Contratos y Proyectos'
        end
        object dbgAnexo19: TDBGrid
          Left = 16
          Top = 32
          Width = 561
          Height = 113
          DataSource = DSContratosAnexo19
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object BitBtn1: TBitBtn
          Left = 584
          Top = 32
          Width = 107
          Height = 25
          Action = actModificarContratosAnexo19
          Caption = 'Modificar'
          TabOrder = 1
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00A5A5A5FFA1A1A1FFA0A1A1FFA0A1A1FFA0A1A1FFA1A1A1FFA1A1
            A1FFA1A1A1FFA1A1A1FFA6A6A6FFBBBBBBFFFF00FF00FF00FF00FF00FF00FF00
            FF00A6A7A7FFDBDBDBFFE2E2E2FFE4E4E4FFE4E4E4FFE4E4E4FFE4E5E4FFE5E5
            E5FFE6E6E6FFE6E6E6FFE4E2E4FFBDA1C0FFD7BADFFFFF00FF00FF00FF00FF00
            FF00A3A3A3FFEBEBEBFFF5F5F5FFF7F7F7FFF9F9F9FFF9F9F9FFFAFAFAFFFAFA
            FAFFFBFBFBFFF3F7F9FFD8E4EDFFCD97D9FFC99CD9FFE8C7F2FFFF00FF00FF00
            FF00A1A1A1FFE7E7E7FFF1F1F1FFF3F3F3FFF6F6F6FFF8F8F8FFF9F9F9FFFAFA
            FAFFF1F6F8FF9CD9E5FF5EBED2FF92B1D2FFCEA9DBFFEFCEF5FFFF00FF00FF00
            FF00A0A0A0FFE4E4E4FFEEEEEEFFF0F0F0FFF2F2F2FFF5F5F5FFF7F7F7FFF4F7
            F8FFAEDCE7FF48BBD0FF33BFDCFF78CADDFFFF00FF00FF00FF00FF00FF00FF00
            FF009F9F9FFFE2E2E2FFEBEBEBFFEDECECFFEFEFEFFFF1F1F1FFEFF2F3FFB2DC
            E7FF4ABAD0FF3ABBD6FF6DCCE0FF6DB4C1FFFF00FF00FF00FF00FF00FF00FF00
            FF009F9F9FFFE2E2E2FFE9E9E9FFEAEAEAFFEBEBEBFFE5EAECFFA7D6E1FF49BA
            CFFF41BDD8FF6CCADEFFABD8E4FFADAEAEFFFF00FF00FF00FF00FF00FF00FF00
            FF009F9F9FFFE2E2E2FFE9E9E9FFE9E9E9FFE6E7E8FFA4D2DDFF4AB9CEFF3BBE
            D8FF6DCADEFFADDAE3FFECF1F2FFAFAFAFFFFF00FF00FF00FF00FF00FF00FF00
            FF00A0A0A0FFE2E2E2FFE9E9E9FFE7E6E8FFAFD2DBFF50B9CEFF31BCDAFF79CE
            E0FFA3D3DEFFE7EDEEFFF1F1F1FFADADADFFFF00FF00FF00FF00FF00FF00FF00
            FF00A1A1A1FFE5E5E5FFE8E8E8FFBED5DCFF4FB8CDFF35BCD9FF7ECFE2FF86C9
            D7FFE7E9E9FFEDEDEDFFEDEDEDFFABABABFFFF00FF00FF00FF00FF00FF00FF00
            FF00A2A2A2FFE7E7E7FFB5B5B5FF65828AFF42AEC5FF69C8DDFF8FCBD8FFE4E5
            E6FFE9E9E9FFEAEAEAFFE9E9E9FFA9A9A9FFFF00FF00FF00FF00FF00FF00FF00
            FF00A3A3A3FFE9E9E9FF5C5C5CFF343E3FFF6D929BFF9DC7D1FFE1E6E6FFE9E9
            E9FFE9E9E9FFE9E9E9FFE6E6E6FFA7A7A7FFFF00FF00FF00FF00FF00FF00FF00
            FF00A4A4A4FFECECECFF8A8A8AFF707172FF989A9BFFDEE0E1FFEBEBEBFFEAEA
            EAFFE9E9E9FFE9E9E9FFE6E6E6FFA6A6A6FFFF00FF00FF00FF00FF00FF00FF00
            FF00A5A5A5FFEDEDEDFFF5F4F5FFF3F3F3FFF2F1F2FFF0F0F0FFEFEEEEFFEDED
            EDFFEBEBEBFFEAEAEAFFE6E6E6FFA7A7A7FFFF00FF00FF00FF00FF00FF00FF00
            FF00A7A7A7FFD2D2D2FFD8D8D8FFD7D7D7FFD6D6D6FFD5D5D5FFD4D4D4FFD2D2
            D2FFD2D2D2FFD0D0D0FFCDCDCDFFA5A5A5FFFF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00A9A9A9FFA5A5A5FFA5A5A5FFA5A5A5FFA4A4A4FFA4A4A4FFA4A4
            A4FFA4A4A4FFA3A3A3FFA7A7A7FFFF00FF00FF00FF00FF00FF00}
        end
        object BitBtn2: TBitBtn
          Left = 584
          Top = 64
          Width = 107
          Height = 25
          Action = actAceptarContratosAnexo19
          Caption = 'Aceptar'
          TabOrder = 2
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00ABA292FF5E6735FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00697849FF3FC45AFF537F3DFFFF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF004A9A45FF58E992FF4CD274FF537936FFFF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00758E5BFF5BCF7AFF7CE8ABFF6DE8A3FF51CE74FF557D38FFFF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0043943CFF89EEB5FF96F3C5FF8AEBB8FF79ECAFFF50CC72FF578139FFFF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0082A4
            6FFF6CCE82FFA1FAD1FF5CCD76FF78E6A5FF95F3C8FF7CF2B8FF4FC86DFF5D89
            43FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004494
            38FF98FCC9FF5EC773FF407D24FF409836FF6CE398FF91F9CCFF7CF7C1FF4BC3
            64FF6A9652FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF0090B885FF5AD0
            7AFF5FD57FFF5D994BFFFF00FF00FF00FF00439131FF51CB6DFF81F9C6FF7AFE
            CAFF44C05DFF70A15BFFFF00FF00FF00FF00FF00FF00FF00FF0041A03CFF44D0
            62FF57A04AFFFF00FF00FF00FF00FF00FF00FF00FF006AA459FF3AB446FF6EF2
            B3FF72FFD0FF3FBB53FF82B272FFFF00FF00FF00FF00FF00FF002C9824FF4CA4
            41FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002D9F
            25FF59E896FF69FFD2FF38B849FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF003EA233FF42D46EFF65FCBEFF34B746FFFF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF006AB564FF2FBE47FF5BF5A4FF2CB33BFFFF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF0033B53EFF44DD69FF2CB12FFFFF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0043B746FF1DAC1EFFFF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object BitBtn3: TBitBtn
          Left = 584
          Top = 96
          Width = 107
          Height = 25
          Action = actCancelarContratosAnexo19
          Caption = 'Cancelar'
          TabOrder = 3
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF005555C2FF5555C2FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF005555C2FF5555C2FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF004D4DC0FF1C1CB2FF1C1CB2FF4D4DC0FFFF00FF00FF00FF00FF00FF00FF00
            FF004D4DC0FF1C1CB2FF1C1CB2FF4D4DC0FFFF00FF00FF00FF00FF00FF005B5B
            C5FF2121B5FF3B3BC8FF3B3BC8FF2121B5FF5050C3FFFF00FF00FF00FF005050
            C3FF2121B5FF3C3CC8FF3B3BC8FF2121B5FF5B5BC5FFFF00FF00FF00FF005D5D
            C7FF2525B7FF4545CDFF4141CCFF4646CDFF2525B7FF5252C3FF5252C3FF2525
            B7FF4646CDFF4242CCFF4545CDFF2525B7FF5D5DC7FFFF00FF00FF00FF00FF00
            FF005555C5FF2A2ABBFF5050D1FF4A4AD0FF5050D1FF2F2FBEFF2F2FBEFF5050
            D1FF4A4AD0FF5050D1FF2A2ABBFF5555C5FFFF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF005757C7FF3131BDFF5959D6FF5252D4FF5B5BD7FF5B5BD7FF5353
            D4FF5959D6FF3131BDFF5757C7FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF005A5AC8FF3939C2FF6565DBFF6363DBFF6363DBFF6565
            DBFF3939C2FF5A5AC8FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF005C5CCAFF3F3FC6FF6E6EDFFF6A6ADFFF6A6ADFFF6E6E
            DFFF4040C6FF5C5CCAFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF005F5FCCFF3F3FC7FF7676E3FF6A6AE1FF7777E4FF7777E4FF6969
            E1FF7676E3FF3F3FC7FF5F5FCCFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF006161CDFF4242C8FF7E7EE6FF7171E4FF7F7FE6FF4848CBFF4848CBFF7F7F
            E6FF7272E4FF7E7EE6FF4343CAFF6161CDFFFF00FF00FF00FF00FF00FF006D6D
            D1FF4848CAFF8686E7FF7878E5FF8888E7FF4949CAFF6464CFFF6464CFFF4949
            CAFF8888E7FF7979E5FF8787E7FF4848CAFF6D6DD1FFFF00FF00FF00FF007070
            D3FF4E4ECCFF8F8FE9FF9090E9FF4F4FCCFF6666D1FFFF00FF00FF00FF006666
            D1FF4F4FCCFF9090E9FF8F8FE9FF4E4ECCFF7070D3FFFF00FF00FF00FF00FF00
            FF006969D2FF5252CDFF5353CDFF6969D2FFFF00FF00FF00FF00FF00FF00FF00
            FF006969D2FF5454CEFF5454CDFF6969D2FFFF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF007474D5FF7474D5FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF007474D5FF7474D5FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
      end
    end
    object tabConsumoRevolvente: TTabSheet
      Caption = 'Consumo Revolvente'
      ImageIndex = 4
      object AppModConsumoRevolvente: TAppModelo
        Left = 0
        Top = 0
        Width = 705
        Height = 531
        Align = alClient
        TabOrder = 0
        FechaEmpresa = 42458
        Modelo = ModConsumoRevolvente
        Interforma = InterForma1
        PuedeNuevo = True
        PuedeModificar = True
        PuedeConsultar = True
        PuedeDesactivar = True
        OnBtnAceptar = AppModConsumoRevolventeBtnAceptar
        OnCalcularCampos = AppModConsumoRevolventeCalcularCampos
      end
    end
  end
  object PnDatos: TPanel
    Left = 1
    Top = 613
    Width = 712
    Height = 19
    TabOrder = 2
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
      Left = 464
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
      Left = 464
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
      Left = 528
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
      Left = 528
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
    Left = 392
    Top = 96
  end
  object Modelo1: TModelo
    ID_Modelo = 0
    FechaEmpresa = 41365
    Interforma = InterForma1
    Left = 42
    Top = 91
  end
  object Modelo2: TModelo
    ID_Modelo = 0
    FechaEmpresa = 41365
    Interforma = InterForma1
    Left = 74
    Top = 91
  end
  object qryMetodologia: TQuery
    DatabaseName = 'BCORP'
    SQL.Strings = (
      'Select Anx.Id_Acreditado, '
      '       Anx.EntidadFinanciera, '
      '       Anx.FechaInfoFinanciera, '
      '       Nvl (Anx.VentasTotales, 0) VentasTotales, '
      '       V.TVentas,'
      '       Case To_Number (Anx.EntidadFinanciera)'
      '         --Si es Entidad Financiera, es Anexo 20 '
      '         When 1 Then 10  ---- Anexo 20 '
      
        '         --Si no es Entidad Financiera, verifica sus ventas y la' +
        ' antiguedad de la información financiera                        ' +
        '          '
      '         When 2 Then'
      
        '                                                                ' +
        '             --$74,415,026.00'
      
        '           Case When (To_Number (Nvl (Anx.VentasTotales, 0)) <  ' +
        'To_Number (Nvl (V.TVentas, 0))) Or '
      
        '                     Round (To_Number (Nvl (To_Date (F.F_Reporte' +
        ', '#39'dd/mm/yyyy'#39') - To_Date (Anx.FechaInfoFinanciera, '#39'dd/mm/yyyy'#39 +
        '), 0)) / 30.4, 0) >  18 '
      
        '                Then 2  ---- Anexo 21                           ' +
        '             --$74,415,026.00'
      
        '                When (To_Number (Nvl (Anx.VentasTotales, 0)) >= ' +
        'To_Number (Nvl (V.TVentas, 0))) Or '
      
        '                     Round (To_Number (Nvl (To_Date (F.F_Reporte' +
        ', '#39'dd/mm/yyyy'#39') - To_Date (Anx.FechaInfoFinanciera, '#39'dd/mm/yyyy'#39 +
        '), 0)) / 30.4, 0) <= 18'
      '               Then 11 ---- Anexo 22'
      '                Else 17'
      '          End  '
      '       End Anexo,'
      
        '       Round (To_Number (Nvl (To_Date (F.F_Reporte, '#39'dd/mm/yyyy'#39 +
        ') - To_Date (Anx.FechaInfoFinanciera, '#39'dd/mm/yyyy'#39'), 0) ) / 30.4' +
        ', 0) Meses '
      '  From File_AnxCartComer Anx,'
      '      (Select Cve_Valor_Adic Tventas '
      '         From Cr_Con_Cat_Data '
      '        Where Cve_Con_Gpo_Cat = '#39'CAT_COM_VENT_TOT'#39') V,'
      '      (Select To_Date (Cve_Clave, '#39'YYYYMMDD'#39') As F_Reporte'
      '         From Admiprod.CR_Con_Cat_Data '
      '        Where Cve_Con_Gpo_Cat = '#39'CAT_SICC_FECHA'#39
      '          And Cve_Valor_Adic = '#39'V'#39') F'
      ' Where Anx.ID_Acreditado = :peID_Acreditado')
    Left = 46
    Top = 140
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peId_acreditado'
        ParamType = ptUnknown
      end>
    object qryMetodologiaID_ACREDITADO: TFloatField
      FieldName = 'ID_ACREDITADO'
    end
    object qryMetodologiaENTIDADFINANCIERA: TMemoField
      FieldName = 'ENTIDADFINANCIERA'
      BlobType = ftMemo
      Size = 4000
    end
    object qryMetodologiaFECHAINFOFINANCIERA: TMemoField
      FieldName = 'FECHAINFOFINANCIERA'
      BlobType = ftMemo
      Size = 4000
    end
    object qryMetodologiaVENTASTOTALES: TMemoField
      FieldName = 'VENTASTOTALES'
      BlobType = ftMemo
      Size = 4000
    end
    object qryMetodologiaTVENTAS: TStringField
      FieldName = 'TVENTAS'
    end
    object qryMetodologiaANEXO: TFloatField
      FieldName = 'ANEXO'
    end
  end
  object qryGarantias: TQuery
    DatabaseName = 'BCORP'
    SQL.Strings = (
      'select '
      
        'IMP_VALUACION, NUEVA_VALUACION, PROMOTOR, CVE_ORIGEN, CVE_MONEDA' +
        ', DESC_MONEDA, CVE_MONEDA_OTORGANTE, '
      
        'DESC_MONEDA_OTORGANTE, ID_ACREDITADO, TIPO_CAMBIO, ID_OTORGANTE,' +
        ' TIPO_CAMBIO_OTORGANTE, ID_CREDITO, '
      
        'OTORGANTE, SDO_INSOLUTO, IMP_CREDITO, SDO_INSOLUTO2, IMP_CREDITO' +
        '2, IMP_DISPUESTO2, EMISORA, SERIE, '
      
        'TIPO_VALOR, FH_CAPTURA, NUM_TITULOS_VIRT, ID_CONTRATO, NOMBRE_PR' +
        'OMOTOR, NOMBRE_OTORGANTE, NOMBRE_ACREDITADO, '
      
        'SIT_CREDITO, BURSATILIDAD, PROPORCION, F_INICIO, F_VENCIMIENTO, ' +
        'TASA_INTERES, ID_PERS_ASOCIAD, IMP_DISPUESTO, '
      
        'FACT_PROPOR_GAR, SDO_GRTIA, ID_EMPRESA, CVE_DIA_LIQUIDA, TIPO_CA' +
        'MBIO_EMISORA, CVE_MONEDA_EMISORA, '
      
        'ABRE_MONEDA_EMISORA, DESC_MONEDA_EMISORA, EMISORA_SERIE, PREC_VA' +
        'LUACION, IMP_VALUACION_ORI, INTERES, IMP_VALUACION_EMISORA, '
      'T_IMP_VALUACION ,gubernamental'
      'from ('
      #9#9'SELECT   (a.imp_valuacion_ori + a.interes) AS imp_valuacion,'
      
        #9#9'         (a.imp_valuacion_ori + a.interes) / a.proporcion AS n' +
        'ueva_valuacion,'
      #9#9'         a.*,'
      
        #9#9'         ROUND ((a.imp_valuacion_ori + a.interes) * a.tipo_cam' +
        'bio_emisora,'
      #9#9'                2'
      #9#9'               ) AS imp_valuacion_emisora'
      
        #9#9#9#9' ,sum(ROUND ((a.imp_valuacion_ori + a.interes) * a.tipo_camb' +
        'io_emisora, 2)) '
      
        #9#9#9#9' '#9#9#9'over(partition by a.ID_ACREDITADO, a.id_contrato, a.EMIS' +
        'ORA order by a.ID_ACREDITADO, a.EMISORA) as t_imp_valuacion'
      #9#9#9#9' ,ROW_NUMBER () '
      
        #9#9#9#9' '#9#9#9'over(partition by a.ID_ACREDITADO, a.id_contrato, a.EMIS' +
        'ORA order by a.ID_ACREDITADO, a.EMISORA) as renglon'#9#9#9#9#9#9#9' '
      
        #9#9'    FROM (SELECT temp.*, temp.emisora || temp.serie AS emisora' +
        '_serie,'
      #9#9'                 NVL'
      #9#9'                    (pkgfunproccorp.preciomercado'
      
        #9#9'                                         (pkgfunproccorp.frefe' +
        'rencia ('#39'FMAN'#39','
      
        #9#9'                                                              ' +
        '        1'
      
        #9#9'                                                              ' +
        '       ),'
      #9#9'                                          temp.emisora,'
      #9#9'                                          temp.serie,'
      #9#9'                                          temp.tipo_valor'
      #9#9'                                         ),'
      #9#9'                     0'
      #9#9'                    ) prec_valuacion,'
      #9#9'                 NVL'
      #9#9'                    (pkgderivaluacion.valuamercado'
      #9#9'                        (temp.emisora,'
      #9#9'                         temp.serie,'
      #9#9'                         temp.tipo_valor,'
      
        #9#9'                         pkgfunproccorp.freferencia (temp.cve_' +
        'dia_liquida,'
      
        #9#9'                                                     temp.id_e' +
        'mpresa'
      #9#9'                                                    ),'
      #9#9'                         temp.num_titulos_virt,'
      #9#9'                         NVL'
      #9#9'                            (pkgfunproccorp.preciomercado'
      
        #9#9'                                         (pkgfunproccorp.frefe' +
        'rencia ('#39'FMAN'#39','
      
        #9#9'                                                              ' +
        '        1'
      
        #9#9'                                                              ' +
        '       ),'
      #9#9'                                          temp.emisora,'
      #9#9'                                          temp.serie,'
      #9#9'                                          temp.tipo_valor'
      #9#9'                                         ),'
      #9#9'                             0'
      #9#9'                            ),'
      #9#9'                         '#39'V'#39
      #9#9'                        ),'
      #9#9'                     0'
      #9#9'                    ) AS imp_valuacion_ori,'
      #9#9'                 NVL'
      #9#9'                    (pkgderivaluacion.valuainteres'
      #9#9'                           (temp.emisora,'
      #9#9'                            temp.serie,'
      #9#9'                            temp.tipo_valor,'
      
        #9#9'                            pkgfunproccorp.freferencia (temp.c' +
        've_dia_liquida,'
      
        #9#9'                                                        temp.i' +
        'd_empresa'
      #9#9'                                                       ),'
      #9#9'                            temp.num_titulos_virt,'
      #9#9'                            DECODE (temp.id_empresa,'
      
        #9#9'                                    5, temp.cve_moneda_emisora' +
        ','
      #9#9'                                    484'
      #9#9'                                   ),'
      #9#9'                            '#39'V'#39
      #9#9'                           ),'
      #9#9'                     0'
      #9#9'                    ) AS interes'
      
        #9#9'            FROM (SELECT persona.nombre AS promotor, cc.cve_or' +
        'igen,'
      
        #9#9'                         contrato_cre.cve_moneda, m.desc_moned' +
        'a,'
      
        #9#9'                         mo.cve_moneda AS cve_moneda_otorgante' +
        ','
      
        #9#9'                         mo.desc_moneda AS desc_moneda_otorgan' +
        'te,'
      
        #9#9'                         contrato_cre.id_titular AS id_acredit' +
        'ado,'
      #9#9'                         contrato_cre.tipo_cambio,'
      #9#9'                         cto.id_titular AS id_otorgante,'
      #9#9'                         pkgcrecauciones.obttipocambio'
      #9#9'                            (484,'
      #9#9'                             mo.cve_moneda,'
      
        #9#9'                             pkgfunproccorp.freferencia ('#39'FMAN' +
        #39', 2)'
      #9#9'                            ) AS tipo_cambio_otorgante,'
      #9#9'                         sdcr.id_referencia AS id_credito,'
      #9#9'                         gpe.id_contrato AS otorgante,'
      
        #9#9'                         ROUND ((  (cc.sdo_insoluto + cc.imp_c' +
        'apital_vdo)'
      #9#9'                                 * contrato_cre.tipo_cambio'
      #9#9'                                ),'
      #9#9'                                2'
      #9#9'                               ) AS sdo_insoluto,'
      
        #9#9'                         ROUND ((cc.imp_credito * contrato_cre' +
        '.tipo_cambio),'
      #9#9'                                2'
      #9#9'                               ) AS imp_credito,'
      #9#9'                         (cc.sdo_insoluto + cc.imp_capital_vdo'
      #9#9'                         ) AS sdo_insoluto2,'
      #9#9'                         cc.imp_credito AS imp_credito2,'
      
        #9#9'                         cc.imp_dispuesto AS imp_dispuesto2, g' +
        'pe.emisora,'
      
        #9#9'                         gpe.serie, gpe.tipo_valor, gpe.fh_cap' +
        'tura,'
      
        #9#9'                         sdcr.num_titulos_virt, cc.id_contrato' +
        ','
      #9#9'                         SUBSTR'
      #9#9'                            (pkgcrecauciones.clientepromotor'
      
        #9#9'                                                    (contrato_' +
        'cre.id_contrato,'
      
        #9#9'                                                     '#39'NOMBRE_P' +
        'ROMOTOR'#39','
      
        #9#9'                                                     '#39'APELLIDO' +
        #39
      #9#9'                                                    ),'
      #9#9'                             1,'
      #9#9'                             80'
      #9#9'                            ) AS nombre_promotor,'
      #9#9'                         SUBSTR'
      #9#9'                            (pkgcrecauciones.clientepromotor'
      
        #9#9'                                                            (c' +
        'to.id_contrato,'
      
        #9#9'                                                             '#39 +
        'NOMBRE_CLIENTE'#39','
      
        #9#9'                                                             '#39 +
        'APELLIDO'#39
      #9#9'                                                            ),'
      #9#9'                             1,'
      #9#9'                             80'
      #9#9'                            ) AS nombre_otorgante,'
      #9#9'                         SUBSTR'
      #9#9'                            (pkgcrecauciones.clientepromotor'
      
        #9#9'                                                            (c' +
        'c.id_contrato,'
      
        #9#9'                                                             '#39 +
        'NOMBRE_CLIENTE'#39','
      
        #9#9'                                                             '#39 +
        'APELLIDO'#39
      #9#9'                                                            ),'
      #9#9'                             1,'
      #9#9'                             80'
      #9#9'                            ) AS nombre_acreditado,'
      #9#9'                         cc.sit_credito,'
      #9#9'                         SUBSTR'
      
        #9#9'                            (pkgfunproccorp.bursatilidad (gpe.' +
        'emisora,'
      
        #9#9'                                                          gpe.' +
        'serie,'
      
        #9#9'                                                          gpe.' +
        'tipo_valor,'
      
        #9#9'                                                          '#39'DES' +
        'CRIPCION'#39
      #9#9'                                                         ),'
      #9#9'                             1,'
      #9#9'                             16'
      #9#9'                            ) AS bursatilidad,'
      
        #9#9'                         gpe.proporcion, cc.f_valor_cred AS f_' +
        'inicio,'
      
        #9#9'                         cc.f_valor_cred + cc.dias_plazo AS f_' +
        'vencimiento,'
      #9#9'                            RTRIM (cc.cve_tasa_refer)'
      #9#9'                         || '#39'+'#39
      #9#9'                         || cc.sobretasa AS tasa_interes,'
      #9#9'                         cto.id_pers_asociad,'
      
        #9#9'                         ROUND ((cc.imp_dispuesto * contrato_c' +
        're.tipo_cambio'
      #9#9'                                ),'
      #9#9'                                2'
      #9#9'                               ) AS imp_dispuesto,'
      
        #9#9'                         cc.fact_propor_gar AS fact_propor_gar' +
        ','
      #9#9'                         ROUND ((  NVL (cc.fact_propor_gar, 0)'
      
        #9#9'                                 * (  (cc.sdo_insoluto + cc.im' +
        'p_capital_vdo)'
      #9#9'                                    * contrato_cre.tipo_cambio'
      #9#9'                                   )'
      #9#9'                                ),'
      #9#9'                                2'
      #9#9'                               ) AS sdo_grtia,'
      
        #9#9'                         sdcr.id_empresa, sdcr.cve_dia_liquida' +
        ','
      #9#9'                         (CASE'
      #9#9'                             WHEN sdcr.id_empresa = 1'
      
        #9#9'                                THEN pkgcrecauciones.obttipoca' +
        'mbio'
      #9#9'                                          (484,'
      #9#9'                                           mo.cve_moneda,'
      
        #9#9'                                           pkgfunproccorp.fref' +
        'erencia ('#39'FMAN'#39','
      
        #9#9'                                                              ' +
        '         2'
      
        #9#9'                                                              ' +
        '        )'
      #9#9'                                          )'
      
        #9#9'                             ELSE pkgcrecauciones.obttipocambi' +
        'o'
      #9#9'                                          (484,'
      #9#9'                                           me.cve_moneda,'
      
        #9#9'                                           pkgfunproccorp.fref' +
        'erencia ('#39'FMAN'#39','
      
        #9#9'                                                              ' +
        '         2'
      
        #9#9'                                                              ' +
        '        )'
      #9#9'                                          )'
      #9#9'                          END'
      #9#9'                         ) AS tipo_cambio_emisora,'
      #9#9'                         (CASE'
      #9#9'                             WHEN sdcr.id_empresa = 1'
      #9#9'                                THEN mo.cve_moneda'
      #9#9'                             ELSE me.cve_moneda'
      #9#9'                          END'
      #9#9'                         ) AS cve_moneda_emisora,'
      #9#9'                         (CASE'
      #9#9'                             WHEN sdcr.id_empresa = 1'
      #9#9'                                THEN NVL (mo.desc_c_id_sec,'
      #9#9'                                          mo.cve_moneda_siar)'
      
        #9#9'                             ELSE NVL (me.desc_c_id_sec, me.cv' +
        'e_moneda_siar)'
      #9#9'                          END'
      #9#9'                         ) AS abre_moneda_emisora,'
      #9#9'                         (CASE'
      #9#9'                             WHEN sdcr.id_empresa = 1'
      #9#9'                                THEN mo.desc_moneda'
      #9#9'                             ELSE me.desc_moneda'
      #9#9'                          END'
      #9#9'                         ) AS desc_moneda_emisora'
      #9#9#9#9#9#9#9#9' ,gubernamental'
      
        #9#9'                    FROM (SELECT id_contrato, cve_moneda, id_p' +
        'ers_asociad,'
      #9#9'                                 id_titular'
      #9#9'                            FROM contrato) cto,'
      #9#9'                         (SELECT *'
      #9#9'                            FROM sb_det_cart_ref'
      #9#9'                           WHERE num_titulos_virt > 0'
      
        #9#9'                             AND cve_dia_liquida = '#39'FMAN'#39') sdc' +
        'r,'
      
        #9#9'                         (SELECT '#39'INTER'#39' AS cve_origen, id_cre' +
        'dito,'
      
        #9#9'                                 sdo_insoluto, fact_propor_gar' +
        ', imp_credito,'
      
        #9#9'                                 id_contrato, sit_credito, f_v' +
        'alor_cred,'
      
        #9#9'                                 dias_plazo, cve_tasa_refer, s' +
        'obretasa,'
      
        #9#9'                                 imp_dispuesto, imp_capital_vd' +
        'o'
      #9#9'                            FROM cre_credito'
      #9#9'                           WHERE sit_credito NOT IN'
      
        #9#9'                                                ('#39'TA'#39') -- NO E' +
        'STÉN TRASPASADOS'
      #9#9'                          UNION'
      
        #9#9'                          SELECT '#39'ICRE'#39' AS cve_origen, id_cred' +
        'ito,'
      
        #9#9'                                 sdo_vig_total AS sdo_insoluto' +
        ','
      #9#9'                                 NVL'
      
        #9#9'                                    (cr_credito.fact_propor_ga' +
        'r,'
      #9#9'                                     0'
      #9#9'                                    ) AS fact_propor_gar,'
      #9#9'                                 cr_credito.imp_credito,'
      #9#9'                                 cr_credito.id_contrato,'
      
        #9#9'                                 cr_credito.sit_credito, cr_cr' +
        'edito.f_inicio,'
      #9#9'                                 cr_credito.dias_plazo,'
      #9#9'                                 cr_credito.cve_tasa_refer,'
      #9#9'                                 cr_credito.sobretasa,'
      #9#9'                                 cr_credito.imp_dispuesto,'
      #9#9'                                 (  cr_credito.imp_capital_vdo'
      #9#9'                                  + cr_credito.imp_vdo_finan_a'
      #9#9'                                 ) AS imp_capital_vdo'
      #9#9'                            FROM cr_credito, cr_cesion'
      #9#9'                           WHERE cr_cesion.id_cesion(+) ='
      
        #9#9'                                                         cr_cr' +
        'edito.id_credito'
      #9#9'                             AND cr_cesion.id_cesion IS NULL'
      
        #9#9'                                      -- QUE NO SEA DE DESCUEN' +
        'TO DE DOCUMENTOS'
      
        #9#9'                                                            ) ' +
        'cc,'
      
        #9#9'                         (SELECT id_contrato, cve_moneda, id_t' +
        'itular,'
      #9#9'                                 pkgcrecauciones.obttipocambio'
      #9#9'                                    (484,'
      #9#9'                                     cto.cve_moneda,'
      
        #9#9'                                     pkgfunproccorp.freferenci' +
        'a ('#39'FMAN'#39', 2)'
      #9#9'                                    ) AS tipo_cambio'
      #9#9'                            FROM contrato cto'
      #9#9'                           WHERE 1 = 1) contrato_cre,'
      
        #9#9'                         (select em.cve_moneda_base, em.emisor' +
        'a, em.serie, em.tipo_valor, '
      
        #9#9#9#9#9#9#9#9' '#9#9' nvl(regexp_instr(INS.CVE_GPO_INST_DEF,'#39'PGUB'#39'),0) gub' +
        'ernamental '
      #9#9#9#9#9#9#9#9'  from EMISORA em'
      
        '   '#9#9#9#9#9#9#9#9'  '#9'   inner join instrumento ins on (ins.cve_instrume' +
        'nto = em.cve_instrumento)'
      
        '   '#9#9' '#9'  '#9#9#9'  '#9'  '#9' ) emisor, /*RUCJ4248 Para extraer SI es Guber' +
        'namental o NO */'
      #9#9'                         gar_prop_emis gpe,'
      #9#9'                         persona,'
      #9#9'                         moneda m,'
      #9#9'                         moneda mo,'
      #9#9'                         moneda me'
      #9#9'                   WHERE 1 = 1'
      #9#9'                     AND cc.id_credito = gpe.id_cto_externo'
      
        #9#9'                     AND sdcr.id_referencia = gpe.id_cto_exter' +
        'no'
      #9#9'                     AND sdcr.id_contrato = gpe.id_contrato'
      #9#9'                     AND sdcr.emisora = gpe.emisora'
      #9#9'                     AND sdcr.serie = gpe.serie'
      #9#9'                     AND sdcr.tipo_valor = gpe.tipo_valor'
      #9#9'                     AND sdcr.cve_dia_liquida = '#39'FMAN'#39
      #9#9'                     AND cto.id_contrato = gpe.id_contrato'
      
        #9#9'                     AND contrato_cre.id_contrato = cc.id_cont' +
        'rato'
      
        #9#9'                     AND cto.id_pers_asociad = persona.id_pers' +
        'ona'
      #9#9'                     AND emisor.emisora = sdcr.emisora'
      #9#9'                     AND emisor.serie = sdcr.serie'
      #9#9'                     AND emisor.tipo_valor = sdcr.tipo_valor'
      
        #9#9'                     AND m.cve_moneda = contrato_cre.cve_moned' +
        'a'
      #9#9'                     AND mo.cve_moneda = cto.cve_moneda'
      
        #9#9'                     AND me.cve_moneda = emisor.cve_moneda_bas' +
        'e'
      '    '#9#9#9'     AND contrato_cre.id_titular = :peTITULAR'
      #9#9#9#9#9#9#9' ) temp) a'
      #9#9'ORDER BY otorgante, emisora'
      ') t1 where 2 = 2 and t1.Renglon = 1 '
      ''
      ''
      '')
    Left = 550
    Top = 108
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peTITULAR'
        ParamType = ptUnknown
      end>
    object qryGarantiasIMP_VALUACION: TFloatField
      FieldName = 'IMP_VALUACION'
    end
    object qryGarantiasNUEVA_VALUACION: TFloatField
      FieldName = 'NUEVA_VALUACION'
    end
    object qryGarantiasPROMOTOR: TStringField
      FieldName = 'PROMOTOR'
      Size = 80
    end
    object qryGarantiasCVE_ORIGEN: TStringField
      FieldName = 'CVE_ORIGEN'
      Size = 5
    end
    object qryGarantiasCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qryGarantiasDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qryGarantiasCVE_MONEDA_OTORGANTE: TFloatField
      FieldName = 'CVE_MONEDA_OTORGANTE'
    end
    object qryGarantiasDESC_MONEDA_OTORGANTE: TStringField
      FieldName = 'DESC_MONEDA_OTORGANTE'
    end
    object qryGarantiasID_ACREDITADO: TFloatField
      FieldName = 'ID_ACREDITADO'
    end
    object qryGarantiasTIPO_CAMBIO: TFloatField
      FieldName = 'TIPO_CAMBIO'
    end
    object qryGarantiasID_OTORGANTE: TFloatField
      FieldName = 'ID_OTORGANTE'
    end
    object qryGarantiasTIPO_CAMBIO_OTORGANTE: TFloatField
      FieldName = 'TIPO_CAMBIO_OTORGANTE'
    end
    object qryGarantiasID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qryGarantiasOTORGANTE: TFloatField
      FieldName = 'OTORGANTE'
    end
    object qryGarantiasSDO_INSOLUTO: TFloatField
      FieldName = 'SDO_INSOLUTO'
    end
    object qryGarantiasIMP_CREDITO: TFloatField
      FieldName = 'IMP_CREDITO'
    end
    object qryGarantiasSDO_INSOLUTO2: TFloatField
      FieldName = 'SDO_INSOLUTO2'
    end
    object qryGarantiasIMP_CREDITO2: TFloatField
      FieldName = 'IMP_CREDITO2'
    end
    object qryGarantiasIMP_DISPUESTO2: TFloatField
      FieldName = 'IMP_DISPUESTO2'
    end
    object qryGarantiasEMISORA: TStringField
      FieldName = 'EMISORA'
      Size = 8
    end
    object qryGarantiasSERIE: TStringField
      FieldName = 'SERIE'
      Size = 8
    end
    object qryGarantiasTIPO_VALOR: TStringField
      FieldName = 'TIPO_VALOR'
      Size = 4
    end
    object qryGarantiasFH_CAPTURA: TDateTimeField
      FieldName = 'FH_CAPTURA'
    end
    object qryGarantiasNUM_TITULOS_VIRT: TFloatField
      FieldName = 'NUM_TITULOS_VIRT'
    end
    object qryGarantiasID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object qryGarantiasNOMBRE_PROMOTOR: TStringField
      FieldName = 'NOMBRE_PROMOTOR'
      Size = 80
    end
    object qryGarantiasNOMBRE_OTORGANTE: TStringField
      FieldName = 'NOMBRE_OTORGANTE'
      Size = 80
    end
    object qryGarantiasNOMBRE_ACREDITADO: TStringField
      FieldName = 'NOMBRE_ACREDITADO'
      Size = 80
    end
    object qryGarantiasSIT_CREDITO: TStringField
      FieldName = 'SIT_CREDITO'
      Size = 2
    end
    object qryGarantiasBURSATILIDAD: TStringField
      FieldName = 'BURSATILIDAD'
      Size = 16
    end
    object qryGarantiasPROPORCION: TFloatField
      FieldName = 'PROPORCION'
    end
    object qryGarantiasF_INICIO: TDateTimeField
      FieldName = 'F_INICIO'
    end
    object qryGarantiasF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object qryGarantiasTASA_INTERES: TStringField
      FieldName = 'TASA_INTERES'
      Size = 49
    end
    object qryGarantiasID_PERS_ASOCIAD: TFloatField
      FieldName = 'ID_PERS_ASOCIAD'
    end
    object qryGarantiasIMP_DISPUESTO: TFloatField
      FieldName = 'IMP_DISPUESTO'
    end
    object qryGarantiasFACT_PROPOR_GAR: TFloatField
      FieldName = 'FACT_PROPOR_GAR'
    end
    object qryGarantiasSDO_GRTIA: TFloatField
      FieldName = 'SDO_GRTIA'
    end
    object qryGarantiasID_EMPRESA: TFloatField
      FieldName = 'ID_EMPRESA'
    end
    object qryGarantiasCVE_DIA_LIQUIDA: TStringField
      FieldName = 'CVE_DIA_LIQUIDA'
      Size = 4
    end
    object qryGarantiasTIPO_CAMBIO_EMISORA: TFloatField
      FieldName = 'TIPO_CAMBIO_EMISORA'
    end
    object qryGarantiasCVE_MONEDA_EMISORA: TFloatField
      FieldName = 'CVE_MONEDA_EMISORA'
    end
    object qryGarantiasABRE_MONEDA_EMISORA: TStringField
      FieldName = 'ABRE_MONEDA_EMISORA'
      Size = 8
    end
    object qryGarantiasDESC_MONEDA_EMISORA: TStringField
      FieldName = 'DESC_MONEDA_EMISORA'
    end
    object qryGarantiasEMISORA_SERIE: TStringField
      FieldName = 'EMISORA_SERIE'
      Size = 16
    end
    object qryGarantiasPREC_VALUACION: TFloatField
      FieldName = 'PREC_VALUACION'
    end
    object qryGarantiasIMP_VALUACION_ORI: TFloatField
      FieldName = 'IMP_VALUACION_ORI'
    end
    object qryGarantiasINTERES: TFloatField
      FieldName = 'INTERES'
    end
    object qryGarantiasIMP_VALUACION_EMISORA: TFloatField
      FieldName = 'IMP_VALUACION_EMISORA'
    end
    object qryGarantiasT_IMP_VALUACION: TFloatField
      FieldName = 'T_IMP_VALUACION'
    end
    object qryGarantiasGUBERNAMENTAL: TFloatField
      FieldName = 'GUBERNAMENTAL'
    end
  end
  object qryDetalle: TQuery
    DatabaseName = 'BCORP'
    SQL.Strings = (
      
        'select  vv.id_persona, vv.id_modelo, vv.id_nodo, vv.id_variable,' +
        ' vv.no_repeticion'
      'from cr_met_valor_var vv '
      '  inner join ('
      #9#9#9'SELECT id_modelo, id_persona, periodo'
      #9#9#9'  FROM (SELECT   id_modelo, id_persona,'
      #9#9#9'                 TO_CHAR (periodo, '#39'dd/mm/yyyy'#39') periodo'
      #9#9#9'            FROM cr_met_valor_var'
      #9#9#9'           WHERE sit_valor_var = '#39'AC'#39' '
      
        #9#9#9#9#9'   '#9#9' and id_modelo = (select ID_MODELO from cr_met_modelo ' +
        'where 2 = 2 AND TRIM(NOMBRE) = '#39'GARANT_CARTCOMER'#39') '
      
        #9#9#9#9#9#9#9' and id_persona = (select id_persona from cr_met_persona ' +
        'where id1 = :peTITULAR) '
      
        #9#9#9'        GROUP BY id_modelo, id_persona, TO_CHAR (periodo, '#39'dd' +
        '/mm/yyyy'#39')'
      #9#9#9'        ORDER BY id_modelo, id_persona, periodo DESC)'
      '  '#9#9') Per on (per.id_modelo = vv.id_modelo  '
      #9#9'  '#9'  '#9'  and per.id_persona = vv.id_persona'
      #9#9#9#9'  and per.periodo = vv.periodo)'
      'where 2 = 2'#9#9#9#9'  '
      'AND TRIM(VALOR_CADENA) = :peEmisora')
    Left = 550
    Top = 148
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peEmisora'
        ParamType = ptUnknown
      end>
    object qryDetalleID_PERSONA: TFloatField
      FieldName = 'ID_PERSONA'
    end
    object qryDetalleID_MODELO: TFloatField
      FieldName = 'ID_MODELO'
    end
    object qryDetalleID_NODO: TFloatField
      FieldName = 'ID_NODO'
    end
    object qryDetalleID_VARIABLE: TFloatField
      FieldName = 'ID_VARIABLE'
    end
    object qryDetalleNO_REPETICION: TFloatField
      FieldName = 'NO_REPETICION'
    end
  end
  object qryFecha: TQuery
    SQL.Strings = (
      'update cr_met_valor_var'
      'set valor_fecha = to_date(:peFecha,'#39'dd/mm/yyyy'#39') '
      'where 2 = 2'
      'and id_modelo = :peModelo '
      'and id_persona = :peTitular'
      
        'and id_variable = (select PkgCrAdminComercial.Fnc_Obt_ID_Var (:p' +
        'eVariable) from dual) '
      'and no_repeticion = :peRepeticion')
    Left = 550
    Top = 196
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peModelo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peTitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peVariable'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peRepeticion'
        ParamType = ptUnknown
      end>
  end
  object qryNumerico: TQuery
    SQL.Strings = (
      'update cr_met_valor_var'
      'set valor_numerico = :peNumerico'
      'where 2 = 2'
      'and id_modelo = :peModelo '
      'and id_persona = :peTitular'
      
        'and id_variable = (select PkgCrAdminComercial.Fnc_Obt_ID_Var (:p' +
        'eVariable) from dual) '
      'and no_repeticion = :peRepeticion')
    Left = 550
    Top = 236
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peNumerico'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peModelo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peTitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peVariable'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peRepeticion'
        ParamType = ptUnknown
      end>
  end
  object qryCadena: TQuery
    SQL.Strings = (
      'update cr_met_valor_var'
      'set valor_cadena = :peCadena'
      'where 2 = 2'
      'and id_modelo = :peModelo '
      'and id_persona = :peTitular'
      
        'and id_variable = (select PkgCrAdminComercial.Fnc_Obt_ID_Var (:p' +
        'eVariable) from dual) '
      'and no_repeticion = :peRepeticion')
    Left = 550
    Top = 276
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peCadena'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peModelo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peTitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peVariable'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peRepeticion'
        ParamType = ptUnknown
      end>
  end
  object ModAnexo18: TModelo
    ID_Modelo = 0
    FechaEmpresa = 42275
    Interforma = InterForma1
    Left = 108
    Top = 90
  end
  object ModAnexo19: TModelo
    ID_Modelo = 0
    FechaEmpresa = 42275
    Interforma = InterForma1
    Left = 140
    Top = 90
  end
  object qryFechaVigente: TQuery
    SQL.Strings = (
      'Select Max (VV.Periodo) Fecha'
      '  From CR_Met_Modelo        M'
      
        '  Join CR_Met_Bloque        B  On     M.ID_Modelo           = B.' +
        'ID_Modelo'
      
        '                                  And B.Sit_Bloque          = '#39'A' +
        'C'#39
      
        '  Join CR_Met_Var_Bloque    VB On     B.ID_Modelo           = VB' +
        '.ID_Modelo'
      
        '                                  And B.ID_Nodo             = VB' +
        '.ID_Nodo'
      
        '                                  And VB.Sit_Var_Bloque     = '#39'A' +
        'C'#39
      
        '  Join CR_Met_Valor_Var     VV On     VB.ID_Modelo          = VV' +
        '.ID_Modelo'
      
        '                                  And VB.ID_Nodo            = VV' +
        '.ID_Nodo'
      
        '                                  And VB.ID_Variable        = VV' +
        '.ID_Variable'
      '                                  And VV.No_Repeticion      = 1'
      
        '                                  And VV.Sit_Valor_Var      = '#39'A' +
        'C'#39
      
        '  Join CR_Met_Persona       P  On     VV.ID_Persona         = P.' +
        'ID_Persona'
      
        '                                  And P.Sit_Persona         = '#39'A' +
        'C'#39
      
        '                                  And P.ID1                 = :I' +
        'D_Acreditado'
      
        '  Join CR_Met_Tabla_Referen TR On     P.ID_Tabla_Referen    = TR' +
        '.ID_Tabla_Referen'
      
        '                                  And TR.Tabla_Referenciada = '#39'C' +
        'R_ACREDITADO'#39
      
        '                                  And TR.Sit_Tabla_Referen  = '#39'A' +
        'C'#39'                                                          '
      ' Where M.Nombre     = :Nombre_Modelo'
      '   And M.Sit_Modelo = '#39'AC'#39)
    Left = 550
    Top = 316
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_Acreditado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Nombre_Modelo'
        ParamType = ptUnknown
      end>
  end
  object qSevPerdida: TQuery
    SQL.Strings = (
      'Select * '
      '  From (  '
      '        Select Cre.Id_Credito, '
      '               Cto.Id_Contrato, '
      
        '               P.Id_Persona                        As Acreditado' +
        ', '
      '               Be.Desc_Estado, '
      
        '               P.Nombre                            As Desc_Clave' +
        ', '
      '               Nvl (Csc.S_Perdida * 100, 0) || '#39'%'#39' As Sp, '
      '               Nvl (Csc.P_Incumpl * 100, 0) || '#39'%'#39' As Pi, '
      '               Trunc (Csc.Anio_Mes) F_Proceso, '
      
        '               Row_Number() Over (Partition By Cre.Id_Credito Or' +
        'der By Cp.Id_Usr_Cod_Post Desc) Renglon '
      '          From Persona          P'
      
        '          Join Contrato         Cto On P.Id_Persona     = Cto.Id' +
        '_Titular'
      
        '          Join Cr_Credito       Cre On (Cto.Id_Contrato = Cre.Id' +
        '_Contrato And'
      '                                        Cre.Sit_Credito = '#39'AC'#39
      '                                       )'
      
        '          Join Cr_Tipos_Garan   Crg On (Crg.Id_Contrato = Cto.Id' +
        '_Contrato) '
      
        '          Join Domicilio        D   On D.Id_Domicilio   = Nvl (P' +
        '.Id_Dom_Fiscal, P.Id_Domicilio) '
      
        '          Join Codigo_Postal    Cp  On Cp.Codigo_Postal = D.Codi' +
        'go_Postal '
      
        '          Join Bc_Estado        Be  On Be.Cve_Estado    = Cp.Id_' +
        'Estado_Pml '
      
        '          Join (Select S_Perdida, P_Incumpl, Anio_Mes, Id_Credit' +
        'o'
      '                  From Cr_Sicc_Califica'
      '                 Where Vigente = 1'
      
        '                   And Trunc (Anio_Mes) = (Select Max (Anio_Mes)' +
        ' '
      
        '                                             From Cr_Sicc_Vobo_P' +
        'er'
      
        '                                            Where Cve_Situacion ' +
        '= '#39'AC'#39' '
      '                                             And Cve_Vobo = 1  '
      '                                           )'
      '                ) Csc On Cre.Id_Credito  = Csc.Id_Credito'
      '         Where P.Id_Persona = :Id_Acreditado'
      '         Order By P.Id_Persona, Cre.Id_Credito  '
      '        )'
      ' Where Renglon = 1 '
      ' Order By Desc_Estado, Desc_Clave'
      '')
    Left = 548
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id_Acreditado'
        ParamType = ptUnknown
      end>
  end
  object qryGenerarLayoutAnexo18: TQuery
    SQL.Strings = (
      
        'Select InitCap (Substr (V.Nombre, 7)) Nombre, V.Descripcion, V.T' +
        'ipo_Dato, V.Longitud, V.Precision'
      '  From CR_Met_Modelo     M'
      
        '  Join CR_Met_Bloque     B  On     M.ID_Modelo       = B.ID_Mode' +
        'lo'
      '                               And B.Sit_Bloque      = '#39'AC'#39' '
      
        '  Join CR_Met_Var_Bloque VB On     B.ID_Modelo       = VB.ID_Mod' +
        'elo'
      
        '                               And B.ID_Nodo         = VB.ID_Nod' +
        'o'
      '                               And VB.Sit_Var_Bloque = '#39'AC'#39
      
        '  Join CR_Met_Variable   V  On     VB.ID_Variable    = V.ID_Vari' +
        'able'
      
        '                               And V.Sit_Variable    = '#39'AC'#39'     ' +
        '                          '
      ' Where M.Nombre     = '#39'ANEXO_18_2015'#39
      '   And M.Sit_Modelo = '#39'AC'#39
      ' Order By VB.Orden_Aparicion   ')
    Left = 550
    Top = 404
  end
  object SaveDlgLayoutAnexo18: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Archivo de excel|*.xls;*.xlsx|Todos los archivos|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Salvar Layout de Anexo 18'
    Left = 636
    Top = 330
  end
  object OpenDlgCargaMasivaAnexo18: TOpenDialog
    DefaultExt = 'xls'
    Filter = 'Archivo de excel|*.xls;*.xlsx|Todos los archivos|*.*'
    Title = 'Abrir archivo de carga masiva para Anexo 18'
    Left = 636
    Top = 370
  end
  object QContratosAnexo19: TQuery
    SQL.Strings = (
      
        'Select Distinct C.Fol_Contrato, C.ID_Contrato, Anx19.ID_Proyecto' +
        ', Proy.Nom_Proyecto, Anx19.Cve_Metodologia, InitCap (Cat.Desc_Cl' +
        'ave) Metodologia'
      '  From            Contrato                Cto'
      
        '  Join            CR_Contrato             C     On Cto.ID_Contra' +
        'to       = C.ID_Contrato'
      
        '  Join            CR_Credito              Cred  On C.ID_Contrato' +
        '         = Cred.ID_Contrato   And'
      
        '                                                   C.Fol_Contrat' +
        'o        = Cred.Fol_Contrato  And'
      
        '                                                   Cred.Sit_Cred' +
        'ito      = '#39'AC'#39
      
        '  Left Outer Join CR_Per_Proy_Cto_Anexo19 Anx19 On C.Fol_Contrat' +
        'o        = Anx19.Fol_Contrato And'
      
        '                                                   C.ID_Contrato' +
        '         = Anx19.ID_Contrato'
      
        '  Left Outer Join VW_CR_Per_Proy_Anexo19  Proy  On Anx19.ID_Proy' +
        'ecto     = Proy.ID_Proyecto'
      
        '  Left Outer Join Cr_Con_Cat_Data         Cat   On Anx19.Cve_Met' +
        'odologia = Cat.Cve_Clave And'
      
        '                                                   Cat.Cve_Con_G' +
        'po_Cat   = '#39'CAT_METODOLOGIA'#39
      ' Where Cto.ID_Titular = :ID_Acreditado'
      ' Order By C.Fol_Contrato, C.ID_Contrato')
    Left = 598
    Top = 316
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_Acreditado'
        ParamType = ptUnknown
      end>
  end
  object MemContratosAnexo19: TRxMemoryData
    FieldDefs = <>
    BeforeInsert = MemContratosAnexo19BeforeInsert
    Left = 598
    Top = 356
    object MemContratosAnexo19FOL_CONTRATO: TIntegerField
      FieldName = 'FOL_CONTRATO'
      Visible = False
    end
    object MemContratosAnexo19ID_CONTRATO: TIntegerField
      DisplayLabel = 'Contrato'
      FieldName = 'ID_CONTRATO'
    end
    object MemContratosAnexo19ID_PROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'ID_PROYECTO'
    end
    object MemContratosAnexo19Nombre: TStringField
      DisplayWidth = 25
      FieldKind = fkLookup
      FieldName = 'Nombre'
      LookupDataSet = QProyectosAnexo19
      LookupKeyFields = 'ID_PROYECTO'
      LookupResultField = 'NOMBRE'
      KeyFields = 'ID_PROYECTO'
      Size = 100
      Lookup = True
    end
    object MemContratosAnexo19Cve_Metodologia: TStringField
      DisplayLabel = 'Cve. Met.'
      DisplayWidth = 10
      FieldName = 'Cve_Metodologia'
    end
    object MemContratosAnexo19Metodologia: TStringField
      DisplayLabel = 'Metodología'
      DisplayWidth = 25
      FieldKind = fkLookup
      FieldName = 'Metodologia'
      LookupDataSet = QMetodologias
      LookupKeyFields = 'Cve_Metodologia'
      LookupResultField = 'Metodologia'
      KeyFields = 'Cve_Metodologia'
      Size = 100
      Lookup = True
    end
  end
  object DSContratosAnexo19: TDataSource
    DataSet = MemContratosAnexo19
    Left = 598
    Top = 404
  end
  object QProyectosAnexo19: TQuery
    SQL.Strings = (
      'Select ID_Proyecto, Substr (Nom_Proyecto, 1, 100) Nombre'
      '  From VW_CR_Per_Proy_Anexo19'
      ' Where ID_Acreditado = :ID_Acreditado'
      ' Order By ID_Proyecto')
    Left = 598
    Top = 276
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_Acreditado'
        ParamType = ptUnknown
      end>
  end
  object QMetodologias: TQuery
    SQL.Strings = (
      
        'Select Cve_Clave Cve_Metodologia, Substr (InitCap (Desc_Clave), ' +
        '1, 100) Metodologia '
      '  From Cr_Con_Cat_Data '
      ' Where Cve_Con_Gpo_Cat = '#39'CAT_METODOLOGIA'#39
      ' Order By Cve_Clave ')
    Left = 598
    Top = 236
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 598
    Top = 196
    object actModificarContratosAnexo19: TAction
      Category = 'Anexo19'
      Caption = 'Modificar'
      ImageIndex = 0
      OnExecute = actModificarContratosAnexo19Execute
      OnUpdate = actModificarContratosAnexo19Update
    end
    object actAceptarContratosAnexo19: TAction
      Category = 'Anexo19'
      Caption = 'Aceptar'
      ImageIndex = 1
      OnExecute = actAceptarContratosAnexo19Execute
    end
    object actCancelarContratosAnexo19: TAction
      Category = 'Anexo19'
      Caption = 'Cancelar'
      ImageIndex = 2
      OnExecute = actCancelarContratosAnexo19Execute
    end
  end
  object ImageList1: TImageList
    Left = 598
    Top = 148
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000000000000000000000000000A5A5
      A5FFA1A1A1FFA0A1A1FFA0A1A1FFA0A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FFA6A6A6FFBBBBBBFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A6A7A7FFDBDB
      DBFFE2E2E2FFE4E4E4FFE4E4E4FFE4E4E4FFE4E5E4FFE5E5E5FFE6E6E6FFE6E6
      E6FFE4E2E4FFBDA1C0FFD7BADFFF00000000000000000000000000000000ABA2
      92FF5E6735FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005555
      C2FF5555C2FF0000000000000000000000000000000000000000000000005555
      C2FF5555C2FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A3A3A3FFEBEB
      EBFFF5F5F5FFF7F7F7FFF9F9F9FFF9F9F9FFFAFAFAFFFAFAFAFFFBFBFBFFF3F7
      F9FFD8E4EDFFCD97D9FFC99CD9FFE8C7F2FF0000000000000000000000006978
      49FF3FC45AFF537F3DFF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004D4DC0FF1C1C
      B2FF1C1CB2FF4D4DC0FF000000000000000000000000000000004D4DC0FF1C1C
      B2FF1C1CB2FF4D4DC0FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A1A1A1FFE7E7
      E7FFF1F1F1FFF3F3F3FFF6F6F6FFF8F8F8FFF9F9F9FFFAFAFAFFF1F6F8FF9CD9
      E5FF5EBED2FF92B1D2FFCEA9DBFFEFCEF5FF0000000000000000000000004A9A
      45FF58E992FF4CD274FF537936FF000000000000000000000000000000000000
      000000000000000000000000000000000000000000005B5BC5FF2121B5FF3B3B
      C8FF3B3BC8FF2121B5FF5050C3FF00000000000000005050C3FF2121B5FF3C3C
      C8FF3B3BC8FF2121B5FF5B5BC5FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A0A0A0FFE4E4
      E4FFEEEEEEFFF0F0F0FFF2F2F2FFF5F5F5FFF7F7F7FFF4F7F8FFAEDCE7FF48BB
      D0FF33BFDCFF78CADDFF00000000000000000000000000000000758E5BFF5BCF
      7AFF7CE8ABFF6DE8A3FF51CE74FF557D38FF0000000000000000000000000000
      000000000000000000000000000000000000000000005D5DC7FF2525B7FF4545
      CDFF4141CCFF4646CDFF2525B7FF5252C3FF5252C3FF2525B7FF4646CDFF4242
      CCFF4545CDFF2525B7FF5D5DC7FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009F9F9FFFE2E2
      E2FFEBEBEBFFEDECECFFEFEFEFFFF1F1F1FFEFF2F3FFB2DCE7FF4ABAD0FF3ABB
      D6FF6DCCE0FF6DB4C1FF0000000000000000000000000000000043943CFF89EE
      B5FF96F3C5FF8AEBB8FF79ECAFFF50CC72FF578139FF00000000000000000000
      00000000000000000000000000000000000000000000000000005555C5FF2A2A
      BBFF5050D1FF4A4AD0FF5050D1FF2F2FBEFF2F2FBEFF5050D1FF4A4AD0FF5050
      D1FF2A2ABBFF5555C5FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009F9F9FFFE2E2
      E2FFE9E9E9FFEAEAEAFFEBEBEBFFE5EAECFFA7D6E1FF49BACFFF41BDD8FF6CCA
      DEFFABD8E4FFADAEAEFF00000000000000000000000082A46FFF6CCE82FFA1FA
      D1FF5CCD76FF78E6A5FF95F3C8FF7CF2B8FF4FC86DFF5D8943FF000000000000
      0000000000000000000000000000000000000000000000000000000000005757
      C7FF3131BDFF5959D6FF5252D4FF5B5BD7FF5B5BD7FF5353D4FF5959D6FF3131
      BDFF5757C7FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009F9F9FFFE2E2
      E2FFE9E9E9FFE9E9E9FFE6E7E8FFA4D2DDFF4AB9CEFF3BBED8FF6DCADEFFADDA
      E3FFECF1F2FFAFAFAFFF000000000000000000000000449438FF98FCC9FF5EC7
      73FF407D24FF409836FF6CE398FF91F9CCFF7CF7C1FF4BC364FF6A9652FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00005A5AC8FF3939C2FF6565DBFF6363DBFF6363DBFF6565DBFF3939C2FF5A5A
      C8FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A0A0A0FFE2E2
      E2FFE9E9E9FFE7E6E8FFAFD2DBFF50B9CEFF31BCDAFF79CEE0FFA3D3DEFFE7ED
      EEFFF1F1F1FFADADADFF000000000000000090B885FF5AD07AFF5FD57FFF5D99
      4BFF0000000000000000439131FF51CB6DFF81F9C6FF7AFECAFF44C05DFF70A1
      5BFF000000000000000000000000000000000000000000000000000000000000
      00005C5CCAFF3F3FC6FF6E6EDFFF6A6ADFFF6A6ADFFF6E6EDFFF4040C6FF5C5C
      CAFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A1A1A1FFE5E5
      E5FFE8E8E8FFBED5DCFF4FB8CDFF35BCD9FF7ECFE2FF86C9D7FFE7E9E9FFEDED
      EDFFEDEDEDFFABABABFF000000000000000041A03CFF44D062FF57A04AFF0000
      00000000000000000000000000006AA459FF3AB446FF6EF2B3FF72FFD0FF3FBB
      53FF82B272FF0000000000000000000000000000000000000000000000005F5F
      CCFF3F3FC7FF7676E3FF6A6AE1FF7777E4FF7777E4FF6969E1FF7676E3FF3F3F
      C7FF5F5FCCFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A2A2A2FFE7E7
      E7FFB5B5B5FF65828AFF42AEC5FF69C8DDFF8FCBD8FFE4E5E6FFE9E9E9FFEAEA
      EAFFE9E9E9FFA9A9A9FF00000000000000002C9824FF4CA441FF000000000000
      000000000000000000000000000000000000000000002D9F25FF59E896FF69FF
      D2FF38B849FF00000000000000000000000000000000000000006161CDFF4242
      C8FF7E7EE6FF7171E4FF7F7FE6FF4848CBFF4848CBFF7F7FE6FF7272E4FF7E7E
      E6FF4343CAFF6161CDFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A3A3A3FFE9E9
      E9FF5C5C5CFF343E3FFF6D929BFF9DC7D1FFE1E6E6FFE9E9E9FFE9E9E9FFE9E9
      E9FFE6E6E6FFA7A7A7FF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003EA233FF42D4
      6EFF65FCBEFF34B746FF0000000000000000000000006D6DD1FF4848CAFF8686
      E7FF7878E5FF8888E7FF4949CAFF6464CFFF6464CFFF4949CAFF8888E7FF7979
      E5FF8787E7FF4848CAFF6D6DD1FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A4A4A4FFECEC
      ECFF8A8A8AFF707172FF989A9BFFDEE0E1FFEBEBEBFFEAEAEAFFE9E9E9FFE9E9
      E9FFE6E6E6FFA6A6A6FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006AB5
      64FF2FBE47FF5BF5A4FF2CB33BFF00000000000000007070D3FF4E4ECCFF8F8F
      E9FF9090E9FF4F4FCCFF6666D1FF00000000000000006666D1FF4F4FCCFF9090
      E9FF8F8FE9FF4E4ECCFF7070D3FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A5A5FFEDED
      EDFFF5F4F5FFF3F3F3FFF2F1F2FFF0F0F0FFEFEEEEFFEDEDEDFFEBEBEBFFEAEA
      EAFFE6E6E6FFA7A7A7FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000033B53EFF44DD69FF2CB12FFF00000000000000006969D2FF5252
      CDFF5353CDFF6969D2FF000000000000000000000000000000006969D2FF5454
      CEFF5454CDFF6969D2FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A7A7A7FFD2D2
      D2FFD8D8D8FFD7D7D7FFD6D6D6FFD5D5D5FFD4D4D4FFD2D2D2FFD2D2D2FFD0D0
      D0FFCDCDCDFFA5A5A5FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000043B746FF1DAC1EFF0000000000000000000000007474
      D5FF7474D5FF0000000000000000000000000000000000000000000000007474
      D5FF7474D5FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A9A9
      A9FFA5A5A5FFA5A5A5FFA5A5A5FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA3A3
      A3FFA7A7A7FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00E003FFFFFFFF0000C001E7FFE7E70000
      C000E3FFC3C30000C000E1FF81810000C003C0FF80010000C003C07FC0030000
      C003803FE0070000C003801FF00F0000C0030C0FF00F0000C0031E07E0070000
      C0033F87C0030000C003FFC380010000C003FFE181810000C003FFF8C3C30000
      C003FFFCE7E70000E007FFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object SPActCtoProyAnx19: TStoredProc
    Left = 638
    Top = 284
  end
  object spAltaPersona: TStoredProc
    Left = 638
    Top = 236
  end
  object QTablaReferenciada: TQuery
    SQL.Strings = (
      'Select ID_Tabla_Referen'
      '  From CR_Met_Tabla_Referen '
      ' Where Tabla_Referenciada = '#39'CR_ACREDITADO'#39
      '   And Sit_Tabla_Referen  = '#39'AC'#39)
    Left = 638
    Top = 196
  end
  object qryPersona: TQuery
    SQL.Strings = (
      'Select Per.ID_Persona'
      '  From CR_Met_Tabla_Referen TR'
      
        '  Join CR_Met_Persona       Per On     TR.ID_Tabla_Referen = Per' +
        '.ID_Tabla_Referen'
      
        '                                   And Per.Sit_Persona     = '#39'AC' +
        #39
      
        '                                   And Per.ID1             = :ID' +
        '_Acreditado'
      
        '  Join CR_Acreditado        Ac  On     Per.ID1             = Ac.' +
        'ID_Acreditado'
      ' Where TR.Tabla_Referenciada = '#39'CR_ACREDITADO'#39
      '   And TR.Sit_Tabla_Referen  = '#39'AC'#39)
    Left = 638
    Top = 148
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_Acreditado'
        ParamType = ptUnknown
      end>
  end
  object SaveDlgExportAnexo18XLS: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Archivo de excel|*.xls;*.xlsx|Todos los archivos|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Exportar información vigente de Anexo 18 '
    Left = 596
    Top = 106
  end
  object qryExportAnexo18XLS: TQuery
    SQL.Strings = (
      'Select Id_Acreditado,'
      '       F_Vigente_Desde,'
      '       Pct_Pgo_Tiem_Ins_Ban,'
      '       Pct_Pgo_Tiem_Ins_Nban,'
      '       Dias_Mora_Prom_Ins_Ban,'
      
        '       Substr (Imp_Deuda_Corto_Plz,      1, 100) Imp_Deuda_Corto' +
        '_Plz,'
      
        '       Substr (Imp_Deuda_Total,          1, 100) Imp_Deuda_Total' +
        ','
      '       F_Inf_Buro,'
      
        '       Substr (Imp_Serv_Personales,      1, 100) Imp_Serv_Person' +
        'ales,'
      
        '       Substr (Imp_Materiales_Sumin,     1, 100) Imp_Materiales_' +
        'Sumin,'
      
        '       Substr (Imp_Servicios_Grales,     1, 100) Imp_Servicios_G' +
        'rales,'
      
        '       Substr (Imp_Subs_Transf_Ayud,     1, 100) Imp_Subs_Transf' +
        '_Ayud,'
      
        '       Substr (Imp_Adq_Bie_Mue_Inmue,    1, 100) Imp_Adq_Bie_Mue' +
        '_Inmue,'
      
        '       Substr (Imp_Obras_Publicas,       1, 100) Imp_Obras_Publi' +
        'cas,'
      '       Substr (Imp_Inversion,            1, 100) Imp_Inversion,'
      
        '       Substr (Imp_Aplic_Rec_Fed_Est,    1, 100) Imp_Aplic_Rec_F' +
        'ed_Est,'
      
        '       Substr (Imp_Otros_Egresos,        1, 100) Imp_Otros_Egres' +
        'os,'
      
        '       Substr (Imp_Por_Cta_3Ros_Egr,     1, 100) Imp_Por_Cta_3Ro' +
        's_Egr,'
      
        '       Substr (Imp_Deuda_Publica,        1, 100) Imp_Deuda_Publi' +
        'ca,'
      
        '       Substr (Imp_Disponib_Final,       1, 100) Imp_Disponib_Fi' +
        'nal,'
      '       Substr (Imp_Impuestos,            1, 100) Imp_Impuestos,'
      '       Substr (Imp_Derechos,             1, 100) Imp_Derechos,'
      '       Substr (Imp_Productos,            1, 100) Imp_Productos,'
      
        '       Substr (Imp_Aprovechamientos,     1, 100) Imp_Aprovechami' +
        'entos,'
      
        '       Substr (Imp_Contrib_Mejora,       1, 100) Imp_Contrib_Mej' +
        'ora,'
      
        '       Substr (Imp_Particip_Fed_Est,     1, 100) Imp_Particip_Fe' +
        'd_Est,'
      
        '       Substr (Imp_Aport_Fed_Est,        1, 100) Imp_Aport_Fed_E' +
        'st,'
      
        '       Substr (Imp_Otros_Ingresos,       1, 100) Imp_Otros_Ingre' +
        'sos,'
      
        '       Substr (Imp_Por_Cta_3Ros_Ing,     1, 100) Imp_Por_Cta_3Ro' +
        's_Ing,'
      
        '       Substr (Imp_Financiamiento,       1, 100) Imp_Financiamie' +
        'nto,'
      
        '       Substr (Imp_Disponib_Inicial,     1, 100) Imp_Disponib_In' +
        'icial,'
      
        '       Substr (Imp_Acciones_Soc,         1, 100) Imp_Acciones_So' +
        'c,'
      '       F_Inf_Estados_Finan,'
      
        '       Substr (Imp_Partici_Eleg_Act,     1, 100) Imp_Partici_Ele' +
        'g_Act,'
      
        '       Substr (Imp_Partici_Eleg_Ant,     1, 100) Imp_Partici_Ele' +
        'g_Ant,'
      '       F_Inf_Particip_Eleg,'
      
        '       Substr (Tasa_Desempleo_Local,     1, 100) Tasa_Desempleo_' +
        'Local,'
      
        '       Substr (Imp_Pob_Desocupada,       1, 100) Imp_Pob_Desocup' +
        'ada,'
      '       Substr (Imp_Pob_Activa,           1, 100) Imp_Pob_Activa,'
      '       F_Tasa_Desempleo,'
      
        '       Substr (Imp_Serv_Finan_Er,        1, 100) Imp_Serv_Finan_' +
        'Er,'
      
        '       Substr (Imp_Oblig_Contingen,      1, 100) Imp_Oblig_Conti' +
        'ngen,'
      
        '       Substr (Imp_Deu_Pub_Mer_Val,      1, 100) Imp_Deu_Pub_Mer' +
        '_Val,'
      '       F_Inf_Servicio_Deuda,'
      '       Substr (Imp_Pib_Local,            1, 100) Imp_Pib_Local,'
      
        '       Substr (Imp_Sol_Flex_Imp_Loc,     1, 100) Imp_Sol_Flex_Im' +
        'p_Loc,'
      '       F_Inf_Sol_Flex_Imp_Loc,'
      
        '       Substr (Imp_Sol_Flex_Presup,      1, 100) Imp_Sol_Flex_Pr' +
        'esup,'
      '       F_Inf_Sol_Flex_Presup,'
      
        '       Substr (Imp_Transp_Finan_Deu_Pub, 1, 100) Imp_Transp_Fina' +
        'n_Deu_Pub,'
      '       F_Transparencia'
      ' From VW_CR_Per_Anexo18 A18'
      
        ' Where (ID_Acreditado, F_Vigente_Desde) In (Select ID_Acreditado' +
        ', Max (F_Vigente_Desde) F_Vigente_Desde'
      
        '                                              From VW_CR_Per_Ane' +
        'xo18  '
      
        '                                            Group By ID_Acredita' +
        'do'
      '                                           ) '
      'Order By ID_Acreditado')
    Left = 646
    Top = 108
  end
  object ModConsumoRevolvente: TModelo
    ID_Modelo = 0
    FechaEmpresa = 42458
    Interforma = InterForma1
    Left = 180
    Top = 90
  end
end
