unit IntCrPar;

interface

uses
  SysUtils, Classes, InterFor, IntFrm, DB, DbTables,IntFind, UnSQL2, InterFun;

type
  TCrFol = class(TInterFrame)
  private
  protected
  public
    CVE_TIP_CONTRATO         : TInterCampo;
    CVE_MEDIO                : TInterCampo;
    FOLIO_CESION             : TInterCampo;
    FOLIO_CREDITO            : TInterCampo;
    FOLIO_GARANTIA           : TInterCampo;
    FOLIO_GPO_TRANS          : TInterCampo;
    FOLIO_TRANS_CRED         : TInterCampo;
    FOLIO_SUB_TIP_CN         : TInterCampo;
    FOLIO_SUB_TIP_CR         : TInterCampo;
    FOLIO_TIPO_CRED          : TInterCampo;
    TASA_BENEF_BCO           : TInterCampo;
    TASA_BENEF_GOB           : TInterCampo;
    IMP_SALARIO_MIN          : TInterCampo;
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
  published
  end;


implementation

constructor TCrFol.Create( AOwner : TComponent );
begin
   inherited Create(AOwner);
      CVE_TIP_CONTRATO :=CreaCampo('CVE_TIP_CONTRATO',ftString,tsNinguno,tsNinguno,True);
        CVE_TIP_CONTRATO .Size:=4;
                CVE_TIP_CONTRATO.Caption:='Clave de Tip Contrato';
      CVE_MEDIO :=CreaCampo('CVE_MEDIO',ftString,tsNinguno,tsNinguno,True);
                CVE_MEDIO.Caption:='Clave de Medio';
      FOLIO_CESION :=CreaCampo('FOLIO_CESION',ftFloat,tsNinguno,tsNinguno,True);
                FOLIO_CESION.Caption:='Folio Cesion';
      FOLIO_CREDITO :=CreaCampo('FOLIO_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                FOLIO_CREDITO.Caption:='Folio Credito';
      FOLIO_GARANTIA :=CreaCampo('FOLIO_GARANTIA',ftFloat,tsNinguno,tsNinguno,True);
                FOLIO_GARANTIA.Caption:='Folio Garantia';
      FOLIO_GPO_TRANS :=CreaCampo('FOLIO_GPO_TRANS',ftFloat,tsNinguno,tsNinguno,True);
                FOLIO_GPO_TRANS.Caption:='Folio Grupo Trans';
      FOLIO_TRANS_CRED :=CreaCampo('FOLIO_TRANS_CRED',ftFloat,tsNinguno,tsNinguno,True);
                FOLIO_TRANS_CRED.Caption:='Folio Trans Cred';
      FOLIO_SUB_TIP_CN :=CreaCampo('FOLIO_SUB_TIP_CN',ftFloat,tsNinguno,tsNinguno,True);
                FOLIO_SUB_TIP_CN.Caption:='Folio Sub Tip Cn';
      FOLIO_SUB_TIP_CR :=CreaCampo('FOLIO_SUB_TIP_CR',ftFloat,tsNinguno,tsNinguno,True);
                FOLIO_SUB_TIP_CR.Caption:='Folio Sub Tip Cr';
      FOLIO_TIPO_CRED :=CreaCampo('FOLIO_TIPO_CRED',ftFloat,tsNinguno,tsNinguno,True);
                FOLIO_TIPO_CRED.Caption:='Folio Tipo Cred';
      TASA_BENEF_BCO :=CreaCampo('TASA_BENEF_BCO',ftFloat,tsNinguno,tsNinguno,True);
                TASA_BENEF_BCO.Caption:='Tasa Benef Bco';
      TASA_BENEF_GOB :=CreaCampo('TASA_BENEF_GOB',ftFloat,tsNinguno,tsNinguno,True);
                TASA_BENEF_GOB.Caption:='Tasa Benef Gob';
      IMP_SALARIO_MIN :=CreaCampo('IMP_SALARIO_MIN',ftFloat,tsNinguno,tsNinguno,True);
                IMP_SALARIO_MIN.Caption:='Imp Salario Min';
      FKeyFields.Add('CVE_TIP_CONTRATO');

      TableName := 'CRE_PARAMETRO';
      UseQuery := True;
      IsCheckSecu := False;
end;

destructor TCrFol.Destroy;
begin
   inherited;
end;

function TCrFol.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IntCrPar.it','S');
      Try if Active then begin T.Param(0,CVE_TIP_CONTRATO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;


end.
