// Sistema         :
// Fecha de Inicio :
// Función forma   :
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMSegGar;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,InterEdit,

IntParamCre,      // Parámetros Crédito
IntCrAcredit,     // Acreditado
IntMRegistro,
IntMQrSegGar;

Type
 TMSegGar= class;

  TwMSegGar=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label5: TLabel;
    btNumGar: TBitBtn;
    cbxNumGar: TCheckBox;
    ilID_SOLICITUD: TInterLinkit;
    GroupBox1: TGroupBox;
    lbLiqF_INICIO: TLabel;
    Label1: TLabel;
    edF_Inicio: TEdit;
    dtpF_Inicio: TInterDateTimePicker;
    edF_FIN: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    Label2: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    chbxAcreditado: TCheckBox;
    Label6: TLabel;
    edID_SOLICITUD: TInterEdit;
    edCVE_GARANTIA: TEdit;
    edNOM_ID_SOLICITUD: TEdit;
    edNumPoliza: TEdit;
    Label7: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    SaveDialog1: TSaveDialog;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure btNumGarClick(Sender: TObject);
    procedure cbxNumGarClick(Sender: TObject);
    procedure ilID_SOLICITUDCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_SOLICITUDEjecuta(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    private
    { Private declarations }
     procedure EnableCheckBox(var CheckBox : TCheckBox);
     procedure ImprimeReporte(bPreview : Boolean);
    public
    { Public declarations }
    Objeto : TMSegGar;
    end;

 TMSegGar= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        MRegistro        : TMRegistro;
        ParamCre         : TParamCre;
        Acreditado       : TCrAcredit;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMSegGar.Create( AOwner : TComponent );
begin Inherited;
      MRegistro := TMRegistro.Create(Self);
      MRegistro.MasterSource:=Self;
      MRegistro.FieldByName('ID_SOLICITUD').MasterField:='ID_SOLICITUD';

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'InTMSegGar.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMSegGar.Destroy;
begin
   if MRegistro <> nil then
      MRegistro.Free;
   if Acreditado <> nil then
      Acreditado.Free;
   inherited;
end;


function TMSegGar.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMSegGar;
begin
   W:=TwMSegGar.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TMSegGar.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IMRepGarAc.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TMSegGar.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA ********************)
(*                                                                              *)
(*  FORMA
(*                                                                              *)
(***********************************************FORMA ********************)

procedure TwMSegGar.FormShow(Sender: TObject);
begin
   With Objeto Do Begin

      MRegistro.ID_SOLICITUD.Control := edID_SOLICITUD;
      MRegistro.CVE_GARANTIA.Control := edCVE_GARANTIA;
      MRegistro.Garantia.DESC_GARANTIA.Control := edNOM_ID_SOLICITUD;
      MRegistro.GetParams(Objeto);

      Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Acreditado.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;

      dtpF_Inicio.DateTime:= Objeto.Apli.DameFechaEmpresa;
      dtpF_Fin.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edF_Inicio.text:=FormatDateTime('dd/mm/yyyy',dtpF_Inicio.DateTime);
      edF_FIN.text:=FormatDateTime('dd/mm/yyyy',dtpF_Fin.DateTime);

      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;
   End;
end;

procedure TwMSegGar.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      MRegistro.ID_SOLICITUD.Control := Nil;
      MRegistro.CVE_GARANTIA.Control := Nil;
      MRegistro.Garantia.DESC_GARANTIA.Control := Nil;
      Acreditado.ID_ACREDITADO.Control := nil;
      Acreditado.Persona.Nombre.Control := nil;
   End;
end;

procedure TwMSegGar.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMSegGar.EnableCheckBox(var CheckBox : TCheckBox);
begin
    If Not CheckBox.Checked Then Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;
    End Else Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;

procedure TwMSegGar.ImprimeReporte(bPreview : Boolean);
begin

   RepSeguroGar( edF_Inicio.Text, edF_Fin.Text, edACREDITADO.Text,
                 edNumPoliza.Text, edID_SOLICITUD.Text, edNbrArch.Text,
                 Objeto.Apli, bPreview );
   If Trim(edNbrArch.Text)<>'' Then Begin
      If bGenArch Then
        ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
      Else
        ShowMessage('No se generó el Archivo')
   End;
End;

procedure TwMSegGar.InterForma1BtnImprimirClick(Sender: TObject);
begin
   ImprimeReporte(False);
end;

procedure TwMSegGar.InterForma1BtnPreviewClick(Sender: TObject);
begin
   ImprimeReporte(True);
end;

procedure TwMSegGar.btNumGarClick(Sender: TObject);
begin
   {Objeto.MRegistro.ShowAll := True;
   If Objeto.MRegistro.Busca Then Begin
      Objeto..BIEN_ASEGURADO.AsString:= Objeto.MRegistro.Garantia.DESC_GARANTIA.AsString;
      InterForma1.NextTab(edID_SOLICITUD);
   End;}

   With Objeto Do Begin
      MRegistro.ShowAll := True;
      If MRegistro.Busca Then Begin
         cbxNumGar.Checked:= True;
         cbxNumGar.Enabled:= True;
         InterForma1.NextTab(edID_SOLICITUD);
      End;
   End;

end;

procedure TwMSegGar.cbxNumGarClick(Sender: TObject);
begin
   EnableCheckBox(cbxNumGar);
   Objeto.MRegistro.Active := cbxNumGar.Checked;
end;

procedure TwMSegGar.ilID_SOLICITUDCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMSegGar.ilID_SOLICITUDEjecuta(Sender: TObject);
begin
   If Objeto.MRegistro.FindKey([ilID_SOLICITUD.Buffer]) Then Begin
      cbxNumGar.Checked:=True;
      cbxNumGar.Enabled:=True;
      InterForma1.NextTab(edID_SOLICITUD);
   End;
end;

procedure TwMSegGar.btACREDITADOClick(Sender: TObject);
begin
   With Objeto Do Begin
      Acreditado.ShowAll := True;
      If Acreditado.Busca Then Begin
         chbxAcreditado.Checked:= True;
         chbxAcreditado.Enabled:= True;
         InterForma1.NextTab(edACREDITADO);
      End;
   End;
end;

procedure TwMSegGar.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMSegGar.ilACREDITADOEjecuta(Sender: TObject);
begin
   If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
      chbxAcreditado.Checked:=True;
      chbxAcreditado.Enabled:=True;
      InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TwMSegGar.chbxAcreditadoClick(Sender: TObject);
begin
   EnableCheckBox(chbxAcreditado);
   Objeto.Acreditado.Active := chbxAcreditado.Checked;
end;

procedure TwMSegGar.sbExcelClick(Sender: TObject);
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

procedure TwMSegGar.cbxArchivoClick(Sender: TObject);
begin
   If not cbxArchivo.Checked Then Begin
      edNbrArch.Text:= '';
      cbxArchivo.Checked:=False;
      cbxArchivo.Enabled:=False;
   End Else Begin
      cbxArchivo.Checked:=True;
      cbxArchivo.Enabled:=True;
   End;
end;

procedure TwMSegGar.edNbrArchChange(Sender: TObject);
begin
   If Trim(edNbrArch.Text)<>'' Then Begin
      cbxArchivo.Checked:=True;
      cbxArchivo.Enabled:=True;
   End Else Begin
      cbxArchivo.Checked:=False;
      cbxArchivo.Enabled:=False;
   End;
end;

end.
