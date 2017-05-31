// Sistema         : Clase de LDIN_INST_MON
// Fecha de Inicio : 27/05/2002
// Función forma   : Clase de LDIN_INST_MON
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Marcos Zarate Castro
// Comentarios     :
Unit IntLdiInsMn;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, UnConLavDin;

Type
 TLdiInsMn= class; 

  TWLdinInstMn=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_INST_MON : TLabel; 
    edCVE_INST_MON : TEdit;
    lbDESC_INST_MON : TLabel; 
    edDESC_INST_MON : TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject;
      IsNewData: Boolean; var Realizado: Boolean);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TLdiInsMn;
end; 
 TLdiInsMn= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public 
        { Public declarations } 
        CVE_INST_MON             : TInterCampo;
        DESC_INST_MON            : TInterCampo;
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


constructor TLdiInsMn.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_INST_MON :=CreaCampo('CVE_INST_MON',ftString,tsNinguno,tsNinguno,True);
        CVE_INST_MON .Size:=2;
                CVE_INST_MON.Caption:='Clave de Inst Moneda';
      DESC_INST_MON :=CreaCampo('DESC_INST_MON',ftString,tsNinguno,tsNinguno,True);
                DESC_INST_MON.Caption:='Descripción Inst Moneda';
      FKeyFields.Add('CVE_INST_MON');

      TableName := 'LDIN_INST_MON'; 
      UseQuery := True; 
      HelpFile := 'IntLdiInsMn.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TLdiInsMn.Destroy;
begin inherited;
end;


function TLdiInsMn.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWLdinInstMn;
begin
   W:=TWLdinInstMn.Create(Self);
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


Function TLdiInsMn.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ILdInMn.it','S');
      Try if Active then begin T.Param(0,CVE_INST_MON.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TLdiInsMn.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA LDIN_INST_MON********************)
(*                                                                              *)
(*  FORMA DE LDIN_INST_MON                                                            *)
(*                                                                              *)
(***********************************************FORMA LDIN_INST_MON********************)

procedure TWLdinInstMn.FormShow(Sender: TObject);
begin
      Objeto.CVE_INST_MON.Control:=edCVE_INST_MON;
      Objeto.DESC_INST_MON.Control:=edDESC_INST_MON;
end;

procedure TWLdinInstMn.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_INST_MON.Control:=nil;
      Objeto.DESC_INST_MON.Control:=nil;
   //Objeto
end;

procedure TWLdinInstMn.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWLdinInstMn.InterForma1DespuesNuevo(Sender: TObject);
begin edCVE_INST_MON.SetFocus;
end;

procedure TWLdinInstMn.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_INST_MON.SetFocus;
end;

//procedure TWLdinInstMn.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWLdinInstMn.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
Var   Observacion: String;
begin
   Observacion := 'Clave: ' + 'CVE INST MON: ' + Objeto.CVE_INST_MON.AsString;
   if (IsNewData) then
      GrabaBitacora(Objeto.Apli.Usuario,InterForma1.Funcion.Funcion,'A',Observacion,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName)
   else
      GrabaBitacora(Objeto.Apli.Usuario,InterForma1.Funcion.Funcion,'M',Observacion,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName);
end;

procedure TWLdinInstMn.InterForma1AntesEliminar(Sender: TObject; var Realizado: Boolean);
Var   Observacion: String;
begin
   Observacion := 'Clave: ' + 'CVE INST MON: ' + Objeto.CVE_INST_MON.AsString;
   GrabaBitacora(Objeto.Apli.Usuario,InterForma1.Funcion.Funcion,'B',Observacion,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName);
end;

end.
