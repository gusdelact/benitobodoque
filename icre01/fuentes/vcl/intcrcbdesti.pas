// Sistema         : Clase de CR_CB_DESTINO
// Fecha de Inicio : 12/10/2005
// Función forma   : Clase de CR_CB_DESTINO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrCbDesti;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,IntParamCre,
IntCrCredito, IntCrGruCla,IntCrSoGtNa, IntLinkit, InterEdit;

Type
 TCrCbDesti= class;

  TWCrCbDestino=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_CREDITO : TLabel; 
    edID_CREDITO : TEdit;
    lbID_SOLICITUD : TLabel; 
    edID_SOLICITUD : TEdit;
    lbCVE_DESTINO : TLabel; 
    edCVE_DESTINO : TEdit;
    lbPCT_PARCIAL : TLabel;
    lbPCT_ORIGEN_NAL : TLabel;
    lbPCT_IMPORTACION : TLabel;
    edDESC_DESTINO : TEdit;
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
    btnCVE_DESTINO: TBitBtn;
    btnID_CREDITO: TBitBtn;
    edDESC_CREDITO: TEdit;
    btnID_SOLICITUD: TBitBtn;
    ilID_CREDITO: TInterLinkit;
    ilID_SOLICITUD: TInterLinkit;
    ilCVE_DESTINO: TInterLinkit;
    edPCT_PARCIAL: TInterEdit;
    edPCT_ORIGEN_NAL: TInterEdit;
    edPCT_IMPORTACION: TInterEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btnID_CREDITOClick(Sender: TObject);
    procedure btnID_SOLICITUDClick(Sender: TObject);
    procedure btnCVE_DESTINOClick(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure edID_SOLICITUDExit(Sender: TObject);
    procedure edCVE_DESTINOExit(Sender: TObject);
    procedure ilID_CREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_SOLICITUDCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_DESTINOCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure ilID_SOLICITUDEjecuta(Sender: TObject);
    procedure ilCVE_DESTINOEjecuta(Sender: TObject);
    procedure edPCT_PARCIALExit(Sender: TObject);
    procedure edPCT_ORIGEN_NALExit(Sender: TObject);
    procedure edPCT_IMPORTACIONExit(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrCbDesti;
end; 
 TCrCbDesti= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ID_CREDITO               : TInterCampo;
        ID_SOLICITUD             : TInterCampo;
        CVE_DESTINO              : TInterCampo;
        PCT_PARCIAL              : TInterCampo;
        PCT_ORIGEN_NAL           : TInterCampo;
        PCT_IMPORTACION          : TInterCampo;
        DESC_DESTINO             : TInterCampo;

        CrCredito  : TCrCredito;
        CrSoGtNa   : TCrSoGtNa;
        CrGruCla   : TCrGruCla;
        ParamCre   : TParamCre;

        iIdCredito, iIdSolicitud : Integer;

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


constructor TCrCbDesti.Create( AOwner : TComponent ); 
begin Inherited;
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Número de Credito';
      ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
                ID_SOLICITUD.Caption:='Número de Solicitud';
      CVE_DESTINO :=CreaCampo('CVE_DESTINO',ftString,tsNinguno,tsNinguno,True);
                CVE_DESTINO.Caption:='Clave de Destino';
      PCT_PARCIAL :=CreaCampo('PCT_PARCIAL',ftFloat,tsNinguno,tsNinguno,True);
                PCT_PARCIAL.Caption:='Pct Parcial';
      PCT_ORIGEN_NAL :=CreaCampo('PCT_ORIGEN_NAL',ftFloat,tsNinguno,tsNinguno,True);
                PCT_ORIGEN_NAL.Caption:='Pct Origen Nal';
      PCT_IMPORTACION :=CreaCampo('PCT_IMPORTACION',ftFloat,tsNinguno,tsNinguno,True);
                PCT_IMPORTACION.Caption:='Pct Importacion';
      DESC_DESTINO :=CreaCampo('DESC_DESTINO',ftString,tsNinguno,tsNinguno,False);
                DESC_DESTINO.Caption:='Descripción';
      FKeyFields.Add('ID_CREDITO');
      FKeyFields.Add('ID_SOLICITUD');
      FKeyFields.Add('CVE_DESTINO');

      TableName := 'CR_CB_DESTINO'; 
      UseQuery := True; 
      HelpFile := 'IntCrCbDesti.Hlp';
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

Destructor TCrCbDesti.Destroy;
begin
   If CrCredito <> Nil Then
      CrCredito.Free;
   If CrSoGtNa <> Nil Then
      CrSoGtNa.Free;
   If CrGruCla <> Nil Then
      CrGruCla.Free;
inherited;
end;


function TCrCbDesti.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCbDestino;
begin
   W:=TWCrCbDestino.Create(Self);
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


Function TCrCbDesti.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrCbDes.it','F,F,S');
      Try if Active then begin T.Param(0,ID_CREDITO.AsString); 
                               T.Param(1,ID_SOLICITUD.AsString);
                               T.Param(2,CVE_DESTINO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end; 
end;

function TCrCbDesti.Reporte:Boolean;
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_CB_DESTINO********************)
(*                                                                              *)
(*  FORMA DE CR_CB_DESTINO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CB_DESTINO********************)

procedure TWCrCbDestino.FormShow(Sender: TObject);
begin

   lbDEmpresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDFecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.ID_CREDITO.Control:=edID_CREDITO;
   Objeto.ID_SOLICITUD.Control:=edID_SOLICITUD;
   Objeto.CVE_DESTINO.Control:=edCVE_DESTINO;
   Objeto.PCT_PARCIAL.Control:=edPCT_PARCIAL;
   Objeto.PCT_ORIGEN_NAL.Control:=edPCT_ORIGEN_NAL;
   Objeto.PCT_IMPORTACION.Control:=edPCT_IMPORTACION;
   Objeto.DESC_DESTINO.Control:=edDESC_DESTINO;

   Objeto.CrCredito.ID_CREDITO.Control:= edID_CREDITO;
   Objeto.CrCredito.ContratoCre.Producto.DESC_L_PRODUCTO.Control:= edDESC_CREDITO;
   Objeto.CrSoGtNa.ID_SOLICITUD.Control:= edID_SOLICITUD;
   Objeto.CrGruCla.CVE_REFERENCIA.Control:=edCVE_DESTINO;
   Objeto.CrGruCla.VALOR.Control:=edDESC_DESTINO;
   Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrCbDestino.FormDestroy(Sender: TObject);
begin
   Objeto.ID_CREDITO.Control:=nil;
   Objeto.ID_SOLICITUD.Control:=nil;
   Objeto.CVE_DESTINO.Control:=nil;
   Objeto.PCT_PARCIAL.Control:=nil;
   Objeto.PCT_ORIGEN_NAL.Control:=nil;
   Objeto.PCT_IMPORTACION.Control:=nil;
   Objeto.DESC_DESTINO.Control:=nil;
   Objeto.CrCredito.ID_CREDITO.Control:= nil;
   Objeto.CrCredito.ContratoCre.Producto.DESC_L_PRODUCTO.Control:= nil;
   Objeto.CrSoGtNa.ID_SOLICITUD.Control:= nil;
   Objeto.CrGruCla.CVE_REFERENCIA.Control:=nil;
   Objeto.CrGruCla.VALOR.Control:=nil;
end;

procedure TWCrCbDestino.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCbDestino.InterForma1DespuesNuevo(Sender: TObject);
begin
   If (Objeto.iIdCredito <> 0)Then Begin
      Objeto.CrCredito.FindKey([Objeto.iIdCredito]);
      If (Objeto.iIdSolicitud<>0)Then
         Objeto.CrSoGtNa.FindKey([Objeto.iIdCredito,Objeto.iIdSolicitud]);
      edCVE_DESTINO.SetFocus;
   end;
end;

procedure TWCrCbDestino.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrCbDestino.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte; 
//end;


procedure TWCrCbDestino.btnID_CREDITOClick(Sender: TObject);
begin
   If Objeto.CrCredito.Busca Then Begin
      InterForma1.NextTab(btnID_CREDITO);
   End;
end;

procedure TWCrCbDestino.btnID_SOLICITUDClick(Sender: TObject);
begin
   If Objeto.CrSoGtNa.Busca Then Begin
      InterForma1.NextTab(btnID_SOLICITUD);
   End;
end;

procedure TWCrCbDestino.btnCVE_DESTINOClick(Sender: TObject);
begin
   Objeto.CrGruCla.BuscaWhereString:= ' CVE_GRUPO_CLAVE = ''CVEREC''';
   If Objeto.CrGruCla.Busca Then Begin
      InterForma1.NextTab(btnCVE_DESTINO);
   End;
end;

procedure TWCrCbDestino.edID_CREDITOExit(Sender: TObject);
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

procedure TWCrCbDestino.edID_SOLICITUDExit(Sender: TObject);
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

procedure TWCrCbDestino.edCVE_DESTINOExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      Objeto.CVE_DESTINO.GetFromControl;
      If Objeto.CVE_DESTINO.AsString = '' Then Begin
         vlSalida := False;
         vlmsg := 'Favor de Indicar el Destino';
      End;
      InterForma1.ValidaExit(edCVE_DESTINO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrCbDestino.ilID_CREDITOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.IsNewData);
end;

procedure TWCrCbDestino.ilID_SOLICITUDCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.IsNewData);
end;

procedure TWCrCbDestino.ilCVE_DESTINOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)or (InterForma1.IsNewData);
end;

procedure TWCrCbDestino.ilID_CREDITOEjecuta(Sender: TObject);
begin
   If (Objeto.Modo=moAppend)Then
      If Objeto.CrCredito.FindKey([ilID_CREDITO.Buffer]) Then Begin
         InterForma1.NextTab(edID_CREDITO);
      End;
end;

procedure TWCrCbDestino.ilID_SOLICITUDEjecuta(Sender: TObject);
begin
   If (Objeto.Modo=moAppend)Then
      Objeto.ID_CREDITO.GetFromControl;
      If Objeto.CrSoGtNa.FindKey([Objeto.ID_CREDITO.AsInteger,ilID_SOLICITUD.Buffer]) Then Begin
         InterForma1.NextTab(edID_SOLICITUD);
      End;
end;

procedure TWCrCbDestino.ilCVE_DESTINOEjecuta(Sender: TObject);
begin
   If (Objeto.Modo=moAppend)Then
      Objeto.CVE_DESTINO.GetFromControl;
      If Objeto.CrGruCla.FindKey(['CVEREC',ilCVE_DESTINO.Buffer]) Then Begin
         InterForma1.NextTab(edCVE_DESTINO);
      End;
end;

procedure TWCrCbDestino.edPCT_PARCIALExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edPCT_PARCIAL,True,'',True);
end;

procedure TWCrCbDestino.edPCT_ORIGEN_NALExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppend)) Then Begin
      Objeto.PCT_ORIGEN_NAL.GetFromControl;
      Objeto.PCT_IMPORTACION.GetFromControl;
      If (Objeto.PCT_ORIGEN_NAL.AsFloat >= 0)And(Objeto.PCT_ORIGEN_NAL.AsFloat <= 100) Then Begin
         Objeto.PCT_IMPORTACION.AsFloat:= 100 - Objeto.PCT_ORIGEN_NAL.AsFloat;
      End Else Begin
         vlSalida := False;
         vlmsg := 'El Porcentaje debe ser >=0 y <=100';
      End;
      InterForma1.ValidaExit(edPCT_ORIGEN_NAL,vlSalida,vlMsg,True);
   End;
end;

procedure TWCrCbDestino.edPCT_IMPORTACIONExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppend)) Then Begin
      Objeto.PCT_ORIGEN_NAL.GetFromControl;
      Objeto.PCT_IMPORTACION.GetFromControl;
      If (Objeto.PCT_IMPORTACION.AsFloat >= 0)And(Objeto.PCT_IMPORTACION.AsFloat <= 100) Then Begin
         Objeto.PCT_ORIGEN_NAL.AsFloat:= 100 - Objeto.PCT_IMPORTACION.AsFloat;
      End Else Begin
         vlSalida := False;
         vlmsg := 'El Porcentaje debe ser >= 0 y <=100 ';
      End;
      InterForma1.ValidaExit(edPCT_IMPORTACION,vlSalida,vlMsg,True);
   End;
end;

end.
