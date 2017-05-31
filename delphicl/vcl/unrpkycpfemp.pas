unit UnRpKYCPFEmp;
//------------------------------------------------------------------------------
//  Información de KYC para Personas Fisicas Con Actividad Empresarial
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
  TqrKYCPFEmp = class(TQuickRep)
    qPersona: TQuery;
    PageHeaderBand1: TQRBand;
    qrieKYCPFEmp: TQRInterEncabezado;
    qContrato: TQuery;
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
    qPersonaNOMBRE_EMP: TStringField;
    qOperatividad: TQuery;
    dsContrato: TDataSource;
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
    QRLabel43: TQRLabel;
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
    qPerEmpresa: TQuery;
    qPerEmpresaID_PERSONA: TFloatField;
    qPerEmpresaID_RANGO_NO_EMPL: TFloatField;
    qPerEmpresaID_RANGO_VENTAS: TFloatField;
    qPerEmpresaNUM_SUCURSALES: TFloatField;
    qPerEmpresaIMP_ACTIVO: TFloatField;
    qPerEmpresaIMP_PASIVO: TFloatField;
    qPerEmpresaIMP_CAPITAL: TFloatField;
    qPerEmpresaMIN_EMPLEADOS: TFloatField;
    qPerEmpresaMAX_EMPLEADOS: TFloatField;
    qPerEmpresaMIN_VENTAS: TFloatField;
    qPerEmpresaMAX_VENTAS: TFloatField;
    qPerPaisCober: TQuery;
    qPerEmpresaCOB_GEOG: TStringField;
    qPerPaisCoberCVE_POBLACION: TStringField;
    qPerPaisCoberDESC_POBLACION: TStringField;
    qPerPaisCoberIMPORTA: TStringField;
    qPerPaisCoberEXPORTA: TStringField;
    qrghEmpresa: TQRBand;
    qrgfEmpresa: TQRBand;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRDBText51: TQRDBText;
    QRLabel59: TQRLabel;
    QRDBText52: TQRDBText;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRDBText53: TQRDBText;
    QRLabel62: TQRLabel;
    QRDBText54: TQRDBText;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRDBText55: TQRDBText;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRLabel67: TQRLabel;
    QRDBText58: TQRDBText;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRDBText59: TQRDBText;
    QRLabel71: TQRLabel;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRLabel72: TQRLabel;
    QRDBText62: TQRDBText;
    QRLabel73: TQRLabel;
    QRDBText63: TQRDBText;
    qrgfRefComer: TQRBand;
    qrghRefComer: TQRBand;
    QRLabel1: TQRLabel;
    QRShape3: TQRShape;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText5: TQRDBText;
    qPersonaCVE_ACTIV_CTO: TStringField;
    qrghPersonaActEmp: TQRBand;
    qrgfPersonaActEmp: TQRBand;
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
    QRLabel4: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel8: TQRLabel;
    qPerRefComercial: TQuery;
    qPerRefComercialID_PERSONA: TFloatField;
    qPerRefComercialID_REF_COMERCIAL: TFloatField;
    qPerRefComercialNOMBRE: TStringField;
    qPerRefComercialTELEFONO: TStringField;
    qIngresos: TQuery;
    qrghOrigenRecursos: TQRBand;
    qrgfOrigenRecursos: TQRBand;
    QRLabel40: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText39: TQRDBText;
    qContratoID_CONTRATO: TFloatField;
    qContratoID_EMPRESA: TFloatField;
    qContratoID_TITULAR: TFloatField;
    qContratoB_ASESOR_INV: TStringField;
    qContratoID_ORIGEN_REC: TFloatField;
    qContratoID_DESTINO_REC: TFloatField;
    qContratoDESC_ORIGEN_REC: TStringField;
    qContratoCVE_ACTIVIDAD: TStringField;
    qContratoDESC_ACTIVIDAD: TStringField;
    qContratoCVE_ACTIVIDADSITI: TStringField;
    qContratoDESC_ACTIVIDADSITI: TStringField;
    qContratoDESC_FRECUENCIA: TStringField;
    qContratoIDORIGENRECURSOS: TFloatField;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText22: TQRDBText;
    QRBand1: TQRBand;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRBand2: TQRBand;
    QRLabel42: TQRLabel;
    QRLabel30: TQRLabel;
    Query1: TQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField2: TFloatField;
    StringField3: TStringField;
    dsDestinoRec: TDataSource;
    QRLabel37: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText40: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText41: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText42: TQRDBText;
    qPersonaCALLE_NUMERO_EMP: TStringField;
    qPersonaCOLONIA_EMP: TStringField;
    qPersonaDES_CIUDAD_EMP: TStringField;
    qPersonaDES_ESTADO_EMP: TStringField;
    qPersonaCODIGO_POSTAL_EMP: TStringField;
    qDestinoRec: TQuery;
    qDestinoRecID_DESTINORECURSOS: TFloatField;
    qDestinoRecDESC_DESTINO_REC: TStringField;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    qIngresosID_FUENTE_INGR: TFloatField;
    qIngresosDESC_FUENTE_INGR: TStringField;
    qIngresosDESC_OTRO: TStringField;
    qIngresosMONTO_INGRESO: TStringField;
    qIngresosCVE_FRECUENCIA: TStringField;
    QRDBText11: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText36: TQRDBText;
    QRDBText43: TQRDBText;
    procedure qrghPersonaActEmpBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    Apli : TInterApli;
  end;

var
  qrKYCPFEmp : TqrKYCPFEmp;
  procedure EXECUTE_RP_KYCPFEMP(pApli: TInterApli; pVerImprimir: String; pIdContrato : Integer);

implementation

{$R *.DFM}

procedure EXECUTE_RP_KYCPFEMP(pApli: TInterApli; pVerImprimir: String; pIdContrato : Integer);
var
  qrKYCPFEmp: TqrKYCPFEmp;
begin
  qrKYCPFEmp := TqrKYCPFEmp.Create(Nil);
  Application.CreateForm(TdmPorta,dmPorta);
  with qrKYCPFEmp do
  try
    Apli                   := pApli;
    qrieKYCPFEmp.Apli               := Apli;
    qContrato.DatabaseName          := Apli.DataBaseName;
    qContrato.SessionName           := Apli.SessionName;
    dmPorta.spDatosDom.DatabaseName := Apli.DataBaseName;
    dmPorta.spDatosDom.SessionName  := Apli.SessionName;
    qPersona.DatabaseName           := Apli.DataBaseName;
    qPersona.SessionName            := Apli.SessionName;
    qPerEmpresa.DatabaseName        := Apli.DataBaseName;
    qPerEmpresa.SessionName         := Apli.SessionName;
    qPerPaisCober.DatabaseName      := Apli.DataBaseName;
    qPerPaisCober.SessionName       := Apli.SessionName;
    qOperatividad.DatabaseName      := Apli.DataBaseName;
    qOperatividad.SessionName       := Apli.SessionName;
    qPerRefPersona.DatabaseName     := Apli.DataBaseName;
    qPerRefPersona.SessionName      := Apli.SessionName;
    qPerRefBancaria.DatabaseName    := Apli.DataBaseName;
    qPerRefBancaria.SessionName     := Apli.SessionName;
    qPerRefComercial.DatabaseName   := Apli.DataBaseName;
    qPerRefComercial.SessionName    := Apli.SessionName;
    qIngresos.DatabaseName          := Apli.DataBaseName;
    qIngresos.SessionName           := Apli.SessionName;
    qDestinoRec.DatabaseName        := Apli.DataBaseName;
    qDestinoRec.SessionName         := Apli.SessionName;

    qContrato.ParamByName('pIdContrato').AsInteger := pIdContrato;
    qDestinoRec.ParamByName('pIdContrato').AsInteger := pIdContrato;

    qContrato.Open;
    if not qContrato.IsEmpty then
    begin
      qrieKYCPFEmp.Titulo2   := 'Contrato ' + IntToStr(pIdContrato);
      qrieKYCPFEmp.IdEmpresa := qContrato.FieldByName('ID_EMPRESA').AsInteger;
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
      end;
      qPerEmpresa.Open;
      qPerPaisCober.Open;
      qOperatividad.Open;
      qPerRefPersona.Open;
      qPerRefBancaria.Open;
      qPerRefComercial.Open;
      qIngresos.Open;
      qDestinoRec.Open;
    end;
    if pVerImprimir = 'Ver' then
      Preview
    else if pVerImprimir = 'Imprimir' then
      Print;
  finally
    qContrato.Close;
    qPersona.Close;
    dmPorta.spDatosDom.Close;
    qPerEmpresa.Close;
    qPerPaisCober.Close;
    qOperatividad.Close;
    qPerRefPersona.Close;
    qPerRefBancaria.Close;
    qPerRefComercial.Close;
    qIngresos.Close;
    qDestinoRec.Close;
    dmPorta.Free;
    Free;
  end;
end;



procedure TqrKYCPFEmp.qrghPersonaActEmpBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 if not qContrato.IsEmpty then
    lblActividad.Caption:= qContrato.FieldByName('CVE_ACTIVIDAD').asString + '    ' +
                           qContrato.FieldByName('DESC_ACTIVIDAD').asString
  else
    lblActividad.Caption:= '';
end;

end.
