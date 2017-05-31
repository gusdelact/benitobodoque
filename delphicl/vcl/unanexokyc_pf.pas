unit UnAnexoKYC_PF;
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
  InterApl, IntHead, IntFrm;

type
  TRepAnexoKYC_PF = class(TQuickRep)
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
    qrgfContrato: TQRBand;
    qrgrContrato: TQRBand;
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
    QRLabel21: TQRLabel;
    QRDBText29: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    lblActividad: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel8: TQRLabel;
    qIngresos: TQuery;
    QRDBText26: TQRDBText;
    qrghEmpresaLab: TQRBand;
    qrgfEmpresaLab: TQRBand;
    QRLabel30: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel33: TQRLabel;
    qDomEmpLabora: TQuery;
    qDomEmpLaboraCALLE_NUMERO: TStringField;
    qDomEmpLaboraCOLONIA: TStringField;
    qDomEmpLaboraDES_CIUDAD: TStringField;
    qDomEmpLaboraDES_ESTADO: TStringField;
    qDomEmpLaboraCODIGO_POSTAL: TStringField;
    dsPersona: TDataSource;
    QRLabel37: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText50: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText51: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText52: TQRDBText;
    qPersonaDOMICILIO_EMP: TFloatField;
    qrghOrigenRec: TQRBand;
    qrgfOrigenRec: TQRBand;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText40: TQRDBText;
    QRDBText39: TQRDBText;
    qrghDestinoRec: TQRBand;
    qrgfDestinoRec: TQRBand;
    QRLabel42: TQRLabel;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRLabel43: TQRLabel;
    qContratoIDORIGENRECURSOS: TFloatField;
    qContratoDESC_ORIGEN_REC: TStringField;
    qContratoDESC_FRECUENCIA: TStringField;
    QRDBText4: TQRDBText;
    QRDBText43: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    qDestinoRec: TQuery;
    qDestinoRecID_DESTINORECURSOS: TFloatField;
    qDestinoRecDESC_DESTINO_REC: TStringField;
    qOperatividadDESC_TIPO_OPERACION: TStringField;
    qOperatividadCVE_GRUPO_OPERACION: TStringField;
    qOperatividadDESC_GRUPO_OPERACION: TStringField;
    qOperatividadDESC_RANGO_OPERACION: TStringField;
    qOperatividadDESC_CLASIF_OPERACION: TStringField;
    Query1: TQuery;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    DateTimeField1: TDateTimeField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    QRDBText46: TQRDBText;
    qIngresosID_FUENTE_INGR: TFloatField;
    qIngresosDESC_FUENTE_INGR: TStringField;
    qIngresosDESC_OTRO: TStringField;
    qIngresosMONTO_INGRESO: TStringField;
    qIngresosCVE_FRECUENCIA: TStringField;
    procedure QRGroup6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  public
  end;

var
  RepAnexoKYC_PF : TRepAnexoKYC_PF;


Procedure Execute_AnexoKYC_PF(Padre: TInterFrame; pIdContrato: Integer; pPreview: Boolean);

implementation
{$R *.DFM}


uses
  unGene;         { Funciones Generales de Interacciones }


Procedure Execute_AnexoKYC_PF(Padre: TInterFrame; pIdContrato: Integer; pPreview: Boolean);
Var RepKYC_PF: TRepAnexoKYC_PF;
Begin
  RepKYC_PF:= TRepAnexoKYC_PF.Create(nil);
  Try

    With RepKYC_PF do
    Begin
      qrieKYCPF.Apli                  := Padre.Apli;
      qContrato.DatabaseName          := Padre.DataBaseName;
      qContrato.SessionName           := Padre.SessionName;
      qPersona.DatabaseName           := Padre.DataBaseName;
      qPersona.SessionName            := Padre.SessionName;
      qDomicilio.DatabaseName         := Padre.DataBaseName;
      qDomicilio.SessionName          := Padre.SessionName;
      qOperatividad.DatabaseName      := Padre.DataBaseName;
      qOperatividad.SessionName       := Padre.SessionName;
      qPerRefBancaria.DatabaseName    := Padre.DataBaseName;
      qPerRefBancaria.SessionName     := Padre.SessionName;
      qPerRefPersona.DatabaseName     := Padre.DataBaseName;
      qPerRefPersona.SessionName      := Padre.SessionName;
      qIngresos.DatabaseName          := Padre.DataBaseName;
      qIngresos.SessionName           := Padre.SessionName;
      qDestinoRec.DatabaseName        := Padre.DataBaseName;
      qDestinoRec.SessionName         := Padre.SessionName;

      qDomEmpLabora.DatabaseName      := Padre.DataBaseName;
      qDomEmpLabora.SessionName       := Padre.SessionName;

      qContrato.ParamByName('pIdContrato').AsInteger := pIdContrato;
      qDestinoRec.ParamByName('pIdContrato').AsInteger := pIdContrato;
      
      qContrato.Open;
      if not qContrato.IsEmpty then
      begin
        qrieKYCPF.Titulo2  := 'Contrato ' + IntToStr(pIdContrato);
        //RAPA... ????
        //qrieKYCPF.IdEmpresa:= dmPorta.qContrato.FieldbyName('ID_CONTRATO').AsInteger;

      qPersona.Open;
        
        if Not (qPersona.FieldByName('DOMICILIO_EMP').IsNull)  then
        begin
          qDomEmpLabora.ParamByName('DOMICILIO_EMP').AsFloat :=  qPersona.FieldByName('DOMICILIO_EMP').AsFloat;
          qDomEmpLabora.Open;
        end;


        qDomicilio.Open;
        qOperatividad.Open;
        qPerRefBancaria.Open;
        qPerRefPersona.Open;
        qDestinoRec.Open;
        qIngresos.Open;
      end;

      If pPreview then Preview
      else Print;

      qContrato.Close;
      qPersona.Close;
      qDomicilio.Close;
      qOperatividad.Close;
      qPerRefBancaria.Close;
      qPerRefPersona.Close;
      qIngresos.Close;
      qDestinoRec.Close;
      qDomEmpLabora.Close;
    end;

  Finally
    RepKYC_PF.Free; RepKYC_PF:= nil;
  end;
end;



procedure TRepAnexoKYC_PF.QRGroup6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if not qContrato.IsEmpty then
    lblActividad.Caption:= qContrato.FieldByName('CVE_ACTIVIDAD').asString + '    ' +
                           qContrato.FieldByName('DESC_ACTIVIDAD').asString
  else
    lblActividad.Caption:= '';
end;

end.
