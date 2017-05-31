// Sistema         : Clase de CR_CB_PRO_PROY
// Fecha de Inicio : 12/10/2005
// Función forma   : Clase de CR_CB_PRO_PROY
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrCbPrPr;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntCrCredito, IntCrGruCla,IntCrSoGtNa, IntParamCre;

Type
 TCrCbPrPr= class;

  TWCrCbProProy=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_CREDITO : TLabel;
    edID_CREDITO : TEdit;
    lbID_SOLICITUD : TLabel; 
    edID_SOLICITUD : TEdit;
    lbCVE_PROPOSITO : TLabel; 
    edCVE_PROPOSITO : TEdit; 
    edDESC_PROPOSITO : TEdit;
    btnCVE_PROPOSITO: TBitBtn;
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
    ilCVE_PROPOSITO: TInterLinkit;
    btnID_CREDITO: TBitBtn;
    edDESC_CREDITO: TEdit;
    btnID_SOLICITUD: TBitBtn;
    ilID_CREDITO: TInterLinkit;
    ilID_SOLICITUD: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btnID_CREDITOClick(Sender: TObject);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure edID_SOLICITUDExit(Sender: TObject);
    procedure ilID_SOLICITUDEjecuta(Sender: TObject);
    procedure btnID_SOLICITUDClick(Sender: TObject);
    procedure btnCVE_PROPOSITOClick(Sender: TObject);
    procedure ilID_CREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_SOLICITUDCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_PROPOSITOCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_PROPOSITOExit(Sender: TObject);
    procedure ilCVE_PROPOSITOEjecuta(Sender: TObject);
    private 
    { Private declarations } 
    public
    { Public declarations } 
    Objeto : TCrCbPrPr;
end;
 TCrCbPrPr= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public 
        { Public declarations } 
        ID_CREDITO               : TInterCampo;
        ID_SOLICITUD             : TInterCampo;
        CVE_PROPOSITO            : TInterCampo;
        DESC_PROPOSITO           : TInterCampo;

        iIdCredito, iIdSolicitud : Integer;

        CrCredito  : TCrCredito;
        CrSoGtNa   : TCrSoGtNa;
        CrGruCla   : TCrGruCla;
        ParamCre                 : TParamCre;

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


constructor TCrCbPrPr.Create( AOwner : TComponent ); 
begin Inherited;
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Número de Credito';
      ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
                ID_SOLICITUD.Caption:='Número de Solicitud';
      CVE_PROPOSITO :=CreaCampo('CVE_PROPOSITO',ftString,tsNinguno,tsNinguno,True);
                CVE_PROPOSITO.Caption:='Clave de Proposito';
      DESC_PROPOSITO :=CreaCampo('DESC_PROPOSITO',ftString,tsNinguno,tsNinguno,False);
                DESC_PROPOSITO.Caption:='Descripción';
      FKeyFields.Add('ID_CREDITO');
      FKeyFields.Add('ID_SOLICITUD');
      FKeyFields.Add('CVE_PROPOSITO');

      TableName := 'CR_CB_PRO_PROY';
      UseQuery := True;
      HelpFile := 'IntCrCbPrPr.Hlp';
      ShowMenuReporte:=True;

      CrCredito := TCrCredito.Create(Self);
      CrCredito.MasterSource:=Self;
      CrCredito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      CrSoGtNa:=  TCrSoGtNa.Create(Self);
      CrSoGtNa.MasterSource:=Self;
      CrSoGtNa.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';
      CrSoGtNa.FieldByName('ID_SOLICITUD').MasterField:='ID_SOLICITUD';

      CrGruCla:=  TCrGruCla.Create(Self);
      CrGruCla.MasterSource:=Self;
end;

Destructor TCrCbPrPr.Destroy;
begin
   If CrCredito <> Nil Then
      CrCredito.Free;
   If CrSoGtNa <> Nil Then
      CrSoGtNa.Free;
   If CrGruCla <> Nil Then
      CrGruCla.Free;
   inherited;
end;


function TCrCbPrPr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCbProProy;
begin
   W:=TWCrCbProProy.Create(Self);
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


Function TCrCbPrPr.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrCbPP.it','F,F,S');
      Try if Active then begin T.Param(0,ID_CREDITO.AsString); 
                               T.Param(1,ID_SOLICITUD.AsString); 
                               T.Param(2,CVE_PROPOSITO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end;
end;

function TCrCbPrPr.Reporte:Boolean;
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_CB_PRO_PROY********************)
(*                                                                              *)
(*  FORMA DE CR_CB_PRO_PROY                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CB_PRO_PROY********************)

procedure TWCrCbProProy.FormShow(Sender: TObject);
begin

   lbDEmpresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDFecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.ID_CREDITO.Control:=edID_CREDITO;
   Objeto.ID_SOLICITUD.Control:=edID_SOLICITUD;
   Objeto.CVE_PROPOSITO.Control:=edCVE_PROPOSITO;
   Objeto.DESC_PROPOSITO.Control:=edDESC_PROPOSITO;
   Objeto.CrCredito.ID_CREDITO.Control:= edID_CREDITO;
   Objeto.CrCredito.ContratoCre.Producto.DESC_L_PRODUCTO.Control:= edDESC_CREDITO;
   Objeto.CrSoGtNa.ID_SOLICITUD.Control:= edID_SOLICITUD;
   Objeto.CrGruCla.CVE_REFERENCIA.Control:=edCVE_PROPOSITO;
   Objeto.CrGruCla.VALOR.Control:=edDESC_PROPOSITO;
   Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrCbProProy.FormDestroy(Sender: TObject);
begin
   Objeto.ID_CREDITO.Control:=nil;
   Objeto.ID_SOLICITUD.Control:=nil;
   Objeto.CVE_PROPOSITO.Control:=nil;
   Objeto.DESC_PROPOSITO.Control:=nil;
   Objeto.CrCredito.ID_CREDITO.Control:= nil;
   Objeto.CrCredito.ContratoCre.Producto.DESC_L_PRODUCTO.Control:= nil;
   Objeto.CrSoGtNa.ID_SOLICITUD.Control:= nil;      
   Objeto.CrGruCla.CVE_REFERENCIA.Control:=nil;
   Objeto.CrGruCla.VALOR.Control:=nil;
end;

procedure TWCrCbProProy.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCbProProy.InterForma1DespuesNuevo(Sender: TObject);
begin
   If (Objeto.iIdCredito <> 0)Then Begin
      Objeto.CrCredito.FindKey([Objeto.iIdCredito]);
      If (Objeto.iIdSolicitud<>0)Then
         Objeto.CrSoGtNa.FindKey([Objeto.iIdCredito,Objeto.iIdSolicitud]);
      edCVE_PROPOSITO.SetFocus;
   end;
end;

procedure TWCrCbProProy.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrCbProProy.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrCbProProy.btnID_CREDITOClick(Sender: TObject);
begin
   If Objeto.CrCredito.Busca Then Begin
      InterForma1.NextTab(btnID_CREDITO);
   End;
end;

procedure TWCrCbProProy.ilID_CREDITOEjecuta(Sender: TObject);
begin
   If (Objeto.Modo=moAppend)Then
      If Objeto.CrCredito.FindKey([ilID_CREDITO.Buffer]) Then Begin
         InterForma1.NextTab(edID_CREDITO);
      End;
end;

procedure TWCrCbProProy.edID_CREDITOExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      Objeto.ID_CREDITO.GetFromControl;
      If Objeto.ID_CREDITO.AsInteger = 0 Then Begin
         vlSalida := False;
         vlmsg := 'Favor de Indicar el Número de Disposición';
      End;
      InterForma1.ValidaExit(edID_CREDITO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrCbProProy.edID_SOLICITUDExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      Objeto.ID_SOLICITUD.GetFromControl;
      If Objeto.ID_SOLICITUD.AsInteger = 0 Then Begin
         vlSalida := False;
         vlmsg := 'Favor de Indicar el Número de Solicitud';
      End;
      InterForma1.ValidaExit(edID_SOLICITUD,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrCbProProy.ilID_SOLICITUDEjecuta(Sender: TObject);
begin
   If (Objeto.Modo=moAppend)Then
      Objeto.ID_CREDITO.GetFromControl;
      If Objeto.CrSoGtNa.FindKey([Objeto.ID_CREDITO.AsInteger,ilID_SOLICITUD.Buffer]) Then Begin
         InterForma1.NextTab(edID_SOLICITUD);
      End;
end;

procedure TWCrCbProProy.btnID_SOLICITUDClick(Sender: TObject);
begin
   If Objeto.CrSoGtNa.Busca Then Begin
      InterForma1.NextTab(btnID_SOLICITUD);
   End;
end;

procedure TWCrCbProProy.btnCVE_PROPOSITOClick(Sender: TObject);
begin
   Objeto.CrGruCla.BuscaWhereString:= ' CVE_GRUPO_CLAVE = ''CVPROP''';
   If Objeto.CrGruCla.Busca Then Begin
      InterForma1.NextTab(btnCVE_PROPOSITO);
   End;
end;

procedure TWCrCbProProy.ilID_CREDITOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.IsNewData);
end;

procedure TWCrCbProProy.ilID_SOLICITUDCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.IsNewData);
end;

procedure TWCrCbProProy.ilCVE_PROPOSITOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)or (InterForma1.IsNewData);
end;

procedure TWCrCbProProy.edCVE_PROPOSITOExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      Objeto.CVE_PROPOSITO.GetFromControl;
      If Objeto.CVE_PROPOSITO.AsString = '' Then Begin
         vlSalida := False;
         vlmsg := 'Favor de Indicar el Propósito';
      End;
      InterForma1.ValidaExit(edCVE_PROPOSITO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrCbProProy.ilCVE_PROPOSITOEjecuta(Sender: TObject);
begin
   If (Objeto.Modo=moAppend)Then
      Objeto.CVE_PROPOSITO.GetFromControl;
      If Objeto.CrGruCla.FindKey(['CVPROP',ilCVE_PROPOSITO.Buffer]) Then Begin
         InterForma1.NextTab(edCVE_PROPOSITO);
      End;
end;

end.
