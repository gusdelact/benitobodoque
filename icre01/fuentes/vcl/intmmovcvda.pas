// Sistema         : Clase de MMovCVda
// Fecha de Inicio : 01/08/2012
// Función forma   : Clase de MMovCVda
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntMmovcvda;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,

IntGenCre,
IntPers,          //Persona
IntCrCredito,     //Disposición
IntParamCre,
IntMon,           //Moneda
IntCtto,          //Autorización
IntQrMovCartVda   //Reporte
;

Type
 TMmovcvda= class; 

  TWMmovcvda=Class(TForm)
    InterForma1             : TInterForma;
    cbGenArchExcel: TCheckBox;
    edRuta: TEdit;
    SaveDialog1: TSaveDialog;
    sbtnExcel: TSpeedButton;
    Label10: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lbAplica: TLabel;
    Label1: TLabel;
    lblCVE_MONEDA: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    Label11: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    chbxAcreditado: TCheckBox;
    edCVE_MONEDA: TEdit;
    btnCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    cbCVE_MONEDA: TCheckBox;
    edDESC_ID_CREDITO: TEdit;
    chbxAutorizacion: TCheckBox;
    btCVE_PRODUCTO_CRE: TBitBtn;
    edDESC_PRODUCTO: TEdit;
    edID_CONTRATO: TEdit;
    btID_CONTRATO: TBitBtn;
    edDESC_AUTORIZACION: TEdit;
    btCTA_ORIGEN: TBitBtn;
    chbxproducto: TCheckBox;
    btID_CREDITO: TBitBtn;
    edID_CREDITO: TEdit;
    edCVE_PRODUCTO: TEdit;
    edDESC_CAT_MINIMO: TEdit;
    chbxCatMinimo: TCheckBox;
    cbID_CREDITO: TCheckBox;
    edCVE_CAT_MINIMO: TEdit;
    rgBancaria: TRadioGroup;
    btCVE_PRESUPUESTO: TBitBtn;
    edCVE_PRESUPUESTO: TEdit;
    edDESC_PRESUPUESTO: TEdit;
    chbxPresupuesto: TCheckBox;
    ilACREDITADO: TInterLinkit;
    ilID_CONTRATO: TInterLinkit;
    ilCVE_MONEDA: TInterLinkit;
    GroupBox1: TGroupBox;
    lbLiqF_INICIO: TLabel;
    Label4: TLabel;
    edF_INICIO: TEdit;
    dtpF_Ini: TInterDateTimePicker;
    edF_FINAL: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure btnCVE_MONEDAClick(Sender: TObject);
    procedure ilCVE_MONEDAEjecuta(Sender: TObject);
    procedure ilID_CONTRATOEjecuta(Sender: TObject);
    procedure btCVE_PRESUPUESTOClick(Sender: TObject);
    procedure btCVE_PRODUCTO_CREClick(Sender: TObject);
    procedure btCTA_ORIGENClick(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure cbCVE_MONEDAClick(Sender: TObject);
    procedure chbxAutorizacionClick(Sender: TObject);
    procedure chbxPresupuestoClick(Sender: TObject);
    procedure chbxproductoClick(Sender: TObject);
    procedure chbxCatMinimoClick(Sender: TObject);
    procedure cbID_CREDITOClick(Sender: TObject);
    procedure cbGenArchExcelClick(Sender: TObject);
    procedure sbtnExcelClick(Sender: TObject);
    procedure InterForma1Preview(Sender: TObject);
    procedure InterForma1Imprimir(Sender: TObject);
    procedure GeneraNomArch;    
    private
    { Private declarations }
       Procedure ImprimeReporte(bPreview:Boolean);    
    public
    { Public declarations }
    Objeto : TMmovcvda;
end;
 TMmovcvda= class(TInterFrame)
      private
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        //CAMPO1                   : TInterCampo;
        Persona                  : TPersona;
        Credito                  : TCrCredito;//Disposición
        ParamCre                 : TParamCre;
        Moneda                   : TMoneda;
        Contrato                 : TContrato;
        
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

constructor TMmovcvda.Create( AOwner : TComponent ); 
begin Inherited;
      Persona := TPersona.Create(Self);
      Persona.MasterSource := Self;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;

      Contrato := TContrato.Create(Self);
      Contrato.MasterSource:=Self;

      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntMmovcvda.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMmovcvda.Destroy;
begin
   if Persona <> nil then
      Persona.Free;
   if Credito <> nil then
      Credito.Free;
   if Moneda <> nil then
      Moneda.Free;
   if Contrato <> nil then
      Contrato.Free;
   inherited;
end;

function TMmovcvda.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMmovcvda;
begin
   W:=TWMmovcvda.Create(Self);
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

Function TMmovcvda.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IMmovcvd.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TMmovcvda.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;

(***********************************************FORMA MMovCVda********************)
(*                                                                              *)
(*  FORMA DE MMovCVda                                                            *)
(*                                                                              *)
(***********************************************FORMA MMovCVda********************)

procedure TWMmovcvda.FormShow(Sender: TObject);
begin
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

  dtpF_Ini.DateTime := DameIniMes(Objeto.Apli.DameFechaEmpresa);
  edF_INICIO.Text := FormatDateTime('dd/mm/yyyy',dtpF_Ini.DateTime);

  dtpF_Fin.DateTime := Objeto.Apli.DameFechaEmpresa;
  edF_FINAL.text:=FormatDateTime('dd/mm/yyyy',dtpF_Fin.DateTime);

  Objeto.Persona.Id_Persona.Control := edACREDITADO;
  Objeto.Persona.Nombre.Control := edNOMBRE_ACRED;
  Objeto.GetParams(Objeto);
  edNOMBRE_ACRED.Hint := Objeto.Persona.Nombre.AsString;
  edNOMBRE_ACRED.ShowHint := True;

  Objeto.Moneda.CVE_MONEDA.Control := edCVE_MONEDA;
  Objeto.Moneda.DESC_MONEDA.Control := edDESC_MONEDA;
  Objeto.Moneda.GetParams(Objeto);

  Objeto.Contrato.ID_CONTRATO.Control := edID_CONTRATO;
  Objeto.Contrato.TITNOMBRE.Control := edDESC_AUTORIZACION;
  Objeto.Contrato.Titular.Nombre.Control := edDESC_AUTORIZACION;
  Objeto.Contrato.GetParams(Objeto);
end;

procedure TWMmovcvda.FormDestroy(Sender: TObject);
begin
  Objeto.Persona.Id_Persona.Control := nil;
  Objeto.Persona.Nombre.Control := nil;
  Objeto.Moneda.CVE_MONEDA.Control := nil;
  Objeto.Moneda.DESC_MONEDA.Control := nil;
  Objeto.Contrato.ID_CONTRATO.Control := nil;
  Objeto.Contrato.TITNOMBRE.Control := nil;
  Objeto.Contrato.Titular.Nombre.Control := nil;
end;

procedure TWMmovcvda.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMmovcvda.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWMmovcvda.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWMmovcvda.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Persona.ShowAll := True;
   If Objeto.Persona.Busca Then Begin
        chbxAcreditado.Enabled:=True;
        chbxAcreditado.Checked:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TWMmovcvda.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Persona.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TWMmovcvda.btnCVE_MONEDAClick(Sender: TObject);
begin
  With Objeto Do
    Begin
    Moneda.ShowAll := True;
    If Moneda.Busca Then
       Begin
       cbCVE_MONEDA.Enabled:= True;       
       cbCVE_MONEDA.Checked:= True;
       InterForma1.NextTab(edCVE_MONEDA);
       End;
    End;
end;

procedure TWMmovcvda.ilCVE_MONEDAEjecuta(Sender: TObject);
begin
  With Objeto Do
    Begin
    If MONEDA.FindKey([ilCVE_MONEDA.Buffer]) Then
       Begin
       cbCVE_MONEDA.Checked:= True;
       cbCVE_MONEDA.Enabled:= True;
       InterForma1.NextTab(edCVE_MONEDA);
       End;
    End;
end;

procedure TWMmovcvda.ilID_CONTRATOEjecuta(Sender: TObject);
begin
    If Objeto.Contrato.FindKey([ilID_CONTRATO.Buffer]) Then Begin
        chbxAutorizacion.Checked:=True;
        chbxAutorizacion.Enabled:=True;
        InterForma1.NextTab(edID_CONTRATO);
    End;
end;

procedure TWMmovcvda.btCVE_PRESUPUESTOClick(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('ICRPRESUP.IT','I');
      Try
        If T.Execute Then
           Begin
             edCVE_PRESUPUESTO.Text := T.DameCampo(0);
             edDESC_PRESUPUESTO.Text := T.DameCampo(1);
             chbxPresupuesto.Enabled := True;             
             chbxPresupuesto.Checked := True;
           End;
      Finally
        T.Free;
      End;
    End;
end;

procedure TWMmovcvda.btCVE_PRODUCTO_CREClick(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('CONSCRPROD.IT','I');
      Try
        If T.Execute Then
           Begin
             edCVE_PRODUCTO.Text := T.DameCampo(0);
             edDESC_PRODUCTO.Text := T.DameCampo(1);
             chbxproducto.Enabled:=True;             
             chbxproducto.Checked := True;
           End;
      Finally
        T.Free;
      End;
    End;
end;

procedure TWMmovcvda.btCTA_ORIGENClick(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('ICRCATMIN.IT','I');
      Try
        If T.Execute Then
           Begin
             edCVE_CAT_MINIMO.Text := T.DameCampo(0);
             edDESC_CAT_MINIMO.Text := T.DameCampo(1);
             chbxCatMinimo.Enabled:=True;
             chbxCatMinimo.Checked := True;
           End;
      Finally
        T.Free;
      End;
    End;
end;

procedure TWMmovcvda.btID_CREDITOClick(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('ICRDIMCR.IT','I');
      Try
        If T.Execute Then
           Begin
             edID_CREDITO.Text := T.DameCampo(0);
             edDESC_ID_CREDITO.Text := T.DameCampo(1);
             cbID_CREDITO.Enabled:=True;             
             cbID_CREDITO.Checked := True;
           End;
      Finally
        T.Free;
      End;
    End;
end;

procedure TWMmovcvda.chbxAcreditadoClick(Sender: TObject);
begin
   EnableCheckBox(chbxAcreditado);
   Objeto.Persona.Active := chbxAcreditado.Checked;
end;

procedure TWMmovcvda.cbCVE_MONEDAClick(Sender: TObject);
begin
   EnableCheckBox(cbCVE_MONEDA);
   Objeto.Moneda.Active := cbCVE_MONEDA.Checked;
end;

procedure TWMmovcvda.chbxAutorizacionClick(Sender: TObject);
begin
   EnableCheckBox(chbxAutorizacion);
   Objeto.Contrato.Active := chbxAutorizacion.Checked;
end;

procedure TWMmovcvda.chbxPresupuestoClick(Sender: TObject);
begin
   EnableCheckBox(chbxPresupuesto);
   edCVE_PRESUPUESTO.Enabled := chbxPresupuesto.Checked;

   IF NOT (edCVE_PRESUPUESTO.Enabled ) then Begin
      edCVE_PRESUPUESTO.Text := '';
      edDESC_PRESUPUESTO.Text := '';
   End;
end;

procedure TWMmovcvda.chbxproductoClick(Sender: TObject);
begin
   EnableCheckBox(chbxProducto);
   edCVE_PRODUCTO.Enabled := chbxProducto.Checked;

   IF NOT (edCVE_PRODUCTO.Enabled ) then Begin
      edCVE_PRODUCTO.Text := '';
      edDESC_PRODUCTO.Text := '';
   End;
end;

procedure TWMmovcvda.chbxCatMinimoClick(Sender: TObject);
begin
   EnableCheckBox(chbxCatMinimo);
   edCVE_CAT_MINIMO.Enabled := chbxCatMinimo.Checked;

   IF NOT (edCVE_CAT_MINIMO.Enabled ) then Begin
      edCVE_CAT_MINIMO.Text := '';
      edDESC_CAT_MINIMO.Text := '';
   End;
end;

procedure TWMmovcvda.cbID_CREDITOClick(Sender: TObject);
begin
   EnableCheckBox(cbID_CREDITO);
   edID_CREDITO.Enabled := cbID_CREDITO.Checked;

   IF NOT (edID_CREDITO.Enabled ) then Begin
      edID_CREDITO.Text := '';
      edDESC_ID_CREDITO.Text := '';
   End;
end;

procedure TWMmovcvda.cbGenArchExcelClick(Sender: TObject);
begin
  If cbGenArchExcel.Checked Then
    Begin
      edRuta.Enabled:=True;
      sbtnExcel.Enabled:=True;
      edRuta.Color := clWindow;
      edRuta.ReadOnly := False;
      edRuta.Text:='C:\';
      GeneraNomArch;
    End
  Else
    Begin
      edRuta.Clear;
      edRuta.Enabled:=False;
      edRuta.Color := clBtnFace;
      edRuta.ReadOnly := True;
      sbtnExcel.Enabled:=False;
    End;
end;

procedure TWMmovcvda.sbtnExcelClick(Sender: TObject);
begin
  SaveDialog1.DefaultExt := '*.xls';
  SaveDialog1.Filter     := 'Archivo Excel (*.xls)|*.xls';
  SaveDialog1.FileName:= edRuta.Text;
  if SaveDialog1.Execute then
   edRuta.Text:=SaveDialog1.FileName;
end;

procedure TWMmovcvda.ImprimeReporte(bPreview: Boolean);
var
   vlStrArchivoXLS : String;
begin
     // Inicia obtneción de datos
     If cbGenArchExcel.Checked Then vlStrArchivoXLS := edRuta.text
     Else vlStrArchivoXLS := '';

     If FileExists(vlStrArchivoXLS) Then
       If (MessageDlg('El archivo '+ExtractFileName(vlStrArchivoXLS)+' ya existe en la ruta indicada.'+coCRLF+
                      '¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
          DeleteFile(vlStrArchivoXLS)
       Else
          Begin
          MessageDlg('Favor de indicar otro nombre de archivo, para poder continuar.', mtWarning, [mbOk], 0);
          If (edRuta.CanFocus) Then edRuta.SetFocus;
          Exit;
          end;

   //Genera reporte
   RepMovCarVda( dtpF_Ini.Date, dtpF_Fin.Date, edACREDITADO.Text, edID_CREDITO.Text,
                 edID_CONTRATO.Text, edCVE_PRESUPUESTO.Text,
                 edCVE_PRODUCTO.Text, edCVE_MONEDA.Text, edCVE_CAT_MINIMO.Text,
                 IntToStr(rgBancaria.ItemIndex),
                 Objeto.Apli, bPreview, vlStrArchivoXLS);
end;

procedure TWMmovcvda.InterForma1Preview(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMMOVCVDA_PREVI',True,True) then
   begin
      ImprimeReporte(True);
   END;
end;

procedure TWMmovcvda.InterForma1Imprimir(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMMOVCVDA_IMPRI',True,True) then
   begin
      ImprimeReporte(False);
   end;
end;

procedure TWMmovcvda.GeneraNomArch;
var
  vlruta, vlNomArch: String;
begin
 If (edRuta.Text<>'')  Then
    Begin
    vlruta:=ExtractFilePath(edRuta.text);
    vlNomArch:= 'MOVTOS_CARTERA_VENCIDA.XLS';
    edRuta.Text:= vlruta+vlNomArch;
    End;
end;
end.
