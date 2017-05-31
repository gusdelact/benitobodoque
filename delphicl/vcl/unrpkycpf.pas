unit UnRpKYCPF;
//------------------------------------------------------------------------------
//  Información de KYC para Personas Fisicas (Sin Actividad Empresarial)
//  Realizó  : Carlos A. Mejía Ledón
//  Fecha    : Mayo 2004
//  Empresa  : Grupo Financiero Interacciones.
//------------------------------------------------------------------------------

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  InterApl, IntHead, UnGene, DmCttoEstado;

type
  TqrKYCPF = class(TQuickRep)
    qPersona: TQuery;
    PageHeaderBand1: TQRBand;
    qrieKYCPF: TQRInterEncabezado;
    qContrato: TQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField3: TStringField;
    qPersonaID_PERSONA: TFloatField;
    qPersonaNOMBRE_COMPUESTO: TStringField;
    qPersonaE_MAIL: TStringField;
    qPersonaID_FUENTE_INGR: TFloatField;
    qPersonaDESC_FUENTE_INGR: TStringField;
    qPersonaCURP: TStringField;
    qPersonaCVE_ACTIVIDAD_PF: TStringField;
    qPersonaCVE_RAMA_PF: TStringField;
    qPersonaPUESTO_EMPRESA: TStringField;
    qPersonaANO_ANTIG_EMPR: TFloatField;
    qPersonaMES_ANTIG_EMPR: TFloatField;
    qPersonaID_PROFESION: TFloatField;
    qPersonaDESC_PROFESION: TStringField;
    qPersonaID_RANGO_INGRESO: TFloatField;
    qPersonaMONTO_MAXIMO: TFloatField;
    qPersonaID_EMP_LABORA: TFloatField;
    qPersonaNOMBRE_EMP: TStringField;
    qOperatividad: TQuery;
    dsContrato: TDataSource;
    qContratoID_TITULAR: TFloatField;
    qPersonaRFC: TStringField;
    qPersonaID_DOMICILIO: TFloatField;
    qPersonaCVE_NACIONALIDAD: TStringField;
    qPersonaDESC_POBLACION: TStringField;
    qPersonaF_NACIMIENTO: TDateTimeField;
    qPersonaSEXO: TStringField;
    qPersonaESTADO_CIVIL: TStringField;
    qPersonaMONTO_MINIMO: TFloatField;
    qPerRefPersona: TQuery;
    qPerRefPersonaID_REF_PERSONA: TFloatField;
    qPerRefPersonaNOMBRE: TStringField;
    qPerRefPersonaDOMICILIO: TStringField;
    qPerRefPersonaTELEFONO: TStringField;
    qrgfContrato: TQRBand;
    qrgrContrato: TQRBand;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    qrghRefPersona: TQRBand;
    qrgfRefPersona: TQRBand;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRDBText47: TQRDBText;
    QRLabel49: TQRLabel;
    QRDBText48: TQRDBText;
    QRLabel50: TQRLabel;
    QRDBText49: TQRDBText;
    QRShape2: TQRShape;
    qrghRefBanca: TQRBand;
    qrgfRefBanca: TQRBand;
    QRLabel3: TQRLabel;
    lbIntermediario: TQRLabel;
    QRDBText1: TQRDBText;
    lbCuenta: TQRLabel;
    QRDBText2: TQRDBText;
    qPerRefBancaria: TQuery;
    qPerRefBancariaID_INTERMEDIARIO: TFloatField;
    qPerRefBancariaNOMBRE: TStringField;
    qPerRefBancariaCUENTA_BANCO: TStringField;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    qContratoID_EMPRESA: TFloatField;
    qPersonaCVE_ACTIV_CTO: TStringField;
    qContratoCVE_ACTIVIDAD: TStringField;
    qContratoDESC_ACTIVIDAD: TStringField;
    qContratoCVE_ACTIVIDADSITI: TStringField;
    qContratoDESC_ACTIVIDADSITI: TStringField;
    qContratoDESC_FRECUENCIA: TStringField;
    qOperatividadDESC_TIPO_OPERACION: TStringField;
    qOperatividadCVE_GRUPO_OPERACION: TStringField;
    qOperatividadDESC_GRUPO_OPERACION: TStringField;
    qOperatividadDESC_RANGO_OPERACION: TStringField;
    qOperatividadDESC_CLASIF_OPERACION: TStringField;
    qrgrOrigenRec: TQRBand;
    qrgfOrigenRec: TQRBand;
    qContratoIDORIGENRECURSOS: TFloatField;
    QRLabel35: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText38: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText43: TQRDBText;
    qrgrDestinoRec: TQRBand;
    qrgfDestinoRec: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText42: TQRDBText;
    QRDBText41: TQRDBText;
    qIngresos: TQuery;
    qrgrEmpLabora: TQRBand;
    qrgfEmpLabora: TQRBand;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel37: TQRLabel;
    QRDBText39: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText40: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText44: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText45: TQRDBText;
    QRLabel43: TQRLabel;
    qrgfPersona: TQRBand;
    dsDestinoRec: TDataSource;
    qrgrPersona: TQRBand;
    QRLabel32: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText35: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    lblActividad: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    Query1: TQuery;
    FloatField4: TFloatField;
    StringField2: TStringField;
    qDestinoRec: TQuery;
    qDomEmpLabora: TQuery;
    dsPersona: TDataSource;
    qDomEmpLaboraCALLE_NUMERO: TStringField;
    qDomEmpLaboraCOLONIA: TStringField;
    qDomEmpLaboraDES_CIUDAD: TStringField;
    qDomEmpLaboraDES_ESTADO: TStringField;
    qDomEmpLaboraCODIGO_POSTAL: TStringField;
    qPersonaDOMICILIO_EMP: TFloatField;
    QRLabel1: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    qDestinoRecID_DESTINORECURSOS: TFloatField;
    qDestinoRecDESC_DESTINO_REC: TStringField;
    QRDBText11: TQRDBText;
    qIngresosID_FUENTE_INGR: TFloatField;
    qIngresosDESC_FUENTE_INGR: TStringField;
    qIngresosDESC_OTRO: TStringField;
    qIngresosMONTO_INGRESO: TStringField;
    qIngresosCVE_FRECUENCIA: TStringField;
    //ChildBand1: TQRChildBand;
    procedure QRGroup6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    Apli : TInterApli;
  end;

var
  qrKYCPF : TqrKYCPF;
  procedure EXECUTE_RP_KYCPF(pApli: TInterApli; pVerImprimir: String; pIdContrato : Integer);

implementation

{$R *.DFM}

procedure EXECUTE_RP_KYCPF(pApli: TInterApli; pVerImprimir: String; pIdContrato : Integer);
var
  qrKYCPF     : TqrKYCPF;
begin
  qrKYCPF := TqrKYCPF.Create(Nil);
  Application.CreateForm(TdmPorta,dmPorta);
  with qrKYCPF do
  try
    Apli                            := pApli;
    qrieKYCPF.Apli                  := Apli;
    qContrato.DatabaseName          := Apli.DataBaseName;
    qContrato.SessionName           := Apli.SessionName;
    dmPorta.spDatosDom.DatabaseName := Apli.DataBaseName;
    dmPorta.spDatosDom.SessionName  := Apli.SessionName;
    qPersona.DatabaseName           := Apli.DataBaseName;
    qPersona.SessionName            := Apli.SessionName;
    qOperatividad.DatabaseName      := Apli.DataBaseName;
    qOperatividad.SessionName       := Apli.SessionName;
    qPerRefPersona.DatabaseName     := Apli.DataBaseName;
    qPerRefPersona.SessionName      := Apli.SessionName;
    qPerRefBancaria.DatabaseName    := Apli.DataBaseName;
    qPerRefBancaria.SessionName     := Apli.SessionName;
    qDestinoRec.DatabaseName        := Apli.DataBaseName;
    qDestinoRec.SessionName         := Apli.SessionName;
    qIngresos.DatabaseName          := Apli.DataBaseName;
    qIngresos.SessionName           := Apli.SessionName;
    qDomEmpLabora.DatabaseName      := Apli.DataBaseName;
    qDomEmpLabora.SessionName       := Apli.SessionName;

    qContrato.ParamByName('pIdContrato').AsInteger   := pIdContrato;
    qDestinoRec.ParamByName('pIdContrato').AsInteger := pIdContrato;

    qContrato.Open;
    if not qContrato.IsEmpty then
    begin
      qrieKYCPF.Titulo2   := 'Contrato ' + IntToStr(pIdContrato);
      qrieKYCPF.IdEmpresa := qContrato.FieldByName('ID_EMPRESA').AsInteger;
      qPersona.Open;
      if not qPersona.IsEmpty then
      begin
        dmPorta.spDatosDom.ParamByName('piddomicilio').AsFloat := qPersona.FieldByName('Id_Domicilio').AsFloat;
        QRDBText28.DataSet := dmPorta.spDatosDom;
        QRDBText29.DataSet := dmPorta.spDatosDom;
        QRDBText30.DataSet := dmPorta.spDatosDom;
        QRDBText31.DataSet := dmPorta.spDatosDom;
        QRDBText32.DataSet := dmPorta.spDatosDom;
        dmPorta.spDatosDom.Open;
        if Not (qPersona.FieldByName('DOMICILIO_EMP').IsNull)  then
        begin
          qDomEmpLabora.ParamByName('DOMICILIO_EMP').AsFloat :=  qPersona.FieldByName('DOMICILIO_EMP').AsFloat;
          qDomEmpLabora.Open;
        end;


      end;
      qOperatividad.Open;
      qPerRefPersona.Open;
      qPerRefBancaria.Open;
      qDestinoRec.Open;
      qIngresos.Open;

    end;
    if pVerImprimir = 'Ver' then
      Preview
    else if pVerImprimir = 'Imprimir' then
      Print;
  finally
    qContrato.Close;
    qPersona.Close;
    dmPorta.spDatosDom.Close;
    qOperatividad.Close;
    qPerRefPersona.Close;
    qPerRefBancaria.Close;
    qDestinoRec.Close;
    qIngresos.Close;
    qDomEmpLabora.Close;
    dmPorta.Free;
    Free;
  end;
end;

procedure TqrKYCPF.QRGroup6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if not qContrato.IsEmpty then
    lblActividad.Caption:= qContrato.FieldByName('CVE_ACTIVIDAD').asString + '    ' +
                           qContrato.FieldByName('DESC_ACTIVIDAD').asString
  else
    lblActividad.Caption:= '';
end;

end.
