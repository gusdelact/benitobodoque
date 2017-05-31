// Sistema         : Clase de TCrCMin
// Fecha de Inicio : 16/02/2000
// Función forma   : Clase de TCrCMin
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Juan Carlos Sanchez Reyes
// Comentarios     :
Unit IntCrCMin;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit;

Type
 TCrCMin= class;

  TWCrCMin=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_CAT_MIN : TLabel;
    edCVE_CAT_MIN : TEdit;
    lbDESC_CAT_MIN : TLabel;
    edDESC_CAT_MIN : TEdit;
    lbCVE_CAT_MIN_VENC : TLabel;
    edCVE_CAT_MIN_VENC : TEdit;
    lbCVE_SITI : TLabel;
    edCVE_SITI : TEdit;
    lbCVE_SITI_VENC : TLabel;
    edCVE_SITI_VENC : TEdit;
    chB_BANCARIA : TCheckBox;
    chB_NIVEL_AFECTA: TCheckBox;
    Label1: TLabel;
    InterEditRegula: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrCMin;
end;
 TCrCMin= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_CAT_MIN              : TInterCampo;
        DESC_CAT_MIN             : TInterCampo;
        CVE_CAT_MIN_VENC         : TInterCampo;
        CVE_SITI                 : TInterCampo;
        CVE_SITI_VENC            : TInterCampo;
        B_BANCARIA               : TInterCampo;
        B_NIVEL_AFECTA           : TInterCampo;
        CVE_REGULATORIA          : TInterCampo;

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


constructor TCrCMin.Create( AOwner : TComponent );
begin Inherited;
      CVE_CAT_MIN :=CreaCampo('CVE_CAT_MIN',ftString,tsNinguno,tsNinguno,True);
                CVE_CAT_MIN.Caption:='Clave de Cat Min';
      DESC_CAT_MIN :=CreaCampo('DESC_CAT_MIN',ftString,tsNinguno,tsNinguno,True);
                DESC_CAT_MIN.Caption:='Descripción Cat Min';
      CVE_CAT_MIN_VENC :=CreaCampo('CVE_CAT_MIN_VENC',ftString,tsNinguno,tsNinguno,True);
                CVE_CAT_MIN_VENC.Caption:='Clave de Cat Min Venc';
      CVE_SITI :=CreaCampo('CVE_SITI',ftString,tsNinguno,tsNinguno,True);
                CVE_SITI.Caption:='Clave de Siti';
      CVE_SITI_VENC :=CreaCampo('CVE_SITI_VENC',ftString,tsNinguno,tsNinguno,True);
                CVE_SITI_VENC.Caption:='Clave de Siti Venc';
      B_BANCARIA :=CreaCampo('B_BANCARIA',ftString,tsNinguno,tsNinguno,True);
        B_BANCARIA .Size:=1;
                B_BANCARIA.Caption:='Bancaria';
      B_NIVEL_AFECTA :=CreaCampo('B_NIVEL_AFECTA',ftString,tsNinguno,tsNinguno,True);
        B_NIVEL_AFECTA.Size:=1;
        B_NIVEL_AFECTA.Caption:='Nivel de afectación';

      CVE_REGULATORIA :=CreaCampo('CVE_REGULATORIA',ftString,tsNinguno,tsNinguno,True);

      FKeyFields.Add('CVE_CAT_MIN');

      TableName := 'CRE_CAT_MINIMO';
      UseQuery := True;
      HelpFile := 'IntCrCMin.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCMin.Destroy;
begin inherited;
end;


function TCrCMin.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCMin;
begin
   W:=TWCrCMin.Create(Self);
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


Function TCrCMin.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCMin.it','S');
      Try if Active then begin T.Param(0,CVE_CAT_MIN.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TCrCMin.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA TCrCMin********************)
(*                                                                              *)
(*  FORMA DE TCrCMin                                                            *)
(*                                                                              *)
(***********************************************FORMA TCrCMin********************)

procedure TWCrCMin.FormShow(Sender: TObject);
begin
      Objeto.CVE_CAT_MIN.Control:=edCVE_CAT_MIN;
      Objeto.DESC_CAT_MIN.Control:=edDESC_CAT_MIN;
      Objeto.CVE_CAT_MIN_VENC.Control:=edCVE_CAT_MIN_VENC;
      Objeto.CVE_SITI.Control:=edCVE_SITI;
      Objeto.CVE_SITI_VENC.Control:=edCVE_SITI_VENC;
      Objeto.B_BANCARIA.Control:=chB_BANCARIA;
      Objeto.B_NIVEL_AFECTA.Control:=chB_NIVEL_AFECTA;
      Objeto.CVE_REGULATORIA.Control:=InterEditRegula;
end;


procedure TWCrCMin.FormDestroy(Sender: TObject);
begin

      Objeto.CVE_REGULATORIA.Control:=nil;
      Objeto.CVE_CAT_MIN.Control:=nil;
      Objeto.DESC_CAT_MIN.Control:=nil;
      Objeto.CVE_CAT_MIN_VENC.Control:=nil;
      Objeto.CVE_SITI.Control:=nil;
      Objeto.CVE_SITI_VENC.Control:=nil;
      Objeto.B_BANCARIA.Control:=nil;
      Objeto.B_NIVEL_AFECTA.Control:=nil;
end;

procedure TWCrCMin.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCMin.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrCMin.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrCMin.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte; 
//end;


end.
