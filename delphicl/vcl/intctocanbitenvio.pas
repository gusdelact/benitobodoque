//------------------------------------------------------------------------------
// Función    : Bitacora de Envio de Contratos Cancelados
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 25 de febrero del 2015
//------------------------------------------------------------------------------
Unit IntCtoCanBitEnvio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IntFrm,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, UnSQL2, InterEdit,
  ComCtrls, IntCtoHeader, IntUsuario, UnFunProcICB, Menus, IntLinkit, unGene,
  IntSGCtrl;

Type
  TBitEnvCto = Class;

  TWBitEnvCto = Class(TForm)
    InterForma: TInterForma;
    gbFiltros: TGroupBox;
    lId: TLabel;
    lContrato: TLabel;
    sbContrato: TSpeedButton;
    ieIdContrato: TInterEdit;
    eNomTitular: TEdit;
    ieFolio: TInterEdit;
    lGuion: TLabel;
    dtpFInicio: TDateTimePicker;
    cbFecha: TCheckBox;
    dtpFFin: TDateTimePicker;
    lUsuario: TLabel;
    sbUsuario: TSpeedButton;
    ieCveUsuario: TInterEdit;
    eNomUsuario: TEdit;
    gbInformacion: TGroupBox;
    pmFolio: TPopupMenu;
    LimpiarRegistro1: TMenuItem;
    ilContrato: TInterLinkit;
    ilUsuario: TInterLinkit;
    SGCtrl: TSGCtrl;
    function  ObtenerSQL : String;
    procedure InicializaValores;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbContratoClick(Sender: TObject);
    procedure sbUsuarioClick(Sender: TObject);
    procedure InterFormaAyuda(Sender: TObject);
    procedure InterFormaBuscar(Sender: TObject);
    procedure LimpiarRegistro1Click(Sender: TObject);
    procedure ilContratoEjecuta(Sender: TObject);
    procedure ilUsuarioEjecuta(Sender: TObject);
    private
      { Private declarations }
    public
      { Public declarations }
      Objeto : TBitEnvCto;
    end;

  TBitEnvCto = class(TInterFrame)
    private
      { Private declarations }
    protected
      { Protected declarations }
    public
      { Public declarations }
      Contrato : TCtrlCto;
      Usuario  : TUsuario;     
      constructor Create(AOwner : TComponent); override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      procedure   DataBaseChange;
    published
      { Published declarations }
    end;
implementation
  {$R *.DFM}

constructor TBitEnvCto.Create(AOwner : TComponent);
begin
   Inherited;   
   Contrato              := TCtrlCto.Create(Self);
   Contrato.MasterSource := Self;
   Usuario               := TUsuario.Create(Self);
   Usuario.MasterSource  := Self;
end;

function TBitEnvCto.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWBitEnvCto;
begin
   W := TWBitEnvCto.Create(Self);
   try
      W.Objeto := Self;
      W.InterForma.InterFrame       := Self;
      W.InterForma.FormaTipo        := FormaTipo;
      W.InterForma.ShowBtnPreview   := False;
      W.InterForma.ShowBtnImprimir  := False;
      W.InterForma.ShowBtnNuevo     := False;
      W.InterForma.ShowBtnModificar := False;
      W.InterForma.ShowBtnEliminar  := False;
      W.InterForma.ShowBtnAceptar   := False;
      W.InterForma.ShowBtnCancelar  := False;
      W.InterForma.ShowGrid         := False;
      W.InterForma.ShowNavigator    := False;
      W.InterForma.Funcion          := FInterFun;
      W.InterForma.ShowModal;
      ShowWindow := W.InterForma.ModalResult;
   finally
      W.Free;
   end;
end;

procedure TBitEnvCto.DataBaseChange;
begin
   inherited;
   Contrato.GetParams(Self);
   Usuario.GetParams(Self);
end;

procedure TWBitEnvCto.InicializaValores;
begin
   ieFolio.Clear;
   SGCtrl.ColCount        := 0;
   cbFecha.Checked        := False;
   dtpFInicio.Date        := Now;
   dtpFFin.Date           := Now;
   Objeto.Contrato.Active := False;
   Objeto.Usuario.Active  := False;
end;

function TWBitEnvCto.ObtenerSQL : String;
var
   vSQL : String;
begin
   Objeto.GetFromControl;
   vSQL := '';

   if trim(ieFolio.Text) <> '' then
      vSQL := vSQL + ' and env.id_cancelado = ' + Trim(ieFolio.Text);
   if trim(ieIdContrato.Text) <> '' then
      vSQL := vSQL + ' and env.id_contrato = ' + Trim(ieIdContrato.Text);
   if trim(ieCveUsuario.Text) <> '' then
      vSQL := vSQL + ' and env.cve_usr_envio = ' + QuotedStr(ieCveUsuario.Text);
   if cbFecha.Checked then
      vSQL := vSQL + ' and trunc(env.fh_envio) between to_date(' + QuotedStr(DateToStr(dtpFInicio.date)) + ', ''dd/mm/yyyy'') '
                                               + ' and to_date(' + QuotedStr(DateToStr(dtpFFin.date)) + ', ''dd/mm/yyyy'')';
   if trim(vSQL) <> '' then
      vSQL := 'Where ' + copy(vSQL, 6, length(vSQL));

   vSQL := 'select env.id_cancelado, env.id_contrato, env.cve_usr_envio, per.nombre, env.fh_envio '
         + '  from contrato_can_envio env '
         + '       inner join usuario usr on usr.cve_usuario = env.cve_usr_envio '
         + '       inner join persona per on per.id_persona  = usr.id_persona '
         + trim(vSQL)
         + ' order by env.id_cancelado, env.id_envio';

   result := vSQL;    
end;

procedure TWBitEnvCto.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Contrato.Id_Contrato.Control            := ieIdContrato;
      Contrato.TITNombre.Control              := eNomTitular;
      Contrato.ShowMenuCatalogo               := False;
      Contrato.ShowMenuReporte                := False;
      Contrato.ShowMenuClear                  := True;
      ieIdContrato.PopupMenu                  := Contrato.PopMenu;
      Usuario.CVE_USUARIO.Control             := ieCveUsuario;
      Usuario.Empleado.Persona.Nombre.Control := eNomUsuario;
      Usuario.ShowMenuCatalogo                := False;
      Usuario.ShowMenuReporte                 := False;
      Usuario.ShowMenuClear                   := True;
      ieCveUsuario.PopupMenu                  := Usuario.PopMenu;  
   end;
   InterForma.BtnAyuda.Caption  := 'Limpiar';
   InterForma.BtnAyuda.ShowHint := True;
   InterForma.BtnAyuda.Hint     := 'Limpiar Campos';
   InicializaValores;
end;

procedure TWBitEnvCto.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Contrato.Id_Contrato.Control            := nil;
      Contrato.TITNombre.Control              := nil;
      Usuario.CVE_USUARIO.Control             := nil;
      Usuario.Empleado.Persona.Nombre.Control := nil;
   end;
end;     

procedure TWBitEnvCto.ilContratoEjecuta(Sender: TObject);
begin
   Objeto.Contrato.FindKey([ilContrato.buffer]);
end;

procedure TWBitEnvCto.ilUsuarioEjecuta(Sender: TObject);
begin
   Objeto.Usuario.FindKey([ilUsuario.buffer]);
end;

procedure TWBitEnvCto.LimpiarRegistro1Click(Sender: TObject);
begin
   ieFolio.Clear;
end;

procedure TWBitEnvCto.sbContratoClick(Sender: TObject);
begin
   Objeto.Contrato.Busca;
end;

procedure TWBitEnvCto.sbUsuarioClick(Sender: TObject);
begin
   Objeto.Usuario.Busca;
end;

procedure TWBitEnvCto.InterFormaAyuda(Sender: TObject);
begin
   InicializaValores;
end;

procedure TWBitEnvCto.InterFormaBuscar(Sender: TObject);
var
   Qry : TQuery;
begin
   try
      SGCtrl.ColCount := 0;
      try
         Qry := GetSqlQuery(ObtenerSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
         if Qry = nil then
            raise EInterFrame.Create('No existe informacion para ser presentada...');
         with Qry do
         begin
            FieldByName('ID_CANCELADO').DisplayWidth  := 10;
            FieldByName('ID_CONTRATO').DisplayWidth   := 11;
            FieldByName('CVE_USR_ENVIO').DisplayWidth := 11;
            FieldByName('NOMBRE').DisplayWidth        := 50;
            FieldByName('FH_ENVIO').DisplayWidth      := 22;
         end;
         with SGCtrl do
         begin
            ColCount := 5;
            BeginGrid;
            Titulo1  := 'Bitácora de Envío';
            SetPrintCol(kNoPrint);
            AddTitle(SGCtrl.Titulo1, tcCenter);
            LeftCol  := 0;
            Columnas[ 0].SetInfo('A0', 'Id',       100, tcLeft, '', True);
            Columnas[ 1].SetInfo('A1', 'Contrato', 100, tcLeft, '', True);
            Columnas[ 2].SetInfo('A2', 'Usuario',  100, tcLeft, '', True);
            Columnas[ 3].SetInfo('A3', 'Nombre',   100, tcLeft, '', True);
            Columnas[ 4].SetInfo('A4', 'FH Envio', 100, tcLeft, '', True);
            SetPrintCol(kPrintHeader);
            NextRow;
            EndCaption;
            AddQry(Qry, False, False, -1, 0, -1, False);
         end;
      finally
         if Qry <> nil then
            FreeAndNil(Qry);
      end;
   except
      on e: EInterFrame do
         MessageDlg(e.Message, mtInformation, [mbOK], 0);
   end;
end;

procedure TWBitEnvCto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
