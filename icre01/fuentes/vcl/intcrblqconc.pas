// Sistema         : Clase de CR_BLQ_CONCEPTO
// Fecha de Inicio : 07/11/2008
// Función forma   : Clase de CR_BLQ_CONCEPTO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrBlqConc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntParamCre,
IntGenCre;

Type
 TCrBlqConc= class; 

  TWCrBlqConcepto=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_BLQ_CPTO : TLabel; 
    edCVE_BLQ_CPTO : TEdit;
    lbDESC_BLQ_CPTO : TLabel; 
    edDESC_BLQ_CPTO : TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edCVE_USU_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    rgSIT_BLQ_CONCEPTO: TRadioGroup;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrBlqConc;
end; 
 TCrBlqConc= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ParamCre    : TParamCre;

        CVE_BLQ_CPTO             : TInterCampo;
        DESC_BLQ_CPTO            : TInterCampo;
        SIT_BLQ_CONCEPTO         : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_MODIFICA               : TInterCampo;
        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
      published 
      end;


implementation

{$R *.DFM}


constructor TCrBlqConc.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_BLQ_CPTO :=CreaCampo('CVE_BLQ_CPTO',ftString,tsNinguno,tsNinguno,True);
                CVE_BLQ_CPTO.Caption:='Clave de Blq Cpto';
      DESC_BLQ_CPTO :=CreaCampo('DESC_BLQ_CPTO',ftString,tsNinguno,tsNinguno,True);
                DESC_BLQ_CPTO.Caption:='Descripción Blq Cpto';
      SIT_BLQ_CONCEPTO :=CreaCampo('SIT_BLQ_CONCEPTO',ftString,tsNinguno,tsNinguno,True);
      With SIT_BLQ_CONCEPTO do
        Begin
        Size:=2;
        UseCombo:=True;
        Caption:='Situación Blq Concepto';
        ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
        ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
        End;

      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_ALTA :=CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      FKeyFields.Add('CVE_BLQ_CPTO');

      TableName := 'CR_BLQ_CONCEPTO'; 
      UseQuery := True; 
      HelpFile := 'IntCrBlqConc.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrBlqConc.Destroy;
begin inherited;
end;


function TCrBlqConc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrBlqConcepto;
begin
   W:=TWCrBlqConcepto.Create(Self);
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


Function TCrBlqConc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrBlCo.it','S');
      Try if Active then begin T.Param(0,CVE_BLQ_CPTO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;


(***********************************************FORMA CR_BLQ_CONCEPTO********************)
(*                                                                              *)
(*  FORMA DE CR_BLQ_CONCEPTO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_BLQ_CONCEPTO********************)

procedure TWCrBlqConcepto.FormShow(Sender: TObject);
begin
  With Objeto Do
    Begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;
        
    CVE_BLQ_CPTO.Control:=edCVE_BLQ_CPTO;
    DESC_BLQ_CPTO.Control:=edDESC_BLQ_CPTO;
    SIT_BLQ_CONCEPTO.Control:=rgSIT_BLQ_CONCEPTO;
    CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
    F_ALTA.Control:=edF_ALTA;
    CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;
    F_MODIFICA.Control:=edF_MODIFICA;
    End;
end;

procedure TWCrBlqConcepto.FormDestroy(Sender: TObject);
begin
  With Objeto Do
    Begin
    CVE_BLQ_CPTO.Control:=Nil;
    DESC_BLQ_CPTO.Control:=Nil;
    SIT_BLQ_CONCEPTO.Control:=Nil;
    CVE_USU_ALTA.Control:=Nil;
    F_ALTA.Control:=Nil;
    CVE_USU_MODIFICA.Control:=Nil;
    F_MODIFICA.Control:=Nil;
    End;
end;

procedure TWCrBlqConcepto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrBlqConcepto.InterForma1DespuesNuevo(Sender: TObject);
begin If edCVE_BLQ_CPTO.CanFocus Then edCVE_BLQ_CPTO.SetFocus;
      Objeto.SIT_BLQ_CONCEPTO.AsString := 'AC';
end;

procedure TWCrBlqConcepto.InterForma1DespuesModificar(Sender: TObject);
begin If edDESC_BLQ_CPTO.CanFocus Then edDESC_BLQ_CPTO.SetFocus;
end;

procedure TWCrBlqConcepto.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
 With Objeto Do
  If IsNewData Then
     Begin
     F_ALTA.AsDateTime := Now;
     CVE_USU_ALTA.AsString := Apli.Usuario;
     End
   Else
     Begin
     F_MODIFICA.AsDateTime := Now;
     CVE_USU_MODIFICA.AsString := Apli.Usuario;
     End;
end;

end.
