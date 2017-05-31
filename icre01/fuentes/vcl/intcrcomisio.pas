// Sistema         : Clase de CR_COMISION
// Fecha de Inicio : 29/05/2003
// Función forma   : Clase de CR_COMISION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrComisio;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntGenCre, InterEdit, IntParamCre, IntCrCatComi, IntLinkit, IntCrCredito;

Type
 TCrComisio= class; 

  TWCrComision=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_CREDITO : TLabel; 
    edID_CREDITO : TEdit;
    lbNUM_PERIODO : TLabel; 
    edNUM_PERIODO : TEdit;
    lbCVE_COMISION : TLabel; 
    edCVE_COMISION : TEdit; 
    chB_COB_AUT : TCheckBox;
    grbxSituacion: TGroupBox;
    opActiva: TRadioButton;
    opCancelada: TRadioButton;
    opImpagada: TRadioButton;
    opLiquidada: TRadioButton;
    opPorActivar: TRadioButton;
    grbxFechas: TGroupBox;
    lbF_VENCIMIENTO: TLabel;
    lbF_PROG_PAGO: TLabel;
    lbF_PAGO: TLabel;
    dtpF_VENCIMIENTO: TInterDateTimePicker;
    edF_VENCIMIENTO: TEdit;
    dtpF_PROG_PAGO: TInterDateTimePicker;
    edF_PROG_PAGO: TEdit;
    dtpF_PAGO: TInterDateTimePicker;
    edF_PAGO: TEdit;
    GroupBox1: TGroupBox;
    lbIMP_IVA_PAGADO: TLabel;
    lbIMP_BASE_CALCULO: TLabel;
    lbIMP_MORATORIO: TLabel;
    lbIMP_PAGADO_MORA: TLabel;
    lbIMP_COND_MORA: TLabel;
    lbPCT_COMISION: TLabel;
    lbTASA_APLICADA: TLabel;
    lbIMP_COMISION: TLabel;
    lbIMP_PAGADO: TLabel;
    lbIMP_IVA: TLabel;
    edIMP_IVA: TInterEdit;
    edIMP_IVA_PAGADO: TInterEdit;
    edPCT_COMISION: TInterEdit;
    edIMP_COMISION: TInterEdit;
    edIMP_PAGADO: TInterEdit;
    edTASA_APLICADA: TInterEdit;
    edIMP_BASE_CALCULO: TInterEdit;
    edIMP_MORATORIO: TInterEdit;
    edIMP_PAGADO_MORA: TInterEdit;
    edIMP_COND_MORA: TInterEdit;
    edNombre: TEdit;
    btnId_Credito: TBitBtn;
    btnCVE_COMISION: TBitBtn;
    edDESC_COMISION: TEdit;
    ILId_Credito: TInterLinkit;
    ILCve_Comision: TInterLinkit;
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
    Bevel2: TBevel;
    GroupBox3: TGroupBox;
    lblIMP_PAG_IVA_MORA: TLabel;
    lblIMP_IVA_MORA: TLabel;
    lblIMP_IVA_COND_MOR: TLabel;
    edIMP_IVA_COND_MOR: TInterEdit;
    edIMP_IVA_MORA: TInterEdit;
    edIMP_PAG_IVA_MORA: TInterEdit;
    Bevel3: TBevel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure opActivaClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure ILCve_ComisionEjecuta(Sender: TObject);
    procedure btnCVE_COMISIONClick(Sender: TObject);
    procedure btnId_CreditoClick(Sender: TObject);
    procedure ILId_CreditoCapture(Sender: TObject; var Show: Boolean);
    procedure ILId_CreditoEjecuta(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    private
    { Private declarations }
     procedure CheckRadioButtons(bCheck : Boolean);    
     procedure Set_Situacion_Comision(strValue : String);
     procedure BuscaAcreditado;
     function Get_Situacion_Comision : String;
    public
    { Public declarations }
     Objeto : TCrComisio;
     property Situacion_Comision : String Read Get_Situacion_Comision Write Set_Situacion_Comision;
end;
 TCrComisio= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_CREDITO               : TInterCampo;
        NUM_PERIODO              : TInterCampo;
        CVE_COMISION             : TInterCampo;
        B_COB_AUT                : TInterCampo;
        F_VENCIMIENTO            : TInterCampo;
        F_PROG_PAGO              : TInterCampo;
        F_PAGO                   : TInterCampo;
        IMP_COMISION             : TInterCampo;
        IMP_PAGADO               : TInterCampo;
        IMP_IVA                  : TInterCampo;
        IMP_IVA_PAGADO           : TInterCampo;
        IMP_BASE_CALCULO         : TInterCampo;
        IMP_MORATORIO            : TInterCampo;
        IMP_PAGADO_MORA          : TInterCampo;
        IMP_COND_MORA            : TInterCampo;
        PCT_COMISION             : TInterCampo;
        TASA_APLICADA            : TInterCampo;
        SIT_COMISION             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        IMP_IVA_MORA             : TInterCampo;
        IMP_PAG_IVA_MORA         : TInterCampo;
        IMP_IVA_COND_MOR         : TInterCampo;
        F_VALOR_PAGO             : TInterCampo;
        NUM_DIAS_VENCIDO         : TInterCampo;
        SIT_COMISION_DET         : TInterCampo;
        PLAZO                    : TInterCampo;
        CVE_IMP_CALC_COM         : TInterCampo;
        FOL_DV_CAR_PROV          : TInterCampo;
        FOL_DV_ABO_COMIS         : TInterCampo;
        FOL_DV_ABO_IVA           : TInterCampo;
        NUM_FACTURA              : TInterCampo;

        ParamCre                 : TParamCre;
        CrCatComi                : TCrCatComi;
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


constructor TCrComisio.Create( AOwner : TComponent ); 
begin Inherited;
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Número de Credito';
      NUM_PERIODO :=CreaCampo('NUM_PERIODO',ftFloat,tsNinguno,tsNinguno,True);
                NUM_PERIODO.Caption:='Número Periodo';
      CVE_COMISION :=CreaCampo('CVE_COMISION',ftString,tsNinguno,tsNinguno,True);
                CVE_COMISION.Caption:='Clave de Comision';
      B_COB_AUT :=CreaCampo('B_COB_AUT',ftString,tsNinguno,tsNinguno,True);
                B_COB_AUT.Caption:='Cob Aut';
      F_VENCIMIENTO :=CreaCampo('F_VENCIMIENTO',ftDate,tsNinguno,tsNinguno,True);
                F_VENCIMIENTO.Caption:='Fecha Vencimiento';
      F_PROG_PAGO :=CreaCampo('F_PROG_PAGO',ftDate,tsNinguno,tsNinguno,True);
                F_PROG_PAGO.Caption:='Fecha Prog Pago';
      F_PAGO :=CreaCampo('F_PAGO',ftDate,tsNinguno,tsNinguno,True);
                F_PAGO.Caption:='Fecha Pago';
      IMP_COMISION :=CreaCampo('IMP_COMISION',ftFloat,tsNinguno,tsNinguno,True);
                IMP_COMISION.Caption:='Imp Comision';
      IMP_PAGADO :=CreaCampo('IMP_PAGADO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_PAGADO.Caption:='Imp Pagado';
      IMP_IVA :=CreaCampo('IMP_IVA',ftFloat,tsNinguno,tsNinguno,True);
                IMP_IVA.Caption:='Imp Iva';
      IMP_IVA_PAGADO :=CreaCampo('IMP_IVA_PAGADO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_IVA_PAGADO.Caption:='Imp Iva Pagado';
      IMP_BASE_CALCULO :=CreaCampo('IMP_BASE_CALCULO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_BASE_CALCULO.Caption:='Imp Base Calculo';
      IMP_MORATORIO :=CreaCampo('IMP_MORATORIO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_MORATORIO.Caption:='Imp Moratorio';
      IMP_PAGADO_MORA :=CreaCampo('IMP_PAGADO_MORA',ftFloat,tsNinguno,tsNinguno,True);
                IMP_PAGADO_MORA.Caption:='Imp Pagado Mora';
      IMP_COND_MORA :=CreaCampo('IMP_COND_MORA',ftFloat,tsNinguno,tsNinguno,True);
                IMP_COND_MORA.Caption:='Imp Cond Mora';
      PCT_COMISION :=CreaCampo('PCT_COMISION',ftFloat,tsNinguno,tsNinguno,True);
                PCT_COMISION.Caption:='Pct Comision';
      TASA_APLICADA :=CreaCampo('TASA_APLICADA',ftFloat,tsNinguno,tsNinguno,True);
                TASA_APLICADA.Caption:='Tasa Aplicada';
      SIT_COMISION :=CreaCampo('SIT_COMISION',ftString,tsNinguno,tsNinguno,True);
                SIT_COMISION.Caption:='Situación Comision';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      IMP_IVA_MORA :=CreaCampo('IMP_IVA_MORA',ftFloat,tsNinguno,tsNinguno,True);
                IMP_IVA_MORA.Caption:='Imp IVA Mora';
      IMP_PAG_IVA_MORA :=CreaCampo('IMP_PAG_IVA_MORA',ftFloat,tsNinguno,tsNinguno,True);
                IMP_PAG_IVA_MORA.Caption:='Imp Pagado IVA Mora';
      IMP_IVA_COND_MOR :=CreaCampo('IMP_IVA_COND_MOR',ftFloat,tsNinguno,tsNinguno,True);
                IMP_COND_MORA.Caption:='Imp IVA Condonado Mora';
      F_VALOR_PAGO :=CreaCampo('F_VALOR_PAGO',ftFloat,tsNinguno,tsNinguno,True);
                F_VALOR_PAGO.Caption:='Fecha Valor';
      NUM_DIAS_VENCIDO :=CreaCampo('NUM_DIAS_VENCIDO',ftFloat,tsNinguno,tsNinguno,True);
                NUM_DIAS_VENCIDO.Caption:='Num. Días Vencido';
      SIT_COMISION_DET :=CreaCampo('SIT_COMISION_DET',ftFloat,tsNinguno,tsNinguno,True);
                SIT_COMISION_DET.Caption:='Sit. Comisión Det';
      PLAZO :=CreaCampo('PLAZO',ftFloat,tsNinguno,tsNinguno,True);
                PLAZO.Caption:='Plazo';
      CVE_IMP_CALC_COM :=CreaCampo('CVE_IMP_CALC_COM',ftFloat,tsNinguno,tsNinguno,True);
                CVE_IMP_CALC_COM.Caption:='Cve. Imp. Calculo Comis';
      FOL_DV_CAR_PROV :=CreaCampo('FOL_DV_CAR_PROV',ftFloat,tsNinguno,tsNinguno,True);
                FOL_DV_CAR_PROV.Caption:='Fol. DV. Cargo Prov.';
      FOL_DV_ABO_COMIS :=CreaCampo('FOL_DV_ABO_COMIS',ftFloat,tsNinguno,tsNinguno,True);
                FOL_DV_ABO_COMIS.Caption:='Fol. DV. Abono Comis.';
      FOL_DV_ABO_IVA :=CreaCampo('FOL_DV_ABO_IVA',ftFloat,tsNinguno,tsNinguno,True);
                FOL_DV_ABO_IVA.Caption:='Fol. DV. Abomo IVA';
      NUM_FACTURA :=CreaCampo('NUM_FACTURA',ftFloat,tsNinguno,tsNinguno,True);
                NUM_FACTURA.Caption:='Num. FActura';

      FKeyFields.Add('ID_CREDITO');
      FKeyFields.Add('NUM_PERIODO');
      FKeyFields.Add('CVE_COMISION');

      CrCatComi := TCrCatComi.Create(Self);
      CrCatComi.MasterSource := Self;
      CrCatComi.CVE_COMISION.MasterField := 'CVE_COMISION';

      Credito  := TCrCredito.Create(Self);
      Credito.MasterSource := Self;
      Credito.ID_CREDITO.MasterField := 'ID_CREDITO';

      TableName := 'CR_COMISION';
      UseQuery := True;
      HelpFile := 'IntCrComisio.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrComisio.Destroy;
begin inherited;
end;

function TCrComisio.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrComision;
begin
   W:=TWCrComision.Create(Self);
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


Function TCrComisio.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrComis.it','F,F,S');
      Try if Active then begin T.Param(0,ID_CREDITO.AsString);
                               T.Param(1,NUM_PERIODO.AsString);
                               T.Param(2,CVE_COMISION.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end;
end;

function TCrComisio.Reporte:Boolean;
begin Result := False;
end;


(***********************************************FORMA CR_COMISION********************)
(*                                                                              *)
(*  FORMA DE CR_COMISION                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_COMISION********************)

function TWCrComision.Get_Situacion_Comision: String;
begin
 If opActiva.Checked Then Result := CSIT_AC
 Else If opCancelada.Checked Then Result := CSIT_CA
 Else If opImpagada.Checked  Then Result := CSIT_IM
 Else If opLiquidada.Checked Then Result := CSIT_LQ
 Else Result := CSIT_PA;
end;

procedure TWCrComision.Set_Situacion_Comision(strValue: String);
begin
 If (strValue = CSIT_AC) Then opActiva.Checked := True
 Else If (strValue = CSIT_CA) Then opCancelada.Checked := True
 Else If (strValue = CSIT_IM) Then opImpagada.Checked  := True
 Else If (strValue = CSIT_LQ) Then opLiquidada.Checked := True
 Else opPorActivar.Checked := True;
end;

procedure TWCrComision.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  CrCatComi.CVE_COMISION.Control := edCVE_COMISION;
  CrCatComi.DESC_COMISION.Control := edDESC_COMISION;

  ID_CREDITO.Control:=edID_CREDITO;
  NUM_PERIODO.Control:=edNUM_PERIODO;
  CVE_COMISION.Control:=edCVE_COMISION;
  B_COB_AUT.Control:=chB_COB_AUT;
  F_VENCIMIENTO.Control:=edF_VENCIMIENTO;
  F_PROG_PAGO.Control:=edF_PROG_PAGO;
  F_PAGO.Control:=edF_PAGO;
  IMP_COMISION.Control:=edIMP_COMISION;
  IMP_PAGADO.Control:=edIMP_PAGADO;
  IMP_IVA.Control:=edIMP_IVA;
  IMP_IVA_PAGADO.Control:=edIMP_IVA_PAGADO;
  IMP_BASE_CALCULO.Control:=edIMP_BASE_CALCULO;
  IMP_MORATORIO.Control:=edIMP_MORATORIO;
  IMP_PAGADO_MORA.Control:=edIMP_PAGADO_MORA;
  IMP_COND_MORA.Control:=edIMP_COND_MORA;
  PCT_COMISION.Control:=edPCT_COMISION;
  TASA_APLICADA.Control:=edTASA_APLICADA;
  IMP_IVA_MORA.Control := edIMP_IVA_MORA;
  IMP_PAG_IVA_MORA.Control := edIMP_PAG_IVA_MORA;
  IMP_IVA_COND_MOR.Control := edIMP_IVA_COND_MOR;

  Credito.ID_CREDITO.Control := edID_CREDITO;
  Credito.CONTRATOCRE.ACREDITADO.PERSONA.NOMBRE.Control := edNombre;
  End;
end;

procedure TWCrComision.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  CrCatComi.CVE_COMISION.Control := Nil;
  CrCatComi.DESC_COMISION.Control := Nil;

  ID_CREDITO.Control        := Nil;
  NUM_PERIODO.Control       := Nil;
  CVE_COMISION.Control      := Nil;
  B_COB_AUT.Control         := Nil;
  F_VENCIMIENTO.Control     := Nil;
  F_PROG_PAGO.Control       := Nil;
  F_PAGO.Control            := Nil;
  IMP_COMISION.Control      := Nil;
  IMP_PAGADO.Control        := Nil;
  IMP_IVA.Control           := Nil;
  IMP_IVA_PAGADO.Control    := Nil;
  IMP_BASE_CALCULO.Control  := Nil;
  IMP_MORATORIO.Control     := Nil;
  IMP_PAGADO_MORA.Control   := Nil;
  IMP_COND_MORA.Control     := Nil;
  PCT_COMISION.Control      := Nil;
  TASA_APLICADA.Control     := Nil;
  IMP_IVA_MORA.Control      := Nil;
  IMP_PAG_IVA_MORA.Control  := Nil;
  IMP_IVA_COND_MOR.Control  := Nil;

  Credito.ID_CREDITO.Control := Nil;
  Credito.CONTRATOCRE.ACREDITADO.PERSONA.NOMBRE.Control := Nil;  
  End;
end;

procedure TWCrComision.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrComision.InterForma1DespuesNuevo(Sender: TObject);
begin If edID_CREDITO.CanFocus Then edID_CREDITO.SetFocus;
end;

procedure TWCrComision.InterForma1DespuesModificar(Sender: TObject);
begin If edID_CREDITO.CanFocus Then edID_CREDITO.SetFocus;
end;


procedure TWCrComision.opActivaClick(Sender: TObject);
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


procedure TWCrComision.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
 With Objeto Do
  Begin
  SIT_COMISION.AsString := Situacion_Comision;

  If (Modo = moAppend) Then
   Begin
   CVE_USU_ALTA.AsString := DameUsuario;
   F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
   End
  Else
   Begin
   CVE_USU_MODIFICA.AsString := DameUsuario;
   F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
   End;
  End;
end;

procedure TWCrComision.CheckRadioButtons(bCheck : Boolean);
var I : Integer;
begin
 With grbxSituacion Do
  For I := 0 To ControlCount - 1 Do
   If (Controls[I] Is  TRadioButton) Then
    (Controls[I] As TRadioButton).Checked := bCheck;
end;

procedure TWCrComision.InterForma1Buscar(Sender: TObject);
begin
 With Objeto Do
  Begin
  InternalBusca;
  CheckRadioButtons(False);
  Situacion_Comision := SIT_COMISION.AsString;
  BuscaAcreditado;
  End;
end;

procedure TWCrComision.InterForma1DespuesShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  CheckRadioButtons(False);
  Situacion_Comision := SIT_COMISION.AsString;
  BuscaAcreditado;
  End;
end;

procedure TWCrComision.ILCve_ComisionEjecuta(Sender: TObject);
begin
 Objeto.CrCatComi.FindKey([ILCve_Comision.Buffer]);
end;

procedure TWCrComision.btnCVE_COMISIONClick(Sender: TObject);
begin
 Objeto.CrCatComi.Busca;
end;

procedure TWCrComision.BuscaAcreditado;
begin
 With Objeto Do
  edNombre.Text := Obten_NombreAcreditado(ID_CREDITO.AsInteger,Apli)
end;

procedure TWCrComision.btnId_CreditoClick(Sender: TObject);
begin
 With Objeto Do
  If Busca Then BuscaAcreditado Else edNombre.Text := '';
end;

procedure TWCrComision.ILId_CreditoCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := (InterForma1.CanEdit And InterForma1.IsNewData);
end;

procedure TWCrComision.ILId_CreditoEjecuta(Sender: TObject);
begin
 With Objeto Do
  If Credito.FindKey([ILId_Credito.Buffer]) Then BuscaAcreditado Else edNombre.Text := '';
end;

procedure TWCrComision.InterForma1DespuesCancelar(Sender: TObject);
begin
 BuscaAcreditado;
end;

end.
