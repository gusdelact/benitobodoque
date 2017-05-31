// Sistema         : Clase de TMReExcPen
// Fecha de Inicio : 17/05/2004
// Función forma   : Clase de TMReExcPen
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMReExcPen;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntMTramite,      //Trámite
IntCrAcredit,     //Acreditado
IntMNRiesgo,     //Nivel de Riesgo
IntUsuario,
IntParamCre
;

Type
 TMReExcPen= class;

  TwMReExcPen=Class(TForm)
    InterForma1             : TInterForma;
    GroupBox1: TGroupBox;
    dtpOpeF_INICIO: TInterDateTimePicker;
    edOpeF_INICIO: TEdit;
    lbLiqF_INICIO: TLabel;
    lbLiqF_FINAL: TLabel;
    edOpeF_FINAL: TEdit;
    dtpOpeF_FINAL: TInterDateTimePicker;
    GroupBox2: TGroupBox;
    lbComF_INICIO: TLabel;
    lbComF_FINAL: TLabel;
    dtpComF_INICIO: TInterDateTimePicker;
    edComF_INICIO: TEdit;
    edComF_FINAL: TEdit;
    dtpComF_FINAL: TInterDateTimePicker;
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
    chbxNVL_RIESGO: TCheckBox;
    edNOM_AUTORIZA: TEdit;
    btAutoriza: TBitBtn;
    edCVE_AUTORIZA: TInterEdit;
    ilAutoriza: TInterLinkit;
    edCVE_NVL_RIESGO: TEdit;
    btCVE_NVL_RIESGO: TBitBtn;
    edDESC_NVL_RIESGO: TEdit;
    ilNVL_RIESGO: TInterLinkit;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    dtpRegF_INICIO: TInterDateTimePicker;
    edRegF_INICIO: TEdit;
    edRegF_FINAL: TEdit;
    dtpRegF_FINAL: TInterDateTimePicker;
    Label4: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    chbxACREDITADO: TCheckBox;
    chbxF_Com: TCheckBox;
    chbxF_Reg: TCheckBox;
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
    procedure btCVE_NVL_RIESGOClick(Sender: TObject);
    procedure ilNVL_RIESGOCapture(Sender: TObject; var Show: Boolean);
    procedure ilNVL_RIESGOEjecuta(Sender: TObject);
    procedure chbxF_OpeClick(Sender: TObject);
    procedure chbxF_ComClick(Sender: TObject);
    procedure chbxTRAMITEClick(Sender: TObject);
    procedure edCVE_TRAMITEChange(Sender: TObject);
    procedure chbxAutorizacionClick(Sender: TObject);
    procedure chbxNVL_RIESGOClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure edOpeF_INICIOChange(Sender: TObject);
    procedure edOpeF_FINALChange(Sender: TObject);
    procedure edComF_INICIOChange(Sender: TObject);
    procedure edComF_FINALChange(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure chbxF_RegClick(Sender: TObject);
    procedure edRegF_INICIOChange(Sender: TObject);
    procedure edRegF_FINALChange(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure chbxACREDITADOClick(Sender: TObject);
    procedure edACREDITADOChange(Sender: TObject);
    procedure edCVE_AUTORIZAChange(Sender: TObject);
    procedure edCVE_NVL_RIESGOChange(Sender: TObject);
    private
    { Private declarations }
        Procedure ImprimeReporte(bPreview:Boolean);
    public
    { Public declarations }
    Objeto : TMReExcPen;
end;
 TMReExcPen= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        Tramite                  : TMTramite;
        Acreditado               : TCrAcredit;
        Autorizacion             : TUsuario;
        NRiesgo                  : TMNRiesgo;
        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;



implementation
Uses IntMQrExcPen;

{$R *.DFM}


constructor TMReExcPen.Create( AOwner : TComponent );
begin Inherited;
      Tramite := TMTramite.Create(Self);
      Tramite.MasterSource:=Self;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      Autorizacion := TUsuario.Create(Self);
      Autorizacion.MasterSource:=Self;

      NRiesgo := TMNRiesgo.Create(Self);
      NRiesgo.MasterSource:=Self;

      UseQuery := False;
      HelpFile := 'IntMReExcPen.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMReExcPen.Destroy;
begin
   if Tramite <> nil then
      Tramite.Free;
   If Acreditado <> Nil Then
      Acreditado.Free;
   if Autorizacion <> nil then
      Autorizacion.Free;
   if NRiesgo <> nil then
      NRiesgo.Free;
   inherited;
end;


function TMReExcPen.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMReExcPen;
begin
   W:=TwMReExcPen.Create(Self);
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


Function TMReExcPen.InternalBusca:Boolean;
begin InternalBusca := False;

end;

function TMReExcPen.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)

procedure TwMReExcPen.FormShow(Sender: TObject);
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
   Objeto.Acreditado.GetParams(Objeto);
   edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
   edNOMBRE_ACRED.ShowHint := True;

   Objeto.Autorizacion.CVE_USUARIO.Control := edCVE_AUTORIZA;
   Objeto.Autorizacion.EMPLEADO.Persona.Nombre.Control := edNOM_AUTORIZA;

   Objeto.NRiesgo.CVE_NVL_RIESGO.Control := edCVE_NVL_RIESGO;
   Objeto.NRiesgo.DESC_NVL_RIESGO.Control := edDESC_NVL_RIESGO;
   Objeto.NRiesgo.GetParams(Objeto);

   dtpOpeF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   dtpOpeF_FINAL.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   dtpRegF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   dtpRegF_FINAL.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   dtpComF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   dtpComF_FINAL.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
end;

procedure TwMReExcPen.FormDestroy(Sender: TObject);
begin
   Objeto.Tramite.CVE_TRAMITE.Control := nil;
   Objeto.Tramite.DESC_C_TRAMITE.Control := nil;
   Objeto.Acreditado.ID_ACREDITADO.Control := nil;
   Objeto.Acreditado.Persona.Nombre.Control := nil;
   Objeto.Autorizacion.CVE_USUARIO.Control := Nil;
   Objeto.Autorizacion.EMPLEADO.Persona.Nombre.Control := Nil;
   Objeto.NRiesgo.CVE_NVL_RIESGO.Control := Nil;
   Objeto.NRiesgo.DESC_NVL_RIESGO.Control := Nil;
end;

procedure TwMReExcPen.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMReExcPen.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMReExcPen.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWNinguno.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TwMReExcPen.btTRAMITEClick(Sender: TObject);
begin
    Objeto.Tramite.ShowAll := True;
    if Objeto.Tramite.Busca then begin
        chbxTRAMITE.Checked:=True;
        chbxTRAMITE.Enabled:=True;
        InterForma1.NextTab(edCVE_TRAMITE);
    End;
end;

procedure TwMReExcPen.ilTRAMITECapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMReExcPen.ilTRAMITEEjecuta(Sender: TObject);
begin
   If Objeto.Tramite.FindKey([Objeto.Apli.IdEmpresa,ilTRAMITE.Buffer]) then begin
      chbxTRAMITE.Checked:=True;
      chbxTRAMITE.Enabled:=True;
      InterForma1.NextTab(edCVE_TRAMITE);
   End;
end;

procedure TwMReExcPen.btAutorizaClick(Sender: TObject);
begin
   Objeto.Autorizacion.ShowAll := True;
   if Objeto.Autorizacion.Busca then begin
        chbxAutorizacion.Checked:=True;
        chbxAutorizacion.Enabled:=True;
        InterForma1.NextTab(btAutoriza);
   End;
end;

procedure TwMReExcPen.ilAutorizaCapture(Sender: TObject;
  var Show: Boolean);
begin
    Show := True;
end;

procedure TwMReExcPen.ilAutorizaEjecuta(Sender: TObject);
begin
   if Objeto.Autorizacion.FindKey([ilAutoriza.Buffer]) then begin
        chbxAutorizacion.Checked:=True;
        chbxAutorizacion.Enabled:=True;
        InterForma1.NextTab(edCVE_AUTORIZA);
   End;
end;

procedure TwMReExcPen.btCVE_NVL_RIESGOClick(Sender: TObject);
begin
   Objeto.NRiesgo.ShowAll := True;
   if Objeto.NRiesgo.Busca then begin
        chbxNVL_RIESGO.Checked:=True;
        chbxNVL_RIESGO.Enabled:=True;
        InterForma1.NextTab(edCVE_NVL_RIESGO);
   End;
end;

procedure TwMReExcPen.ilNVL_RIESGOCapture(Sender: TObject; var Show: Boolean);
begin
     Show := True;
end;

procedure TwMReExcPen.ilNVL_RIESGOEjecuta(Sender: TObject);
begin
   if Objeto.NRiesgo.FindKey([ilNVL_RIESGO.Buffer]) then begin
        chbxNVL_RIESGO.Checked:=True;
        chbxNVL_RIESGO.Enabled:=True;
        InterForma1.NextTab(edCVE_NVL_RIESGO);
   End;
end;

procedure TwMReExcPen.chbxF_OpeClick(Sender: TObject);
begin
    If not chbxF_Ope.Checked Then Begin
        edOpeF_INICIO.Text:='';
        edOpeF_FINAL.Text:='';
        chbxF_Ope.Checked:=False;
        chbxF_Ope.Enabled:=False;
    End;
end;
procedure TwMReExcPen.chbxF_ComClick(Sender: TObject);
begin
    If not chbxF_Com.Checked Then Begin
        edComF_INICIO.Text:='';
        edComF_FINAL.Text:='';
        chbxF_Com.Checked:=False;
        chbxF_Com.Enabled:=false;
    End;
end;

procedure TwMReExcPen.chbxTRAMITEClick(Sender: TObject);
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

procedure TwMReExcPen.edCVE_TRAMITEChange(Sender: TObject);
begin
    If Trim(edCVE_TRAMITE.Text)<>'' Then Begin
        chbxTRAMITE.Checked:= True;
        chbxTRAMITE.Enabled:=True;
    End Else Begin
        chbxTRAMITE.Checked:= False;
        chbxTRAMITE.Enabled:=False;
    End;
end;
procedure TwMReExcPen.chbxAutorizacionClick(Sender: TObject);
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

procedure TwMReExcPen.chbxNVL_RIESGOClick(Sender: TObject);
begin
    If not chbxNVL_RIESGO.Checked Then Begin
        Objeto.NRiesgo.Active:=False;
        chbxNVL_RIESGO.Checked:=False;
        chbxNVL_RIESGO.Enabled:=False;
    End Else Begin
        chbxNVL_RIESGO.Checked:=True;
        chbxNVL_RIESGO.Enabled:=True;
    End;
end;

procedure TwMReExcPen.InterForma1BtnPreviewClick(Sender: TObject);
begin
    ImprimeReporte(True);
end;

procedure TwMReExcPen.edOpeF_INICIOChange(Sender: TObject);
begin
    If Trim(edOpeF_INICIO.Text)<>'' Then Begin
        chbxF_Ope.Checked:=True;
        chbxF_Ope.Enabled:=True;
    End Else If Trim(edOpeF_FINAL.Text)='' Then Begin
        chbxF_Ope.Checked:=False;
        chbxF_Ope.Enabled:=False;
    End;
end;

procedure TwMReExcPen.edOpeF_FINALChange(Sender: TObject);
begin
    If Trim(edOpeF_FINAL.Text)<>'' Then Begin
        chbxF_Ope.Checked:=True;
        chbxF_Ope.Enabled:=True;
    End Else If Trim(edOpeF_INICIO.Text)='' Then Begin
        chbxF_Ope.Checked:=False;
        chbxF_Ope.Enabled:=False;
    End;
end;

procedure TwMReExcPen.edComF_INICIOChange(Sender: TObject);
begin
    If Trim(edComF_INICIO.Text)<>'' Then Begin
        chbxF_Com.Checked:=True;
        chbxF_Com.Enabled:=True;
    End Else If Trim(edComF_FINAL.Text)='' Then Begin
        chbxF_Com.Checked:=False;
        chbxF_Com.Enabled:=false;
    End;
end;

procedure TwMReExcPen.edComF_FINALChange(Sender: TObject);
begin
    If Trim(edComF_FINAL.Text)<>'' Then Begin
        chbxF_Com.Checked:=True;
        chbxF_Com.Enabled:=True;
    End Else If Trim(edComF_INICIO.Text)='' Then Begin
        chbxF_Com.Checked:=False;
        chbxF_Com.Enabled:=false;
    End;
end;

procedure TwMReExcPen.InterForma1BtnImprimirClick(Sender: TObject);
begin
    ImprimeReporte(False);
end;
Procedure TwMReExcPen.ImprimeReporte(bPreview:Boolean);
Var
    sSituacion,sOrden,sGrupo:String;
    iSit:Integer;
begin
   iSit:=rgSituacion.ItemIndex;
   case iSit of
      0: sSituacion:='';
      1: sSituacion:='AC';
      2: sSituacion:='SO';
   end;

   RepExcepciones(edOpeF_INICIO.Text , edOpeF_FINAL.Text , edRegF_INICIO.Text ,
                 edRegF_FINAL.Text    , edComF_INICIO.Text, edComF_FINAL.Text  ,
                 edCVE_TRAMITE.Text   , edACREDITADO.Text , edCVE_AUTORIZA.Text,
                 edCVE_NVL_RIESGO.Text, sSituacion        ,Objeto.Apli         ,
                 bPreview);
End;
procedure TwMReExcPen.chbxF_RegClick(Sender: TObject);
begin
    If not chbxF_Reg.Checked Then Begin
        edRegF_INICIO.Text:='';
        edRegF_FINAL.Text:='';
        chbxF_Reg.Checked:=False;
        chbxF_Reg.Enabled:=false;
    End;
end;

procedure TwMReExcPen.edRegF_INICIOChange(Sender: TObject);
begin
    If Trim(edRegF_INICIO.Text)<>'' Then Begin
        chbxF_Reg.Checked:=True;
        chbxF_Reg.Enabled:=True;
    End Else If Trim(edRegF_FINAL.Text)='' Then Begin
        chbxF_Reg.Checked:=False;
        chbxF_Reg.Enabled:=false;
    End;
end;

procedure TwMReExcPen.edRegF_FINALChange(Sender: TObject);
begin
    If Trim(edRegF_FINAL.Text)<>'' Then Begin
        chbxF_Reg.Checked:=True;
        chbxF_Reg.Enabled:=True;
    End Else If Trim(edRegF_INICIO.Text)='' Then Begin
        chbxF_Reg.Checked:=False;
        chbxF_Reg.Enabled:=false;
    End;
end;

procedure TwMReExcPen.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
      chbxACREDITADO.Checked:=True;
      chbxACREDITADO.Enabled:=True;
      InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TwMReExcPen.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMReExcPen.ilACREDITADOEjecuta(Sender: TObject);
begin
   If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
      chbxACREDITADO.Checked:=True;
      chbxACREDITADO.Enabled:=True;
      InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TwMReExcPen.chbxACREDITADOClick(Sender: TObject);
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

procedure TwMReExcPen.edACREDITADOChange(Sender: TObject);
begin
    If Trim(edACREDITADO.Text)<>'' Then Begin
        chbxACREDITADO.Checked:= True;
        chbxACREDITADO.Enabled:=True;
    End Else Begin
        chbxACREDITADO.Checked:= False;
        chbxACREDITADO.Enabled:=False;
    End;
end;

procedure TwMReExcPen.edCVE_AUTORIZAChange(Sender: TObject);
begin
    If Trim(edCVE_AUTORIZA.Text)<>'' Then Begin
        chbxAutorizacion.Checked:= True;
        chbxAutorizacion.Enabled:=True;
    End Else Begin
        chbxAutorizacion.Checked:= False;
        chbxAutorizacion.Enabled:=False;
    End;
end;

procedure TwMReExcPen.edCVE_NVL_RIESGOChange(Sender: TObject);
begin
    If Trim(edCVE_NVL_RIESGO.Text)<>'' Then Begin
        chbxNVL_RIESGO.Checked:= True;
        chbxNVL_RIESGO.Enabled:=True;
    End Else Begin
        chbxNVL_RIESGO.Checked:= False;
        chbxNVL_RIESGO.Enabled:=False;
    End;
end;

end.

