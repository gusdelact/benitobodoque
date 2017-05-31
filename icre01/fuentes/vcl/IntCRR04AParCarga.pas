unit IntCRR04AParCarga;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntCtoPanel,
    IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Menus, InterEdit, IntLinkit,ToolWin,
    IntParamCre, DBClient, DBCtrls, Grids, DBGrids;

type
  TCRR4PARCG = class;

  TwR4AParCga = class(TForm)
    pnlEjecutaCarga: TPanel;
    GroupBox1: TGroupBox;
    dsTipoReporte: TDataSource;
    cdsTipoReporte: TClientDataSet;
    cdsTipoReporteTIPO_REPORTE: TIntegerField;
    cdsTipoReporteDESCRIPCION_REPORTE: TStringField;
    Label2: TLabel;
    Label3: TLabel;
    edtAnio: TEdit;
    dbCboMes: TDBLookupComboBox;
    cdsMes: TClientDataSet;
    cdsMesMES: TStringField;
    cdsMesDESCRIPCION_MES: TStringField;
    dsMes: TDataSource;
    btnCrear: TSpeedButton;
    InterForma1: TInterForma;
    spCarga: TStoredProc;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtAnioKeyPress(Sender: TObject; var Key: Char);
    procedure btnCrearClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
     function ValidaParametros: Boolean;
     function CreaQuery: TQuery;
     function ValidaPeriodo: Boolean;
  public
    { Public declarations }
     Objeto : TCRR4PARCG;
     //vlDatabaseName: String;
     //vlSessionName : String;
  end;

  TCRR4PARCG= class(TInterFrame)
  private
  protected
  public
  { Public declarations }
        ParamCre   :TParamCre;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
   published
   end;

var
  wR4AParCga: TwR4AParCga;

implementation

{$R *.DFM}

constructor TCRR4PARCG.Create( AOwner : TComponent );
begin
   inherited;
end;

destructor TCRR4PARCG.Destroy;
begin
   inherited;
end;

function TCRR4PARCG.ShowWindow(FormaTipo : TFormaTipo) : Integer;
var W : TwR4AParCga;
begin
   W:=TwR4AParCga.Create(Self);
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

procedure TwR4AParCga.FormCreate(Sender: TObject);
begin
   with cdsTipoReporte do
   begin
      Close;
      CreateDataSet;
      Append;
      FieldByName('TIPO_REPORTE').AsInteger := 419;
      FieldByName('DESCRIPCION_REPORTE').AsString  := '419 - Estimación Preventiva para Riesgos Crediticios';
      Append;
      FieldByName('TIPO_REPORTE').AsInteger := 420;
      FieldByName('DESCRIPCION_REPORTE').AsString  := '420 - Movimiento en la Cartera Vencida';
      Append;
      FieldByName('TIPO_REPORTE').AsInteger := 424;
      FieldByName('DESCRIPCION_REPORTE').AsString  := '424 - Movimientos en la Cartera Vigente';
      Post;
   end;

   with cdsMes do
   begin
      Close;
      CreateDataSet;
      Append;
      FieldByName('MES').AsString := '01';
      FieldByName('DESCRIPCION_MES').AsString  := 'Enero';
      Append;
      FieldByName('MES').AsString := '02';
      FieldByName('DESCRIPCION_MES').AsString  := 'Febrero';
      Append;
      FieldByName('MES').AsString := '03';
      FieldByName('DESCRIPCION_MES').AsString  := 'Marzo';
      Append;
      FieldByName('MES').AsString := '04';
      FieldByName('DESCRIPCION_MES').AsString  := 'Abril';
      Append;
      FieldByName('MES').AsString := '05';
      FieldByName('DESCRIPCION_MES').AsString  := 'Mayo';
      Append;
      FieldByName('MES').AsString := '06';
      FieldByName('DESCRIPCION_MES').AsString  := 'Junio';
      Append;
      FieldByName('MES').AsString := '07';
      FieldByName('DESCRIPCION_MES').AsString  := 'Julio';
      Append;
      FieldByName('MES').AsString := '08';
      FieldByName('DESCRIPCION_MES').AsString  := 'Agosto';
      Append;
      FieldByName('MES').AsString := '09';
      FieldByName('DESCRIPCION_MES').AsString  := 'Septiembre';
      Append;
      FieldByName('MES').AsString := '10';
      FieldByName('DESCRIPCION_MES').AsString  := 'Octubre';
      Append;
      FieldByName('MES').AsString := '11';
      FieldByName('DESCRIPCION_MES').AsString  := 'Noviembre';
      Append;
      FieldByName('MES').AsString := '12';
      FieldByName('DESCRIPCION_MES').AsString  := 'Diciembre';
      Post;
   end;

end;

procedure TwR4AParCga.edtAnioKeyPress(Sender: TObject; var Key: Char);
begin

   if not (key in['1','2','3','4','5','6','7','8','9','0', #8]) then
      key := #0;
end;

function TwR4AParCga.ValidaParametros: Boolean;
begin
   Result := False;

   if edtAnio.Text = EmptyStr then
   begin
      ShowMessage('Favor de proporcionar el Año del Reporte');
      edtAnio.SetFocus;
      exit;
   end;

   if StrToInt(edtAnio.Text) < 2015 then
   begin
      ShowMessage('El Año del Reporte no puede ser menor a 2015');
      edtAnio.SetFocus;
      exit;
   end;

   if dbCboMes.KeyValue < 0 then
   begin
      ShowMessage('Favor de seleccionar el Mes del Reporte');
      dbCboMes.SetFocus;
      exit;
   end;

   Result := True;
end;
procedure TwR4AParCga.btnCrearClick(Sender: TObject);
var
   vlPeriodo: String;
   vlRespuesta: Integer;
   vlDescError: String;
begin
 if objeto.ValidaAccesoEsp('TCRR4PARCG_GEN', TRUE, TRUE) then
 begin
   if not ValidaParametros then
      exit;
   if not ValidaPeriodo then
   begin
      ShowMessage('El periodo ya fue Autorizado. No se puede continuar');
      exit;
   end;

   vlPeriodo := edtAnio.Text + dbCboMes.KeyValue;
   spCarga.Close;
   spCarga.DatabaseName := Objeto.DataBaseName;
   spCarga.SessionName  := Objeto.SessionName;
   spCarga.UnPrepare;
   spCarga.ParamByName('PEEMPRESA').AsInteger := StrToInt(Objeto.DameEmpresa);
   spCarga.ParamByName('PEUSUARIO').AsString := Objeto.DameUsuario;
   spCarga.ParamByName('PEPERIODO').AsInteger := StrToInt(vlPeriodo);
   spCarga.ParamByName('PECOMMIT').AsInteger := 1;
   spCarga.Prepare;
   spCarga.ExecProc;
   vlRespuesta := spCarga.ParamByName('PSRESPUESTA').AsInteger;
   vlDescError := spCarga.ParamByName('PSDESCERROR').AsString;
   if vlRespuesta = 0 then
   begin
      ShowMessage('Proceso de Carga creado correctamente');
      InterForma1.BtnSalirClick(nil);
   end
   else
      ShowMessage('El Proceso de carga ha devuelto un error.' + #13 +
                  'Error ' + IntToStr(vlRespuesta) + ': ' + vlDescError);
 end;
end;

function TwR4AParCga.CreaQuery: TQuery;
var
   vlQry: TQuery;
begin
   vlQry := TQuery.Create(nil);
   with vlQry do
   begin
      Close;
      DatabaseName := Objeto.DatabaseName;
      SessionName  := Objeto.SessionName;
   end;
   Result := vlQry;
end;

function TwR4AParCga.ValidaPeriodo: Boolean;
var
   qryValida: TQuery;
   vlPeriodo: String;
begin
   vlPeriodo := edtAnio.Text + dbCboMes.KeyValue;
   qryValida := CreaQuery;
   with qryValida do
   begin
      SQL.Add(' SELECT COUNT(1) REGISTROS' +
              '   FROM CR_R04A_BITACORA_CARGA ' +
              '  WHERE ID_PERIODO_CARGA = ' + vlPeriodo +
              '    AND ESTATUS          = ' + QuotedStr('AUTORIZADO') );
      Open;
      Result := FieldByName('REGISTROS').AsInteger = 0;
   end;
   FreeAndNil(qryValida);
end;


procedure TwR4AParCga.InterForma1DespuesShow(Sender: TObject);
begin
   InterForma1.BtnNuevo.Visible := False;
   InterForma1.BtnModificar.Visible := False;
   InterForma1.BtnCancelar.Visible := False;
   InterForma1.BtnBuscar.Visible := False;
   InterForma1.BtnEliminar.Visible := False;
   InterForma1.BtnCancelar.Visible := False;
   Interforma1.BtnAceptar.Visible := False;
end;

procedure TwR4AParCga.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
end;

end.
