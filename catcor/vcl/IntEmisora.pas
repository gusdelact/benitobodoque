unit IntEmisora;
//******************************************************************************
//* Clase Emisora Corporativa
//* Realizó : Marcos Zárate Castro
//* Empresa : Interacciones Casa de Bolsa.
//* Fecha   : Noviembre de 1997.
//* Modificó: Marcos Zárate Castro Noviembre de 1998.
//******************************************************************************

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  UnGene, IntFind, IntInstr;

type
  TEmisora = class(TInterFrame)
  private
  protected
  public
    { Public declarations }
    EMISORA          : TInterCampo;
    SERIE            : TInterCampo;
    TIPO_VALOR       : TInterCampo;
    BURSATILIDAD     : TInterCampo;
    B_BLOQUEO        : TInterCampo;
    B_COTIZA_EXTRAN  : TInterCampo;
    B_COTIZA_SENTRA  : TInterCampo;
    B_GTIA_OPCION    : TInterCampo;
    B_GTIA_PRES_VAL  : TInterCampo;
    B_OPE_ARBITRAJE  : TInterCampo;
    B_OPE_CTE_EXTRAN : TInterCampo;
    B_OPE_PRES_VAL   : TInterCampo;
    B_OPE_REPORTO    : TInterCampo;
    B_ORD_EXTRAORD   : TInterCampo;
    B_ORD_PAQUETE    : TInterCampo;
    B_RETIENE_ISR    : TInterCampo;
    CVE_DIA_LIQUIDA  : TInterCampo;
    CVE_EMIS_INDEVAL : TInterCampo;
    CVE_IND_REF_CAL  : TInterCampo;
    CVE_INSTRUMENTO  : TInterCampo;
    CVE_ISIN         : TInterCampo;
    CVE_MONEDA_BASE  : TInterCampo;
    CVE_PAIS_EMISION : TInterCampo;
    CVE_PAIS_ORIGEN  : TInterCampo;
    CVE_TASA_REF     : TInterCampo;
    DIAS_CUPON       : TInterCampo;
    DIAS_REVIS_TASA  : TInterCampo;
    F_ALTA           : TInterCampo;
    F_EMISION        : TInterCampo;
    F_ULT_HECHO_ANT  : TInterCampo;
    F_ULT_HECHO_BMV  : TInterCampo;
    F_VENCIMIENTO    : TInterCampo;
    ID_INTERM_COLOC  : TInterCampo;
    PERS_JUR_ADQUI   : TInterCampo;
    PLAZO_EMISION    : TInterCampo;
    TIPO_ANUALIZA    : TInterCampo;
    VAL_NOM_TITULO   : TInterCampo;
    B_OPE_VTA_CORTO  : TInterCampo;
    Instrumento      : TInstrumen;
    function InternalBusca:Boolean; Override;
    procedure ValidaSituacion(Var pNumError : Integer);
    function  BuscaEmiSerie(pEmisora : String; pSerie : String; Var pTipoValor :String): Boolean;
    function  BuscaEmiSerieVal(pEmisora: String; pserie: String; Var pTipoValor: String):Boolean;
    function  BuscaCuponVig(Var pCupon:Integer):Boolean;
    constructor Create(AOwner : TComponent ); override;
    destructor Destroy; override;
  published
  end;


implementation

constructor TEmisora.Create(AOwner : TComponent );
begin Inherited Create(AOwner);
    IsCheckSecu:=False;
    EMISORA          :=CreaCampo('EMISORA',         ftString,  tsNinguno,tsNinguno,True);
    SERIE            :=CreaCampo('SERIE',           ftString,  tsNinguno,tsNinguno,True);
    TIPO_VALOR       :=CreaCampo('TIPO_VALOR',      ftString,  tsNinguno,tsNinguno,True);
    BURSATILIDAD     :=CreaCampo('BURSATILIDAD',    ftString,  tsNinguno,tsNinguno,True);
    B_BLOQUEO        :=CreaCampo('B_BLOQUEO',       ftString,  tsNinguno,tsNinguno,True);
    B_COTIZA_EXTRAN  :=CreaCampo('B_COTIZA_EXTRAN', ftString,  tsNinguno,tsNinguno,True);
    B_COTIZA_SENTRA  :=CreaCampo('B_COTIZA_SENTRA', ftString,  tsNinguno,tsNinguno,True);
    B_GTIA_OPCION    :=CreaCampo('B_GTIA_OPCION',   ftString,  tsNinguno,tsNinguno,True);
    B_GTIA_PRES_VAL  :=CreaCampo('B_GTIA_PRES_VAL', ftString,  tsNinguno,tsNinguno,True);
    B_OPE_ARBITRAJE  :=CreaCampo('B_OPE_ARBITRAJE', ftString,  tsNinguno,tsNinguno,True);
    B_OPE_CTE_EXTRAN :=CreaCampo('B_OPE_CTE_EXTRAN',ftString,  tsNinguno,tsNinguno,True);
    B_OPE_PRES_VAL   :=CreaCampo('B_OPE_PRES_VAL',  ftString,  tsNinguno,tsNinguno,True);
    B_OPE_REPORTO    :=CreaCampo('B_OPE_REPORTO',   ftString,  tsNinguno,tsNinguno,True);
    B_ORD_EXTRAORD   :=CreaCampo('B_ORD_EXTRAORD',  ftString,  tsNinguno,tsNinguno,True);
    B_ORD_PAQUETE    :=CreaCampo('B_ORD_PAQUETE',   ftString,  tsNinguno,tsNinguno,True);
    B_RETIENE_ISR    :=CreaCampo('B_RETIENE_ISR',   ftString,  tsNinguno,tsNinguno,True);
    CVE_DIA_LIQUIDA  :=CreaCampo('CVE_DIA_LIQUIDA', ftString,  tsNinguno,tsNinguno,True);
    CVE_EMIS_INDEVAL :=CreaCampo('CVE_EMIS_INDEVAL',ftString,  tsNinguno,tsNinguno,True);
    CVE_IND_REF_CAL  :=CreaCampo('CVE_IND_REF_CAL', ftString,  tsNinguno,tsNinguno,True);
    CVE_INSTRUMENTO  :=CreaCampo('CVE_INSTRUMENTO', ftString,  tsNinguno,tsNinguno,True);
    CVE_ISIN         :=CreaCampo('CVE_ISIN',        ftString,  tsNinguno,tsNinguno,True);
    CVE_MONEDA_BASE  :=CreaCampo('CVE_MONEDA_BASE', ftInteger, tsNinguno,tsNinguno,True);
    CVE_PAIS_EMISION :=CreaCampo('CVE_PAIS_EMISION',ftString,  tsNinguno,tsNinguno,True);
    CVE_PAIS_ORIGEN  :=CreaCampo('CVE_PAIS_ORIGEN', ftString,  tsNinguno,tsNinguno,True);
    CVE_TASA_REF     :=CreaCampo('CVE_TASA_REF',    ftString,  tsNinguno,tsNinguno,True);
    DIAS_CUPON       :=CreaCampo('DIAS_CUPON',      ftInteger, tsNinguno,tsNinguno,True);
    DIAS_REVIS_TASA  :=CreaCampo('DIAS_REVIS_TASA', ftInteger, tsNinguno,tsNinguno,True);
    F_ALTA           :=CreaCampo('F_ALTA',          ftDate,    tsNinguno,tsNinguno,True);
    F_EMISION        :=CreaCampo('F_EMISION',       ftDate,    tsNinguno,tsNinguno,True);
    F_ULT_HECHO_ANT  :=CreaCampo('F_ULT_HECHO_ANT', ftDate,    tsNinguno,tsNinguno,True);
    F_ULT_HECHO_BMV  :=CreaCampo('F_ULT_HECHO_BMV', ftDate,    tsNinguno,tsNinguno,True);
    F_VENCIMIENTO    :=CreaCampo('F_VENCIMIENTO',   ftDate,    tsNinguno,tsNinguno,True);
    ID_INTERM_COLOC  :=CreaCampo('ID_INTERM_COLOC', ftInteger, tsNinguno,tsNinguno,True);
    PERS_JUR_ADQUI   :=CreaCampo('PERS_JUR_ADQUI',  ftString,  tsNinguno,tsNinguno,True);
    PLAZO_EMISION    :=CreaCampo('PLAZO_EMISION',   ftInteger, tsNinguno,tsNinguno,True);
    TIPO_ANUALIZA    :=CreaCampo('TIPO_ANUALIZA',   ftInteger, tsNinguno,tsNinguno,True);
    VAL_NOM_TITULO   :=CreaCampo('VAL_NOM_TITULO',  ftFloat,   tsNinguno,tsNinguno,True);
    B_OPE_VTA_CORTO  :=CreaCampo('B_OPE_VTA_CORTO', ftString,  tsNinguno,tsNinguno,True);
    EMISORA.SIZE          :=8;
    SERIE.SIZE            :=8;
    TIPO_VALOR.SIZE       :=4;
    BURSATILIDAD.SIZE     :=2;
    B_BLOQUEO.SIZE        :=1;
    B_COTIZA_EXTRAN.SIZE  :=1;
    B_COTIZA_SENTRA.SIZE  :=1;
    B_GTIA_OPCION.SIZE    :=1;
    B_GTIA_PRES_VAL.SIZE  :=1;
    B_OPE_ARBITRAJE.SIZE  :=1;
    B_OPE_CTE_EXTRAN.SIZE :=1;
    B_OPE_PRES_VAL.SIZE   :=1;
    B_OPE_REPORTO.SIZE    :=1;
    B_ORD_EXTRAORD.SIZE   :=1;
    B_ORD_PAQUETE.SIZE    :=1;
    B_RETIENE_ISR.SIZE    :=1;
    CVE_DIA_LIQUIDA.SIZE  :=4;
    CVE_EMIS_INDEVAL.SIZE :=18;
    CVE_IND_REF_CAL.SIZE  :=8;
    CVE_INSTRUMENTO.SIZE  :=6;
    CVE_ISIN.SIZE         :=12;
    CVE_PAIS_EMISION.SIZE :=6;
    CVE_PAIS_ORIGEN.SIZE  :=6;
    CVE_TASA_REF.SIZE     :=8;
    PERS_JUR_ADQUI.SIZE   :=2;
    B_OPE_VTA_CORTO.SIZE  :=1;
    FActive := False;
    TableName:='EMISORA';
    FKeyFields.Add('EMISORA');
    FKeyFields.Add('SERIE');
    FKeyFields.Add('TIPO_VALOR');
    UseQuery:=True;

    Instrumento := TInstrumen.Create(Self);
    Instrumento.MasterSource:=Self;
    Instrumento.CVE_INSTRUMENTO.MasterField:='CVE_INSTRUMENTO';

end;

destructor TEmisora.Destroy;
begin
      if Instrumento <> Nil then Instrumento.free;
      inherited;
end;

function TEmisora.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('Emisora.it','S,S,S');
   try
      if Active then begin
                         T.Param(0,EMISORA.AsString);
                         T.Param(1,SERIE.AsString);
                         T.Param(2,TIPO_VALOR.AsString);
                     end;
      if T.Execute then
         InternalBusca := FindKey([
                                   T.DameCampo(0),
                                   T.DameCampo(1),
                                   T.DameCampo(2)
                                   ]);
      {end-if}
      finally
         T.Free;
      end;
end;

procedure TEmisora.ValidaSituacion(Var pNumError : Integer);
begin
   pNumError:=0;
   //Si la fecha de vencimiento ya se cumplió, regresa un código de error
   if Not F_VENCIMIENTO.IsNull
   then if F_VENCIMIENTO.AsDateTime > Apli.DameFechaEmpresa
        then pNumError:=1;
end;

function TEmisora.BuscaEmiSerie(pEmisora : String; pSerie : String; Var pTipoValor :String): Boolean;
Var qConsulta : Tquery;
begin BuscaEmiSerie:=False;
      qConsulta:=TQuery.Create(Nil);
      try qConsulta.Databasename:=Databasename;
          qConsulta.SessionName :=SessionName;
          qConsulta.SQL.Add('SELECT TIPO_VALOR FROM EMISORA WHERE ' +
                            ' Emisora = ''' + pEmisora + ''' AND  ' +
                            ' Serie   = ''' + pSerie   + ''' AND  ' +
                            ' (F_Vencimiento IS NULL  OR  ' +
                            '  F_VENCIMIENTO  > TO_DATE(''' + DateTimeToStr(Apli.DameFechaEmpresa) + ''',''DD/MM/YYYY''))');
           qConsulta.Open;
           if qConsulta.RecordCount = 1
           then begin
                  pTipoValor:=qConsulta.FieldByName('TIPO_VALOR').AsString;
                  FindKey([pEmisora,pSerie,pTipoValor]);
                  BuscaEmiSerie:=True;
                end
           else if qConsulta.RecordCount = 0
                then MessageDlg('la emisora no existe o está vencida',mtError,[mbOK],0)
                else MessageDlg('la emisora tiene más de un tipo de valor',mtError,[mbOK],0);
      finally qConsulta.free;
      end;
end;

function TEmisora.BuscaEmiSerieVal(pEmisora : String; pSerie : String; Var pTipoValor :String): Boolean;
Var qConsulta : Tquery;
begin BuscaEmiSerieVal:=False;
      qConsulta:=TQuery.Create(Nil);
      try qConsulta.Databasename:=Databasename;
          qConsulta.SessionName :=SessionName;
          qConsulta.SQL.Add('SELECT TIPO_VALOR FROM EMISORA WHERE ' +
                            ' Emisora = ''' + pEmisora + ''' AND  ' +
                            ' Serie   = ''' + pSerie   + ''' AND  ' +
                            ' tipo_valor = ''' + pTipoValor  + ''' AND  '+
                            ' (F_Vencimiento IS NULL  OR  ' +
                            '  F_VENCIMIENTO  > TO_DATE(''' + DateTimeToStr(Apli.DameFechaEmpresa) + ''',''DD/MM/YYYY''))');
           qConsulta.Open;
           if qConsulta.RecordCount = 1
           then begin
                  pTipoValor:=qConsulta.FieldByName('TIPO_VALOR').AsString;
                  FindKey([pEmisora,pSerie,pTipoValor]);
                  BuscaEmiSerieVal:=True;
                end
           else if qConsulta.RecordCount = 0
                then MessageDlg('la emisora no existe o está vencida',mtError,[mbOK],0)
      finally qConsulta.free;
      end;
end;


function TEmisora.BuscaCuponVig(Var pCupon:Integer):Boolean;
Var qConsulta : Tquery;
begin BuscaCuponVig:=False;
      qConsulta:=TQuery.Create(Nil);
      try qConsulta.Databasename:=Databasename;
          qConsulta.SessionName :=SessionName;
          qConsulta.SQL.Add('SELECT * FROM INFOR_EMISORA WHERE '        +
                            ' Emisora     = ''' + Emisora.AsString      + ''' AND  ' +
                            ' Serie       = ''' + Serie.AsString        + ''' AND  ' +
                            ' Tipo_Valor  = ''' + Tipo_Valor.AsString   + ''' AND  ' +
                            ' F_Operacion = TO_DATE(''' + FormatDateTime('DD/MM/YYYY',Apli.DameFechaEmpresa) + ''',''DD/MM/YYYY'')');
           qConsulta.Open;
           if qConsulta.RecordCount > 0
           then begin
                  pCupon:=qConsulta.FieldByName('NUM_CPN_CTE').AsInteger;
                  BuscaCuponVig:=True;
                end;
      finally qConsulta.free;
      end;
end;

end.
