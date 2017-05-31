object WCrAnxMasv: TWCrAnxMasv
  Left = 223
  Top = 184
  Width = 688
  Height = 522
  Caption = 'Carga masiva para el uso de Modelos Dinámicos'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 672
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label40: TLabel
      Left = 8
      Top = 45
      Width = 64
      Height = 13
      Caption = 'Archivo excel'
    end
    object lblModelo: TLabel
      Left = 8
      Top = 17
      Width = 35
      Height = 13
      Caption = 'Modelo'
    end
    object edArchivoExcel: TEdit
      Left = 80
      Top = 37
      Width = 193
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object bBuscarArchivo: TBitBtn
      Left = 277
      Top = 35
      Width = 84
      Height = 24
      Caption = 'Archivo '
      TabOrder = 4
      OnClick = bBuscarArchivoClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000C40E0000C40E00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000030000000500000002000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000151512CD6F6F6CB000000007000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000001161616CE7B7A7AFFFEFEFEDDEAE0E019000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000191918D06F6F6DFFF1F0EFE6DFDFDF0800000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000F0F0FC75F5D5DFFDEDDDCECE5E5E50A0000000000000000000000000000
        0000000000000000000000000008000000201111110F00000002000000000505
        05BA504F4DFFD6D4D4DEFEFEFE1F000000000000000000000000000000000000
        000000000021494848B88B7F78FCA28880FF96847DFE7E7979CB000000AE5B5B
        5AFEDEDDDCBFEFEFEF1000000000000000000000000000000000000000000000
        0018978C87E0FFFDEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4DFFF958C88FF5A5C
        5C81000000000000000000000000000000000000000000000000000000022D2D
        2D9CFEF8E6F4FEFEFEF1FEFEE9DEFFFFFCCCFEFEFEF3FEFEFEEEFEDEC1E47A72
        70CA5555550300000000000000000000000000000000000000000000000B8678
        73C9FEFEFEE2FEFEFCC1FEFEE7ACFEFEFE9CFEFEFCE1FEFEFE62FEFEFECD9885
        7DD83131311A0000000000000000000000000000000000000000000000208B77
        71B3FEFEFEC4FEFEFE9CFEFEFE9CFEFEFAA6FEFEFE9CFEFEFE9CFEFEFEB77F6A
        61B43535352B00000000000000000000000000000000000000000000000B5248
        45A6FEFEFEC9FEFEFE8EFEFEFD90FEFEFE9CFEFEFEC4FEFEFEB5FEFEFE975F4F
        48B1303030150000000000000000000000000000000000000000000000023836
        367FE6DDDA9FFEFEFED0FEFEFE8EFEFEFE9CFEFEFEA7FEFEFE99FEFEFEB1554F
        4FB97F7F7F020000000000000000000000000000000000000000000000004E4E
        4E0D41404197FEFEFEEBFEFEFEECFEFEFE9DFEFEFEB4FEFEFEB33B33329E5B56
        5635000000000000000000000000000000000000000000000000000000000000
        00006A6A5F1858565682181414872F2D2B862D2727863F3F3F99666262390000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000555555034444440F3E3737254646461255555506000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object btCargaExcel: TBitBtn
      Left = 365
      Top = 35
      Width = 84
      Height = 24
      Caption = 'Cargar'
      Enabled = False
      TabOrder = 5
      OnClick = btCargaExcelClick
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
    object btCancelar: TBitBtn
      Left = 455
      Top = 35
      Width = 84
      Height = 24
      BiDiMode = bdLeftToRight
      Caption = 'Limpia'
      Enabled = False
      ParentBiDiMode = False
      TabOrder = 6
      OnClick = btCancelarClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000C40E0000C40E00000000000000000000000000000000
        00000000000000000000070757E41C1C66D91C1C6CD91C1C6FD91D1D70D91C1C
        6ED91C1C68D9060656E200000000000000000000000000000000000000000000
        000000000000060655E52929B1FD2828FAFF2929FFFF2B2BFFFF2B2BFFFF2A2A
        FEFF2929FAFF2929A9F9050555E3000000000000000000000000000000000000
        0000040454E52222A9FD1D1DF0FF1818EFFF2222F5FF2323F8FF2424F9FF2121
        F8FF1616F4FF1D1DF5FF2222A3F8040454E30000000000000000000000000404
        53E51D1D95FD0F0FCEFF3636D6FF7171E4FF1717DEFF1717E1FF1616E2FF1A1A
        E2FF7474E6FF2F2FDBFF0F0FD5FF1C1C93F8030353E300000000030352E51515
        7CFC0C0CA8FF3232B9FFB4B4CEFFD0CFBFFF8282D7FF0707C7FF0B0BC9FF8B8B
        D8FFD0D0BDFFAEADD1FF2A2ABFFF0D0DADFF171679F8030352E30A0A51E20606
        92FF00008EFF4343A0FFC9C9C3FFC7C6C3FFD3D3CBFF7F7FCDFF8787CFFFD3D3
        C9FFC7C7C4FFC5C5C1FF3A3A9FFF000091FF080895FF090950DB05054EDF0101
        6AFF000071FF000075FF444490FFD1D0D0FFD6D6D4FFDEDDD8FFDDDDD7FFD7D6
        D4FFCCCCCDFF3B3A91FF00007CFF000076FF010171FF05054ED904044CDF0606
        44FF050551FF060668FF000079FF4A4AA2FFE0E0E0FFE3E3E2FFE4E4E2FFDCDC
        DEFF4242A2FF00008CFF060685FF05056DFF06065EFF04044ED906064EDF1D1D
        5AFF1B1B6EFF171787FF14149EFF9393D5FFF4F4F2FFF6F6F4FFF6F6F4FFF3F3
        F1FF8B8BD8FF1414B2FF1919A5FF1B1B92FF1C1C84FF050551D9080853DF2626
        8BFF222295FF2626A9FFA4A4DEFFFFFFFFFFFFFFFFFFFCFCFDFFFDFDFDFFFFFF
        FFFFFFFFFFFF9B9BE3FF2727BEFF2626B0FF2626ACFF070754D90D0D59E23535
        BDFF2727BFFF7070CFFFFFFFFFFFFFFFFFFFEFEFF1FF5959C8FF6363CAFFF4F4
        F4FFFFFFFFFFFFFFFFFF6C6CD0FF3333C8FF3E3EC9FF0B0B56DC0A0A51C18C8C
        D6FF4545E6FF3D3DD5FFA2A2D3FFE8E8EAFF6868D0FF4141F5FF4141F2FF7171
        CFFFEAEAEAFF9C9CD2FF4848D6FF5555E5FF8E8ED3FE090950BB000000000E0E
        57C49B9BE9FF5C5CFFFF5050E6FF5B5BCDFF5A5AFAFF6667FFFF6868FFFF5D5D
        F9FF5F5FCCFF5858E8FF6A6AFFFF9C9CE4FE0C0C55BF00000000000000000000
        000013135CC4AAAAF4FF7676FFFF7473FFFF7E7AFFFF817CFFFF807EFFFF7F7F
        FFFF7A7AFFFF8080FFFFA9A9F0FE11115ABF0000000000000000000000000000
        000000000000171761C4B9B9F7FFC5C0FFFFC8C0FFFFCBC2FFFFCAC2FFFFC5C2
        FFFFC4C4FFFFB8B8F4FE15155EBF000000000000000000000000000000000000
        000000000000000000001B1B64C12D2D79DF2E2D7BDF302E7BDF302E7BDF2D2D
        7ADF2D2D79DF191962BD00000000000000000000000000000000}
      Layout = blGlyphRight
    end
    object edModelo: TEdit
      Left = 80
      Top = 14
      Width = 102
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object btnModelo: TBitBtn
      Left = 184
      Top = 14
      Width = 22
      Height = 20
      HelpContext = 1002
      TabOrder = 1
      OnClick = btnModeloClick
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
    object edModeloDesc: TEdit
      Left = 208
      Top = 14
      Width = 411
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object BitBtn1: TBitBtn
      Left = 544
      Top = 35
      Width = 75
      Height = 25
      Caption = 'Respaldo'
      TabOrder = 7
      OnClick = BitBtn1Click
    end
  end
  object SagDatos: TStringAlignGrid
    Left = 0
    Top = 73
    Width = 672
    Height = 306
    Align = alClient
    ColCount = 3
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
    TabOrder = 1
    OnKeyPress = SagDatosKeyPress
    Alignment = alRight
    Editable = False
    ColWidths = (
      26
      100
      110)
    RowHeights = (
      20
      20)
    PropCell = ()
    PropCol = ()
    PropRow = ()
    PropFixedCol = ()
    PropFixedRow = ()
  end
  object Log: TMemo
    Left = 0
    Top = 379
    Width = 672
    Height = 105
    TabStop = False
    Align = alBottom
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 2
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
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
    Left = 10
    Top = 10
  end
  object OpenXLS: TOpenDialog
    DefaultExt = 'xls'
    Filter = 'Archivos de Excel *.xls|*.xls;*.xlsx|Todos los archivos|*.*'
    Title = 'Abrir archivo de Excel'
    Left = 512
    Top = 104
  end
  object SaveXLS: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Archivos de Excel *.xls|*.xls;*.xlsx|Todos los archivos|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Generar archivo de Excel'
    Left = 544
    Top = 104
  end
  object Proc: TStoredProc
    Left = 152
    Top = 184
  end
  object qryAnexos: TQuery
    SQL.Strings = (
      'select  vbl.id_modelo, vbl.id_nodo, var.tipo_dato, '
      #9'vbl.id_variable, var.nombre'
      'from CR_MET_VAR_BLOQUE vbl'
      
        #9'inner join CR_MET_VARIABLE var on (var.id_variable = vbl.id_var' +
        'iable)'
      'where 2 = 2  '
      'and id_modelo = :peModelo'
      
        'and vbl.id_variable = (select PkgCrAdminComercial.Fnc_Obt_ID_Var' +
        ' (:peNombre) from dual) ')
    Left = 360
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peModelo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peNombre'
        ParamType = ptUnknown
      end>
  end
  object ProcValor: TStoredProc
    Left = 152
    Top = 216
  end
  object ProcModelo: TStoredProc
    Left = 152
    Top = 248
  end
  object qryNumber: TQuery
    SQL.Strings = (
      'UPDATE CR_MET_VALOR_VAR'
      'SET valor_numerico = null'
      'where 2 = 2 '
      'and id_modelo = :peModelo '
      
        'and id_variable = (select PkgCrAdminComercial.Fnc_Obt_ID_Var (:p' +
        'eNombre) from dual)'
      'and id_persona = :pePersona '
      'and periodo = ('
      #9'SELECT max(periodo)'
      #9'  FROM (SELECT   id_modelo, id_persona, id_variable,'
      #9'                 TO_CHAR (periodo, '#39'dd/mm/yyyy'#39') periodo'
      #9'            FROM cr_met_valor_var'
      #9'           WHERE sit_valor_var = '#39'AC'#39
      
        #9'        GROUP BY id_modelo, id_persona, id_variable, TO_CHAR (p' +
        'eriodo, '#39'dd/mm/yyyy'#39')'
      #9'        ORDER BY id_modelo, id_persona, periodo DESC)'
      #9' WHERE id_modelo = :peModelo '
      #9' AND id_persona = :pePersona'
      
        #9' and id_variable = (select PkgCrAdminComercial.Fnc_Obt_ID_Var (' +
        ':peNombre) from dual)'
      ' )')
    Left = 360
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peModelo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peNombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pePersona'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peModelo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pePersona'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peNombre'
        ParamType = ptUnknown
      end>
  end
  object qryRAnexo21: TQuery
    SQL.Strings = (
      'select '
      'substr(CodigoDeudor, 1,50) CodigoDeudor, '
      'substr(FechaBuroCredito, 1, 50) FechaBuroCredito,'
      'substr(VentNetTotAnuales, 1, 50) VentNetTotAnuales,'
      'substr(AntSocInfCredCredito, 1, 50) AntSocInfCredCredito,'
      'substr(ExperienciaIn, 1, 50) ExperienciaIn,'
      'substr(ConAtrasos, 1, 50) ConAtrasos,'
      
        'substr(CuenCredAbierInstBancUlt12mes, 1, 50) CuenCredAbierInstBa' +
        'ncUlt12mes,'
      'substr(IndPerMorales, 1, 50) IndPerMorales,'
      'substr(LugarRadica, 1, 50) LugarRadica,'
      
        'substr(MonMaxCredOtorInstBanExpUDIS, 1, 50) MonMaxCredOtorInstBa' +
        'nExpUDIS,'
      
        'substr(MonTotPagInfonavitUltBimestre, 1, 50) MonTotPagInfonavitU' +
        'ltBimestre,'
      
        'substr(NumDiasAtrInfonavitUltBimestre, 1, 50) NumDiasAtrInfonavi' +
        'tUltBimestre,'
      'substr(NumDiasMoraPromInstBanc, 1, 50) NumDiasMoraPromInstBanc,'
      
        'substr(NumMesUltCredAbiUlt12Meses, 1, 50) NumMesUltCredAbiUlt12M' +
        'eses,'
      
        'substr(NumPagTiemIntBanUlt12Meses, 1, 50) NumPagTiemIntBanUlt12M' +
        'eses,'
      
        'substr(PorPagEntCom60oMasAtraso, 1, 50) PorPagEntCom60oMasAtraso' +
        ','
      'substr(PorPagIntBan1a29Atraso, 1, 50) PorPagIntBan1a29Atraso,'
      
        'substr(PorPagIntBan60oMasAtraso, 1, 50) PorPagIntBan60oMasAtraso' +
        ','
      
        'substr(PorPagIntBan90oMasAtraso, 1, 50) PorPagIntBan90oMasAtraso' +
        ','
      'substr(PorPagoTiemInstNoBanc, 1, 50) PorPagoTiemInstNoBanc,'
      'substr(ProcOriAdmonCred, 1, 50) ProcOriAdmonCred,'
      'substr(QuitasCastRest, 1, 50) QuitasCastRest,'
      'substr(TasaRetLab, 1, 50) TasaRetLab'
      'from ('
      '    select'
      '     anx21.id1 CodigoDeudor,'
      
        '     MAX (DECODE ( anx21. variable , '#39'VENTNETTOTANUALES_21'#39' , an' +
        'x21. valor)) as VentNetTotAnuales,'
      
        '     MAX (DECODE ( anx21. variable , '#39'FECHA_BURO_21'#39' , anx21. va' +
        'lor)) as FechaBuroCredito,'
      
        '     MAX (DECODE ( anx21. variable , '#39'ANTSOCINFCREDCREDITO_21'#39' ,' +
        ' anx21. valor)) as AntSocInfCredCredito,'
      
        '     MAX (DECODE ( anx21. variable , '#39'CALCREDAGENCIACAL_21'#39' , an' +
        'x21. valor)) as Var_00073,'
      
        '     MAX (DECODE ( anx21. variable , '#39'CONATRASOS_21'#39' , anx21. va' +
        'lor)) as ConAtrasos,'
      
        '     MAX (DECODE ( anx21. variable , '#39'EXPER_INTERNA_21'#39' , anx21.' +
        ' valor)) as  ExperienciaIn,'
      
        '     MAX (DECODE ( anx21. variable , '#39'CUENCREDABIERINSTBANCULT12' +
        'MES_21'#39' , anx21. valor)) as CuenCredAbierInstBancUlt12mes,'
      
        '     MAX (DECODE ( anx21. variable , '#39'EXPNEGATIVASPAG_21'#39' , anx2' +
        '1. valor)) as Var_00074,'
      
        '     MAX (DECODE ( anx21. variable , '#39'INDPERMORALES_21'#39' , anx21.' +
        ' valor)) as IndPerMorales,'
      
        '     MAX (DECODE ( anx21. variable , '#39'LUGARRADICA_21'#39' , anx21. v' +
        'alor)) as LugarRadica,'
      
        '     MAX (DECODE ( anx21. variable , '#39'MONMAXCREDOTORINSTBANEXPUD' +
        'IS_21'#39' , anx21. valor)) as MonMaxCredOtorInstBanExpUDIS,'
      
        '     MAX (DECODE ( anx21. variable , '#39'MONTOTPAGINFONAVITULTBIMES' +
        'TRE_21'#39' , anx21. valor)) as MonTotPagInfonavitUltBimestre,'
      
        '     MAX (DECODE ( anx21. variable , '#39'NUMDIASATRINFONAVITULTBIME' +
        'STRE_21'#39' , anx21. valor)) as NumDiasAtrInfonavitUltBimestre,'
      
        '     MAX (DECODE ( anx21. variable , '#39'NUMDIASMORAPROMINSTBANC_21' +
        #39' , anx21. valor)) as NumDiasMoraPromInstBanc,'
      
        '     MAX (DECODE ( anx21. variable , '#39'NUMMESULTCREDABIULT12MESES' +
        '_21'#39' , anx21. valor)) as NumMesUltCredAbiUlt12Meses,'
      
        '     MAX (DECODE ( anx21. variable , '#39'NUMPAGTIEMINTBANULT12MESES' +
        '_21'#39' , anx21. valor)) as NumPagTiemIntBanUlt12Meses,'
      
        '     MAX (DECODE ( anx21. variable , '#39'PORPAGENTCOM60OMASATRASO_2' +
        '1'#39' , anx21. valor)) as PorPagEntCom60oMasAtraso,'
      
        '     MAX (DECODE ( anx21. variable , '#39'PORPAGINTBAN1A29ATRASO_21'#39 +
        ' , anx21. valor)) as PorPagIntBan1a29Atraso,'
      
        '     MAX (DECODE ( anx21. variable , '#39'PORPAGINTBAN60OMASATRASO_2' +
        '1'#39' , anx21. valor)) as PorPagIntBan60oMasAtraso,'
      
        '     MAX (DECODE ( anx21. variable , '#39'PORPAGINTBAN90OMASATRASO_2' +
        '1'#39' , anx21. valor)) as PorPagIntBan90oMasAtraso,'
      
        '     MAX (DECODE ( anx21. variable , '#39'PORPAGOTIEMINSTNOBANC_21'#39' ' +
        ', anx21. valor)) as PorPagoTiemInstNoBanc,'
      
        '     MAX (DECODE ( anx21. variable , '#39'PROCORIADMONCRED_21'#39' , anx' +
        '21. valor)) as ProcOriAdmonCred,'
      
        '     MAX (DECODE ( anx21. variable , '#39'QUITASCASTREST_21'#39' , anx21' +
        '. valor)) as QuitasCastRest,'
      
        '     MAX (DECODE ( anx21. variable , '#39'TASARETLAB_21'#39' , anx21. va' +
        'lor)) as TasaRetLab'
      '    from ('
      
        '           select ID_PERSONA, ID1, ID_MODELO , ID_VARIABLE, VARI' +
        'ABLE '
      
        '                 , (case when  (id_variable = (select PkgCrAdmin' +
        'Comercial.Fnc_Obt_ID_Var('#39'EXPER_INTERNA_21'#39') from dual)) /* EXPE' +
        'R_INTERNA_21 */'
      
        '                                                 and ( to_number' +
        '(Valor) > 0  ) then '#39'0'#39
      
        '                         when  (id_variable = (select PkgCrAdmin' +
        'Comercial.Fnc_Obt_ID_Var('#39'EXPER_INTERNA_21'#39') from dual)) /* EXPE' +
        'R_INTERNA_21 */'
      
        '                                                 and ( to_number' +
        '(Valor) = 0  ) then '#39'1'#39'                                         ' +
        '    '
      '                    else Valor '
      '                   end) VALOR'
      '                 , PERIODO'
      '           from ('
      
        '                   select valor. id_persona, per .id1, valor.id_' +
        'modelo , valor.id_variable,'
      '                         var .nombre Variable,'
      
        '                         (case when valor.sit_valor_var = '#39'IN'#39' t' +
        'hen null else'
      
        '                                         ( '#39#39' || valor .valor_nu' +
        'merico || valor.valor_fecha || trim( valor. Valor_cadena ) )'
      '                                     end) Valor'
      
        '                               ,valor. PERIODO, valor .sit_valor' +
        '_var'
      
        '                               ,ROW_NUMBER () OVER (PARTITION BY' +
        ' valor.id_persona, valor.id_modelo , valor. id_variable ORDER BY' +
        ' valor.PERIODO desc) renglon'
      '                   from CR_MET_VALOR_VAR valor'
      '                             inner join ('
      
        '                                               select  vbl. id_m' +
        'odelo,'
      
        '                                                          vbl .i' +
        'd_variable, var.nombre'
      
        '                                               from CR_MET_VAR_B' +
        'LOQUE vbl'
      
        '                                                           inner' +
        ' join CR_MET_VARIABLE var on (var. id_variable = vbl .id_variabl' +
        'e)'
      
        '                                               where 2 = 2 and v' +
        'ar.id_variable <> (select PkgCrAdminComercial.Fnc_Obt_ID_Var('#39'TR' +
        'YURL'#39') from dual)'
      
        '                                           ) var on (var .id_mod' +
        'elo = valor.id_modelo and var.id_variable = valor. id_variable)'
      
        '                          inner join (select t1 .id_persona, t1.' +
        'id1 , t2. Nombre'
      '                                      from CR_MET_PERSONA t1'
      
        '                                         inner join PERSONA t2 o' +
        'n ( t2.id_persona = t1.id1 )'
      '                                      where 2 = 2'
      
        '                                     ) per on (per .id_persona =' +
        ' valor.id_persona)'
      
        '                   where valor. id_modelo = (select id_modelo fr' +
        'om cr_met_modelo where trim(nombre) = '#39'ANEXO21'#39')'
      '                   --and valor. id_persona in (24)   ---- ojo'
      '           ) datos where 2 = 2 and datos .renglon = 1'
      '    ) anx21'
      '    group by anx21.id1'
      ') t1'
      '')
    Left = 456
    Top = 184
  end
  object qryRAnexo20: TQuery
    SQL.Strings = (
      ''
      'select'
      #9'substr(ID_ACREDITADO,1,50) ID_ACREDITADO,'
      #9'substr(FECHAACTIVOTOTAL,1,50) FECHAACTIVOTOTAL,'
      #9'substr(FECHAINFOFINANC,1,50) FECHAINFOFINANC,'
      #9'substr(FECHABUROCREDITO,1,50) FECHABUROCREDITO,'
      #9'substr(INSTITUCIONCREDITOSINO,1,50) INSTITUCIONCREDITOSINO,'
      #9'substr(VAR_00172,1,50) ACREDIT_OTORGANTE_CRED,'
      #9'substr(ENTFINACREOTORGANTESCRE,1,50) ENTFINACREOTORGANTESCRE,'
      #9'substr(VAR_00174,1,50) ACREDIT_SUBCAT_INSTIUCION,'
      #9'substr(ACTIVOSUJETORIESGO,1,50) ACTIVOSUJETORIESGO,'
      #9'substr(ACTIVOTOTALTRIMESTRAL,1,50) ACTIVOTOTALTRIMESTRAL,'
      #9'substr(ACTIVOTOTAL,1,50) ACTIVOTOTAL,'
      #9'substr(CALGOBCORP,1,50) CALGOBCORP,'
      #9'substr(CAPITALCONTABLE,1,50) CAPITALCONTABLE,'
      #9'substr(CAPITALNETO,1,50) CAPITALNETO,'
      #9'substr(COMISIONESCOBRADAS,1,50) COMISIONESCOBRADAS,'
      #9'substr(COMISIONESPAGADAS,1,50) COMISIONESPAGADAS,'
      #9'substr(COMPACCIONARIA,1,50) COMPACCIONARIA,'
      #9'substr(CONSEJEROSINDEPENDIENTES,1,50) CONSEJEROSINDEPENDIENTES,'
      #9'substr(DIVLINNEG,1,50) DIVLINNEG,'
      #9'substr(DIVTIPFUEFIN,1,50) DIVTIPFUEFIN,'
      #9'substr(EDOFINAUDIT,1,50) EDOFINAUDIT,'
      #9'substr(EFICIENCIA,1,50) EFICIENCIA,'
      #9'substr(EMITITDEUPUB,1,50) EMITITDEUPUB,'
      #9'substr(ENTFINSUJREGBAN,1,50) ENTFINSUJREGBAN,'
      #9'substr(EXPFUNADMON,1,50) EXPFUNADMON,'
      #9'substr(EXPPOLPROC,1,50) EXPPOLPROC,'
      #9'substr(GASTOADMONPROMO,1,50) GASTOADMONPROMO,'
      #9'substr(GASTOSXINTERES,1,50) GASTOSXINTERES,'
      #9'substr(INGRESOSXINTERES,1,50) INGRESOSXINTERES,'
      #9'substr(LIQUIDEZ,1,50) LIQUIDEZ,'
      #9'substr(MONTOACREMAYORES,1,50) MONTOACREMAYORES,'
      #9'substr(MONTOCARTERAVENCIDA,1,50) MONTOCARTERAVENCIDA,'
      #9'substr(MONTOCARTERAVIGENTE,1,50) MONTOCARTERAVIGENTE,'
      #9'substr(MONTODISPONIBILIDADES,1,50) MONTODISPONIBILIDADES,'
      #9'substr(MONTOINVERVALORES,1,50) MONTOINVERVALORES,'
      #9'substr(MONTORESERVA,1,50) MONTORESERVA,'
      #9'substr(RESERVARESULTADOS,1,50) RESERVARESULTADOS,'
      
        #9'substr(MONTOTPAGINFONAVITULTBIMESTRE,1,50) MONTOTPAGINFONAVITUL' +
        'TBIMESTRE,'
      #9'substr(MONTOVALORESDERIVADOS,1,50) MONTOVALORESDERIVADOS,'
      
        #9'substr(NUMDIASATRINFONAVITULTBIMESTRE,1,50) NUMDIASATRINFONAVIT' +
        'ULTBIMESTRE,'
      #9'substr(NUMDIASMORAPROMINSTBANC,1,50) NUMDIASMORAPROMINSTBANC,'
      #9'substr(PASEXIINMEDIATA,1,50) PASEXIINMEDIATA,'
      #9'substr(PASLARGOPLAZO,1,50) PASLARGOPLAZO,'
      #9'substr(PORPAGOTIEMINSTBANC,1,50) PORPAGOTIEMINSTBANC,'
      #9'substr(PORPAGOTIEMINSTNOBANC,1,50) PORPAGOTIEMINSTNOBANC,'
      #9'substr(RESXINTERMEDIACION,1,50) RESXINTERMEDIACION,'
      #9'substr(SOLVENCIA,1,50) SOLVENCIA,'
      #9'substr(TOTALCONSEJEROS,1,50) TOTALCONSEJEROS,'
      #9'substr(UTILNETATRIMESTRE,1,50) UTILNETATRIMESTRE,'
      #9'substr(ORGDESCPARTIDOPOLITICO,1,50) ORGDESCPARTIDOPOLITICO,'
      #9'substr(COMISIONESNETAS,1,50) COMISIONESNETAS,'
      #9'substr(FECHATITULOSDEUDA,1,50) FECHATITULOSDEUDA'
      'from ('
      #9#9'select '
      #9#9' vxp.id1 ID_ACREDITADO, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'ACTIVOTOTAL_20'#39', vxp .valor)) as ' +
        'ActivoTotal, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'NUMDIASMORAPROMINSTBANC_20'#39' , vxp' +
        ' .valor)) as NumDiasMoraPromInstBanc, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'PORPAGOTIEMINSTBANC_20'#39' , vxp .va' +
        'lor)) as PorPagoTiemInstBanc, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'PORPAGOTIEMINSTNOBANC_20'#39' , vxp .' +
        'valor)) as PorPagoTiemInstNoBanc, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'ACREDIT_ORGANISMO_SINO'#39' , vxp .va' +
        'lor)) as OrgDescPartidoPolitico, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'ENTFINSUJREGBAN_20'#39', vxp .valor))' +
        ' as EntFinSujRegBan , ---- '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'PASEXIINMEDIATA_20'#39', vxp .valor))' +
        ' as PasExiInmediata , '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'PASLARGOPLAZO_20'#39' , vxp .valor)) ' +
        'as PasLargoPlazo, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'UTILNETATRIMESTRE_20'#39' , vxp .valo' +
        'r)) as UtilNetaTrimestre, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'CAPITALCONTABLE_20'#39', vxp .valor))' +
        ' as CapitalContable , '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'INSTITUCIONCREDITOSINO_20'#39' , vxp ' +
        '.valor)) as InstitucionCreditoSiNo, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'CAPITALNETO_20'#39', vxp .valor)) as ' +
        'CapitalNeto, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'ACTIVOSUJETORIESGO_20'#39' , vxp .val' +
        'or)) as ActivoSujetoRiesgo, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'ACTIVOTOTALTRIMESTRAL_20'#39' , vxp .' +
        'valor)) as ActivoTotalTrimestral, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'GASTOADMONPROMO_20'#39', vxp .valor))' +
        ' as GastoAdmonPromo, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'INGRESOSXINTERES_20'#39' , vxp .valor' +
        ')) as IngresosXInteres, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'COMISIONESNETAS_20'#39', vxp .valor))' +
        ' as ComisionesNetas, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'RESXINTERMEDIACION_20'#39' , vxp .val' +
        'or)) as ResXIntermediacion, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'COMISIONESCOBRADAS_20'#39' , vxp .val' +
        'or)) as ComisionesCobradas, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'COMISIONESPAGADAS_20'#39' , vxp .valo' +
        'r)) as ComisionesPagadas, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'MONTOCARTERAVENCIDA_20'#39' , vxp .va' +
        'lor)) as MontoCarteraVencida, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'MONTORESERVA_20'#39', vxp .valor)) as' +
        ' MontoReserva, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'MONTORESERVA_RESULT_20'#39', vxp .val' +
        'or)) as ReservaResultados, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'GASTOSXINTERES_20'#39', vxp .valor)) ' +
        'as GastosXInteres, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'MONTODISPONIBILIDADES_20'#39' , vxp .' +
        'valor)) as MontoDisponibilidades, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'MONTOINVERVALORES_20'#39' , vxp .valo' +
        'r)) as MontoInverValores, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'MONTOCARTERAVIGENTE_20'#39' , vxp .va' +
        'lor)) as MontoCarteraVigente, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'MONTOVALORESDERIVADOS_20'#39' , vxp .' +
        'valor)) as MontoValoresDerivados, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'EMITITDEUPUB_20'#39', vxp .valor)) as' +
        ' EmiTitDeuPub, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'EMIFECHACONSUULTA_20'#39', vxp .valor' +
        ')) as FechaTitulosDeuda, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'MONTOTPAGINFONAVITULTBIMESTRE_20'#39 +
        ' , vxp.valor)) as MonTotPagInfonavitUltBimestre, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'NUMDIASATRINFONAVITULTBIMESTRE_20' +
        #39' , vxp.valor)) as NumDiasAtrInfonavitUltBimestre, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'SOLVENCIA_20'#39', vxp .valor)) as So' +
        'lvencia, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'LIQUIDEZ_20'#39', vxp .valor)) as Liq' +
        'uidez, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'EFICIENCIA_20'#39', vxp .valor)) as E' +
        'ficiencia, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'DIVLINNEG_20'#39', vxp .valor)) as Di' +
        'vLinNeg, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'DIVTIPFUEFIN_20'#39', vxp .valor)) as' +
        ' DivTipFueFin, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'MONTOACREMAYORES_20'#39' , vxp .valor' +
        ')) as MontoAcreMayores, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'CONSEJEROSINDEPENDIENTES_20'#39' , vx' +
        'p .valor)) as ConsejerosIndependientes, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'TOTALCONSEJEROS_20'#39', vxp .valor))' +
        ' as TotalConsejeros, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'COMPACCIONARIA_20'#39', vxp .valor)) ' +
        'as CompAccionaria, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'CALGOBCORP_20'#39', vxp .valor)) as C' +
        'alGobCorp, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'EXPFUNADMON_20'#39', vxp .valor)) as ' +
        'ExpFunAdmon, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'EXPPOLPROC_20'#39', vxp .valor)) as E' +
        'xpPolProc, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'EDOFINAUDIT_20'#39', vxp .valor)) as ' +
        'EdoFinAudit, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'ACREDIT_OTORGANTE_CREDITO'#39' , vxp ' +
        '.valor)) as EntFinAcreOtorgantesCre, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'ACREDIT_OTORGANTE_CRED'#39' , vxp .va' +
        'lor)) as Var_00172, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'ACREDIT_SUBCAT_INSTIUCION'#39' , vxp ' +
        '.valor)) as Var_00174, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'ACREDIT_FECHA_ACTIVO_TOT'#39' , vxp .' +
        'valor)) as FechaActivoTotal, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'FECHAINFOFINANC_20'#39' , vxp .valor)' +
        ') as FechaInfoFinanc, '
      
        #9#9' MAX(DECODE (vxp. variable, '#39'FECHA_BURO_20'#39' , vxp .valor)) as ' +
        'FechaBuroCredito '
      #9#9'from ( '
      #9#9' select ID_PERSONA, ID1, ID_MODELO , ID_VARIABLE, VARIABLE '
      
        #9#9'  ,(case when instr(Valor, '#39'|'#39') > 0 then '#39#39'||(TO_NUMBER(FUN_OC' +
        'URRENCE_CHR(Valor, '#39'|'#39')) + 1) '
      #9#9#9'  else Valor '
      #9#9#9'  end) VALOR '
      #9#9'  , PERIODO '
      #9#9' from ( '
      
        #9#9#9#9#9'   select valor. id_persona, per .id1, valor.id_modelo , va' +
        'lor.id_variable, '
      #9#9#9#9#9#9#9' var .nombre Variable, '
      #9#9#9#9#9#9#9' (case when valor.sit_valor_var = '#39'IN'#39' then null else '
      
        #9#9#9#9#9#9#9#9#9#9#9' ( '#39#39' || valor .valor_numerico || valor.valor_fecha |' +
        '| trim( valor. Valor_cadena ) ) '
      #9#9#9#9#9#9#9#9#9#9' end) Valor '
      #9#9#9#9#9#9#9#9'   ,valor. PERIODO, valor .sit_valor_var '
      
        #9#9#9#9#9#9#9#9'   ,ROW_NUMBER () OVER (PARTITION BY valor.id_persona, v' +
        'alor.id_modelo , valor. id_variable ORDER BY valor.PERIODO desc)' +
        ' renglon '
      #9#9#9#9#9'   from CR_MET_VALOR_VAR valor '
      #9#9#9#9#9#9#9#9' inner join ( '
      #9#9#9#9#9#9#9#9#9#9#9#9'   select  vbl. id_modelo, '
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'  vbl .id_variable, var.nombre '
      #9#9#9#9#9#9#9#9#9#9#9#9'   from CR_MET_VAR_BLOQUE vbl '
      
        #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'   inner join CR_MET_VARIABLE var on (var. id_var' +
        'iable = vbl .id_variable) '
      #9#9#9#9#9#9#9#9#9#9#9#9'   where 2 = 2 '
      
        #9#9#9#9#9#9#9#9#9#9#9#9#9' and var.id_variable <> (select PkgCrAdminComercial' +
        '.Fnc_Obt_ID_Var('#39'TRYURL'#39') from dual) '
      
        #9#9#9#9#9#9#9#9#9#9#9'   ) var on (var .id_modelo = valor.id_modelo and var' +
        '.id_variable = valor. id_variable) '
      #9#9#9#9#9#9#9'  inner join (select t1 .id_persona, t1.id1 , t2. Nombre '
      #9#9#9#9#9#9#9#9#9#9'  from CR_MET_PERSONA t1 '
      #9#9#9#9#9#9#9#9#9#9#9' inner join PERSONA t2 on ( t2.id_persona = t1.id1 ) '
      #9#9#9#9#9#9#9#9#9#9'  where 2 = 2 '
      #9#9#9#9#9#9#9#9#9#9' ) per on (per .id_persona = valor.id_persona) '
      
        #9#9#9#9#9'   where valor. id_modelo = (select id_modelo from cr_met_m' +
        'odelo where trim(nombre) = '#39'ANEXO20'#39') '
      #9#9#9#9#9'   ---and valor. id_persona in (11, 19, 15)   ---- ojo '
      
        #9#9#9#9#9'   ---and valor. PERIODO = (select max(periodo) from CR_MET' +
        '_VALOR_VAR '
      
        #9#9#9#9#9#9#9#9#9#9#9' ---where id_modelo = (select id_modelo from cr_met_m' +
        'odelo where trim(nombre) = '#39'ANEXO20'#39') ) '
      #9#9#9'   ) datos where 2 = 2 and datos .renglon = 1 '
      #9#9') vxp group by vxp .id1'
      #9')')
    Left = 456
    Top = 144
  end
  object qryRAnexo22: TQuery
    SQL.Strings = (
      'select '
      'substr(CODIGODEUDOR, 1, 50) CODIGODEUDOR,'
      'substr(NUMDIASMORAPROMINSTBANC, 1, 50) NUMDIASMORAPROMINSTBANC,'
      'substr(PORPAGOTIEMINSTBANC, 1, 50) PORPAGOTIEMINSTBANC,'
      'substr(NUMINSTREPULT12MESES, 1, 50) NUMINSTREPULT12MESES,'
      'substr(PORPAGOTIEMINSTNOBANC, 1, 50) PORPAGOTIEMINSTNOBANC,'
      
        'substr(MONTOTPAGINFONAVITULTBIMESTRE, 1, 50) MONTOTPAGINFONAVITU' +
        'LTBIMESTRE,'
      
        'substr(NUMDIASATRINFONAVITULTBIMESTRE, 1, 50) NUMDIASATRINFONAVI' +
        'TULTBIMESTRE,'
      'substr(TASARETLAB, 1, 50) TASARETLAB,'
      'substr(VENTNETTOTANUALES, 1, 50) VENTNETTOTANUALES,'
      'substr(ACTTOTALANUAL, 1, 50) ACTTOTALANUAL,'
      'substr(ACTIVOCIRCULANTE, 1, 50) ACTIVOCIRCULANTE,'
      'substr(PASIVOCIRCULANTE, 1, 50) PASIVOCIRCULANTE,'
      'substr(UTILIDADNETA, 1, 50) UTILIDADNETA,'
      'substr(CAPITALCONTABLE, 1, 50) CAPITALCONTABLE,'
      'substr(INDCALESTAECONO, 1, 50) INDCALESTAECONO,'
      'substr(INTCARCOMPETENCIA, 1, 50) INTCARCOMPETENCIA,'
      'substr(PROVEDORES, 1, 50) PROVEDORES,'
      'substr(CLIENTES, 1, 50) CLIENTES,'
      'substr(EDOFINAUDIT, 1, 50) EDOFINAUDIT,'
      'substr(NUMAGECALF, 1, 50) NUMAGECALF,'
      'substr(INDCONSADMON, 1, 50) INDCONSADMON,'
      'substr(ESTRUCORG, 1, 50) ESTRUCORG,'
      'substr(COMPACCIONARIA, 1, 50) COMPACCIONARIA,'
      'substr(LIQUIDEZOPER, 1, 50) LIQUIDEZOPER,'
      'substr(GASTOSFINANCIEROS, 1, 50) GASTOSFINANCIEROS,'
      'substr(UAFIR, 1, 50) UAFIR,'
      'substr(LUGARRADICA, 1, 50) LUGARRADICA,'
      'substr(VAR_00101, 1, 50) CALCREDAGENCIACAL,'
      'substr(ORGDESCPARTIDOPOLITICO, 1, 50) ORGDESCPARTIDOPOLITICO,'
      'substr(FECHAINFOFINANC, 1,50) FECHAINFOFINANC,'
      'substr(FECHABUROCREDITO, 1, 50) FECHABUROCREDITO'
      'from ('
      '    select '
      '        anx22.id1 CodigoDeudor, '
      
        '    MAX (DECODE ( anx22. variable , '#39'NUMDIASMORAPROMINSTBANC_22'#39 +
        ' , anx22. valor)) as NumDiasMoraPromInstBanc, '
      
        '    MAX (DECODE ( anx22. variable , '#39'PORPAGOTIEMINSTBANC_22'#39' , a' +
        'nx22. valor)) as PorPagoTiemInstBanc, '
      
        '    MAX (DECODE ( anx22. variable , '#39'NUMINSTREPULT12MESES_22'#39' , ' +
        'anx22. valor)) as NumInstRepUlt12Meses, '
      
        '    MAX (DECODE ( anx22. variable , '#39'PORPAGOTIEMINSTNOBANC_22'#39' ,' +
        ' anx22. valor)) as PorPagoTiemInstNoBanc, '
      
        '    MAX (DECODE ( anx22. variable , '#39'MONTOTPAGINFONAVITULTBIMEST' +
        'RE_22'#39' , anx22. valor)) as MonTotPagInfonavitUltBimestre, '
      
        '    MAX (DECODE ( anx22. variable , '#39'NUMDIASATRINFONAVITULTBIMES' +
        'TRE_22'#39' , anx22. valor)) as NumDiasAtrInfonavitUltBimestre, '
      
        '    MAX (DECODE ( anx22. variable , '#39'TASARETLAB_22'#39' , anx22. val' +
        'or)) as TasaRetLab, '
      
        '    MAX (DECODE ( anx22. variable , '#39'VENTASNETASTOTALESANUALES_2' +
        '2'#39' , anx22. valor)) as VentNetTotAnuales, '
      
        '    MAX (DECODE ( anx22. variable , '#39'ACTIVOTOTALANUAL_22'#39' , anx2' +
        '2. valor)) as ActTotalAnual, '
      
        '    MAX (DECODE ( anx22. variable , '#39'ACTIVOCIRCULANTE_22'#39' , anx2' +
        '2. valor)) as ActivoCirculante, '
      
        '    MAX (DECODE ( anx22. variable , '#39'PASIVOCIRCULANTE_22'#39' , anx2' +
        '2. valor)) as PasivoCirculante, '
      
        '    MAX (DECODE ( anx22. variable , '#39'UTILIDADNETATRIMANUALIZADA_' +
        '22'#39' , anx22. valor)) as UtilidadNeta, '
      
        '    MAX (DECODE ( anx22. variable , '#39'CAPITALCONTABLEPROMEDIO_22'#39 +
        ' , anx22. valor)) as CapitalContable, '
      
        '    MAX (DECODE ( anx22. variable , '#39'INDCALESTAECONO_22'#39' , anx22' +
        '. valor)) as IndCalEstaEcono, '
      
        '    MAX (DECODE ( anx22. variable , '#39'INTCARCOMPETENCIA_22'#39' , anx' +
        '22. valor)) as IntCarCompetencia, '
      
        '    MAX (DECODE ( anx22. variable , '#39'PROVEEDORES_22'#39' , anx22. va' +
        'lor)) as Provedores, '
      
        '    MAX (DECODE ( anx22. variable , '#39'CLIENTES_22'#39' , anx22. valor' +
        ')) as Clientes, '
      
        '    MAX (DECODE ( anx22. variable , '#39'EDOFINAUDIT_22'#39' , anx22. va' +
        'lor)) as EdoFinAudit, '
      
        '    MAX (DECODE ( anx22. variable , '#39'NUMAGECALF_22'#39' , anx22. val' +
        'or)) as NumAgeCalf, '
      
        '    MAX (DECODE ( anx22. variable , '#39'INDCONSADMON_22'#39' , anx22. v' +
        'alor)) as IndConsAdmon, '
      
        '    MAX (DECODE ( anx22. variable , '#39'ESTRUCORG_22'#39' , anx22. valo' +
        'r)) as EstrucOrg, '
      
        '    MAX (DECODE ( anx22. variable , '#39'COMPACCIONARIA_22'#39' , anx22.' +
        ' valor)) as CompAccionaria, '
      
        '    MAX (DECODE ( anx22. variable , '#39'LIQUIDEZOPER_22'#39' , anx22. v' +
        'alor)) as LiquidezOper, '
      
        '    MAX (DECODE ( anx22. variable , '#39'GASTOSFINANCIEROS_22'#39' , anx' +
        '22. valor)) as GastosFinancieros, '
      
        '    MAX (DECODE ( anx22. variable , '#39'UAFIR_22'#39' , anx22. valor)) ' +
        'as UAFIR, '
      
        '    MAX (DECODE ( anx22. variable , '#39'LUGARRADICA_22'#39' , anx22. va' +
        'lor)) as LugarRadica, '
      
        '    MAX (DECODE ( anx22. variable , '#39'CALCREDAGENCIACAL_22'#39' , anx' +
        '22. valor)) as Var_00101, '
      
        '    MAX (DECODE ( anx22. variable , '#39'PARTIDOPOLITICO_22'#39' , anx22' +
        '. valor)) as OrgDescPartidoPolitico, '
      
        '    MAX (DECODE ( anx22. variable , '#39'FECHAINFOFINANC_22'#39' , anx22' +
        '. valor)) as FechaInfoFinanc, '
      
        '    MAX (DECODE ( anx22. variable , '#39'FECHA_BURO_22'#39' , anx22. val' +
        'or)) as FechaBuroCredito '
      '    from ( '
      
        '           select ID_PERSONA, ID1, ID_MODELO , ID_VARIABLE, VARI' +
        'ABLE '
      
        '                 ,(case when instr(Valor , '#39'|'#39' ) > 0 then '#39#39'||( ' +
        'TO_NUMBER( FUN_OCURRENCE_CHR (Valor , '#39'|'#39' )) + 1) '
      '                         else Valor '
      '                         end) VALOR '
      '                 , PERIODO '
      '           from ( '
      
        '                   select valor. id_persona, per .id1, valor.id_' +
        'modelo , valor.id_variable, '
      '                         var .nombre Variable, '
      
        '                         (case when valor.sit_valor_var = '#39'IN'#39' t' +
        'hen null else '
      
        '                                         ( '#39#39' || valor .valor_nu' +
        'merico || valor.valor_fecha || trim( valor. Valor_cadena ) ) '
      '                                     end) Valor '
      
        '                               ,valor. PERIODO, valor .sit_valor' +
        '_var '
      
        '                               ,ROW_NUMBER () OVER (PARTITION BY' +
        ' valor.id_persona, valor.id_modelo , valor. id_variable ORDER BY' +
        ' valor.PERIODO desc) renglon '
      '                   from CR_MET_VALOR_VAR valor '
      '                             inner join ( '
      
        '                                               select  vbl. id_m' +
        'odelo, '
      
        '                                                          vbl .i' +
        'd_variable, var.nombre '
      
        '                                               from CR_MET_VAR_B' +
        'LOQUE vbl '
      
        '                                                           inner' +
        ' join CR_MET_VARIABLE var on (var. id_variable = vbl .id_variabl' +
        'e) '
      
        '                                               where 2 = 2 and v' +
        'ar.id_variable <> (select PkgCrAdminComercial.Fnc_Obt_ID_Var('#39'TR' +
        'YURL'#39') from dual) '
      
        '                                           ) var on (var .id_mod' +
        'elo = valor.id_modelo and var.id_variable = valor. id_variable) '
      
        '                          inner join (select t1 .id_persona, t1.' +
        'id1 , t2. Nombre '
      '                                      from CR_MET_PERSONA t1 '
      
        '                                         inner join PERSONA t2 o' +
        'n ( t2.id_persona = t1.id1 ) '
      '                                      where 2 = 2 '
      
        '                                     ) per on (per .id_persona =' +
        ' valor.id_persona) '
      
        '                   where valor. id_modelo =  (select id_modelo f' +
        'rom cr_met_modelo where trim(nombre) = '#39'ANEXO22'#39') '
      '                   --and valor. id_persona in (24)   ---- ojo '
      
        '                   --and valor. PERIODO = ( select max(periodo) ' +
        'from CR_MET_VALOR_VAR '
      
        #9#9#9'   '#9'   '#9#9'  '#9#9'  '#9' --where id_modelo = (select id_modelo from c' +
        'r_met_modelo where trim(nombre) = '#39'ANEXO22'#39') ) '
      '           ) datos where 2 = 2 and datos .renglon = 1 '
      '    ) anx22 '
      '    group by anx22.id1'
      ') datos')
    Left = 456
    Top = 224
  end
  object qryRAnexoGn: TQuery
    SQL.Strings = (
      'select '
      'substr(EntidadFinanciera, 1, 50) EntidadFinanciera,'
      'substr(FechaInfoFinanciera, 1 , 50) FechaInfoFinanciera,'
      'substr(VentasTotales, 1, 50) VentasTotales,'
      'substr(LugarRecidencia, 1, 50) LugarRecidencia'
      'from ('
      #9'select'
      #9#9' caratula.id1 id_acreditado,'
      
        #9#9' MAX (DECODE ( caratula.variable , '#39'ACREDIT_ENTIDAD_FINANC'#39', c' +
        'aratula.valor)) as EntidadFinanciera,'
      
        #9#9' MAX (DECODE ( caratula.variable , '#39'ACREDIT_FH_INF_FINANC'#39', ca' +
        'ratula.valor)) as FechaInfoFinanciera,'
      
        #9#9' MAX (DECODE ( caratula.variable , '#39'ACREDIT_VENT_NET_TOT_ANUAL' +
        'ES'#39', caratula.valor)) as VentasTotales,'
      
        #9#9' MAX (DECODE ( caratula.variable , '#39'ACREDIT_LUGAR_RECIDE'#39', car' +
        'atula.valor)) as LugarRecidencia'
      #9#9'from ('
      #9#9#9#9'select ID_PERSONA, ID1, ID_MODELO , ID_VARIABLE, VARIABLE '
      #9#9#9#9#9'  , Valor '
      #9#9#9#9#9'  , PERIODO'
      #9#9#9#9'from ('
      
        #9#9#9#9#9#9'select valor. id_persona, per .id1, valor.id_modelo , valo' +
        'r.id_variable,'
      #9#9#9#9#9#9#9'  var .nombre Variable,'
      #9#9#9#9#9#9#9'  (case when valor.sit_valor_var = '#39'IN'#39' then null else'
      
        #9#9#9#9#9#9#9#9#9#9#9'  ( '#39#39' || valor .valor_numerico || valor.valor_fecha ' +
        '|| trim( valor. Valor_cadena ) )'
      #9#9#9#9#9#9#9#9#9#9'  end) Valor'
      #9#9#9#9#9#9#9#9#9',valor. PERIODO, valor .sit_valor_var'
      
        #9#9#9#9#9#9#9#9#9',ROW_NUMBER () OVER (PARTITION BY valor.id_persona, val' +
        'or.id_modelo , valor. id_variable ORDER BY valor.PERIODO desc) r' +
        'englon'
      #9#9#9#9#9#9'from CR_MET_VALOR_VAR valor'
      #9#9#9#9#9#9#9#9'  inner join ('
      #9#9#9#9#9#9#9#9#9#9#9#9#9'select  vbl. id_modelo,'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'   vbl .id_variable, var.nombre'
      #9#9#9#9#9#9#9#9#9#9#9#9#9'from CR_MET_VAR_BLOQUE vbl'
      
        #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'inner join CR_MET_VARIABLE var on (var. id_varia' +
        'ble = vbl .id_variable)'
      
        #9#9#9#9#9#9#9#9#9#9#9#9#9'where 2 = 2 and var.id_variable <> (select PkgCrAdm' +
        'inComercial.Fnc_Obt_ID_Var('#39'TRYURL'#39') from dual)'
      
        #9#9#9#9#9#9#9#9#9#9#9#9') var on (var .id_modelo = valor.id_modelo and var.i' +
        'd_variable = valor. id_variable)'
      #9#9#9#9#9#9#9'   inner join (select t1 .id_persona, t1.id1 , t2. Nombre'
      #9#9#9#9#9#9#9#9#9#9'   from CR_MET_PERSONA t1'
      #9#9#9#9#9#9#9#9#9#9#9'  inner join PERSONA t2 on ( t2.id_persona = t1.id1 )'
      #9#9#9#9#9#9#9#9#9#9'   where 2 = 2 and t1.SIT_PERSONA = '#39'AC'#39
      #9#9#9#9#9#9#9#9#9#9'  ) per on (per .id_persona = valor.id_persona)'
      
        #9#9#9#9#9#9'where valor. id_modelo = (select id_modelo from cr_met_mod' +
        'elo where trim(nombre) = '#39'ACREDIT_CARTCOMER'#39')'
      #9#9#9#9#9#9'--and valor. id_persona in (24)   ---- ojo'
      #9#9#9#9') datos where 2 = 2 and datos .renglon = 1'
      #9#9#9' ) caratula'
      #9#9'group by  id1'
      #9') where 2 = 2')
    Left = 456
    Top = 264
  end
  object DataSource1: TDataSource
    Left = 496
    Top = 208
  end
end
