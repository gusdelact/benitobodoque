unit UnRpKYCPF2;
//------------------------------------------------------------------------------
//  Información de KYC para Personas Fisicas (Sin Actividad Empresarial)
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
  TqrKYCPF2 = class(TQuickRep)
    qPersona: TQuery;
    PageHeaderBand1: TQRBand;
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
    QRBand1: TQRBand;
    QRMemo1: TQRMemo;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText25: TQRDBText;
    QRImage1: TQRImage;
    QRBand2: TQRBand;
    qrieKYCPF: TQRInterEncabezado;
    qPersonaDESC_AE: TStringField;
    qContratoF_ALTA: TDateTimeField;
    qContratoNOMBRE_CLIENTE: TStringField;
    qPersonaCVE_ACTIV_CTO: TStringField;
    qContratoCVE_ACTIVIDAD: TStringField;
    qContratoDESC_ACTIVIDAD: TStringField;
    qContratoCONTRATO: TStringField;
    qContratoFECHA_CONTRATO: TStringField;
    qContratoB_PROSPECTO: TStringField;
    qrghPersona: TQRBand;
    qrgfPersona: TQRBand;
    QRLabel32: TQRLabel;
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
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    lblActividad: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    qIngresos: TQuery;
    qIngresosID_FUENTE_INGR: TFloatField;
    qIngresosDESC_FUENTE_INGR: TStringField;
    qIngresosDESC_OTRO: TStringField;
    qIngresosMONTO_INGRESO: TFloatField;
    qIngresosCVE_FRECUENCIA: TStringField;
    dsPersona: TDataSource;
    qDomEmpLabora: TQuery;
    qDomEmpLaboraCALLE_NUMERO: TStringField;
    qDomEmpLaboraCOLONIA: TStringField;
    qDomEmpLaboraDES_CIUDAD: TStringField;
    qDomEmpLaboraDES_ESTADO: TStringField;
    qDomEmpLaboraCODIGO_POSTAL: TStringField;
    qrghEmpresaLab: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel37: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText50: TQRDBText;
    QRLabel39: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRDBText51: TQRDBText;
    QRLabel53: TQRLabel;
    QRDBText52: TQRDBText;
    QRLabel54: TQRLabel;
    QRDBText53: TQRDBText;
    QRLabel55: TQRLabel;
    QRDBText54: TQRDBText;
    QRLabel56: TQRLabel;
    QRDBText55: TQRDBText;
    qrgfEmpresaLab: TQRBand;
    qPersonaDOMICILIO_EMP: TFloatField;
    qDestinoRec: TQuery;
    qDestinoRecID_DESTINORECURSOS: TFloatField;
    qDestinoRecDESC_DESTINO_REC: TStringField;
    qContratoIDORIGENRECURSOS: TFloatField;
    qContratoDESC_ORIGEN_REC: TStringField;
    qContratoDESC_FRECUENCIA: TStringField;
    qOperatividadDESC_TIPO_OPERACION: TStringField;
    qOperatividadCVE_GRUPO_OPERACION: TStringField;
    qOperatividadDESC_GRUPO_OPERACION: TStringField;
    qOperatividadDESC_RANGO_OPERACION: TStringField;
    qOperatividadDESC_CLASIF_OPERACION: TStringField;
    qrgfContrato: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText43: TQRDBText;
    QRLabel1: TQRLabel;
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
    QRDBText11: TQRDBText;
    procedure QRGroup6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qrKYCPF2 : TqrKYCPF2;

implementation                                                                                            

{$R *.DFM}

procedure TqrKYCPF2.QRGroup6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if not qContrato.IsEmpty then
    lblActividad.Caption:= qContrato.FieldByName('CVE_ACTIVIDAD').asString + '    ' +
                           qContrato.FieldByName('DESC_ACTIVIDAD').asString
  else
    lblActividad.Caption:= '';
end;

end.
