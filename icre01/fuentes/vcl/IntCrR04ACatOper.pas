unit IntCrR04ACatOper;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntCtoPanel,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Menus, InterEdit, IntLinkit,ToolWin,
IntParamCre, DBClient, DBCtrls;

type
  TCRR4CATOP = class;

  TwCRR4CATOP = class(TForm)
    InterForma1: TInterForma;
    Reporte: TLabel;
    btnCveOperacion: TBitBtn;
    Label1: TLabel;
    edtCveOperacion: TEdit;
    edtDescCveOperacion: TEdit;
    edtConcepto: TEdit;
    Label2: TLabel;
    dbCboReporte: TDBLookupComboBox;
    cdsReporte: TClientDataSet;
    cdsReporteTIPO_REPORTE: TIntegerField;
    cdsReporteDESCRIPCION_REPORTE: TStringField;
    dsReporte: TDataSource;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnCveOperacionClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1BtnBuscarClick(Sender: TObject);
  private
    { Private declarations }
    procedure HabilitaControles(SoloLectura: Boolean);
    function  ValidaConceptoEnRegistro: Boolean;
  public
    { Public declarations }
    Objeto : TCRR4CATOP;
  end;

  TCRR4CATOP= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        TIPO_REPORTE: TInterCampo;
        CVE_OPERACION: TInterCampo;
        CONCEPTO: TInterCampo;
        ParamCre: TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
   end;

var
  wCRR4CATOP: TwCRR4CATOP;

implementation

{$R *.DFM}



constructor TCRR4CATOP.Create( AOwner : TComponent );
begin
    inherited;
    TIPO_REPORTE := CreaCampo('TIPO_REPORTE',ftString,tsNinguno,tsNinguno,True);
    CVE_OPERACION:= CreaCampo('CVE_OPERACION',ftString,tsNinguno,tsNinguno,True);
    CONCEPTO     := CreaCampo('CONCEPTO',ftString,tsNinguno,tsNinguno,True);
    FKeyFields.Add('CVE_OPERACION');
    FKeyFields.Add('TIPO_REPORTE');
    TableName := 'CR_R04A_CAT_OPERA';
    UseQuery := True;
      //HelpFile := 'IntCrCto.Hlp';
    ShowMenuReporte:=True;
end;

Destructor TCRR4CATOP.Destroy;
begin
    inherited;
end;

function TCRR4CATOP.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwCRR4CATOP;
begin
   W:=TwCRR4CATOP.Create(Self);
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

function   TCRR4CATOP.InternalBusca : Boolean;
Var
   T:TInterFindit;
begin
      InternalBusca := False;
      T := CreaBuscador('ICRRA04A.IT','S');
      Try if Active then
      begin
         T.Param(0,CVE_OPERACION.AsString);
         T.Param(1, TIPO_REPORTE.AsString);
      end;
          if T.Execute then
             InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

procedure TwCRR4CATOP.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

  // Objeto.TIPO_REPORTE.Control  := dbCboReporte;
   Objeto.CVE_OPERACION.Control := edtCveOperacion;
   Objeto.CONCEPTO.Control      := edtConcepto;

   InterForma1.btnEliminar.Enabled := False;


   cdsReporte.Close;
   cdsReporte.CreateDataSet;
   cdsReporte.Open;
   cdsReporte.Append;
   cdsReporte.FieldByName('TIPO_REPORTE').AsInteger := 419;
   cdsReporte.FieldByName('DESCRIPCION_REPORTE').AsString := '419 - Estimación Preventiva';
   cdsReporte.Post;
   cdsReporte.Append;
   cdsReporte.FieldByName('TIPO_REPORTE').AsInteger := 420;
   cdsReporte.FieldByName('DESCRIPCION_REPORTE').AsString := '420 - Movimientos en la Cartera Vencida';
   cdsReporte.Post;
   cdsReporte.Append;
   cdsReporte.FieldByName('TIPO_REPORTE').AsInteger := 424;
   cdsReporte.FieldByName('DESCRIPCION_REPORTE').AsString := '424 - Movimientos en la Cartera Vigente';
   cdsReporte.Post;

end;

procedure TwCRR4CATOP.btnCveOperacionClick(Sender: TObject);
Var 
   T : TInterFindit;
begin
      With Objeto Do
      Begin
        T := CreaBuscador('ICROPERA.IT','S,S');
        Try
          If T.Execute Then
             Begin
                edtCveOperacion.Text     := T.DameCampo(0);
                edtDescCveOperacion.Text := T.DameCampo(1);
             End;
        Finally
          T.Free;
        End;
      End;
end;

procedure TwCRR4CATOP.InterForma1DespuesShow(Sender: TObject);
begin
   edtDescCveOperacion.Enabled := False;
   InterForma1.ShowBtnEliminar := False;
   InterForma1.BtnNuevo.SetFocus;
   HabilitaControles(True);
end;

procedure TwCRR4CATOP.FormDestroy(Sender: TObject);
begin

//    Objeto.TIPO_REPORTE.Control := nil;
    Objeto.CVE_OPERACION.Control := nil;
    Objeto.CONCEPTO.Control := nil;

end;

procedure TwCRR4CATOP.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.CVE_OPERACION.AsString := edtCveOperacion.Text;
   Objeto.TIPO_REPORTE.AsString  := dbCboReporte.KeyValue;
   Objeto.CONCEPTO.AsString      := edtConcepto.Text;;

   if dbCboReporte.KeyValue <= 0 then
   begin
      ShowMessage('Es necesario seleccionar el campo "Reporte"');
      dbCboReporte.SetFocus;
      exit;
   end;
   if edtCveOperacion.Text = EmptyStr then
   begin
      ShowMessage('Es necesario seleccionar el campo "Clave de Operación"');
      edtCveOperacion.SetFocus;
      exit;
   end;
   if edtConcepto.Text = EmptyStr then
   begin
      ShowMessage('Es necesario seleccionar el campo "Concepto"');
      edtConcepto.SetFocus;
      exit;
   end;

   if not ValidaConceptoEnRegistro then
   begin
      if MessageDlg('El Concepto: '+ edtConcepto.Text + ' no pertenece a ninguna sección del Reporte. Si continúa será un nuevo Concepto. ¿Realmente desea continuar?'
                    ,mtConfirmation, mbYesNoCancel, 0) <> mrYes then
      exit;
   end;
   Realizado := True;
end;

procedure TwCRR4CATOP.InterForma1DespuesNuevo(Sender: TObject);
begin
   HabilitaControles(False);
   dbCboReporte.KeyValue := 0;
   dbCboReporte.SetFocus;
end;

procedure TwCRR4CATOP.HabilitaControles(SoloLectura: Boolean);
begin
   dbCboReporte.ReadOnly := SoloLectura;
   if SoloLectura then
      dbCboReporte.Color := clBtnFace
   else
      dbCboReporte.Color := clWhite;
   btnCveOperacion.Enabled := not SoloLectura;

end;

procedure TwCRR4CATOP.InterForma1DespuesAceptar(Sender: TObject);
begin
   HabilitaControles(True);
end;

procedure TwCRR4CATOP.InterForma1DespuesCancelar(Sender: TObject);
begin
   HabilitaControles(True);
  // if Objeto.TIPO_REPORTE.AsString <> EmptyStr then
   dbCboReporte.KeyValue := Objeto.TIPO_REPORTE.AsString
end;

procedure TwCRR4CATOP.InterForma1BtnBuscarClick(Sender: TObject);
begin
   Objeto.InternalBusca;
   dbCboReporte.KeyValue := Objeto.TIPO_REPORTE.AsInteger;
end;

function  TwCRR4CATOP.ValidaConceptoEnRegistro: Boolean;
var
   vlQry: TQuery;
   vlTipoReporte: String;
begin
   Result := False;
   vlTipoReporte := dbCboReporte.KeyValue;
   vlQry := TQuery.Create(nil);
   vlQry.DatabaseName := objeto.DataBaseName;
   vlQry.SessionName  := Objeto.SessionName;
   vlQry.SQL.Add('SELECT COUNT(1) registros' +
                 '  FROM CR_R04A_CAT_OPERA'  +
                 ' WHERE TIPO_REPORTE = ' + vlTipoReporte +
                 '   AND CONCEPTO     = ' + QuotedStr(edtConcepto.Text));
   vlQry.Open;
   Result := vlQry.FieldByName('REGISTROS').AsInteger > 0;
   FreeAndNil(vlQry);
end;

end.
