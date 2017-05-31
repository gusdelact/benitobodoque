// Sistema         : Clase de CR_SIT_CONFIGURA
// Fecha de Inicio : 20/12/2004
// Función forma   : Clase de CR_SIT_CONFIGURA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrStConfi;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
//Unidades Adicionales
IntGenCre,
IntParamCre,
IntCrProduct,
IntCrAmortiz,
IntCrPagInt,
IntCrSituaci, IntLinkit,
IntCrAccesor, InterEdit
;

Type
 TCrStConfi= class; 

  TWCrStConfigura=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_PRODUCTO_CRE : TLabel;
    edCVE_PRODUCTO_CRE : TEdit;
    lbCVE_AMORTIZACION : TLabel; 
    edCVE_AMORTIZACION : TEdit;
    lbCVE_PAG_INTERES : TLabel;
    edCVE_PAG_INTERES : TEdit;
    lbCVE_SITUACION : TLabel; 
    edCVE_SITUACION : TEdit; 
    chB_AUTOMATICO : TCheckBox; 
    chB_F_VENCIMIENTO : TCheckBox; 
    chB_CONTABILIZA : TCheckBox; 
    chB_PROVISIONA : TCheckBox; 
    rgSIT_CONFIGURA : TRadioGroup;
    btPRODUCTO: TBitBtn;
    edDESC_L_PRODUCTO: TEdit;
    edDESC_TIPO_AMORT: TEdit;
    btAMORTIZA: TBitBtn;
    edDESC_PAGO_INT: TEdit;
    btPAGO_INT: TBitBtn;
    edDESC_L_SITUACION: TEdit;
    btSITUACION: TBitBtn;
    GroupBox1: TGroupBox;
    lbNUM_DIA_FINAL: TLabel;
    lbNUM_DIA_INICIAL: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lbUSUA_ALTA: TLabel;
    lbF_ALTA: TLabel;
    edF_ALTA: TEdit;
    edCVE_USUA_ALTA: TEdit;
    lbUSUA_MODIF: TLabel;
    lbF_MODIF: TLabel;
    edF_MODIF: TEdit;
    edCVE_USUA_MODIF: TEdit;
    ilAMORTIZA: TInterLinkit;
    ilPRODUCTO: TInterLinkit;
    ilPAGO_INT: TInterLinkit;
    ilACCESORIO: TInterLinkit;
    ilSITUACION: TInterLinkit;
    lbCVE_ACCESORIO: TLabel;
    edCVE_ACCESORIO: TEdit;
    btACCESORIO: TBitBtn;
    edDESC_ACCESORIO: TEdit;
    MsgPanel: TPanel;
    edNUM_DIA_FINAL: TInterEdit;
    edNUM_DIA_INICIAL: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure edCVE_PRODUCTO_CREExit(Sender: TObject);
    procedure btAMORTIZAClick(Sender: TObject);
    procedure ilAMORTIZAEjecuta(Sender: TObject);
    procedure ilAMORTIZACapture(Sender: TObject; var Show: Boolean);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_AMORTIZACIONExit(Sender: TObject);
    procedure btPAGO_INTClick(Sender: TObject);
    procedure ilPAGO_INTEjecuta(Sender: TObject);
    procedure edCVE_PAG_INTERESExit(Sender: TObject);
    procedure ilPAGO_INTCapture(Sender: TObject; var Show: Boolean);
    procedure btACCESORIOClick(Sender: TObject);
    procedure ilACCESORIOEjecuta(Sender: TObject);
    procedure ilACCESORIOCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_ACCESORIOExit(Sender: TObject);
    procedure btSITUACIONClick(Sender: TObject);
    procedure ilSITUACIONEjecuta(Sender: TObject);
    procedure ilSITUACIONCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_SITUACIONExit(Sender: TObject);
    procedure edNUM_DIA_INICIALExit(Sender: TObject);
    procedure edNUM_DIA_FINALExit(Sender: TObject);
    procedure chB_AUTOMATICOExit(Sender: TObject);
    procedure chB_F_VENCIMIENTOExit(Sender: TObject);
    procedure chB_CONTABILIZAExit(Sender: TObject);
    procedure chB_PROVISIONAExit(Sender: TObject);
    procedure rgSIT_CONFIGURAExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
    { Private declarations }
       Function ValidaRegistro : Boolean;
    public
    { Public declarations }
    Objeto : TCrStConfi;
end;
 TCrStConfi= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_PRODUCTO_CRE         : TInterCampo;
        CVE_AMORTIZACION         : TInterCampo;
        CVE_PAG_INTERES          : TInterCampo;
        CVE_ACCESORIO            : TInterCampo;
        CVE_SITUACION            : TInterCampo;
        NUM_DIA_INICIAL          : TInterCampo;
        NUM_DIA_FINAL            : TInterCampo;
        B_AUTOMATICO             : TInterCampo;
        B_F_VENCIMIENTO          : TInterCampo;
        B_CONTABILIZA            : TInterCampo;
        B_PROVISIONA             : TInterCampo;
        SIT_CONFIGURA            : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        //CLASES ADICONALES
        ParamCre                 : TParamCre;
        Producto                 : TCrProduct;
        Amortizacion             : TCrAmortiz;
        PagoInteres              : TCrPagInt;
        Situacion                : TCrSituaci;
        Accesorio                : TCrAccesor;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;

implementation

{$R *.DFM}


constructor TCrStConfi.Create( AOwner : TComponent );
begin Inherited;
      CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,True);
                CVE_PRODUCTO_CRE.Caption:='Producto';
      CVE_AMORTIZACION :=CreaCampo('CVE_AMORTIZACION',ftString,tsNinguno,tsNinguno,True);
                CVE_AMORTIZACION.Caption:='Tipo de Amortización';
      CVE_PAG_INTERES :=CreaCampo('CVE_PAG_INTERES',ftString,tsNinguno,tsNinguno,True);
                CVE_PAG_INTERES.Caption:='Pago de Interés';
      CVE_ACCESORIO :=CreaCampo('CVE_ACCESORIO',ftString,tsNinguno,tsNinguno,True);
                CVE_ACCESORIO.Caption:='Clve. Accesorio';
      CVE_SITUACION :=CreaCampo('CVE_SITUACION',ftString,tsNinguno,tsNinguno,True);
                CVE_SITUACION.Caption:='Cve. de Situación';
      NUM_DIA_INICIAL :=CreaCampo('NUM_DIA_INICIAL',ftFloat,tsNinguno,tsNinguno,True);
                NUM_DIA_INICIAL.Caption:='Inicial';
      NUM_DIA_FINAL :=CreaCampo('NUM_DIA_FINAL',ftFloat,tsNinguno,tsNinguno,True);
                NUM_DIA_FINAL.Caption:='Final';
      B_AUTOMATICO :=CreaCampo('B_AUTOMATICO',ftString,tsNinguno,tsNinguno,True);
                B_AUTOMATICO.Caption:='Automático';
      B_F_VENCIMIENTO :=CreaCampo('B_F_VENCIMIENTO',ftString,tsNinguno,tsNinguno,True);
                B_F_VENCIMIENTO.Caption:='Aplica F. Vencimiento';
      B_CONTABILIZA :=CreaCampo('B_CONTABILIZA',ftString,tsNinguno,tsNinguno,True);
                B_CONTABILIZA.Caption:='Contabiliza';
      B_PROVISIONA :=CreaCampo('B_PROVISIONA',ftString,tsNinguno,tsNinguno,True);
                B_PROVISIONA.Caption:='Provisiona';
      SIT_CONFIGURA :=CreaCampo('SIT_CONFIGURA',ftString,tsNinguno,tsNinguno,True);
      With SIT_CONFIGURA do
      begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('0');                ComboDatos.Add('AC');
            ComboLista.Add('1');                ComboDatos.Add('CA');
      end;
                SIT_CONFIGURA.Caption:='Situación';
      F_ALTA :=CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      FKeyFields.Add('CVE_PRODUCTO_CRE');
      FKeyFields.Add('CVE_AMORTIZACION');
      FKeyFields.Add('CVE_PAG_INTERES');
      FKeyFields.Add('CVE_ACCESORIO');
      FKeyFields.Add('CVE_SITUACION');

      TableName := 'CR_SIT_CONFIGURA';
      UseQuery := True;
      HelpFile := 'IntCrStConfi.Hlp';
      ShowMenuReporte:=True;

      Producto := TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField:='CVE_PRODUCTO_CRE';

      Amortizacion := TCrAmortiz.Create(Self);
      Amortizacion.MasterSource:=Self;
      Amortizacion.FieldByName('CVE_AMORTIZACION').MasterField:='CVE_AMORTIZACION';

      PagoInteres := TCrPagInt.Create(Self);
      PagoInteres.MasterSource:=Self;
      PagoInteres.FieldByName('CVE_PAG_INTERES').MasterField:='CVE_PAG_INTERES';

      Situacion := TCrSituaci.Create(Self);
      Situacion.MasterSource:=Self;
      Situacion.FieldByName('CVE_SITUACION').MasterField:='CVE_SITUACION';

      Accesorio := TCrAccesor.Create(Self);
      Accesorio.MasterSource:=Self;
      Accesorio.FieldByName('CVE_ACCESORIO').MasterField:='CVE_ACCESORIO';

end;

Destructor TCrStConfi.Destroy;
begin
   if Producto <> nil then
      Producto.free;
   //end if

   if Amortizacion <> nil then
      Amortizacion.free;
   //end if

   if PagoInteres <> nil then
      PagoInteres.free;
   //end if

   if Situacion <> nil then
      Situacion.free;
   //end if

   if Accesorio <> nil then
      Accesorio.free;
   //end if

   inherited;
end;


function TCrStConfi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrStConfigura;
begin
   W:=TWCrStConfigura.Create(Self);
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


Function TCrStConfi.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrStCon.it','S,S,S,S,S');
      Try if Active then begin T.Param(0,CVE_PRODUCTO_CRE.AsString); 
                               T.Param(1,CVE_AMORTIZACION.AsString); 
                               T.Param(2,CVE_PAG_INTERES.AsString); 
                               T.Param(3,CVE_ACCESORIO.AsString); 
                               T.Param(4,CVE_SITUACION.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3),T.DameCampo(4)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_SIT_CONFIGURA********************)
(*                                                                              *)
(*  FORMA DE CR_SIT_CONFIGURA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_SIT_CONFIGURA********************)

procedure TWCrStConfigura.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_PRODUCTO_CRE.Control:=edCVE_PRODUCTO_CRE;
      Objeto.CVE_AMORTIZACION.Control:=edCVE_AMORTIZACION;
      Objeto.CVE_PAG_INTERES.Control:=edCVE_PAG_INTERES;
      Objeto.CVE_ACCESORIO.Control:=edCVE_ACCESORIO;
      Objeto.CVE_SITUACION.Control:=edCVE_SITUACION;
      Objeto.NUM_DIA_INICIAL.Control:=edNUM_DIA_INICIAL;
      Objeto.NUM_DIA_FINAL.Control:=edNUM_DIA_FINAL;
      Objeto.B_AUTOMATICO.Control:=chB_AUTOMATICO;
      Objeto.B_F_VENCIMIENTO.Control:=chB_F_VENCIMIENTO;
      Objeto.B_CONTABILIZA.Control:=chB_CONTABILIZA;
      Objeto.B_PROVISIONA.Control:=chB_PROVISIONA;
      Objeto.SIT_CONFIGURA.Control:=rgSIT_CONFIGURA;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USUA_ALTA;
      Objeto.F_MODIFICA.Control:=edF_MODIF;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USUA_MODIF;

      Objeto.Producto.DESC_L_PRODUCTO.Control := edDESC_L_PRODUCTO;
      Objeto.Producto.GetParams(Objeto);

      Objeto.Amortizacion.DESC_AMORTIZA.Control := edDESC_TIPO_AMORT;
      Objeto.Amortizacion.GetParams(Objeto);

      Objeto.PagoInteres.DESC_PAG_INTERES.Control := edDESC_PAGO_INT;
      Objeto.PagoInteres.GetParams(Objeto);

      Objeto.Situacion.DESC_L_SITUACION.Control := edDESC_L_SITUACION;
      Objeto.Situacion.GetParams(Objeto);

      Objeto.Accesorio.DESC_ACCESORIO.Control := edDESC_ACCESORIO;
      Objeto.Accesorio.GetParams(Objeto);

      InterForma1.MsgPanel := MsgPanel;
      
end;

procedure TWCrStConfigura.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_PRODUCTO_CRE.Control:=nil;
      Objeto.CVE_AMORTIZACION.Control:=nil;
      Objeto.CVE_PAG_INTERES.Control:=nil;
      Objeto.CVE_ACCESORIO.Control:=nil;
      Objeto.CVE_SITUACION.Control:=nil;
      Objeto.NUM_DIA_INICIAL.Control:=nil;
      Objeto.NUM_DIA_FINAL.Control:=nil;
      Objeto.B_AUTOMATICO.Control:=nil;
      Objeto.B_F_VENCIMIENTO.Control:=nil;
      Objeto.B_CONTABILIZA.Control:=nil;
      Objeto.B_PROVISIONA.Control:=nil;
      Objeto.SIT_CONFIGURA.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;

      Objeto.Producto.DESC_L_PRODUCTO.Control := nil;
      Objeto.Amortizacion.DESC_AMORTIZA.Control := nil;
      Objeto.PagoInteres.DESC_PAG_INTERES.Control := nil;
      Objeto.Situacion.DESC_L_SITUACION.Control := nil;
      Objeto.Accesorio.DESC_ACCESORIO.Control := nil;
   //Objeto
end;

procedure TWCrStConfigura.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrStConfigura.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Now;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   rgSIT_CONFIGURA.ItemIndex := 0;
   edCVE_PRODUCTO_CRE.SetFocus;
end;

procedure TWCrStConfigura.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Now;
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   edNUM_DIA_INICIAL.SetFocus;
end;

procedure TWCrStConfigura.btPRODUCTOClick(Sender: TObject);
begin
   Objeto.Producto.ShowAll := True;
   if Objeto.Producto.Busca then
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
end;

procedure TWCrStConfigura.ilPRODUCTOEjecuta(Sender: TObject);
begin
   if Objeto.Producto.FindKey([ilPRODUCTO.Buffer]) then
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   //end if
end;

procedure TWCrStConfigura.edCVE_PRODUCTO_CREExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
       VLMsg := '';
       VLSalida := True;
       Objeto.CVE_PRODUCTO_CRE.GetFromControl;
       If Objeto.CVE_PRODUCTO_CRE.AsString = '' then
       Begin
           VLSalida := False;
           VLMsg:='Favor de Indicar el Producto';
       end;
       InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,VLSalida,VLMsg,True);
   End;
end;

procedure TWCrStConfigura.btAMORTIZAClick(Sender: TObject);
begin
   Objeto.Amortizacion.ShowAll := True;
   if Objeto.Amortizacion.Busca then
      InterForma1.NextTab(edCVE_AMORTIZACION);
end;

procedure TWCrStConfigura.ilAMORTIZAEjecuta(Sender: TObject);
begin
   if Objeto.Amortizacion.FindKey([ilAMORTIZA.Buffer]) then
      InterForma1.NextTab(edCVE_AMORTIZACION);
end;

procedure TWCrStConfigura.ilAMORTIZACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit)and(InterForma1.IsNewData);
end;

procedure TWCrStConfigura.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit)and(InterForma1.IsNewData);
end;

procedure TWCrStConfigura.edCVE_AMORTIZACIONExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
       VLMsg := '';
       VLSalida := True;
       Objeto.CVE_AMORTIZACION.GetFromControl;
       If Objeto.CVE_AMORTIZACION.AsString = '' then
       Begin
           VLSalida := False;
           VLMsg:='Favor de Indicar el Tipo de Amortización';
       end;
       InterForma1.ValidaExit(edCVE_AMORTIZACION,VLSalida,VLMsg,True);
   End;
end;

procedure TWCrStConfigura.btPAGO_INTClick(Sender: TObject);
begin
   Objeto.PagoInteres.ShowAll := True;
   if Objeto.PagoInteres.Busca then
      InterForma1.NextTab(edCVE_PAG_INTERES);
end;

procedure TWCrStConfigura.ilPAGO_INTEjecuta(Sender: TObject);
begin
   if Objeto.PagoInteres.FindKey([ilPAGO_INT.Buffer]) then
      InterForma1.NextTab(edCVE_PAG_INTERES);
end;

procedure TWCrStConfigura.edCVE_PAG_INTERESExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
       VLMsg := '';
       VLSalida := True;
       Objeto.CVE_PAG_INTERES.GetFromControl;
       If Objeto.CVE_PAG_INTERES.AsString = '' then
       Begin
           VLSalida := False;
           VLMsg:='Favor de Indicar el pago de Interés';
       end;
       InterForma1.ValidaExit(edCVE_PAG_INTERES,VLSalida,VLMsg,True);
   End;
end;

procedure TWCrStConfigura.ilPAGO_INTCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit)and(InterForma1.IsNewData);
end;


procedure TWCrStConfigura.btACCESORIOClick(Sender: TObject);
begin
   Objeto.Accesorio.ShowAll := True;
   if Objeto.Accesorio.Busca then
      InterForma1.NextTab(edCVE_ACCESORIO);
end;

procedure TWCrStConfigura.ilACCESORIOEjecuta(Sender: TObject);
begin
   if Objeto.Accesorio.FindKey([ilACCESORIO.Buffer]) then
      InterForma1.NextTab(edCVE_ACCESORIO);
end;

procedure TWCrStConfigura.ilACCESORIOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit)and(InterForma1.IsNewData);
end;

procedure TWCrStConfigura.edCVE_ACCESORIOExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
       VLMsg := '';
       VLSalida := True;
       Objeto.CVE_ACCESORIO.GetFromControl;
       If Objeto.CVE_ACCESORIO.AsString = '' then
       Begin
           VLSalida := False;
           VLMsg:='Favor de Indicar el accesorio';
       end;
       InterForma1.ValidaExit(edCVE_ACCESORIO,VLSalida,VLMsg,True);
   End;
end;

procedure TWCrStConfigura.btSITUACIONClick(Sender: TObject);
begin
   Objeto.Situacion.ShowAll := True;
   if Objeto.Situacion.Busca then
      InterForma1.NextTab(edCVE_SITUACION);
end;

procedure TWCrStConfigura.ilSITUACIONEjecuta(Sender: TObject);
begin
   if Objeto.Situacion.FindKey([ilSITUACION.Buffer]) then
      InterForma1.NextTab(edCVE_SITUACION);
end;

procedure TWCrStConfigura.ilSITUACIONCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit)and(InterForma1.IsNewData);
end;

procedure TWCrStConfigura.edCVE_SITUACIONExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
       VLMsg := '';
       VLSalida := True;
       Objeto.CVE_SITUACION.GetFromControl;
       If Objeto.CVE_SITUACION.AsString = '' then
       Begin
           VLSalida := False;
           VLMsg:='Favor de Indicar la situación';
       end;
       InterForma1.ValidaExit(edCVE_SITUACION,VLSalida,VLMsg,True);
   End;
end;

procedure TWCrStConfigura.edNUM_DIA_INICIALExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
       VLMsg := '';
       VLSalida := True;
       Objeto.NUM_DIA_INICIAL.GetFromControl;
       If Objeto.NUM_DIA_INICIAL.AsInteger < 0 then
       Begin
           VLSalida := False;
           VLMsg:=' El número de días no puede ser menor a cero';
       end;
       InterForma1.ValidaExit(edNUM_DIA_INICIAL,VLSalida,VLMsg,True);
   End;
end;

procedure TWCrStConfigura.edNUM_DIA_FINALExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
       VLMsg := '';
       VLSalida := True;
       Objeto.NUM_DIA_FINAL.GetFromControl;
       If Objeto.NUM_DIA_FINAL.AsFloat < 0 then
       Begin
           VLSalida := False;
           VLMsg:=' El número de días no puede ser menor a cero';
       end;
       IF Objeto.NUM_DIA_FINAL.AsInteger > 0 THEN
          If Objeto.NUM_DIA_FINAL.AsInteger < Objeto.NUM_DIA_INICIAL.AsInteger then
           Begin
               VLSalida := False;
               VLMsg:=' El número de días final no puede ser menor al inicial';
           end;
       //END IF;
       InterForma1.ValidaExit(edNUM_DIA_FINAL,VLSalida,VLMsg,True);
   End;
end;

procedure TWCrStConfigura.chB_AUTOMATICOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_AUTOMATICO,True,'',True);
end;

procedure TWCrStConfigura.chB_F_VENCIMIENTOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_F_VENCIMIENTO,True,'',True);
end;

procedure TWCrStConfigura.chB_CONTABILIZAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_CONTABILIZA,True,'',True);
end;

procedure TWCrStConfigura.chB_PROVISIONAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_PROVISIONA,True,'',True);
end;

procedure TWCrStConfigura.rgSIT_CONFIGURAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_CONFIGURA,True,'',True);
end;

function TWCrStConfigura.ValidaRegistro : Boolean;
var
   vlSql       : String;
   Q           : TQuery;
   vlResultado : Boolean;
begin
   vlResultado := True;
   Objeto.B_AUTOMATICO.GetFromControl;
   Objeto.NUM_DIA_INICIAL.GetFromControl;
   vlSql := '       SELECT * FROM CR_SIT_CONFIGURA ' + coCRLF +
            '       WHERE CVE_PRODUCTO_CRE = ' + SQLStr( Objeto.CVE_PRODUCTO_CRE.AsString ) + coCRLF +
            '         AND CVE_AMORTIZACION = ' + Objeto.CVE_AMORTIZACION.AsString + coCRLF +
            '         AND CVE_PAG_INTERES  = ' + Objeto.CVE_PAG_INTERES.AsString + coCRLF +
            '         AND CVE_ACCESORIO    = ' + SQLStr( Objeto.CVE_ACCESORIO.AsString ) + coCRLF +
            '         AND B_AUTOMATICO     = ' + SQLStr( Objeto.B_AUTOMATICO.AsString )+ coCRLF ;
   if not InterForma1.IsNewData then
      vlSql := vlSql + ' AND CVE_SITUACION    <> ' + SQLStr( Objeto.CVE_SITUACION.AsString ) + coCRLF;

   Q := TQuery.Create(Self);
   Try
      Q.SessionName := Objeto.Apli.SessionName;
      Q.DataBaseName := Objeto.Apli.DataBaseName;
      Q.SQL.Clear;
      Q.SQL.Add(vlsql);
      Q.Open;
      While not Q.Eof Do
      Begin
            IF ( ( Objeto.NUM_DIA_INICIAL.AsInteger >= Q.FieldByName('NUM_DIA_INICIAL').AsInteger ) AND
                 ( Objeto.NUM_DIA_INICIAL.AsInteger <= Q.FieldByName('NUM_DIA_FINAL').AsInteger   ) ) OR
               ( ( Objeto.NUM_DIA_FINAL.AsInteger >= Q.FieldByName('NUM_DIA_INICIAL').AsInteger ) AND
                 ( Objeto.NUM_DIA_FINAL.AsInteger <= Q.FieldByName('NUM_DIA_FINAL').AsInteger   ) ) THEN
            BEGIN
                 ShowMessage('No se puede insertar el registro ya existe un registro con rango de días o similar');
                 vlResultado:= False;
                 Break;
            END
            ELSE IF Q.FieldByName('NUM_DIA_FINAL').AsInteger = 0 THEN
            BEGIN
                 ShowMessage('No se puede insertar el registro ya existe un registro con rango de días o similar');
                 vlResultado:= False;
                 Break;
            END;
        Q.Next;
      end;
      Finally
      If Assigned(Q) Then
        Begin
             Q.Close;
             Q.Free;
        End;
      end;
   Result:= vlResultado;
end;

procedure TWCrStConfigura.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := ValidaRegistro;
      end
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := ValidaRegistro;
      end
      else Realizado := False;
   end
   // end if
end;

end.
