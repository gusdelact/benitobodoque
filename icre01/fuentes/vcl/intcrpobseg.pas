 // Sistema         : CrPobSeg
 // Fecha de Inicio : 09/11/2009
 // Función forma   : CrPobSeg
 // Desarrollo por  : Copy and Paste.
 // Diseñado por    :
 // Comentarios     : Módulo que importa un archivo excel y con la información
 //                   de este actualiza la tabla de disposición CR_AM_DISPF
unit IntCrPobSeg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DBTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, Grids, Aligrid,
  Menus, Excel97, OleServer, IntCrActPa, Gauges, IntSGCtrl;


type
  TCrPobSeg = class;

  TWCrPobSeg = class(TForm)
    InterForma1:      TInterForma;
    ExcelWorkbookI:   TExcelWorkbook;
    ExcelWorksheetI:  TExcelWorksheet;
    ExcelApplicationI: TExcelApplication;
    Panel1:           TPanel;
    lbArchivoEntrada: TLabel;
    edArchivoEntrada: TEdit;
    sbArchivoEntrada: TSpeedButton;
    bbImportar:       TBitBtn;
    pAniBar:          TPanel;
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
    Label5: TLabel;
    odArchivoEntrada: TOpenDialog;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbArchivoEntradaClick(Sender: TObject);
    procedure bbImportarClick(Sender: TObject);
    procedure edArchivoEntradaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    package:  string; //Para fechas valor
    Objeto:   TCrPobSeg;
    idSesion: string;

  end;

  TCrPobSeg = class(TInterFrame)
  private
  protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
    { Public declarations }

    ParamCre: TParamCre;
    function InternalBusca: boolean; override;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ShowWindow(FormaTipo: TFormaTipo): integer; override;
  published
  end;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrPobSeg.Create(AOwner: TComponent);
begin
  inherited;
  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'IntCrPobSeg.Hlp';
  ShowMenuReporte := True;
end;

destructor TCrPobSeg.Destroy;
begin
  inherited;
end;


function TCrPobSeg.ShowWindow(FormaTipo: TFormaTipo): integer;
var
  W: TWCrPobSeg;
begin
  W := TWCrPobSeg.Create(Self);
  try
    W.Objeto := Self;
    W.InterForma1.InterFrame := Self;
    W.InterForma1.FormaTipo := ftConsulta;
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;


function TCrPobSeg.InternalBusca: boolean;
begin
  InternalBusca := False;
end;

 (***********************************************FORMA CR_CONC********************)
 (*                                                                              *)
 (*  FORMA DE CR_CONC                                                            *)
 (*                                                                              *)
 (***********************************************FORMA CR_CONC********************)

procedure TWCrPobSeg.FormShow(Sender: TObject);
begin
  with Objeto do
  begin
    //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption  := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption := ParamCre.PERFIL.AsString;
  end;
  Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrPobSeg.FormDestroy(Sender: TObject);
begin
  //Borra la información de la tabla temporal si se generó una
end;

procedure TWCrPobSeg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrPobSeg.InterForma1DespuesNuevo(Sender: TObject);
begin
  edArchivoEntrada.SetFocus;
end;

procedure TWCrPobSeg.InterForma1DespuesModificar(Sender: TObject);
begin
  edArchivoEntrada.SetFocus;
end;

procedure TWCrPobSeg.sbArchivoEntradaClick(Sender: TObject);
var
  correcto: boolean;
begin
  correcto := False;
  while not correcto and odArchivoEntrada.Execute do
  begin
    edArchivoEntrada.Text := odArchivoEntrada.FileName;
    if FileExists(odArchivoEntrada.FileName) then
      correcto := True
    else
    begin
      edArchivoEntrada.Text := '';
      ShowMessage('Reporte inexistente. Por favor seleccione un reporte existente');
    end;
  end;
end;


procedure TWCrPobSeg.bbImportarClick(Sender: TObject);
var
  LCID: integer;
  fila: integer;
  filasg: integer;
  //Variables del reporte
  prima : String;
  credito  : String;

  f_ini_vig : String;
  f_fin_vig : String;

  valida: String;
  secuencia : String;

  //Para la inserción a la base de datos
  vlSQL: string;
  vlQry : TQuery;
  vgQry : TQuery;

  //Para la barra de progreso
  ani: TAniBarThread;
  r: TRect;
begin
  if edArchivoEntrada.Text = '' then
    Exit;

  {* Inicia las variables para actualizar el medidor
   *}
  r := pAniBar.ClientRect;
  InflateRect(r, -pAniBar.BevelWidth, -pAniBar.BevelWidth);
  ani := TAniBarThread.Create(pAniBar, r, pAniBar.color, clBlue, 100);
  bbImportar.Enabled := False;
  Application.ProcessMessages;


  LCID := GetUserDefaultLCID;
  //Si el campo con el nombre del reporte está vacio lee la información de
  //de la base de datos y utiliza el reporte
  if edArchivoEntrada.Text <> '' then
  begin
    {* Instrucciones para el archivo excel de entrada
     *}
    ExcelApplicationI.Connect;
    // Hace a Excel invisible
    ExcelApplicationI.Visible[LCID] := False;
    ExcelApplicationI.DisplayAlerts[LCID] := False;

    // Abre el archivo
    ExcelApplicationI.Workbooks.Open(edArchivoEntrada.Text,
      EmptyParam, //UpdateLinks: OleVariant
      EmptyParam, //ReadOnly: OleVariant
      EmptyParam, //Format: OleVariant
      EmptyParam, //Password: OleVariant
      EmptyParam, //WriteResPassword: OleVariant
      EmptyParam, //IgnoreReadOnlyRecommended: OleVariant
      EmptyParam, //Orign: OleVariant
      EmptyParam, //Delimiter: OleVariant
      EmptyParam, //Editable: OleVariant
      EmptyParam, //Notify: OleVariant
      EmptyParam, //Converter: OleVariant
      EmptyParam, //AddToMru: OleVariant
      LCID
      );
    ExcelWorkbookI.ConnectTo(ExcelApplicationI.ActiveWorkbook);
    ExcelWorksheetI.ConnectTo(ExcelApplicationI.ActiveSheet as _Worksheet);
  end;

  {* Extrae la información del archivo Excel
   *}
  fila := 2;
  filasg := 1;
  try
    try
      //Para cada renglón con información
      valida := ExcelWorksheetI.Cells.Item[fila, 'A']; //Crédito
      while (valida <> '') do
      begin
        vlSQL := ' select max(pol.secuencia)+1 as MAXSEC from cr_am_segupol pol';
        GetSQLStr(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, 'MAXSEC', secuencia, False);
        
        // Extrae la información del reporte de seguros
        prima := ExcelWorksheetI.Cells.Item[fila, 'C'];
        f_ini_vig := ExcelWorksheetI.Cells.Item[fila, 'F'];
        f_fin_vig := ExcelWorksheetI.Cells.Item[fila, 'G'];

        credito  := ExcelWorksheetI.Cells.Item[fila, 'A'];

        //Actualiza garantías activas
        vlSQL :=
          ' insert into CR_AM_SEGUPOL (id_credito, secuencia, prima, f_ini_vig, f_fin_vig) values ( ' +
          credito + ', ' +
          secuencia + ', ' +
          prima + ', ' +
          ' to_date('''+f_ini_vig+''',''dd/mm/yyyy''), ' +
          ' to_date('''+f_fin_vig+''',''dd/mm/yyyy'')) ';

        RunSQL(vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
        inc(fila);
        valida := ExcelWorksheetI.Cells.Item[fila, 'A']; //Crédito
      end;


    finally
      //detiene la barra de progreso
      bbImportar.Enabled := True;
      ani.Terminate;

      ExcelApplicationI.Visible[LCID] := True;
      ExcelWorksheetI.Disconnect;
      ExcelWorkbookI.Disconnect;
      ExcelApplicationI.Disconnect;

      {
      ExcelApplicationI.Quit;
      ExcelWorksheetI.Destroy;
      ExcelWorkbookI.Destroy;

      ExcelApplicationI := nil;
      ExcelWorksheetI := nil;
      ExcelWorkbookI := nil;
      }

    end;

    //Si no existe error notifica al usuario que se generó el reporte
    //MessageDlg('Reporte generado correctamente', mtInformation, [mbOk], 0 );

  except
    on e: Exception do
    begin
      MessageDlg('No se generó el reporte debido a un error.' +
        IntToStr(Fila) + ' ' + credito + '. ' + e.Message, mtError, [mbOK], 0);
    end;
  end;

end;


procedure TWCrPobSeg.edArchivoEntradaExit(Sender: TObject);
var
  vlMesg: string;
  vlSalida: boolean;
begin
  vlMesg := 'Debe definir el nombre del archivo';
  if (edArchivoEntrada.Text = '') then
    vlSalida := False;
  InterForma1.ValidaExit(edArchivoEntrada, vlSalida, vlMesg, True);

end;


end.
