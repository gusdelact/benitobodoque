// Sistema         : Clase de CR_CCI_CONCEPTO
// Fecha de Inicio : 05/11/2009
// Función forma   : Clase de CR_CCI_CONCEPTO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrCciConc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntParamCre;

const
 CFAVOR = 'Favor de indicar el/la ';

Type
 TCrCciConc= class; 

  TWCrCciConcepto=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_CCI_CONCEPTO : TLabel; 
    edCVE_CCI_CONCEPTO : TEdit;
    lbDESC_CCI_CONCEPT : TLabel; 
    edDESC_CCI_CONCEPT : TEdit;
    MsgPanel: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    rgCVE_AFEC_SALDO: TRadioGroup;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_CCI_CONCEPTOExit(Sender: TObject);
    procedure edDESC_CCI_CONCEPTExit(Sender: TObject);
    procedure rgCVE_AFEC_SALDOExit(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrCciConc;
end; 
 TCrCciConc= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ParamCre : TParamCre;

        CVE_CCI_CONCEPTO         : TInterCampo;
        DESC_CCI_CONCEPT         : TInterCampo;
        CVE_AFEC_SALDO           : TInterCampo;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published 
      end;

implementation
{$R *.DFM}

constructor TCrCciConc.Create( AOwner : TComponent );
begin Inherited;
      CVE_CCI_CONCEPTO :=CreaCampo('CVE_CCI_CONCEPTO',ftString,tsNinguno,tsNinguno,True);
                CVE_CCI_CONCEPTO.Caption:='Clave de Cci Concepto';
      DESC_CCI_CONCEPT :=CreaCampo('DESC_CCI_CONCEPT',ftString,tsNinguno,tsNinguno,True);
                DESC_CCI_CONCEPT.Caption:='Descripción Cci Concept';
      CVE_AFEC_SALDO :=CreaCampo('CVE_AFEC_SALDO',ftString,tsNinguno,tsNinguno,True);
                CVE_AFEC_SALDO.Caption:='Descripción Cci Concept';
      With CVE_AFEC_SALDO do
      Begin Size:=2;
           UseCombo:=True;
           ComboLista.Add('0'); ComboDatos.Add('D');
           ComboLista.Add('1'); ComboDatos.Add('I');
           ComboLista.Add('2'); ComboDatos.Add('N');
      End;

      FKeyFields.Add('CVE_CCI_CONCEPTO');

      TableName := 'CR_CCI_CONCEPTO'; 
      UseQuery := True; 
      HelpFile := 'IntCrCciConc.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCciConc.Destroy;
begin inherited;
end;


function TCrCciConc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCciConcepto;
begin
   W:=TWCrCciConcepto.Create(Self);
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


Function TCrCciConc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCcCi.it','S');
      Try if Active then begin T.Param(0,CVE_CCI_CONCEPTO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_CCI_CONCEPTO********************)
(*                                                                              *)
(*  FORMA DE CR_CCI_CONCEPTO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CCI_CONCEPTO********************)

procedure TWCrCciConcepto.FormShow(Sender: TObject);
begin
  With Objeto Do
    Begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;
        
    CVE_CCI_CONCEPTO.Control := edCVE_CCI_CONCEPTO;
    DESC_CCI_CONCEPT.Control := edDESC_CCI_CONCEPT;
    CVE_AFEC_SALDO.Control   := rgCVE_AFEC_SALDO;

    Interforma1.MsgPanel := MsgPanel;
    End;
end;

procedure TWCrCciConcepto.FormDestroy(Sender: TObject);
begin
  With Objeto Do
    Begin
    CVE_CCI_CONCEPTO.Control := Nil;
    DESC_CCI_CONCEPT.Control := Nil;
    CVE_AFEC_SALDO.Control   := Nil;
    End;
end;

procedure TWCrCciConcepto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCciConcepto.InterForma1DespuesNuevo(Sender: TObject);
begin If edCVE_CCI_CONCEPTO.CanFocus Then edCVE_CCI_CONCEPTO.SetFocus;
end;

procedure TWCrCciConcepto.InterForma1DespuesModificar(Sender: TObject);
begin If edDESC_CCI_CONCEPT.CanFocus Then edDESC_CCI_CONCEPT.SetFocus;
end;

procedure TWCrCciConcepto.edCVE_CCI_CONCEPTOExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
     sText : String;
     bFind : Boolean;
Begin
  vlbSalida := True;
  vlStrMesg := '';
  With Objeto Do
  Begin
    sText := edCVE_CCI_CONCEPTO.Text;
    If (Trim(sText) = '') Then
    Begin
       vlbSalida := False;
       vlStrMesg := CFAVOR + lbCVE_CCI_CONCEPTO.Caption;
    End;
  End;
  InterForma1.ValidaExit(edCVE_CCI_CONCEPTO, vlbSalida, vlStrMesg, True);
end;

procedure TWCrCciConcepto.edDESC_CCI_CONCEPTExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
     sText : String;
     bFind : Boolean;
Begin
  vlbSalida := True;
  vlStrMesg := '';
  With Objeto Do
  Begin
    sText := edDESC_CCI_CONCEPT.Text;
    If (Trim(sText) = '') Then
    Begin
       vlbSalida := False;
       vlStrMesg := CFAVOR + lbDESC_CCI_CONCEPT.Caption;
    End;
  End;
  InterForma1.ValidaExit(edDESC_CCI_CONCEPT, vlbSalida, vlStrMesg, True);
end;

procedure TWCrCciConcepto.rgCVE_AFEC_SALDOExit(Sender: TObject);
begin
  InterForma1.ValidaExit(rgCVE_AFEC_SALDO, True, '', True);
end;

end.
