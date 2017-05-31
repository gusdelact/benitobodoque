// Sistema         : Clase de SlPrIPAB
// Fecha de Inicio : 22/02/2012
// Función forma   : Seleccionar el Folio del Proceso IPAB
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Carlos Pinacho
// Comentarios     :
Unit IntSlPrIPAB;

interface   

uses   
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, ADODB, RxLookup, Grids,
  DBGrids
  ,IntDvIbCtrlP
  ;

Type
 TSlPrIPAB= class;

  TWSlPrIPAB=Class(TForm)
    InterForma1             : TInterForma;
    dsSelProcIPB: TDataSource;
    qrySelProcIPB: TQuery;
    dbgSelProcIPB: TDBGrid;
    qrySelProcIPBFOL_PROCESO: TFloatField;
    qrySelProcIPBFH_HISTORICA: TDateTimeField;
    qrySelProcIPBFH_PROYECTADA: TDateTimeField;
    qrySelProcIPBANO_MES: TFloatField;
    qrySelProcIPBCVE_USUARIO: TStringField;
    qrySelProcIPBFH_REGISTRO: TDateTimeField;
    qrySelProcIPBINF_VALIDADA: TStringField;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure CapturaRueda(var Message: TMessage);
    procedure FormCreate(Sender: TObject);
    procedure btnSeleccionarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qrySelProcIPBAfterOpen(DataSet: TDataSet);
    procedure dsSelProcIPBDataChange(Sender: TObject; Field: TField);
    procedure InterForma1BtnSalirClick(Sender: TObject);
    procedure InterForma1BtnAyudaClick(Sender: TObject);
    procedure InterForma1BtnAceptar(Sender: TObject);
    procedure dbgSelProcIPBDblClick(Sender: TObject);
    private
    { Private declarations }
      procedure pSelecciona;
      procedure pCancelar;
    public 
    { Public declarations } 
    Objeto : TSlPrIPAB;
end; 
 TSlPrIPAB= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        vSelFolProceso : Integer;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;


type
  CapturaRuedaControl = class(TControl);

implementation
//Uses RepMon;

{$R *.DFM}
constructor TSlPrIPAB.Create( AOwner : TComponent);
begin
  Inherited;
  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'IntSlPrIPAB.Hlp';
  ShowMenuReporte:=True;
end;
{******************************************************************************************************
*******************************************************************************************************}
Destructor TSlPrIPAB.Destroy;
begin inherited;
end;
{******************************************************************************************************
*******************************************************************************************************}
function TSlPrIPAB.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWSlPrIPAB;
begin
   W:=TWSlPrIPAB.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
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
Function TSlPrIPAB.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ISlpripa.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;
(***********************************************FORMA SlPrIPAB********************)
(*                                                                              *)
(*  FORMA DE SlPrIPAB                                                            *)
(*                                                                              *)
(***********************************************FORMA SlPrIPAB********************)
procedure TWSlPrIPAB.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TWSlPrIPAB.CapturaRueda(var Message: TMessage);
var
   Cuanto : short;
begin
   //Para -> WheelMous
   if (Message.Msg = WM_MOUSEWHEEL) then
   begin
     Cuanto:=HIWORD(Message.WParam);
     Cuanto:=Cuanto div 120;
     dbgSelProcIPB.DataSource.DataSet.MoveBy(-Cuanto);

   end
   else
   CapturaRuedaControl(dbgSelProcIPB).WndProc(Message);
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TWSlPrIPAB.FormCreate(Sender: TObject);
begin
  dbgSelProcIPB.WindowProc := CapturaRueda;
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TWSlPrIPAB.btnSeleccionarClick(Sender: TObject);
begin

end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TWSlPrIPAB.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    InterForma1.BtnAceptarClick(Sender);
end;

procedure TWSlPrIPAB.FormShow(Sender: TObject);
begin
  InterForma1.BtnSalir.Caption := 'Cancelar';
  InterForma1.BtnAceptar.Visible := True;
  InterForma1.BtnAceptar.Caption := 'Seleccionar';
  InterForma1.BtnAceptar.Left := InterForma1.BtnAyuda.Left - 90;
  InterForma1.BtnAyuda.Caption := 'Nuevo';

  qrySelProcIPB.DatabaseName := Objeto.Apli.DataBaseName;
  qrySelProcIPB.SessionName  := Objeto.Apli.SessionName;
  qrySelProcIPB.Open;

end;

procedure TWSlPrIPAB.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_CANCEL)then
    pCancelar;
end;

procedure TWSlPrIPAB.qrySelProcIPBAfterOpen(DataSet: TDataSet);
begin
  InterForma1.BtnAceptar.Enabled := (not qrySelProcIPB.IsEmpty);
end;                                                          

procedure TWSlPrIPAB.dsSelProcIPBDataChange(Sender: TObject;
  Field: TField);
begin
  Objeto.vSelFolProceso := qrySelProcIPBFOL_PROCESO.AsInteger;
end;

procedure TWSlPrIPAB.InterForma1BtnSalirClick(Sender: TObject);
begin
  pCancelar;
end;

procedure TWSlPrIPAB.InterForma1BtnAyudaClick(Sender: TObject);
begin
  ShowCat(TDvIbCtrlP.Create(Self),Objeto.Apli);
  qrySelProcIPB.Close;
  qrySelProcIPB.Open;
end;

procedure TWSlPrIPAB.InterForma1BtnAceptar(Sender: TObject);
begin
  pSelecciona;
end;

procedure TWSlPrIPAB.dbgSelProcIPBDblClick(Sender: TObject);
begin
  if not qrySelProcIPB.IsEmpty then
    pSelecciona;
end;

procedure TWSlPrIPAB.pSelecciona;
begin
  Objeto.vSelFolProceso :=  qrySelProcIPBFOL_PROCESO.AsInteger;
  if qrySelProcIPB.IsEmpty then
    Objeto.vSelFolProceso := -1;
  InterForma1.Cierra;
end;

procedure TWSlPrIPAB.pCancelar;
begin
   Objeto.vSelFolProceso := -1;
   InterForma1.Cierra;
end;

end.
