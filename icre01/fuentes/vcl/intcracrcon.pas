// Sistema         : Clase de CR_ACRED_CONST
// Fecha de Inicio : 20/05/2004
// Función forma   : Clase de CR_ACRED_CONST
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrAcrCon;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

//Clases Adicionales
IntParamCre;

Type
 TCrAcrCon= class; 

  TWCrAcredConst=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_PUESTO : TLabel; 
    edCVE_PUESTO : TEdit;
    lbDESC_PUESTO : TLabel; 
    edDESC_PUESTO : TEdit; 
    chB_PCT_PARTIC_ACC : TCheckBox;
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
    procedure edCVE_PUESTOExit(Sender: TObject);
    procedure edDESC_PUESTOExit(Sender: TObject);
    procedure chB_PCT_PARTIC_ACCExit(Sender: TObject);
    private 
    { Private declarations } 
    public
    { Public declarations }
    Objeto : TCrAcrCon;
end;
 TCrAcrCon= class(TInterFrame)
      private
      protected

      public
        { Public declarations }
        CVE_PUESTO               : TInterCampo;
        DESC_PUESTO              : TInterCampo;
        B_PCT_PARTIC_ACC         : TInterCampo;

        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;



implementation

{$R *.DFM}


constructor TCrAcrCon.Create( AOwner : TComponent );
begin Inherited;
      CVE_PUESTO :=CreaCampo('CVE_PUESTO',ftString,tsNinguno,tsNinguno,True);
                CVE_PUESTO.Caption:='Clave del Puesto';
      DESC_PUESTO :=CreaCampo('DESC_PUESTO',ftString,tsNinguno,tsNinguno,True);
                DESC_PUESTO.Caption:='Descripción';
      B_PCT_PARTIC_ACC :=CreaCampo('B_PCT_PARTIC_ACC',ftString,tsNinguno,tsNinguno,True);
                B_PCT_PARTIC_ACC.Caption:='Aplica Porcentaje de Particiapación Accionaria';
      FKeyFields.Add('CVE_PUESTO');

      TableName := 'CR_ACRED_CONST';
      UseQuery := True;
      HelpFile := 'IntCrAcrCon.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrAcrCon.Destroy;
begin inherited;
end;


function TCrAcrCon.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAcredConst;
begin
   W:=TWCrAcredConst.Create(Self);
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


Function TCrAcrCon.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrAcCo.it','S');
      Try if Active then begin T.Param(0,CVE_PUESTO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_ACRED_CONST********************)
(*                                                                              *)
(*  FORMA DE CR_ACRED_CONST                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_ACRED_CONST********************)

procedure TWCrAcredConst.FormShow(Sender: TObject);
begin
      //Datos del panel de la parte inferior de la forma
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_PUESTO.Control:=edCVE_PUESTO;
      Objeto.DESC_PUESTO.Control:=edDESC_PUESTO;
      Objeto.B_PCT_PARTIC_ACC.Control:=chB_PCT_PARTIC_ACC;
end;

procedure TWCrAcredConst.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_PUESTO.Control:=nil;
      Objeto.DESC_PUESTO.Control:=nil;
      Objeto.B_PCT_PARTIC_ACC.Control:=nil;
   //Objeto
end;

procedure TWCrAcredConst.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrAcredConst.InterForma1DespuesNuevo(Sender: TObject);
begin edCVE_PUESTO.SetFocus;
end;

procedure TWCrAcredConst.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_PUESTO.SetFocus;
end;

procedure TWCrAcredConst.edCVE_PUESTOExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      begin
         vlMsg     := '';
         Objeto.CVE_PUESTO.GetFromControl;
         if Objeto.CVE_PUESTO.AsString = '' then
         Begin
            vlSalida   := False;
            vlMsg := 'Favor de indicar la clave del puesto';
         end; //end if
         InterForma1.ValidaExit(edCVE_PUESTO,vlSalida,vlMsg,True);
      end;
end;

procedure TWCrAcredConst.edDESC_PUESTOExit(Sender: TObject);
begin
        InterForma1.ValidaExit(edDESC_PUESTO,True,'',True);
end;

procedure TWCrAcredConst.chB_PCT_PARTIC_ACCExit(Sender: TObject);
begin
        InterForma1.ValidaExit(chB_PCT_PARTIC_ACC,True,'',True);
end;

end.
