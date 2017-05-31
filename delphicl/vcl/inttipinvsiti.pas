// Sistema         : Clase de INFOR_EMISORA
// Fecha de Inicio : 25/04/2000
// Función forma   : Clase de INFOR_EMISORA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Gilberto Edouard Arizpe Carreón
// Comentarios     :
Unit IntTipInvSiti;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TTInvSiti= class;

  TWTInvSiti=Class(TForm)
    InterForma1             : TInterForma;
    lbEMISORA : TLabel;
    edCve_siti_asesor: TEdit;
    lbSERIE : TLabel;
    edDesc_siti_asesor: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TTInvSiti;
end;
 TTInvSiti= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_TIP_INV_SITI  : TInterCampo;
        DESC_TIP_INV_SITI  : TInterCampo;


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


constructor TTInvSiti.Create( AOwner : TComponent );
begin Inherited;
      CVE_TIP_INV_SITI  :=CreaCampo('CVE_TIP_INV_SITI',ftString,tsNinguno,tsNinguno,True);
      CVE_TIP_INV_SITI.Size := 3;
      DESC_TIP_INV_SITI :=CreaCampo('DESC_TIP_INV_SITI',ftString,tsNinguno,tsNinguno,True);
      DESC_TIP_INV_SITI.Size := 100;

    FKeyFields.Add('CVE_TIP_INV_SITI');

      TableName := 'SB_TIPO_INV_SITI';
      UseQuery := True;
      HelpFile := 'InTTInvSiti.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TTInvSiti.Destroy;
begin inherited;
end;


function TTInvSiti.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWTInvSiti;
begin
   W:=TWTInvSiti.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
     // W.InterForma1.ShowBtnNuevo     := False;
     // W.InterForma1.ShowBtnModificar := False;
     // W.InterForma1.ShowBtnAceptar   := False;
     // W.InterForma1.ShowBtnCancelar  := False;
     // W.InterForma1.ShowBtnEliminar  := False;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TTInvSiti.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('INVSITI.IT','S');
      Try if Active then begin T.Param(0,CVE_TIP_INV_SITI.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TTInvSiti.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA INFOR_EMISORA********************)
(*                                                                              *)
(*  FORMA DE INFOR_EMISORA                                                            *)
(*                                                                              *)
(***********************************************FORMA INFOR_EMISORA********************)

procedure TWTInvSiti.FormShow(Sender: TObject);
begin
  Objeto.CVE_TIP_INV_SITI.Control := edCve_siti_asesor;
  Objeto.DESC_TIP_INV_SITI.Control := edDesc_siti_asesor;

end;

procedure TWTInvSiti.FormDestroy(Sender: TObject);
BEGIN
  Objeto.CVE_TIP_INV_SITI.Control := nil;
  Objeto.DESC_TIP_INV_SITI.Control := nil;
end;

procedure TWTInvSiti.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWTInvSiti.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;

end;

procedure TWTInvSiti.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;

end;

//procedure TWInforEmisora.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


end.
