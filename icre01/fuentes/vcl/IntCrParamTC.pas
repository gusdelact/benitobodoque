// Sistema         : Clase de CR_PARAM_TRASCAR
// Fecha de Inicio : 10/04/2013
// Función forma   : Clase de CR_PARAM_TRASCAR
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Araceli Ramos Baz
// Comentarios     :
Unit IntCrParamTC;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid,

//Unidades Adicionales
IntParamCre, Menus, IntGenCre, InterEdit;

Type
 TCrParamTC= class;

  TWCrParamTC=Class(TForm)
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
    edCVE_PAR_TRASCAR: TInterEdit;
    Label1: TLabel;
    edPCT_PSOS_KPAGPER: TInterEdit;
    edPCT_PSOS_KPAGVEN: TInterEdit;
    edDIAS_IN_PAGADO: TInterEdit;
    edDIAS_VENC_REVOL: TInterEdit;
    edPCT_PLAZO_RSRE: TInterEdit;
    edPCT_PAG_K_RSRE: TInterEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    MsgPanel: TPanel;
    StaticText9: TStaticText;
    edPCT_LIN_RSRE_VEN: TInterEdit;
    StaticText10: TStaticText;
    edDIAS_IN_DEVENGADO: TInterEdit;
    StaticText11: TStaticText;
    dtpF_Sin_Masmen_5: TInterDateTimePicker;
    edF_Sin_Masmen_5: TEdit;
    Label32: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edPCT_PSOS_KPAGVENExit(Sender: TObject);
    procedure edPCT_PSOS_KPAGPERExit(Sender: TObject);
    procedure edDIAS_IN_PAGADOExit(Sender: TObject);
    procedure edPCT_PLAZO_RSREExit(Sender: TObject);
    procedure edPCT_PAG_K_RSREExit(Sender: TObject);
    procedure edPCT_LIN_RSRE_VENExit(Sender: TObject);
    procedure edDIAS_IN_DEVENGADOExit(Sender: TObject);
    procedure edF_Sin_Masmen_5Exit(Sender: TObject);
    procedure dtpF_Sin_Masmen_5Exit(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrParamTC;
end;
 TCrParamTC= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public 
        { Public declarations }
        CVE_PAR_TRASCAR         : TInterCampo;
        PCT_PSOS_KPAGPER        : TInterCampo;
        PCT_PSOS_KPAGVEN        : TInterCampo;
        DIAS_IN_PAGADO          : TInterCampo;
        DIAS_VENC_REVOL         : TInterCampo;
        PCT_PLAZO_RSRE          : TInterCampo;
        PCT_PAG_K_RSRE          : TInterCampo;
        PCT_LIN_RSRE_VEN        : TInterCampo;
        DIAS_IN_DEVENGADO       : TInterCampo;
        F_SIN_MASMEN_5          : TInterCampo;

        ParamCre                : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;

implementation

{$R *.DFM}

constructor TCrParamTC.Create( AOwner : TComponent );
begin Inherited;
      CVE_PAR_TRASCAR :=CreaCampo('CVE_PAR_TRASCAR',ftString,tsNinguno,tsNinguno,True);
                CVE_PAR_TRASCAR.Caption:='Clave de parámetros';
      PCT_PSOS_KPAGPER:=CreaCampo('PCT_PSOS_KPAGPER',ftFloat,tsNinguno,tsNinguno,True);
                PCT_PSOS_KPAGPER.Caption:='Porcentaje capital pagado para pago sostenido créditos periodicos';
      PCT_PSOS_KPAGVEN:=CreaCampo('PCT_PSOS_KPAGVEN',ftFloat,tsNinguno,tsNinguno,True);
                PCT_PSOS_KPAGVEN.Caption:='Porcentaje capital pagado para pago sostenido créditos Bullet o SemiBullet';
      DIAS_IN_PAGADO  :=CreaCampo('DIAS_IN_PAGADO',ftFloat,tsNinguno,tsNinguno,True);
                DIAS_IN_PAGADO.Caption:='Días de interes devengado en créditos con amortización al vencimiento en pago sostenido';
      DIAS_VENC_REVOL  :=CreaCampo('DIAS_VENC_REVOL',ftFloat,tsNinguno,tsNinguno,True);
                DIAS_VENC_REVOL.Caption:='Días de impago para créditos revolventes vigentes y traspasarlos a vencido';
      PCT_PLAZO_RSRE   :=CreaCampo('PCT_PLAZO_RSRE',ftFloat,tsNinguno,tsNinguno,True);
                PCT_PLAZO_RSRE.Caption:='% de plazo para dividirlo en 2 y evaluar RS/RE para determinar el tipo de cartera';
      PCT_PAG_K_RSRE   :=CreaCampo('PCT_PAG_K_RSRE',ftFloat,tsNinguno,tsNinguno,True);
                PCT_PAG_K_RSRE.Caption:='% capital pagado en último rango de plazo para evaluar RS/RE para determinar el tipo de cartera';
      PCT_LIN_RSRE_VEN :=CreaCampo('PCT_LIN_RSRE_VEN',ftFloat,tsNinguno,tsNinguno,True);
                PCT_LIN_RSRE_VEN.Caption:='% sobre importe dispuesto de la línea de crédito para traspasar a cartera vencida todas las disposiciones al amparo de la misma';
      DIAS_IN_DEVENGADO :=CreaCampo('DIAS_IN_DEVENGADO',ftFloat,tsNinguno,tsNinguno,True);
                DIAS_IN_DEVENGADO.Caption:='Días de interés devengado después de la fecha de corte para considerar pagado el interés';
      F_SIN_MASMEN_5 := CreaCampo('F_SIN_MASMEN_5', ftDate, tsNinguno, tsNinguno, True);
                F_SIN_MASMEN_5.Caption:= 'Fecha liberación sin mas menos 5 días';

      FKeyFields.Add('CVE_PAR_TRASCAR');

      TableName := 'CR_PARAM_TRASCAR';
      UseQuery := True;
      HelpFile := 'IntCrParamTC.Hlp';
//      ShowMenuReporte:=True;
end;

Destructor TCrParamTC.Destroy;
begin inherited;
end;


function TCrParamTC.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrParamTC;
begin
   W:=TWCrParamTC.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowBtnNuevo := False;      
      W.InterForma1.ShowBtnEliminar := False;      
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrParamTC.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrParamTC.it','S');
      Try if Active then begin T.Param(0,CVE_PAR_TRASCAR.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_AMORTIZACION********************)
(*                                                                              *)
(*  FORMA DE CR_AMORTIZACION                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_AMORTIZACION********************)

procedure TWCrParamTC.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

  with Objeto do
  begin
    CVE_PAR_TRASCAR.Control   := edCVE_PAR_TRASCAR;
    PCT_PSOS_KPAGPER.Control  := edPCT_PSOS_KPAGPER;
    PCT_PSOS_KPAGVEN.Control  := edPCT_PSOS_KPAGVEN;
    DIAS_IN_PAGADO.Control    := edDIAS_IN_PAGADO;
    DIAS_VENC_REVOL.Control   := edDIAS_VENC_REVOL;
    PCT_PLAZO_RSRE.Control    := edPCT_PLAZO_RSRE;
    PCT_PAG_K_RSRE.Control    := edPCT_PAG_K_RSRE;
    PCT_LIN_RSRE_VEN.Control  := edPCT_LIN_RSRE_VEN;
    DIAS_IN_DEVENGADO.Control := edDIAS_IN_DEVENGADO;
    F_SIN_MASMEN_5.Control    := edF_Sin_Masmen_5;
  end;

  InterForma1.MsgPanel := MsgPanel;
  Objeto.FindKey(['CRE']);
end;

procedure TWCrParamTC.FormDestroy(Sender: TObject);
begin
  with Objeto do
  begin
    CVE_PAR_TRASCAR.Control   := nil;
    PCT_PSOS_KPAGPER.Control  := nil;
    PCT_PSOS_KPAGVEN.Control  := nil;
    DIAS_IN_PAGADO.Control    := nil;
    DIAS_VENC_REVOL.Control   := nil;
    PCT_PLAZO_RSRE.Control    := nil;
    PCT_PAG_K_RSRE.Control    := nil;
    PCT_LIN_RSRE_VEN.Control  := nil;
    DIAS_IN_DEVENGADO.Control := nil;
    F_SIN_MASMEN_5.Control    := nil;
  end;
end;

procedure TWCrParamTC.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrParamTC.InterForma1DespuesNuevo(Sender: TObject);
begin
  edCVE_PAR_TRASCAR.SetFocus;
end;

procedure TWCrParamTC.InterForma1DespuesModificar(Sender: TObject);
begin
// edDESC_AMORTIZA.SetFocus;
end;


procedure TWCrParamTC.edPCT_PSOS_KPAGVENExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   VLMsg     := '';
   VLSalida := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.PCT_PSOS_KPAGVEN.GetFromControl;
      if Objeto.PCT_PSOS_KPAGVEN.AsFloat > 100 then
      begin
         VLMsg     := 'El porcentaje no puede ser mayor a 100';
         VlSalida   := False;
      end;
      InterForma1.ValidaExit(edPCT_PSOS_KPAGVEN,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrParamTC.edPCT_PSOS_KPAGPERExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   VLMsg     := '';
   VLSalida := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.PCT_PSOS_KPAGPER.GetFromControl;
      if Objeto.PCT_PSOS_KPAGPER.AsFloat > 100 then
      begin
         VLMsg     := 'El porcentaje no puede ser mayor a 100';
         VlSalida   := False;
      end;
      InterForma1.ValidaExit(edPCT_PSOS_KPAGPER,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrParamTC.edDIAS_IN_PAGADOExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edDIAS_IN_PAGADO,True,'',True);
end;

procedure TWCrParamTC.edPCT_PLAZO_RSREExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   VLMsg     := '';
   VLSalida := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.PCT_PLAZO_RSRE.GetFromControl;
      if Objeto.PCT_PLAZO_RSRE.AsFloat > 100 then
      begin
         VLMsg     := 'El porcentaje no puede ser mayor a 100';
         VlSalida   := False;
      end;
      InterForma1.ValidaExit(edPCT_PLAZO_RSRE,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrParamTC.edPCT_PAG_K_RSREExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   VLMsg     := '';
   VLSalida := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.PCT_PAG_K_RSRE.GetFromControl;
      if Objeto.PCT_PAG_K_RSRE.AsFloat > 100 then
      begin
         VLMsg     := 'El porcentaje no puede ser mayor a 100';
         VlSalida   := False;
      end;
      InterForma1.ValidaExit(edPCT_PAG_K_RSRE,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrParamTC.edPCT_LIN_RSRE_VENExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   VLMsg     := '';
   VLSalida := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.PCT_LIN_RSRE_VEN.GetFromControl;
      if Objeto.PCT_LIN_RSRE_VEN.AsFloat > 100 then
      begin
         VLMsg     := 'El porcentaje no puede ser mayor a 100';
         VlSalida   := False;
      end;
      InterForma1.ValidaExit(edPCT_LIN_RSRE_VEN,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrParamTC.edDIAS_IN_DEVENGADOExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edDIAS_IN_DEVENGADO,True,'',True);
end;

procedure TWCrParamTC.edF_Sin_Masmen_5Exit(Sender: TObject);
begin
     InterForma1.ValidaExit(edF_Sin_Masmen_5,True,'',True);
end;

procedure TWCrParamTC.dtpF_Sin_Masmen_5Exit(Sender: TObject);
begin
     InterForma1.ValidaExit(edF_Sin_Masmen_5,True,'',True);
end;

end.
