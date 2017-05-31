unit IntInstr;
//******************************************************************************
//* Clase Instrumento
//* Realizó : Marcos Zárate Castro
//* Empresa : Interacciones Casa de Bolsa.
//* Fecha   : Diciembre de 1997.
//******************************************************************************

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  IntFind;

type
  TInstrumen = class(TInterFrame)
  private
  protected
  public
    { Public declarations }
    CVE_INSTRUMENTO   : TInterCampo;
    B_APLICA_CUPON    : TInterCampo;
    B_OPE_MCAP        : TInterCampo;
    B_OPE_MDIN        : TInterCampo;
    B_OPE_REPORTO     : TInterCampo;
    B_OPE_SINV        : TInterCampo;
    B_PAGO_CPN_AUT    : TInterCampo;
    B_RETIENE_ISR     : TInterCampo;
    B_ULT_NIVEL       : TInterCampo;
    CVE_DIA_LIQUIDA   : TInterCampo;
    CVE_IND_REF_CAL   : TInterCampo;
    CVE_MONEDA_BASE   : TInterCampo;
    CVE_TASA_REF      : TInterCampo;
    CVE_TIPO_RENTA    : TInterCampo;
    CVE_TIPO_SECTOR   : TInterCampo;
    DESC_CORTA_INSTR  : TInterCampo;
    DESC_INSTRUMENTO  : TInterCampo;
    DIAS_CUPON        : TInterCampo;
    DIAS_REVIS_TASA   : TInterCampo;
    ID_AUTORI_LIQ     : TInterCampo;
    PCT_IMPTO_PF_EXT  : TInterCampo;
    PCT_IMPTO_PF_NAL  : TInterCampo;
    PCT_IMPTO_PM_EXT  : TInterCampo;
    PCT_IMPTO_PM_NAL  : TInterCampo;
    TIPO_ANUALIZA     : TInterCampo;
    TIPO_CALC_PRECIO  : TInterCampo;
    TIPO_OPERACION    : TInterCampo;
    TIPO_VALOR        : TInterCampo;
    VAL_NOM_TITULO    : TInterCampo;
    TIPO_VALUACION    : TInterCampo;
    CodigoRespuesta   : TInterCampo;
    function ValidaLocaliza: Boolean; override;
    function InternalBusca:Boolean;   override;
    constructor Create(AOwner : TComponent ); override;
    destructor Destroy; override;
  published
  end;

implementation

constructor TInstrumen.Create(AOwner : TComponent );
begin Inherited Create(AOwner);
      IsCheckSecu:=False;
      FPrefijo:='';
      CVE_INSTRUMENTO   :=CreaCampo('pCVE_INSTRUMENTO', ftString,tsNuevo+tsConsulta+tsModifica+tsElimina,tsNinguno,                              False);
      B_APLICA_CUPON    :=CreaCampo('pB_APLICA_CUPON',  ftString,tsNuevo+tsModifica,                     tsConsulta,                             False);
      B_OPE_MCAP        :=CreaCampo('pB_OPE_MCAP',      ftString,tsNuevo+tsModifica,                     tsConsulta,                             False);
      B_OPE_MDIN        :=CreaCampo('pB_OPE_MDIN',      ftString,tsNuevo+tsModifica,                     tsConsulta,                             False);
      B_OPE_REPORTO     :=CreaCampo('pB_OPE_REPORTO',   ftString,tsNuevo+tsModifica,                     tsConsulta,                             False);
      B_OPE_SINV        :=CreaCampo('pB_OPE_SINV',      ftString,tsNuevo+tsModifica,                     tsConsulta,                             False);
      B_PAGO_CPN_AUT    :=CreaCampo('pB_PAGO_CPN_AUT',  ftString,tsNuevo+tsModifica,                     tsConsulta,                             False);
      B_RETIENE_ISR     :=CreaCampo('pB_RETIENE_ISR',   ftString,tsNuevo+tsModifica,                     tsConsulta,                             False);
      B_ULT_NIVEL       :=CreaCampo('pB_ULT_NIVEL',     ftString,tsNuevo+tsModifica,                     tsConsulta,                             False);
      CVE_DIA_LIQUIDA   :=CreaCampo('pCVE_DIA_LIQUIDA', ftString,tsNuevo+tsModifica,                     tsConsulta,                             False);
      CVE_IND_REF_CAL   :=CreaCampo('pCVE_IND_REF_CAL', ftString,tsNuevo+tsModifica,                     tsConsulta,                             False);
      CVE_MONEDA_BASE   :=CreaCampo('pCVE_MONEDA_BASE', ftInteger,tsNuevo+tsModifica,                    tsConsulta,                             False);
      CVE_TASA_REF      :=CreaCampo('pCVE_TASA_REF',    ftString,tsNuevo+tsModifica,                     tsConsulta,                             False);
      CVE_TIPO_RENTA    :=CreaCampo('pCVE_TIPO_RENTA',  ftString,tsNuevo+tsModifica,                     tsConsulta,                             False);
      CVE_TIPO_SECTOR   :=CreaCampo('pCVE_TIPO_SECTOR', ftString,tsNuevo+tsModifica,                     tsConsulta,                             False);
      DESC_CORTA_INSTR  :=CreaCampo('pDESC_CORTA_INSTR',ftString,tsNuevo+tsModifica,                     tsConsulta,                             False);
      DESC_INSTRUMENTO  :=CreaCampo('pDESC_INSTRUMENTO',ftString,tsNuevo+tsModifica,                     tsConsulta,                             False);
      DIAS_CUPON        :=CreaCampo('pDIAS_CUPON',      ftInteger,tsNuevo+tsModifica,                    tsConsulta,                             False);
      DIAS_REVIS_TASA   :=CreaCampo('pDIAS_REVIS_TASA', ftInteger,tsNuevo+tsModifica,                    tsConsulta,                             False);
      ID_AUTORI_LIQ     :=CreaCampo('pID_AUTORI_LIQ',   ftInteger,tsNuevo+tsModifica,                    tsConsulta,                             False);
      PCT_IMPTO_PF_EXT  :=CreaCampo('pPCT_IMPTO_PF_EXT',ftFloat,tsNuevo+tsModifica,                      tsConsulta,                             False);
      PCT_IMPTO_PF_NAL  :=CreaCampo('pPCT_IMPTO_PF_NAL',ftFloat,tsNuevo+tsModifica,                      tsConsulta,                             False);
      PCT_IMPTO_PM_EXT  :=CreaCampo('pPCT_IMPTO_PM_EXT',ftFloat,tsNuevo+tsModifica,                      tsConsulta,                             False);
      PCT_IMPTO_PM_NAL  :=CreaCampo('pPCT_IMPTO_PM_NAL',ftFloat,tsNuevo+tsModifica,                      tsConsulta,                             False);
      TIPO_ANUALIZA     :=CreaCampo('pTIPO_ANUALIZA',   ftInteger,tsNuevo+tsModifica,                    tsConsulta,                             False);
      TIPO_CALC_PRECIO  :=CreaCampo('pTIPO_CALC_PRECIO',ftString,tsNuevo+tsModifica,                     tsConsulta,                             False);
      TIPO_OPERACION    :=CreaCampo('pTIPO_OPERACION',  ftString,tsNuevo+tsModifica,                     tsConsulta,                             False);
      TIPO_VALOR        :=CreaCampo('pTIPO_VALOR',      ftString,tsNuevo+tsModifica,                     tsConsulta,                             False);
      VAL_NOM_TITULO    :=CreaCampo('pVAL_NOM_TITULO',  ftFloat,tsNuevo+tsModifica,                      tsConsulta,                             False);
      TIPO_VALUACION    :=CreaCampo('pTIPO_VALUACION',  ftString,tsNuevo+tsModifica,                     tsConsulta,                             False);
      CodigoRespuesta:= CreaCampo('pResultado',         ftInteger,tsNinguno,                             tsConsulta+tsNuevo+tsModifica+tsElimina,False);
      CVE_INSTRUMENTO.Size   :=6;
      B_APLICA_CUPON.Size    :=1;
      B_OPE_MCAP.Size        :=1;
      B_OPE_MDIN.Size        :=1;
      B_OPE_REPORTO.Size     :=1;
      B_OPE_SINV.Size        :=1;
      B_PAGO_CPN_AUT.Size    :=1;
      B_RETIENE_ISR.Size     :=1;
      B_ULT_NIVEL.Size       :=1;
      CVE_DIA_LIQUIDA.Size   :=4;
      CVE_IND_REF_CAL.Size   :=8;
      CVE_TASA_REF.Size      :=8;
      CVE_TIPO_RENTA.Size    :=2;
      CVE_TIPO_SECTOR.Size   :=2;
      DESC_CORTA_INSTR.Size  :=15;
      DESC_INSTRUMENTO.Size  :=40;
      TIPO_CALC_PRECIO.Size  :=4;
      TIPO_OPERACION.Size    :=2;
      TIPO_VALOR.Size        :=4;
      TIPO_VALUACION.Size    :=4;
      FActive := False;
      stpName:='SPE_BUSINSTRUM';
      FKeyFields.Add('pCVE_INSTRUMENTO');
      UseQuery:=False;
end;

destructor TInstrumen.Destroy;
begin
      inherited;
end;

function TInstrumen.ValidaLocaliza: Boolean;
begin
    if CodigoRespuesta.AsInteger <> 0 then
       ValidaLocaliza:=False
    else
       ValidaLocaliza:=True;
    {end-if}
end;

function TInstrumen.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('Instrume.it','S,S');
   try
      if Active then begin
                         T.Param(0,CVE_INSTRUMENTO.AsString);
                         T.Param(1,DESC_INSTRUMENTO.AsString);
                     end;
      if T.Execute then
         InternalBusca := FindKey([
                                   T.DameCampo(0),
                                   T.DameCampo(1)
                                   ]);
      {end-if}
      finally
         T.Free;
      end;
end;


end.

