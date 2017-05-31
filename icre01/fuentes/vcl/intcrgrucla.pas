// Sistema         : Clase de CR_GRUPO_CLAVE
// Fecha de Inicio : 09/09/2005
// Función forma   : Clase de CR_GRUPO_CLAVE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :


Unit IntCrGruCla;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre;

Type
 TCrGruCla= class; 

  TWCrGrupoClave=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_GRUPO_CLAVE : TLabel; 
    edCVE_GRUPO_CLAVE : TEdit;
    lbCVE_REFERENCIA : TLabel; 
    edCVE_REFERENCIA : TEdit;
    lbVALOR : TLabel; 
    edVALOR : TEdit;
    btPROM_ADM: TBitBtn;
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
    procedure btPROM_ADMClick(Sender: TObject);
    procedure edCVE_GRUPO_CLAVEExit(Sender: TObject);
    procedure edCVE_REFERENCIAExit(Sender: TObject);
    procedure edVALORExit(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrGruCla;
end;
 TCrGruCla= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_GRUPO_CLAVE          : TInterCampo;
        CVE_REFERENCIA           : TInterCampo;
        VALOR                    : TInterCampo;

        ParamCre                 : TParamCre;
        sCveGrupo, sCveClave     : String;

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


constructor TCrGruCla.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_GRUPO_CLAVE :=CreaCampo('CVE_GRUPO_CLAVE',ftString,tsNinguno,tsNinguno,True);
                CVE_GRUPO_CLAVE.Caption:='Clave de Grupo';
      CVE_REFERENCIA :=CreaCampo('CVE_REFERENCIA',ftString,tsNinguno,tsNinguno,True);
                CVE_REFERENCIA.Caption:='Clave de Referencia';
      VALOR :=CreaCampo('VALOR',ftString,tsNinguno,tsNinguno,True);
                VALOR.Caption:='Descripción';
      FKeyFields.Add('CVE_GRUPO_CLAVE');
      FKeyFields.Add('CVE_REFERENCIA');

      TableName := 'CR_GRUPO_CLAVE';
      UseQuery := True; 
      HelpFile := 'IntCrGruCla.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrGruCla.Destroy;
begin inherited;
end;


function TCrGruCla.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrGrupoClave;
begin
   W:=TWCrGrupoClave.Create(Self);
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


Function TCrGruCla.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrGrCl.it','S,S');
      Try if Active then begin T.Param(0,CVE_GRUPO_CLAVE.AsString);
                               T.Param(1,CVE_REFERENCIA.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

function TCrGruCla.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_GRUPO_CLAVE********************)
(*                                                                              *)
(*  FORMA DE CR_GRUPO_CLAVE                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GRUPO_CLAVE********************)

procedure TWCrGrupoClave.FormShow(Sender: TObject);
begin
      lbDEmpresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDFecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_GRUPO_CLAVE.Control:=edCVE_GRUPO_CLAVE;
      Objeto.CVE_REFERENCIA.Control:=edCVE_REFERENCIA;
      Objeto.VALOR.Control:=edVALOR;
      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrGrupoClave.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_GRUPO_CLAVE.Control:=nil;
      Objeto.CVE_REFERENCIA.Control:=nil;
      Objeto.VALOR.Control:=nil;
   //Objeto
end;

procedure TWCrGrupoClave.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrGrupoClave.InterForma1DespuesNuevo(Sender: TObject);
begin
   If Objeto.sCveGrupo <> '' Then Begin
      Objeto.CVE_GRUPO_CLAVE.AsString:= Objeto.sCveGrupo;
      edCVE_REFERENCIA.SetFocus;
      If Objeto.sCveClave <> '' Then Begin
         Objeto.CVE_REFERENCIA.AsString:= Objeto.sCveClave;
         edVALOR.SetFocus;
      End;
   End Else
      edCVE_GRUPO_CLAVE.SetFocus;
end;

procedure TWCrGrupoClave.InterForma1DespuesModificar(Sender: TObject);
begin
   edVALOR.SetFocus;
end;

procedure TWCrGrupoClave.btPROM_ADMClick(Sender: TObject);
Var
  T : TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRGRUCLA_GRUP',True,True) then
   begin
    //   T := Objeto.CreaBuscador('IMCVEGPO.IT','S');     // RABA 19 AGO 2011 NO EXISTE ESTE BUSCADOR
       T := Objeto.CreaBuscador('ICRGRCL.IT','S');
       Try
          if T.Execute then Begin
             Objeto.CVE_GRUPO_CLAVE.AsString := T.DameCampo(0);
          End;
       finally
          T.Free;
       end;
   end;
end;

procedure TWCrGrupoClave.edCVE_GRUPO_CLAVEExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      Objeto.CVE_GRUPO_CLAVE.GetFromControl;
      If Objeto.CVE_GRUPO_CLAVE.AsString = '' Then Begin
         vlSalida := False;
         vlmsg := 'Favor de Indicar la Clave del Grupo';
      End;
      InterForma1.ValidaExit(edCVE_GRUPO_CLAVE,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrGrupoClave.edCVE_REFERENCIAExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      Objeto.CVE_REFERENCIA.GetFromControl;
      If Objeto.CVE_REFERENCIA.AsString = '' Then Begin
         vlSalida := False;
         vlmsg := 'Favor de Indicar la Clave de Referencia';
      End;
      InterForma1.ValidaExit(edCVE_REFERENCIA,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrGrupoClave.edVALORExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edVALOR,True,'',True);
end;

end.
