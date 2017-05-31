// Sistema         : Clase de CR_CONF_ARC_NAF
// Fecha de Inicio : 27/01/2004
// Función forma   : Clase de CR_CONF_ARC_NAF
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrConfigAr;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TCrConfigAr= class; 

  TWCrConfigAr=Class(TForm)
    InterForma1             : TInterForma; 
    lbNOMBRE_CAM_ARC : TLabel; 
    edNOMBRE_CAM_ARC : TEdit;
    lbNOMBRE_CAM_BD : TLabel; 
    edNOMBRE_CAM_BD : TEdit;
    lbVALOR_OMISON : TLabel; 
    edVALOR_OMISON : TEdit;
    lbSIT_CONF_ARCNAF : TLabel; 
    edSIT_CONF_ARCNAF : TEdit;
    lbB_OBLIGATORIO : TLabel; 
    chB_OBLIGATORIO : TCheckBox;
    lbF_ALTA : TLabel; 
    dtpF_ALTA : TInterDateTimePicker; 
    edF_ALTA : TEdit;
    lbCVE_USU_ALTA : TLabel; 
    edCVE_USU_ALTA : TEdit;
    lbF_MODIFICA : TLabel; 
    dtpF_MODIFICA : TInterDateTimePicker; 
    edF_MODIFICA : TEdit;
    lbCVE_USU_MODIFICA : TLabel; 
    edCVE_USU_MODIFICA : TEdit;
    edCVE_FORMATO_NAF: TEdit;
    lbCVE_FORMATO_NAF: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);  
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrConfigAr;
end; 
 TCrConfigAr= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        CVE_FORMATO_NAF          : TInterCampo;
        NOMBRE_CAM_ARC           : TInterCampo;
        NOMBRE_CAM_BD            : TInterCampo;
        VALOR_OMISON             : TInterCampo;
        SIT_CONF_ARCNAF          : TInterCampo;
        B_OBLIGATORIO            : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
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


constructor TCrConfigAr.Create( AOwner : TComponent ); 
begin Inherited;
      CVE_FORMATO_NAF := CreaCampo('CVE_FORMATO_NAF',ftString,tsNinguno,tsNinguno,True);
      CVE_FORMATO_NAF.Caption := 'Clave Formato NAFIN';
      NOMBRE_CAM_ARC :=CreaCampo('NOMBRE_CAM_ARC',ftString,tsNinguno,tsNinguno,True);
                NOMBRE_CAM_ARC.Caption:='Nombre Cam Arc';
      NOMBRE_CAM_BD :=CreaCampo('NOMBRE_CAM_BD',ftString,tsNinguno,tsNinguno,True);
                NOMBRE_CAM_BD.Caption:='Nombre Cam Bd';
      VALOR_OMISON :=CreaCampo('VALOR_OMISON',ftString,tsNinguno,tsNinguno,True);
                VALOR_OMISON.Caption:='Valor Omison';
      SIT_CONF_ARCNAF :=CreaCampo('SIT_CONF_ARCNAF',ftString,tsNinguno,tsNinguno,True);
                SIT_CONF_ARCNAF.Caption:='Situación Conf Arcnaf';
      B_OBLIGATORIO :=CreaCampo('B_OBLIGATORIO',ftString,tsNinguno,tsNinguno,True);
                B_OBLIGATORIO.Caption:='Obligatorio';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      FKeyFields.Add('CVE_FORMATO_NAF');
      FKeyFields.Add('NOMBRE_CAM_ARC');

      TableName := 'CR_CONF_ARC_NAF'; 
      UseQuery := True; 
      HelpFile := 'IntCrConfigAr.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrConfigAr.Destroy;
begin
  inherited;
end;


function TCrConfigAr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrConfigAr;
begin
   W:=TWCrConfigAr.Create(Self);
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


Function TCrConfigAr.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrConfigAr.it','S');
      Try if Active then begin T.Param(0,NOMBRE_CAM_ARC.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrConfigAr.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_CONF_ARC_NAF********************)
(*                                                                              *)
(*  FORMA DE CR_CONF_ARC_NAF                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CONF_ARC_NAF********************)

procedure TWCrConfigAr.FormShow(Sender: TObject);
begin
      Objeto.CVE_FORMATO_NAF.Control:=edCVE_FORMATO_NAF;
      Objeto.NOMBRE_CAM_ARC.Control:=edNOMBRE_CAM_ARC;
      Objeto.NOMBRE_CAM_BD.Control:=edNOMBRE_CAM_BD;
      Objeto.VALOR_OMISON.Control:=edVALOR_OMISON;
      Objeto.SIT_CONF_ARCNAF.Control:=edSIT_CONF_ARCNAF;
      Objeto.B_OBLIGATORIO.Control:=chB_OBLIGATORIO;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control:=edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;
end;

procedure TWCrConfigAr.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_FORMATO_NAF.Control:=nil;
      Objeto.NOMBRE_CAM_ARC.Control:=nil;
      Objeto.NOMBRE_CAM_BD.Control:=nil;
      Objeto.VALOR_OMISON.Control:=nil;
      Objeto.SIT_CONF_ARCNAF.Control:=nil;
      Objeto.B_OBLIGATORIO.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
end;

procedure TWCrConfigAr.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrConfigAr.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrConfigAr.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrConfigAr.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


end.
