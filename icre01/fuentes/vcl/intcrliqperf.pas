// Sistema         : Clase de CR_LIQ_PERFIL
// Fecha de Inicio : 16/01/2004
// Función forma   : Clase de CR_LIQ_PERFIL
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrLiqPerf;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit,IntLinkit,
//UNIDADES ADICIONALES
IntParamCre,
IntGenCre,
IntSecGpAcc,
IntCrLiqDis,
IntCrLiqMedi
;

Type
 TCrLiqPerf= class; 

  TWCrLiqPerfil=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_GPO_ACCESO : TLabel; 
    edCVE_GPO_ACCESO : TEdit;
    lbCVE_MEDIO : TLabel; 
    edCVE_MEDIO : TEdit;
    lbCVE_LIQUIDACION : TLabel; 
    edCVE_LIQUIDACION : TEdit; 
    chB_REQ_AUTOR : TCheckBox; 
    chB_CANCELA : TCheckBox; 
    rgSIT_LIQ_PERFIL : TRadioGroup;
    gbHORARIO: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    edFH_CAPTURA: TEdit;
    edH_MODIFICA: TEdit;
    edCVE_USUA_ALTA: TEdit;
    edCVE_USUA_MODIF: TEdit;
    MsgPanel: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    btMED_LIQ: TBitBtn;
    edNOM_MEDIO: TEdit;
    IedH_INICIO: TInterEdit;
    IedH_FINAL: TInterEdit;
    IedIMP_INFERIOR: TInterEdit;
    IedIMP_SUPERIOR: TInterEdit;
    edLIQUIDACION: TEdit;
    btCVE_LIQUIDA: TBitBtn;
    ilMED_LIQ: TInterLinkit;
    ilCVE_LIQ: TInterLinkit;
    btnCVE_GPO_ACCESO: TBitBtn;
    edNOM_GPO_ACCESO: TEdit;
    ILCVE_GPO_ACCESO: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_GPO_ACCESOExit(Sender: TObject);
    procedure edCVE_MEDIOExit(Sender: TObject);
    procedure edCVE_LIQUIDACIONExit(Sender: TObject);
    procedure IedH_INICIOExit(Sender: TObject);
    procedure IedH_FINALExit(Sender: TObject);
    procedure IedIMP_INFERIORExit(Sender: TObject);
    procedure IedIMP_SUPERIORExit(Sender: TObject);
    procedure chB_REQ_AUTORExit(Sender: TObject);
    procedure chB_CANCELAExit(Sender: TObject);
    procedure rgSIT_LIQ_PERFILExit(Sender: TObject);
    procedure btMED_LIQClick(Sender: TObject);
    procedure btCVE_LIQUIDAClick(Sender: TObject);
    procedure ilMED_LIQEjecuta(Sender: TObject);
    procedure ilCVE_LIQEjecuta(Sender: TObject);
    procedure btnCVE_GPO_ACCESOClick(Sender: TObject);
    procedure ILCVE_GPO_ACCESOEjecuta(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrLiqPerf;
end; 
 TCrLiqPerf= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_GPO_ACCESO           : TInterCampo;
        CVE_MEDIO                : TInterCampo;
        CVE_LIQUIDACION          : TInterCampo;
        H_INICIO                 : TInterCampo;
        H_FINAL                  : TInterCampo;
        IMP_INFERIOR             : TInterCampo;
        IMP_SUPERIOR             : TInterCampo;
        B_REQ_AUTOR              : TInterCampo;
        B_CANCELA                : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        FH_CAPTURA               : TInterCampo;
        CVE_USUARIO_MOD          : TInterCampo;
        H_MODIFICA               : TInterCampo;
        SIT_LIQ_PERFIL           : TInterCampo;

        ParamCre                 : TParamCre;
        Perfil                   : TSecGpAcc;
        MediosLiq                : TCrLiqDis;
        Medio                    : TCrLiqMedi;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrLiqPerf.Create( AOwner : TComponent );
begin Inherited;
      CVE_GPO_ACCESO :=CreaCampo('CVE_GPO_ACCESO',ftString,tsNinguno,tsNinguno,True);
                CVE_GPO_ACCESO.Caption:='Grupo Acceso';
      CVE_MEDIO :=CreaCampo('CVE_MEDIO',ftString,tsNinguno,tsNinguno,True);
                CVE_MEDIO.Caption:='Medio de Liquidación';
      CVE_LIQUIDACION :=CreaCampo('CVE_LIQUIDACION',ftString,tsNinguno,tsNinguno,True);
                CVE_LIQUIDACION.Caption:='Cve. Liquidación';
      H_INICIO :=CreaCampo('H_INICIO',ftFloat,tsNinguno,tsNinguno,True);
                H_INICIO.Caption:='Hr. Inicio';
      H_FINAL :=CreaCampo('H_FINAL',ftFloat,tsNinguno,tsNinguno,True);
                H_FINAL.Caption:='Hr. Final';
      IMP_INFERIOR :=CreaCampo('IMP_INFERIOR',ftFloat,tsNinguno,tsNinguno,True);
                IMP_INFERIOR.Caption:='Imp Inferior';
      IMP_SUPERIOR :=CreaCampo('IMP_SUPERIOR',ftFloat,tsNinguno,tsNinguno,True);
                IMP_SUPERIOR.Caption:='Imp Superior';
      B_REQ_AUTOR :=CreaCampo('B_REQ_AUTOR',ftString,tsNinguno,tsNinguno,True);
                B_REQ_AUTOR.Caption:='Autoriza Liq.';
      B_CANCELA :=CreaCampo('B_CANCELA',ftString,tsNinguno,tsNinguno,True);
                B_CANCELA.Caption:='Cancela Liq.';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      FH_CAPTURA :=CreaCampo('FH_CAPTURA',ftDateTime,tsNinguno,tsNinguno,True);
                FH_CAPTURA.Caption:='Fecha y Hora Captura';
      CVE_USUARIO_MOD :=CreaCampo('CVE_USUARIO_MOD',ftString,tsNinguno,tsNinguno,True);
                CVE_USUARIO_MOD.Caption:='Clave de Usuario Mod';
      H_MODIFICA :=CreaCampo('H_MODIFICA',ftFloat,tsNinguno,tsNinguno,True);
                H_MODIFICA.Caption:='H Modifica';
      SIT_LIQ_PERFIL :=CreaCampo('SIT_LIQ_PERFIL',ftString,tsNinguno,tsNinguno,True);
                SIT_LIQ_PERFIL.Caption:='Situación Perfil';
      FKeyFields.Add('CVE_GPO_ACCESO');
      FKeyFields.Add('CVE_MEDIO');
      FKeyFields.Add('CVE_LIQUIDACION');

      TableName := 'CR_LIQ_PERFIL'; 
      UseQuery := True; 
      HelpFile := 'IntCrLiqPerf.Hlp';
      ShowMenuReporte:=True;

      Perfil := TSecGpAcc.Create(Self);
      Perfil.MasterSource := Self;

      MediosLiq := TCrLiqDis.Create(Self);
      MediosLiq.MasterSource:=Self;
      MediosLiq.FieldByName('CVE_LIQUIDACION').MasterField:='CVE_LIQUIDACION';

      Medio := TCrLiqMedi.Create(Self);
      Medio.MasterSource:=Self;
      Medio.FieldByName('CVE_MEDIO').MasterField:='CVE_MEDIO';
end;

Destructor TCrLiqPerf.Destroy;
begin
   if Perfil <> nil then
      Perfil.free;
   //end if

   if MediosLiq <> nil then
      MediosLiq.free;
   //end if

   if Medio <> nil then
      Medio.free;
   //end if

    inherited;
end;


function TCrLiqPerf.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrLiqPerfil;
begin
   W:=TWCrLiqPerfil.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrLiqPerf.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrLiPe.it','S,S,S');
      Try if Active then begin T.Param(0,CVE_GPO_ACCESO.AsString);
                               T.Param(1,CVE_MEDIO.AsString);
                               T.Param(2,CVE_LIQUIDACION.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end;
end;


(***********************************************FORMA CR_LIQ_PERFIL********************)
(*                                                                              *)
(*  FORMA DE CR_LIQ_PERFIL                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_LIQ_PERFIL********************)

procedure TWCrLiqPerfil.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_GPO_ACCESO.Control:=edCVE_GPO_ACCESO;
      Objeto.CVE_MEDIO.Control:=edCVE_MEDIO;
      Objeto.CVE_LIQUIDACION.Control:=edCVE_LIQUIDACION;
      Objeto.H_INICIO.Control:=IedH_INICIO;
      Objeto.H_FINAL.Control:=IedH_FINAL;
      Objeto.IMP_INFERIOR.Control:=IedIMP_INFERIOR;
      Objeto.IMP_SUPERIOR.Control:=IedIMP_SUPERIOR;
      Objeto.B_REQ_AUTOR.Control:=chB_REQ_AUTOR;
      Objeto.B_CANCELA.Control:=chB_CANCELA;
      Objeto.SIT_LIQ_PERFIL.Control:=rgSIT_LIQ_PERFIL;
      Objeto.CVE_USU_ALTA.Control := edCVE_USUA_ALTA;
      Objeto.FH_CAPTURA.Control := edFH_CAPTURA;
      Objeto.CVE_USUARIO_MOD.Control := edCVE_USUA_MODIF;
      Objeto.H_MODIFICA.Control := edH_MODIFICA;

      Objeto.Perfil.CVE_APLICACION.AsString := Objeto.Apli.Apli;
      Objeto.Perfil.ID_GPO_ACCESO.Control := edCVE_GPO_ACCESO;
      Objeto.Perfil.NOM_GPO_ACCESO.Control := edNOM_GPO_ACCESO;
      Objeto.Perfil.BuscaWhereString := 'SECU_GPO_ACCESO.CVE_APLICACION = '#39+Objeto.Apli.Apli+#39;

      Objeto.MediosLiq.DESC_LIQUIDACION.Control :=  edLIQUIDACION;
      Objeto.MediosLiq.GetParams(Objeto);

      Objeto.Medio.DESC_MEDIO.Control :=  edNOM_MEDIO;
      Objeto.Medio.GetParams(Objeto);

      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrLiqPerfil.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_GPO_ACCESO.Control:=nil;
      Objeto.CVE_MEDIO.Control:=nil;
      Objeto.CVE_LIQUIDACION.Control:=nil;
      Objeto.H_INICIO.Control:=nil;
      Objeto.H_FINAL.Control:=nil;
      Objeto.IMP_INFERIOR.Control:=nil;
      Objeto.IMP_SUPERIOR.Control:=nil;
      Objeto.B_REQ_AUTOR.Control:=nil;
      Objeto.B_CANCELA.Control:=nil;
      Objeto.SIT_LIQ_PERFIL.Control:=nil;
      Objeto.CVE_USU_ALTA.Control := nil;
      Objeto.FH_CAPTURA.Control := nil;
      Objeto.CVE_USUARIO_MOD.Control := nil;
      Objeto.H_MODIFICA.Control := nil;

      Objeto.Perfil.ID_GPO_ACCESO.Control := nil;
      Objeto.Perfil.NOM_GPO_ACCESO.Control := Nil;
      Objeto.MediosLiq.DESC_LIQUIDACION.Control :=  nil;
      Objeto.Medio.DESC_MEDIO.Control :=  nil;
   //Objeto
end;

procedure TWCrLiqPerfil.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrLiqPerfil.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.FH_CAPTURA.AsDateTime := Now;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   rgSIT_LIQ_PERFIL.ItemIndex := 0;
   edCVE_GPO_ACCESO.SetFocus;
end;

procedure TWCrLiqPerfil.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.H_MODIFICA.AsInteger := ConverFechaAHora(Objeto.Apli.SysDateTime);
   Objeto.CVE_USUARIO_MOD.AsString := Objeto.Apli.Usuario;
   IedH_INICIO.SetFocus;
end;

procedure TWCrLiqPerfil.edCVE_GPO_ACCESOExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg      : String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlSalida := True;
      vlMsg := CNULL;
      Objeto.CVE_GPO_ACCESO.GetFromControl;
      if Objeto.CVE_GPO_ACCESO.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg      :='Por favor indique la clave del grupo de acceso';
      end;
      InterForma1.ValidaExit(edCVE_GPO_ACCESO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrLiqPerfil.edCVE_MEDIOExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg      : String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlSalida := True;
      vlMsg := CNULL;
      Objeto.CVE_MEDIO.GetFromControl;
      if Objeto.CVE_MEDIO.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg      :='Por favor indique la clave del Medio de Liquidación';
      end;
      InterForma1.ValidaExit(edCVE_MEDIO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrLiqPerfil.edCVE_LIQUIDACIONExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg      : String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlSalida := True;
      vlMsg := CNULL;
      Objeto.CVE_LIQUIDACION.GetFromControl;
      if Objeto.CVE_LIQUIDACION.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg      :='Por favor indique el medio de Liquidación';
      end;
      InterForma1.ValidaExit(edCVE_LIQUIDACION,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrLiqPerfil.IedH_INICIOExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg      : String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlSalida := True;
      vlMsg := CNULL;
      Objeto.H_INICIO.GetFromControl;
      if Objeto.H_INICIO.AsInteger < 0 then
      Begin
         vlSalida   := False;
         vlMsg      :='No se admiten números negativos';
      end;
      InterForma1.ValidaExit(IedH_INICIO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrLiqPerfil.IedH_FINALExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg      : String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlSalida := True;
      vlMsg := CNULL;
      Objeto.H_FINAL.GetFromControl;
      if Objeto.H_FINAL.AsInteger < 0 then
      Begin
         vlSalida   := False;
         vlMsg      :='No se admiten números negativos';
      end
      else if Objeto.H_FINAL.AsInteger < Objeto.H_INICIO.AsInteger then
      Begin
         vlSalida   := False;
         vlMsg      :='La hora de final no puede ser menor a la hora de inicio';
      end;
      InterForma1.ValidaExit(IedH_FINAL,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrLiqPerfil.IedIMP_INFERIORExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg      : String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlSalida := True;
      vlMsg := CNULL;
      Objeto.IMP_INFERIOR.GetFromControl;
      if Objeto.IMP_INFERIOR.AsFloat < 0 then
      Begin
         vlSalida   := False;
         vlMsg      :='No se admiten números negativos';
      end;
      InterForma1.ValidaExit(IedIMP_INFERIOR,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrLiqPerfil.IedIMP_SUPERIORExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg      : String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlSalida := True;
      vlMsg := CNULL;
      Objeto.IMP_SUPERIOR.GetFromControl;
      if Objeto.IMP_SUPERIOR.AsFloat < 0 then
      Begin
         vlSalida   := False;
         vlMsg      :='No se admiten números negativos';
      end
      else if Objeto.IMP_SUPERIOR.AsFloat < Objeto.IMP_INFERIOR.AsFloat then
      Begin
         vlSalida   := False;
         vlMsg      :='El importe superior no debe de ser menor al importe inferior';
      end;
      InterForma1.ValidaExit(IedIMP_SUPERIOR,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrLiqPerfil.chB_REQ_AUTORExit(Sender: TObject);
begin
      InterForma1.ValidaExit(chB_REQ_AUTOR,True,CNULL,True);
end;

procedure TWCrLiqPerfil.chB_CANCELAExit(Sender: TObject);
begin
      InterForma1.ValidaExit(chB_CANCELA,True,CNULL,True);
end;

procedure TWCrLiqPerfil.rgSIT_LIQ_PERFILExit(Sender: TObject);
begin
      InterForma1.ValidaExit(rgSIT_LIQ_PERFIL,True,CNULL,True);
end;

procedure TWCrLiqPerfil.btMED_LIQClick(Sender: TObject);
begin
   Objeto.Medio.ShowAll := true;
   if Objeto.Medio.Busca then
      InterForma1.NextTab(edCVE_MEDIO);
   //end if;
end;

procedure TWCrLiqPerfil.btCVE_LIQUIDAClick(Sender: TObject);
begin
   Objeto.MediosLiq.ShowAll := true;
   if Objeto.MediosLiq.Busca then
      InterForma1.NextTab(edCVE_LIQUIDACION);
   //end if;
end;

procedure TWCrLiqPerfil.ilMED_LIQEjecuta(Sender: TObject);
begin
   if Objeto.Medio.FindKey([ilMED_LIQ.Buffer]) then
      InterForma1.NextTab(edCVE_MEDIO);
   //end if;
end;

procedure TWCrLiqPerfil.ilCVE_LIQEjecuta(Sender: TObject);
begin
   if Objeto.MediosLiq.FindKey([ilCVE_LIQ.Buffer]) then
      InterForma1.NextTab(edCVE_LIQUIDACION);
   //end if;
end;

procedure TWCrLiqPerfil.btnCVE_GPO_ACCESOClick(Sender: TObject);
begin
   Objeto.Perfil.ShowAll := True;
   If Objeto.Perfil.Busca Then
      InterForma1.NextTab(edCVE_GPO_ACCESO);
   //end if
end;

procedure TWCrLiqPerfil.ILCVE_GPO_ACCESOEjecuta(Sender: TObject);
begin
   If Objeto.Perfil.FindKey([Objeto.Apli.Apli,ILCVE_GPO_ACCESO.Buffer]) Then
      InterForma1.NextTab(edCVE_GPO_ACCESO);
   //end if
end;

end.
