// Sistema         : Clase de CR_LIQ_MEDIO
// Fecha de Inicio : 16/01/2004
// Función forma   : Clase de CR_LIQ_MEDIO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrLiqMedi;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
//UNIDADES ADICIONALES
IntParamCre,
IntGenCre;

Type
 TCrLiqMedi= class; 

  TWCrLiqMedio=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_MEDIO : TLabel; 
    edCVE_MEDIO : TEdit;
    lbDESC_MEDIO : TLabel; 
    edDESC_MEDIO : TEdit;
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
    procedure edCVE_MEDIOExit(Sender: TObject);
    procedure edDESC_MEDIOExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrLiqMedi;
end;
 TCrLiqMedi= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_MEDIO                : TInterCampo;
        DESC_MEDIO               : TInterCampo;

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


constructor TCrLiqMedi.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_MEDIO :=CreaCampo('CVE_MEDIO',ftString,tsNinguno,tsNinguno,True);
                CVE_MEDIO.Caption:='Medio de Liquidación';
      DESC_MEDIO :=CreaCampo('DESC_MEDIO',ftString,tsNinguno,tsNinguno,True);
                DESC_MEDIO.Caption:='Descripción';
      FKeyFields.Add('CVE_MEDIO');

      TableName := 'CR_LIQ_MEDIO'; 
      UseQuery := True; 
      HelpFile := 'IntCrLiqMedi.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrLiqMedi.Destroy;
begin inherited;
end;


function TCrLiqMedi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrLiqMedio;
begin
   W:=TWCrLiqMedio.Create(Self);
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


Function TCrLiqMedi.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrLiMe.it','S');
      Try if Active then begin T.Param(0,CVE_MEDIO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrLiqMedi.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_LIQ_MEDIO********************)
(*                                                                              *)
(*  FORMA DE CR_LIQ_MEDIO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_LIQ_MEDIO********************)

procedure TWCrLiqMedio.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_MEDIO.Control:=edCVE_MEDIO;
      Objeto.DESC_MEDIO.Control:=edDESC_MEDIO;
end;

procedure TWCrLiqMedio.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_MEDIO.Control:=nil;
      Objeto.DESC_MEDIO.Control:=nil;
   //Objeto
end;

procedure TWCrLiqMedio.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrLiqMedio.InterForma1DespuesNuevo(Sender: TObject);
begin
        edCVE_MEDIO.SetFocus;
end;

procedure TWCrLiqMedio.InterForma1DespuesModificar(Sender: TObject);
begin
        edDESC_MEDIO.SetFocus;
end;

procedure TWCrLiqMedio.edCVE_MEDIOExit(Sender: TObject);
var  vlSalida  :  boolean;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlSalida := True;
      Objeto.CVE_MEDIO.GetFromControl;
      if Objeto.CVE_MEDIO.AsString = CNULL then
      Begin
         vlSalida   := False;
      end;
      InterForma1.ValidaExit(edCVE_MEDIO,vlSalida,CNULL,True);
   end;
end;

procedure TWCrLiqMedio.edDESC_MEDIOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_MEDIO,True,CNULL,True);
end;

procedure TWCrLiqMedio.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
end;

end.
