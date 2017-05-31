unit UnRpKYCPM2;
//------------------------------------------------------------------------------
//  Información de KYC para Personas Morales
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
  TqrKYCPM2 = class(TQuickRep)
    qPersona: TQuery;
    PageHeaderBand1: TQRBand;
    qrieKYCPM: TQRInterEncabezado;
    qContrato: TQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    qOperatividad: TQuery;
    dsContrato: TDataSource;
    qContratoID_TITULAR: TFloatField;
    qrghRefBanca: TQRBand;
    qrgfRefBanca: TQRBand;
    QRLabel3: TQRLabel;
    qPerRefBancaria: TQuery;
    qPerRefBancariaID_INTERMEDIARIO: TFloatField;
    qPerRefBancariaNOMBRE: TStringField;
    qPerRefBancariaCUENTA_BANCO: TStringField;
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
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRDBText25: TQRDBText;
    QRLabel34: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText24: TQRDBText;
    qContratoF_ALTA: TDateTimeField;
    QRBand2: TQRBand;
    QRMemo1: TQRMemo;
    QRLabel10: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    qPersonaDESC_AE: TStringField;
    qContratoNOMB_CONTRATO: TStringField;
    qContratoNOMBRE_CLIENTE: TStringField;
    qPersonaCVE_ACTIV_CTO: TStringField;
    qContratoCVE_ACTIVIDAD: TStringField;
    qContratoDESC_ACTIVIDAD: TStringField;
    qContratoCONTRATO: TStringField;
    qContratoFECHA_CONTRATO: TStringField;
    qContratoB_PROSPECTO: TStringField;
    qIngresos: TQuery;
    qIngresosID_FUENTE_INGR: TFloatField;
    qIngresosDESC_FUENTE_INGR: TStringField;
    qIngresosDESC_OTRO: TStringField;
    qIngresosMONTO_INGRESO: TFloatField;
    qIngresosCVE_FRECUENCIA: TStringField;
    qrghPersona: TQRBand;
    qrgfPersona: TQRBand;
    QRLabel32: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText19: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    lblActividad: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    qDestinoRec: TQuery;
    qDestinoRecID_DESTINORECURSOS: TFloatField;
    qDestinoRecDESC_DESTINO_REC: TStringField;
    QRDBText1: TQRDBText;
    lbIntermediario: TQRLabel;
    lbCuenta: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    qContratoIDORIGENRECURSOS: TFloatField;
    qContratoDESC_ORIGEN_REC: TStringField;
    qContratoDESC_FRECUENCIA: TStringField;
    qOperatividadDESC_TIPO_OPERACION: TStringField;
    qOperatividadCVE_GRUPO_OPERACION: TStringField;
    qOperatividadDESC_GRUPO_OPERACION: TStringField;
    qOperatividadDESC_RANGO_OPERACION: TStringField;
    qOperatividadDESC_CLASIF_OPERACION: TStringField;
    qrgfContrato: TQRBand;
    QRDBText14: TQRDBText;
    QRDBText43: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    qrgrContrato: TQRBand;
    QRLabel43: TQRLabel;
    qrgfDestinoRec: TQRBand;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    qrghDestinoRec: TQRBand;
    QRLabel42: TQRLabel;
    qrgfOrigenRec: TQRBand;
    QRDBText40: TQRDBText;
    QRDBText39: TQRDBText;
    qrghOrigenRec: TQRBand;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    procedure QRGroup6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qrKYCPM2 : TqrKYCPM2;

implementation

{$R *.DFM}

procedure TqrKYCPM2.QRGroup6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if not qContrato.IsEmpty then
    lblActividad.Caption:= qContrato.FieldByName('CVE_ACTIVIDAD').asString + '    ' +
                           qContrato.FieldByName('DESC_ACTIVIDAD').asString
  else
    lblActividad.Caption:= '';
end;

end.
