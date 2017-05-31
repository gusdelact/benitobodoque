// Sistema         : Clase de CR_ACCESORIO
// Fecha de Inicio : 20/12/2004
// Función forma   : Clase de CR_ACCESORIO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrAccesor;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
//Unidades Adicionales
IntParamCre;

Type
 TCrAccesor= class;

  TWCrAccesorio=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_ACCESORIO : TLabel; 
    edCVE_ACCESORIO : TEdit;
    lbDESC_ACCESORIO : TLabel; 
    edDESC_ACCESORIO : TEdit;
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
    procedure edCVE_ACCESORIOExit(Sender: TObject);
    procedure edDESC_ACCESORIOExit(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrAccesor;
end; 
 TCrAccesor= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_ACCESORIO            : TInterCampo;
        DESC_ACCESORIO           : TInterCampo;
        //CLASES ADICONALES
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


constructor TCrAccesor.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_ACCESORIO :=CreaCampo('CVE_ACCESORIO',ftString,tsNinguno,tsNinguno,True);
                CVE_ACCESORIO.Caption:='Cve. Accesorio';
      DESC_ACCESORIO :=CreaCampo('DESC_ACCESORIO',ftString,tsNinguno,tsNinguno,True);
                DESC_ACCESORIO.Caption:='Descripción';
      FKeyFields.Add('CVE_ACCESORIO');

      TableName := 'CR_ACCESORIO';
      UseQuery := True;
      HelpFile := 'IntCrAccesor.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrAccesor.Destroy;
begin inherited;
end;


function TCrAccesor.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAccesorio;
begin
   W:=TWCrAccesorio.Create(Self);
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


Function TCrAccesor.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrAcces.it','S');
      Try if Active then begin T.Param(0,CVE_ACCESORIO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrAccesor.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_ACCESORIO********************)
(*                                                                              *)
(*  FORMA DE CR_ACCESORIO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_ACCESORIO********************)

procedure TWCrAccesorio.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_ACCESORIO.Control:=edCVE_ACCESORIO;
      Objeto.DESC_ACCESORIO.Control:=edDESC_ACCESORIO;
end;

procedure TWCrAccesorio.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_ACCESORIO.Control:=nil;
      Objeto.DESC_ACCESORIO.Control:=nil;
   //Objeto
end;

procedure TWCrAccesorio.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrAccesorio.InterForma1DespuesNuevo(Sender: TObject);
begin edCVE_ACCESORIO.SetFocus;
end;

procedure TWCrAccesorio.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_ACCESORIO.SetFocus;
end;

procedure TWCrAccesorio.edCVE_ACCESORIOExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
       VLMsg := '';
       VLSalida := True;
       Objeto.CVE_ACCESORIO.GetFromControl;
       If Objeto.CVE_ACCESORIO.AsString = '' then
       Begin
           VLSalida := False;
           ShowMessage('Favor de Indicar la clave de Accesorio');
           InterForma1.ValidaExit(edCVE_ACCESORIO,VLSalida,'',True);
       end;
   End;
end;

procedure TWCrAccesorio.edDESC_ACCESORIOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_ACCESORIO,True,'',True);
end;

end.
