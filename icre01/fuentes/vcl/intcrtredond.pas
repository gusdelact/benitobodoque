// Sistema         : Clase de CR_TIPO_REDONDEO
// Fecha de Inicio : 24/11/2004
// Función forma   : Clase de CR_TIPO_REDONDEO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrTRedond;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit,
//UNIDADES ADICONALES
IntParamCre
;

Type
 TCrTRedond= class; 

  TWCrTRedondeo=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_TIPO_RED : TLabel; 
    edCVE_TIPO_RED : TEdit; 
    edDESC_TIPO_RED : TEdit;
    lbDENOMINADOR : TLabel; 
    IedDENOMINADOR : TInterEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    MsgPanel: TPanel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_TIPO_REDExit(Sender: TObject);
    procedure edDESC_TIPO_REDExit(Sender: TObject);
    procedure IedDENOMINADORExit(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrTRedond;
end;
 TCrTRedond= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_TIPO_RED             : TInterCampo;
        DESC_TIPO_RED            : TInterCampo;
        DENOMINADOR              : TInterCampo;
        //CLASES ADICIONALES
        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published 
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrTRedond.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_TIPO_RED :=CreaCampo('CVE_TIPO_RED',ftString,tsNinguno,tsNinguno,True);
                CVE_TIPO_RED.Caption:='Tipo de Redondeo';
      DESC_TIPO_RED :=CreaCampo('DESC_TIPO_RED',ftString,tsNinguno,tsNinguno,True);
                DESC_TIPO_RED.Caption:='Descripción';
      DENOMINADOR :=CreaCampo('DENOMINADOR',ftFloat,tsNinguno,tsNinguno,True);
                DENOMINADOR.Caption:='Redondear al:';
      FKeyFields.Add('CVE_TIPO_RED');

      TableName := 'CR_TIPO_REDONDEO'; 
      UseQuery := True;
      HelpFile := 'IntCrTRedond.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrTRedond.Destroy;
begin inherited;
end;


function TCrTRedond.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrTRedondeo;
begin
   W:=TWCrTRedondeo.Create(Self);
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


Function TCrTRedond.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrTRedo.it','S');
      Try if Active then begin T.Param(0,CVE_TIPO_RED.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;


(***********************************************FORMA CR_TIPO_REDONDEO********************)
(*                                                                              *)
(*  FORMA DE CR_TIPO_REDONDEO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_TIPO_REDONDEO********************)

procedure TWCrTRedondeo.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_TIPO_RED.Control:=edCVE_TIPO_RED;
      Objeto.DESC_TIPO_RED.Control:=edDESC_TIPO_RED;
      Objeto.DENOMINADOR.Control:=IedDENOMINADOR;
end;

procedure TWCrTRedondeo.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_TIPO_RED.Control:=nil;
      Objeto.DESC_TIPO_RED.Control:=nil;
      Objeto.DENOMINADOR.Control:=nil;
   //Objeto
end;

procedure TWCrTRedondeo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrTRedondeo.InterForma1DespuesNuevo(Sender: TObject);
begin edCVE_TIPO_RED.SetFocus;
end;

procedure TWCrTRedondeo.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_TIPO_RED.SetFocus;
end;

procedure TWCrTRedondeo.edCVE_TIPO_REDExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      Objeto.CVE_TIPO_RED.GetFromControl;
      if Objeto.CVE_TIPO_RED.AsString = '' then
      Begin
          vlSalida := False;
          vlmsg := 'Favor de Indicar la clave de tipo de Redondeo';
      end;
      InterForma1.ValidaExit(edCVE_TIPO_RED,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrTRedondeo.edDESC_TIPO_REDExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edDESC_TIPO_RED,True,'',True);
end;

procedure TWCrTRedondeo.IedDENOMINADORExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      Objeto.DENOMINADOR.GetFromControl;
      if Objeto.DENOMINADOR.AsFloat <= 1 then
      Begin
          vlSalida := False;
          vlmsg := 'El valor de Redondeo no puede ser menor o igual a la unidad (1)';
      end;
      InterForma1.ValidaExit(IedDENOMINADOR,vlSalida,vlMsg,True);
   end;
end;

end.
