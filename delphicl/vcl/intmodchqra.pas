// Sistema         : Clase de ModChqra
// Fecha de Inicio : 30/06/1999
// Función forma   : Clase de ModChqra
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Alberto Ramirez Pacheco
// Comentarios     :
Unit IntModChqra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntChCte;

Type
  TModChqra= class; 

  TWModchqra=Class(TForm)
	 InterForma1             : TInterForma; 
	 lbCAMPO1 : TLabel;
	 lvContrato: TListView;
	 bTodos: TSpeedButton;
	 GroupBox1: TGroupBox;
	 GroupBox2: TGroupBox;
	 edIdBancoChqra: TEdit;
	 edCuentaBanco: TEdit;
	 lbColonia: TLabel;
	 Label1: TLabel;
	 lbIntermediario: TLabel;
	 Label2: TLabel;
	 Label3: TLabel;
	 edIdBancoChqraNue: TEdit;
	 edCuentaBancoNue: TEdit;
	 lbIntermediarioNue: TLabel;
	 BitBtn1: TBitBtn;
	 procedure FormShow(Sender : TObject); 
	 procedure FormClose(Sender : TObject; var Action : TCloseAction);
	 procedure lvContratoColumnClick(Sender: TObject; Column: TListColumn);
	 procedure bTodosClick(Sender: TObject);
	 procedure FormHide(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  Private 
  Public 
	 Objeto : TModChqra;
  end; 

  TModChqra= class(TInterFrame) 
  Private 
	 FChequera: TCheqCte;
	 FOrderBy: String;
	 FSort: String;
  Protected 
	 Procedure SetChequera(Chqra: TCheqCte);
	 Procedure SetOrderBy(Order: String);
	 Function  GetSort: String;
	 Procedure SetCheckAll(Check: Boolean);
	 Function  GetCheckAll: Boolean;
  Public 
	 lvCtto: TListView;	 
	 Resultado: Boolean;
	 Constructor Create( AOwner : TComponent ); override; 
	 Destructor  Destroy; override; 
	 Function    InternalBusca : Boolean; override; 
	 Function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
	 Procedure   RefrescaCttos;
	 Procedure 	 BorraCttos;
	 Procedure   Execute;
	 
	 Property    Chequera: TCheqCte Read FChequera Write SetChequera;
	 Property    OrderBy: String Read FOrderBy Write SetOrderBy;
	 Property    Sort: String Read GetSort Write FSort;
	 Property 	 CheckAll: Boolean Read GetCheckAll Write SetCheckAll;
  end;

Function Execute_ModChqra(pChequera: TCheqCte): Boolean;
Procedure AddString(Var Sql: String; Str: String);

Implementation

{$R *.DFM}

Procedure AddString(Var Sql: String; Str: String);
Begin
	If Trim(Sql) = '' Then Sql:= Str
	else Sql:= Sql + ', ' + Str;
end;


Function Execute_ModChqra(pChequera: TCheqCte): Boolean;
Var Obj: TModChqra;
Begin
	Result:= False;
	Obj:= TModChqra.Create(nil);
	Try
		Obj.GetParams(pChequera);	
		Obj.Chequera:= pChequera;
		Obj.Catalogo;
	Finally 
		Result:= Obj.Resultado;
		Obj.Free;
	end;
end;


Constructor TModChqra.Create( AOwner : TComponent ); 
begin
	Inherited; 
	Resultado:= False;
	FOrderBy:= '';	
	FSort:= 'DESC';
	StpName  := ' '; 
	UseQuery := False; 	
	FChequera:= nil;
end;

Destructor TModChqra.Destroy;
begin inherited;
end;

Function TModChqra.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWModchqra;
begin
	W:=TWModchqra.Create(Self);
	Try
		W.Objeto:= Self;
		lvCtto:= W.lvContrato;
		W.InterForma1.InterFrame:= Self;
		W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
		W.InterForma1.ShowGrid := False;
		W.InterForma1.ShowNavigator := False;
		W.InterForma1.Funcion := FInterFun;
		W.InterForma1.ShowModal;
		ShowWindow := W.InterForma1.ModalResult;
	Finally
		W.Free;
	end;
end;

Function TModChqra.InternalBusca: Boolean;
Begin
{Var T:TInterFindit;
begin InternalBusca := False; 
		T := CreaBuscador('IModchqr.it','');
		Try if Active then begin end;
			 if T.Execute then InternalBusca := FindKey([]);
		finally  T.Free;
		end; 
end;}
end;


Procedure TModChqra.SetChequera(Chqra: TCheqCte);
Begin FChequera:= Chqra;
end;


Procedure TModChqra.SetOrderBy(Order: String);
Begin 
	If Trim(Order) = '' Then FOrderBy:= ''
	else FOrderBy:= ' ORDER BY '+ Order + Sort;
	RefrescaCttos;
end;

Function TModChqra.GetSort: String;
Var Resultado: String;
Begin
	Resultado:= '';
	Try
		If Trim(FSort) = '' Then Resultado:= ' ASC '
		else If Trim(FSort) = 'ASC' Then Resultado:= ' DESC '
		else Resultado:= ' ASC ';
	Finally
		FSort := Resultado;
		Result:= Resultado;
	end;
end;

Procedure TModChqra.BorraCttos;
Begin If lvCtto <> nil Then lvCtto.Items.Clear;
end;


Procedure TModChqra.SetCheckAll(Check: Boolean);
Var Indice: Integer;
Begin
	If lvCtto = nil then Exit;
	For Indice:= 0 To lvCtto.Items.Count - 1 do
		lvCtto.Items.Item[Indice].Checked:= Check;
end;


Function TModChqra.GetCheckAll: Boolean;
Var 
	Indice: Integer;
	All: Boolean;
Begin
	If lvCtto = nil then Exit;
	All:= True;
	For Indice:= 0 To lvCtto.Items.Count - 1 do
		If Not lvCtto.Items.Item[Indice].Checked Then All:= False;		

	Result:= All;
end;


Procedure TModChqra.RefrescaCttos;
var 
	q: TQuery;
	ListItem: TListItem;
Begin
	BorraCttos;
	
	q:= GetSqlQuery(
			' SELECT '+
			'  Contrato.Id_Contrato, Persona.Nombre, Contrato.Cve_Tip_Contrato'+
			' FROM'+ 
			'  Contrato, Persona'+
			' WHERE '+
			'  Contrato.Id_Contrato in '+
			'   (Select Chequera_Cte_Cto.Id_Contrato'+
			'    From Chequera_Cte_Cto'+
			'    Where Chequera_Cte_Cto.Id_Persona = '+ Chequera.Id_Persona.AsSQL +
			'	   and Chequera_Cte_Cto.Id_Banco_Chqra = '+ Chequera.Id_Banco_Chqra.AsSQL +
			'	   and Chequera_Cte_Cto.Cuenta_Banco = '+ Chequera.Cuenta_Banco.AsSQL + ')' +
			'  and Contrato.Id_Titular = Persona.Id_Persona' + OrderBy,
			DataBaseName, SessionName, True);
	Try
		While (q <> nil) and (Not q.EOF) do
		Begin
			If lvCtto <> nil Then
			Begin
				ListItem := lvCtto.Items.add;
				ListItem.Caption:= q.FieldByName('ID_CONTRATO').asString;
				ListItem.SubItems.Add(q.FieldByName('NOMBRE').asString);
				ListItem.SubItems.Add(q.FieldByName('CVE_TIP_CONTRATO').asString);
			end;		
			
			q.Next;
		end;
	Finally If q <> nil Then q.Free;
	end;
end;


Procedure TModChqra.Execute;
Var
	Indice: Integer;
	Contratos, Mensaje: String;
	TransaccionOK: Boolean;
Begin
	If lvCtto = Nil then Exit;

	Contratos:= '';
	For Indice:= 0 To lvCtto.Items.Count - 1  do
	Begin
		If lvCtto.Items.Item[Indice].Checked Then
			AddString(Contratos, lvCtto.Items.Item[Indice].Caption);
	end;

	If Trim(Contratos) = '' Then
		Raise EInterFrame.Create('No ha seleccionado un contrato para actualizar');

	TransaccionOK:= False;
	Apli.DataBase.StartTransaction;
	Try
		Mensaje:= 'Error al crear la nueva chequera';

		If Not GetSQL(
					' SELECT Cuenta_Banco FROM Chequera_Cte '+
					' WHERE Id_Persona = '+ Chequera.Id_Persona.AsSQL +
					'   and Id_Banco_Chqra = '+ Chequera.Id_Banco_Chqra_Nue.AsSQL +
					'   and Sit_chequera = ''AC'''+
					'   and Cuenta_Banco = '+ Chequera.Cuenta_Banco_Nue.AsSQL,
					DataBaseName, SessionName, True) Then
		Begin
			RunSQL(
				' INSERT Into Chequera_Cte('+
				'    Id_Persona,       Id_Banco_Chqra,   Cve_Suc_Banco,'+
				'    Cuenta_Banco,     ABA,              FFC,'+
				'    Id_Plaza,         Nom_Plaza_Ext,    Nom_Suc_Banco,'+
				'    B_Linea_Bancaria, Nom_Plaza_Banco,  Id_Pza_Banxico,'+
                                '    Sit_chequera,     B_depurado)'+
				' VALUES ('+
						Chequera.Id_Persona.AsSQL + ', ' +
						Chequera.Id_Banco_Chqra_Nue.AsSQL + ', ' +
						Chequera.Cve_Suc_Banco.AsSQL + ', ' +
						Chequera.Cuenta_Banco_Nue.AsSQL + ', ' +
						Chequera.ABA.AsSQL + ', ' +
						Chequera.FFC.AsSQL + ', ' +
						Chequera.Id_Plaza.AsSQL + ', ' +
						Chequera.Nom_Plaza_Ext.AsSQL + ', ' +
						Chequera.Nom_Suc_Banco.AsSQL + ', ' +
						Chequera.B_Linea_Bancaria.AsSQL + ', ' +
						Chequera.Nom_Plaza_Banco.AsSQL + ', ' +
						Chequera.Id_Pza_Banxico.AsSQL + ', ' +
						Chequera.Sit_Chequera.AsSQL + ', ' +
						Chequera.B_Depurado.AsSQL + ')',
				DataBaseName, SessionName, True);
		end;

		Mensaje:= 'Error al relacionar la nueva chequera con los contratos';
		RunSQL(
			' INSERT Into Chequera_Cte_Cto('+
			'    Id_Contrato, Id_Persona, Id_Banco_chqra, Cuenta_Banco)'+
			'    SELECT'+
			'       Id_Contrato, Id_Persona, '+
					  Chequera.Id_Banco_Chqra_Nue.asString + ' as Id_Banco_Chqra, '+
			 '''' + Chequera.Cuenta_Banco_Nue.AsString + ''' as Cuenta_Banco'+
			'    FROM Chequera_Cte_Cto'+
			'    WHERE Id_Contrato in ('+ Contratos +')'+
			'       and Id_Persona = '+ Chequera.Id_Persona.AsSQL +
			'       and Id_Banco_Chqra = '+ Chequera.Id_Banco_Chqra.AsSQL +
			'       and Cuenta_Banco = '+ Chequera.Cuenta_Banco.AsSQL,
			DataBaseName, SessionName, True);


		Mensaje:= 'Error al eliminar las relacionar de los contratos con la chequera';
		RunSQL(
			' DELETE Chequera_Cte_Cto'+
			'    WHERE Id_Contrato in ('+ Contratos +')'+
			'       and Id_Persona = '+ Chequera.Id_Persona.AsSQL +
			'       and Id_Banco_Chqra = '+ Chequera.Id_Banco_Chqra.AsSQL +
			'       and Cuenta_Banco = '+ Chequera.Cuenta_Banco.AsSQL,
			DataBaseName, SessionName, True);

		If CheckAll Then
		Begin
			Mensaje:= 'Error al eliminar las relacionar de los contratos con la chequera';
			RunSQL(
				' DELETE Chequera_Cte'+
				'    WHERE Id_Persona = '+ Chequera.Id_Persona.AsSQL +
				'       and Id_Banco_Chqra = '+ Chequera.Id_Banco_Chqra.AsSQL +
				'       and Cuenta_Banco = '+ Chequera.Cuenta_Banco.AsSQL,
				DataBaseName, SessionName, True);
		end;


		TransaccionOK:= True;
	Finally
		If TransaccionOK Then
		Begin
			Apli.DataBase.Commit;
			RefrescaCttos;
			Resultado:= True;
		end
		else
		Begin
			Apli.DataBase.Rollback;
			Raise EInterFrame.Create(Mensaje);
		end;
	end;
End;


(***********************************************FORMA ModChqra********************)
(*                                                                              *)
(*  FORMA DE ModChqra                                                            *)
(*                                                                              *)
(***********************************************FORMA ModChqra********************)

procedure TWModchqra.FormShow(Sender: TObject);
begin
	If (Objeto.Chequera <> nil) and (Objeto.Chequera.ACtive) then
	Begin
		Objeto.Chequera.Id_Banco_Chqra.Control:= edIdBancoChqra;
		Objeto.Chequera.Cuenta_Banco.Control:= edCuentaBanco;
		Objeto.Chequera.Intermediario.Persona.Nombre.Control:= lbIntermediario;

		Objeto.Chequera.Id_Banco_Chqra_Nue.Control:= edIdBancoChqraNue;
		Objeto.Chequera.Cuenta_Banco_Nue.Control:= edCuentaBancoNue;
		Objeto.Chequera.NomIntermediario_Nue.Control:= lbIntermediarioNue;
	end;

	Objeto.RefrescaCttos;
	Objeto.CheckAll:= True;
end;


procedure TWModchqra.FormHide(Sender: TObject);
begin
	If (Objeto.Chequera <> nil) and (Objeto.Chequera.ACtive) then
	Begin
		Objeto.Chequera.Id_Banco_Chqra.Control:= nil;
		Objeto.Chequera.Cuenta_Banco.Control:= nil;
		Objeto.Chequera.Intermediario.Persona.Nombre.Control:= nil;

		Objeto.Chequera.Id_Banco_Chqra_Nue.Control:= nil;
		Objeto.Chequera.Cuenta_Banco_Nue.Control:= nil;
		Objeto.Chequera.NomIntermediario_Nue.Control:= nil;
	end;
end;


procedure TWModchqra.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWModchqra.lvContratoColumnClick(Sender: TObject;
  Column: TListColumn);
begin
	Case Column.Index of
	0: Objeto.OrderBy:= 'Id_Contrato';
	1: Objeto.OrderBy:= 'Nombre';
	2: Objeto.OrderBy:= 'Cve_Tip_Contrato';
	end;
end;


procedure TWModchqra.bTodosClick(Sender: TObject);
begin Objeto.CheckAll:= True;
end;

procedure TWModchqra.BitBtn1Click(Sender: TObject);
begin Objeto.Execute;
end;

end.
