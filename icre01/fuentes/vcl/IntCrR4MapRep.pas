unit IntCrR4MapRep;

interface

uses
 Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
 IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntCtoPanel,
 IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Menus, InterEdit, IntLinkit,ToolWin,
 IntParamCre, DBClient, DBCtrls, Grids, DBGrids;

type
  TCrR4MapRe = class;
  
  TwCrR4MapRe = class(TForm)
    pnlForma: TPanel;
    InterForma1: TInterForma;
    gbDatosGenerales: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    lblTipoReporte: TLabel;
    lblSeccion: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtCveConcepto: TEdit;
    edtDescripcion: TEdit;
    edtConcepto: TEdit;
    edtTipoReporte: TEdit;
    edtCveClasContab: TEdit;
    Label6: TLabel;
    edtSeccion: TEdit;
    edtOrden: TEdit;
    edtNivel: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
     Objeto       : TCrR4MapRe;
    { Public declarations }
  end;

  TCrR4MapRe = class(TInterFrame)
  private
  protected
  public
  { Public declarations }
        vlTipoReporte : Integer;
        vlCveConcepto : String;
        stTipoReporte : String;
        stSeccion     : String;
        TIPO_REPORTE   : TInterCampo;
        CVE_CONCEPTO   : TInterCampo;
        DESCRIPCION    : TInterCampo;
        SECCION        : TInterCampo;
        ORDEN          : TInterCampo;
        NIVEL          : TInterCampo;
        CONCEPTO       : TInterCampo;
        CVE_CLAS_CONTAB: TInterCampo;
        ParamCre     :TParamCre;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
   published
   end;


var
  wCrR4MapRe: TwCrR4MapRe;

implementation

{$R *.DFM}
constructor TCrR4MapRe.Create( AOwner : TComponent );
begin
   inherited;
   TIPO_REPORTE  := CreaCampo('TIPO_REPORTE',ftString,tsNinguno,tsNinguno,True);
   CVE_CONCEPTO  := CreaCampo('CVE_CONCEPTO',ftString,tsNinguno,tsNinguno,True);
   DESCRIPCION   := CreaCampo('DESCRIPCION',ftString,tsNinguno,tsNinguno,True);
   SECCION       := CreaCampo('SECCION'    ,ftInteger,tsNinguno,tsNinguno,True);
   ORDEN         := CreaCampo('ORDEN'      ,ftInteger,tsNinguno,tsNinguno,True);
   NIVEL         := CreaCampo('NIVEL'      ,ftInteger,tsNinguno,tsNinguno,True);
   CONCEPTO      := CreaCampo('CONCEPTO'   ,ftString,tsNinguno,tsNinguno,True);
   CVE_CLAS_CONTAB := CreaCampo('CVE_CLAS_CONTAB'   ,ftString,tsNinguno,tsNinguno,True);
   FKeyFields.Add('TIPO_REPORTE');
   FKeyFields.Add('CVE_CONCEPTO');
   TableName := 'CR_R04A_MAPEO_REP';
   UseQuery := True;
   ShowMenuReporte:=True;
end;

destructor TCrR4MapRe.Destroy;
begin
   inherited;
end;

function TCrR4MapRe.ShowWindow(FormaTipo : TFormaTipo) : Integer;
var W : TwCrR4MapRe;
begin
   W:=TwCrR4MapRe.Create(Self);
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


procedure TwCrR4MapRe.FormShow(Sender: TObject);
begin
   lblTipoReporte.Caption := Objeto.stTipoReporte;
   lblSeccion.Caption     := Objeto.stSeccion;
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
// controles de la interforma
   Objeto.TIPO_REPORTE.Control := edtTipoReporte;
   Objeto.CVE_CONCEPTO.Control := edtCveConcepto;
   Objeto.DESCRIPCION.Control  := edtDescripcion;
   Objeto.SECCION.Control      := edtSeccion;
   Objeto.ORDEN.Control        := edtOrden;
   Objeto.NIVEL.Control        := edtNivel;
   Objeto.CONCEPTO.Control     := edtConcepto;
   Objeto.CVE_CLAS_CONTAB.Control := edtCveClasContab;
// encuentro el registro que pasé
   Objeto.FindKey([Objeto.vlTipoReporte, Objeto.vlCveConcepto]);
   InterForma1.BtnNuevo.Visible  := False;
   InterForma1.BtnBuscar.Visible := False;
   InterForma1.BtnEliminar.Visible:= False;
end;

procedure TwCrR4MapRe.FormDestroy(Sender: TObject);
begin
   Objeto.TIPO_REPORTE.Control := nil;
   Objeto.CVE_CONCEPTO.Control := nil;
   Objeto.DESCRIPCION.Control  := nil;
   Objeto.SECCION.Control      := nil;
   Objeto.ORDEN.Control        := nil;
   Objeto.NIVEL.Control        := nil;
   Objeto.CONCEPTO.Control     := nil;
   Objeto.CVE_CLAS_CONTAB.Control := nil;
end;

end.
