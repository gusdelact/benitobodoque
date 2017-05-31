unit UnAnexoKYC_PFEmp;
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
  InterApl, IntHead, intFrm;

type
  TRepAnexoKYC_PFEmp = class(TQuickRep)
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
    QRLabel15: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText64: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText65: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText66: TQRDBText;
    QRLabel37: TQRLabel;
    QRDBText67: TQRDBText;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRDBText68: TQRDBText;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRLabel51: TQRLabel;
    QRDBText71: TQRDBText;
    QRDBText72: TQRDBText;
    QRDBText73: TQRDBText;
    QRLabel52: TQRLabel;
    QRDBText74: TQRDBText;
    QRDBText75: TQRDBText;
    QRDBText76: TQRDBText;
    QRLabel53: TQRLabel;
    QRLabel74: TQRLabel;
    QRDBText77: TQRDBText;
    QRDBText78: TQRDBText;
    QRLabel75: TQRLabel;
    QRDBText79: TQRDBText;
    QRLabel76: TQRLabel;
    lblActividad: TQRLabel;
    QRLabel78: TQRLabel;
    QRDBText80: TQRDBText;
    QRLabel79: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel83: TQRLabel;
    qIngresos: TQuery;
    QRLabel2: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText10: TQRDBText;
    qPersonaNOMBRE_EMP: TStringField;
    qPersonaCALLE_NUMERO_EMP: TStringField;
    qPersonaCOLONIA_EMP: TStringField;
    qPersonaDES_CIUDAD_EMP: TStringField;
    qPersonaDES_ESTADO_EMP: TStringField;
    qPersonaCODIGO_POSTAL_EMP: TStringField;
    qrghOrigenRec: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    qrgfOrigenRec: TQRBand;
    qrghDestinoRec: TQRBand;
    QRLabel12: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    qrgfDestinoRec: TQRBand;
    QRLabel18: TQRLabel;
    qContratoIDORIGENRECURSOS: TFloatField;
    qContratoDESC_ORIGEN_REC: TStringField;
    qContratoDESC_FRECUENCIA: TStringField;
    qDestinoRec: TQuery;
    qDestinoRecID_DESTINORECURSOS: TFloatField;
    qDestinoRecDESC_DESTINO_REC: TStringField;
    qOperatividadDESC_TIPO_OPERACION: TStringField;
    qOperatividadCVE_GRUPO_OPERACION: TStringField;
    qOperatividadDESC_GRUPO_OPERACION: TStringField;
    qOperatividadDESC_RANGO_OPERACION: TStringField;
    qOperatividadDESC_CLASIF_OPERACION: TStringField;
    QRDBText16: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText43: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText45: TQRDBText;
    QRDBText44: TQRDBText;
    qIngresosID_FUENTE_INGR: TFloatField;
    qIngresosDESC_FUENTE_INGR: TStringField;
    qIngresosDESC_OTRO: TStringField;
    qIngresosMONTO_INGRESO: TStringField;
    qIngresosCVE_FRECUENCIA: TStringField;
    procedure QRGroup6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  end;

var
  RepAnexoKYC_PFEmp : TRepAnexoKYC_PFEmp;


Procedure Execute_AnexoKYC_PFEmp(Padre: TInterFrame; pIdContrato: Integer; pPreview: Boolean);


implementation


uses
  unGene;         { Funciones Generales de Interacciones }


{$R *.DFM}

Procedure Execute_AnexoKYC_PFEmp(Padre: TInterFrame; pIdContrato: Integer; pPreview: Boolean);
Var RepKYC_PFEmp: TRepAnexoKYC_PFEmp;
Begin
  RepKYC_PFEmp:= TRepAnexoKYC_PFEmp.Create(nil);
  Try

    With RepKYC_PFEmp do
    Begin
      qrieKYCPFEmp.Apli               := Padre.Apli;
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
      qPerRefComercial.DatabaseName   := Padre.DataBaseName;
      qPerRefComercial.SessionName    := Padre.SessionName;
      qPerRefBancaria.DatabaseName    := Padre.DataBaseName;
      qPerRefBancaria.SessionName     := Padre.SessionName;
      qPerRefPersona.DatabaseName     := Padre.DataBaseName;
      qPerRefPersona.SessionName      := Padre.SessionName;
      qIngresos.DatabaseName          := Padre.DataBaseName;
      qIngresos.SessionName           := Padre.SessionName;
      qDestinoRec.DatabaseName        := Padre.DataBaseName;
      qDestinoRec.SessionName         := Padre.SessionName;

      qContrato.ParamByName('pIdContrato').AsInteger := pIdContrato;
      qDestinoRec.ParamByName('pIdContrato').AsInteger := pIdContrato;

      qContrato.Open;
      if not qContrato.IsEmpty then
      begin
        qrieKYCPFEmp.Titulo2   := 'Contrato ' + IntToStr(pIdContrato);
        //RAPA... ????
        ///qrieKYCPFEmp.IdEmpresa := dmPorta.qContrato.FieldbyName('ID_CONTRATO').AsInteger;
        qPersona.Open;
        qDomicilio.Open;
        qPerEmpresa.Open;
        qPerPaisCober.Open;
        qOperatividad.Open;
        qPerRefComercial.Open;
        qPerRefBancaria.Open;
        qPerRefPersona.Open;
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
      qPerRefComercial.Close;
      qPerRefBancaria.Close;
      qPerRefPersona.Close;
      qIngresos.Close;
      qDestinoRec.Close;
    end;

  Finally
    RepKYC_PFEmp.Free; RepKYC_PFEmp:= nil;
  end;
end;


procedure TRepAnexoKYC_PFEmp.QRGroup6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if not qContrato.IsEmpty then
    lblActividad.Caption:= qContrato.FieldByName('CVE_ACTIVIDAD').asString + '    ' +
                           qContrato.FieldByName('DESC_ACTIVIDAD').asString
  else
    lblActividad.Caption:= '';
end;

end.
