// Sistema         : Clase de Tipos de Contrato
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Clase de Tipos de Contrato
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Comentarios     :
unit IntTCto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun;

type

  TTipoCto = Class;
  TWTipoCto = class(TForm)
    InterForma1    : TInterForma;
    lbICveTipContrato: TLabel;
    EdCveTipContrato: TEdit;
    lbDescTipoContra: TLabel;
    edDescTipoContra: TEdit;
    BitBtn1: TBitBtn;
    lbFolioContrato: TLabel;
    edFolioContrato: TEdit;
    edIdPrefijoContr: TEdit;
    lbIdPrefijoContr: TLabel;
    cbBValPuesto: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TipoCto : TTipoCto;
  end;

  TTipoCto = class(TInterFrame)
  private
  protected
//  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
    { Public declarations }
    Cve_Tip_Contrato     : TInterCampo;
    Desc_Tipo_Contra     : TInterCampo;
    Folio_Contrato       : TInterCampo;
    Id_Prefijo_Contr     : TInterCampo;
    B_Val_Puesto         : TInterCampo; // CZR 09-sep-2013

    Function InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
    Function ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function  Reporte:Boolean; override;
  published
  end;

implementation

Uses RepTCto;
{$R *.DFM}

constructor TTipoCto.Create( AOwner : TComponent );
begin Inherited;
    Cve_Tip_Contrato := CreaCampo('CVE_TIP_CONTRATO', ftString,  tsNinguno, tsNinguno, True);
    Cve_Tip_Contrato.Size := 4;
    Desc_Tipo_Contra := CreaCampo('DESC_TIPO_CONTRA', ftString,  tsNinguno, tsNinguno, True);
    Folio_Contrato   := CreaCampo('FOLIO_CONTRATO',   ftInteger, tsNinguno, tsNinguno, True);
    Id_Prefijo_Contr := CreaCampo('ID_PREFIJO_CONTR', ftInteger, tsNinguno, tsNinguno, True);
    B_Val_Puesto     := CreaCampo('B_VAL_PUESTO',     ftString,  tsNinguno, tsNinguno, True);  // CZR 09-sep-2013
    FActive          := False;
    FKeyFields.Add('CVE_TIP_CONTRATO');
    TableName        := 'TIPO_CONTRATO';
    UseQuery         := True;
    HelpFile         := 'IntTCto.hlp';
    ShowMenuReporte  := True;
    IsCorp           := True;
end;

destructor TTipoCto.Destroy;
begin inherited;
end;

Function TTipoCto.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWTipoCto;
begin
   W:=TWTipoCto.Create(Self);
   try
      W.TipoCto:= Self;
      W.InterForma1.InterFrame:=Self;
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


Function TTipoCto.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T:=CreaBuscador('IntTCto.it','S,S,I,I');
   try
      if Active then T.Param(0,Cve_Tip_Contrato.AsString);
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function TTipoCto.Reporte:Boolean;
begin
   Execute_RepTCto(True,Self);
end;

(***********************************************FORMA DE TIPOS DE CONTRATO*******)
(*                                                                              *)
(*  FORMA DE TIPOS DE CONTRATO                                                  *)
(*                                                                              *)
(***********************************************FORMA DE TIPOS DE CONTRATO*******)

procedure TWTipoCto.FormShow(Sender: TObject);
begin
   TipoCto.Cve_Tip_Contrato.Control := edCveTipContrato;
   TipoCto.Desc_Tipo_Contra.Control := edDescTipoContra;
   TipoCto.Folio_Contrato.Control   := edFolioContrato;
   // CZR 09-sep-2013
   TipoCto.Id_Prefijo_Contr.Control := edIdPrefijoContr;
   TipoCto.B_Val_Puesto.Control     := cbBValPuesto;
end;

procedure TWTipoCto.FormDestroy(Sender: TObject);
begin
   TipoCto.Cve_Tip_Contrato.Control := nil;
   TipoCto.Desc_Tipo_Contra.Control := nil;
   TipoCto.Folio_Contrato.Control   := nil;
   // CZR 09-sep-2013
   TipoCto.Id_Prefijo_Contr.Control := nil;
   TipoCto.B_Val_Puesto.Control     := nil;
end;

procedure TWTipoCto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWTipoCto.InterForma1DespuesNuevo(Sender: TObject);
begin
   edCveTipContrato.SetFocus;
end;

procedure TWTipoCto.InterForma1DespuesModificar(Sender: TObject);
begin
   edDescTipoContra.SetFocus;
end;

procedure TWTipoCto.BitBtn1Click(Sender: TObject);
begin
   TipoCto.Reporte;
end;
end.



