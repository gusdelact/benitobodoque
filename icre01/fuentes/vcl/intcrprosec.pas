// Sistema         : Clase de CR_PROV_SECTOR
// Fecha de Inicio : 19/02/2004
// Función forma   : Clase de CR_PROV_SECTOR
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrProSec;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit,
//Unidades adicionales
   IntParamCre , IntGenCre
;

Type
 TCrProSec= class;

  TWCrProvSector=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_SECTOR_PRO : TLabel; 
    edCVE_SECTOR_PRO : TEdit;
    lbDESC_SECTOR : TLabel; 
    edDESC_SECTOR : TEdit;
    lbPCT_MAX_PROV_PF : TLabel; 
    IedPCT_MAX_PROV_PF : TInterEdit;
    lbPCT_MAX_PROV_PM : TLabel; 
    IedPCT_MAX_PROV_PM : TInterEdit;
    lbIMP_MAX_PROV_PF : TLabel; 
    IedIMP_MAX_PROV_PF : TInterEdit;
    lbIMP_MAX_PROV_PM : TLabel;
    rgSIT_PROV_SECTOR : TRadioGroup;
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
    Label16: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    edFH_CAPTURA: TEdit;
    edH_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USUARIO_MOD: TEdit;
    IedIMP_MAX_PROV_PM: TInterEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_SECTOR_PROExit(Sender: TObject);
    procedure edDESC_SECTORExit(Sender: TObject);
    procedure IedPCT_MAX_PROV_PFExit(Sender: TObject);
    procedure IedIMP_MAX_PROV_PFExit(Sender: TObject);
    procedure IedPCT_MAX_PROV_PMExit(Sender: TObject);
    procedure IedIMP_MAX_PROV_PMExit(Sender: TObject);
    procedure rgSIT_PROV_SECTORExit(Sender: TObject);
    private
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrProSec;
end;
 TCrProSec= class(TInterFrame) 
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_SECTOR_PRO           : TInterCampo;
        DESC_SECTOR              : TInterCampo;
        PCT_MAX_PROV_PF          : TInterCampo;
        PCT_MAX_PROV_PM          : TInterCampo;
        IMP_MAX_PROV_PF          : TInterCampo;
        IMP_MAX_PROV_PM          : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        FH_CAPTURA               : TInterCampo;
        CVE_USUARIO_MOD          : TInterCampo;
        H_MODIFICA               : TInterCampo;
        SIT_PROV_SECTOR          : TInterCampo;

        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published 
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrProSec.Create( AOwner : TComponent );
begin Inherited;
      CVE_SECTOR_PRO :=CreaCampo('CVE_SECTOR_PRO',ftString,tsNinguno,tsNinguno,True);
                CVE_SECTOR_PRO.Caption:='Clave Sector';
      DESC_SECTOR :=CreaCampo('DESC_SECTOR',ftString,tsNinguno,tsNinguno,True);
                DESC_SECTOR.Caption:='Descripción';
      PCT_MAX_PROV_PF :=CreaCampo('PCT_MAX_PROV_PF',ftFloat,tsNinguno,tsNinguno,True);
                PCT_MAX_PROV_PF.Caption:='Máximo  PF';
      PCT_MAX_PROV_PM :=CreaCampo('PCT_MAX_PROV_PM',ftFloat,tsNinguno,tsNinguno,True);
                PCT_MAX_PROV_PM.Caption:='Máximo  PM';
      IMP_MAX_PROV_PF :=CreaCampo('IMP_MAX_PROV_PF',ftFloat,tsNinguno,tsNinguno,True);
                IMP_MAX_PROV_PF.Caption:='Imp. Máximo PF';
      IMP_MAX_PROV_PM :=CreaCampo('IMP_MAX_PROV_PM',ftFloat,tsNinguno,tsNinguno,True);
                IMP_MAX_PROV_PM.Caption:='Imp. Máximo PM';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      FH_CAPTURA :=CreaCampo('FH_CAPTURA',ftDateTime,tsNinguno,tsNinguno,True);
                FH_CAPTURA.Caption:='Fecha y Hora Captura';
      CVE_USUARIO_MOD :=CreaCampo('CVE_USUARIO_MOD',ftString,tsNinguno,tsNinguno,True);
                CVE_USUARIO_MOD.Caption:='Clave de Usuario Mod';
      H_MODIFICA :=CreaCampo('H_MODIFICA',ftFloat,tsNinguno,tsNinguno,True);
                H_MODIFICA.Caption:='H Modifica';
      SIT_PROV_SECTOR :=CreaCampo('SIT_PROV_SECTOR',ftString,tsNinguno,tsNinguno,True);
         With SIT_PROV_SECTOR do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0');    ComboDatos.Add('AC');
                ComboLista.Add('1');    ComboDatos.Add('CA');

          end;
                SIT_PROV_SECTOR.Caption:='Situación del Sector';
      FKeyFields.Add('CVE_SECTOR_PRO');

      TableName := 'CR_PROV_SECTOR';
      UseQuery := True;
      HelpFile := 'IntCrProSec.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrProSec.Destroy;
begin inherited;
end;


function TCrProSec.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrProvSector;
begin
   W:=TWCrProvSector.Create(Self);
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


Function TCrProSec.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrPrSe.it','S');
      Try if Active then begin T.Param(0,CVE_SECTOR_PRO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;


(***********************************************FORMA CR_PROV_SECTOR********************)
(*                                                                              *)
(*  FORMA DE CR_PROV_SECTOR                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_PROV_SECTOR********************)

procedure TWCrProvSector.FormShow(Sender: TObject);
begin
      //Pinta los datos del panel inferior
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_SECTOR_PRO.Control:=edCVE_SECTOR_PRO;
      Objeto.DESC_SECTOR.Control:=edDESC_SECTOR;
      Objeto.PCT_MAX_PROV_PF.Control:=IedPCT_MAX_PROV_PF;
      Objeto.PCT_MAX_PROV_PM.Control:=IedPCT_MAX_PROV_PM;
      Objeto.IMP_MAX_PROV_PF.Control:=IedIMP_MAX_PROV_PF;
      Objeto.IMP_MAX_PROV_PM.Control:=IedIMP_MAX_PROV_PM;
      Objeto.SIT_PROV_SECTOR.Control:=rgSIT_PROV_SECTOR;
      Objeto.FH_CAPTURA.Control := edFH_CAPTURA;
      Objeto.CVE_USU_ALTA.Control := edCVE_USU_ALTA;
      Objeto.H_MODIFICA.Control := edH_MODIFICA;
      Objeto.CVE_USUARIO_MOD.Control := edCVE_USUARIO_MOD;

      InterForma1.MsgPanel := MsgPanel;
      
end;

procedure TWCrProvSector.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_SECTOR_PRO.Control:=nil;
      Objeto.DESC_SECTOR.Control:=nil;
      Objeto.PCT_MAX_PROV_PF.Control:=nil;
      Objeto.PCT_MAX_PROV_PM.Control:=nil;
      Objeto.IMP_MAX_PROV_PF.Control:=nil;
      Objeto.IMP_MAX_PROV_PM.Control:=nil;
      Objeto.SIT_PROV_SECTOR.Control:=nil;
      Objeto.FH_CAPTURA.Control := nil;
      Objeto.CVE_USU_ALTA.Control := nil;
      Objeto.H_MODIFICA.Control := nil;
      Objeto.CVE_USUARIO_MOD.Control := nil;
end;

procedure TWCrProvSector.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrProvSector.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   Objeto.FH_CAPTURA.AsDateTime := Now;
   rgSIT_PROV_SECTOR.ItemIndex := 0;
   edCVE_SECTOR_PRO.SetFocus;
end;

procedure TWCrProvSector.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.CVE_USUARIO_MOD.AsString := Objeto.Apli.Usuario;
   Objeto.H_MODIFICA.AsInteger := ConverFechaAHora(Objeto.Apli.SysDateTime);
   edDESC_SECTOR.SetFocus;
end;

procedure TWCrProvSector.edCVE_SECTOR_PROExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg      : String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlSalida := True;
      vlMsg := CNULL;
      Objeto.CVE_SECTOR_PRO.GetFromControl;
      if Objeto.CVE_SECTOR_PRO.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg      :='Por favor indique la clave del sector del proveedor';
      end;
      InterForma1.ValidaExit(edCVE_SECTOR_PRO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrProvSector.edDESC_SECTORExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edDESC_SECTOR,True,'',True);
end;

procedure TWCrProvSector.IedPCT_MAX_PROV_PFExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg      : String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlSalida := True;
      vlMsg := CNULL;
      Objeto.PCT_MAX_PROV_PF.GetFromControl;
      if Objeto.PCT_MAX_PROV_PF.AsFloat < 0 then
      Begin
         vlSalida   := False;
         vlMsg      :='El porcentaje máximo del proveedor persona física no debe ser menor a cero';
      end;
      InterForma1.ValidaExit(IedPCT_MAX_PROV_PF,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrProvSector.IedIMP_MAX_PROV_PFExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg      : String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlSalida := True;
      vlMsg := CNULL;
      Objeto.IMP_MAX_PROV_PF.GetFromControl;
      if Objeto.IMP_MAX_PROV_PF.AsFloat < 0 then
      Begin
         vlSalida   := False;
         vlMsg      :='El importe máximo del proveedor persona física no debe ser menor a cero';
      end;
      InterForma1.ValidaExit(IedIMP_MAX_PROV_PF,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrProvSector.IedPCT_MAX_PROV_PMExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg      : String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlSalida := True;
      vlMsg := CNULL;
      Objeto.PCT_MAX_PROV_PM.GetFromControl;
      if Objeto.PCT_MAX_PROV_PM.AsFloat < 0 then
      Begin
         vlSalida   := False;
         vlMsg      :='El porcentaje máximo del proveedor persona moral no debe ser menor a cero';
      end;
      InterForma1.ValidaExit(IedPCT_MAX_PROV_PM,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrProvSector.IedIMP_MAX_PROV_PMExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg      : String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlSalida := True;
      vlMsg := CNULL;
      Objeto.IMP_MAX_PROV_PM.GetFromControl;
      if Objeto.IMP_MAX_PROV_PM.AsFloat < 0 then
      Begin
         vlSalida   := False;
         vlMsg      :='El importe máximo del proveedor persona moral no debe ser menor a cero';
      end;
      InterForma1.ValidaExit(IedIMP_MAX_PROV_PM,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrProvSector.rgSIT_PROV_SECTORExit(Sender: TObject);
begin
      InterForma1.ValidaExit(rgSIT_PROV_SECTOR,True,'',True);
end;

end.
