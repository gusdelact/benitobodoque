unit UnRpKYCPFEmp2;
//------------------------------------------------------------------------------
//  Información de KYC para Personas Fisicas Con Actividad Empresarial
//  Para entrega al Cliente
//  Realizó  : José Mijangos Torres
//  Fecha    : Julio 2004
//  Empresa  : Grupo Financiero Interacciones.
//------------------------------------------------------------------------------
                        
interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  InterApl, IntHead, UnGene, DmCttoEstado;

type
  TqrKYCPFEmp2 = class(TQuickRep)
    qPersona: TQuery;
    PageHeaderBand1: TQRBand;
    qrieKYCPFEmp: TQRInterEncabezado;
    qContrato: TQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
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
    QRLabel56: TQRLabel;
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
    qPerRefComercialTELEFONO: TStringField;
    QRBand1: TQRBand;
    QRLabel17: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText25: TQRDBText;
    QRImage1: TQRImage;
    qContratoF_ALTA: TDateTimeField;
    QRBand2: TQRBand;
    QRMemo1: TQRMemo;
    QRLabel4: TQRLabel;
    QRDBText17: TQRDBText;
    qContratoNOMBRE_CLIENTE: TStringField;
    qPersonaDESC_AE: TStringField;
    qContratoCVE_ACTIVIDAD: TStringField;
    qContratoDESC_ACTIVIDAD: TStringField;
    qContratoCONTRATO: TStringField;
    qContratoFECHA_CONTRATO: TStringField;
    qContratoB_PROSPECTO: TStringField;
    qrghPersona: TQRBand;
    QRDBText81: TQRDBText;
    qrgfPersona: TQRBand;
    QRLabel6: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel2: TQRLabel;
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
    QRDBText6: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText29: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText32: TQRDBText;
    QRDBText31: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    lblActividad: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel32: TQRLabel;
    qIngresos: TQuery;
    qIngresosID_FUENTE_INGR: TFloatField;
    qIngresosDESC_FUENTE_INGR: TStringField;
    qIngresosDESC_OTRO: TStringField;
    qIngresosMONTO_INGRESO: TFloatField;
    qIngresosCVE_FRECUENCIA: TStringField;
    QRLabel8: TQRLabel;
    qDestinoRec: TQuery;
    qDestinoRecID_DESTINORECURSOS: TFloatField;
    qDestinoRecDESC_DESTINO_REC: TStringField;
    qOperatividadDESC_TIPO_OPERACION: TStringField;
    qOperatividadCVE_GRUPO_OPERACION: TStringField;
    qOperatividadDESC_GRUPO_OPERACION: TStringField;
    qOperatividadDESC_RANGO_OPERACION: TStringField;
    qOperatividadDESC_CLASIF_OPERACION: TStringField;
    qrghOrigenRec: TQRBand;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText40: TQRDBText;
    QRDBText39: TQRDBText;
    qrgfOrigenRec: TQRBand;
    qrghDestinoRec: TQRBand;
    QRLabel42: TQRLabel;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    qrgfDestinoRec: TQRBand;
    qrgrContrato: TQRBand;
    QRLabel43: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText43: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    qrgfContrato: TQRBand;
    qContratoIDORIGENRECURSOS: TFloatField;
    qContratoDESC_ORIGEN_REC: TStringField;
    qContratoDESC_FRECUENCIA: TStringField;
    qPersonaNOMBRE_EMP: TStringField;
    qPersonaCALLE_NUMERO_EMP: TStringField;
    qPersonaCOLONIA_EMP: TStringField;
    qPersonaDES_CIUDAD_EMP: TStringField;
    qPersonaDES_ESTADO_EMP: TStringField;
    qPersonaCODIGO_POSTAL_EMP: TStringField;
    QRLabel15: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText11: TQRDBText;
    procedure qrghPersonaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qrKYCPFEmp2 : TqrKYCPFEmp2;

implementation

{$R *.DFM}

procedure TqrKYCPFEmp2.qrghPersonaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if not qContrato.IsEmpty then
    lblActividad.Caption:= qContrato.FieldByName('CVE_ACTIVIDAD').asString + '    ' +
                           qContrato.FieldByName('DESC_ACTIVIDAD').asString
  else
    lblActividad.Caption:= '';
end;

end.
