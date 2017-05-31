// Sistema         : Clase de DOM_CONVERTIDO
// Fecha de Inicio : 10/01/2014
// Función forma   : Clase de DOM_CONVERTIDO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :             
// Comentarios     :         
Unit IntDomConver;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntParamCre,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TDomConver= class; 

  TWDomConvertido=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_DOMICILIO : TLabel; 
    edID_DOMICILIO : TEdit;
    lbCALLE_NUMERO : TLabel; 
    edCALLE_NUMERO : TEdit;
    lbCALLE : TLabel; 
    edCALLE : TEdit;
    lbNUM_EXTERIOR : TLabel; 
    edNUM_EXTERIOR : TEdit;
    lbNUM_INTERIOR : TLabel; 
    edNUM_INTERIOR : TEdit;
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
    Objeto : TDomConver;
end;
 TDomConver= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre                 : TParamCre;
        vEjercicio               : String;
        
        ID_DOMICILIO             : TInterCampo;
        CALLE_NUMERO             : TInterCampo;
        CALLE                    : TInterCampo;
        NUM_EXTERIOR             : TInterCampo;
        NUM_INTERIOR             : TInterCampo;

        Function    InternalPost : Boolean; override;
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


constructor TDomConver.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_DOMICILIO :=CreaCampo('ID_DOMICILIO',ftFloat,tsNinguno,tsNinguno,True);
                ID_DOMICILIO.Caption:='Número de Domicilio';
      CALLE_NUMERO :=CreaCampo('CALLE_NUMERO',ftString,tsNinguno,tsNinguno,True);
                CALLE_NUMERO.Caption:='Calle Numero';
      CALLE :=CreaCampo('CALLE',ftString,tsNinguno,tsNinguno,True);
                CALLE.Caption:='Calle';
      NUM_EXTERIOR :=CreaCampo('NUM_EXTERIOR',ftString,tsNinguno,tsNinguno,True);
                NUM_EXTERIOR.Caption:='Número Exterior';
      NUM_INTERIOR :=CreaCampo('NUM_INTERIOR',ftString,tsNinguno,tsNinguno,True);
                NUM_INTERIOR.Caption:='Número Interior';
      FKeyFields.Add('ID_DOMICILIO');

      TableName := 'DOM_CONVERTIDO'; 
      UseQuery := True; 
      HelpFile := 'IntDomConver.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TDomConver.Destroy;
begin inherited;
end;


function TDomConver.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWDomConvertido;
begin
   W:=TWDomConvertido.Create(Self);
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


Function TDomConver.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IDomConv.it','F');
      Try if Active then begin T.Param(0,ID_DOMICILIO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;


//Sobreescribiendo el Internal Post
Function TDomConver.InternalPost : Boolean;
Var VLSalida  : Boolean;
    vlsql     : string;
begin
     InternalPost := False;
     VLSalida := False;

     if Modo=moAppend then
     begin
        Result:=Inherited InternalPost;
        VLSalida := True;

        if VLSalida then
        begin
          ID_DOMICILIO.GetFromControl;
          try
            vlsql := ' UPDATE DOM_CONVERTIDO ' +
                     ' SET  NOM_CARGA     = ''Constancias '+ vEjercicio +''''+
                     '     ,SIT_DOMICILIO = ''CM'' '+
                     '     ,FH_CARGA      = SYSDATE '+
                     ' WHERE ID_DOMICILIO = '+ ID_DOMICILIO.AsString;

            if not (RunSQL(vlsql,Apli.DataBaseName, Apli.SessionName,True)) then
               vlSalida := False;
          Except
            on e: exception do
            bEGIN
             Beep;Beep;Beep;Beep;
             ShowMessage('Problemas con el Alta de Informacion');
             ShowMessage(e.Message);
            end;
           end;
        end;

     end;

     if Modo= moEdit then
     begin
        VLSalida := Inherited InternalPost;
        VLSalida := True;
     end;
     InternalPost := VLSalida;
End;

function TDomConver.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA DOM_CONVERTIDO********************)
(*                                                                              *)
(*  FORMA DE DOM_CONVERTIDO                                                            *)
(*                                                                              *)
(***********************************************FORMA DOM_CONVERTIDO********************)

procedure TWDomConvertido.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_DOMICILIO.Control:=edID_DOMICILIO;
      Objeto.CALLE_NUMERO.Control:=edCALLE_NUMERO;
      Objeto.CALLE.Control:=edCALLE;
      Objeto.NUM_EXTERIOR.Control:=edNUM_EXTERIOR;
      Objeto.NUM_INTERIOR.Control:=edNUM_INTERIOR;

      InterForma1.BtnNuevo.Visible:=false;
      InterForma1.BtnEliminar.Visible:=false;
end;

procedure TWDomConvertido.FormDestroy(Sender: TObject);
begin
      Objeto.ID_DOMICILIO.Control:=nil;
      Objeto.CALLE_NUMERO.Control:=nil;
      Objeto.CALLE.Control:=nil;
      Objeto.NUM_EXTERIOR.Control:=nil;
      Objeto.NUM_INTERIOR.Control:=nil;
   //Objeto
end;

procedure TWDomConvertido.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWDomConvertido.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWDomConvertido.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWDomConvertido.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


end.
