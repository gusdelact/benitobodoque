object WCrHistGar: TWCrHistGar
  Left = 214
  Top = 109
  Width = 785
  Height = 402
  Caption = 'Reporte Información Histórica de Garantías '
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
    Left = 8
    Top = 10
    Width = 30
    Height = 13
    Caption = 'Fecha'
  end
  object Label1: TLabel
    Left = 699
    Top = 376
    Width = 3
    Height = 13
  end
  object dpFecha: TDateTimePicker
    Left = 8
    Top = 24
    Width = 105
    Height = 21
    CalAlignment = dtaLeft
    Date = 0.520820937497774
    Time = 0.520820937497774
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
    OnChange = dpFechaChange
  end
  object SGCtrl1: TSGCtrl
    Left = 8
    Top = 56
    Width = 761
    Height = 313
    ShowTab = True
    TabOrder = 1
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
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
    Left = 144
    Top = 16
  end
  object qDatos: TQuery
    SQL.Strings = (
      ' Select *'
      '  From ('
      'Select CG.Id_Contrato, '
      
        '       Decode(CG.Ins_Irrev,'#39'V'#39', '#39'Aplica'#39','#39'F'#39','#39'No Aplica'#39','#39'No Apl' +
        'ica'#39') Ins_Irrev, Decode(CG.Mandato,'#39'V'#39', '#39'Aplica'#39','#39'F'#39','#39'No Aplica'#39 +
        ','#39'No Aplica'#39') Mandato, '
      
        '       Decode(CG.Gar_Part,'#39'V'#39', '#39'Aplica'#39','#39'F'#39','#39'No Aplica'#39','#39'No Apli' +
        'ca'#39') Gar_Part,   Decode(CG.Gar_Aport,'#39'V'#39', '#39'Aplica'#39','#39'F'#39','#39'No Aplic' +
        'a'#39','#39'No Aplica'#39') Gar_Aport,'
      
        '       CG.Mon_Ins_Irrev, CG.Mon_Mandato, CG.Mon_Gar_Part, CG.Mon' +
        '_Gar_Aport, '
      
        '       Decode(CG.Posicion,1,'#39'Preferente'#39',2,'#39'Subordinada'#39') Posici' +
        'on,  Decode(CG.Tipo_Linea,1,'#39'Revocable'#39',2,'#39'Irrevocable'#39') Tipo_Li' +
        'nea, '
      
        '       Decode(CG.Ing_Propios,'#39'V'#39', '#39'Aplica'#39','#39'F'#39','#39'No Aplica'#39') Ing_' +
        'Propios, CG.Mon_Ing_Propios, CG.Ins_Federal, '
      
        '       Decode(CG.Fideicomiso,'#39'V'#39', '#39'Aplica'#39','#39'F'#39','#39'No Aplica'#39') Fide' +
        'icomiso, Decode(CG.Fuente_Pago,1,'#39'Preferente'#39',2,'#39'Subordinada'#39') F' +
        'uente_Pago,'
      
        '       Decode(CG.B_Aut_Leg_Local,'#39'V'#39','#39'Aplica'#39','#39'F'#39','#39'No Aplica'#39','#39'N' +
        'o Aplica'#39') B_Aut_Leg_Local,'
      
        '       Decode(CG.B_Mec_Claro_Pago,'#39'V'#39','#39'Aplica'#39','#39'F'#39','#39'No Aplica'#39','#39 +
        'No Aplica'#39') B_Mec_Claro_Pago, '
      
        '       Decode(CG.B_Opin_Desp_Jur,'#39'V'#39','#39'Aplica'#39','#39'F'#39','#39'No Aplica'#39','#39'N' +
        'o Aplica'#39') B_Opin_Desp_Jur,'
      
        '       Decode(CG.B_Opin_Inter_Jur,'#39'V'#39','#39'Aplica'#39','#39'F'#39','#39'No Aplica'#39','#39 +
        'No Aplica'#39') B_Opin_Inter_Jur, '
      
        '       CG.F_Reg_Gar_Part, CG.F_Reg_Gar_Aport, CG.F_Reg_Ing_Propi' +
        'os, '
      
        '       Decode(CG.B_Cobertura_Tasa,'#39'V'#39','#39'Aplica'#39','#39'F'#39','#39'No Aplica'#39','#39 +
        'No Aplica'#39') B_Cobertura_Tasa,'
      
        '       Decode(CG.B_Apl_Inscr_Deud,'#39'V'#39','#39'Aplica'#39','#39'F'#39','#39'No Aplica'#39','#39 +
        'No Aplica'#39')B_Apl_Inscr_Deud, '
      
        '       CG.Num_Inscr_Deuda,CG.F_Alta_Inscr_Deu, CG.F_Prog_Inscr_D' +
        ',  Row_Number() Over (Partition By CG.Id_Contrato Order By CG.F_' +
        'Alta Desc)  Fila '
      '  From Cr_Tipos_Garan Cg'
      ' Where F_Alta <= :Fecha)'
      'Where Fila = 1')
    Left = 184
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Fecha'
        ParamType = ptUnknown
      end>
    object qDatosId_Contrato: TFloatField
      DisplayLabel = 'Contrato    '
      DisplayWidth = 12
      FieldName = 'Id_Contrato'
    end
    object qDatosIns_Irrev: TStringField
      DisplayLabel = 'Ins. Irrevocables '
      DisplayWidth = 15
      FieldName = 'Ins_Irrev'
    end
    object qDatosMandato: TStringField
      FieldName = 'Mandato'
    end
    object qDatosGar_Part: TStringField
      DisplayLabel = 'Gar. con Participación'
      FieldName = 'Gar_Part'
    end
    object qDatosGar_Aport: TStringField
      DisplayLabel = 'Gar. con Aportaciones'
      FieldName = 'Gar_Aport'
    end
    object qDatosMon_Ins_Irrev: TFloatField
      DisplayLabel = 'Importe Ins.Irrevocables'
      DisplayWidth = 20
      FieldName = 'Mon_Ins_Irrev'
    end
    object qDatosMon_Mandato: TFloatField
      DisplayLabel = 'Importe Mandato '
      DisplayWidth = 20
      FieldName = 'Mon_Mandato'
    end
    object qDatosMon_Gar_Part: TFloatField
      DisplayLabel = 'Importe Gar. con Participación'
      DisplayWidth = 25
      FieldName = 'Mon_Gar_Part'
    end
    object qDatosMon_Gar_aport: TFloatField
      DisplayLabel = 'Importe Gar. con Aportacion'
      DisplayWidth = 25
      FieldName = 'Mon_Gar_aport'
    end
    object qDatosPosicion: TStringField
      FieldName = 'Posicion'
    end
    object qDatosTipo_Linea: TStringField
      DisplayLabel = 'Tipo Linea'
      FieldName = 'Tipo_Linea'
    end
    object qDatosIng_Propios: TStringField
      DisplayLabel = 'Ingresos Propios '
      FieldName = 'Ing_Propios'
    end
    object qDatosMon_Ing_Propios: TFloatField
      DisplayLabel = 'Importe Ingresos Propios'
      DisplayWidth = 20
      FieldName = 'Mon_Ing_Propios'
    end
    object qDatosIns_Federal: TStringField
      DisplayLabel = 'Inscripción Federal '
      FieldName = 'Ins_Federal'
    end
    object qDatosFideicomiso: TStringField
      FieldName = 'Fideicomiso'
    end
    object qDatosFuente_Pago: TStringField
      DisplayLabel = 'Fuente de Pago'
      FieldName = 'Fuente_Pago'
    end
    object qDatosB_Aut_Leg_Local: TStringField
      DisplayLabel = 'Autorización leguslativa local'
      DisplayWidth = 25
      FieldName = 'B_Aut_Leg_Local'
    end
    object qDatosB_Mec_Claro_Pago: TStringField
      DisplayLabel = 'Mecanismo Claro Pago'
      FieldName = 'B_Mec_Claro_Pago'
    end
    object qDatosB_Opin_Desp_Jur: TStringField
      DisplayLabel = 'Opinion de Despacho Jurídico'
      DisplayWidth = 29
      FieldName = 'B_Opin_Desp_Jur'
    end
    object qDatosB_Opin_Inter_Jur: TStringField
      DisplayLabel = 'Opinion del área interna de Jurídico'
      DisplayWidth = 29
      FieldName = 'B_Opin_Inter_Jur'
    end
    object qDatosF_Reg_Gar_Part: TDateTimeField
      DisplayLabel = 'F. de Registro de Gar. con Participación '
      DisplayWidth = 35
      FieldName = 'F_Reg_Gar_Part'
    end
    object qDatosF_Reg_Gar_Aport: TDateTimeField
      DisplayLabel = 'F. de Registro de Gar. con Aportación'
      DisplayWidth = 31
      FieldName = 'F_Reg_Gar_Aport'
    end
    object qDatosF_Reg_Ing_Propios: TDateTimeField
      DisplayLabel = 'F. de Registro de  Ing. Proipios'
      DisplayWidth = 31
      FieldName = 'F_Reg_Ing_Propios'
    end
    object qDatosB_Cobertura_Tasa: TStringField
      DisplayLabel = 'Cobertura de Tasa'
      FieldName = 'B_Cobertura_Tasa'
    end
    object qDatosB_Apl_Inscr_Deud: TStringField
      DisplayLabel = 'Inscripción de Deuda'
      FieldName = 'B_Apl_Inscr_Deud'
    end
    object qDatosNum_Inscr_Deuda: TStringField
      DisplayLabel = 'No. de inscripción de deuda'
      DisplayWidth = 25
      FieldName = 'Num_Inscr_Deuda'
    end
    object qDatosF_Alta_Inscr_Deu: TDateTimeField
      DisplayLabel = 'F. Inscripción Estatal'
      DisplayWidth = 20
      FieldName = 'F_Alta_Inscr_Deu'
    end
    object qDatosF_Prog_Inscr_D: TDateTimeField
      DisplayLabel = 'F. Inscripción Federal'
      DisplayWidth = 20
      FieldName = 'F_Prog_Inscr_D'
    end
  end
end
