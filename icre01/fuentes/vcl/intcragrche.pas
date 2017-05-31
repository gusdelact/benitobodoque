// Sistema         : Clase de CR_AGRUPA_CHEQ
// Fecha de Inicio : 13/02/2004
// Función forma   : Clase de CR_AGRUPA_CHEQ
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrAgrChe;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, IntLinkit,

IntCrGpCheq,  // Grupos de Chequeras
IntCtoHeader  // Contrato
;

Type
 TCrAgrChe= class; 

  TWCrAgrupaCheq=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_GPO_CHEQ : TLabel; 
    edCVE_GPO_CHEQ : TEdit;
    lbID_CONTRATO : TLabel; 
    edID_CONTRATO : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edDESC_GPO_CHEQ: TEdit;
    edNOM_CONTRATO: TEdit;
    btnCVE_GPO_CHEQ: TBitBtn;
    btnID_CONTRATO: TBitBtn;
    ilCVE_GPO_CHEQ: TInterLinkit;
    ilID_CONTRATO: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btnCVE_GPO_CHEQClick(Sender: TObject);
    procedure btnID_CONTRATOClick(Sender: TObject);
    procedure ilCVE_GPO_CHEQCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_GPO_CHEQEjecuta(Sender: TObject);
    procedure ilID_CONTRATOEjecuta(Sender: TObject);
    private 
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrAgrChe;
end;
 TCrAgrChe= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_GPO_CHEQ             : TInterCampo;
        ID_CONTRATO              : TInterCampo;
        ParamCre                 : TParamCre;
        GrupoCheq                : TCrGpCheq;
        Contrato                 : TCtrlCto;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrAgrChe.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_GPO_CHEQ :=CreaCampo('CVE_GPO_CHEQ',ftString,tsNinguno,tsNinguno,True);
                CVE_GPO_CHEQ.Caption:='Clave de Grupo Cheq';
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO.Caption:='Número de Contrato';
      FKeyFields.Add('CVE_GPO_CHEQ');
      FKeyFields.Add('ID_CONTRATO');

      GrupoCheq := TCrGpCheq.Create(Self);
      GrupoCheq.MasterSource := Self;

      Contrato := TCtrlCto.Create(Self);
      Contrato.MasterSource := Self;
      Contrato.BuscaWhereString := ' CONTRATO.CVE_PRODUCTO IN (SELECT CVE_PRODUCTO FROM DV_PRODUCTO) ';

      TableName := 'CR_AGRUPA_CHEQ'; 
      UseQuery := True;
      HelpFile := 'IntCrAgrChe.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrAgrChe.Destroy;
begin
  If GrupoCheq <> nil Then
   GrupoCheq.Free;
  // End If;

  If Contrato <> nil Then
   Contrato.Free;

  inherited;
end;


function TCrAgrChe.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAgrupaCheq;
begin
   W:=TWCrAgrupaCheq.Create(Self);
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


Function TCrAgrChe.InternalBusca:Boolean;
Var T : TInterFindit;
    bInternalBusca : Boolean;
begin InternalBusca := False;
      T := CreaBuscador('ICrAgCh.it','S,F');
      Try if Active then begin T.Param(0,CVE_GPO_CHEQ.AsString);
                               T.Param(1,ID_CONTRATO.AsString);
                               end;
          if T.Execute then
            Begin
            bInternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
            If bInternalBusca Then
             Begin
             GrupoCheq.FindKey([T.DameCampo(0)]);
             Contrato.FindKey([T.DameCampo(1)]);
             End;
            InternalBusca := bInternalBusca;
            End; 

      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_AGRUPA_CHEQ********************)
(*                                                                              *)
(*  FORMA DE CR_AGRUPA_CHEQ                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_AGRUPA_CHEQ********************)

procedure TWCrAgrupaCheq.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do
    Begin
    CVE_GPO_CHEQ.Control := edCVE_GPO_CHEQ;
    ID_CONTRATO.Control  := edID_CONTRATO;

    GrupoCheq.CVE_GPO_CHEQ.Control := edCVE_GPO_CHEQ;
    GrupoCheq.DESC_GPO_CHEQ.Control := edDESC_GPO_CHEQ;

    Contrato.ID_CONTRATO.Control := edID_CONTRATO;
    Contrato.TITNombre.Control := edNOM_CONTRATO;
    End;
end;

procedure TWCrAgrupaCheq.FormDestroy(Sender: TObject);
begin
  With Objeto Do
   Begin
    CVE_GPO_CHEQ.Control:=nil;
    ID_CONTRATO.Control:=nil;

    GrupoCheq.CVE_GPO_CHEQ.Control := nil;
    GrupoCheq.DESC_GPO_CHEQ.Control := nil;

    Contrato.ID_CONTRATO.Control := nil;
    Contrato.TITNombre.Control := nil;
   End;
end;

procedure TWCrAgrupaCheq.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrAgrupaCheq.InterForma1DespuesNuevo(Sender: TObject);
begin edCVE_GPO_CHEQ.SetFocus;
end;

procedure TWCrAgrupaCheq.InterForma1DespuesModificar(Sender: TObject);
begin edID_CONTRATO.SetFocus;
end;

procedure TWCrAgrupaCheq.btnCVE_GPO_CHEQClick(Sender: TObject);
begin
 Objeto.GrupoCheq.Busca;
end;

procedure TWCrAgrupaCheq.btnID_CONTRATOClick(Sender: TObject);
begin
 Objeto.Contrato.Busca;
end;

procedure TWCrAgrupaCheq.ilCVE_GPO_CHEQCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrAgrupaCheq.ilCVE_GPO_CHEQEjecuta(Sender: TObject);
begin
 If Objeto.GrupoCheq.FindKey([ilCVE_GPO_CHEQ.Buffer]) Then
  If edID_CONTRATO.CanFocus Then edID_CONTRATO.SetFocus;
end;

procedure TWCrAgrupaCheq.ilID_CONTRATOEjecuta(Sender: TObject);
begin
 If Objeto.Contrato.FindKey([ilID_CONTRATO.Buffer]) Then;
end;

end.
