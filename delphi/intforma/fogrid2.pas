//-------------------------------------------------------------
// Sistema         :   FoGrid2
// Date            :   Noviembre de 1997
// Fecha de Inicio :   Noviembre de 1997
// Función forma   :   Control de Clase
// Desarrollo por  :   Víctor Martínez Castro/ Leon Orózco
// Comentarios     :
// Modificacion    :
// Actualizado al  :   25 de Agosto
// ------------------------------------------------------------

unit Fogrid2;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Grids, DBGrids, DB, Buttons, ExtCtrls, Wwlocate,
  Wwintl, Wwdatsrc, Wwdbigrd, Wwdbgrid, DBCtrls, InterGri, Menus;

type
  TformaGrid2 = class(TForm)
    wwLocateDialog1: TwwLocateDialog;
    wwTraduce: TwwIntl;
    SrcLookup: TwwDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    btAyuda: TBitBtn;
    BtCerrar: TBitBtn;
    paGroup: TPanel;
    GroupBox1: TGroupBox;
    paBotones: TPanel;
    btNuevo: TBitBtn;
    btModifica: TBitBtn;
    btElimina: TBitBtn;
    btBusca: TBitBtn;
    btDetalle: TBitBtn;
    paGrig: TPanel;
    GrdLookup: TDBGrid;
    paNavegador: TPanel;
    DBNavigator: TDBNavigator;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure EdtSearchKeyPress(Sender: TObject; var Key: Char);
    procedure btBuscaClick(Sender: TObject);
    procedure btNuevoClick(Sender: TObject);
    procedure btModificaClick(Sender: TObject);
    procedure btEliminaClick(Sender: TObject);
    procedure btDetalleClick(Sender: TObject);
    procedure btAyudaClick(Sender: TObject);
    procedure BtCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GrdLookupDblClick(Sender: TObject);
  private
  public
    Padre:TInterGrid;
    SearchField : string;
    NumbersOnly : Boolean;
  end;

var
  formaGrid2: TformaGrid2;

implementation

{$R *.DFM}

uses
  DBTables, UnSubGen;


{==========================}
{== TRzFrmLookup Methods ==}
{==========================}

procedure TformaGrid2.FormShow(Sender: TObject);
begin
{  EdtSearch.SetFocus;}                  { Reset the focus if dialog redisplayed }
  if SrcLookup.Dataset.Active Then
     SrcLookup.Dataset.First else Begin  { Move cursor to first record in grid }
     MessageDlg('La tabla no esta abierta',mtError,[mbOk],0);
     postMessage(handle,wm_close,0,0);
  End;
end;

procedure TformaGrid2.FormResize(Sender: TObject);
begin
 {EdtSearch.Width := GrdLookup.Width;}                 { Resize the edit field }
end;

procedure TformaGrid2.EdtSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if NumbersOnly and
     ( Key in [ #32..#255 ] ) and
     not ( Key in [ '-', '+', '0'..'9' ] ) then
  begin
    MessageBeep( 0 );
    Key := #0;
  end;
end;

procedure TformaGrid2.btBuscaClick(Sender: TObject);
begin
   Padre.Buscar;
end;

procedure TformaGrid2.btNuevoClick(Sender: TObject);
begin
   Padre.Alta;
end;

procedure TformaGrid2.btModificaClick(Sender: TObject);
begin
   Padre.Modifica;
end;

procedure TformaGrid2.btEliminaClick(Sender: TObject);
begin
   Padre.Borrar;
end;

procedure TformaGrid2.btDetalleClick(Sender: TObject);
begin
   Padre.Detalle;
end;

procedure TformaGrid2.btAyudaClick(Sender: TObject);
begin
   Padre.Ayuda;
end;

procedure TformaGrid2.BtCerrarClick(Sender: TObject);
begin
   modalresult := mrOk;
end;

procedure TformaGrid2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;


procedure TformaGrid2.FormCreate(Sender: TObject);
begin
   cargaImg(btNuevo,tsbAlta);
   cargaImg(btModifica,tsbModifica);
   cargaImg(btElimina,tsbBorra);
   cargaImg(btBusca,tsbBuscaExacto);
   cargaImg(btDetalle,tsbConsulta);
   cargaImg(btAyuda,tsbAyuda);
end;

procedure TformaGrid2.GrdLookupDblClick(Sender: TObject);
begin
   Padre.Detalle;
end;

end.
