// Sistema         : Sistema de créditos
// Fecha de Inicio : Mayo-1998
// Función forma   : Clase de recepción de transacciones
// Desarrollo por  : Ing. Juan Carlos Sánchez Reyes
// Comentarios     :
unit InTCrRt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun; //, IntCrPar;

type

  TCrRt = Class;
  TWCrRT = class(TForm)
    InterForma1: TInterForma;
    edFolRecepTrans: TEdit;
    edIdCredito: TEdit;
    edIdContrato: TEdit;
    edFolGpoTrans: TEdit;
    edFOperacion: TEdit;
    edHOperacion: TEdit;
    edNumPeriodo: TEdit;
    edImpOperacion: TEdit;
    edTasaAplicacion: TEdit;
    edSitRecepTrans: TEdit;
    edTipoCambio: TEdit;
    edCveUsuAplica: TEdit;
    edIdCodResp: TEdit;
    edCveOperacion: TEdit;
    edFLiquidacion: TEdit;
    edHLiquidacion: TEdit;
    edSdoGeneraTrans: TEdit;
    edTxComentario: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edFAplicacion: TEdit;
    Label19: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Nuevo(Sender : TObject; var Realizado : Boolean);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto : TCrRt;
  end;

  TCrRt = class(TInterFrame)
  private
  protected
  public
    { Public declarations }
   FOL_RECEP_TRAN             :TInterCampo;
   ID_CREDITO                 :TInterCampo;
   ID_CONTRATO                :TInterCampo;
   FOLIO_GPO_TRANS            :TInterCampo;
   F_OPERACION                :TInterCampo;
   H_OPERACION                :TInterCampo;
   F_APLICACION               :TInterCampo;
   NUM_PERIODO                :TInterCampo;
   IMP_OPERACION              :TInterCampo;
   TASA_APLICACION            :TInterCampo;
   SIT_RECEP_TRANS            :TInterCampo;
   TIPO_CAMBIO                :TInterCampo;
   CVE_USU_APLICA             :TInterCampo;
   ID_COD_RESP                :TInterCampo;
   CVE_OPERACION              :TInterCampo;
   F_LIQUIDACION              :TInterCampo;
   H_LIQUIDACION              :TInterCampo;
   SDO_GENERA_TRANS           :TInterCampo;
   TX_COMENTARIO              :TInterCampo;

    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    Procedure   DataBaseChange; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
    function    CodRes : integer;
    function    InsTrans : Integer;
  published
  end;

implementation

{$R *.DFM}

constructor TCrRt.Create( AOwner : TComponent );
begin
   Inherited Create(AOwner);
   FOL_RECEP_TRAN             :=CreaCampo('FOL_RECEP_TRAN',ftInteger,tsNinguno,tsNinguno,True);
   ID_CREDITO                 :=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,True);
   ID_CONTRATO                :=CreaCampo('ID_CONTRATO',ftInteger,tsNinguno,tsNinguno,True);
   FOLIO_GPO_TRANS            :=CreaCampo('FOLIO_GPO_TRANS',ftInteger,tsNinguno,tsNinguno,True);
   F_OPERACION                :=CreaCampo('F_OPERACION',ftDate,tsNinguno,tsNinguno,True);
   H_OPERACION                :=CreaCampo('H_OPERACION',ftInteger,tsNinguno,tsNinguno,True);
   F_APLICACION               :=CreaCampo('F_APLICACION',ftDate,tsNinguno,tsNinguno,True);
   NUM_PERIODO                :=CreaCampo('NUM_PERIODO',ftInteger,tsNinguno,tsNinguno,True);
   IMP_OPERACION              :=CreaCampo('IMP_OPERACION',ftFloat,tsNinguno,tsNinguno,True);
   TASA_APLICACION            :=CreaCampo('TASA_APLICACION',ftFloat,tsNinguno,tsNinguno,True);
   SIT_RECEP_TRANS            :=CreaCampo('SIT_RECEP_TRANS',ftString,tsNinguno,tsNinguno,True);
   SIT_RECEP_TRANS.Size:=2;
   TIPO_CAMBIO                :=CreaCampo('TIPO_CAMBIO',ftFloat,tsNinguno,tsNinguno,True);
   CVE_USU_APLICA             :=CreaCampo('CVE_USU_APLICA',ftString,tsNinguno,tsNinguno,True);
   CVE_USU_APLICA.Size:=8;
   ID_COD_RESP                :=CreaCampo('ID_COD_RESP',ftInteger,tsNinguno,tsNinguno,True);
   CVE_OPERACION              :=CreaCampo('CVE_OPERACION',ftString,tsNinguno,tsNinguno,True);
   CVE_OPERACION.Size:=6;
   F_LIQUIDACION              :=CreaCampo('F_LIQUIDACION',ftDate,tsNinguno,tsNinguno,True);
   H_LIQUIDACION              :=CreaCampo('H_LIQUIDACION',ftInteger,tsNinguno,tsNinguno,True);
   SDO_GENERA_TRANS           :=CreaCampo('SDO_GENERA_TRANS',ftFloat,tsNinguno,tsNinguno,True);
   TX_COMENTARIO              :=CreaCampo('TX_COMENTARIO',ftString,tsNinguno,tsNinguno,True);

   FKeyFields.Add('FOL_RECEP_TRAN');
   TableName := 'CRE_RECEP_TRANS';
   UseQuery := True;
   HelpFile := 'IntTemp.hlp';
   ShowMenuReporte := True;
end;

destructor TCrRt.Destroy;
begin
  inherited;
end;

Procedure TCrRt.DataBaseChange;
begin
end;

function TCrRt.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrRt;
begin
   W:=TWCrRt.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame := Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

Function TCrRt.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IntCrRt.it','I');
   try
      if Active then T.Param(0,FOL_RECEP_TRAN.AsString);
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function TCrRt.Reporte:Boolean;
begin
// Aqui ejecutar el proceso del reporte
end;

function TCrRt.CodRes : Integer;
var
  qryRecep : TQuery;
  vlCodRes : Integer;
begin
  qryRecep := TQuery.Create(nil);
  qryRecep.DatabaseName := DatabaseName;
  qryRecep.SessionName  := SessionName;

  with qryRecep do
  begin
    Name := 'qryRecep';
    SQL.Clear;

    SQL.Add('SELECT CRE_RECEP_TRANS."ID_COD_RESP" FROM "CRE_RECEP_TRANS" CRE_RECEP_TRANS WHERE ( CRE_RECEP_TRANS."FOL_RECEP_TRAN" = :FOLIO )');
    ParamByName('FOLIO').AsInteger := FOL_RECEP_TRAN.AsInteger;
    Prepare;
    Open;
    vlCodRes := FieldByName('ID_COD_RESP').AsInteger;
    Close;
    Unprepare;
  end;
  CodRes := vlCodRes;
end;

function TCrRt.InsTrans : integer;
var
   vlIdCredito     : Integer;
   vlIdContrato    : Integer;
   vlFOperacion    : TDateTime;
   vlHOperacion    : Integer;
   vlFAplicacion   : TDateTime;
   vlNumPeriodo    : Integer;
   vlImpOperacion  : Real;
   vlTasa          : Real;
   vlSituacion     : String;
   vlTipoCambio    : Real;
   vlUsuario       : String;
   vlCveOperacion  : String;
   vlFLiquidacion  : TDateTime;
   vlHLiquidacion  : Integer;
   vlSdoGenTrans   : Real;
   vlTxComentario  : String;
   vlFolRecepTran  : integer;
begin
   vlFolRecepTran  := FOL_RECEP_TRAN.AsInteger;
   vlIdCredito     := ID_CREDITO.AsInteger;
   vlIdContrato    := ID_CONTRATO.AsInteger;
   vlFOperacion    := F_OPERACION.AsDateTime;
   vlHOperacion    := H_OPERACION.AsInteger;
   vlFAplicacion   := F_APLICACION.AsDateTime;
   vlNumPeriodo    := NUM_PERIODO.AsInteger;
   vlImpOperacion  := IMP_OPERACION.AsFloat;
   vlTasa          := TASA_APLICACION.AsFloat;
   vlSituacion     := SIT_RECEP_TRANS.AsString;
   vlTipoCambio    := TIPO_CAMBIO.AsFloat;
   vlUsuario       := CVE_USU_APLICA.AsString;
   vlCveOperacion  := CVE_OPERACION.AsString;
   vlFLiquidacion  := F_LIQUIDACION.AsDateTime;
   vlHLiquidacion  := H_LIQUIDACION.AsInteger;
   vlSdoGenTrans   := SDO_GENERA_TRANS.AsFloat;
   vlTxComentario  := TX_COMENTARIO.AsString;

  Append;
(* Toma el folio *)
  FOL_RECEP_TRAN.AsInteger  := vlFolRecepTran;
  ID_CREDITO.AsInteger      := vlIdCredito;
  ID_CONTRATO.AsInteger     := vlIdContrato;
  F_OPERACION.AsDateTime    := vlFOperacion;
  H_OPERACION.AsInteger     := vlHOperacion;
  F_APLICACION.AsDateTime   := vlFAplicacion;
  NUM_PERIODO.AsInteger     := vlNumPeriodo;
  IMP_OPERACION.AsFloat     := vlImpOperacion;
  TASA_APLICACION.AsFloat   := vlTasa;
  SIT_RECEP_TRANS.AsString  := vlSituacion;
  TIPO_CAMBIO.AsFloat       := vlTipoCambio;
  CVE_USU_APLICA.AsString   := vlUsuario;
  CVE_OPERACION.AsString    := vlCveOperacion;
  F_LIQUIDACION.AsDateTime  := vlFLiquidacion;
  H_LIQUIDACION.AsInteger   := vlHLiquidacion;
  SDO_GENERA_TRANS.AsFloat  := vlSdoGenTrans;
  TX_COMENTARIO.AsString    := vlTxComentario;
  FOLIO_GPO_TRANS.AsInteger := 0;
  ID_COD_RESP.AsInteger     := 0;

  Post;
  InsTrans := CodRes;
end;

(***********************************************FORMA TEMPLATE*******************)
(*                                                                              *)
(*  FORMA TEMPLATE                                                              *)
(*                                                                              *)
(***********************************************FORMA TEMPLATE*******************)

procedure TWCrRT.FormShow(Sender: TObject);
begin
   With Objeto do
   begin
     FOL_RECEP_TRAN.Control     := edFolRecepTrans;
     ID_CREDITO.Control         := edIdCredito;
     ID_CONTRATO.Control        := edIdContrato;
     FOLIO_GPO_TRANS.Control    := edFolGpoTrans;
     F_OPERACION.Control        := edFOperacion;
     H_OPERACION.Control        := edHOperacion;
     F_APLICACION.Control       := edFAplicacion;
     NUM_PERIODO.Control        := edNumPeriodo;
     IMP_OPERACION.Control      := edImpOperacion;
     TASA_APLICACION.Control    := edTasaAplicacion;
     SIT_RECEP_TRANS.Control    := edSitRecepTrans;
     TIPO_CAMBIO.Control        := edTipoCambio;
     CVE_USU_APLICA.Control     := edCveUsuAplica;
     ID_COD_RESP.Control        := edIdCodResp;
     CVE_OPERACION.Control      := edCveOperacion;
     F_LIQUIDACION.Control      := edFLiquidacion;
     H_LIQUIDACION.Control      := edHLiquidacion;
     SDO_GENERA_TRANS.Control   := edSdoGeneraTrans;
     TX_COMENTARIO.Control      := edTxComentario;
   end;
end;

procedure TWCrRT.FormDestroy(Sender: TObject);
begin
   With Objeto do
   begin
     FOL_RECEP_TRAN.Control     := nil;
     ID_CREDITO.Control         := nil;
     ID_CONTRATO.Control        := nil;
     FOLIO_GPO_TRANS.Control    := nil;
     F_OPERACION.Control        := nil;
     H_OPERACION.Control        := nil;
     F_APLICACION.Control       := nil;
     NUM_PERIODO.Control        := nil;
     IMP_OPERACION.Control      := nil;
     TASA_APLICACION.Control    := nil;
     SIT_RECEP_TRANS.Control    := nil;
     TIPO_CAMBIO.Control        := nil;
     CVE_USU_APLICA.Control     := nil;
     ID_COD_RESP.Control        := nil;
     CVE_OPERACION.Control      := nil;
     F_LIQUIDACION.Control      := nil;
     H_LIQUIDACION.Control      := nil;
     SDO_GENERA_TRANS.Control   := nil;
     TX_COMENTARIO.Control      := nil;
   end;
end;

procedure TWCrRT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrRT.InterForma1Nuevo(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Append;
   Realizado := True;
end;

procedure TWCrRT.InterForma1DespuesNuevo(Sender: TObject);
begin

  edIdCredito.SetFocus;
end;

procedure TWCrRT.InterForma1DespuesModificar(Sender: TObject);
begin
   edIdCredito.SetFocus;
end;

procedure TWCrRT.BitBtn1Click(Sender: TObject);
begin
   Objeto.Reporte;
end;


procedure TWCrRT.InterForma1DespuesAceptar(Sender: TObject);
begin
  if Objeto.CodRes <> 0 then
    Showmessage('Error en la transacción, error = ' + IntToStr(Objeto.CodRes));
end;

end.



