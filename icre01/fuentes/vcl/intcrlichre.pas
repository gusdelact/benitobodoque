// Sistema         : Clase de CR_LIQ_CHE_RECEP
// Fecha de Inicio : 16/01/2004
// Función forma   : Clase de CR_LIQ_CHE_RECEP
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrLiChRe;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
//UNIDADES ADICIONALES
IntParamCre,
IntCrLiqMedi,
IntCrCredito,
IntGenCre;

Type
 TCrLiChRe= class; 

  TWCrLiqCheRecep=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_MEDIO : TLabel; 
    edCVE_MEDIO : TEdit;
    lbREF_EXTERNA : TLabel; 
    edREF_EXTERNA : TEdit;
    lbID_CREDITO : TLabel; 
    edID_CREDITO : TEdit;
    edNOM_MEDIO: TEdit;
    btMED_LIQ: TBitBtn;
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
    btDISPOSICION: TBitBtn;
    edACREDITADO: TEdit;
    GroupBox2: TGroupBox;
    lbCUENTA_BANCO: TLabel;
    edCUENTA_BANCO: TEdit;
    lbCVE_SUC_BANCO: TLabel;
    edCVE_SUC_BANCO: TEdit;
    lbID_BANCO_CHQRA: TLabel;
    edID_BANCO_CHQRA: TEdit;
    btBANCO: TBitBtn;
    edNOM_BANCO: TEdit;
    ilBANCO: TInterLinkit;
    ilDISPOCISION: TInterLinkit;
    ilCVE_MEDIO: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btMED_LIQClick(Sender: TObject);
    procedure ilCVE_MEDIOEjecuta(Sender: TObject);
    procedure edCVE_MEDIOExit(Sender: TObject);
    procedure edREF_EXTERNAExit(Sender: TObject);
    procedure btDISPOSICIONClick(Sender: TObject);
    procedure ilDISPOCISIONEjecuta(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrLiChRe;
end; 
 TCrLiChRe= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_MEDIO                : TInterCampo;
        REF_EXTERNA              : TInterCampo;
        ID_CREDITO               : TInterCampo;
        CUENTA_BANCO             : TInterCampo;
        CVE_SUC_BANCO            : TInterCampo;
        ID_BANCO_CHQRA           : TInterCampo;

        ParamCre                 : TParamCre;
        MedioLiq                 : TCrLiqMedi;
        Disposicion              : TCrCredito;

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


constructor TCrLiChRe.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_MEDIO :=CreaCampo('CVE_MEDIO',ftString,tsNinguno,tsNinguno,True);
                CVE_MEDIO.Caption:='Medio de Liquidación';
      REF_EXTERNA :=CreaCampo('REF_EXTERNA',ftString,tsNinguno,tsNinguno,True);
                REF_EXTERNA.Caption:='Referencia Externa';
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Disposición';
      CUENTA_BANCO :=CreaCampo('CUENTA_BANCO',ftString,tsNinguno,tsNinguno,True);
                CUENTA_BANCO.Caption:='Cuenta Banco';
      CVE_SUC_BANCO :=CreaCampo('CVE_SUC_BANCO',ftString,tsNinguno,tsNinguno,True);
                CVE_SUC_BANCO.Caption:='Sucursal Banco';
      ID_BANCO_CHQRA :=CreaCampo('ID_BANCO_CHQRA',ftString,tsNinguno,tsNinguno,True);
                ID_BANCO_CHQRA.Caption:='Chequera';
      FKeyFields.Add('CVE_MEDIO');
      FKeyFields.Add('REF_EXTERNA');
      FKeyFields.Add('ID_CREDITO');

      TableName := 'CR_LIQ_CHE_RECEP';
      UseQuery := True;
      HelpFile := 'IntCrLiChRe.Hlp';
      ShowMenuReporte:=True;

      MedioLiq := TCrLiqMedi.Create(Self);
      MedioLiq.MasterSource:=Self;
      MedioLiq.FieldByName('CVE_MEDIO').MasterField := 'CVE_MEDIO';

      Disposicion := TcrCredito.Create(Self);
      Disposicion.MasterSource:=Self;
      Disposicion.FieldByName('ID_CREDITO').MasterField := 'ID_CREDITO';

end;

Destructor TCrLiChRe.Destroy;
begin
   if MedioLiq <> nil then
      MedioLiq.free;
   //end if

   if Disposicion <> nil then
      Disposicion.free;
   //end if
   inherited;
end;


function TCrLiChRe.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrLiqCheRecep;
begin
   W:=TWCrLiqCheRecep.Create(Self);
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


Function TCrLiChRe.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrLiCR.it','S,S,F');
      Try if Active then begin T.Param(0,CVE_MEDIO.AsString);
                               T.Param(1,REF_EXTERNA.AsString);
                               T.Param(2,ID_CREDITO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end;
end;

function TCrLiChRe.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CR_LIQ_CHE_RECEP********************)
(*                                                                              *)
(*  FORMA DE CR_LIQ_CHE_RECEP                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_LIQ_CHE_RECEP********************)

procedure TWCrLiqCheRecep.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      with Objeto do
      Begin
            CVE_MEDIO.Control:=edCVE_MEDIO;
            REF_EXTERNA.Control:=edREF_EXTERNA;
            ID_CREDITO.Control:=edID_CREDITO;
            CUENTA_BANCO.Control:=edCUENTA_BANCO;
            CVE_SUC_BANCO.Control:=edCVE_SUC_BANCO;
            ID_BANCO_CHQRA.Control:=edID_BANCO_CHQRA;

            MedioLiq.DESC_MEDIO.Control := edNOM_MEDIO;
            MedioLiq.GetParams(Objeto);
            edCVE_MEDIO.Hint := MedioLiq.DESC_MEDIO.AsString;
            edCVE_MEDIO.ShowHint := True;

            Disposicion.ContratoCre.Acreditado.Persona.Nombre.Control:= edACREDITADO;
            Disposicion.GetParams(Objeto);
            edACREDITADO.Hint := Disposicion.ContratoCre.Acreditado.Persona.Nombre.AsString;
            edACREDITADO.ShowHint := True;
      end;
end;

procedure TWCrLiqCheRecep.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_MEDIO.Control:=nil;
      Objeto.REF_EXTERNA.Control:=nil;
      Objeto.ID_CREDITO.Control:=nil;
      Objeto.CUENTA_BANCO.Control:=nil;
      Objeto.CVE_SUC_BANCO.Control:=nil;
      Objeto.ID_BANCO_CHQRA.Control:=nil;
   //Objeto
end;

procedure TWCrLiqCheRecep.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrLiqCheRecep.InterForma1DespuesNuevo(Sender: TObject);
begin
   edCVE_MEDIO.SetFocus;
end;

procedure TWCrLiqCheRecep.InterForma1DespuesModificar(Sender: TObject);
begin
   edID_BANCO_CHQRA.SetFocus;
end;

procedure TWCrLiqCheRecep.btMED_LIQClick(Sender: TObject);
begin
   Objeto.MedioLiq.ShowAll := True;
   if Objeto.MedioLiq.Busca then
      InterForma1.NextTab(edCVE_MEDIO);
   //end if
end;

procedure TWCrLiqCheRecep.ilCVE_MEDIOEjecuta(Sender: TObject);
begin
   if Objeto.MedioLiq.FindKey([ilCVE_MEDIO.Buffer]) then
      InterForma1.NextTab(edCVE_MEDIO);
   //end if
end;

procedure TWCrLiqCheRecep.edCVE_MEDIOExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_MEDIO.GetFromControl;
      if Objeto.CVE_MEDIO.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave del medio de liquidación';
      end;
      InterForma1.ValidaExit(edCVE_MEDIO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrLiqCheRecep.edREF_EXTERNAExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.REF_EXTERNA.GetFromControl;
      if Objeto.REF_EXTERNA.AsString = CNULL then
      Begin
         vlSalida := False;
         vlMsg := 'Indique la referencia externa';
      end;
      InterForma1.ValidaExit(edREF_EXTERNA,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrLiqCheRecep.btDISPOSICIONClick(Sender: TObject);
begin
   Objeto.Disposicion.ShowAll := True;
   if Objeto.Disposicion.Busca then
      InterForma1.NextTab(edID_CREDITO);
   //end if
end;

procedure TWCrLiqCheRecep.ilDISPOCISIONEjecuta(Sender: TObject);
begin
   if Objeto.Disposicion.FindKey([ilDISPOCISION.Buffer]) then
      InterForma1.NextTab(edID_CREDITO);
   //end if
end;

procedure TWCrLiqCheRecep.edID_CREDITOExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_CREDITO.GetFromControl;
      if Objeto.ID_CREDITO.AsString = CNULL then
      Begin
         vlSalida := False;
         vlMsg := 'Indique la disposición';
      end;
      InterForma1.ValidaExit(edID_CREDITO,vlSalida,vlMsg,True);
   end;
end;

end.
