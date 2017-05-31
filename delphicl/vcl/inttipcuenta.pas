Unit IntTipCuenta;
//------------------------------------------------------------------------------
//  Catálogo de Tipos de Cuenta
//  Realizó  : Carlos Adrian Mejía Ledón
//  Fecha    : Noviembre 2003
//  Empresa  : Grupo Financiero Interacciones.
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, UnGene, UnConKYC, UnRpTipCuenta;

type
  TTipCuenta= class;

  TWTipCuenta=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_TIPO_CUENTA : TLabel;
    edCVE_TIPO_CUENTA : TEdit;
    lbDESC_TIPO_CUENTA : TLabel;
    edDESC_TIPO_CUENTA : TEdit;
    qTipoCuenta: TQuery;
    Label1: TLabel;
    edCveTipCta: TEdit;
    cbCorp: TCheckBox;
    cbVostro: TCheckBox;
    cbSpei: TCheckBox;
    cbValida: TCheckBox;
    Button1: TButton;
    qIguala: TQuery;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    function  ValidaTipoCuenta : Boolean;
    function  ValidaDesc : Boolean;
    function  ValidaExiste : Boolean;
    procedure edCVE_TIPO_CUENTAExit(Sender: TObject);
    procedure edDESC_TIPO_CUENTAExit(Sender: TObject);
    procedure InterForma1BtnAceptar(Sender: TObject);
    procedure InterForma1Preview(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TTipCuenta;
  end;

  TTipCuenta= class(TInterFrame)
    private
    protected
    public
      CVE_TIPO_CUENTA   : TInterCampo;
      DESC_TIPO_CUENTA  : TInterCampo;
      B_VALIDA          : TInterCampo;
      B_OPERA_SPEI      : TInterCampo;
      B_OPERA_VOSTRO    : TInterCampo;
      B_CORP            : TInterCampo;
      CVE_TIP_CTA       : TInterCampo;

      function    InternalBusca : Boolean; override;
      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
  end;

implementation
{$R *.DFM}

//**************************************************************//
//                      CLASE TTIPCUENTA                        //
//**************************************************************//

constructor TTipCuenta.Create( AOwner : TComponent );
begin
  Inherited;
  CVE_TIPO_CUENTA :=CreaCampo('CVE_TIPO_CUENTA',ftString,tsNinguno,tsNinguno,True);
  CVE_TIPO_CUENTA.Caption:='Tipo Cuenta';
  DESC_TIPO_CUENTA :=CreaCampo('DESC_TIPO_CUENTA',ftString,tsNinguno,tsNinguno,True);
  DESC_TIPO_CUENTA.Caption:='Descripción';

  B_VALIDA :=CreaCampo('B_VALIDA',ftString,tsNinguno,tsNinguno,True);
  B_VALIDA.Caption:='Valida';
  B_VALIDA.Size := 1;
  B_OPERA_SPEI :=CreaCampo('B_OPERA_SPEI',ftString,tsNinguno,tsNinguno,True);
  B_OPERA_SPEI.Caption:='Opera SPEI';
  B_OPERA_SPEI.Size := 1;
  B_OPERA_VOSTRO :=CreaCampo('B_OPERA_VOSTRO',ftString,tsNinguno,tsNinguno,True);
  B_OPERA_VOSTRO.Caption:='Opera VOSTRO';
  B_OPERA_VOSTRO.Size := 1;
  B_CORP:=CreaCampo('B_CORP',ftString,tsNinguno,tsNinguno,True);
  B_CORP.Caption:='Se despliega en el catálogo de cuentas de personas';
  B_CORP.Size := 1;
  CVE_TIP_CTA:=CreaCampo('CVE_TIP_CTA',ftString,tsNinguno,tsNinguno,True);
  CVE_TIP_CTA.Caption:='Se despliega en el catálogo de cuentas de personas';
  CVE_TIP_CTA.Size := 6;

  FKeyFields.Add('CVE_TIP_CTA');

  TableName := 'TIPO_CUENTA';
  UseQuery := True;
  HelpFile := 'IntTipCuenta.Hlp';
  ShowMenuReporte:=True;
end;

destructor TTipCuenta.Destroy;
begin
  inherited;
end;

function TTipCuenta.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W : TWTipCuenta;
begin
  W:=TWTipCuenta.Create(Self);
  try
    W.Objeto:= Self;
    W.InterForma1.InterFrame:= Self;
    W.InterForma1.FormaTipo := FormaTipo;
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowBtnAyuda := False;
    W.InterForma1.ShowBtnPreview := True;
    W.qTipoCuenta.DatabaseName := Apli.DataBaseName;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;

function TTipCuenta.InternalBusca:Boolean;
var
  T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ITipCuenta.it','S');
  try
    if Active then
    begin
      T.Param(0,CVE_TIP_CTA.AsString);
    end;
    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;
end;

//**************************************************************//
//                     CLASE TWTIPCUENTA                        //
//**************************************************************//

procedure TWTipCuenta.FormShow(Sender: TObject);
begin
  Objeto.CVE_TIPO_CUENTA.Control:=edCVE_TIPO_CUENTA;
  Objeto.DESC_TIPO_CUENTA.Control:=edDESC_TIPO_CUENTA;

  Objeto.B_VALIDA.Control := cbValida;
  Objeto.B_OPERA_SPEI.Control := cbSpei;
  Objeto.B_OPERA_VOSTRO.Control := cbVostro;
  Objeto.B_CORP.Control := cbCorp;
  Objeto.CVE_TIP_CTA.Control := edCveTipCta;

  InterForma1.F.btNuevo.SetFocus;
end;

procedure TWTipCuenta.FormDestroy(Sender: TObject);
begin
  Objeto.CVE_TIPO_CUENTA.Control:=nil;
  Objeto.DESC_TIPO_CUENTA.Control:=nil;

  Objeto.B_VALIDA.Control := nil;
  Objeto.B_OPERA_SPEI.Control := nil;
  Objeto.B_OPERA_VOSTRO.Control := nil;
  Objeto.B_CORP.Control := nil;
  Objeto.CVE_TIP_CTA.Control := nil;
end;

procedure TWTipCuenta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//**************************************************************//
//             Eventos de los componentes de la Forma           //
//**************************************************************//

//---- Exit de Grupo de Operaciones ----//
procedure TWTipCuenta.edCVE_TIPO_CUENTAExit(Sender: TObject);
begin
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValidaTipoCuenta;
end;

//---- Exit de Descripción ----//
procedure TWTipCuenta.edDESC_TIPO_CUENTAExit(Sender: TObject);
begin
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValidaDesc;
end;

//**************************************************************//
//                   Botones de Interforma                      //
//**************************************************************//

//---- Bóton Aceptar ----//
procedure TWTipCuenta.InterForma1BtnAceptar(Sender: TObject);
var
  vlAccion : string;
begin
  vlAccion := InterForma1.F.Accion;
  // Acción Nuevo
  if vlAccion = cNuevo then
  begin
    if ValidaTipoCuenta then
      if ValidaDesc then
        if ValidaExiste then
          InterForma1.Aceptar;
  end;
  // Acción Modificar
  if vlAccion = cModificar then
  begin
    if ValidaDesc then
      InterForma1.Aceptar;
  end;
end;

//---- Bóton Preview ----//
procedure TWTipCuenta.InterForma1Preview(Sender: TObject);
begin
  EXECUTE_RP_TIPCUENTA(Objeto.Apli,'Ver');
end;

//**************************************************************//
//                   Eventos de Interforma                      //
//**************************************************************//

//---- Después de Nuevo ----//
procedure TWTipCuenta.InterForma1DespuesNuevo(Sender: TObject);
begin
  edCVE_TIPO_CUENTA.SetFocus;
end;

//---- Después de Modificar ----//
procedure TWTipCuenta.InterForma1DespuesModificar(Sender: TObject);
begin
  edDESC_TIPO_CUENTA.SetFocus;
end;

//**************************************************************//
//                       Validaciones                           //
//**************************************************************//

//---- Valida Tipo de Cuenta ----//
function TWTipCuenta.ValidaTipoCuenta : Boolean;
begin
  if Length(edCVE_TIPO_CUENTA.Text) <= 0 then
  begin
    ValidaTipoCuenta := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,'Debe especificar un Tipo de Cuenta...');
    edCVE_TIPO_CUENTA.SetFocus;
  end
  else
    ValidaTipoCuenta := True;
end;

//---- Valida Descripción ----//
function TWTipCuenta.ValidaDesc : Boolean;
begin
  if Length(edDESC_TIPO_CUENTA.Text) <= 0 then
  begin
    ValidaDesc := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,'Debe especificar una descripción para el tipo de cuenta...');
    edDESC_TIPO_CUENTA.SetFocus;
  end
  else
    ValidaDesc := True;
end;

//---- Valida Existe ----//
function TWTipCuenta.ValidaExiste : Boolean;
begin
  with qTipoCuenta do
  begin
    Close;
    ParamByName('pCveTipoCuenta').AsString := Trim(edCVE_TIPO_CUENTA.Text);
    Open;
    if not IsEmpty then
    begin
      ValidaExiste := False;
      MessageBeep(0);
      InterMsg(tmInformacion,'',0,'El Tipo de Cuenta ' + Trim(edCVE_TIPO_CUENTA.Text) + ' ya existe...');
      edCVE_TIPO_CUENTA.SetFocus;
    end
    else
      ValidaExiste := True;
    Close;
  end;
end;

procedure TWTipCuenta.Button1Click(Sender: TObject);
begin
  qIguala.Active := False;
  qIguala.DatabaseName := Objeto.Apli.DataBaseName;
  qIguala.SessionName := Objeto.Apli.SessionName;
  qIguala.SQL.Clear;
  qIguala.SQL.Add('update tipo_cuenta set cve_tip_cta=cve_tipo_cuenta');
  qIguala.ExecSQL;

end;

end.
