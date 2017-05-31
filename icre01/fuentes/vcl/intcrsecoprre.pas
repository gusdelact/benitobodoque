{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
// Sistema         : Clase de CrSeCoPr
// Fecha de Inicio : 30/07/2003
// Función forma   : Clase de CrSeCoPr
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrSeCoPrRe;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,InterApl,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntSGCtrl, IntLinkit,Ungene,

  //Unidades Adicionales
  //IntParamCre,
  IntCrBitSgui,
  IntCrSeguimi;

type
  TCrSeCoPrRe  = class;

  TWCrSeCoPrRe = Class(TForm)
    gbReactiva: TGroupBox;
    Label4: TLabel;
    Label8: TLabel;
    edCOMENTARIO: TEdit;
    edDESC_MODO_PAGO: TEdit;
    edMODO_PAGO: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    btMODO_PAGO: TBitBtn;
    ilMODO_PAGO: TInterLinkit;
    cbMedioPago: TCheckBox;
    cbComentario: TCheckBox;
    lbAplica: TLabel;
    InterForma1: TInterForma;
    btAceptar: TBitBtn;
    MsgPanel: TPanel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure ilMODO_PAGOEjecuta(Sender: TObject);
    procedure btMODO_PAGOClick(Sender: TObject);
    procedure cbMedioPagoClick(Sender: TObject);
    procedure cbComentarioClick(Sender: TObject);
    procedure btAceptarClick(Sender: TObject);
  public
    vgBModifica  : Boolean;
    vgMedPagoAll : Boolean;
    vgTxComenAll : Boolean;
    vgStrMedPago : String;
    vgStrTxComen : String;
    Objeto       : TCrSeCoPrRe;
  private
    procedure ObtenDatos( peFCobranza, peIdBitSegto: String; var psMedio, psTxComentario : String );
  public
    procedure CreaObjeto( Aowner:TComponent; Apli: TInterApli );
    procedure Inicializa;
    procedure LiberaObjeto;
    procedure BCambiarDatos;
    procedure HabilitaMedioPago( peBandera : Boolean );
    procedure HabilitaComentario( peBandera : Boolean );
    procedure ObtenDatosReactivacion( peFCobranza, peIdBitSegto{, peMedio,
                peTxComentario} : String; var psMedio, psTxComentario : String );
  end;


  TCrSeCoPrRe = class(TInterFrame) //TCrBitSgui)
  private
  protected
  public
    TX_COMENTARIO            : TInterCampo;
    Seguimiento              : TCrSeguimi;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
  end;


implementation
{$R *.DFM}
const
   coMsgMod   = '¿Desea modificar datos de(l) (los) movimiento(s)?';

constructor TCrSeCoPrRe.Create( AOwner : TComponent );
begin
  Inherited;
  TX_COMENTARIO := CreaCampo( 'TX_COMENTARIO', ftString, tsNinguno, tsNinguno, False );
  TX_COMENTARIO.Caption := 'Comentario';
  {}
  Seguimiento := TCrSeguimi.Create(Self);
  Seguimiento.MasterSource:=Self;
  Seguimiento.FieldByName('CVE_SEGUIMIENTO').MasterField:='CVE_SEGUIMIENTO';
  {}
  StpName  := ' ';
  UseQuery := True;
end;

Destructor TCrSeCoPrRe.Destroy;
begin
   if Seguimiento <> nil then
      Seguimiento.Free;
   //end if
   inherited;
end;


function TCrSeCoPrRe.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrSeCoPrRe;
begin
   W:=TWCrSeCoPrRe.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


(***********************************************FORMA CrSeCoPr********************)
(*                                                                              *)
(*  FORMA DE CrSeCoPr                                                            *)
(*                                                                              *)
(***********************************************FORMA CrSeCoPr********************)
procedure TWCrSeCoPrRe.Inicializa;
begin
  vgBModifica  := False;
  vgMedPagoAll := False;
  vgTxComenAll := False;
end;

procedure TWCrSeCoPrRe.CreaObjeto( Aowner:TComponent; Apli: TInterApli);
begin
  Objeto := TCrSeCoPrRe.Create(Aowner);
  Objeto.Apli := Apli;
  Objeto.TX_COMENTARIO.Control := edCOMENTARIO;
  Objeto.Seguimiento.CVE_SEGUIMIENTO.Control  := edMODO_PAGO;
  Objeto.Seguimiento.DESC_SEGUIMIENTO.Control := edDESC_MODO_PAGO;
end;

procedure TWCrSeCoPrRe.LiberaObjeto;
begin

  if Assigned(Objeto) then
  begin
    {Objeto.Apli := nil;    Objeto.Free;    }
  end;
end;

procedure TWCrSeCoPrRe.BCambiarDatos;
begin
  vgBModifica := ( MessageDlg( coMsgMod, mtConfirmation, [mbYes, mbNo], 0 ) = mrYes );
end;


procedure TWCrSeCoPrRe.ObtenDatos(peFCobranza, peIdBitSegto: String; var psMedio, psTxComentario: String);
const coSQL = 'SELECT CVE_SEGUIMIENTO, ' + #13#10 +
              '       TX_DESC_INSTRUC  ' + #13#10 +
              'FROM   CR_BIT_SEGUIMIENTO ' + #13#10 +
              'WHERE  F_COBRANZA = %s ' + #13#10 +
              '  AND  ID_SEGUIMIENTO = %s';

var VLQuery  : TQuery;
    vlSqlQry : String;
begin
  psMedio  := '';             psTxComentario := '';
  vlSqlQry := Format( coSQL, [ SQLFecha( StrToDate( peFCobranza ) ), peIdBitSegto ] );
  vlQuery  := GetSQLQuery( vlSqlQry, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
  if assigned(vlQuery) then
  begin
    psMedio := vlQuery.FieldByName('CVE_SEGUIMIENTO').AsString;
    psTxComentario := vlQuery.FieldByName('TX_DESC_INSTRUC').AsString;
    vlQuery.Close;
    vlQuery.Free;
  end;
end;

procedure TWCrSeCoPrRe.HabilitaMedioPago( peBandera : Boolean );
begin
  edMODO_PAGO.Enabled := peBandera;
  btMODO_PAGO.Enabled := peBandera;
  edDESC_MODO_PAGO.Enabled := peBandera;
  cbMedioPago.Enabled := True;
end;

procedure TWCrSeCoPrRe.HabilitaComentario( peBandera : Boolean );
begin
  edCOMENTARIO.Enabled := peBandera;
  cbComentario.Enabled := True;
end;


procedure TWCrSeCoPrRe.ObtenDatosReactivacion( peFCobranza, peIdBitSegto{, peMedio,
                peTxComentario} : String; var psMedio, psTxComentario : String );
var vlBFindKey     : Boolean;
    vlMedio        : String;
    vlTxComentario : String;
begin
  vlBFindKey := False;
  if vgBModifica then
  begin
    ObtenDatos( peFCobranza, peIdBitSegto, vlMedio, vlTxComentario );
    //
    if vgMedPagoAll then
    begin
      HabilitaMedioPago( False );
      cbMedioPago.Checked := True;
      vlMedio := vgStrMedPago;
    end else
    begin
      HabilitaMedioPago( True );
      cbMedioPago.Checked := False;
    end;//ends_if
    //
    if vgTxComenAll then
    begin
      HabilitaComentario( False );
      cbComentario.Checked := True;
      vlTxComentario := vgStrTxComen;
    end else
    begin
      HabilitaComentario( True );
      cbComentario.Checked := False;
    end;//ends_if

    Objeto.Seguimiento.FindKey( [ vlMedio ] );
    Objeto.TX_COMENTARIO.AsString := vlTxComentario;
    Objeto.TX_COMENTARIO.DrawControl;
    if ( vgMedPagoAll = False ) or ( vgTxComenAll = False ) then
    begin
      ShowModal;
    end;
    psMedio := Objeto.Seguimiento.CVE_SEGUIMIENTO.AsString;
    psTxComentario := Objeto.TX_COMENTARIO.AsString;
  end else
  begin
    psMedio := '';      psTxComentario := '';
  end;
end;



procedure TWCrSeCoPrRe.FormShow(Sender: TObject);
begin
  InterForma1.MsgPanel := MsgPanel;
  if edMODO_PAGO.Enabled then
    edMODO_PAGO.SetFocus
  else
    edCOMENTARIO.SetFocus;
  //ends_if
end;

procedure TWCrSeCoPrRe.FormDestroy(Sender: TObject);
begin
  Objeto.TX_COMENTARIO.Control := nil;
  Objeto.Seguimiento.CVE_SEGUIMIENTO.Control  := nil;
  Objeto.Seguimiento.DESC_SEGUIMIENTO.Control := nil;
end;

procedure TWCrSeCoPrRe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TWCrSeCoPrRe.ilMODO_PAGOEjecuta(Sender: TObject);
begin
   if Objeto.Seguimiento.FindKey([ilMODO_PAGO.Buffer]) then
      InterForma1.NextTab(edMODO_PAGO);
   //end if
end;

procedure TWCrSeCoPrRe.btMODO_PAGOClick(Sender: TObject);
begin
   Objeto.Seguimiento.ShowAll := True;
   if Objeto.Seguimiento.Busca  then
      InterForma1.NextTab(edMODO_PAGO);
   //end if
end;

procedure TWCrSeCoPrRe.cbMedioPagoClick(Sender: TObject);
begin
 if ( not cbMedioPago.Checked ) and ( edMODO_PAGO.Enabled = False ) then
   HabilitaMedioPago( True );
end;

procedure TWCrSeCoPrRe.cbComentarioClick(Sender: TObject);
begin
 if ( not cbComentario.Checked ) and ( edCOMENTARIO.Enabled = False ) then
   HabilitaComentario( True );
end;

procedure TWCrSeCoPrRe.btAceptarClick(Sender: TObject);
begin
  vgMedPagoAll := cbMedioPago.Checked;
  vgTxComenAll := cbComentario.Checked;
  Objeto.TX_COMENTARIO.GetFromControl;
  if vgMedPagoAll then
    vgStrMedPago := edMODO_PAGO.Text;
  //ends_if
  if vgTxComenAll then
    vgStrTxComen := edCOMENTARIO.Text;
  //ends_if
  Close;
end;

end.
