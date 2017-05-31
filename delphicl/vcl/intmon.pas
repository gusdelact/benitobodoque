// Sistema         : Clase de Monedas
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Clase de Monedas
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Comentarios     : MARA4356 AGOSTO 2006 SE AGREGA CLAVE DE MONEDA PARA EL SIAR
unit IntMon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

type

  TMoneda = Class;
  TWMoneda = class(TForm)
    lbCveMoneda: TLabel;
    edCveMoneda: TEdit;
    lbDescMoneda: TLabel;
    edDescMoneda: TEdit;
    BitBtn1: TBitBtn;
    lbCveFrecRevMon: TLabel;
    GroupBox1: TGroupBox;
    lbFUltRevMon: TLabel;
    edFUltRevMon: TEdit;
    edFProxRevMon: TEdit;
    lbFProxRevMon: TLabel;
    cbCveFrecRevMon: TComboBox;
    Label1: TLabel;
    edBMonForward: TEdit;
    edDescCMoneda: TEdit;
    Label8: TLabel;
    edDescLIdSec: TEdit;
    Label9: TLabel;
    edDescCIdSec: TEdit;
    Label10: TLabel;
    edSimboloMoneda: TEdit;
    Label11: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edCveMonIndeval: TEdit;
    edCveMonBanxico: TEdit;
    edCveMonCecoban: TEdit;
    edCveMonedaSiti: TEdit;
    edCveMonCsi: TEdit;
    edCveMonNafin: TEdit;
    lbSIAR: TLabel;
    edCVE_MONEDA_SIAR: TEdit;
    InterForma1: TInterForma;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cbCveFrecRevMonChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Moneda : TMoneda;
  end;

  TMoneda = class(TInterFrame)
  private
  protected
//  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
    { Public declarations }
    Cve_Moneda       : TInterCampo;
    Cve_Frec_Rev_Mon : TInterCampo;
    Desc_Moneda      : TInterCampo;
    F_Prox_Rev_Mon   : TInterCampo;
    F_Ult_Rev_Mon    : TInterCampo;
    B_Mon_Forward    : TInterCampo;
    Cve_Mon_Indeval  : TInterCampo;
    Cve_Mon_Banxico  : TInterCampo;
    Cve_Mon_Cecoban  : TInterCampo;
    Cve_Moneda_Siti  : TInterCampo;
    Cve_Mon_Csi      : TInterCampo;
    Cve_Mon_Nafin    : TInterCampo;
    Desc_C_Moneda    : TInterCampo;
    Desc_L_Id_Sec    : TInterCampo;
    Desc_C_Id_Sec    : TInterCampo;
    Simbolo_Moneda   : TInterCampo;
    Cve_Moneda_SIAR  : TInterCampo; //MARA4356 SE AGREGA EN MONEDA PARA SIAR
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
  published
  end;

implementation

Uses RepMon;
{$R *.DFM}

constructor TMoneda.Create( AOwner : TComponent );
begin Inherited;
      Cve_Moneda       := CreaCampo('CVE_MONEDA',ftInteger,tsNinguno,tsNinguno,True);
      Cve_Moneda.Size  := 3;
      Cve_Frec_Rev_Mon := CreaCampo('CVE_FREC_REV_MON',ftString,tsNinguno,tsNinguno,True);
      With Cve_Frec_Rev_Mon do
      begin
      	Size := 1;
	UseCombo := True;
       	ComboLista.Add('DIARIA');    ComboDatos.Add('D');
        ComboLista.Add('SEMANAL');   ComboDatos.Add('S');
        ComboLista.Add('MENSUAL');   ComboDatos.Add('M');
      end;
      Desc_Moneda      := CreaCampo('DESC_MONEDA',ftString,tsNinguno,tsNinguno,True);
      Desc_Moneda.Size := 20;
      F_Prox_Rev_Mon   := CreaCampo('F_PROX_REV_MON',ftDate,tsNinguno,tsNinguno,True);
      F_Ult_Rev_Mon    := CreaCampo('F_ULT_REV_MON',ftDate,tsNinguno,tsNinguno,True);
      B_Mon_Forward    := CreaCampo('B_Mon_Forward',ftString,tsNinguno,tsNinguno,True);
      Cve_Mon_Indeval  := CreaCampo('Cve_Mon_Indeval',ftString,tsNinguno,tsNinguno,True);
      Cve_Mon_Banxico  := CreaCampo('Cve_Mon_Banxico',ftString,tsNinguno,tsNinguno,True);
      Cve_Mon_Cecoban  := CreaCampo('Cve_Mon_Cecoban',ftString,tsNinguno,tsNinguno,True);
      Cve_Moneda_Siti  := CreaCampo('Cve_Moneda_Siti',ftString,tsNinguno,tsNinguno,True);
      Cve_Mon_Csi      := CreaCampo('Cve_Mon_Csi',ftString,tsNinguno,tsNinguno,True);
      Cve_Mon_Nafin    := CreaCampo('Cve_Mon_Nafin',ftString,tsNinguno,tsNinguno,True);
      Desc_C_Moneda    := CreaCampo('Desc_C_Moneda',ftString,tsNinguno,tsNinguno,True);
      Desc_L_Id_Sec    := CreaCampo('Desc_L_Id_Sec',ftString,tsNinguno,tsNinguno,True);
      Desc_C_Id_Sec    := CreaCampo('Desc_C_Id_Sec',ftString,tsNinguno,tsNinguno,True);
      Simbolo_Moneda   := CreaCampo('Simbolo_Moneda',ftString,tsNinguno,tsNinguno,True);
      Cve_Moneda_SIAR  := CreaCampo('Cve_Moneda_SIAR',ftString,tsNinguno,tsNinguno,True);
      FActive         := False;
      FKeyFields.Add('CVE_MONEDA');
      TableName       := 'MONEDA';
      UseQuery        := True;
      HelpFile        := 'IntMon.hlp';
      ShowMenuReporte := True;
      //IsCorp:=True;
end;

destructor TMoneda.Destroy;
begin inherited;
end;

function TMoneda.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMoneda;
begin
   W:=TWMoneda.Create(Self);
   try
      W.Moneda:= Self;
      W.InterForma1.InterFrame:=Self; //  NUEVO
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.FormaEstilo:= feAutomatico;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;

   finally
      W.Free;
   end;
end;


Function TMoneda.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IntMon.it','I,S,S,D,D');
   try
      if Active then T.Param(0,Cve_Moneda.AsString);
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function TMoneda.Reporte:Boolean;
begin Execute_RepMon(True,Self);
  Result := True;
end;

(***********************************************FORMA MONEDAS********************)
(*                                                                              *)
(*  FORMA DE MONEDAS                                                            *)
(*                                                                              *)
(***********************************************FORMA MONEDAS********************)

procedure TWMoneda.FormShow(Sender: TObject);
begin Moneda.Cve_Moneda.Control       := edCveMoneda;
      Moneda.Desc_Moneda.Control      := edDescMoneda;
      Moneda.Cve_Frec_Rev_Mon.Control := cbCveFrecRevMon;
      Moneda.F_Prox_Rev_Mon.Control   := edFProxRevMon;
      Moneda.F_Ult_Rev_Mon.Control    := edFUltRevMon;
      Moneda.B_Mon_Forward.Control    := edBMonForward;
      Moneda.Cve_Mon_Indeval.Control  := edCveMonIndeval;
      Moneda.Cve_Mon_Banxico.Control  := edCveMonBanxico;
      Moneda.Cve_Mon_Cecoban.Control  := edCveMonCecoban;
      Moneda.Cve_Moneda_Siti.Control  := edCveMonedaSiti;
      Moneda.Cve_Mon_Csi.Control      := edCveMonCsi;
      Moneda.Cve_Mon_Nafin.Control    := edCveMonNafin;
      Moneda.Desc_C_Moneda.Control    := edDescCMoneda;
      Moneda.Desc_L_Id_Sec.Control    := edDescLIdSec;
      Moneda.Desc_C_Id_Sec.Control    := edDescCIdSec;
      Moneda.Simbolo_Moneda.Control   := edSimboloMoneda;
      Moneda.Cve_Moneda_SIAR.Control  := edCVE_MONEDA_SIAR;
end;

procedure TWMoneda.FormDestroy(Sender: TObject);
begin Moneda.Cve_Moneda.Control       := nil;
      Moneda.Desc_Moneda.Control      := nil;
      Moneda.Cve_Frec_Rev_Mon.Control := nil;
      Moneda.F_Prox_Rev_Mon.Control   := nil;
      Moneda.F_Ult_Rev_Mon.Control    := nil;
      Moneda.B_Mon_Forward.Control    := nil;
      Moneda.Cve_Mon_Indeval.Control  := nil;
      Moneda.Cve_Mon_Banxico.Control  := nil;
      Moneda.Cve_Mon_Cecoban.Control  := nil;
      Moneda.Cve_Moneda_Siti.Control  := nil;
      Moneda.Cve_Mon_Csi.Control      := nil;
      Moneda.Cve_Mon_Nafin.Control    := nil;
      Moneda.Desc_C_Moneda.Control    := nil;
      Moneda.Desc_L_Id_Sec.Control    := nil;
      Moneda.Desc_C_Id_Sec.Control    := nil;
      Moneda.Simbolo_Moneda.Control   := nil;
      Moneda.Cve_Moneda_SIAR.Control  := nil;
end;

procedure TWMoneda.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMoneda.InterForma1DespuesNuevo(Sender: TObject);
begin edCveMoneda.SetFocus;
      cbCveFrecRevMon.Text:='DIARIA';
      edFUltRevMon.Text:=FormatDateTime('DD/MM/YYYY',DATE);
      edFProxRevMon.Text:=FormatDateTime('DD/MM/YYYY',DATE+1);
end;

procedure TWMoneda.InterForma1DespuesModificar(Sender: TObject);
begin edDescMoneda.SetFocus;
      edFUltRevMon.Text := FormatDateTime('DD/MM/YYYY',DATE);
      if Moneda.Cve_Frec_Rev_Mon.AsString = 'D' Then
   	edFProxRevMon.Text:= FormatDateTime('DD/MM/YYYY',DATE+1)
      else if Moneda.Cve_Frec_Rev_Mon.AsString = 'S' Then
   	edFProxRevMon.Text:= FormatDateTime('DD/MM/YYYY',DATE+7);
      if Moneda.Cve_Frec_Rev_Mon.AsString = 'M' Then
   	edFProxRevMon.Text:= FormatDateTime('DD/MM/YYYY',DATE+30);
end;

procedure TWMoneda.BitBtn1Click(Sender: TObject);
begin
  If Moneda.ValidaAccesoEsp('MONEDA_REPORTE',True,True) Then
  Begin
    Moneda.Reporte;
  End;
end;

procedure TWMoneda.cbCveFrecRevMonChange(Sender: TObject);
begin Moneda.Cve_Frec_Rev_Mon.ComboChange;
      If Moneda.Modo in [moAppend, moEdit] then
      begin
        if cbCveFrecRevMon.Text = 'DIARIA' Then
          edFProxRevMon.Text:= FormatDateTime('DD/MM/YYYY',DATE+1)
        else if cbCveFrecRevMon.Text = 'SEMANAL' Then
          edFProxRevMon.Text:= FormatDateTime('DD/MM/YYYY',DATE+7);
        if cbCveFrecRevMon.Text = 'MENSUAL' Then
          edFProxRevMon.Text:= FormatDateTime('DD/MM/YYYY',DATE+30);
      end;
end;

end.



