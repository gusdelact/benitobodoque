// Sistema         : Clase de CnsAdTo
// Fecha de Inicio : 29/09/2011
// Función forma   : Clase de CnsAdTo
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCnsadto;                          
                            
interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntMon,           //Moneda
IntCrGrupEco,     //Grupo Económico
IntPers,          //PERSONA
IntQrConAdeTot,
IntParamCre, IntLinkit;

Type
 TCnsadto= class;

  TWCnsadto=Class(TForm)
    Label9: TLabel;
    edFECHA: TEdit;
    dtpFecha: TInterDateTimePicker;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    lbID_PROMOTOR: TLabel;
    Label2: TLabel;
    edID_ACREDITADO: TEdit;
    edCVE_GRUPO_ECO: TEdit;
    btCVE_MONEDA: TBitBtn;
    btCVE_GRUPO_ECO: TBitBtn;
    btID_ACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    edDESC_AGRUPO_ECO: TEdit;
    edDESC_MONEDA: TEdit;
    cbMoneda: TCheckBox;
    cbCVE_GRUPO_ECO: TCheckBox;
    cbAcreditado: TCheckBox;
    lbAplica: TLabel;
    ilMONEDA: TInterLinkit;
    ilCVE_GRUPO_ECO: TInterLinkit;
    ilACREDITADO: TInterLinkit;
    Label4: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    SaveDialog1: TSaveDialog;
    InterForma1: TInterForma;
    cbxArchivo: TCheckBox;
    Label32: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure btCVE_GRUPO_ECOClick(Sender: TObject);
    procedure ilCVE_GRUPO_ECOEjecuta(Sender: TObject);
    procedure btID_ACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure cbMonedaClick(Sender: TObject);
    procedure cbCVE_GRUPO_ECOClick(Sender: TObject);
    procedure cbAcreditadoClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    private
    { Private declarations }
     procedure EnableCheckBox(var CheckBox : TCheckBox);
     procedure ImprimeReporte(bPreview : Boolean);
    public
    { Public declarations }

    Objeto : TCnsadto;
end;

 TCnsadto= class(TInterFrame)
    private
    protected
    public
      ParamCre    : TParamCre;
      Moneda      : TMoneda;
      CrGrupEco   : TCrGrupEco;
      Persona     : TPersona;
      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      function    Reporte:Boolean; override;
      published
 end;

implementation
//Uses RepMon;

{$R *.DFM}

constructor TCnsadto.Create( AOwner : TComponent );
begin Inherited;
   Moneda := TMoneda.Create(Self);
   Moneda.MasterSource:=Self;

   CrGrupEco:= TCrGrupEco.Create(Self);
   CrGrupEco.MasterSource:=Self;

   Persona := TPersona.Create(Self);
   Persona.MasterSource := Self;

   StpName  := ' ';
   UseQuery := False;
   HelpFile := 'IntCnsadto.Hlp';
   ShowMenuReporte:=True;
end;

Destructor TCnsadto.Destroy;
begin

  If Moneda    <> Nil Then Moneda.Free;
  If CrGrupEco <> Nil Then CrGrupEco.Free;
  If Persona   <> Nil Then Persona.Free;
  inherited;
end;


function TCnsadto.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCnsadto;
begin
   W:=TWCnsadto.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := ftImprimir; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow                  := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


{
Function TCnsadto.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICnsadto.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;
}

function TCnsadto.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CnsAdTo********************)
(*                                                                              *)
(*  FORMA DE CnsAdTo                                                            *)
(*                                                                              *)
(***********************************************FORMA CnsAdTo********************)

procedure TWCnsadto.EnableCheckBox(var CheckBox : TCheckBox);
begin
    If Not CheckBox.Checked Then Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;
    End Else Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;

procedure TWCnsadto.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := Objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := Objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := Objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := Objeto.ParamCre.PERFIL.AsString;

   Objeto.Moneda.Cve_Moneda.Control         := edCVE_MONEDA;
   Objeto.Moneda.Desc_Moneda.Control        := edDESC_MONEDA;

   Objeto.CrGrupEco.CVE_GRUPO_ECO.Control   := edCVE_GRUPO_ECO;
   Objeto.CrGrupEco.DESC_AGRUPO_ECO.Control := edDESC_AGRUPO_ECO;

   Objeto.Persona.Id_Persona.Control        := edID_ACREDITADO;
   Objeto.Persona.Nombre.Control            := edNOMBRE_ACRED;

end;

procedure TWCnsadto.FormDestroy(Sender: TObject);
begin
   Objeto.Moneda.Cve_Moneda.Control        :=Nil;
   Objeto.Moneda.Desc_Moneda.Control       :=Nil;

   Objeto.CrGrupEco.CVE_GRUPO_ECO.Control  :=Nil;
   Objeto.CrGrupEco.DESC_AGRUPO_ECO.Control:=Nil;

   Objeto.Persona.Id_Persona.Control       :=Nil;
   Objeto.Persona.Nombre.Control           :=Nil
end;

procedure TWCnsadto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCnsadto.ilMONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
      cbMoneda.Checked:=True;
      cbMoneda.Enabled:=True;
   End
   else
   begin
      cbMoneda.Checked:=False;
      cbMoneda.Enabled:=False;
      edDESC_MONEDA.Text:='';
   end;
end;

procedure TWCnsadto.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
      cbMoneda.Checked:= True;
      cbMoneda.Enabled:= True;
   End;
end;

procedure TWCnsadto.btCVE_GRUPO_ECOClick(Sender: TObject);
begin
   Objeto.CrGrupEco.ShowAll := True;
   if Objeto.CrGrupEco.Busca then Begin
      cbCVE_GRUPO_ECO.Checked:= True;
      cbCVE_GRUPO_ECO.Enabled:= True;
   End;
end;

procedure TWCnsadto.ilCVE_GRUPO_ECOEjecuta(Sender: TObject);
begin
   If Objeto.CrGrupEco.FindKey([ilCVE_GRUPO_ECO.Buffer]) Then Begin
      cbCVE_GRUPO_ECO.Checked:=True;
      cbCVE_GRUPO_ECO.Enabled:=True;
   End
   else
   begin
      cbCVE_GRUPO_ECO.Checked:=False;
      cbCVE_GRUPO_ECO.Enabled:=False;
      edDESC_AGRUPO_ECO.Text:='';      
   end;
end;

procedure TWCnsadto.btID_ACREDITADOClick(Sender: TObject);
begin
   Objeto.Persona.ShowAll := True;
   If Objeto.Persona.Busca Then Begin
      cbAcreditado.Checked:= True;
      cbAcreditado.Enabled:= True;
   End;
end;

procedure TWCnsadto.ilACREDITADOEjecuta(Sender: TObject);
begin
   If Objeto.Persona.FindKey([ilACREDITADO.Buffer]) Then Begin
      cbAcreditado.Checked:=True;
      cbAcreditado.Enabled:=True;
   End
   else
   begin
      cbAcreditado.Checked:=False;
      cbAcreditado.Enabled:=False;
      edNOMBRE_ACRED.Text:='';
   end;
end;

procedure TWCnsadto.cbMonedaClick(Sender: TObject);
begin
   EnableCheckBox(cbMoneda);
   Objeto.Moneda.Active := cbMoneda.Checked;
end;

procedure TWCnsadto.cbCVE_GRUPO_ECOClick(Sender: TObject);
begin
   EnableCheckBox(cbCVE_GRUPO_ECO);
   Objeto.CrGrupEco.Active := cbCVE_GRUPO_ECO.Checked;
end;

procedure TWCnsadto.cbAcreditadoClick(Sender: TObject);
begin
   EnableCheckBox(cbAcreditado);
   Objeto.Persona.Active := cbAcreditado.Checked;
end;

procedure TWCnsadto.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCNSADTO_IMPRI',True,True) then
      ImprimeReporte(False);
end;

procedure TWCnsadto.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCNSADTO_PREVI',True,True) then
      ImprimeReporte(True);
end;

procedure TWCnsadto.sbExcelClick(Sender: TObject);
var sExt:String;
begin
  If SaveDialog1.Execute Then Begin
      sExt:= copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-3,Length(SaveDialog1.FileName));
      If  UpperCase(sExt)= '.PRN' Then
         edNbrArch.Text := SaveDialog1.FileName
      Else
         edNbrArch.Text := SaveDialog1.FileName + '.prn';
  End Else
    edNbrArch.Text := '';

end;

procedure TWCnsadto.edNbrArchChange(Sender: TObject);
begin
    If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End Else Begin
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End;
end;

procedure TwCnsadto.ImprimeReporte(bPreview : Boolean);
var i:integer;
begin
   if Trim(edFECHA.Text)<>'' then
   begin
      RepConsolidAdeudo(edCVE_MONEDA.Text,edCVE_GRUPO_ECO.Text,edID_ACREDITADO.Text,edNbrArch.Text,StrToDate(edFECHA.Text),Objeto.Apli,bPreview);
      If Trim(edNbrArch.Text)<>'' Then Begin
         If bGenArch Then
            ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
         Else
            ShowMessage('No se generó el Archivo')
      End;
   end
   else
     ShowMessage('Seleccione una fecha');
End;


end.
