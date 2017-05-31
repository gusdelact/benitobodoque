// Sistema         : Clase de ConPagVen
// Fecha de Inicio : 29/04/1999
// Función forma   : Clase de ConPagVen
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Alberto Ramirez Pacheco
// Comentarios     :
Unit IntConpagven;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntInvPagare, InterEdit;

Type
  TConPagVen= class; 

  TWConpagven=Class(TForm)
	 InterForma1             : TInterForma;
    lbTitNombre: TLabel;
	 GroupBox1: TGroupBox;
	 lbTxInstCajero: TLabel;
    lbIdContrato: TLabel;
    lbIdPagare: TLabel;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    edDiasPlazoRenov: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    edImpRenovar: TInterEdit;
    Label3: TLabel;
    edCveImpRenov: TEdit;
    Label6: TLabel;
    edFVencimiento: TEdit;
	 procedure FormShow(Sender : TObject); 
	 procedure FormClose(Sender : TObject; var Action : TCloseAction);  
	 procedure FormDestroy(Sender : TObject);
  private 
	 { Private declarations } 
  public 
	 { Public declarations } 
	 Objeto : TConPagVen;
  end; 

  
  TConPagVen = class(TInterFrame) 
  private 
	 FInterFrame: TInterFrame;
  protected 
	 Procedure SetInterFrame(Frame: TInterFrame);		
  public 
{	 Id_Contrato: 		TInterCampo;
	 Id_Pagare:   		TInterCampo;
}
	 Pagare:  TInvPagare;
	 Constructor Create( AOwner : TComponent ); override; 
	 Destructor  Destroy; override; 
	 Procedure   DataBaseChange; override;
	 Function    InternalBusca : Boolean; override; 
	 Function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
	 Function    Reporte:Boolean; override; 	 

	 Property    InterFrame: TInterFrame Read FInterFrame Write SetInterFrame;		
  Published 
  end;

Procedure InstruccionesVencimiento(Padre: TInterFrame; Contrato, Pagare: Integer);

Implementation
{$R *.DFM}


Procedure InstruccionesVencimiento(Padre: TInterFrame; Contrato, Pagare: Integer);
Var Obj: TConPagVen;
Begin
	Obj:= TConPagVen.Create(nil);
	Try
		Obj.GetParams(Padre);
		Obj.Pagare.FindKey([IntToStr(Contrato), IntToStr(Pagare)]);
		Obj.Catalogo;		
	Finally Obj.Free;			
	end;
end;


Constructor TConPagVen.Create( AOwner : TComponent );
begin 
	Inherited; 
{	Id_Contrato:= CreaCampo('ID_CONTRATO', ftInteger, tsNinguno, tsNinguno, True);
	Id_Pagare:= CreaCampo('ID_PAGARE', ftInteger, tsNinguno, tsNinguno, True);
}
	Pagare:= TInvPagare.Create(self);
	
	FInterFrame:= nil;
	FKeyFields.Add('ID_CONTRATO');
	FKeyFields.Add('ID_PAGARE');
	TableName:= 'INV_PAGARE';
	StpName  := ' '; 
	UseQuery := True; 
	HelpFile := 'IntConpagven.Hlp';
	IsCheckSecu:= False;
end;

Destructor TConPagVen.Destroy;
begin 
	If Pagare <> nil then Pagare.Free;
	Inherited;
end;

Procedure TConPagVen.DataBaseChange; 
Begin
	Inherited;
	Pagare.GetParams(self);
end;


function TConPagVen.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWConpagven;
begin
	W:=TWConpagven.Create(Self);
	try
		W.Objeto:= Self;
		W.InterForma1.InterFrame:= Self;
		W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
		W.InterForma1.ShowGrid := False;
		W.InterForma1.ShowNavigator := False;
		W.InterForma1.Funcion := FInterFun;
		W.InterForma1.ShowBtnBuscar:= False;
		W.InterForma1.ShowModal;
		ShowWindow := W.InterForma1.ModalResult;
	finally
		W.Free;
	end;
end;


Function TConPagVen.InternalBusca:Boolean;
Var T:TInterFindit;
begin 
{InternalBusca := False; 
		T := CreaBuscador('IConpagv.it','');
		Try if Active then begin end;
			 if T.Execute then InternalBusca := FindKey(['']);
		finally  T.Free;
		end;}
end;

Procedure TConPagVen.SetInterFrame(Frame: TInterFrame);		
Begin 
	FInterFrame:= Frame;
	If Frame <> nil Then Pagare.FindKey([Frame.FieldByName('ID_CONTRATO').asString, Frame.FieldByName('ID_PAGARE').asString])
	else Pagare.Active:= False;
end;

function TConPagVen.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA ConPagVen********************)
(*                                                                              *)
(*  FORMA DE ConPagVen                                                            *)
(*                                                                              *)
(***********************************************FORMA ConPagVen********************)

procedure TWConpagven.FormShow(Sender: TObject);
begin
	Objeto.Pagare.ID_CONTRATO.Control:= lbIdContrato;
	Objeto.Pagare.ID_PAGARE.Control:= lbIdPagare;
	Objeto.Pagare.DIAS_PLAZO_RENOV.Control:= edDiasPlazoRenov;
//	Objeto.Pagare.CVE_IMP_RENOV.Control:= edCveImpRenov;
	Objeto.Pagare.IMP_RENOVAR.Control:= edImpRenovar;
	Objeto.Pagare.TX_INST_CAJERO.Control:= lbTxInstCajero;
	Objeto.Pagare.F_VENCIMIENTO.Control:= edFVencimiento;

	If Objeto.Pagare.CVE_IMP_RENOV.AsString = 'TO' Then  edCveImpRenov.Text:= 'Total a vencer'
	else If Objeto.Pagare.CVE_IMP_RENOV.AsString = 'CP' Then edCveImpRenov.Text:= 'Sólo Capital'
	else If Objeto.Pagare.CVE_IMP_RENOV.AsString = 'IM' Then edCveImpRenov.Text:= 'Importe'
	else If Objeto.Pagare.CVE_IMP_RENOV.AsString = 'NA' Then edCveImpRenov.Text:= 'No Renovar';

	If Objeto.InterFrame <> nil Then 
		Objeto.InterFrame.FieldByName('NOM_TITULAR').Control:= lbTitNombre;
end;

procedure TWConpagven.FormDestroy(Sender: TObject);
begin
	Objeto.Pagare.ID_CONTRATO.Control:= nil;
	Objeto.Pagare.ID_PAGARE.Control:= nil;
	Objeto.Pagare.DIAS_PLAZO_RENOV.Control:= nil;
//	Objeto.Pagare.CVE_IMP_RENOV.Control:= nil;
	Objeto.Pagare.IMP_RENOVAR.Control:= nil;
	Objeto.Pagare.TX_INST_CAJERO.Control:= nil;
	Objeto.Pagare.F_VENCIMIENTO.Control:= nil;

	If Objeto.InterFrame <> nil Then 
		Objeto.InterFrame.FieldByName('NOM_TITULAR').Control:= nil;
end;

procedure TWConpagven.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;


end.
