// Sistema         : Clase de CR_SITUACION
// Fecha de Inicio : 20/12/2004
// Función forma   : Clase de CR_SITUACION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrSituaci;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

//Unidades Adicionales
IntParamCre
;

Type
 TCrSituaci= class; 

  TWCrSituacion=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_SITUACION : TLabel; 
    edCVE_SITUACION : TEdit; 
    edDESC_C_SITUACION : TEdit;
    lbDESC_L_SITUACION : TLabel; 
    edDESC_L_SITUACION : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    chB_DISPOSICION: TCheckBox;
    chB_PERIODO: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_SITUACIONExit(Sender: TObject);
    procedure edDESC_C_SITUACIONExit(Sender: TObject);
    procedure edDESC_L_SITUACIONExit(Sender: TObject);
    procedure chB_DISPOSICIONExit(Sender: TObject);
    procedure chB_PERIODOExit(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrSituaci;
end;
 TCrSituaci= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_SITUACION            : TInterCampo;
        DESC_C_SITUACION         : TInterCampo;
        DESC_L_SITUACION         : TInterCampo;
        B_DISPOSICION            : TInterCampo;
        B_PERIODO                : TInterCampo;
        //CLASES ADICONALES
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


constructor TCrSituaci.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_SITUACION :=CreaCampo('CVE_SITUACION',ftString,tsNinguno,tsNinguno,True);
                CVE_SITUACION.Caption:='Cve. Situación';
      DESC_C_SITUACION :=CreaCampo('DESC_C_SITUACION',ftString,tsNinguno,tsNinguno,True);
                DESC_C_SITUACION.Caption:='Descripción Corta';
      DESC_L_SITUACION :=CreaCampo('DESC_L_SITUACION',ftString,tsNinguno,tsNinguno,True);
                DESC_L_SITUACION.Caption:='Descripción Larga';
      B_DISPOSICION :=CreaCampo('B_DISPOSICION',ftString,tsNinguno,tsNinguno,True);
                B_DISPOSICION.Caption:='Disposicion';
      B_PERIODO :=CreaCampo('B_PERIODO',ftString,tsNinguno,tsNinguno,True);
                B_PERIODO.Caption:='Periodo';
      FKeyFields.Add('CVE_SITUACION');

      TableName := 'CR_SITUACION'; 
      UseQuery := True; 
      HelpFile := 'IntCrSituaci.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrSituaci.Destroy;
begin inherited;
end;


function TCrSituaci.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrSituacion;
begin
   W:=TWCrSituacion.Create(Self);
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


Function TCrSituaci.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrSitua.it','S');
      Try if Active then begin T.Param(0,CVE_SITUACION.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_SITUACION********************)
(*                                                                              *)
(*  FORMA DE CR_SITUACION                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_SITUACION********************)

procedure TWCrSituacion.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_SITUACION.Control:=edCVE_SITUACION;
      Objeto.DESC_C_SITUACION.Control:=edDESC_C_SITUACION;
      Objeto.DESC_L_SITUACION.Control:=edDESC_L_SITUACION;
      Objeto.B_DISPOSICION.Control:=chB_DISPOSICION;
      Objeto.B_PERIODO.Control:=chB_PERIODO;
end;

procedure TWCrSituacion.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_SITUACION.Control:=nil;
      Objeto.DESC_C_SITUACION.Control:=nil;
      Objeto.DESC_L_SITUACION.Control:=nil;
      Objeto.B_DISPOSICION.Control:=nil;
      Objeto.B_PERIODO.Control:=nil;
   //Objeto
end;

procedure TWCrSituacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrSituacion.InterForma1DespuesNuevo(Sender: TObject);
begin edCVE_SITUACION.SetFocus;
end;

procedure TWCrSituacion.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_C_SITUACION.SetFocus;
end;

procedure TWCrSituacion.edCVE_SITUACIONExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
       VLMsg := '';
       VLSalida := True;
       Objeto.CVE_SITUACION.GetFromControl;
       If Objeto.CVE_SITUACION.AsString = '' then
       Begin
           VLSalida := False;
//           VLMsg:='Favor de Indicar la clave de situación';
           ShowMessage('Favor de Indicar la clave de situación');
           InterForma1.ValidaExit(edCVE_SITUACION,VLSalida,'',True);
       end;
   End;
end;

procedure TWCrSituacion.edDESC_C_SITUACIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_C_SITUACION,True,'',True);
end;

procedure TWCrSituacion.edDESC_L_SITUACIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_L_SITUACION,True,'',True);
end;

procedure TWCrSituacion.chB_DISPOSICIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_DISPOSICION,True,'',True);
end;

procedure TWCrSituacion.chB_PERIODOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_PERIODO,True,'',True);
end;

end.
