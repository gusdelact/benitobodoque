// Sistema         : Clase de CrSATAdc
// Fecha de Inicio : 28/01/2014
// Función forma   : Clase de CrSATAdc
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :      
Unit IntCrSATAdc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntParamCre,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TCrSATAdc= class; 

  TWCrsatadc=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_CONTRATO : TLabel; 
    edID_CONTRATO : TEdit;
    lbID_DOM_FISCAL : TLabel; 
    edID_DOM_FISCAL : TEdit;
    lbID_DOM_GARANTIA : TLabel; 
    edID_DOM_GARANTIA : TEdit;
    lbSIGLAS_RFC : TLabel; 
    edSIGLAS_RFC : TEdit;
    lbF_RFC : TLabel; 
    edF_RFC : TEdit;
    lbHOMOCLAVE_RFC : TLabel; 
    edHOMOCLAVE_RFC : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);  
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrSATAdc;
end; 
 TCrSATAdc= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ParamCre                 : TParamCre;
                
        ID_CONTRATO              : TInterCampo;
        ID_DOM_FISCAL            : TInterCampo;
        ID_DOM_GARANTIA          : TInterCampo;
        SIGLAS_RFC               : TInterCampo;
        F_RFC                    : TInterCampo;
        HOMOCLAVE_RFC            : TInterCampo;
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


constructor TCrSATAdc.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO.Caption:='Número de Contrato';
      ID_DOM_FISCAL :=CreaCampo('ID_DOM_FISCAL',ftFloat,tsNinguno,tsNinguno,True);
                ID_DOM_FISCAL.Caption:='Número de Dom Fiscal';
      ID_DOM_GARANTIA :=CreaCampo('ID_DOM_GARANTIA',ftFloat,tsNinguno,tsNinguno,True);
                ID_DOM_GARANTIA.Caption:='Número de Dom Garantia';
      SIGLAS_RFC :=CreaCampo('SIGLAS_RFC',ftString,tsNinguno,tsNinguno,True);
                SIGLAS_RFC.Caption:='Siglas Rfc';
      F_RFC :=CreaCampo('F_RFC',ftString,tsNinguno,tsNinguno,True);
                F_RFC.Caption:='Fecha Rfc';
      HOMOCLAVE_RFC :=CreaCampo('HOMOCLAVE_RFC',ftString,tsNinguno,tsNinguno,True);
                HOMOCLAVE_RFC.Caption:='Homoclave Rfc';
      FKeyFields.Add('ID_CONTRATO');

      TableName := 'SAT_CRE_INF_ADIC'; 
      UseQuery := True; 
      HelpFile := 'IntCrSATAdc.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrSATAdc.Destroy;
begin inherited;
end;


function TCrSATAdc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrsatadc;
begin
   W:=TWCrsatadc.Create(Self);
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


Function TCrSATAdc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrsatad.it','F');
      Try if Active then begin T.Param(0,ID_CONTRATO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrSATAdc.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrSATAdc********************)
(*                                                                              *)
(*  FORMA DE CrSATAdc                                                            *)
(*                                                                              *)
(***********************************************FORMA CrSATAdc********************)

procedure TWCrsatadc.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
   
      Objeto.ID_CONTRATO.Control:=edID_CONTRATO;
      Objeto.ID_DOM_FISCAL.Control:=edID_DOM_FISCAL;
      Objeto.ID_DOM_GARANTIA.Control:=edID_DOM_GARANTIA;
      Objeto.SIGLAS_RFC.Control:=edSIGLAS_RFC;
      Objeto.F_RFC.Control:=edF_RFC;
      Objeto.HOMOCLAVE_RFC.Control:=edHOMOCLAVE_RFC;

      InterForma1.BtnNuevo.Visible:=false;
      InterForma1.BtnEliminar.Visible:=false;
end;

procedure TWCrsatadc.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CONTRATO.Control:=nil;
      Objeto.ID_DOM_FISCAL.Control:=nil;
      Objeto.ID_DOM_GARANTIA.Control:=nil;
      Objeto.SIGLAS_RFC.Control:=nil;
      Objeto.F_RFC.Control:=nil;
      Objeto.HOMOCLAVE_RFC.Control:=nil;
   //Objeto
end;

procedure TWCrsatadc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrsatadc.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrsatadc.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrsatadc.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


end.
