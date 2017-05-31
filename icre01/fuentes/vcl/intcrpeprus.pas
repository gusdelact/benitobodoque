// Sistema         : Clase de CR_PERF_PROD_USU
// Fecha de Inicio : 02/09/2004
// Función forma   : Clase de CR_PERF_PROD_USU
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrPePrUs;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit,
//UNIDADES ADICONALES
IntParamCre,
IntGenCre,
IntCrProduct,   //Producto Credito
IntSecGpAcc     //Grupo de Acceso
;

Type
 TCrPePrUs= class; 

  TWCrPerfProdUsu=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_PRODUCTO : TLabel; 
    edCVE_PRODUCTO : TEdit;
    lbCVE_GPO_ACCESO : TLabel; 
    edCVE_GPO_ACCESO : TEdit; 
    rgSIT_PERFIL : TRadioGroup;
    GroupBox1: TGroupBox;
    chB_AUTORIZA_DISP: TCheckBox;
    chB_CANCELA_DISP: TCheckBox;
    chB_RECHAZA_DISP: TCheckBox;
    chB_REACTIVA_DISP: TCheckBox;
    IedIMP_MAXIMO_AUT: TInterEdit;
    lbIMP_MAXIMO_AUT: TLabel;
    GroupBox2: TGroupBox;
    chB_APLI_COBRANZA: TCheckBox;
    chB_CANCELA_COB: TCheckBox;
    chB_ALTA_PROCAM: TCheckBox;
    chB_CANCELA_SIEB: TCheckBox;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    btnCVE_GPO_ACCESO: TBitBtn;
    edNOM_GPO_ACCESO: TEdit;
    edDESC_PRODUCTO: TEdit;
    btPRODUCTO: TBitBtn;
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    edF_MODIFICA: TEdit;
    edF_ALTA: TEdit;
    lbCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    edCVE_USU_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    ilPRODUCTO: TInterLinkit;
    ilACCESO: TInterLinkit;
    chB_IMPRIME_CTO: TCheckBox;
    chB_MODIF_DISP_AUT: TCheckBox;
    chB_MOD_COMISION: TCheckBox;
    chB_MOD_INF_TASA: TCheckBox;
    chB_Autoriza_CTas: TCheckBox;
    chB_Cancela_CTas: TCheckBox;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure btnCVE_GPO_ACCESOClick(Sender: TObject);
    procedure ilACCESOEjecuta(Sender: TObject);
    procedure ilACCESOCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_PRODUCTOExit(Sender: TObject);
    procedure edCVE_GPO_ACCESOExit(Sender: TObject);
    procedure chB_AUTORIZA_DISPExit(Sender: TObject);
    procedure chB_CANCELA_DISPExit(Sender: TObject);
    procedure chB_RECHAZA_DISPExit(Sender: TObject);
    procedure chB_REACTIVA_DISPExit(Sender: TObject);
    procedure chB_CANCELA_SIEBExit(Sender: TObject);
    procedure chB_ALTA_PROCAMExit(Sender: TObject);
    procedure IedIMP_MAXIMO_AUTExit(Sender: TObject);
    procedure chB_APLI_COBRANZAExit(Sender: TObject);
    procedure chB_CANCELA_COBExit(Sender: TObject);
    procedure rgSIT_PERFILExit(Sender: TObject);
    procedure chB_MODIF_DISP_AUTExit(Sender: TObject);
    procedure chB_MOD_INF_TASAExit(Sender: TObject);
    procedure chB_MOD_COMISIONExit(Sender: TObject);
    procedure chB_IMPRIME_CTOExit(Sender: TObject);
    procedure chB_Autoriza_CTasExit(Sender: TObject);
    procedure chB_Cancela_CTasExit(Sender: TObject);
    private 
    { Private declarations }
    public 
    { Public declarations } 
    Objeto : TCrPePrUs;
end; 
 TCrPePrUs= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_PRODUCTO             : TInterCampo;
        CVE_GPO_ACCESO           : TInterCampo;
        B_AUTORIZA_DISP          : TInterCampo;
        B_CANCELA_DISP           : TInterCampo;
        B_RECHAZA_DISP           : TInterCampo;
        B_REACTIVA_DISP          : TInterCampo;
        IMP_MAXIMO_AUT           : TInterCampo;
        B_APLI_COBRANZA          : TInterCampo;
        B_CANCELA_COB            : TInterCampo;
        B_CANCELA_SIEB           : TInterCampo;
        B_ALTA_PROCAM            : TInterCampo;
        SIT_PERFIL               : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        //
        B_IMPRIME_CTO            : TInterCampo;
        B_MODIF_DISP_AUT         : TInterCampo;
        B_MOD_COMISION           : TInterCampo;
        B_MOD_INF_TASA           : TInterCampo;
        // RABA NOV 2013  PROYECTO CAMBIO TASA
        B_AUTORIZA_CTAS          : TInterCampo;
        B_CANCELA_CTAS           : TInterCampo;
        // FIN RABA

        ParamCre                 : TParamCre;
        Producto                 : TCrProduct;
        GrupoAcc                 : TSecGpAcc;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrPePrUs.Create( AOwner : TComponent );
begin Inherited;
      CVE_PRODUCTO :=CreaCampo('CVE_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
                CVE_PRODUCTO.Caption:='Clave de Producto';
      CVE_GPO_ACCESO :=CreaCampo('CVE_GPO_ACCESO',ftString,tsNinguno,tsNinguno,True);
                CVE_GPO_ACCESO.Caption:='Clave de Grupo Acceso';
      B_AUTORIZA_DISP :=CreaCampo('B_AUTORIZA_DISP',ftString,tsNinguno,tsNinguno,True);
                B_AUTORIZA_DISP.Caption:='Autoriza';
      B_CANCELA_DISP :=CreaCampo('B_CANCELA_DISP',ftString,tsNinguno,tsNinguno,True);
                B_CANCELA_DISP.Caption:='Cancela';
      B_RECHAZA_DISP :=CreaCampo('B_RECHAZA_DISP',ftString,tsNinguno,tsNinguno,True);
                B_RECHAZA_DISP.Caption:='Rechaza';
      B_REACTIVA_DISP :=CreaCampo('B_REACTIVA_DISP',ftString,tsNinguno,tsNinguno,True);
                B_REACTIVA_DISP.Caption:='Reactiva';
      IMP_MAXIMO_AUT :=CreaCampo('IMP_MAXIMO_AUT',ftFloat,tsNinguno,tsNinguno,True);
                IMP_MAXIMO_AUT.Caption:='Imp Maximo a Autorizar';
      B_APLI_COBRANZA :=CreaCampo('B_APLI_COBRANZA',ftString,tsNinguno,tsNinguno,True);
                B_APLI_COBRANZA.Caption:='Aplica Cobranza';
      B_CANCELA_COB :=CreaCampo('B_CANCELA_COB',ftString,tsNinguno,tsNinguno,True);
                B_CANCELA_COB.Caption:='Cancela Cobranza';
      B_CANCELA_SIEB :=CreaCampo('B_CANCELA_SIEB',ftString,tsNinguno,tsNinguno,True);
                B_CANCELA_SIEB.Caption:='Cancela SIEBAN';
      B_ALTA_PROCAM :=CreaCampo('B_ALTA_PROCAM',ftString,tsNinguno,tsNinguno,True);
                B_ALTA_PROCAM.Caption:='Aplica Alta PROCAMPO';
      SIT_PERFIL :=CreaCampo('SIT_PERFIL',ftString,tsNinguno,tsNinguno,True);
        With SIT_PERFIL do
           begin Size:=2;
                 UseCombo:=True;
                 ComboLista.Add('0');      ComboDatos.Add('AC');
                 ComboLista.Add('1');      ComboDatos.Add('CA');
           end;
                SIT_PERFIL.Caption:='Situación';
      F_ALTA :=CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      //
      B_IMPRIME_CTO :=CreaCampo('B_IMPRIME_CTO',ftString,tsNinguno,tsNinguno,True);
                B_IMPRIME_CTO.Caption:='Imprime Cto';
      B_MODIF_DISP_AUT :=CreaCampo('B_MODIF_DISP_AUT',ftString,tsNinguno,tsNinguno,True);
                B_MODIF_DISP_AUT.Caption:='Modificación Disp Aut';
      B_MOD_COMISION :=CreaCampo('B_MOD_COMISION',ftString,tsNinguno,tsNinguno,True);
                B_MOD_COMISION.Caption:='Mod Comision';
      B_MOD_INF_TASA :=CreaCampo('B_MOD_INF_TASA',ftString,tsNinguno,tsNinguno,True);
                B_MOD_INF_TASA.Caption:='Mod Inf Tasa';
      // RABA NOV 2013  PROYECTO CAMBIO TASA
      B_AUTORIZA_CTAS :=CreaCampo('B_AUTORIZA_CTAS',ftString,tsNinguno,tsNinguno,True);
                B_AUTORIZA_CTAS.Caption:='Autoriza Cambio Tasa';
      B_CANCELA_CTAS :=CreaCampo('B_CANCELA_CTAS',ftString,tsNinguno,tsNinguno,True);
                B_CANCELA_CTAS.Caption:='Cancela Cambio Tasa';
      // FIN RABA

      FKeyFields.Add('CVE_PRODUCTO');
      FKeyFields.Add('CVE_GPO_ACCESO');

      TableName := 'CR_PERF_PROD_USU';
      UseQuery := True;
      HelpFile := 'IntCrPePrUs.Hlp';
      ShowMenuReporte:=True;

      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField :='CVE_PRODUCTO';

      GrupoAcc := TSecGpAcc.Create(Self);
      GrupoAcc.MasterSource := Self;

end;

Destructor TCrPePrUs.Destroy;
begin
        if Producto <> nil then
           Producto.Free;
        //end if
        if GrupoAcc <> nil then
           GrupoAcc.Free;
        //end if
        inherited;
end;


function TCrPePrUs.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrPerfProdUsu;
begin
   W:=TWCrPerfProdUsu.Create(Self);
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


Function TCrPePrUs.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrPePU.it','S,S');
      Try if Active then begin T.Param(0,CVE_PRODUCTO.AsString); 
                               T.Param(1,CVE_GPO_ACCESO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_PERF_PROD_USU********************)
(*                                                                              *)
(*  FORMA DE CR_PERF_PROD_USU                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_PERF_PROD_USU********************)

procedure TWCrPerfProdUsu.FormShow(Sender: TObject);
begin
      Objeto.CVE_PRODUCTO.Control:=edCVE_PRODUCTO;
      Objeto.CVE_GPO_ACCESO.Control:=edCVE_GPO_ACCESO;
      Objeto.B_AUTORIZA_DISP.Control:=chB_AUTORIZA_DISP;
      Objeto.B_CANCELA_DISP.Control:=chB_CANCELA_DISP;
      Objeto.B_RECHAZA_DISP.Control:=chB_RECHAZA_DISP;
      Objeto.B_REACTIVA_DISP.Control:=chB_REACTIVA_DISP;
      Objeto.IMP_MAXIMO_AUT.Control:=IedIMP_MAXIMO_AUT;
      Objeto.B_APLI_COBRANZA.Control:=chB_APLI_COBRANZA;
      Objeto.B_CANCELA_COB.Control:=chB_CANCELA_COB;
      Objeto.B_CANCELA_SIEB.Control:=chB_CANCELA_SIEB;
      Objeto.B_ALTA_PROCAM.Control:=chB_ALTA_PROCAM;
      Objeto.SIT_PERFIL.Control:=rgSIT_PERFIL;
      //
      Objeto.B_IMPRIME_CTO.Control:=chB_IMPRIME_CTO;
      Objeto.B_MODIF_DISP_AUT.Control:=chB_MODIF_DISP_AUT;
      Objeto.B_MOD_COMISION.Control:=chB_MOD_COMISION;
      Objeto.B_MOD_INF_TASA.Control:=chB_MOD_INF_TASA;
      // RABA NOV 2013  PROYECTO CAMBIO TASA
      Objeto.B_AUTORIZA_CTAS.Control := chB_Autoriza_CTas;
      Objeto.B_CANCELA_CTAS.Control := chB_Cancela_CTas;
      // FIN RABA
      Objeto.Producto.DESC_C_PRODUCTO.Control:= edDESC_PRODUCTO;
      Objeto.Producto.GetParams(Objeto);

      Objeto.GrupoAcc.ID_GPO_ACCESO.Control := edCVE_GPO_ACCESO;      
      Objeto.GrupoAcc.Perfil.NOM_GPO_ACCESO.Control := edNOM_GPO_ACCESO;
      Objeto.GrupoAcc.GetParams(Objeto);
end;

procedure TWCrPerfProdUsu.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_PRODUCTO.Control:=nil;
      Objeto.CVE_GPO_ACCESO.Control:=nil;
      Objeto.B_AUTORIZA_DISP.Control:=nil;
      Objeto.B_CANCELA_DISP.Control:=nil;
      Objeto.B_RECHAZA_DISP.Control:=nil;
      Objeto.B_REACTIVA_DISP.Control:=nil;
      Objeto.IMP_MAXIMO_AUT.Control:=nil;
      Objeto.B_APLI_COBRANZA.Control:=nil;
      Objeto.B_CANCELA_COB.Control:=nil;
      Objeto.B_CANCELA_SIEB.Control:=nil;
      Objeto.B_ALTA_PROCAM.Control:=nil;
      Objeto.SIT_PERFIL.Control:=nil;
      //
      Objeto.B_IMPRIME_CTO.Control:=nil;
      Objeto.B_MODIF_DISP_AUT.Control:=nil;
      Objeto.B_MOD_COMISION.Control:=nil;
      Objeto.B_MOD_INF_TASA.Control:=nil;
      // RABA NOV 2013  PROYECTO CAMBIO TASA
      Objeto.B_AUTORIZA_CTAS.Control := nil;
      Objeto.B_CANCELA_CTAS.Control := nil;
      // FIN RABA

      Objeto.Producto.DESC_C_PRODUCTO.Control := nil;
      Objeto.GrupoAcc.ID_GPO_ACCESO.Control := nil;
      Objeto.GrupoAcc.Perfil.NOM_GPO_ACCESO.Control := nil;
end;

procedure TWCrPerfProdUsu.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrPerfProdUsu.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Now;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   Objeto.GrupoAcc.BuscaWhereString := 'SECU_GPO_ACCESO.CVE_APLICACION = ' + SQLStr(Objeto.Apli.Apli);
   Objeto.GrupoAcc.FilterString := Objeto.GrupoAcc.BuscaWhereString;
   edCVE_PRODUCTO.SetFocus;
end;

procedure TWCrPerfProdUsu.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Now;
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   chB_AUTORIZA_DISP.SetFocus;
end;

procedure TWCrPerfProdUsu.btPRODUCTOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRPEPRUS_PROD',True,True) then
   begin
     Objeto.Producto.ShowAll := True;
     if Objeto.Producto.Busca then
        InterForma1.NextTab(edCVE_PRODUCTO);
     //end;
   end;
end;

procedure TWCrPerfProdUsu.ilPRODUCTOEjecuta(Sender: TObject);
begin
   if Objeto.Producto.FindKey([ilPRODUCTO.Buffer]) then
      InterForma1.NextTab(edCVE_PRODUCTO);
   //end if;
end;

procedure TWCrPerfProdUsu.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrPerfProdUsu.btnCVE_GPO_ACCESOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRPEPRUS_PROD',True,True) then
   begin
       Objeto.GrupoAcc.ShowAll := True;
       if Objeto.GrupoAcc.Busca then
          InterForma1.NextTab(edCVE_GPO_ACCESO);
       //end if;
   end;
end;

procedure TWCrPerfProdUsu.ilACCESOEjecuta(Sender: TObject);
begin
   if Objeto.GrupoAcc.FindKey([Objeto.Apli.Apli,ilACCESO.Buffer]) then
      InterForma1.NextTab(edCVE_GPO_ACCESO);
   //end if;
end;

procedure TWCrPerfProdUsu.ilACCESOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrPerfProdUsu.edCVE_PRODUCTOExit(Sender: TObject);
var     vlSalida        : Boolean;
        VlMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlMsg   := CNULL;
     vlSalida := True;
     Objeto.CVE_PRODUCTO.GetFromControl;
     if Objeto.CVE_PRODUCTO.AsString = CNULL then
     Begin
        vlSalida := False;
        vlMsg := 'Indique de favor la clave del Producto';
     end;
     InterForma1.ValidaExit(edCVE_PRODUCTO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrPerfProdUsu.edCVE_GPO_ACCESOExit(Sender: TObject);
var     vlSalida        : Boolean;
        VlMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlMsg   := CNULL;
     vlSalida := True;
     Objeto.CVE_GPO_ACCESO.GetFromControl;
     if Objeto.CVE_GPO_ACCESO.AsString = CNULL then
     Begin
        vlSalida := False;
        vlMsg := 'Indique de favor el id grupo de acceso al que pertenece el usuario';
     end;
     InterForma1.ValidaExit(edCVE_GPO_ACCESO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrPerfProdUsu.chB_AUTORIZA_DISPExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_AUTORIZA_DISP,True,CNULL,True);
end;

procedure TWCrPerfProdUsu.chB_CANCELA_DISPExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_CANCELA_DISP,True,CNULL,True);
end;

procedure TWCrPerfProdUsu.chB_RECHAZA_DISPExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_RECHAZA_DISP,True,CNULL,True);
end;

procedure TWCrPerfProdUsu.chB_REACTIVA_DISPExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_REACTIVA_DISP,True,CNULL,True);
end;

procedure TWCrPerfProdUsu.chB_CANCELA_SIEBExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_CANCELA_SIEB,True,CNULL,True);
end;

procedure TWCrPerfProdUsu.chB_ALTA_PROCAMExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_ALTA_PROCAM,True,CNULL,True);
end;

procedure TWCrPerfProdUsu.IedIMP_MAXIMO_AUTExit(Sender: TObject);
var     vlSalida        : Boolean;
        VlMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlMsg   := CNULL;
     vlSalida := True;
     Objeto.IMP_MAXIMO_AUT.GetFromControl;
     if Objeto.IMP_MAXIMO_AUT.AsFloat < 0 then
     Begin
        vlSalida := False;
        vlMsg := 'No se permiten importes negativos';
     end;
     InterForma1.ValidaExit(IedIMP_MAXIMO_AUT,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrPerfProdUsu.chB_APLI_COBRANZAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_APLI_COBRANZA,True,CNULL,True);
end;

procedure TWCrPerfProdUsu.chB_CANCELA_COBExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_CANCELA_COB,True,CNULL,True);
end;

procedure TWCrPerfProdUsu.rgSIT_PERFILExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_PERFIL,True,CNULL,True);
end;


procedure TWCrPerfProdUsu.chB_MODIF_DISP_AUTExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_MODIF_DISP_AUT,True,CNULL,True);
end;

procedure TWCrPerfProdUsu.chB_MOD_INF_TASAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_MOD_INF_TASA,True,CNULL,True);
end;

procedure TWCrPerfProdUsu.chB_MOD_COMISIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_MOD_COMISION,True,CNULL,True);
end;

procedure TWCrPerfProdUsu.chB_IMPRIME_CTOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_IMPRIME_CTO,True,CNULL,True);
end;

procedure TWCrPerfProdUsu.chB_Autoriza_CTasExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_Autoriza_CTas,True,CNULL,True);
end;

procedure TWCrPerfProdUsu.chB_Cancela_CTasExit(Sender: TObject);
begin
     InterForma1.ValidaExit(chB_Cancela_CTas,True,CNULL,True);
end;

end.

