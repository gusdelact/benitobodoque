// Sistema         : Clase de TMAccion
// Fecha de Inicio : 02/08/2004
// Función forma   : Clase de TMAccion
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMAccion;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntCrAcredit,     //Acreditado
IntParamCre,
IntCrAccioni,
IntMQrAccion;       //Reporte Disposicion


Type
 TMAccion= class;

  TwMAccion=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
    lbID_PROMOTOR: TLabel;
    edID_ACCIONISTA: TEdit;
    btAccionista: TBitBtn;
    ilAccionista: TInterLinkit;
    edNOM_ACCIONISTA: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    chbxAccionista: TCheckBox;
    Label1: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    chbxAcreditado: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btAccionistaClick(Sender: TObject);
    procedure ilAccionistaCapture(Sender: TObject; var Show: Boolean);
    procedure ilAccionistaEjecuta(Sender: TObject);
    procedure edID_ACCIONISTAExit(Sender: TObject);
    procedure chbxAccionistaClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure edACREDITADOExit(Sender: TObject);
    procedure edID_ACCIONISTAChange(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    private
    { Private declarations }
        Procedure ImprimeReporte(bPreview:Boolean);
    public
    { Public declarations }
    Objeto : TMAccion;
end;
 TMAccion= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
       public
        { Public declarations }
        Acreditado               : TCrAcredit;
        Accionista                 : TCrAccioni; //Accionista
        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation

{$R *.DFM}


constructor TMAccion.Create( AOwner : TComponent );
begin Inherited;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      Accionista := TCrAccioni.Create(Self);
      Accionista.MasterSource := Self;

      UseQuery := False;
      HelpFile := 'InTMAccion.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMAccion.Destroy;
begin
   if Acreditado <> nil then
      Acreditado.Free;
   if Accionista <> nil then
      Accionista.Free;
   inherited;
end;


function TMAccion.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMAccion;
begin
   W:=TwMAccion.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TMAccion.InternalBusca:Boolean;
begin InternalBusca := False;
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)

procedure TwMAccion.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;


      Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      Objeto.GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;


      Objeto.Accionista.ID_ACCIONISTA.Control :=edID_ACCIONISTA;
      Objeto.Accionista.NOMBRE.Control :=edNOM_ACCIONISTA;
      Objeto.Accionista.GetParams(Objeto);
      edNOM_ACCIONISTA.Hint := Objeto.Accionista.NOMBRE.AsString;
      edNOM_ACCIONISTA.ShowHint := True;



end;

procedure TwMAccion.FormDestroy(Sender: TObject);
begin
    Objeto.Acreditado.ID_ACREDITADO.Control := nil;
    Objeto.Acreditado.Persona.Nombre.Control := nil;
    Objeto.Accionista.NOMBRE.Control :=nil;
    Objeto.Accionista.ID_ACCIONISTA.Control :=nil;
end;

procedure TwMAccion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMAccion.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMAccion.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;


procedure TwMAccion.btAccionistaClick(Sender: TObject);
begin
    Objeto.Accionista.ShowAll := True;
    If Objeto.Accionista.Busca Then Begin
        chbxAccionista.Checked:=True;
        chbxAccionista.Enabled:=True;
        InterForma1.NextTab(edID_ACCIONISTA);
    End;
end;

procedure TwMAccion.ilAccionistaCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMAccion.ilAccionistaEjecuta(Sender: TObject);
begin
    If Objeto.Accionista.FindKey([ilAccionista.Buffer]) Then Begin
        chbxAccionista.Checked:=True;
        chbxAccionista.Enabled:=True;
        InterForma1.NextTab(edID_ACCIONISTA);
    End;
end;

procedure TwMAccion.edID_ACCIONISTAExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edID_ACCIONISTA,True,'',True);
end;

procedure TwMAccion.chbxAccionistaClick(Sender: TObject);
begin
    If not chbxAccionista.Checked Then Begin
        Objeto.Accionista.Active:=False;
        chbxAccionista.Checked:=False;
        chbxAccionista.Enabled:=False;
    End Else Begin
        chbxAccionista.Checked:=True;
        chbxAccionista.Enabled:=True;
    End;
end;

procedure TwMAccion.InterForma1BtnPreviewClick(Sender: TObject);
begin
    ImprimeReporte(True);
end;

procedure TwMAccion.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMAccion.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMAccion.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TwMAccion.chbxAcreditadoClick(Sender: TObject);
begin
    If not chbxAcreditado.Checked Then Begin
        Objeto.Acreditado.Active:=False;
        chbxAcreditado.Checked:=False;
        chbxAcreditado.Enabled:=False;
    End Else Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
    End;
end;

procedure TwMAccion.edACREDITADOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edACREDITADO,True,'',True);
end;

procedure TwMAccion.edID_ACCIONISTAChange(Sender: TObject);
begin
    If Trim(edID_ACCIONISTA.Text)<>'' Then Begin
        chbxAccionista.Checked:=True;
        chbxAccionista.Enabled:=True;
    End Else Begin
        chbxAccionista.Checked:=False;
        chbxAccionista.Enabled:=False;
    End;
end;

Procedure TwMAccion.ImprimeReporte(bPreview:Boolean);
begin

    EjecutarReporteAccionista( edACREDITADO.Text, edID_ACCIONISTA.Text, Objeto.Apli,bPreview);

End;
procedure TwMAccion.InterForma1BtnImprimirClick(Sender: TObject);
begin
    ImprimeReporte(False);
end;

end.

