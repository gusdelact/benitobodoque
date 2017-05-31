// Sistema         : Clase de CR_CAPITAL
// Fecha de Inicio : 29/05/2003
// Función forma   : Clase de CR_CAPITAL
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrCapital;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntGenCre, IntLinkit, InterEdit, IntParamCre, IntCrCredito;

Type
 TCrCapital= class; 

  TWCrCapital=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_CREDITO : TLabel; 
    edID_CREDITO : TEdit;
    lbNUM_PERIODO : TLabel; 
    edNUM_PERIODO : TEdit; 
    chB_COB_AUT : TCheckBox;
    lbPLAZO : TLabel; 
    edPLAZO : TEdit;
    grbxFechas: TGroupBox;
    edF_VENCIMIENTO: TEdit;
    dtpF_VENCIMIENTO: TInterDateTimePicker;
    lbF_VENCIMIENTO: TLabel;
    edF_PROG_PAGO: TEdit;
    dtpF_PROG_PAGO: TInterDateTimePicker;
    lbF_PROG_PAGO: TLabel;
    lbF_PAGO: TLabel;
    dtpF_PAGO: TInterDateTimePicker;
    edF_PAGO: TEdit;
    grbxImportes: TGroupBox;
    lbIMP_BENEF_GOB: TLabel;
    lbIMP_MORATORIO: TLabel;
    lbIMP_PAGADO_MORA: TLabel;
    lbIMP_COND_MORA: TLabel;
    lbIMP_CAPITAL: TLabel;
    lbIMP_PAGADO: TLabel;
    lbIMP_BENEF_BCO: TLabel;
    grbxSituacion: TGroupBox;
    opActiva: TRadioButton;
    opCancelada: TRadioButton;
    opImpagada: TRadioButton;
    opLiquidada: TRadioButton;
    opPorActivar: TRadioButton;
    ILId_Credito: TInterLinkit;
    btnId_Credito: TBitBtn;
    edNombre: TEdit;
    edIMP_CAPITAL: TInterEdit;
    edIMP_PAGADO: TInterEdit;
    edIMP_BENEF_BCO: TInterEdit;
    edIMP_BENEF_GOB: TInterEdit;
    edIMP_MORATORIO: TInterEdit;
    edIMP_PAGADO_MORA: TInterEdit;
    edIMP_COND_MORA: TInterEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Bevel1: TBevel;
    edIMP_IVA_MORA: TInterEdit;
    edIMP_PAG_IVA_MORA: TInterEdit;
    edIMP_IVA_COND_MOR: TInterEdit;
    lblIMP_IVA_COND_MOR: TLabel;
    lblIMP_PAG_IVA_MORA: TLabel;
    lblIMP_IVA_MORA: TLabel;
    Bevel2: TBevel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure opActivaClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure btnId_CreditoClick(Sender: TObject);
    procedure ILId_CreditoCapture(Sender: TObject; var Show: Boolean);
    procedure ILId_CreditoEjecuta(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    private 
    { Private declarations }
    function  Get_Situacion_Capital : String;
    procedure Set_Situacion_Capital(strValue : String);
    procedure CheckRadioButtons(bCheck : Boolean);
    procedure BuscaAcreditado;     
    public 
    { Public declarations }
     Objeto : TCrCapital;
     property Situacion_Capital : String Read Get_Situacion_Capital Write Set_Situacion_Capital;
    end;
     
 TCrCapital= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ID_CREDITO               : TInterCampo;
        NUM_PERIODO              : TInterCampo;
        B_COB_AUT                : TInterCampo;
        PLAZO                    : TInterCampo;
        F_VENCIMIENTO            : TInterCampo;
        F_PROG_PAGO              : TInterCampo;
        F_PAGO                   : TInterCampo;
        IMP_CAPITAL              : TInterCampo;
        IMP_PAGADO               : TInterCampo;
        IMP_BENEF_BCO            : TInterCampo;
        IMP_BENEF_GOB            : TInterCampo;
        IMP_MORATORIO            : TInterCampo;
        IMP_PAGADO_MORA          : TInterCampo;
        IMP_COND_MORA            : TInterCampo;
        SIT_CAPITAL              : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        IMP_IVA_MORA             : TInterCampo;
        IMP_PAG_IVA_MORA         : TInterCampo;
        IMP_IVA_COND_MOR         : TInterCampo;

        ParamCre                 : TParamCre;
        Credito                  : TCrCredito;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;



implementation

{$R *.DFM}

constructor TCrCapital.Create( AOwner : TComponent );
begin Inherited; 
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Número de Credito';
      NUM_PERIODO :=CreaCampo('NUM_PERIODO',ftFloat,tsNinguno,tsNinguno,True);
                NUM_PERIODO.Caption:='Número Periodo';
      B_COB_AUT :=CreaCampo('B_COB_AUT',ftString,tsNinguno,tsNinguno,True);
                B_COB_AUT.Caption:='Cob Aut';
      PLAZO :=CreaCampo('PLAZO',ftFloat,tsNinguno,tsNinguno,True);
                PLAZO.Caption:='Plazo';
      F_VENCIMIENTO :=CreaCampo('F_VENCIMIENTO',ftDate,tsNinguno,tsNinguno,True);
                F_VENCIMIENTO.Caption:='Fecha Vencimiento';
      F_PROG_PAGO :=CreaCampo('F_PROG_PAGO',ftDate,tsNinguno,tsNinguno,True);
                F_PROG_PAGO.Caption:='Fecha Prog Pago';
      F_PAGO :=CreaCampo('F_PAGO',ftDate,tsNinguno,tsNinguno,True);
                F_PAGO.Caption:='Fecha Pago';
      IMP_CAPITAL :=CreaCampo('IMP_CAPITAL',ftFloat,tsNinguno,tsNinguno,True);
                IMP_CAPITAL.Caption:='Imp Capital';
      IMP_PAGADO :=CreaCampo('IMP_PAGADO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_PAGADO.Caption:='Imp Pagado';
      IMP_BENEF_BCO :=CreaCampo('IMP_BENEF_BCO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_BENEF_BCO.Caption:='Imp Benef Bco';
      IMP_BENEF_GOB :=CreaCampo('IMP_BENEF_GOB',ftFloat,tsNinguno,tsNinguno,True);
                IMP_BENEF_GOB.Caption:='Imp Benef Gob';
      IMP_MORATORIO :=CreaCampo('IMP_MORATORIO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_MORATORIO.Caption:='Imp Moratorio';
      IMP_PAGADO_MORA :=CreaCampo('IMP_PAGADO_MORA',ftFloat,tsNinguno,tsNinguno,True);
                IMP_PAGADO_MORA.Caption:='Imp Pagado Mora';
      IMP_COND_MORA :=CreaCampo('IMP_COND_MORA',ftFloat,tsNinguno,tsNinguno,True);
                IMP_COND_MORA.Caption:='Imp Cond Mora';
      SIT_CAPITAL :=CreaCampo('SIT_CAPITAL',ftString,tsNinguno,tsNinguno,True);
                SIT_CAPITAL.Caption:='Situación Capital';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      IMP_IVA_MORA :=CreaCampo('IMP_IVA_MORA',ftFloat,tsNinguno,tsNinguno,True);
                IMP_MORATORIO.Caption:='Imp Iva Moratorio';
      IMP_PAG_IVA_MORA :=CreaCampo('IMP_PAG_IVA_MORA',ftFloat,tsNinguno,tsNinguno,True);
                IMP_MORATORIO.Caption:='Imp PAg IVA Moratorio';
      IMP_IVA_COND_MOR :=CreaCampo('IMP_IVA_COND_MOR',ftFloat,tsNinguno,tsNinguno,True);
                IMP_IVA_COND_MOR.Caption:='Imp IVA Cond Moratorio';
      FKeyFields.Add('ID_CREDITO');
      FKeyFields.Add('NUM_PERIODO');

      Credito  := TCrCredito.Create(Self);
      Credito.MasterSource := Self;
      Credito.ID_CREDITO.MasterField := 'ID_CREDITO';
      
      TableName := 'CR_CAPITAL';
      UseQuery := True;
      HelpFile := 'IntCrCapital.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCapital.Destroy;
begin inherited;
end;

function TCrCapital.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCapital;
begin
   W:=TWCrCapital.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrCapital.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrCapit.it','F,F');
      Try if Active then begin T.Param(0,ID_CREDITO.AsString); 
                               T.Param(1,NUM_PERIODO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

function TCrCapital.Reporte:Boolean; 
begin Result := False; 
end;


(***********************************************FORMA CR_CAPITAL********************)
(*                                                                              *)
(*  FORMA DE CR_CAPITAL                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CAPITAL********************)


function TWCrCapital.Get_Situacion_Capital: String;
begin
 If opActiva.Checked Then Result := CSIT_AC
 Else If opCancelada.Checked Then Result := CSIT_CA
 Else If opImpagada.Checked  Then Result := CSIT_IM
 Else If opLiquidada.Checked Then Result := CSIT_LQ
 Else Result := CSIT_PA;
end;

procedure TWCrCapital.Set_Situacion_Capital(strValue: String);
begin
 If (strValue = CSIT_AC) Then opActiva.Checked := True
 Else If (strValue = CSIT_CA) Then opCancelada.Checked := True
 Else If (strValue = CSIT_IM) Then opImpagada.Checked  := True
 Else If (strValue = CSIT_LQ) Then opLiquidada.Checked := True
 Else opPorActivar.Checked := True;
end;

procedure TWCrCapital.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  ID_CREDITO.Control:=edID_CREDITO;
  NUM_PERIODO.Control:=edNUM_PERIODO;
  B_COB_AUT.Control:=chB_COB_AUT;
  PLAZO.Control:=edPLAZO;
  F_VENCIMIENTO.Control:=edF_VENCIMIENTO;
  F_PROG_PAGO.Control:=edF_PROG_PAGO;
  F_PAGO.Control:=edF_PAGO;
  IMP_CAPITAL.Control:=edIMP_CAPITAL;
  IMP_PAGADO.Control:=edIMP_PAGADO;
  IMP_BENEF_BCO.Control:=edIMP_BENEF_BCO;
  IMP_BENEF_GOB.Control:=edIMP_BENEF_GOB;
  IMP_MORATORIO.Control:=edIMP_MORATORIO;
  IMP_PAGADO_MORA.Control:=edIMP_PAGADO_MORA;
  IMP_COND_MORA.Control:=edIMP_COND_MORA;
  IMP_IVA_MORA.Control := edIMP_IVA_MORA;
  IMP_PAG_IVA_MORA.Control := edIMP_PAG_IVA_MORA;
  IMP_IVA_COND_MOR.Control := edIMP_IVA_COND_MOR;

  Credito.ID_CREDITO.Control := edID_CREDITO;
  Credito.CONTRATOCRE.ACREDITADO.PERSONA.NOMBRE.Control := edNombre;
  End;
end;

procedure TWCrCapital.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  ID_CREDITO.Control       := NIL;
  NUM_PERIODO.Control      := NIL;
  B_COB_AUT.Control        := NIL;
  PLAZO.Control            := NIL;
  F_VENCIMIENTO.Control    := NIL;
  F_PROG_PAGO.Control      := NIL;
  F_PAGO.Control           := NIL;
  IMP_CAPITAL.Control      := NIL;
  IMP_PAGADO.Control       := NIL;
  IMP_BENEF_BCO.Control    := NIL;
  IMP_BENEF_GOB.Control    := NIL;
  IMP_MORATORIO.Control    := NIL;
  IMP_PAGADO_MORA.Control  := NIL;
  IMP_COND_MORA.Control    := NIL;
  IMP_IVA_MORA.Control     := NIL;
  IMP_PAG_IVA_MORA.Control := NIL;
  IMP_IVA_COND_MOR.Control := NIL;

  Credito.ID_CREDITO.Control := NIL;
  Credito.CONTRATOCRE.ACREDITADO.PERSONA.NOMBRE.Control := NIL;
  End;
end;

procedure TWCrCapital.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCapital.InterForma1DespuesNuevo(Sender: TObject);
begin If edID_CREDITO.CanFocus Then edID_CREDITO.SetFocus;
end;

procedure TWCrCapital.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrCapital.CheckRadioButtons(bCheck : Boolean);
var I : Integer;
begin
 With grbxSituacion Do
  For I := 0 To ControlCount - 1 Do
   If (Controls[I] Is  TRadioButton) Then
    (Controls[I] As TRadioButton).Checked := bCheck;
end;

procedure TWCrCapital.InterForma1Buscar(Sender: TObject);
begin
 With Objeto Do
  Begin
  InternalBusca;
  CheckRadioButtons(False);
  Situacion_Capital := SIT_CAPITAL.AsString;
  BuscaAcreditado;
  End;
end;

procedure TWCrCapital.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   With Objeto Do
   Begin
      SIT_CAPITAL.AsString := Situacion_Capital;
      //nuevo
     if IsNewData then
     Begin
        if MessageDlg('¿Desea almacenar los datos capturados?',
             mtConfirmation,[mbYes, mbNo], 0) = mrYes then
        Begin
             CVE_USU_ALTA.AsString := DameUsuario;
             F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
             Realizado := True;
        end
        else Realizado := False;
     end
     else
     Begin
        if MessageDlg('¿Desea guardar los datos modificados?',
             mtConfirmation,[mbYes, mbNo], 0) = mrYes then
        Begin
             CVE_USU_MODIFICA.AsString := DameUsuario;
             F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
             Realizado := True;
        end
        else Realizado := False;
     end
   End;
end;

procedure TWCrCapital.opActivaClick(Sender: TObject);

  procedure ChangColorRadioButtons(Color_ : TColor);
  var I : Integer;
  begin
   With grbxSituacion Do
    For I := 0 To ControlCount - 1 Do
     If (Controls[I] Is  TRadioButton) Then
      (Controls[I] As TRadioButton).Color := Color_;
  end;

begin

  If (Sender Is TRadioButton) Then
   Begin
   ChangColorRadioButtons(clBtnFace);
   (Sender As TRadioButton).Color := $00CCFFFF;
   End;
end;

procedure TWCrCapital.BuscaAcreditado;
begin
 With Objeto Do
  edNombre.Text := Obten_NombreAcreditado(ID_CREDITO.AsInteger,Apli);
end;

procedure TWCrCapital.InterForma1DespuesShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  CheckRadioButtons(False);
  Situacion_Capital := SIT_CAPITAL.AsString;
  BuscaAcreditado;
  End;
end;

procedure TWCrCapital.btnId_CreditoClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCAPITAL_DISP',True,True) then
   begin
     With Objeto Do
      If Busca Then BuscaAcreditado Else edNombre.Text := '';
   end;
end;

procedure TWCrCapital.ILId_CreditoCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := (InterForma1.CanEdit And InterForma1.IsNewData);
end;

procedure TWCrCapital.ILId_CreditoEjecuta(Sender: TObject);
begin
 With Objeto Do
  If Credito.FindKey([ILId_Credito.Buffer]) Then BuscaAcreditado Else edNombre.Text := '';
end;

procedure TWCrCapital.InterForma1DespuesCancelar(Sender: TObject);
begin
 BuscaAcreditado; 
end;

end.

