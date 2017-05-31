// Sistema         : Clase de CR_CARGA_NAFIN
// Fecha de Inicio : 15/08/2003
// Función forma   : Clase de CR_CARGA_NAFIN
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrCarNaf;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TCrCarNaf= class; 

  TWCrCargaNafin=Class(TForm)
    InterForma1             : TInterForma; 
    lbF_CARGA : TLabel; 
    dtpF_CARGA : TInterDateTimePicker; 
    edF_CARGA : TEdit;
    lbID_ACUSE : TLabel; 
    edID_ACUSE : TEdit;
    lbID_CARGA_NAFIN : TLabel; 
    edID_CARGA_NAFIN : TEdit;
    lbCVE_USU_CARGA : TLabel; 
    edCVE_USU_CARGA : TEdit;
    lbNOM_ARCHIVO : TLabel; 
    edNOM_ARCHIVO : TEdit;
    lbF_PROCESA : TLabel; 
    dtpF_PROCESA : TInterDateTimePicker; 
    edF_PROCESA : TEdit;
    lbCVE_USU_PROCESA : TLabel; 
    edCVE_USU_PROCESA : TEdit;
    lbSIT_CARGA : TLabel; 
    edSIT_CARGA : TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);  
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrCarNaf;
end; 
 TCrCarNaf= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        F_CARGA                  : TInterCampo;
        ID_ACUSE                 : TInterCampo;
        ID_CARGA_NAFIN           : TInterCampo;
        CVE_USU_CARGA            : TInterCampo;
        NOM_ARCHIVO              : TInterCampo;
        F_PROCESA                : TInterCampo;
        CVE_USU_PROCESA          : TInterCampo;
        SIT_CARGA                : TInterCampo;
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


constructor TCrCarNaf.Create( AOwner : TComponent ); 
begin Inherited; 
      F_CARGA :=CreaCampo('F_CARGA',ftDate,tsNinguno,tsNinguno,True);
                F_CARGA.Caption:='Fecha Carga';
      ID_ACUSE :=CreaCampo('ID_ACUSE',ftString,tsNinguno,tsNinguno,True);
                ID_ACUSE.Caption:='Número de Acuse';
      ID_CARGA_NAFIN :=CreaCampo('ID_CARGA_NAFIN',ftFloat,tsNinguno,tsNinguno,True);
                ID_CARGA_NAFIN.Caption:='Número de Carga Nafin';
      CVE_USU_CARGA :=CreaCampo('CVE_USU_CARGA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_CARGA.Caption:='Clave de Usu Carga';
      NOM_ARCHIVO :=CreaCampo('NOM_ARCHIVO',ftString,tsNinguno,tsNinguno,True);
                NOM_ARCHIVO.Caption:='Nombre Archivo';
      F_PROCESA :=CreaCampo('F_PROCESA',ftDate,tsNinguno,tsNinguno,True);
                F_PROCESA.Caption:='Fecha Procesa';
      CVE_USU_PROCESA :=CreaCampo('CVE_USU_PROCESA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_PROCESA.Caption:='Clave de Usu Procesa';
      SIT_CARGA :=CreaCampo('SIT_CARGA',ftString,tsNinguno,tsNinguno,True);
                SIT_CARGA.Caption:='Situación Carga';
      FKeyFields.Add('F_CARGA');
      FKeyFields.Add('ID_ACUSE');

      TableName := 'CR_CARGA_NAFIN'; 
      UseQuery := True; 
      HelpFile := 'IntCrCarNaf.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCarNaf.Destroy;
begin inherited;
end;


function TCrCarNaf.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCargaNafin;
begin
   W:=TWCrCargaNafin.Create(Self);
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


Function TCrCarNaf.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrCaNa.it','D,S');
      Try if Active then begin T.Param(0,F_CARGA.AsString); 
                               T.Param(1,ID_ACUSE.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; 
end;

function TCrCarNaf.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_CARGA_NAFIN********************)
(*                                                                              *)
(*  FORMA DE CR_CARGA_NAFIN                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CARGA_NAFIN********************)

procedure TWCrCargaNafin.FormShow(Sender: TObject);
begin
      Objeto.F_CARGA.Control:=edF_CARGA;
      Objeto.ID_ACUSE.Control:=edID_ACUSE;
      Objeto.ID_CARGA_NAFIN.Control:=edID_CARGA_NAFIN;
      Objeto.CVE_USU_CARGA.Control:=edCVE_USU_CARGA;
      Objeto.NOM_ARCHIVO.Control:=edNOM_ARCHIVO;
      Objeto.F_PROCESA.Control:=edF_PROCESA;
      Objeto.CVE_USU_PROCESA.Control:=edCVE_USU_PROCESA;
      Objeto.SIT_CARGA.Control:=edSIT_CARGA;
end;

procedure TWCrCargaNafin.FormDestroy(Sender: TObject);
begin
      Objeto.F_CARGA.Control:=nil;
      Objeto.ID_ACUSE.Control:=nil;
      Objeto.ID_CARGA_NAFIN.Control:=nil;
      Objeto.CVE_USU_CARGA.Control:=nil;
      Objeto.NOM_ARCHIVO.Control:=nil;
      Objeto.F_PROCESA.Control:=nil;
      Objeto.CVE_USU_PROCESA.Control:=nil;
      Objeto.SIT_CARGA.Control:=nil;
   //Objeto
end;

procedure TWCrCargaNafin.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCargaNafin.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrCargaNafin.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrCargaNafin.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


end.
