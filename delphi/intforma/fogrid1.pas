//-------------------------------------------------------------
// Sistema         :   FoGrid1
// Date            :   Noviembre de 1997
// Fecha de Inicio :   Noviembre de 1997
// Función forma   :   Control de Clase
// Desarrollo por  :   Víctor Martínez Castro/ Leon Orózco
// Comentarios     :
// Modificacion    :
// Actualizado al  :   25 de Agosto
// ------------------------------------------------------------

unit Fogrid1;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Grids, DBGrids, DB, Buttons, ExtCtrls, Wwlocate,
  Wwintl, Wwdatsrc, Wwdbigrd, Wwdbgrid, DBCtrls, InterGri, Menus;

type
  TFormaGrid1 = class(TForm)
    wwLocateDialog1: TwwLocateDialog;
    wwTraduce: TwwIntl;
    SrcLookup: TwwDataSource;
    MainMenu1: TMainMenu;
    Opciones1: TMenuItem;
    Alta1: TMenuItem;
    Modoficacin1: TMenuItem;
    Borrar1: TMenuItem;
    Detalle1: TMenuItem;
    Buscar1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Ayuda1: TMenuItem;
    pBotones: TPanel;
    sbAlta: TSpeedButton;
    sbModifica: TSpeedButton;
    sbBorrar: TSpeedButton;
    sbDetalle: TSpeedButton;
    sbBuscar: TSpeedButton;
    pSalir: TPanel;
    sbAyuda: TSpeedButton;
    sbSalir: TSpeedButton;
    paGrig: TPanel;
    GrdLookup: TDBGrid;
    Panel1: TPanel;
    dbNavegador: TDBNavigator;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure EdtSearchKeyPress(Sender: TObject; var Key: Char);
    procedure btBuscaClick(Sender: TObject);
    procedure btDetalleClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GrdLookupDblClick(Sender: TObject);
    procedure Alta1Click(Sender: TObject);
    procedure sbAltaClick(Sender: TObject);
    procedure Modoficacin1Click(Sender: TObject);
    procedure Borrar1Click(Sender: TObject);
    procedure Detalle1Click(Sender: TObject);
    procedure Buscar1Click(Sender: TObject);
    procedure sbAyudaClick(Sender: TObject);
    procedure sbSalirClick(Sender: TObject);
    procedure sbModificaClick(Sender: TObject);
    procedure sbBorrarClick(Sender: TObject);
    procedure sbDetalleClick(Sender: TObject);
    procedure sbBuscarClick(Sender: TObject);
  private
  public
    Padre:TInterGrid;
    SearchField : string;
    NumbersOnly : Boolean;
  end;

var
  FormaGrid1: TFormaGrid1;

implementation



{$R *.DFM}

uses
  DBTables, UnSubGen;


{==========================}
{== TRzFrmLookup Methods ==}
{==========================}

procedure TFormaGrid1.FormShow(Sender: TObject);
begin
{  EdtSearch.SetFocus;}                  { Reset the focus if dialog redisplayed }
  if SrcLookup.Dataset.Active Then
     SrcLookup.Dataset.First else Begin  { Move cursor to first record in grid }
     MessageDlg('La tabla no esta abierta',mtError,[mbOk],0);
     postMessage(handle,wm_close,0,0);
  End;
end;

procedure TFormaGrid1.FormResize(Sender: TObject);
begin
 {EdtSearch.Width := GrdLookup.Width;}                 { Resize the edit field }
end;

procedure TFormaGrid1.EdtSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if NumbersOnly and
     ( Key in [ #32..#255 ] ) and
     not ( Key in [ '-', '+', '0'..'9' ] ) then
  begin
    MessageBeep( 0 );
    Key := #0;
  end;
end;

procedure TFormaGrid1.btBuscaClick(Sender: TObject);
begin
   Padre.Buscar;
end;

procedure TFormaGrid1.btDetalleClick(Sender: TObject);
begin
   Padre.Detalle;
end;

procedure TFormaGrid1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;


procedure TFormaGrid1.FormCreate(Sender: TObject);
begin
   cargaImg(sbAlta,tsbAlta);
   cargaImg(sbModifica,tsbModifica);
   cargaImg(sbBorrar,tsbBorra);
   cargaImg(sbBuscar,tsbBuscaExacto);
   cargaImg(sbDetalle,tsbConsulta);
   cargaImg(sbAyuda,tsbAyuda);
end;

procedure TFormaGrid1.GrdLookupDblClick(Sender: TObject);
begin
   Padre.Detalle;
end;

procedure TFormaGrid1.Alta1Click(Sender: TObject);
begin
   sbAlta.click;
end;

procedure TFormaGrid1.sbAltaClick(Sender: TObject);
begin
   Padre.Alta;
end;

procedure TFormaGrid1.Modoficacin1Click(Sender: TObject);
begin
   sbModifica.click;
end;

procedure TFormaGrid1.Borrar1Click(Sender: TObject);
begin
   sbBorrar.Click;
end;

procedure TFormaGrid1.Detalle1Click(Sender: TObject);
begin
   sbDetalle.Click;
end;

procedure TFormaGrid1.Buscar1Click(Sender: TObject);
begin
   sbBuscar.Click;
end;

procedure TFormaGrid1.sbAyudaClick(Sender: TObject);
begin
   Padre.Ayuda;
end;

procedure TFormaGrid1.sbSalirClick(Sender: TObject);
begin
   modalresult := mrOk;
end;

procedure TFormaGrid1.sbModificaClick(Sender: TObject);
begin
   Padre.Modifica;
end;

procedure TFormaGrid1.sbBorrarClick(Sender: TObject);
begin
   Padre.Borrar;
end;

procedure TFormaGrid1.sbDetalleClick(Sender: TObject);
begin
   Padre.Detalle;
end;

procedure TFormaGrid1.sbBuscarClick(Sender: TObject);
begin
   Padre.Buscar;
end;

end.
