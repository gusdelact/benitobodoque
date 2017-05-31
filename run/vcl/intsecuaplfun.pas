// Sistema         : Clase de SECU_APL_FUN
// Fecha de Inicio : 27/08/1998
// Función forma   : Clase de SECU_APL_FUN
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Jose Alberto Ramirez Pacheco
// Comentarios     :
Unit IntSecuAplFun;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, IntSecuFunci, IntSecuAplic,
Wwquery, Wwdatsrc;

Type
	TSecAplFun= class;

	TWSecAplFun=Class(TForm)
      InterForma1             : TInterForma;
      lbCVE_APLICACION : TLabel;
      edCVE_APLICACION : TEdit;
      lbCVE_FUNCION : TLabel;
      edCVE_FUNCION : TEdit;
      chB_BLOQUEADO : TCheckBox;
    bAplicacion: TSpeedButton;
    bFuncion: TSpeedButton;
      edNomAplicacion: TEdit;
      edNomFuncion: TEdit;
      wwDataSource1: TwwDataSource;
      procedure FormShow(Sender : TObject);
      procedure FormClose(Sender : TObject; var Action : TCloseAction);
      procedure FormDestroy(Sender : TObject);
      procedure InterForma1DespuesNuevo(Sender: TObject);
      procedure InterForma1DespuesModificar(Sender: TObject);
    procedure wwDataSource1DataChange(Sender: TObject; Field: TField);
    procedure bAplicacionClick(Sender: TObject);
    procedure bFuncionClick(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
   private
	   { Private declarations }
   public
   	{ Public declarations }
   	Objeto : TSecAplFun;
	end;


	TSecAplFun= class(TInterFrame)
   private
   	FAplicacion: TInterFrame;
   protected
   	Procedure SetAplicacion(Frame: TInterFrame);
   public
     { Public declarations }
     CVE_APLICACION           : TInterCampo;
     CVE_FUNCION              : TInterCampo;
     B_BLOQUEADO              : TInterCampo;

     Funcion: TSecuFunci;
     SecuAplicacion: TSecuAplic;
     Query: TwwQuery;
     function    InternalBusca : Boolean; override;
     constructor Create( AOwner : TComponent ); override;
     destructor  Destroy; override;
     function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
     Procedure   DataBaseChange; override;
     Procedure   RefrescaQuery;

     Property Aplicacion: TInterFrame Read FAplicacion Write SetAplicacion;
   published
   end;

implementation

{$R *.DFM}


constructor TSecAplFun.Create( AOwner : TComponent );
begin
	Inherited;
   CVE_APLICACION :=CreaCampo('CVE_APLICACION',ftString,tsNinguno,tsNinguno,True);
   	CVE_APLICACION .Size:=6;
      CVE_APLICACION.Caption:='Aplicación';
   CVE_FUNCION :=CreaCampo('CVE_FUNCION',ftString,tsNinguno,tsNinguno,True);
   	CVE_FUNCION .Size:=16;
      CVE_FUNCION.Caption:='Función';
   B_BLOQUEADO :=CreaCampo('B_BLOQUEADO',ftString,tsNinguno,tsNinguno,True);
   	B_BLOQUEADO .Size:=1;
      B_BLOQUEADO.Caption:='Bloqueado';
   FKeyFields.Add('CVE_APLICACION');
   FKeyFields.Add('CVE_FUNCION');

   Funcion:= TSecuFunci.Create(Self);
   Funcion.MasterSource := self;
   Funcion.CVE_FUNCION.MasterField := 'CVE_FUNCION';

   SecuAplicacion:= TSecuAplic.Create(Self);
   SecuAplicacion.MasterSource := self;
   SecuAplicacion.CVE_APLICACION.MasterField := 'CVE_APLICACION';

   Query:= TwwQuery.Create(self);
   Aplicacion := nil;

   TableName := 'SECU_APL_FUN';
   UseQuery := True;
   HelpFile := 'IntSecuAplFun.Hlp';
   ShowMenuReporte:=False;
end;

Destructor TSecAplFun.Destroy;
begin
   If Funcion <> nil then Funcion.Free;
   If SecuAplicacion <> nil then SecuAplicacion.Free;
	if Query <> nil then Query.Free;
	inherited;
end;

Procedure TSecAplFun.DataBaseChange;
Begin
	inherited;
	Query.DataBaseName:= DataBaseName;
  Query.SessionName := SessionName;
end;


function TSecAplFun.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWSecAplFun;
begin
   W:=TWSecAplFun.Create(Self);
   try
      W.Objeto:= Self;
      W.wwDataSource1.DataSet := Query;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := True;
      W.InterForma1.GridDataSet :=  W.InterForma1.DataSet;
      W.InterForma1.ShowNavigator := True;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TSecAplFun.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ISeApFu.it','S,S');
      Try if Active then begin T.Param(0,CVE_APLICACION.AsString);
                               T.Param(1,CVE_FUNCION.AsString);
                               end;
          if T.Execute then
          Begin
          	InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
            Query.Locate('CVE_APLICACION; CVE_FUNCION', VarArrayof([T.DameCampo(0),T.DameCampo(1)]),[loCaseInsensitive]);
          end;
      finally  T.Free;
      end;
end;


Procedure TSecAplFun.SetAplicacion(Frame: TInterFrame);
Begin
	FAplicacion := Frame;

   If Frame <> nil then
   Begin
   	RefrescaQuery;
      SecuAplicacion.BuscaWhereString := 'SECU_APLICACION.CVE_APLICACION = '''+ Frame.FieldByName('CVE_APLICACION').asString + '''';
	   BuscaWhereString := 'SECU_APL_FUN.CVE_APLICACION = '''+ Frame.FieldByName('CVE_APLICACION').asString + '''';
   end
   else
   Begin
   	SecuAplicacion.BuscaWhereString := '';
	   BuscaWhereString := '';
   end;
end;

Procedure TSecAplFun.RefrescaQuery;
var Sql: String;
Begin
	Query.DisableControls;
   Sql :=' SELECT Secu_Apl_Fun.Cve_Aplicacion, Secu_Apl_Fun.Cve_Funcion, Secu_Aplicacion.Nom_Aplicacion, Secu_Funcion.Nom_Funcion'+
	      ' FROM Secu_Apl_Fun, Secu_Aplicacion, Secu_Funcion'+
	      ' WHERE Secu_Apl_Fun.Cve_Aplicacion = Secu_Aplicacion.Cve_Aplicacion'+
   	   '   and Secu_Apl_Fun.Cve_Funcion = Secu_Funcion.Cve_Funcion';

   If Aplicacion <> nil then
      Sql := Sql + ' and Secu_Apl_Fun.Cve_Aplicacion = '''+ Aplicacion.FieldByName('CVE_APLICACION').asString + '''';

   Query.Close;
   Query.SQL.Text := Sql;
   Query.Open;

   If Not Query.IsEmpty then
   Begin
   	Query.FieldByName('CVE_APLICACION').Visible:= False;
      Query.FieldByName('CVE_FUNCION').Visible:= False;
   	Query.FieldByName('NOM_APLICACION').DisplayLabel := 'Aplicación';
      Query.FieldByName('NOM_FUNCION').DisplayLabel := 'Función';
   end;
   Query.EnableControls;
end;



(***********************************************FORMA SECU_APL_FUN********************)
(*                                                                              *)
(*  FORMA DE SECU_APL_FUN                                                            *)
(*                                                                              *)
(***********************************************FORMA SECU_APL_FUN********************)

procedure TWSecAplFun.FormShow(Sender: TObject);
begin
   Objeto.CVE_APLICACION.Control:=edCVE_APLICACION;
   Objeto.CVE_FUNCION.Control:=edCVE_FUNCION;
   Objeto.B_BLOQUEADO.Control:=chB_BLOQUEADO;

   Objeto.Funcion.NOM_FUNCION.Control := edNomFuncion;
   Objeto.SecuAplicacion.NOM_APLICACION.Control := edNomAplicacion;

   Objeto.RefrescaQuery;

   If Objeto.Aplicacion <> nil Then bAplicacion.tag := -1;
end;

procedure TWSecAplFun.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_APLICACION.Control:=nil;
   Objeto.CVE_FUNCION.Control:=nil;
   Objeto.B_BLOQUEADO.Control:=nil;

	Objeto.Funcion.NOM_FUNCION.Control := nil;
   Objeto.SecuAplicacion.NOM_APLICACION.Control := nil;
end;

procedure TWSecAplFun.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWSecAplFun.InterForma1DespuesNuevo(Sender: TObject);
begin
	If Objeto.Aplicacion <> nil then
   Begin
   	Objeto.SecuAplicacion.FindKey([Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString]);
      Objeto.Funcion.Busca;
   end;
end;

procedure TWSecAplFun.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWSecAplFun.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;

procedure TWSecAplFun.wwDataSource1DataChange(Sender: TObject;
  Field: TField);
begin
	 If Field = nil then
   Begin
      Objeto.FindKey([Objeto.Query.FieldByName('CVE_APLICACION').asString, Objeto.Query.FieldByName('CVE_FUNCION').asString]);
   end;
end;

procedure TWSecAplFun.bAplicacionClick(Sender: TObject);
begin Objeto.SecuAplicacion.Busca;
end;

procedure TWSecAplFun.bFuncionClick(Sender: TObject);
begin Objeto.Funcion.Busca;
end;

procedure TWSecAplFun.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
begin
{}

end;

end.
