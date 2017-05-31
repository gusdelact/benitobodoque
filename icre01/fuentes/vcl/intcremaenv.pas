// Sistema         : Clase de CR_EMAIL_ENVIO
// Fecha de Inicio : 25/11/2003
// Función forma   : Clase de CR_EMAIL_ENVIO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrEmaEnv;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TCrEmaEnv= class; 

  TWCrEmailEnvio=Class(TForm)
    InterForma1             : TInterForma; 
    lbNUM_FOLIO : TLabel; 
    edNUM_FOLIO : TEdit;
    lbID_CREDITO : TLabel; 
    edID_CREDITO : TEdit;
    lbF_ENVIO : TLabel; 
    dtpF_ENVIO : TInterDateTimePicker; 
    edF_ENVIO : TEdit;
    lbID_TIPO_EMAIL : TLabel; 
    edID_TIPO_EMAIL : TEdit;
    lbTITULO_FINAL : TLabel; 
    edTITULO_FINAL : TEdit;
    lbTEXTO_FINAL : TLabel; 
    edTEXTO_FINAL : TEdit;
    lbDESTINATARIO : TLabel; 
    edDESTINATARIO : TEdit;
    lbCVE_USU_ENVIO : TLabel; 
    edCVE_USU_ENVIO : TEdit;
    lbSIT_ENVIO_EMAIL : TLabel; 
    edSIT_ENVIO_EMAIL : TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);  
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrEmaEnv;
end; 
 TCrEmaEnv= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        NUM_FOLIO                : TInterCampo;
        ID_CREDITO               : TInterCampo;
        F_ENVIO                  : TInterCampo;
        ID_TIPO_EMAIL            : TInterCampo;
        TITULO_FINAL             : TInterCampo;
        TEXTO_FINAL              : TInterCampo;
        DESTINATARIO             : TInterCampo;
        CVE_USU_ENVIO            : TInterCampo;
        SIT_ENVIO_EMAIL          : TInterCampo;
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


constructor TCrEmaEnv.Create( AOwner : TComponent ); 
begin Inherited; 
      NUM_FOLIO :=CreaCampo('NUM_FOLIO',ftFloat,tsNinguno,tsNinguno,True);
                NUM_FOLIO.Caption:='Número Folio';
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Número de Credito';
      F_ENVIO :=CreaCampo('F_ENVIO',ftDate,tsNinguno,tsNinguno,True);
                F_ENVIO.Caption:='Fecha Envio';
      ID_TIPO_EMAIL :=CreaCampo('ID_TIPO_EMAIL',ftString,tsNinguno,tsNinguno,True);
                ID_TIPO_EMAIL.Caption:='Número de Tipo Email';
      TITULO_FINAL :=CreaCampo('TITULO_FINAL',ftString,tsNinguno,tsNinguno,True);
                TITULO_FINAL.Caption:='Titulo Final';
      TEXTO_FINAL :=CreaCampo('TEXTO_FINAL',ftString,tsNinguno,tsNinguno,True);
                TEXTO_FINAL.Caption:='Texto Final';
      DESTINATARIO :=CreaCampo('DESTINATARIO',ftString,tsNinguno,tsNinguno,True);
                DESTINATARIO.Caption:='Destinatario';
      CVE_USU_ENVIO :=CreaCampo('CVE_USU_ENVIO',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ENVIO.Caption:='Clave de Usu Envio';
      SIT_ENVIO_EMAIL :=CreaCampo('SIT_ENVIO_EMAIL',ftString,tsNinguno,tsNinguno,True);
                SIT_ENVIO_EMAIL.Caption:='Situación Envio Email';
      FKeyFields.Add('NUM_FOLIO');
      FKeyFields.Add('ID_CREDITO');

      TableName := 'CR_EMAIL_ENVIO'; 
      UseQuery := True; 
      HelpFile := 'IntCrEmaEnv.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrEmaEnv.Destroy;
begin inherited;
end;


function TCrEmaEnv.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrEmailEnvio;
begin
   W:=TWCrEmailEnvio.Create(Self);
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


Function TCrEmaEnv.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrEmEn.it','F,F');
      Try if Active then begin T.Param(0,NUM_FOLIO.AsString); 
                               T.Param(1,ID_CREDITO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; 
end;

function TCrEmaEnv.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_EMAIL_ENVIO********************)
(*                                                                              *)
(*  FORMA DE CR_EMAIL_ENVIO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_EMAIL_ENVIO********************)

procedure TWCrEmailEnvio.FormShow(Sender: TObject);
begin
      Objeto.NUM_FOLIO.Control:=edNUM_FOLIO;
      Objeto.ID_CREDITO.Control:=edID_CREDITO;
      Objeto.F_ENVIO.Control:=edF_ENVIO;
      Objeto.ID_TIPO_EMAIL.Control:=edID_TIPO_EMAIL;
      Objeto.TITULO_FINAL.Control:=edTITULO_FINAL;
      Objeto.TEXTO_FINAL.Control:=edTEXTO_FINAL;
      Objeto.DESTINATARIO.Control:=edDESTINATARIO;
      Objeto.CVE_USU_ENVIO.Control:=edCVE_USU_ENVIO;
      Objeto.SIT_ENVIO_EMAIL.Control:=edSIT_ENVIO_EMAIL;
end;

procedure TWCrEmailEnvio.FormDestroy(Sender: TObject);
begin
      Objeto.NUM_FOLIO.Control:=nil;
      Objeto.ID_CREDITO.Control:=nil;
      Objeto.F_ENVIO.Control:=nil;
      Objeto.ID_TIPO_EMAIL.Control:=nil;
      Objeto.TITULO_FINAL.Control:=nil;
      Objeto.TEXTO_FINAL.Control:=nil;
      Objeto.DESTINATARIO.Control:=nil;
      Objeto.CVE_USU_ENVIO.Control:=nil;
      Objeto.SIT_ENVIO_EMAIL.Control:=nil;
   //Objeto
end;

procedure TWCrEmailEnvio.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrEmailEnvio.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrEmailEnvio.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrEmailEnvio.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


end.
