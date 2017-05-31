// Sistema         : Clase de TMProxEmi
// Fecha de Inicio : 01/10/2003
// Función forma   : Clase de TMProxEmi
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMProxEmi;

interface                              

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntCrEmisor,     //Emisor
IntCrProveed,    //Proveedor
IntParamCre,
IntMQrProxEmi    //Reporte
;

Type
 TMProxEmi= class;

  TwMProxEmi=Class(TForm)
    lbAplica: TLabel;
    edID_EMISOR: TEdit;
    btEMISOR: TBitBtn;
    ilEMISOR: TInterLinkit;
    edNOM_EMISOR: TEdit;
    lbID_EMISOR: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    chbxEmisor: TCheckBox;
    lbID_PROVEEDOR: TLabel;
    edID_PROVEEDOR: TEdit;
    btPROVEEDOR: TBitBtn;
    edNOM_PROVEEDOR: TEdit;
    chbxProveedor: TCheckBox;
    InterForma1: TInterForma;
    ilPROVEEDOR: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btEMISORClick(Sender: TObject);
    procedure ilEMISORCapture(Sender: TObject; var Show: Boolean);
    procedure ilEMISOREjecuta(Sender: TObject);
    procedure btEMISORExit(Sender: TObject);
    procedure chbxEmisorClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure btPROVEEDORClick(Sender: TObject);
    procedure ilPROVEEDORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROVEEDOREjecuta(Sender: TObject);
    procedure edID_PROVEEDORExit(Sender: TObject);
    procedure chbxProveedorClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TMProxEmi;
end;
 TMProxEmi= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        Emisor                   : TCrEmisor;
        Proveedor                : TCrProveed;
        ParamCre                 : TParamCre;
       function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TMProxEmi.Create( AOwner : TComponent );
begin Inherited;
      Emisor := TCrEmisor.Create(Self);
      Emisor.MasterSource:=Self;
      Emisor.FieldByName('ID_ACREDITADO').MasterField:='ID_EMISOR';
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//      Emisor.FieldByName('CVE_EMISOR_NAFIN').MasterField:='CVE_EMISOR_NAFIN';
      Emisor.FieldByName('CVE_EMISOR_EXT').MasterField:='CVE_EMISOR_NAFIN';
{/ROIM}

      Proveedor := TCrProveed.Create(Self);
      Proveedor.MasterSource:=Self;      StpName  := ' ';
      Proveedor.FieldByName('ID_ACREDITADO').MasterField:='ID_PROVEEDOR';

      UseQuery := False;
      HelpFile := 'IntMProxEmi.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMProxEmi.Destroy;
begin
    If Emisor <> Nil Then
        Emisor.Free;
   if Proveedor <> nil then
      Proveedor.Free;
   inherited;
end;


function TMProxEmi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMProxEmi;
begin
   W:=TwMProxEmi.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TMProxEmi.InternalBusca:Boolean;
begin InternalBusca := False;

end;

function TMProxEmi.Reporte:Boolean;
begin //Execute_Reporte();
end;

procedure TwMProxEmi.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.Emisor.ID_ACREDITADO.Control := edID_EMISOR;
      Objeto.Emisor.Acreditado.Persona.Nombre.Control := edNOM_EMISOR;
      Objeto.Emisor.GetParams(Objeto);
      edNOM_EMISOR.Hint := Objeto.Emisor.Acreditado.Persona.Nombre.AsString;
      edNOM_EMISOR.ShowHint := True;

      Objeto.Proveedor.ID_ACREDITADO.Control := edID_PROVEEDOR;
      Objeto.Proveedor.Persona.Nombre.Control := edNOM_PROVEEDOR;
      Objeto.Proveedor.GetParams(Objeto);
      edNOM_PROVEEDOR.Hint := Objeto.Proveedor.Persona.Nombre.AsString;
      edNOM_PROVEEDOR.ShowHint := True;

end;

procedure TwMProxEmi.FormDestroy(Sender: TObject);
begin
      Objeto.Emisor.ID_ACREDITADO.Control := nil;
      Objeto.Emisor.Acreditado.Persona.Nombre.Control := nil;

      Objeto.Proveedor.ID_ACREDITADO.Control := nil;
      Objeto.Proveedor.Persona.Nombre.Control := nil;
End;

procedure TwMProxEmi.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMProxEmi.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMProxEmi.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWNinguno.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TwMProxEmi.btEMISORClick(Sender: TObject);
begin
    Objeto.Emisor.ShowAll := True;
    if Objeto.Emisor.Busca then begin
        chbxEmisor.Checked:=True;
        chbxEmisor.Enabled:=True;
        InterForma1.NextTab(edID_EMISOR);
    end;
end;

procedure TwMProxEmi.ilEMISORCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMProxEmi.ilEMISOREjecuta(Sender: TObject);
begin
    if Objeto.Emisor.FindKeyNear([ilEMISOR.Buffer],['ID_ACREDITADO']) then begin
        chbxEmisor.Checked:=True;
        chbxEmisor.Enabled:=True;
        InterForma1.NextTab(edID_EMISOR);
    End;
end;

procedure TwMProxEmi.btEMISORExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_EMISOR,True,'',True);
end;

procedure TwMProxEmi.chbxEmisorClick(Sender: TObject);
begin
    If not chbxEmisor.Checked Then Begin
        Objeto.Emisor.Active:=False;
        chbxEmisor.Checked:=False;
        chbxEmisor.Enabled:=False;
    End Else Begin
        chbxEmisor.Checked:=True;
        chbxEmisor.Enabled:=True;
    End;
end;

procedure TwMProxEmi.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPROXEMI_PREVI',True,True) then
      RepProxEmi(edID_EMISOR.Text,edID_PROVEEDOR.Text,Objeto.Apli,True);
end;

procedure TwMProxEmi.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPROXEMI_IMPRI',True,True) then
      RepProxEmi(edID_EMISOR.Text,edID_PROVEEDOR.TEXT,Objeto.Apli,False);
end;

procedure TwMProxEmi.btPROVEEDORClick(Sender: TObject);
begin
   Objeto.Proveedor.ShowAll := True;
   if Objeto.Proveedor.Busca then begin
        chbxProveedor.Checked:=True;
        chbxProveedor.Enabled:=True;
        InterForma1.NextTab(edID_PROVEEDOR);
   End;
end;

procedure TwMProxEmi.ilPROVEEDORCapture(Sender: TObject;
  var Show: Boolean);
begin
     Show:=True;
end;

procedure TwMProxEmi.ilPROVEEDOREjecuta(Sender: TObject);
begin
   if Objeto.Proveedor.FindKey([ilPROVEEDOR.Buffer]) then begin
        chbxProveedor.Checked:=True;
        chbxProveedor.Enabled:=True;
        InterForma1.NextTab(edID_PROVEEDOR);
   End;
end;

procedure TwMProxEmi.edID_PROVEEDORExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_PROVEEDOR,True,'',True);
end;

procedure TwMProxEmi.chbxProveedorClick(Sender: TObject);
begin
    If not chbxProveedor.Checked Then Begin
        Objeto.Proveedor.Active:=False;
        chbxProveedor.Checked:=False;
        chbxProveedor.Enabled:=False;
    End Else Begin
        chbxProveedor.Checked:=True;
        chbxProveedor.Enabled:=True;
    End;
end;

end.

