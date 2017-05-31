unit UnAnexoKYC_PM;
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
  InterApl, IntHead, IntFrm;

type
  TRepAnexoKYC_PM = class(TQuickRep)
    qPersona: TQuery;
    PageHeaderBand1: TQRBand;
    qrieKYCPM: TQRInterEncabezado;
    qContrato: TQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    qOperatividad: TQuery;
    dsContrato: TDataSource;
    qContratoID_TITULAR: TFloatField;
    qrgfContrato: TQRBand;
    qrgrContrato: TQRBand;
    QRDBText39: TQRDBText;
    QRDBText42: TQRDBText;
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
    qDomicilio: TQuery;
    qDomicilioCODIGO_POSTAL: TStringField;
    qDomicilioOFICINA_POSTAL: TStringField;
    qDomicilioCVE_USUAR_MODIF: TStringField;
    qDomicilioFH_MODIFICACION: TDateTimeField;
    qDomicilioCALLE_NUMERO: TStringField;
    qDomicilioCOLONIA: TStringField;
    qDomicilioPAIS: TStringField;
    qDomicilioESTADO: TStringField;
    qDomicilioCIUDAD: TStringField;
    qrgfPersona: TQRBand;
    QRDBText26: TQRDBText;
    qrghPersona: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    lblActividad: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText32: TQRDBText;
    QRDBText31: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText28: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText27: TQRDBText;
    QRDBText19: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel32: TQRLabel;
    qIngresos: TQuery;
    qDestinoRec: TQuery;
    qDestinoRecID_DESTINORECURSOS: TFloatField;
    qDestinoRecDESC_DESTINO_REC: TStringField;
    qrghOrigenRec: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText17: TQRDBText;
    qrgfOrigenRec: TQRBand;
    qrghDestinoRec: TQRBand;
    QRLabel11: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    qrgfDestinoRec: TQRBand;
    qContratoIDORIGENRECURSOS: TFloatField;
    qContratoDESC_ORIGEN_REC: TStringField;
    qContratoDESC_FRECUENCIA: TStringField;
    QRLabel43: TQRLabel;
    qOperatividadDESC_TIPO_OPERACION: TStringField;
    qOperatividadCVE_GRUPO_OPERACION: TStringField;
    qOperatividadDESC_GRUPO_OPERACION: TStringField;
    qOperatividadDESC_RANGO_OPERACION: TStringField;
    qOperatividadDESC_CLASIF_OPERACION: TStringField;
    QRDBText22: TQRDBText;
    qIngresosID_FUENTE_INGR: TFloatField;
    qIngresosDESC_FUENTE_INGR: TStringField;
    qIngresosDESC_OTRO: TStringField;
    qIngresosMONTO_MAXIMO: TStringField;
    qIngresosCVE_FRECUENCIA: TStringField;
    QRDBText23: TQRDBText;
    QRDBText43: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText45: TQRDBText;
    QRDBText44: TQRDBText;
    procedure QRGroup6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  RepAnexoKYC_PM : TRepAnexoKYC_PM;

Procedure Execute_AnexoKYC_PM(Padre: TInterFrame; pIdContrato: Integer; pPreview: Boolean);

implementation


uses
  unGene;         { Funciones Generales de Interacciones }

{$R *.DFM}


Procedure Execute_AnexoKYC_PM(Padre: TInterFrame; pIdContrato: Integer; pPreview: Boolean);
Var RepKYC_PM: TRepAnexoKYC_PM;
Begin
  RepKYC_PM:= TRepAnexoKYC_PM.Create(nil);
  Try
    With RepKYC_PM do
    Begin
      qrieKYCPM.Apli                  := Padre.Apli;
      qContrato.DatabaseName          := Padre.DataBaseName;
      qContrato.SessionName           := Padre.SessionName;
      qPersona.DatabaseName           := Padre.DataBaseName;
      qPersona.SessionName            := Padre.SessionName;
      qDomicilio.DatabaseName         := Padre.DataBaseName;
      qDomicilio.SessionName          := Padre.SessionName;
      qPerEmpresa.DatabaseName        := Padre.DataBaseName;
      qPerEmpresa.SessionName         := Padre.SessionName;
      qPerPaisCober.DatabaseName      := Padre.DataBaseName;
      qPerPaisCober.SessionName       := Padre.SessionName;
      qOperatividad.DatabaseName      := Padre.DataBaseName;
      qOperatividad.SessionName       := Padre.SessionName;
      qPerRefBancaria.DatabaseName    := Padre.DataBaseName;
      qPerRefBancaria.SessionName     := Padre.SessionName;
      qPerRefComercial.DatabaseName   := Padre.DataBaseName;
      qPerRefComercial.SessionName    := Padre.SessionName;
      qIngresos.DatabaseName          := Padre.DataBaseName;
      qIngresos.SessionName           := Padre.SessionName;
      qDestinoRec.DatabaseName        := Padre.DataBaseName;
      qDestinoRec.SessionName         := Padre.SessionName;

      qContrato.ParamByName('pIdContrato').AsInteger := pIdContrato;
      qDestinoRec.ParamByName('pIdContrato').AsInteger := pIdContrato;
      
      qContrato.Open;
      if not qContrato.IsEmpty then
      begin
          qrieKYCPM.Titulo2   := 'Contrato ' + IntToStr(pIdContrato);
          qrieKYCPM.IdEmpresa := pIdContrato;
          qPersona.Open;
          qDomicilio.Open;
          qPerEmpresa.Open;
          qPerPaisCober.Open;
          qOperatividad.Open;
          qPerRefBancaria.Open;
          qPerRefComercial.Open;
          qIngresos.Open;
          qDestinoRec.Open;
      end;

      If pPreview then Preview
      else Print;

      qContrato.Close;
      qPersona.Close;
      qDomicilio.Close;
      qPerEmpresa.Close;
      qPerPaisCober.Close;
      qOperatividad.Close;
      qPerRefBancaria.Close;
      qPerRefComercial.Close;
      qIngresos.Close;
      qDestinoRec.Close;
    end;

  Finally
    RepKYC_PM.Free; RepKYC_PM:= nil;
  end;
end;



procedure TRepAnexoKYC_PM.QRGroup6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if not qContrato.IsEmpty then
    lblActividad.Caption:= qContrato.FieldByName('CVE_ACTIVIDAD').asString + '    ' +
                           qContrato.FieldByName('DESC_ACTIVIDAD').asString
  else
    lblActividad.Caption:= '';
end;

end.
