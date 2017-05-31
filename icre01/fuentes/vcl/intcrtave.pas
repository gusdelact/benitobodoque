// Sistema         : Clase de CR_TIPO_AVE
// Fecha de Inicio : 07/03/2012
// Función forma   : Clase de CR_TIPO_AVE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qforlxvhziifraxzhgil
// Comentarios     :
Unit IntCrTAve;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntGenCre, IntParamCre;

Type
 TCrTAve= class; 

  TWCrTAve=Class(TForm)
    InterForma1             : TInterForma; 
    lbFOLIO : TLabel; 
    edFOLIO : TEdit;
    lbCVE_AVE : TLabel; 
    edCVE_AVE : TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    private
    { Private declarations }

      function obtFolio() : integer;

    public 
    { Public declarations } 
    Objeto : TCrTAve;
end; 
 TCrTAve= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        FOLIO                    : TInterCampo;
        CVE_AVE                  : TInterCampo;
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

{$R *.DFM}


constructor TCrTAve.Create( AOwner : TComponent ); 
begin Inherited; 
      FOLIO :=CreaCampo('FOLIO',ftFloat,tsNinguno,tsNinguno,True);
                FOLIO.Caption:='Folio';
      CVE_AVE :=CreaCampo('CVE_AVE',ftString,tsNinguno,tsNinguno,True);
                CVE_AVE.Caption:='Clave de Ave';
      FKeyFields.Add('FOLIO');

      TableName := 'CR_TIPO_AVE'; 
      UseQuery := True; 
      HelpFile := 'IntCrTAve.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrTAve.Destroy;
begin inherited;
end;


function TCrTAve.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrTAve;
begin
   W:=TWCrTAve.Create(Self);
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


Function TCrTAve.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrTAve.it','F');
      Try if Active then begin T.Param(0,FOLIO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrTAve.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_TIPO_AVE********************)
(*                                                                              *)
(*  FORMA DE CR_TIPO_AVE                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_TIPO_AVE********************)

procedure TWCrTAve.FormShow(Sender: TObject);
begin
      Objeto.FOLIO.Control:=edFOLIO;
      Objeto.CVE_AVE.Control:=edCVE_AVE;
end;

procedure TWCrTAve.FormDestroy(Sender: TObject);
begin
      Objeto.FOLIO.Control:=nil;
      Objeto.CVE_AVE.Control:=nil;
   //Objeto
end;

procedure TWCrTAve.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrTAve.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
  edFOLIO.Text := IntToStr(obtFolio);
end;

procedure TWCrTAve.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrTAve.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


function TWCrTAve.obtFolio: integer;
var
  intFolio : Integer;
  strSQL   : String;
begin
  strSQL := 'select nvl(max(FOLIO),0) + 1 as FOLIO from CR_TIPO_AVE';

  GetSQLInt(strSQL, Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, 'FOLIO', intFolio, False);

  Result := intFolio;
end;

end.
