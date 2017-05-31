// Sistema         : Clase de CR_MAPEO_CLAVE
// Fecha de Inicio : 11/10/2005
// Función forma   : Clase de CR_MAPEO_CLAVE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrMapCla;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntCrGruCla, IntLinkit;

Type
 TCrMapCla= class; 

  TWCrMapeoClave=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_GRUPO_CLAVE : TLabel; 
    edCVE_GRUPO_CLAVE : TEdit;
    lbCVE_CORP : TLabel; 
    edCVE_CORP : TEdit;
    lbCVE_CLAVE : TLabel; 
    edCVE_CLAVE : TEdit; 
    edDESC_CVE_CORP : TEdit; 
    edDESC_CVE_CLAVE : TEdit;
    btClave: TBitBtn;
    ilMapeo: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btClaveClick(Sender: TObject);
    procedure edCVE_CLAVEExit(Sender: TObject);
    procedure ilMapeoEjecuta(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrMapCla;
end; 
 TCrMapCla= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_GRUPO_CLAVE          : TInterCampo;
        CVE_CORP                 : TInterCampo;
        CVE_CLAVE                : TInterCampo;
        DESC_CVE_CORP            : TInterCampo;
        DESC_CVE_CLAVE           : TInterCampo;
        sGrupo, sCveCorp, sDescripcion: String;

        CveClave   : TCrGruCla;

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


constructor TCrMapCla.Create( AOwner : TComponent );
begin Inherited; 
      CVE_GRUPO_CLAVE :=CreaCampo('CVE_GRUPO_CLAVE',ftString,tsNinguno,tsNinguno,True);
                CVE_GRUPO_CLAVE.Caption:='Clave de Grupo Clave';
      CVE_CORP :=CreaCampo('CVE_CORP',ftString,tsNinguno,tsNinguno,True);
                CVE_CORP.Caption:='Clave de Corp';
      CVE_CLAVE :=CreaCampo('CVE_CLAVE',ftString,tsNinguno,tsNinguno,True);
                CVE_CLAVE.Caption:='Clave de Clave';
      DESC_CVE_CORP :=CreaCampo('DESC_CVE_CORP',ftString,tsNinguno,tsNinguno,False);
                DESC_CVE_CORP.Caption:='Descripción de Clave Corp';
      DESC_CVE_CLAVE :=CreaCampo('DESC_CVE_CLAVE',ftString,tsNinguno,tsNinguno,False);
                DESC_CVE_CLAVE.Caption:='Descripción Clave';
      FKeyFields.Add('CVE_GRUPO_CLAVE');
      FKeyFields.Add('CVE_CORP');

      TableName := 'CR_MAPEO_CLAVE'; 
      UseQuery := True;
      HelpFile := 'IntCrMapCla.Hlp';
      ShowMenuReporte:=True;

      CveClave   := TCrGruCla.Create(Self);
      CveClave.MasterSource:=Self;

end;

Destructor TCrMapCla.Destroy;
begin
   If CveClave <> Nil Then
      CveClave.Free;
inherited;
end;


function TCrMapCla.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMapeoClave;
begin
   W:=TWCrMapeoClave.Create(Self);
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


Function TCrMapCla.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrMaCl.it','S,S');
      Try if Active then begin T.Param(0,CVE_GRUPO_CLAVE.AsString); 
                               T.Param(1,CVE_CORP.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

function TCrMapCla.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CR_MAPEO_CLAVE********************)
(*                                                                              *)
(*  FORMA DE CR_MAPEO_CLAVE                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_MAPEO_CLAVE********************)

procedure TWCrMapeoClave.FormShow(Sender: TObject);
begin
      Objeto.CVE_GRUPO_CLAVE.Control:=edCVE_GRUPO_CLAVE;
      Objeto.CVE_CORP.Control:=edCVE_CORP;
      Objeto.CVE_CLAVE.Control:=edCVE_CLAVE;
      Objeto.DESC_CVE_CORP.Control:=edDESC_CVE_CORP;
      Objeto.DESC_CVE_CLAVE.Control:=edDESC_CVE_CLAVE;

      Objeto.CveClave.CVE_REFERENCIA.Control:= edCVE_CLAVE;
      Objeto.CveClave.VALOR.Control:=edDESC_CVE_CLAVE;
end;

procedure TWCrMapeoClave.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_GRUPO_CLAVE.Control:=nil;
      Objeto.CVE_CORP.Control:=nil;
      Objeto.CVE_CLAVE.Control:=nil;
      Objeto.DESC_CVE_CORP.Control:=nil;
      Objeto.DESC_CVE_CLAVE.Control:=nil;
      Objeto.CveClave.CVE_REFERENCIA.Control:= nil;
      Objeto.CveClave.VALOR.Control:=nil;
end;

procedure TWCrMapeoClave.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrMapeoClave.InterForma1DespuesNuevo(Sender: TObject);
begin
   If (Objeto.sGrupo <> '')and(Objeto.sCveCorp <> '')  Then Begin
      Objeto.CVE_GRUPO_CLAVE.AsString:= Objeto.sGrupo;
      Objeto.CVE_CORP.AsString:= Objeto.sCveCorp;
      Objeto.DESC_CVE_CORP.AsString:= Objeto.sDescripcion;
   End;
   edCVE_CLAVE.SetFocus;
end;

procedure TWCrMapeoClave.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrMapeoClave.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrMapeoClave.btClaveClick(Sender: TObject);
begin
   Objeto.CVE_GRUPO_CLAVE.GetFromControl;
   Objeto.CveClave.BuscaWhereString:= ' CVE_GRUPO_CLAVE = '''+ Objeto.CVE_GRUPO_CLAVE.AsString+'''';
   If Objeto.CveClave.Busca Then
      InterForma1.NextTab(btClave);
end;

procedure TWCrMapeoClave.edCVE_CLAVEExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg, sSQL : String; qyQuery : TQuery;
begin
   vlSalida := True;
   vlMsg    := '';
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      Objeto.CVE_GRUPO_CLAVE.GetFromControl;
      Objeto.CVE_CORP.GetFromControl;
      Objeto.CVE_CLAVE.GetFromControl;
      If Objeto.CVE_CLAVE.AsString = '' Then Begin
         vlSalida := False;
         vlmsg := 'Favor de Indicar la clave ';
      End;
      InterForma1.ValidaExit(edCVE_CLAVE,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrMapeoClave.ilMapeoEjecuta(Sender: TObject);
begin
   Objeto.CVE_GRUPO_CLAVE.GetFromControl;
   If Objeto.CveClave.FindKey([Objeto.CVE_GRUPO_CLAVE.AsString,ilMapeo.Buffer]) Then
      InterForma1.NextTab(edCVE_CLAVE);
end;

end.
