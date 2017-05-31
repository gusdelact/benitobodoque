unit UnRpKYCPM;
//------------------------------------------------------------------------------
//  Información de KYC para Personas Morales
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
  TqrKYCPM = class(TQuickRep)
    qPersona: TQuery;
    PageHeaderBand1: TQRBand;
    qrieKYCPM: TQRInterEncabezado;
    qContrato: TQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    StringField3: TStringField;
    qOperatividad: TQuery;
    dsContrato: TDataSource;
    qContratoID_TITULAR: TFloatField;
    qrgfContrato: TQRBand;
    qrgrContrato: TQRBand;
    QRLabel43: TQRLabel;
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
    qPerRefComercial: TQuery;
    qPerRefComercialID_PERSONA: TFloatField;
    qPerRefComercialID_REF_COMERCIAL: TFloatField;
    qPerRefComercialNOMBRE: TStringField;
    qPerRefComercialDOMICILIO: TStringField;
    qPerRefComercialTELEFONO: TStringField;
    qPersonaID_PERSONA: TFloatField;
    qPersonaNOM_RAZON_SOCIAL: TStringField;
    qPersonaRFC: TStringField;
    qPersonaID_DOMICILIO: TFloatField;
    qPersonaCVE_NACIONALIDAD: TStringField;
    qPersonaDESC_POBLACION: TStringField;
    qPersonaE_MAIL: TStringField;
    qPersonaID_FUENTE_INGR: TFloatField;
    qPersonaDESC_FUENTE_INGR: TStringField;
    qPersonaCVE_RAMA_ACTIV: TStringField;
    qPersonaCVE_SUB_RAMA_AC: TStringField;
    qPersonaCVE_TIPO_SECTOR: TStringField;
    qPersonaCVE_ACTIV_CTO: TStringField;
    qContratoCVE_ACTIVIDAD: TStringField;
    qContratoDESC_ACTIVIDAD: TStringField;
    qContratoCVE_ACTIVIDADSITI: TStringField;
    qContratoDESC_ACTIVIDADSITI: TStringField;
    qrghOrigenRec: TQRBand;
    qrgfOrigenRec: TQRBand;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel9: TQRLabel;
    qContratoIDORIGENRECURSOS: TFloatField;
    qContratoDESC_FRECUENCIA: TStringField;
    QRLabel17: TQRLabel;
    QRDBText14: TQRDBText;
    dsDestinoRec: TDataSource;
    qDestinoRec: TQuery;
    qrgfDestinoRec: TQRBand;
    QRDBText17: TQRDBText;
    QRDBText20: TQRDBText;
    qrgrDestinoRec: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel40: TQRLabel;
    qOperatividadDESC_TIPO_OPERACION: TStringField;
    qOperatividadCVE_GRUPO_OPERACION: TStringField;
    qOperatividadDESC_GRUPO_OPERACION: TStringField;
    qOperatividadDESC_RANGO_OPERACION: TStringField;
    qOperatividadDESC_CLASIF_OPERACION: TStringField;
    qrghPersona: TQRBand;
    qrgfPersona: TQRBand;
    QRLabel32: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText27: TQRDBText;
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
    QRDBText11: TQRDBText;
    QRDBText15: TQRDBText;
    qIngresos: TQuery;
    QRDBText9: TQRDBText;
    qIngresosID_FUENTE_INGR: TFloatField;
    qIngresosDESC_FUENTE_INGR: TStringField;
    qIngresosDESC_OTRO: TStringField;
    qIngresosMONTO_INGRESO: TStringField;
    qIngresosCVE_FRECUENCIA: TStringField;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText37: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel8: TQRLabel;
    procedure QRGroup6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    Apli : TInterApli;
  end;

var
  qrKYCPM : TqrKYCPM;
  procedure EXECUTE_RP_KYCPM(pApli: TInterApli; pVerImprimir: String; pIdContrato : Integer);

implementation

{$R *.DFM}

procedure EXECUTE_RP_KYCPM(pApli: TInterApli; pVerImprimir: String; pIdContrato : Integer);
var
  qrKYCPM: TqrKYCPM;
begin
  qrKYCPM := TqrKYCPM.Create(Nil);
  Application.CreateForm(TdmPorta,dmPorta);
  with qrKYCPM do
  try
    Apli                   := pApli;
    qrieKYCPM.Apli      := Apli;
    qContrato.DatabaseName := Apli.DataBaseName;
    qContrato.SessionName  := Apli.SessionName;
    dmPorta.spDatosDom.DatabaseName := Apli.DataBaseName;
    dmPorta.spDatosDom.SessionName  := Apli.SessionName;
    qContrato.ParamByName('pIdContrato').AsInteger := pIdContrato;
    qPersona.DatabaseName := Apli.DataBaseName;
    qPersona.SessionName  := Apli.SessionName;
    qPerEmpresa.DatabaseName := Apli.DataBaseName;
    qPerEmpresa.SessionName  := Apli.SessionName;
    qPerPaisCober.DatabaseName := Apli.DataBaseName;
    qPerPaisCober.SessionName  := Apli.SessionName;
    qOperatividad.DatabaseName := Apli.DataBaseName;
    qOperatividad.SessionName  := Apli.SessionName;
    qPerRefBancaria.DatabaseName := Apli.DataBaseName;
    qPerRefBancaria.SessionName  := Apli.SessionName;
    qPerRefComercial.DatabaseName := Apli.DataBaseName;
    qPerRefComercial.SessionName  := Apli.SessionName;
    qDestinoRec.DatabaseName        := Apli.DataBaseName;
    qDestinoRec.SessionName         := Apli.SessionName;
    qIngresos.DatabaseName          := Apli.DataBaseName;
    qIngresos.SessionName           := Apli.SessionName;

    qDestinoRec.ParamByName('pIdContrato').AsInteger := pIdContrato;

    qContrato.Open;
    if not qContrato.IsEmpty then
    begin
      qrieKYCPM.Titulo2   := 'Contrato ' + IntToStr(pIdContrato);
      qrieKYCPM.IdEmpresa := qContrato.FieldByName('ID_EMPRESA').AsInteger;
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

        if not qContrato.IsEmpty then
          lblActividad.Caption:= qContrato.FieldByName('CVE_ACTIVIDAD').asString + '    ' +
                                 qContrato.FieldByName('DESC_ACTIVIDAD').asString
        else
          lblActividad.Caption:= '';
          
      end;
      qPerEmpresa.Open;
      qPerPaisCober.Open;
      qOperatividad.Open;
      qPerRefBancaria.Open;
      qPerRefComercial.Open;
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
    qPerEmpresa.Close;
    qPerPaisCober.Close;
    qOperatividad.Close;
    qPerRefBancaria.Close;
    qPerRefComercial.Close;
    qDestinoRec.Close;
    qIngresos.Close;
    dmPorta.Free;
    Free;
  end;
end;

procedure TqrKYCPM.QRGroup6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if not qContrato.IsEmpty then
    lblActividad.Caption:= qContrato.FieldByName('CVE_ACTIVIDAD').asString + '    ' +
                           qContrato.FieldByName('DESC_ACTIVIDAD').asString
  else
    lblActividad.Caption:= '';
end;

end.
