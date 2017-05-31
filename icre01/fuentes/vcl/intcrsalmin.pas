// Sistema         : Clase de CR_SALARIO_MINIMO
// Fecha de Inicio : 27/01/2011
// Función forma   : Clase de CR_SALARIO_MINIMO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrSalMin;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

//Clases Adicionales
        IntParamCre;


Type
 TCrSalMin= class;

  TWCrSalarioMinimo=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_SALARIO : TLabel; 
    edID_SALARIO : TEdit;
    lbF_ACTUALIZACION : TLabel; 
    dtpF_ACTUALIZACION : TInterDateTimePicker; 
    edF_ACTUALIZACION : TEdit;
    lbIMP_SALARIO : TLabel; 
    edIMP_SALARIO : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label1: TLabel;
    lbsalmin_ac: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure edF_ACTUALIZACIONExit(Sender: TObject);
    procedure edIMP_SALARIOExit(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrSalMin;
end; 
 TCrSalMin= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ID_SALARIO               : TInterCampo;
        F_ACTUALIZACION          : TInterCampo;
        IMP_SALARIO              : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
                
        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override; 
      published 
      end;



implementation
//Uses RepMon;

var vlsalario_min : string;
    vlSql : String;
    vlTQuery    : TQuery;

{$R *.DFM}


constructor TCrSalMin.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_SALARIO :=CreaCampo('ID_SALARIO',ftFloat,tsNinguno,tsNinguno,True);
                ID_SALARIO.Caption:='Número de Salario';
      F_ACTUALIZACION :=CreaCampo('F_ACTUALIZACION',ftDate,tsNinguno,tsNinguno,True);
                F_ACTUALIZACION.Caption:='Fecha Actualizacion';
      IMP_SALARIO :=CreaCampo('IMP_SALARIO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_SALARIO.Caption:='Imp Salario';
      FKeyFields.Add('ID_SALARIO');
      FKeyFields.Add('F_ACTUALIZACION');

      TableName := 'CR_SALARIO_MINIMO'; 
      UseQuery := True; 
      HelpFile := 'IntCrSalMin.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrSalMin.Destroy;
begin inherited;
end;


function TCrSalMin.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrSalarioMinimo;
begin
   W:=TWCrSalarioMinimo.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
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


Function TCrSalMin.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrSaMi.it','F,D');
      Try if Active then begin T.Param(0,ID_SALARIO.AsString); 
                               T.Param(1,F_ACTUALIZACION.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; 
end;

function TCrSalMin.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_SALARIO_MINIMO********************)
(*                                                                              *)
(*  FORMA DE CR_SALARIO_MINIMO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_SALARIO_MINIMO********************)

procedure TWCrSalarioMinimo.FormShow(Sender: TObject);
begin
   With Objeto Do
   Begin
      ID_SALARIO.Control:=edID_SALARIO;
      F_ACTUALIZACION.Control:=edF_ACTUALIZACION;
      IMP_SALARIO.Control:=edIMP_SALARIO;

      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

      InterForma1.BtnEliminar.Visible:=false;


      vlSql := 'SELECT NVL(IMP_SALARIO_MIN,0) AS SAL_MIN FROM CRE_PARAMETRO ';
      vlTQuery := GetSQLQuery(vlSql, Apli.DataBaseName, Apli.SessionName, True );
      if vlTQuery.IsEmpty = False then
         lbsalmin_ac.Caption := FormatFloat('###,##0.00',vlTQuery.FieldByName('SAL_MIN').AsFloat)
      else
         lbsalmin_ac.Caption := '0.00';
      vlTQuery.Close;
      vlTQuery.Free;
   end;   
end;

procedure TWCrSalarioMinimo.FormDestroy(Sender: TObject);
begin
      Objeto.ID_SALARIO.Control:=nil;
      Objeto.F_ACTUALIZACION.Control:=nil;
      Objeto.IMP_SALARIO.Control:=nil;
   //Objeto
end;

procedure TWCrSalarioMinimo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrSalarioMinimo.InterForma1DespuesNuevo(Sender: TObject);
begin
   edID_SALARIO.Text := vlsalario_min;
   Objeto.ID_SALARIO.GetFromControl;
end;

procedure TWCrSalarioMinimo.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrSalarioMinimo.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrSalarioMinimo.InterForma1Buscar(Sender: TObject);
begin
   Objeto.Busca;
end;

procedure TWCrSalarioMinimo.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
   vlSql := 'SELECT NVL(MAX(ID_SALARIO),0) AS NCOUNT FROM CR_SALARIO_MINIMO ';
   vlTQuery := GetSQLQuery(vlSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
   if vlTQuery.IsEmpty = False then
      vlsalario_min := IntToStr(vlTQuery.FieldByName('NCOUNT').AsInteger + 1)
   else
      vlsalario_min := '1';
   vlTQuery.Close;
   vlTQuery.Free;
end;

procedure TWCrSalarioMinimo.edF_ACTUALIZACIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edF_ACTUALIZACION,True,'',True);
end;

procedure TWCrSalarioMinimo.edIMP_SALARIOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edIMP_SALARIO,True,'',True);
end;

end.
