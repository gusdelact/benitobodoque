unit DmCttoEstado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, Wwtable, wwstorep, Wwdatsrc;

type
  TDatosRep = Record
    Tope      : Integer;
    Altura    : Integer;
    FechaCont : String;
    FechaHora : String;
    NomRepres : String;
    RepresPrin: String;
    TipoCuenta: String;
    CveCorresp: String;
    Envio     : String;
    Leyenda1  : String;
    Leyenda2  : String;
    NombreCtto: String;
  end;

  TDmPorta = class(TDataModule)
    qDatosTitular: TQuery;
    qDatosCotitul: TQuery;
    qRepresent: TQuery;
    qTipoPersona: TQuery;
    qTipoPersonaESPERSMORAL: TFloatField;
    qEscrTitul: TQuery;
    qActivPF: TQuery;
    dsDatosTitular: TDataSource;
    dsDatosDir: TDataSource;
    dsDatosCotitul: TDataSource;
    dsRepresent: TDataSource;
    dsTipoPersona: TDataSource;
    dsEscrTitul: TDataSource;
    dsActivPF: TDataSource;
    qDatosRepresent: TQuery;
    qRepresentCVE_TIPO_FIRMA: TStringField;
    qRepresentNUM_COTITULAR: TFloatField;
    qRepresentID_CONTRATO: TFloatField;
    qRepresentID_PERSONA: TFloatField;
    qRepresentNOMBRE_REPRES: TStringField;
    dsDatosRepresent: TDataSource;
    qChequeraTitul: TQuery;
    dsChequeraTitul: TDataSource;
    qCheqraCotit: TQuery;
    dsCheqraRep: TDataSource;
    qBeneficiarios: TQuery;
    qBeneficiariosNUM_COTITULAR: TFloatField;
    qBeneficiariosNOMBRE: TStringField;
    qBeneficiariosPCT_BENEFICIO: TFloatField;
    dsBeneficiarios: TDataSource;
    qContrato: TQuery;
    qContratoSIT_CONTRATO: TStringField;
    qContratoCVE_CORRESP: TStringField;
    qContratoCVE_DISCRECIONAL: TStringField;
    qContratoCVE_CONTRATANTE: TStringField;
    qContratoCVE_TIPO_FIRMA: TStringField;
    qContratoDESC_CONTRATANTE: TStringField;
    dsQContrato: TDataSource;
    qEscrTitulNOMBRE: TStringField;
    qEscrTitulNUM_ESC_PUBLICA: TFloatField;
    qEscrTitulFOJAS: TStringField;
    qEscrTitulLIBRO: TStringField;
    qEscrTitulPARTIDA: TStringField;
    qEscrTitulTOMO: TStringField;
    qEscrTitulVOLUMEN: TStringField;
    qEscrTitulNUM_NOTARIA: TFloatField;
    qEscrTitulID_PERS_NOTARIO: TFloatField;
    qEscrTitulF_CONSTITUCION: TDateTimeField;
    qActivPFCVE_RAMA_PF: TStringField;
    spDatosDom: TQuery;
    qContratoID_DOMICILIO: TFloatField;
    qDatosCotitulID_PERSONA: TFloatField;
    qDatosCotitulNUM_COTITULAR: TFloatField;
    qDatosCotitulNOMBRE: TStringField;
    qDatosCotitulCVE_TIPO_FIRMA: TStringField;
    qDatosCotitulPCT_BENEFICIO: TFloatField;
    qDatosCotitulRFC_COTITULAR: TStringField;
    spDatosDomCODIGO_POSTAL: TStringField;
    spDatosDomOFICINA_POSTAL: TStringField;
    spDatosDomCVE_USUAR_MODIF: TStringField;
    spDatosDomFH_MODIFICACION: TDateTimeField;
    qDatosTitularID_PERSONA: TFloatField;
    qDatosTitularNOMBRE: TStringField;
    qDatosTitularTELEF_CASA: TStringField;
    qDatosTitularTELEF_OFICINA: TStringField;
    qDatosTitularTELEF_FAX: TStringField;
    qDatosTitularID_DOMICILIO: TFloatField;
    qDatosTitularRFC_TITULAR: TStringField;
    qContratoNOMB_CONTRATO: TStringField;
    qContratoID_CONTRATO: TFloatField;
    qContratoF_ALTA: TDateTimeField;
    qContratoID_TITULAR: TFloatField;
    qContratoID_PERSONA: TFloatField;
    qDatosTitularID_DOM_CTE_CTO: TFloatField;
    qDatosCotitulID_CONTRATO: TFloatField;
    qEscRep: TQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    DateTimeField1: TDateTimeField;
    qContratoID_CTTO: TStringField;
    qRepresentID_CTTO: TStringField;
    qEscrTitulTX_INSCRIPCION: TStringField;
    qEscrTitulNUM_NOTARIA_1: TFloatField;
    qDatosRepresentNUM_ESC_PUBLICA: TFloatField;
    qDatosRepresentFOJAS: TStringField;
    qDatosRepresentLIBRO: TStringField;
    qDatosRepresentPARTIDA: TStringField;
    qDatosRepresentTOMO: TStringField;
    qDatosRepresentVOLUMEN: TStringField;
    qDatosRepresentF_ESCRITURA: TDateTimeField;
    qDatosRepresentNOMBRE_NOTARIO: TStringField;
    qDatosRepresentID_PERS_NOTARIO: TFloatField;
    qDatosRepresentNUM_NOTARIA: TFloatField;
    qDatosRepresentTX_INSCRIPCION: TStringField;
    qEscRepTX_INSCRIPCION: TStringField;
    qEscRepNUM_NOTARIA_1: TFloatField;
    spDatosDomCALLE_NUMERO: TStringField;
    spDatosDomCOLONIA: TStringField;
    spDatosDomPAIS: TStringField;
    spDatosDomESTADO: TStringField;
    spDatosDomCIUDAD: TStringField;
    qDatosTitularPAIS: TStringField;
    qDatosCotitulNACIONALIDAD: TStringField;
    qEscRepPLAZA: TStringField;
    qDatosRepresentPLAZA: TStringField;
    qEscrTitulPLAZA: TStringField;
    qContratoCONTRATO: TStringField;
    qContratoB_PROSPECTO: TStringField;
    qContratoFECHA_CONTRATO: TStringField;
    qActivPFB_ACTIV_EMPRESA: TStringField;
    procedure qDatosTitularRFC_TITULARGetText(Sender: TField; var Text: String; DisplayText: Boolean);
  private
  public
    Function Buscar(contrato:String):sTRING;
    Procedure CierraTodo;
    Procedure AsignaDataBaseNames(DataBaseName,SessionName:String);
  end;

var
  DmPorta: TDmPorta;

implementation

{$R *.DFM}

Procedure TDmPorta.AsignaDataBaseNames(DataBaseName,SessionName:String);
begin
  qDatosTitular.DataBaseName   :=DatabaseName;
  qDatosTitular.SessionName    :=SessionName;

  qDatosCotitul.DataBaseName   :=DatabaseName;
  qDatosCotitul.SessionName    :=SessionName;

  spDatosDom.DataBaseName      :=DatabaseName;
  spDatosDom.SessionName       :=SessionName;

  qRepresent.DataBaseName      :=DatabaseName;
  qRepresent.SessionName       :=SessionName;

  qTipoPersona.DataBaseName    :=DatabaseName;
  qTipoPersona.SessionName     :=SessionName;

  qEscrTitul.DataBaseName      :=DatabaseName;
  qEscrTitul.SessionName       :=SessionName;

  qActivPF.DataBaseName        :=DatabaseName;
  qActivPF.SessionName         :=SessionName;

  qDatosRepresent.DataBaseName :=DatabaseName;
  qDatosRepresent.SessionName  :=SessionName;

  qChequeraTitul.DataBaseName  :=DatabaseName;
  qChequeraTitul.SessionName   :=SessionName;

  qCheqraCotit.DataBaseName    :=DatabaseName;
  qCheqraCotit.SessionName     :=SessionName;

  qBeneficiarios.DataBaseName  :=DatabaseName;
  qBeneficiarios.SessionName   :=SessionName;

  qContrato.DataBaseName       :=DatabaseName;
  qContrato.SessionName        :=SessionName;

  qEscRep.DataBaseName         :=DatabaseName;
  qEscRep.SessionName          :=SessionName;
end;

Function TDmPorta.Buscar(Contrato:String):STRING;
Var
  vlContrato : Longint;
begin
  Buscar:='';
  CierraTodo;
  if Contrato='' then begin
     MessageDlg('El Numero de Contrato es Invalido',mtError,[mbOK],0);
     exit;
  end;
  vlContrato:=StrToInt(Contrato);
  qcontrato.ParamByName('Id_Contrato').AsInteger:=vlContrato;
  qContrato.Active:=True;
  if qcontrato.IsEmpty then begin
     MessageDlg('El Contrato Seleccionado no Existe',mtError,[mbOK],0);
     CierraTodo;
     Exit;
  end;
  qDatosTitular.Active:=True;
  If qDatosTitular.FieldByName('ID_DOM_CTE_CTO').AsString <> '' then
     spDatosDom.ParamByName('pIdDomicilio').AsInteger := qDatosTitular.FieldByName('ID_DOM_CTE_CTO').AsInteger
  else
     spDatosDom.ParamByName('pIdDomicilio').AsInteger := qDatosTitular.FieldByName('Id_Domicilio').AsInteger;
  //spDatosDom.ParamByName('pIdDomicilio').AsInteger:=qDatosTitular.FieldByName('Id_Domicilio').AsInteger;
  qChequeraTitul.ParamByName('ID_CONTRATO').asInteger := vlContrato;
  qChequeraTitul.ParamByName('ID_PERSONA').asInteger := qDatosTitular.FieldByName('ID_PERSONA').asInteger;
  spDatosDom.Active:=True;
  qTipoPersona.Active:=True;
  qEscrTitul.Active:=True;
  qDatosCotitul.Active:=True;
  qCheqraCotit.Active:=True;
  qChequeraTitul.Active:=True;
  if DmPorta.qTipoPersona.FieldValues['EsPersMoral'] = 0 then
  else begin
     qRepresent.Active      := True;
     qDatosRepresent.Active := True;
  end;
  qBeneficiarios.Active:=True;
  Buscar:=Contrato;
end;

Procedure TDmPorta.CierraTodo;
begin
  qContrato.Close;
  qDatosTitular.Close;
  spDatosDom.Close;
  qDatosCotitul.Close;
  qBeneficiarios.Close;
  qRepresent.Close;
  qDatosRepresent.Close;
  qTipoPersona.Close;
  qEscrTitul.Close;
  qCheqraCotit.Close;
  qChequeraTitul.Close;
end;

procedure TDmPorta.qDatosTitularRFC_TITULARGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if Text = '--' then
     Text := '';
end;

end.
