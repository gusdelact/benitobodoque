// Sistema         : Clase de TMReDocCte
// Fecha de Inicio : 17/05/2004
// Función forma   : Clase de TMReDocCte
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMReDocCte;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntMTramite,    //Trámite
IntCrAcredit,   //Acreditado
IntMDoctos,     //Documentos
IntUsuario,
IntParamCre
;

Type
 TMReDocCte= class;

  TwMReDocCte=Class(TForm)
    InterForma1             : TInterForma;
    GroupBox1: TGroupBox;
    dtpOpeF_INICIO: TInterDateTimePicker;
    edOpeF_INICIO: TEdit;
    lbLiqF_INICIO: TLabel;
    lbLiqF_FINAL: TLabel;
    edOpeF_FINAL: TEdit;
    dtpOpeF_FINAL: TInterDateTimePicker;
    lbAplica: TLabel;
    edCVE_TRAMITE: TEdit;
    btTRAMITE: TBitBtn;
    ilTRAMITE: TInterLinkit;
    edNOM_TRAMITE: TEdit;
    lbTRAMITE: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    rgSituacion: TRadioGroup;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    chbxTRAMITE: TCheckBox;
    chbxAutorizacion: TCheckBox;
    chbxCVE_DOCUMENTO: TCheckBox;
    edNOM_AUTORIZA: TEdit;
    btAutoriza: TBitBtn;
    edCVE_AUTORIZA: TInterEdit;
    ilAutoriza: TInterLinkit;
    edCVE_DOCUMENTO: TEdit;
    btCVE_DOCUMENTO: TBitBtn;
    edDESC_DOCUMENTO: TEdit;
    ilCVE_DOCUMENTO: TInterLinkit;
    Label4: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    chbxACREDITADO: TCheckBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    dtpEntCF_INICIO: TInterDateTimePicker;
    edEntCF_INICIO: TEdit;
    edEntCF_FINAL: TEdit;
    dtpEntCF_FINAL: TInterDateTimePicker;
    chbxF_EntC: TCheckBox;
    chbxF_Ope: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btTRAMITEClick(Sender: TObject);
    procedure ilTRAMITECapture(Sender: TObject; var Show: Boolean);
    procedure ilTRAMITEEjecuta(Sender: TObject);
    procedure btAutorizaClick(Sender: TObject);
    procedure ilAutorizaCapture(Sender: TObject; var Show: Boolean);
    procedure ilAutorizaEjecuta(Sender: TObject);
    procedure btCVE_DOCUMENTOClick(Sender: TObject);
    procedure ilCVE_DOCUMENTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_DOCUMENTOEjecuta(Sender: TObject);
    procedure chbxF_OpeClick(Sender: TObject);
    procedure chbxTRAMITEClick(Sender: TObject);
    procedure edCVE_TRAMITEChange(Sender: TObject);
    procedure chbxAutorizacionClick(Sender: TObject);
    procedure chbxCVE_DOCUMENTOClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure edOpeF_INICIOChange(Sender: TObject);
    procedure edOpeF_FINALChange(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure chbxACREDITADOClick(Sender: TObject);
    procedure edACREDITADOChange(Sender: TObject);
    procedure edCVE_DOCUMENTOChange(Sender: TObject);
    procedure edCVE_AUTORIZAChange(Sender: TObject);
    procedure edEntCF_INICIOChange(Sender: TObject);
    procedure edEntCF_FINALChange(Sender: TObject);
    procedure chbxF_EntCClick(Sender: TObject);
    private
    { Private declarations }
        Procedure ImprimeReporte(bPreview:Boolean);
    public
    { Public declarations }
    Objeto : TMReDocCte;
end;
 TMReDocCte= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        Tramite                  : TMTramite;
        Acreditado               : TCrAcredit;
        Autorizacion             : TUsuario; 
        Doctos                   : TMDoctos;
        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;



implementation
Uses IntMQrDocCte;

{$R *.DFM}


constructor TMReDocCte.Create( AOwner : TComponent );
begin Inherited;
      Tramite := TMTramite.Create(Self);
      Tramite.MasterSource:=Self;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      Autorizacion := TUsuario.Create(Self);
      Autorizacion.MasterSource:=Self;

      Doctos := TMDoctos.Create(Self);
      Doctos.MasterSource:=Self;

      UseQuery := False;
      HelpFile := 'IntMReDocCte.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMReDocCte.Destroy;
begin
   if Tramite <> nil then
      Tramite.Free;
   If Acreditado <> Nil Then
      Acreditado.Free;
   if Autorizacion <> nil then
      Autorizacion.Free;
   if Doctos <> nil then
      Doctos.Free;
   inherited;
end;


function TMReDocCte.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMReDocCte;
begin
   W:=TwMReDocCte.Create(Self);
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


Function TMReDocCte.InternalBusca:Boolean;
begin InternalBusca := False;

end;

function TMReDocCte.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)

procedure TwMReDocCte.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.Tramite.CVE_TRAMITE.Control := edCVE_TRAMITE;
   Objeto.Tramite.DESC_C_TRAMITE.Control:= edNOM_TRAMITE;
   Objeto.Tramite.GetParams(Objeto);

   Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
   Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
   Objeto.GetParams(Objeto);
   edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
   edNOMBRE_ACRED.ShowHint := True;

   Objeto.Autorizacion.CVE_USUARIO.Control := edCVE_AUTORIZA;
   Objeto.Autorizacion.EMPLEADO.Persona.Nombre.Control := edNOM_AUTORIZA;

   Objeto.Doctos.CVE_DOCUMENTO.Control := edCVE_DOCUMENTO;
   Objeto.Doctos.DESC_DOCUMENTO.Control := edDESC_DOCUMENTO;
   Objeto.Doctos.GetParams(Objeto);

   dtpOpeF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   dtpOpeF_FINAL.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   dtpEntCF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   dtpEntCF_FINAL.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
end;

procedure TwMReDocCte.FormDestroy(Sender: TObject);
begin
   Objeto.Tramite.CVE_TRAMITE.Control := nil;
   Objeto.Tramite.DESC_C_TRAMITE.Control := nil;
   Objeto.Acreditado.ID_ACREDITADO.Control := nil;
   Objeto.Acreditado.Persona.Nombre.Control := nil;
   Objeto.Autorizacion.CVE_USUARIO.Control := Nil;
   Objeto.Autorizacion.EMPLEADO.Persona.Nombre.Control := Nil;
   Objeto.Doctos.CVE_DOCUMENTO.Control := Nil;
   Objeto.Doctos.DESC_DOCUMENTO.Control := Nil;
end;

procedure TwMReDocCte.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMReDocCte.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMReDocCte.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWNinguno.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TwMReDocCte.btTRAMITEClick(Sender: TObject);
begin
    Objeto.Tramite.ShowAll := True;
    if Objeto.Tramite.Busca then begin
        chbxTRAMITE.Checked:=True;
        chbxTRAMITE.Enabled:=True;
        InterForma1.NextTab(edCVE_TRAMITE);
    End;
end;

procedure TwMReDocCte.ilTRAMITECapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMReDocCte.ilTRAMITEEjecuta(Sender: TObject);
begin
   If Objeto.Tramite.FindKey([Objeto.Apli.IdEmpresa,ilTRAMITE.Buffer]) then begin
      chbxTRAMITE.Checked:=True;
      chbxTRAMITE.Enabled:=True;
      InterForma1.NextTab(edCVE_TRAMITE);
   End;
end;

procedure TwMReDocCte.btAutorizaClick(Sender: TObject);
begin
   Objeto.Autorizacion.ShowAll := True;
   if Objeto.Autorizacion.Busca then begin
        chbxAutorizacion.Checked:=True;
        chbxAutorizacion.Enabled:=True;
        InterForma1.NextTab(edCVE_AUTORIZA);
   End;
end;

procedure TwMReDocCte.ilAutorizaCapture(Sender: TObject;
  var Show: Boolean);
begin
    Show := True;
end;

procedure TwMReDocCte.ilAutorizaEjecuta(Sender: TObject);
begin
   if Objeto.Autorizacion.FindKey([ilAutoriza.Buffer]) then begin
        chbxAutorizacion.Checked:=True;
        chbxAutorizacion.Enabled:=True;
        InterForma1.NextTab(edCVE_AUTORIZA);
   End;
end;

procedure TwMReDocCte.btCVE_DOCUMENTOClick(Sender: TObject);
begin
   Objeto.Doctos.ShowAll := True;
   if Objeto.Doctos.Busca then begin
        chbxCVE_DOCUMENTO.Checked:=True;
        chbxCVE_DOCUMENTO.Enabled:=True;
        InterForma1.NextTab(edCVE_DOCUMENTO);
   End;
end;

procedure TwMReDocCte.ilCVE_DOCUMENTOCapture(Sender: TObject; var Show: Boolean);
begin
     Show := True;
end;

procedure TwMReDocCte.ilCVE_DOCUMENTOEjecuta(Sender: TObject);
begin

   if Objeto.Doctos.FindKey([Objeto.Apli.IdEmpresa,ilCVE_DOCUMENTO.Buffer]) then begin
        chbxCVE_DOCUMENTO.Checked:=True;
        chbxCVE_DOCUMENTO.Enabled:=True;
        InterForma1.NextTab(edCVE_DOCUMENTO);
   End;
end;

procedure TwMReDocCte.chbxF_OpeClick(Sender: TObject);
begin
    If not chbxF_Ope.Checked Then Begin
        edOpeF_INICIO.Text:='';
        edOpeF_FINAL.Text:='';
        chbxF_Ope.Checked:=False;
        chbxF_Ope.Enabled:=False;
    End;
end;
procedure TwMReDocCte.chbxTRAMITEClick(Sender: TObject);
begin
    If not chbxTRAMITE.Checked Then Begin
        Objeto.Tramite.Active:=False;
        chbxTRAMITE.Checked:=False;
        chbxTRAMITE.Enabled:=False;
    End Else Begin
        chbxTRAMITE.Checked:=True;
        chbxTRAMITE.Enabled:=True;
    End;
end;

procedure TwMReDocCte.edCVE_TRAMITEChange(Sender: TObject);
begin
    If Trim(edCVE_TRAMITE.Text)<>'' Then Begin
        chbxTRAMITE.Checked:= True;
        chbxTRAMITE.Enabled:=True;
    End Else Begin
        chbxTRAMITE.Checked:= False;
        chbxTRAMITE.Enabled:=False;
    End;
end;
procedure TwMReDocCte.chbxAutorizacionClick(Sender: TObject);
begin
    If not chbxAutorizacion.Checked Then Begin
        Objeto.Autorizacion.Active:=False;
        chbxAutorizacion.Checked:=False;
        chbxAutorizacion.Enabled:=False;
    End Else Begin
        chbxAutorizacion.Checked:=True;
        chbxAutorizacion.Enabled:=True;
    End;
end;

procedure TwMReDocCte.chbxCVE_DOCUMENTOClick(Sender: TObject);
begin
    If not chbxCVE_DOCUMENTO.Checked Then Begin
        Objeto.Doctos.Active:=False;
        chbxCVE_DOCUMENTO.Checked:=False;
        chbxCVE_DOCUMENTO.Enabled:=False;
    End Else Begin
        chbxCVE_DOCUMENTO.Checked:=True;
        chbxCVE_DOCUMENTO.Enabled:=True;
    End;
end;

procedure TwMReDocCte.InterForma1BtnPreviewClick(Sender: TObject);
begin
    ImprimeReporte(True);
end;

procedure TwMReDocCte.edOpeF_INICIOChange(Sender: TObject);
begin
    If Trim(edOpeF_INICIO.Text)<>'' Then Begin
        chbxF_Ope.Checked:=True;
        chbxF_Ope.Enabled:=True;
    End Else If Trim(edOpeF_FINAL.Text)='' Then Begin
        chbxF_Ope.Checked:=False;
        chbxF_Ope.Enabled:=False;
    End;
end;

procedure TwMReDocCte.edOpeF_FINALChange(Sender: TObject);
begin
    If Trim(edOpeF_FINAL.Text)<>'' Then Begin
        chbxF_Ope.Checked:=True;
        chbxF_Ope.Enabled:=True;
    End Else If Trim(edOpeF_INICIO.Text)='' Then Begin
        chbxF_Ope.Checked:=False;
        chbxF_Ope.Enabled:=False;
    End;
end;

procedure TwMReDocCte.InterForma1BtnImprimirClick(Sender: TObject);
begin
    ImprimeReporte(False);
end;
Procedure TwMReDocCte.ImprimeReporte(bPreview:Boolean);
Var
    sSituacion,sOrden,sGrupo:String;
    iSit:Integer;
begin
   iSit:=rgSituacion.ItemIndex;
   case iSit of
      0: sSituacion:='';
      1: sSituacion:='AC';
      2: sSituacion:='RN';
      3: sSituacion:='VE';
      4: sSituacion:='DV';
   end;

   RepDocCte(  edOpeF_INICIO.Text  , edOpeF_FINAL.Text  , edEntCF_INICIO.Text,
               edEntCF_FINAL.Text  , edACREDITADO.Text  , edCVE_TRAMITE.Text,
               edCVE_DOCUMENTO.Text, edCVE_AUTORIZA.Text, sSituacion        ,
               Objeto.Apli         , bPreview);
End;
procedure TwMReDocCte.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
      chbxACREDITADO.Checked:=True;
      chbxACREDITADO.Enabled:=True;
      InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TwMReDocCte.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMReDocCte.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMReDocCte.chbxACREDITADOClick(Sender: TObject);
begin
   If not chbxACREDITADO.Checked Then Begin
      Objeto.Acreditado.Active:=False;
      chbxACREDITADO.Checked:=False;
      chbxACREDITADO.Enabled:=False;
   End Else Begin
      chbxACREDITADO.Checked:=True;
      chbxACREDITADO.Enabled:=True;
   End;
end;

procedure TwMReDocCte.edACREDITADOChange(Sender: TObject);
begin
    If Trim(edACREDITADO.Text)<>'' Then Begin
        chbxACREDITADO.Checked:= True;
        chbxACREDITADO.Enabled:=True;
    End Else Begin
        chbxACREDITADO.Checked:= False;
        chbxACREDITADO.Enabled:=False;
    End;
end;

procedure TwMReDocCte.edCVE_DOCUMENTOChange(Sender: TObject);
begin
    If Trim(edCVE_DOCUMENTO.Text)<>'' Then Begin
        chbxCVE_DOCUMENTO.Checked:= True;
        chbxCVE_DOCUMENTO.Enabled:=True;
    End Else Begin
        chbxCVE_DOCUMENTO.Checked:= False;
        chbxCVE_DOCUMENTO.Enabled:=False;
    End;
end;

procedure TwMReDocCte.edCVE_AUTORIZAChange(Sender: TObject);
begin
    If Trim(edCVE_AUTORIZA.Text)<>'' Then Begin
        chbxAutorizacion.Checked:= True;
        chbxAutorizacion.Enabled:=True;
    End Else Begin
        chbxAutorizacion.Checked:= False;
        chbxAutorizacion.Enabled:=False;
    End;
end;

procedure TwMReDocCte.edEntCF_INICIOChange(Sender: TObject);
begin
    If Trim(edEntCF_INICIO.Text)<>'' Then Begin
        chbxF_EntC.Checked:=True;
        chbxF_EntC.Enabled:=True;
    End Else If Trim(edEntCF_FINAL.Text)='' Then Begin
        chbxF_EntC.Checked:=False;
        chbxF_EntC.Enabled:=False;
    End;
end;

procedure TwMReDocCte.edEntCF_FINALChange(Sender: TObject);
begin
    If Trim(edEntCF_FINAL.Text)<>'' Then Begin
        chbxF_EntC.Checked:=True;
        chbxF_EntC.Enabled:=True;
    End Else If Trim(edEntCF_INICIO.Text)='' Then Begin
        chbxF_EntC.Checked:=False;
        chbxF_EntC.Enabled:=False;
    End;
end;

procedure TwMReDocCte.chbxF_EntCClick(Sender: TObject);
begin
    If not chbxF_EntC.Checked Then Begin
        edEntCF_INICIO.Text:='';
        edEntCF_FINAL.Text:='';
        chbxF_EntC.Checked:=False;
        chbxF_EntC.Enabled:=False;
    End;
end;

end.

