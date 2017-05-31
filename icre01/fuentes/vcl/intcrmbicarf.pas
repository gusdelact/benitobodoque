// Sistema         : Clase de CrMBiCarF
// Fecha de Inicio : 27/07/2011
// Función forma   : Clase de CrMBiCarF
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrMBiCarF;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,

IntGenCre,
IntParamCre,   // Parametros
IntCrCto,      // Contrato
IntCrCredito,  // Disposición
IntMQrBitCarF  // Reporte
;

Type
 TCrmbicarf= class; 

  TWCrmbicarf=Class(TForm)
    InterForma1             : TInterForma;
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
    GroupBox1: TGroupBox;
    lbLiqF_INICIO: TLabel;
    Label3: TLabel;
    edF_INICIO: TEdit;
    dtpF_Ini: TInterDateTimePicker;
    edF_FINAL: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    Label5: TLabel;
    edID_CREDITO: TEdit;
    btID_CREDITO: TBitBtn;
    edDESC_CREDITO: TEdit;
    cbID_CREDITO: TCheckBox;
    ilDisposicion: TInterLinkit;
    Label1: TLabel;
    edID_CONTRATO: TEdit;
    btID_CONTRATO: TBitBtn;
    edDESC_AUTORIZACION: TEdit;
    ilID_CONTRATO: TInterLinkit;
    cbID_CONTRATO: TCheckBox;
    rgTIP_CARTA: TRadioGroup;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure btID_CONTRATOClick(Sender: TObject);
    procedure ilDisposicionEjecuta(Sender: TObject);
    procedure ilID_CONTRATOEjecuta(Sender: TObject);
    procedure cbID_CREDITOClick(Sender: TObject);
    procedure cbID_CONTRATOClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    private 
    { Private declarations }
     procedure EnableCheckBox(var CheckBox : TCheckBox);
     Procedure ImprimeReporte(bPreview:Boolean); 
    public 
    { Public declarations } 
    Objeto : TCrmbicarf;
end; 
 TCrmbicarf= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ParamCre    : TParamCre;
        Credito     : TCrCredito;//Disposición
        Contrato    : TCrCto;    //Contrato Crédito

        F_INICIO                 : TInterCampo;
        F_FINAL                  : TInterCampo;
        CVE_TIP_CARTA            : TInterCampo;

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


constructor TCrmbicarf.Create( AOwner : TComponent ); 
begin Inherited; 
  F_INICIO         :=CreaCampo('F_INICIO',     ftDate,   tsNinguno,tsNinguno,False);
  F_FINAL          :=CreaCampo('F_FINAL',      ftDate,   tsNinguno,tsNinguno,False);

  CVE_TIP_CARTA    :=CreaCampo('CVE_TIP_CARTA',ftString, tsNinguno,tsNinguno,False);
  With CVE_TIP_CARTA Do Begin
       Size := 13;
       UseCombo := True;
       ComboLista.Add('0');    ComboDatos.Add('');
       ComboLista.Add('1');    ComboDatos.Add('LIQ');
       ComboLista.Add('2');    ComboDatos.Add('SAD');
       ComboLista.Add('3');    ComboDatos.Add('ADE');
       ComboLista.Add('4');    ComboDatos.Add('NAD');
  End;

  Credito := TCrCredito.Create(Self);
  Credito.MasterSource:=Self;
  Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

  Contrato := TCrCto.Create(Self);
  Contrato.MasterSource:=Self;

  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'IntCrMBiCarF.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrmbicarf.Destroy;
begin
  If Credito <> nil then
     Credito.Free;
  If Contrato <> nil then
     Contrato.Free;

  inherited;
end;


function TCrmbicarf.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrmbicarf;
begin
   W:=TWCrmbicarf.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.ShowBtnImprimir := True;
      W.InterForma1.ShowBtnPreview  := True;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrmbicarf.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrmbica.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrmbicarf.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrMBiCarF********************)
(*                                                                              *)
(*  FORMA DE CrMBiCarF                                                            *)
(*                                                                              *)
(***********************************************FORMA CrMBiCarF********************)

procedure TWCrmbicarf.FormShow(Sender: TObject);
begin
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

  Objeto.Credito.ID_CREDITO.Control :=edID_CREDITO;
  Objeto.Contrato.ID_CONTRATO.Control :=edID_CONTRATO;
  Objeto.CVE_TIP_CARTA.Control:=rgTIP_CARTA;
  Objeto.F_INICIO.Control:=edF_INICIO;
  Objeto.F_FINAL.Control:=edF_FINAL;

  Objeto.Credito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edDESC_CREDITO;
  Objeto.Contrato.Producto.DESC_C_PRODUCTO.Control := edDESC_AUTORIZACION;

  Objeto.F_INICIO.AsDateTime :=Objeto.Apli.DameFechaEmpresaDia('D000');
  Objeto.F_FINAL.AsDateTime :=Objeto.Apli.DameFechaEmpresaDia('D000');
  Objeto.CVE_TIP_CARTA.AsString:='';
end;

procedure TWCrmbicarf.FormDestroy(Sender: TObject);
begin
  Objeto.Credito.ID_CREDITO.Control := nil;
  Objeto.Contrato.ID_CONTRATO.Control := nil;
  Objeto.CVE_TIP_CARTA.Control := nil;
  Objeto.F_INICIO.Control := nil;
  Objeto.F_FINAL.Control := nil;
end;

procedure TWCrmbicarf.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrmbicarf.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrmbicarf.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrmbicarf.btID_CREDITOClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then
   begin
      cbID_CREDITO.Checked := True;
      cbID_CREDITO.Enabled := True;
      InterForma1.NextTab(btID_CREDITO);
   end;
end;

procedure TWCrmbicarf.btID_CONTRATOClick(Sender: TObject);
begin
   Objeto.Contrato.ShowAll := True;
   if Objeto.Contrato.Busca then
   begin
      cbID_CONTRATO.Checked := True;
      cbID_CONTRATO.Enabled := True;
      InterForma1.NextTab(btID_CONTRATO);
   end;
end;

procedure TWCrmbicarf.ilDisposicionEjecuta(Sender: TObject);
begin
   if Objeto.Credito.FindKey([ilDisposicion.Buffer,'1']) then
   begin
      cbID_CREDITO.Checked := True;
      cbID_CREDITO.Enabled := True;
      InterForma1.NextTab(edID_Credito);
   End;
end;

procedure TWCrmbicarf.ilID_CONTRATOEjecuta(Sender: TObject);
begin
   if Objeto.Contrato.FindKey([ilID_CONTRATO.Buffer,'1']) then
   begin
      cbID_CONTRATO.Checked := True;
      cbID_CONTRATO.Enabled := True;
      InterForma1.NextTab(edID_Contrato);
   End;
end;

procedure TWCrmbicarf.EnableCheckBox(var CheckBox: TCheckBox);
begin
    If Not CheckBox.Checked Then Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;
    End Else Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;

procedure TWCrmbicarf.cbID_CREDITOClick(Sender: TObject);
begin
   EnableCheckBox(cbID_CREDITO);
   Objeto.Credito.Active := cbID_CREDITO.Checked;
end;

procedure TWCrmbicarf.cbID_CONTRATOClick(Sender: TObject);
begin
   EnableCheckBox(cbID_CONTRATO);
   Objeto.Contrato.Active := cbID_CONTRATO.Checked;
end;

procedure TWCrmbicarf.ImprimeReporte(bPreview: Boolean);
begin
   Objeto.F_INICIO.GetFromControl;
   Objeto.F_FINAL.GetFromControl;
   Objeto.CVE_TIP_CARTA.GetFromControl;

   RepBitCarF( Objeto.F_INICIO.AsDateTime,
               Objeto.F_FINAL.AsDateTime,
               Objeto.credito.ID_CREDITO.AsString,
               Objeto.CVE_TIP_CARTA.AsString,
               Objeto.contrato.ID_CONTRATO.AsString,
               Objeto.Apli, bPreview);
end;

procedure TWCrmbicarf.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRMBICARF_PREVI',True,True) then
      ImprimeReporte(True);
end;

procedure TWCrmbicarf.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRMBICARF_IMPRI',True,True) then
      ImprimeReporte(False);
end;

end.
