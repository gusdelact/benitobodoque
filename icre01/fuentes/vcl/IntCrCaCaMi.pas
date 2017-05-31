// Sistema         : Clase de CR_CARTERA_CAT_MINIMO
// Fecha de Inicio : 04/02/2016
// Función forma   : Clase de CR_CARTERA_CAT_MINIMO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrCaCaMi;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre;

Type
 TCrCaCaMi= class;

  TWCrCarteCatMinim=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_CARTERA : TLabel;
    edCVE_CARTERA : TEdit;
    lbDESC_CARTERA : TLabel;
    edDESC_CARTERA : TEdit;
    lbCVE_USU_ALTA : TLabel;
    edCVE_USU_ALTA : TEdit;
    lbFH_ALTA : TLabel;
    edFH_ALTA : TEdit;
    lbCVE_USU_MODIFICA : TLabel;
    edCVE_USU_MODIFICA : TEdit;
    lbFH_MODIFICA : TLabel;
    edFH_MODIFICA : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    rgSIT_CARTERA: TRadioGroup;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    private
    { Private declarations }
      procedure InhabilitaCamposAuditoria;
    public
    { Public declarations }
    Objeto : TCrCaCaMi;
end;
 TCrCaCaMi= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_CARTERA              : TInterCampo;
        DESC_CARTERA             : TInterCampo;
        SIT_CARTERA              : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        FH_ALTA                  : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        FH_MODIFICA              : TInterCampo;
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


constructor TCrCaCaMi.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_CARTERA :=CreaCampo('CVE_CARTERA',ftString,tsNinguno,tsNinguno,True);
                CVE_CARTERA.Caption:='Clave de Cartera';
      DESC_CARTERA :=CreaCampo('DESC_CARTERA',ftString,tsNinguno,tsNinguno,True);
                DESC_CARTERA.Caption:='Descripción Cartera';
      SIT_CARTERA :=CreaCampo('SIT_CARTERA',ftString,tsNinguno,tsNinguno,True);
         With SIT_CARTERA do
         Begin  Size := 2;
                UseCombo := True;
                ComboLista.Add('0'); ComboDatos.Add('AC');
                ComboLista.Add('1'); ComboDatos.Add('CA');
         end;
                SIT_CARTERA.Caption:='Situación Cartera';

      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      FH_ALTA :=CreaCampo('FH_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                FH_ALTA.Caption:='Fecha y Hora Alta';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      FH_MODIFICA :=CreaCampo('FH_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                FH_MODIFICA.Caption:='Fecha y Hora Modifica';
      FKeyFields.Add('CVE_CARTERA');

      TableName := 'CR_CARTERA_CAT_MINIMO'; 
      UseQuery := True; 
      HelpFile := 'IntCrCaCaMi.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCaCaMi.Destroy;
begin inherited;
end;


function TCrCaCaMi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCarteCatMinim;
begin
   W:=TWCrCarteCatMinim.Create(Self);
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


Function TCrCaCaMi.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrCaCM.it','S');
      Try if Active then begin T.Param(0,CVE_CARTERA.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrCaCaMi.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_CARTERA_CAT_MINIMO********************)
(*                                                                              *)
(*  FORMA DE CR_CARTERA_CAT_MINIMO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CARTERA_CAT_MINIMO********************)

procedure TWCrCarteCatMinim.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_CARTERA.Control:=edCVE_CARTERA;
      Objeto.DESC_CARTERA.Control:=edDESC_CARTERA;
      Objeto.SIT_CARTERA.Control:=rgSIT_CARTERA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.FH_ALTA.Control:=edFH_ALTA;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;
      Objeto.FH_MODIFICA.Control:=edFH_MODIFICA;
end;

procedure TWCrCarteCatMinim.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_CARTERA.Control:=nil;
      Objeto.DESC_CARTERA.Control:=nil;
      Objeto.SIT_CARTERA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.FH_ALTA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
      Objeto.FH_MODIFICA.Control:=nil;
   //Objeto
end;

procedure TWCrCarteCatMinim.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCarteCatMinim.InhabilitaCamposAuditoria;
begin
  edCVE_USU_ALTA.Color        := clBtnFace;
  edCVE_USU_ALTA.ReadOnly     := True;
  edCVE_USU_ALTA.TabStop      := False;
  edFH_ALTA.Color             := clBtnFace;
  edFH_ALTA.ReadOnly          := True;
  edFH_ALTA.TabStop           := False;
  edCVE_USU_MODIFICA.Color    := clBtnFace;
  edCVE_USU_MODIFICA.ReadOnly := True;
  edCVE_USU_MODIFICA.TabStop  := False;
  edFH_MODIFICA.Color         := clBtnFace;
  edFH_MODIFICA.ReadOnly      := True;
  edFH_MODIFICA.TabStop       := False;
end;

procedure TWCrCarteCatMinim.InterForma1DespuesNuevo(Sender: TObject);
begin
  Objeto.FH_ALTA.AsDateTime    := Now;
  Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
  InhabilitaCamposAuditoria;
end;

procedure TWCrCarteCatMinim.InterForma1DespuesModificar(Sender: TObject);
begin
  Objeto.FH_MODIFICA.AsDateTime    := Now;
  Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
  InhabilitaCamposAuditoria;
end;

//procedure TWCrCarteCatMinim.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


end.
