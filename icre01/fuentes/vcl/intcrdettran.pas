// Sistema         : Clase de CR_DET_TRANSAC
// Fecha de Inicio : 03/06/2003
// Función forma   : Clase de CR_DET_TRANSAC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrDetTran;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntParamCre, IntCrOperaci, IntCrConcept;

Type
 TCrDetTran= class;

  TWCrDetTransac=Class(TForm)
    InterForma1             : TInterForma;
    lbID_TRANSACCION : TLabel;
    edID_TRANSACCION : TEdit;
    lbCVE_OPERACION : TLabel; 
    edCVE_OPERACION : TEdit;
    lbCVE_CONCEPTO : TLabel; 
    edCVE_CONCEPTO : TEdit;
    lbIMP_CONCEPTO : TLabel; 
    edIMP_CONCEPTO : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edDESC_OPERACION: TEdit;
    edDESC_CONCEPTO: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    private 
    { Private declarations }
    public 
    { Public declarations } 
    Objeto : TCrDetTran;
end;
 TCrDetTran= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ID_TRANSACCION           : TInterCampo;
        CVE_OPERACION            : TInterCampo;
        CVE_CONCEPTO             : TInterCampo;
        IMP_CONCEPTO             : TInterCampo;

        ParamCre                 : TParamCre;
        Operacion                : TCrOperaci;
        Concepto                 : TCrConcept;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override; 
      published 
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrDetTran.Create( AOwner : TComponent );
begin Inherited;
      ID_TRANSACCION :=CreaCampo('ID_TRANSACCION',ftFloat,tsNinguno,tsNinguno,True);
                ID_TRANSACCION.Caption:='Transaccion';
      CVE_OPERACION :=CreaCampo('CVE_OPERACION',ftString,tsNinguno,tsNinguno,True);
                CVE_OPERACION.Caption:='Clave Operación';
      CVE_CONCEPTO :=CreaCampo('CVE_CONCEPTO',ftString,tsNinguno,tsNinguno,True);
                CVE_CONCEPTO.Caption:='Clave Concepto';
      IMP_CONCEPTO :=CreaCampo('IMP_CONCEPTO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_CONCEPTO.Caption:='Imp. Concepto';
      FKeyFields.Add('ID_TRANSACCION');
      FKeyFields.Add('CVE_OPERACION');
      FKeyFields.Add('CVE_CONCEPTO');

      TableName := 'CR_DET_TRANSAC'; 
      UseQuery := True; 
      HelpFile := 'IntCrDetTran.Hlp';
      ShowMenuReporte:=True;

      Operacion := TCrOperaci.Create(self);
      Operacion.MasterSource := self;
      Operacion.FieldByName('CVE_OPERACION').MasterField := 'CVE_OPERACION';

      Concepto := TCrConcept.Create(self);
      Concepto.MasterSource := self;
      Concepto.FieldByName('CVE_CONCEPTO').MasterField := 'CVE_CONCEPTO';


end;

Destructor TCrDetTran.Destroy;
begin
      if Operacion <> nil then
         Operacion.Free;
      //end if

      if Concepto <> nil then
         Concepto.Free;
      //end if
      inherited;
end;


function TCrDetTran.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrDetTransac;
begin
   W:=TWCrDetTransac.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta;//FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrDetTran.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrDeTr.it','F,S,S');
      Try if Active then begin T.Param(0,ID_TRANSACCION.AsString);
                               T.Param(1,CVE_OPERACION.AsString); 
                               T.Param(2,CVE_CONCEPTO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end; 
end;

function TCrDetTran.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_DET_TRANSAC********************)
(*                                                                              *)
(*  FORMA DE CR_DET_TRANSAC                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_DET_TRANSAC********************)

procedure TWCrDetTransac.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_TRANSACCION.Control:=edID_TRANSACCION;
      Objeto.CVE_OPERACION.Control:=edCVE_OPERACION;
      Objeto.CVE_CONCEPTO.Control:=edCVE_CONCEPTO;
      Objeto.IMP_CONCEPTO.Control:=edIMP_CONCEPTO;

      Objeto.Operacion.DESC_C_OPERACION.Control := edDESC_OPERACION;
      Objeto.Operacion.GetParams(Objeto);

      Objeto.Concepto.DESC_C_CONCEPTO.Control := edDESC_CONCEPTO;
      Objeto.Concepto.GetParams(Objeto);
end;

procedure TWCrDetTransac.FormDestroy(Sender: TObject);
begin
      Objeto.ID_TRANSACCION.Control:=nil;
      Objeto.CVE_OPERACION.Control:=nil;
      Objeto.CVE_CONCEPTO.Control:=nil;
      Objeto.IMP_CONCEPTO.Control:=nil;

      Objeto.Operacion.DESC_C_OPERACION.Control := nil;
      Objeto.Concepto.DESC_C_CONCEPTO.Control := nil;
   //Objeto
end;

procedure TWCrDetTransac.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrDetTransac.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrDetTransac.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

Procedure TWCrDetTransac.MuestraHints;
Begin
      edDESC_OPERACION.Hint := Objeto.Operacion.DESC_C_OPERACION.AsString;
      edDESC_OPERACION.ShowHint := True;
      edDESC_CONCEPTO.Hint := Objeto.Concepto.DESC_C_CONCEPTO.AsString;
      edDESC_CONCEPTO.ShowHint := True;
End;


procedure TWCrDetTransac.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrDetTransac.InterForma1DespuesAceptar(Sender: TObject);
begin
    MuestraHints;
end;

end.
