// Sistema         : Clase de CR_COM_CUOTA_ACC
// Fecha de Inicio : 19/07/2006
// Función forma   : Clase de CR_COM_CUOTA_ACC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Sergio Eduardo Lopez Lopez
// Comentarios     :
Unit IntCrCoCuAc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TCrCoCuAc= class; 

  TWCrComCuotaAc=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_ACCESORIO : TLabel; 
    edID_ACCESORIO : TEdit;
    lbFOL_ACCESORIO : TLabel; 
    edFOL_ACCESORIO : TEdit;
    lbCVE_ACCESORIO : TLabel; 
    edCVE_ACCESORIO : TEdit;
    lbCVE_COMISION : TLabel; 
    edCVE_COMISION : TEdit;
    lbNUM_PERIODO : TLabel; 
    edNUM_PERIODO : TEdit;
    lbPLAZO : TLabel; 
    edPLAZO : TEdit;
    lbF_VENCIMIENTO : TLabel; 
    dtpF_VENCIMIENTO : TInterDateTimePicker; 
    edF_VENCIMIENTO : TEdit;
    lbF_PROG_PAGO : TLabel; 
    dtpF_PROG_PAGO : TInterDateTimePicker; 
    edF_PROG_PAGO : TEdit;
    lbIMP_CUOTA : TLabel; 
    edIMP_CUOTA : TEdit;
    lbIMP_IVA : TLabel; 
    edIMP_IVA : TEdit;
    lbTASA_APLICADA : TLabel; 
    edTASA_APLICADA : TEdit;
    lbSIT_COM_CUOTA : TLabel; 
    edSIT_COM_CUOTA : TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);  
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrCoCuAc;
end; 
 TCrCoCuAc= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ID_ACCESORIO             : TInterCampo;
        FOL_ACCESORIO            : TInterCampo;
        CVE_ACCESORIO            : TInterCampo;
        CVE_COMISION             : TInterCampo;
        NUM_PERIODO              : TInterCampo;
        PLAZO                    : TInterCampo;
        F_VENCIMIENTO            : TInterCampo;
        F_PROG_PAGO              : TInterCampo;
        IMP_CUOTA                : TInterCampo;
        IMP_IVA                  : TInterCampo;
        TASA_APLICADA            : TInterCampo;
        SIT_COM_CUOTA            : TInterCampo;
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


constructor TCrCoCuAc.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_ACCESORIO :=CreaCampo('ID_ACCESORIO',ftFloat,tsNinguno,tsNinguno,True);
                ID_ACCESORIO.Caption:='Número de Accesorio';
      FOL_ACCESORIO :=CreaCampo('FOL_ACCESORIO',ftFloat,tsNinguno,tsNinguno,True);
                FOL_ACCESORIO.Caption:='Fol Accesorio';
      CVE_ACCESORIO :=CreaCampo('CVE_ACCESORIO',ftString,tsNinguno,tsNinguno,True);
                CVE_ACCESORIO.Caption:='Clave de Accesorio';
      CVE_COMISION :=CreaCampo('CVE_COMISION',ftString,tsNinguno,tsNinguno,True);
                CVE_COMISION.Caption:='Clave de Comision';
      NUM_PERIODO :=CreaCampo('NUM_PERIODO',ftFloat,tsNinguno,tsNinguno,True);
                NUM_PERIODO.Caption:='Número Periodo';
      PLAZO :=CreaCampo('PLAZO',ftFloat,tsNinguno,tsNinguno,True);
                PLAZO.Caption:='Plazo';
      F_VENCIMIENTO :=CreaCampo('F_VENCIMIENTO',ftDate,tsNinguno,tsNinguno,True);
                F_VENCIMIENTO.Caption:='Fecha Vencimiento';
      F_PROG_PAGO :=CreaCampo('F_PROG_PAGO',ftDate,tsNinguno,tsNinguno,True);
                F_PROG_PAGO.Caption:='Fecha Prog Pago';
      IMP_CUOTA :=CreaCampo('IMP_CUOTA',ftFloat,tsNinguno,tsNinguno,True);
                IMP_CUOTA.Caption:='Imp Cuota';
      IMP_IVA :=CreaCampo('IMP_IVA',ftFloat,tsNinguno,tsNinguno,True);
                IMP_IVA.Caption:='Imp Iva';
      TASA_APLICADA :=CreaCampo('TASA_APLICADA',ftFloat,tsNinguno,tsNinguno,True);
                TASA_APLICADA.Caption:='Tasa Aplicada';
      SIT_COM_CUOTA :=CreaCampo('SIT_COM_CUOTA',ftString,tsNinguno,tsNinguno,True);
                SIT_COM_CUOTA.Caption:='Situación Com Cuota';
      FKeyFields.Add('ID_ACCESORIO');
      FKeyFields.Add('FOL_ACCESORIO');
      FKeyFields.Add('CVE_ACCESORIO');
      FKeyFields.Add('CVE_COMISION');
      FKeyFields.Add('NUM_PERIODO');

      TableName := 'CR_COM_CUOTA_ACC'; 
      UseQuery := True; 
      HelpFile := 'IntCrCoCuAc.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCoCuAc.Destroy;
begin inherited;
end;


function TCrCoCuAc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrComCuotaAc;
begin
   W:=TWCrComCuotaAc.Create(Self);
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


Function TCrCoCuAc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrCCAc.it','F,F,S,S,F');
      Try if Active then begin T.Param(0,ID_ACCESORIO.AsString); 
                               T.Param(1,FOL_ACCESORIO.AsString); 
                               T.Param(2,CVE_ACCESORIO.AsString); 
                               T.Param(3,CVE_COMISION.AsString); 
                               T.Param(4,NUM_PERIODO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3),T.DameCampo(4)]);
      finally  T.Free;
      end; 
end;

function TCrCoCuAc.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_COM_CUOTA_ACC********************)
(*                                                                              *)
(*  FORMA DE CR_COM_CUOTA_ACC                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_COM_CUOTA_ACC********************)

procedure TWCrComCuotaAc.FormShow(Sender: TObject);
begin
      Objeto.ID_ACCESORIO.Control:=edID_ACCESORIO;
      Objeto.FOL_ACCESORIO.Control:=edFOL_ACCESORIO;
      Objeto.CVE_ACCESORIO.Control:=edCVE_ACCESORIO;
      Objeto.CVE_COMISION.Control:=edCVE_COMISION;
      Objeto.NUM_PERIODO.Control:=edNUM_PERIODO;
      Objeto.PLAZO.Control:=edPLAZO;
      Objeto.F_VENCIMIENTO.Control:=edF_VENCIMIENTO;
      Objeto.F_PROG_PAGO.Control:=edF_PROG_PAGO;
      Objeto.IMP_CUOTA.Control:=edIMP_CUOTA;
      Objeto.IMP_IVA.Control:=edIMP_IVA;
      Objeto.TASA_APLICADA.Control:=edTASA_APLICADA;
      Objeto.SIT_COM_CUOTA.Control:=edSIT_COM_CUOTA;
end;

procedure TWCrComCuotaAc.FormDestroy(Sender: TObject);
begin
      Objeto.ID_ACCESORIO.Control:=nil;
      Objeto.FOL_ACCESORIO.Control:=nil;
      Objeto.CVE_ACCESORIO.Control:=nil;
      Objeto.CVE_COMISION.Control:=nil;
      Objeto.NUM_PERIODO.Control:=nil;
      Objeto.PLAZO.Control:=nil;
      Objeto.F_VENCIMIENTO.Control:=nil;
      Objeto.F_PROG_PAGO.Control:=nil;
      Objeto.IMP_CUOTA.Control:=nil;
      Objeto.IMP_IVA.Control:=nil;
      Objeto.TASA_APLICADA.Control:=nil;
      Objeto.SIT_COM_CUOTA.Control:=nil;
   //Objeto
end;

procedure TWCrComCuotaAc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrComCuotaAc.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrComCuotaAc.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrComCuotaAc.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


end.
