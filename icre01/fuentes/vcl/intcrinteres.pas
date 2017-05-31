{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
// Sistema         : Clase de CR_INTERES
// Fecha de Inicio : 29/05/2003
// Función forma   : Clase de CR_INTERES
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrInteres;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntGenCre, InterEdit, IntLinkit, IntParamCre, IntCrCredito;

Type
 TCrInteres= class; 

  TWCrInteres=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_CREDITO : TLabel; 
    edID_CREDITO : TEdit;
    lbNUM_PERIODO : TLabel; 
    edNUM_PERIODO : TEdit; 
    chB_COB_AUT : TCheckBox;
    lbPLAZO : TLabel; 
    edPLAZO : TEdit;
    grbxSituacion: TGroupBox;
    opActiva: TRadioButton;
    opCancelada: TRadioButton;
    opImpagada: TRadioButton;
    opLiquidada: TRadioButton;
    opPorActivar: TRadioButton;
    GroupBox1: TGroupBox;
    lbF_VENCIMIENTO: TLabel;
    dtpF_VENCIMIENTO: TInterDateTimePicker;
    edF_VENCIMIENTO: TEdit;
    lbF_PROG_PAGO: TLabel;
    dtpF_PROG_PAGO: TInterDateTimePicker;
    edF_PROG_PAGO: TEdit;
    lbF_PAGO: TLabel;
    dtpF_PAGO: TInterDateTimePicker;
    edF_PAGO: TEdit;
    GroupBox2: TGroupBox;
    lbIMP_INTERES: TLabel;
    lbIMP_PAGADO: TLabel;
    lbIMP_INTERES_DIA: TLabel;
    lbIMP_INTERES_PROY: TLabel;
    lbIMP_IVA: TLabel;
    lbIMP_IVA_PAGADO: TLabel;
    lbIMP_IVA_PROY: TLabel;
    lbIMP_BENEF_BCO: TLabel;
    lbIMP_BENEF_GOB: TLabel;
    lbTASA_APLICADA: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    edTASA_APLICADA: TInterEdit;
    edIMP_INTERES: TInterEdit;
    edIMP_PAGADO: TInterEdit;
    edIMP_INTERES_DIA: TInterEdit;
    edIMP_INTERES_PROY: TInterEdit;
    edIMP_BENEF_BCO: TInterEdit;
    edIMP_BENEF_GOB: TInterEdit;
    edIMP_IVA: TInterEdit;
    edIMP_IVA_PAGADO: TInterEdit;
    edIMP_IVA_PROY: TInterEdit;
    btnId_Credito: TBitBtn;
    edNombre: TEdit;
    ILId_Credito: TInterLinkit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure opActivaClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure btnId_CreditoClick(Sender: TObject);
    procedure ILId_CreditoCapture(Sender: TObject; var Show: Boolean);
    procedure ILId_CreditoEjecuta(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    private 
    { Private declarations }
    function  Get_Situacion_Interes : String;
    procedure Set_Situacion_Interes(strValue : String);
    procedure CheckRadioButtons(bCheck : Boolean);
    procedure BuscaAcreditado;
    public
    { Public declarations }
    Objeto : TCrInteres;
    property Situacion_Interes : String Read Get_Situacion_Interes Write Set_Situacion_Interes;    
end; 
 TCrInteres= class(TInterFrame)
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
        IMP_INTERES              : TInterCampo;
        IMP_PAGADO               : TInterCampo;
        IMP_INTERES_DIA          : TInterCampo;
        IMP_INTERES_PROY         : TInterCampo;
        IMP_IVA                  : TInterCampo;
        IMP_IVA_PAGADO           : TInterCampo;
        IMP_IVA_PROY             : TInterCampo;
        IMP_BENEF_BCO            : TInterCampo;
        IMP_BENEF_GOB            : TInterCampo;
        IMP_MORATORIO            : TInterCampo;
        IMP_PAGADO_MORA          : TInterCampo;
        IMP_COND_MORA            : TInterCampo;
        TASA_APLICADA            : TInterCampo;
        SIT_INTERES              : TInterCampo;
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
//Uses RepMon;

{$R *.DFM}

constructor TCrInteres.Create( AOwner : TComponent ); 
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
      IMP_INTERES :=CreaCampo('IMP_INTERES',ftFloat,tsNinguno,tsNinguno,True);
                IMP_INTERES.Caption:='Imp Interes';
      IMP_PAGADO :=CreaCampo('IMP_PAGADO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_PAGADO.Caption:='Imp Pagado';
      IMP_INTERES_DIA :=CreaCampo('IMP_INTERES_DIA',ftFloat,tsNinguno,tsNinguno,True);
                IMP_INTERES_DIA.Caption:='Imp Interes Dia';
      IMP_INTERES_PROY :=CreaCampo('IMP_INTERES_PROY',ftFloat,tsNinguno,tsNinguno,True);
                IMP_INTERES_PROY.Caption:='Imp Interes Proy';
      IMP_IVA :=CreaCampo('IMP_IVA',ftFloat,tsNinguno,tsNinguno,True);
                IMP_IVA.Caption:='Imp Iva';
      IMP_IVA_PAGADO :=CreaCampo('IMP_IVA_PAGADO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_IVA_PAGADO.Caption:='Imp Iva Pagado';
      IMP_IVA_PROY :=CreaCampo('IMP_IVA_PROY',ftFloat,tsNinguno,tsNinguno,True);
                IMP_IVA_PROY.Caption:='Imp Iva Proy';
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
      TASA_APLICADA :=CreaCampo('TASA_APLICADA',ftFloat,tsNinguno,tsNinguno,True);
                TASA_APLICADA.Caption:='Tasa Aplicada';
      SIT_INTERES :=CreaCampo('SIT_INTERES',ftString,tsNinguno,tsNinguno,True);
                SIT_INTERES.Caption:='Situación Interes';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      IMP_IVA_MORA :=CreaCampo('IMP_IVA_MORA',ftFloat,tsNinguno,tsNinguno,True);
                IMP_IVA_MORA.Caption:='Imp Iva Mora';
      IMP_PAG_IVA_MORA :=CreaCampo('IMP_PAG_IVA_MORA',ftFloat,tsNinguno,tsNinguno,True);
                IMP_PAG_IVA_MORA.Caption:='Imp Pagado Iva Mora';
      IMP_IVA_COND_MOR :=CreaCampo('IMP_IVA_COND_MOR',ftFloat,tsNinguno,tsNinguno,True);
                IMP_IVA_COND_MOR.Caption:='Imp Iva Condonado Mora';
                
      FKeyFields.Add('ID_CREDITO');
      FKeyFields.Add('NUM_PERIODO');

      Credito  := TCrCredito.Create(Self);
      Credito.MasterSource := Self;
      Credito.ID_CREDITO.MasterField := 'ID_CREDITO';

      TableName := 'CR_INTERES'; 
      UseQuery := True; 
      HelpFile := 'IntCrInteres.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrInteres.Destroy;
begin inherited;
end;


function TCrInteres.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrInteres;
begin
   W:=TWCrInteres.Create(Self);
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


Function TCrInteres.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrInter.it','F,F');
      Try if Active then begin T.Param(0,ID_CREDITO.AsString); 
                               T.Param(1,NUM_PERIODO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; 
end;

function TCrInteres.Reporte:Boolean; 
begin Result := False; 
end;


(***********************************************FORMA CR_INTERES********************)
(*                                                                              *)
(*  FORMA DE CR_INTERES                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_INTERES********************)

procedure TWCrInteres.FormShow(Sender: TObject);
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
  IMP_INTERES.Control:=edIMP_INTERES;
  IMP_PAGADO.Control:=edIMP_PAGADO;
  IMP_INTERES_DIA.Control:=edIMP_INTERES_DIA;
  IMP_INTERES_PROY.Control:=edIMP_INTERES_PROY;
  IMP_IVA.Control:=edIMP_IVA;
  IMP_IVA_PAGADO.Control:=edIMP_IVA_PAGADO;
  IMP_IVA_PROY.Control:=edIMP_IVA_PROY;
  IMP_BENEF_BCO.Control:=edIMP_BENEF_BCO;
  IMP_BENEF_GOB.Control:=edIMP_BENEF_GOB;
{  IMP_MORATORIO.Control:=edIMP_MORATORIO;
  IMP_PAGADO_MORA.Control:=edIMP_PAGADO_MORA;
  IMP_COND_MORA.Control:=edIMP_COND_MORA; }
  TASA_APLICADA.Control:=edTASA_APLICADA;
{  IMP_IVA_MORA.Control := edIMP_IVA_MORA;
  IMP_PAG_IVA_MORA.Control := edIMP_PAG_IVA_MORA;
  IMP_IVA_COND_MOR.Control := edIMP_IVA_COND_MOR; }


  Credito.ID_CREDITO.Control := edID_CREDITO;
  Credito.CONTRATOCRE.ACREDITADO.PERSONA.NOMBRE.Control := edNombre;
  End;
end;

procedure TWCrInteres.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  ID_CREDITO.Control       := Nil;
  NUM_PERIODO.Control      := Nil;
  B_COB_AUT.Control        := Nil;
  PLAZO.Control            := Nil;
  F_VENCIMIENTO.Control    := Nil;
  F_PROG_PAGO.Control      := Nil;
  F_PAGO.Control           := Nil;
  IMP_INTERES.Control      := Nil;
  IMP_PAGADO.Control       := Nil;
  IMP_INTERES_DIA.Control  := Nil;
  IMP_INTERES_PROY.Control := Nil;
  IMP_IVA.Control          := Nil;
  IMP_IVA_PAGADO.Control   := Nil;
  IMP_IVA_PROY.Control     := Nil;
  IMP_BENEF_BCO.Control    := Nil;
  IMP_BENEF_GOB.Control    := Nil;
{  IMP_MORATORIO.Control    := Nil;
  IMP_PAGADO_MORA.Control  := Nil;
  IMP_COND_MORA.Control    := Nil; }
  TASA_APLICADA.Control    := Nil;
{  IMP_IVA_MORA.Control     := Nil;
  IMP_PAG_IVA_MORA.Control := Nil;
  IMP_IVA_COND_MOR.Control := Nil; }

  Credito.ID_CREDITO.Control := Nil;
  Credito.CONTRATOCRE.ACREDITADO.PERSONA.NOMBRE.Control := Nil;
  End;
end;

procedure TWCrInteres.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrInteres.InterForma1DespuesNuevo(Sender: TObject);
begin If edID_CREDITO.CanFocus Then edID_CREDITO.SetFocus;
end;

function TWCrInteres.Get_Situacion_Interes: String;
begin
 If opActiva.Checked Then Result := CSIT_AC
 Else If opCancelada.Checked Then Result := CSIT_CA
 Else If opImpagada.Checked  Then Result := CSIT_IM
 Else If opLiquidada.Checked Then Result := CSIT_LQ
 Else Result := CSIT_PA;
end;

procedure TWCrInteres.Set_Situacion_Interes(strValue: String);
begin
 If (strValue = CSIT_AC) Then opActiva.Checked := True
 Else If (strValue = CSIT_CA) Then opCancelada.Checked := True
 Else If (strValue = CSIT_IM) Then opImpagada.Checked  := True
 Else If (strValue = CSIT_LQ) Then opLiquidada.Checked := True
 Else opPorActivar.Checked := True;
end;

procedure TWCrInteres.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   With Objeto Do
   Begin
      SIT_INTERES.AsString := Situacion_Interes;
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

procedure TWCrInteres.InterForma1Buscar(Sender: TObject);
begin
 With Objeto Do
  Begin
  InternalBusca;
  CheckRadioButtons(False);
  Situacion_Interes := SIT_INTERES.AsString;
  BuscaAcreditado;
  End;
end;

procedure TWCrInteres.opActivaClick(Sender: TObject);

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

procedure TWCrInteres.CheckRadioButtons(bCheck : Boolean);
var I : Integer;
begin
 With grbxSituacion Do
  For I := 0 To ControlCount - 1 Do
   If (Controls[I] Is  TRadioButton) Then
    (Controls[I] As TRadioButton).Checked := bCheck;
end;

procedure TWCrInteres.InterForma1DespuesShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  CheckRadioButtons(False);
  Situacion_Interes := Objeto.SIT_INTERES.AsString;
  BuscaAcreditado;
  End;
end;

procedure TWCrInteres.BuscaAcreditado;
begin
 With Objeto Do
  edNombre.Text := Obten_NombreAcreditado(ID_CREDITO.AsInteger,Apli)
end;

procedure TWCrInteres.btnId_CreditoClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRINTERES_DISP',True,True) then
   begin
     With Objeto Do
      If Busca Then BuscaAcreditado Else edNombre.Text := '';
   end;
end;

procedure TWCrInteres.ILId_CreditoCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := (InterForma1.CanEdit And InterForma1.IsNewData);
end;

procedure TWCrInteres.ILId_CreditoEjecuta(Sender: TObject);
begin
 With Objeto Do
  If Credito.FindKey([ILId_Credito.Buffer]) Then BuscaAcreditado Else edNombre.Text := '';
end;

procedure TWCrInteres.InterForma1DespuesCancelar(Sender: TObject);
begin
 BuscaAcreditado;
end;

end.
