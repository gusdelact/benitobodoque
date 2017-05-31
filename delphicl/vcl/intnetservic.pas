// Sistema         : Clase de NET_SERVICIOS
// Fecha de Inicio : 23/06/1998
// Función forma   : Clase de NET_SERVICIOS
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Jose Alberto Ramirez Pacheco
// Comentarios     :
Unit IntNetServic;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TNetSer= class; 

  TwNetSer=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_SERVICIO : TLabel; 
    edCVE_SERVICIO : TEdit;
    lbDESC_SERVICIO : TLabel; 
    edDESC_SERVICIO : TEdit; 
    rgSIT_SERVICIO : TRadioGroup;
    lbTX_AVISO : TLabel;
    edTX_AVISO: TMemo;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);  
    private 
    { Private declarations }
    public
    { Public declarations }
    Objeto : TNetSer;
end;
 TNetSer= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_SERVICIO             : TInterCampo;
        DESC_SERVICIO            : TInterCampo;
        SIT_SERVICIO             : TInterCampo;
        TX_AVISO                 : TInterCampo;
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


constructor TNetSer.Create( AOwner : TComponent );
begin Inherited;
      CVE_SERVICIO :=CreaCampo('CVE_SERVICIO',ftString,tsNinguno,tsNinguno,True);
      CVE_SERVICIO .Size:=4;
      CVE_SERVICIO.Caption:='Clave';
      DESC_SERVICIO :=CreaCampo('DESC_SERVICIO',ftString,tsNinguno,tsNinguno,True);
      DESC_SERVICIO.Caption:='Descripción';
      TX_AVISO :=CreaCampo('TX_AVISO',ftString,tsNinguno,tsNinguno,True);
      TX_AVISO.Caption:='Aviso';
      SIT_SERVICIO :=CreaCampo('SIT_SERVICIO',ftString,tsNinguno,tsNinguno,True);
      With SIT_SERVICIO do
      begin
      	Size:=2;
         Caption:='Situación';
         UseCombo := True;
         ComboLista.Add('0');					ComboDatos.add('AC');
         ComboLista.Add('1');					ComboDatos.add('IN');
		end;

      FKeyFields.Add('CVE_SERVICIO');

      TableName := 'NET_SERVICIOS';
      UseQuery := True;
      HelpFile := 'IntNetServic.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TNetSer.Destroy;
begin inherited;
end;


function TNetSer.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwNetSer;
begin
   W:=TwNetSer.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.CentrarForma := True;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TNetSer.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('INetServ.it','S');
      Try if Active then begin T.Param(0,CVE_SERVICIO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TNetSer.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA NET_SERVICIOS********************)
(*                                                                              *)
(*  FORMA DE NET_SERVICIOS                                                            *)
(*                                                                              *)
(***********************************************FORMA NET_SERVICIOS********************)

procedure TwNetSer.FormShow(Sender: TObject);
begin
      Objeto.CVE_SERVICIO.Control:=edCVE_SERVICIO;
      Objeto.DESC_SERVICIO.Control:=edDESC_SERVICIO;
      Objeto.SIT_SERVICIO.Control:=rgSIT_SERVICIO;
      Objeto.TX_AVISO.Control:=edTX_AVISO;
end;

procedure TwNetSer.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_SERVICIO.Control:=nil;
      Objeto.DESC_SERVICIO.Control:=nil;
      Objeto.SIT_SERVICIO.Control:=nil;
      Objeto.TX_AVISO.Control:=nil;
   //Objeto
end;

procedure TwNetSer.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwNetSer.InterForma1DespuesNuevo(Sender: TObject);
begin
   objeto.SIT_SERVICIO.AsString := 'AC';
   edCVE_SERVICIO.SetFocus;
end;

procedure TwNetSer.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_SERVICIO.SetFocus;
end;

//procedure TwNetSer.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


end.
