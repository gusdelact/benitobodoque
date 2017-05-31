// Sistema         : Clase de CR_LIQUIDA_DISP
// Fecha de Inicio : 05/06/2003
// Función forma   : Clase de CR_LIQUIDA_DISP
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrLiqDis;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit,

//Unidades Adicionales
IntParamCre,
IntGenCre;

Type
 TCrLiqDis= class;

  TWCrLiquidaDisp=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_LIQUIDACION : TLabel;
    edCVE_LIQUIDACION : TEdit;
    edDESC_LIQUIDACION : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    edFH_CAPTURA: TEdit;
    edH_MODIFICA: TEdit;
    edCVE_USUA_ALTA: TEdit;
    edCVE_USUA_MODIF: TEdit;
    rgSIT_LIQUIDA: TRadioGroup;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    edH_INICIO: TInterEdit;
    Label6: TLabel;
    edH_FINAL: TInterEdit;
    Label8: TLabel;
    edID_PRIORIDAD: TInterEdit;
    cbB_APLICA_CLABE: TCheckBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    edIMP_INFERIOR: TInterEdit;
    Label7: TLabel;
    edIMP_SUPERIOR: TInterEdit;
    rgCVE_TIPO_MOVTO: TRadioGroup;
    MsgPanel: TPanel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_LIQUIDACIONExit(Sender: TObject);
    procedure edDESC_LIQUIDACIONExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure rgCVE_TIPO_MOVTOExit(Sender: TObject);
    procedure edH_INICIOExit(Sender: TObject);
    procedure edH_FINALExit(Sender: TObject);
    procedure edIMP_INFERIORExit(Sender: TObject);
    procedure edIMP_SUPERIORExit(Sender: TObject);
    procedure edID_PRIORIDADExit(Sender: TObject);
    procedure cbB_APLICA_CLABEExit(Sender: TObject);
    procedure rgSIT_LIQUIDAExit(Sender: TObject);
    private 
    { Private declarations } 
    public
    { Public declarations }
    Objeto : TCrLiqDis;
end;
 TCrLiqDis= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_LIQUIDACION          : TInterCampo;
        DESC_LIQUIDACION         : TInterCampo;
        CVE_TIPO_MOVTO           : TInterCampo;
        H_INICIO                 : TInterCampo;
        H_FINAL                  : TInterCampo;
        IMP_INFERIOR             : TInterCampo;
        IMP_SUPERIOR             : TInterCampo;
        B_APLICA_CLABE           : TInterCampo;
        ID_PRIORIDAD             : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        FH_CAPTURA               : TInterCampo;
        CVE_USUARIO_MOD          : TInterCampo;
        H_MODIFICA               : TInterCampo;
        SIT_LIQUIDA              : TInterCampo;

        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;



implementation

{$R *.DFM}


constructor TCrLiqDis.Create( AOwner : TComponent );
begin Inherited;
      CVE_LIQUIDACION :=CreaCampo('CVE_LIQUIDACION',ftString,tsNinguno,tsNinguno,True);
                CVE_LIQUIDACION.Caption:='Medios de Liquidación';
      DESC_LIQUIDACION :=CreaCampo('DESC_LIQUIDACION',ftString,tsNinguno,tsNinguno,True);
                DESC_LIQUIDACION.Caption:='Descripción';
      CVE_TIPO_MOVTO :=CreaCampo('CVE_TIPO_MOVTO',ftString,tsNinguno,tsNinguno,True);
      With CVE_TIPO_MOVTO do
      begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('0'); ComboDatos.Add(C_SPEUA);
            ComboLista.Add('1'); ComboDatos.Add(C_TEF);
            ComboLista.Add('2'); ComboDatos.Add(C_CHEQ);
            ComboLista.Add('3'); ComboDatos.Add(C_LINBAN);
            ComboLista.Add('4'); ComboDatos.Add(CSIT_NA);
            ComboLista.Add('5'); ComboDatos.Add(C_TRASP);
      end;
                CVE_TIPO_MOVTO.Caption:='Tipo Movimiento';
      H_INICIO :=CreaCampo('H_INICIO',ftInteger,tsNinguno,tsNinguno,True);
                H_INICIO.Caption:='Hora Inicio';
      H_FINAL :=CreaCampo('H_FINAL',ftInteger,tsNinguno,tsNinguno,True);
                H_FINAL.Caption:='Hora Fin';
      IMP_INFERIOR :=CreaCampo('IMP_INFERIOR',ftInteger,tsNinguno,tsNinguno,True);
                IMP_INFERIOR.Caption:='Importe Inferior';
      IMP_SUPERIOR :=CreaCampo('IMP_SUPERIOR',ftInteger,tsNinguno,tsNinguno,True);
                IMP_SUPERIOR.Caption:='Importe Superior';
      B_APLICA_CLABE :=CreaCampo('B_APLICA_CLABE',ftString,tsNinguno,tsNinguno,True);
                B_APLICA_CLABE.Caption:='Aplica CLABE';
      ID_PRIORIDAD :=CreaCampo('ID_PRIORIDAD',ftInteger,tsNinguno,tsNinguno,True);
                ID_PRIORIDAD.Caption:='Prioridad';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Cve. Usuario Alta';
      FH_CAPTURA :=CreaCampo('FH_CAPTURA',ftDateTime,tsNinguno,tsNinguno,True);
                FH_CAPTURA.Caption:='Fecha de Captura';
      CVE_USUARIO_MOD :=CreaCampo('CVE_USUARIO_MOD',ftString,tsNinguno,tsNinguno,True);
                CVE_USUARIO_MOD.Caption:='Cve. Usuario Modif.';
      H_MODIFICA :=CreaCampo('H_MODIFICA',ftInteger,tsNinguno,tsNinguno,True);
                H_MODIFICA.Caption:='Hora Modifica';
      SIT_LIQUIDA :=CreaCampo('SIT_LIQUIDA',ftString,tsNinguno,tsNinguno,True);
      With SIT_LIQUIDA do
      begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
            ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
      end;
                SIT_LIQUIDA.Caption:='Situación Liq.';
      FKeyFields.Add('CVE_LIQUIDACION');

      TableName := 'CR_LIQUIDA_DISP';
      UseQuery := True;
      HelpFile := 'IntCrLiqDis.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrLiqDis.Destroy;
begin inherited;
end;


function TCrLiqDis.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrLiquidaDisp;
begin
   W:=TWCrLiquidaDisp.Create(Self);
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


Function TCrLiqDis.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrLiDi.it','S');
      Try if Active then begin T.Param(0,CVE_LIQUIDACION.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TCrLiqDis.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CR_LIQUIDA_DISP********************)
(*                                                                              *)
(*  FORMA DE CR_LIQUIDA_DISP                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_LIQUIDA_DISP********************)

procedure TWCrLiquidaDisp.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      with Objeto do
      Begin
          CVE_LIQUIDACION.Control :=edCVE_LIQUIDACION;
          DESC_LIQUIDACION.Control :=edDESC_LIQUIDACION;
          edDESC_LIQUIDACION.Hint := Objeto.DESC_LIQUIDACION.AsString;
          edDESC_LIQUIDACION.ShowHint := True;

          CVE_TIPO_MOVTO.Control := rgCVE_TIPO_MOVTO;
          H_INICIO.Control :=edH_INICIO;
          H_FINAL.Control :=edH_FINAL;
          IMP_INFERIOR.Control :=edIMP_INFERIOR;
          IMP_SUPERIOR.Control :=edIMP_SUPERIOR;
          B_APLICA_CLABE.Control := cbB_APLICA_CLABE;
          ID_PRIORIDAD.Control := edID_PRIORIDAD;
          CVE_USU_ALTA.Control := edCVE_USUA_ALTA;
          FH_CAPTURA.Control := edFH_CAPTURA;
          CVE_USUARIO_MOD.Control := edCVE_USUA_MODIF;
          H_MODIFICA.Control := edH_MODIFICA;
          SIT_LIQUIDA.Control := rgSIT_LIQUIDA;
      end;

      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrLiquidaDisp.FormDestroy(Sender: TObject);
begin
      with Objeto do
      Begin
          CVE_LIQUIDACION.Control:=nil;
          DESC_LIQUIDACION.Control:=nil;
          CVE_TIPO_MOVTO.Control := nil;
          H_INICIO.Control :=nil;
          H_FINAL.Control :=nil;
          IMP_INFERIOR.Control :=nil;
          IMP_SUPERIOR.Control :=nil;
          B_APLICA_CLABE.Control := nil;
          ID_PRIORIDAD.Control := nil;
          CVE_USU_ALTA.Control := nil;
          FH_CAPTURA.Control := nil;
          CVE_USUARIO_MOD.Control := nil;
          H_MODIFICA.Control := nil;
          SIT_LIQUIDA.Control := nil;
      end;
end;

procedure TWCrLiquidaDisp.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrLiquidaDisp.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.FH_CAPTURA.AsDateTime := Now;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   rgSIT_LIQUIDA.ItemIndex:= 0;
   rgCVE_TIPO_MOVTO.ItemIndex := 0;
   edCVE_LIQUIDACION.SetFocus;
end;

procedure TWCrLiquidaDisp.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.H_MODIFICA.AsInteger := ConverFechaAHora(Objeto.Apli.SysDateTime);
   Objeto.CVE_USUARIO_MOD.AsString := Objeto.Apli.Usuario;
   edDESC_LIQUIDACION.SetFocus;
end;

procedure TWCrLiquidaDisp.edCVE_LIQUIDACIONExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_LIQUIDACION.GetFromControl;
      if Objeto.CVE_LIQUIDACION.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave del medio de liquidación';
      end;
      InterForma1.ValidaExit(edCVE_LIQUIDACION,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrLiquidaDisp.edDESC_LIQUIDACIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_LIQUIDACION,True,CNULL,True);
end;

procedure TWCrLiquidaDisp.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
end;

procedure TWCrLiquidaDisp.rgCVE_TIPO_MOVTOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_TIPO_MOVTO,True,CNULL,True);
end;

procedure TWCrLiquidaDisp.edH_INICIOExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.H_INICIO.GetFromControl;
      if Objeto.H_INICIO.AsInteger < 0 then
      Begin
         vlSalida   := False;
         vlMsg := 'La hora de inicio no puede ser menor a cero';
      end;
      if Objeto.H_INICIO.AsString = CNULL then
      Begin
        Objeto.H_INICIO.AsString := '000000';
        vlMsg    := CNULL;
        vlSalida := True;
      end;
      InterForma1.ValidaExit(edH_INICIO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrLiquidaDisp.edH_FINALExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.H_FINAL.GetFromControl;
      if Objeto.H_FINAL.AsInteger < 0 then
      Begin
         vlSalida   := False;
         vlMsg := 'La hora final no puede ser menor a cero';
      end
      else if Objeto.H_FINAL.AsInteger < Objeto.H_INICIO.AsInteger then
      Begin
         vlSalida   := False;
         vlMsg := 'La hora final no puede ser menor a la fecha inicial';
      end;
      if Objeto.H_FINAL.AsString = CNULL then
      Begin
        Objeto.H_FINAL.AsString := '000000';
        vlMsg    := CNULL;
        vlSalida := True;
      end;
      InterForma1.ValidaExit(edH_FINAL,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrLiquidaDisp.edIMP_INFERIORExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.IMP_INFERIOR.GetFromControl;
      if Objeto.IMP_INFERIOR.AsInteger < 0 then
      Begin
         vlSalida   := False;
         vlMsg := 'El importe inferior no puede ser menor a cero';
      end;
      if Objeto.IMP_INFERIOR.AsString = CNULL then
      Begin
        Objeto.IMP_INFERIOR.AsInteger := 0;
        vlMsg    := CNULL;
        vlSalida := True;
      end;
      InterForma1.ValidaExit(edIMP_INFERIOR,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrLiquidaDisp.edIMP_SUPERIORExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.IMP_SUPERIOR.GetFromControl;
      if Objeto.IMP_SUPERIOR.AsInteger < 0 then
      Begin
         vlSalida   := False;
         vlMsg := 'El importe superior no puede ser menor a cero';
      end
      else if Objeto.IMP_SUPERIOR.AsInteger < Objeto.IMP_INFERIOR.AsInteger then
      Begin
         vlSalida   := False;
         vlMsg := 'El importe superior no puede ser menor al importe inferior';
      end;
      if Objeto.IMP_SUPERIOR.AsString = CNULL then
      Begin
        Objeto.IMP_SUPERIOR.AsInteger := 0;
        vlMsg    := CNULL;
        vlSalida := True;
      end;
      InterForma1.ValidaExit(edIMP_SUPERIOR,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrLiquidaDisp.edID_PRIORIDADExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_PRIORIDAD.GetFromControl;
      if Objeto.ID_PRIORIDAD.AsInteger < 0 then
      Begin
         vlSalida   := False;
         vlMsg := 'El número la prioridad no puede ser menor a cero';
      end
      else if Objeto.ID_PRIORIDAD.AsString = CNULL then
      Begin
        Objeto.ID_PRIORIDAD.AsInteger := 0;
      end;
      InterForma1.ValidaExit(edID_PRIORIDAD,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrLiquidaDisp.cbB_APLICA_CLABEExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbB_APLICA_CLABE,True,CNULL,True);
end;

procedure TWCrLiquidaDisp.rgSIT_LIQUIDAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_LIQUIDA,True,CNULL,True);
end;

end.
