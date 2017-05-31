// Sistema         : Clase de DV_IB_CTRLPROC
// Fecha de Inicio : 09/02/2012
// Función forma   : Clase de DV_IB_CTRLPROC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : CARLOS PINACHO M.
// Comentarios     :
Unit IntDvIbCtrlP;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, ToolEdit, CurrEdit, Wwquery,
  Wwdatsrc;

//const
//  cSQLTipoCambio =
//  'SELECT TIPO_CAMBIO AS TC FROM  TIPO_CAMBIO_MON '+
//  '       WHERE F_LIQUIDACION = TO_DATE(''%s'',''DD/MM/YYYY'') '+
//  '        AND CVE_MONEDA_BASE = 484 AND CVE_MONEDA_REFER = 840 '+
//	'				AND CVE_MEDIO = ''MK'' ';

Type
 TDvIbCtrlP= class; 

  TWDvIbCtrlP=Class(TForm)
    InterForma1             : TInterForma; 
    lbFOL_PROCESO : TLabel; 
    edFOL_PROCESO : TEdit;
    lbFH_HISTORICA : TLabel; 
    dtpFH_HISTORICA : TInterDateTimePicker; 
    edFH_HISTORICA : TEdit;
    lbFH_PROYECTADA : TLabel; 
    dtpFH_PROYECTADA : TInterDateTimePicker; 
    edFH_PROYECTADA : TEdit;
    qryConsulta: TwwQuery;
    dsConsulta: TwwDataSource;
    gbxFechas: TGroupBox;
    lbCVE_USU_ALTA: TLabel;
    Label1: TLabel;
    Bevel2: TBevel;
    edCVE_USUARIO: TEdit;
    edFH_REGISTRO: TEdit;
    qryConsultaFOL_PROCESO: TFloatField;
    qryConsultaFH_HISTORICA: TDateTimeField;
    qryConsultaFH_PROYECTADA: TDateTimeField;
    qryConsultaCVE_USUARIO: TStringField;
    qryConsultaFH_REGISTRO: TDateTimeField;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure dsConsultaDataChange(Sender: TObject; Field: TField);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure edTC_HISTORICOKeyPress(Sender: TObject; var Key: Char);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edFH_HISTORICAKeyPress(Sender: TObject; var Key: Char);
    procedure InterForma1BtnEliminar(Sender: TObject);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);
    private
    { Private declarations }
      vgNewData : Boolean;
      vgFechaHist,
      vgFechaProy : TDateTime;
      procedure pObtenTipoCambio(Sender : TObject);
      procedure pReiniciaProceso( aProcSecuancia : Integer);
    public 
    { Public declarations }
    Objeto : TDvIbCtrlP;
end;                             
 TDvIbCtrlP= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        W : TWDvIbCtrlP;
        FOL_PROCESO              : TInterCampo;
        FH_HISTORICA             : TInterCampo;
        FH_PROYECTADA            : TInterCampo;
        CVE_USUARIO              : TInterCampo;
        FH_REGISTRO              : TInterCampo;
        vgFOL_PROCESO            : Integer;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override;
        procedure   RefrescaQuery;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TDvIbCtrlP.Create( AOwner : TComponent );
begin Inherited; 
      FOL_PROCESO :=CreaCampo('FOL_PROCESO',ftInteger,tsNinguno,tsNinguno,True);
                FOL_PROCESO.Caption:='Número de Proceso';
      FH_HISTORICA :=CreaCampo('FH_HISTORICA',ftDate,tsNinguno,tsNinguno,True);
                FH_HISTORICA.Caption:='Historica';
      FH_PROYECTADA :=CreaCampo('FH_PROYECTADA',ftDate,tsNinguno,tsNinguno,True);
                FH_PROYECTADA.Caption:='Proyectada';
      CVE_USUARIO :=CreaCampo('CVE_USUARIO',ftString,tsNinguno,tsNinguno,True);
                CVE_USUARIO.Caption:='Clave de Usuario';
      FH_REGISTRO :=CreaCampo('FH_REGISTRO',ftDate,tsNinguno,tsNinguno,True);
                FH_REGISTRO.Caption:='Fecha y Hora Registro';
      FKeyFields.Add('FOL_PROCESO');
                                         


      TableName := 'DV_IB_CTRLPROC'; 
      UseQuery := True;
      HelpFile := 'IntDvIbCtrlP.Hlp';
      ShowMenuReporte:=True;
end;
{******************************************************************************************************
*******************************************************************************************************}
Destructor TDvIbCtrlP.Destroy;
begin inherited;
end;
{******************************************************************************************************
*******************************************************************************************************}
function TDvIbCtrlP.ShowWindow(FormaTipo:TFormaTipo):Integer;
begin
   W:=TWDvIbCtrlP.Create(Self);
   try
      W.qryConsulta.DatabaseName := DataBaseName;
      W.qryConsulta.SessionName  :=  SessionName;
      W.InterForma1.GridDataSet  := W.dsConsulta;
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := True;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;
{******************************************************************************************************
*******************************************************************************************************}
Function TDvIbCtrlP.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IDvIbCtr.it','I');
      Try if Active then T.Param(0,FOL_PROCESO.AsString);
          if T.Execute then
          begin
            InternalBusca := FindKey([T.DameCampo(0)]);
            if W.qryConsulta.Active then
                  W.qryConsulta.Locate('FOL_PROCESO', T.DameCampo(0), []);
          end;
      finally  T.Free;
      end; 
end;

function TDvIbCtrlP.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA DV_IB_CTRLPROC********************)
(*                                                                              *)
(*  FORMA DE DV_IB_CTRLPROC                                                            *)
(*                                                                              *)
(***********************************************FORMA DV_IB_CTRLPROC********************)

procedure TWDvIbCtrlP.FormShow(Sender: TObject);
begin
      Objeto.FOL_PROCESO.Control:=edFOL_PROCESO;
      Objeto.FH_HISTORICA.Control:=edFH_HISTORICA;
      Objeto.FH_PROYECTADA.Control:=edFH_PROYECTADA;
      Objeto.CVE_USUARIO.Control:=edCVE_USUARIO;
      Objeto.FH_REGISTRO.Control:=edFH_REGISTRO;

      Objeto.RefrescaQuery;
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TWDvIbCtrlP.FormDestroy(Sender: TObject);
begin
      Objeto.FOL_PROCESO.Control:=nil;
      Objeto.FH_HISTORICA.Control:=nil;
      Objeto.FH_PROYECTADA.Control:=nil;
      Objeto.CVE_USUARIO.Control:=nil;
      Objeto.FH_REGISTRO.Control:=nil;
   //Objeto
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TWDvIbCtrlP.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TWDvIbCtrlP.InterForma1DespuesNuevo(Sender: TObject);
var
  vFolProceso : Integer;
begin //<<Control>>.SetFocus;

  try
     GetSQLInt('SELECT NVL(MAX(FOL_PROCESO) + 1, 1) AS FOLIO FROM DV_IB_CTRLPROC',
                Objeto.DatabaseName, Objeto.SessionName,
                'FOLIO', vFolProceso, False);

     Objeto.FOL_PROCESO.AsInteger := vFolProceso;
     Objeto.CVE_USUARIO.AsString := Objeto.DameUsuario;
     edFOL_PROCESO.ReadOnly := True;
     edFOL_PROCESO.Color := clBtnFace;

  except
    on E: Exception do
      MessageDlg(E.Message, mtWarning, [mbOK], 0);
  end;
  //Objeto.RefrescaQuery;
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TWDvIbCtrlP.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TDvIbCtrlP.RefrescaQuery;
var
  vBookMark : TBookmarkStr;
begin
  vBookMark := W.qryConsulta.Bookmark;
  W.qryConsulta.DisableControls;
  W.qryConsulta.Close;
  W.qryConsulta.Open;
  W.qryConsulta.EnableControls;
  try
    if W.vgNewData = True then
      W.qryConsulta.Locate('FOL_PROCESO',vgFOL_PROCESO,[])
    else
    W.qryConsulta.Bookmark := vBookMark;
  except
  end;

end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TWDvIbCtrlP.dsConsultaDataChange(Sender: TObject; Field: TField);
begin
  if Objeto.State = 0 then
  if Field = nil then
  begin
      Objeto.FindKey([qryConsulta.FieldByName('FOL_PROCESO').AsInteger]);
  end;
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TWDvIbCtrlP.InterForma1DespuesAceptar(Sender: TObject);
begin
  if not vgNewData then
  begin
    if vgFechaHist <> Objeto.FH_HISTORICA.AsDateTime then
      pReiniciaProceso(1);

    if vgFechaProy <> Objeto.FH_PROYECTADA.AsDateTime then
       pReiniciaProceso(5);
  end;
  Objeto.vgFOL_PROCESO := Objeto.FOL_PROCESO.AsInteger;
  Objeto.RefrescaQuery;
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TWDvIbCtrlP.InterForma1DespuesEliminar(Sender: TObject);
begin
  Objeto.RefrescaQuery;
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TWDvIbCtrlP.edTC_HISTORICOKeyPress(Sender: TObject;
  var Key: Char);
begin
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TWDvIbCtrlP.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  vgNewData := IsNewData;
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TWDvIbCtrlP.edFH_HISTORICAKeyPress(Sender: TObject;
  var Key: Char);
begin
//  if ((not ( StrScan('0123456789/',Key) <> nil )) and (Key <> #8 )) then
//    Abort;
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TWDvIbCtrlP.pObtenTipoCambio(Sender: TObject);
begin

     
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TWDvIbCtrlP.InterForma1BtnEliminar(Sender: TObject);
begin
  MessageDlg('Al borrar el registro actual se borrará la información relacionada al folio seleccionado.', mtWarning, [mbOK], 0);
  InterForma1.Eliminar;

end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TWDvIbCtrlP.InterForma1AntesModificar(Sender: TObject;
  var Realizado: Boolean);
begin
  vgFechaHist := Objeto.FH_HISTORICA.AsDateTime;
  vgFechaProy := Objeto.FH_PROYECTADA.AsDateTime;
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TWDvIbCtrlP.pReiniciaProceso( aProcSecuancia : Integer);
var
  qrySetBProc : TQuery;
  vBCommit : Boolean;
begin
    qrySetBProc := TQuery.Create(nil);
    qrySetBProc.DatabaseName := Objeto.DataBaseName;
    qrySetBProc.SessionName  := Objeto.SessionName;
    qrySetBProc.SQL.Text     := Format('UPDATE DV_IB_PROCSEC SET B_PROC = ''F''' +
                                       'WHERE FOL_PROCESO = %d '+
                                       '  AND SECUENCIA >= %d ',[Objeto.FOL_PROCESO.AsInteger, aProcSecuancia]);
    try
      try
        vBCommit := False;
        Objeto.Apli.DataBase.StartTransaction;
        qrySetBProc.ExecSQL;
        vBCommit := True;
      except
        on E: Exception do
          MessageDlg(E.Message, mtWarning, [mbOK], 0);
      end;
    finally
      if vBCommit then
        Objeto.Apli.DataBase.Commit
      else
        Objeto.Apli.DataBase.Rollback;
      qrySetBProc.Free;
    end;
end;
{******************************************************************************************************
*******************************************************************************************************}
end.
