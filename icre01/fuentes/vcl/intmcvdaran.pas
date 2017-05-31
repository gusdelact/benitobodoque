// Sistema         : Clase de MCVdaRan
// Fecha de Inicio : 06/07/2012
// Función forma   : Clase de MCVdaRan
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntMcvdaran;

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
IntQrCartVdaRan   //Reporte
;

Type
 TMcvdaran= class; 

  TWMcvdaran=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
    Label1: TLabel;
    lblCVE_MONEDA: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    Label3: TLabel;
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
    edF_FIN: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    rgBancaria: TRadioGroup;
    ilACREDITADO: TInterLinkit;
    ilID_CONTRATO: TInterLinkit;
    ilCVE_MONEDA: TInterLinkit;
    Label11: TLabel;
    btCVE_PRESUPUESTO: TBitBtn;
    edCVE_PRESUPUESTO: TEdit;
    edDESC_PRESUPUESTO: TEdit;
    chbxPresupuesto: TCheckBox;
    cbGenArchExcel: TCheckBox;
    edRuta: TEdit;
    sbtnExcel: TSpeedButton;
    SaveDialog1: TSaveDialog;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCVE_PRODUCTO_CREClick(Sender: TObject);
    procedure btCTA_ORIGENClick(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure ilCVE_MONEDAEjecuta(Sender: TObject);
    procedure ilID_CONTRATOEjecuta(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure btnCVE_MONEDAClick(Sender: TObject);
    procedure btID_CONTRATOClick(Sender: TObject);
    procedure edACREDITADOExit(Sender: TObject);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure edID_CONTRATOExit(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure cbCVE_MONEDAClick(Sender: TObject);
    procedure chbxAutorizacionClick(Sender: TObject);
    procedure btCVE_PRESUPUESTOClick(Sender: TObject);
    procedure InterForma1Preview(Sender: TObject);
    procedure InterForma1Imprimir(Sender: TObject);
    procedure cbGenArchExcelClick(Sender: TObject);
    procedure sbtnExcelClick(Sender: TObject);
    procedure GeneraNomArch;
    procedure cbID_CREDITOClick(Sender: TObject);
    procedure chbxCatMinimoClick(Sender: TObject);
    procedure chbxproductoClick(Sender: TObject);
    procedure chbxPresupuestoClick(Sender: TObject);
    private
    { Private declarations }
       Procedure ImprimeReporte(bPreview:Boolean);

    public 
    { Public declarations } 
    Objeto : TMcvdaran;
end; 
 TMcvdaran= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
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

constructor TMcvdaran.Create( AOwner : TComponent ); 
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
      HelpFile := 'IntMcvdaran.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMcvdaran.Destroy;
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


function TMcvdaran.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMcvdaran;
begin
   W:=TWMcvdaran.Create(Self);
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


Function TMcvdaran.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IMcvdara.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TMcvdaran.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA MCVdaRan********************)
(*                                                                              *)
(*  FORMA DE MCVdaRan                                                            *)
(*                                                                              *)
(***********************************************FORMA MCVdaRan********************)

procedure TWMcvdaran.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      dtpF_Fin.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edF_FIN.text:=FormatDateTime('dd/mm/yyyy',dtpF_Fin.DateTime);

      Objeto.Persona.Id_Persona.Control := edACREDITADO;
      Objeto.Persona.Nombre.Control := edNOMBRE_ACRED;
      Objeto.GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Objeto.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;

      Objeto.Moneda.CVE_MONEDA.Control := edCVE_MONEDA;
      Objeto.Moneda.DESC_MONEDA.Control := edDESC_MONEDA;
      Objeto.Moneda.GetParams(Objeto);

      Objeto.Contrato.ID_CONTRATO.Control   := edID_CONTRATO;
      Objeto.Contrato.TITNOMBRE.Control := edDESC_AUTORIZACION;
      Objeto.Contrato.Titular.Nombre.Control  := edDESC_AUTORIZACION;
      Objeto.Contrato.GetParams(Objeto);
end;

procedure TWMcvdaran.FormDestroy(Sender: TObject);
begin
   //Objeto
end;

procedure TWMcvdaran.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMcvdaran.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWMcvdaran.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWMcvdaran.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWMcvdaran.btCVE_PRODUCTO_CREClick(Sender: TObject);
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

procedure TWMcvdaran.btCTA_ORIGENClick(Sender: TObject);
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

procedure TWMcvdaran.btID_CREDITOClick(Sender: TObject);
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

procedure TWMcvdaran.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Persona.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TWMcvdaran.ilCVE_MONEDAEjecuta(Sender: TObject);
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

procedure TWMcvdaran.ilID_CONTRATOEjecuta(Sender: TObject);
begin
    If Objeto.Contrato.FindKey([ilID_CONTRATO.Buffer]) Then Begin
        chbxAutorizacion.Checked:=True;
        chbxAutorizacion.Enabled:=True;
        InterForma1.NextTab(edID_CONTRATO);
    End;
end;

procedure TWMcvdaran.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Persona.ShowAll := True;
   If Objeto.Persona.Busca Then Begin
        chbxAcreditado.Enabled:=True;   
        chbxAcreditado.Checked:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TWMcvdaran.btnCVE_MONEDAClick(Sender: TObject);
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

procedure TWMcvdaran.btID_CONTRATOClick(Sender: TObject);
begin
    Objeto.Contrato.ShowAll := True;
    If Objeto.Contrato.Busca Then Begin
        chbxAutorizacion.Enabled:=True;    
        chbxAutorizacion.Checked:=True;
        InterForma1.NextTab(edID_CONTRATO);
    End;
end;

procedure TWMcvdaran.edACREDITADOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edACREDITADO,True,'',True);
end;

procedure TWMcvdaran.edCVE_MONEDAExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edCVE_MONEDA,True,'',True);
end;

procedure TWMcvdaran.edID_CONTRATOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edID_CONTRATO,True,'',True);
end;

procedure TWMcvdaran.chbxAcreditadoClick(Sender: TObject);
begin
   EnableCheckBox(chbxAcreditado);
   Objeto.Persona.Active := chbxAcreditado.Checked;
end;

procedure TWMcvdaran.cbCVE_MONEDAClick(Sender: TObject);
begin
   EnableCheckBox(cbCVE_MONEDA);
   Objeto.Moneda.Active := cbCVE_MONEDA.Checked;
end;

procedure TWMcvdaran.chbxAutorizacionClick(Sender: TObject);
begin
   EnableCheckBox(chbxAutorizacion);
   Objeto.Contrato.Active := chbxAutorizacion.Checked;
end;

procedure TWMcvdaran.btCVE_PRESUPUESTOClick(Sender: TObject);
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
             chbxPresupuesto.Enabled:=True;             
             chbxPresupuesto.Checked := True;
           End;
      Finally
        T.Free;
      End;
    End;
end;

procedure TWMcvdaran.ImprimeReporte(bPreview: Boolean);
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
   RepCarVdaRan( dtpF_Fin.Date, edACREDITADO.Text, edID_CREDITO.Text,
                 edID_CONTRATO.Text, edCVE_PRESUPUESTO.Text,
                 edCVE_PRODUCTO.Text, edCVE_MONEDA.Text, edCVE_CAT_MINIMO.Text,
                 IntToStr(rgBancaria.ItemIndex),
                 Objeto.Apli, bPreview, vlStrArchivoXLS);
end;

procedure TWMcvdaran.InterForma1Preview(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMCVDARAN_PREVI',True,True) then
    ImprimeReporte(True);
end;

procedure TWMcvdaran.InterForma1Imprimir(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMCVDARAN_IMPRI',True,True) then
      ImprimeReporte(False);
end;

procedure TWMcvdaran.cbGenArchExcelClick(Sender: TObject);
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
    End
end;

procedure TWMcvdaran.sbtnExcelClick(Sender: TObject);
begin
  SaveDialog1.DefaultExt := '*.xls';
  SaveDialog1.Filter     := 'Archivo Excel (*.xls)|*.xls';
  SaveDialog1.FileName:= edRuta.Text;
  if SaveDialog1.Execute then
   edRuta.Text:=SaveDialog1.FileName;
end;

procedure TWMcvdaran.GeneraNomArch;
var vlruta, vlNomArch: String;
begin
 If (edRuta.Text<>'')  Then
    Begin
    vlruta:=ExtractFilePath(edRuta.text);
    vlNomArch:= 'CARTERA_VENCIDA_RANGOS.XLS';
    edRuta.Text:= vlruta+vlNomArch;
    End;
end;

procedure TWMcvdaran.cbID_CREDITOClick(Sender: TObject);
begin
   EnableCheckBox(cbID_CREDITO);
   edID_CREDITO.Enabled := cbID_CREDITO.Checked;

   IF NOT (edID_CREDITO.Enabled ) then Begin
      edID_CREDITO.Text := '';
      edDESC_ID_CREDITO.Text := '';
   End;
end;

procedure TWMcvdaran.chbxCatMinimoClick(Sender: TObject);
begin
   EnableCheckBox(chbxCatMinimo);
   edCVE_CAT_MINIMO.Enabled := chbxCatMinimo.Checked;

   IF NOT (edCVE_CAT_MINIMO.Enabled ) then Begin
      edCVE_CAT_MINIMO.Text := '';
      edDESC_CAT_MINIMO.Text := '';
   End;
end;

procedure TWMcvdaran.chbxproductoClick(Sender: TObject);
begin
   EnableCheckBox(chbxProducto);
   edCVE_PRODUCTO.Enabled := chbxProducto.Checked;

   IF NOT (edCVE_PRODUCTO.Enabled ) then Begin
      edCVE_PRODUCTO.Text := '';
      edDESC_PRODUCTO.Text := '';
   End;
end;

procedure TWMcvdaran.chbxPresupuestoClick(Sender: TObject);
begin
   EnableCheckBox(chbxPresupuesto);
   edCVE_PRESUPUESTO.Enabled := chbxPresupuesto.Checked;

   IF NOT (edCVE_PRESUPUESTO.Enabled ) then Begin
      edCVE_PRESUPUESTO.Text := '';
      edDESC_PRESUPUESTO.Text := '';
   End;
end;

end.
