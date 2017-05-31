unit IntCrR4Conf;

interface

uses
 Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
 IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntCtoPanel,
 IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Menus, InterEdit, IntLinkit,ToolWin,
 IntParamCre, DBClient, DBCtrls, Grids, DBGrids;

type
  TCrR4Conf  = class;

  TwCrR4Conf = class(TForm)
    InterForma1: TInterForma;
    pnlPantalla: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    GroupBox1: TGroupBox;
    dsTipoReporte: TDataSource;
    cdsTipoReporte: TClientDataSet;
    dbCboTipoReporte: TDBLookupComboBox;
    Label1: TLabel;
    cdsTipoReporteTIPO_REPORTE: TIntegerField;
    cdsTipoReporteDESCRIPCION_REPORTE: TStringField;
    dbgConfiguracion: TDBGrid;
    qryConfiguracion: TQuery;
    dsConfiguracion: TDataSource;
    dsOperacion: TDataSource;
    qryOperacion: TQuery;
    Label2: TLabel;
    dbGrdOperacion: TDBGrid;
    qrySeccion: TQuery;
    lblSeccion: TLabel;
    btnEditar: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsTipoReporteDataChange(Sender: TObject; Field: TField);
    procedure dsConfiguracionDataChange(Sender: TObject; Field: TField);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure dbgConfiguracionDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
     vlSeccionReporte: Integer;
     procedure ConectaConsulta(qry: TQuery);
     procedure RefresaConsultaPrincipal;
     procedure RefrescaDatosOperacion;
     procedure LlenaEtiquetaSeccion;
  public
    { Public declarations }
     Objeto: TCrR4Conf;
  end;

  TCrR4Conf= class(TInterFrame)
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
  wCrR4Conf: TwCrR4Conf;

implementation

uses
   IntCrR4MapRep, IntDmMain;

{$R *.DFM}

constructor TCrR4Conf.Create( AOwner : TComponent );
begin
   inherited;
end;

destructor TCrR4Conf.Destroy;
begin
   inherited;
end;

function TCrR4Conf.ShowWindow(FormaTipo : TFormaTipo) : Integer;
var W : TwCrR4Conf;
begin
   W:=TwCrR4Conf.Create(Self);
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

procedure TwCrR4Conf.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
   ConectaConsulta(qryConfiguracion);
   ConectaConsulta(qryOperacion);
   ConectaConsulta(qrySeccion);
end;

procedure TwCrR4Conf.ConectaConsulta(qry: TQuery);
begin
   qry.Close;
   qry.DatabaseName := Objeto.DataBaseName;
   qry.SessionName  := Objeto.SessionName;
end;

procedure TwCrR4Conf.FormCreate(Sender: TObject);
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
end;

procedure TwCrR4Conf.dsTipoReporteDataChange(Sender: TObject;
  Field: TField);
begin
   RefresaConsultaPrincipal;
end;

procedure TwCrR4Conf.RefresaConsultaPrincipal;
var
   vlTipoReporte: Integer;
begin
   try
      vlTipoReporte := dbCboTipoReporte.KeyValue;
      with qryConfiguracion do
      begin
         Close;
         ParamByName('paTipoReporte').AsInteger := vlTipoReporte;
         Open;
         vlSeccionReporte := FieldByName('SECCION').AsInteger;
         LlenaEtiquetaSeccion;
      end;
   except
   end;
end;

procedure TwCrR4Conf.RefrescaDatosOperacion;
var
   vlTipoReporte: Integer;
begin
   qryOperacion.Close;
   vlTipoReporte :=  dbCboTipoReporte.KeyValue;
   if qryConfiguracion.FieldByName('CONCEPTO').AsString <> EmptyStr then
   begin
      qryOperacion.ParamByName('PATIPOREPORTE').AsInteger := vlTipoReporte;
      qryOperacion.ParamByName('PACONCEPTO').AsString := qryConfiguracion.FieldByName('CONCEPTO').AsString;
      qryOperacion.Open;
   end;
   LlenaEtiquetaSeccion;
end;
procedure TwCrR4Conf.dsConfiguracionDataChange(Sender: TObject;
  Field: TField);
begin
   if vlSeccionReporte <> qryConfiguracion.FieldByName('SECCION').AsInteger then
   begin
      vlSeccionReporte := qryConfiguracion.FieldByName('SECCION').AsInteger;
      RefrescaDatosOperacion;
   end;
end;

procedure TwCrR4Conf.InterForma1DespuesShow(Sender: TObject);
begin
   InterForma1.BtnNuevo.Visible     := False;
   InterForma1.BtnModificar.Visible := False;
   InterForma1.BtnEliminar.Visible  := False;
   InterForma1.BtnAceptar.Visible   := False;
   InterForma1.BtnCancelar.Visible  := False;
   InterForma1.BtnBuscar.Visible    := False;
end;

procedure TwCrR4Conf.dbgConfiguracionDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
   Residuo: Integer;
begin
   try
      if gdSelected in state then
      begin
         dbgConfiguracion.Canvas.Brush.Color := clHighlight;
         dbgConfiguracion.Canvas.Font.Color  := clWhite;
      end
      else
      begin
         Residuo := qryConfiguracion.FieldByName('SECCION').AsInteger mod 2;
         case Residuo of
            1: dbgConfiguracion.Canvas.Brush.Color := $88FFFF;//$CCFFFF;//$99FFFF;
         else
            begin
               dbgConfiguracion.Canvas.Brush.Color := clWindow;
               dbgConfiguracion.Canvas.Font.Color := clBlack;
            end;
         end;
      end;
      dbgConfiguracion.DefaultDrawColumnCell(Rect,Datacol,Column,State);
   except
   end;
end;

procedure TwCrR4Conf.LlenaEtiquetaSeccion;
var
   vlTipoReporte: Integer;
begin
   vlTipoReporte := dbCboTipoReporte.KeyValue;
   with qrySeccion do
   begin
      Close;
      ParamByName('PATIPOREPORTE').AsInteger := vlTipoReporte;
      ParamByName('PASECCION').AsInteger := vlSeccionReporte;
      Open;
      lblSeccion.Caption := FieldByName('DESCRIPCION').AsString;
   end;
end;

procedure TwCrR4Conf.btnEditarClick(Sender: TObject);
var
   MapeoReporte : TCrR4MapRe;
   vlTipoReporte: Integer;
   vlCveConcepto: String;
begin
   if dbCboTipoReporte.Text = EmptyStr then
   begin
      ShowMessage('Es necesario proporcionar el Reporte. Favor de revisar!!');
      dbCboTipoReporte.SetFocus;
      exit;
   end;
   vlTipoReporte := dbCboTipoReporte.KeyValue;
   vlCveConcepto := qryConfiguracion.FieldByName('CVE_CONCEPTO').AsString;
   MapeoReporte  := TCrR4MapRe.Create(self);
   try
      MapeoReporte.Apli            := dmMain.apMain;
      MapeoReporte.ParamCre        := Objeto.ParamCre;
      MapeoReporte.vlTipoReporte   := vlTipoReporte;
      MapeoReporte.vlCveConcepto   := vlCveConcepto;
      MapeoReporte.stTipoReporte   := dbCboTipoReporte.Text;
      MapeoReporte.stSeccion       := lblSeccion.Caption;
      MapeoReporte.Catalogo;
   finally
      MapeoReporte.Free;
   end;
   RefresaConsultaPrincipal;
   qryConfiguracion.Locate('CVE_CONCEPTO', vlCveConcepto, []);
end;

end.
