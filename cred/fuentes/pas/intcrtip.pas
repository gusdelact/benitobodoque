// Sistema         : Clase de Tipo de Crédito
// Fecha de Inicio : 7 de Abril de 1998
// Función forma   : Clase de Tipo de Crédito
// Desarrollo por  : Benjamín Hernández Delsordo
// Comentarios     :

unit IntCrTip;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, Menus, UnCrPack,
  RepCrTip;

type

  TCrTip = Class;
  TWCrTip = class(TForm)
    InterForma1: TInterForma;
    lbDescTipoCred: TLabel;
    lbTipoCuenta: TLabel;
    edCveTipoCredito: TEdit;
    edDescTipoCred: TEdit;
    edTipoCuenta: TEdit;
    lbCveTipoCredito: TLabel;
    bbReporte: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Nuevo(Sender : TObject; var Realizado : Boolean);
    procedure InterForma1Aceptar(Sender : TObject; var Realizado : Boolean);
    procedure InterForma1Cancelar(Sender : TObject; var Realizado : Boolean);
    procedure InterForma1Eliminar(Sender : TObject; var Realizado : Boolean);
    procedure InterForma1Buscar(Sender : TObject);
    procedure InterForma1Modificar(Sender : TObject;
      var Realizado : Boolean);
    procedure InterForma1Ayuda(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure bbReporteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto : TCrTip;
    procedure   Impresion(Preview: Boolean);
  end;

  TCrTip = class(TInterFrame)
  private
  protected
  public
    CVE_TIPO_CREDITO           :TInterCampo;
    DESC_TIPO_CRED             :TInterCampo;
    TIPO_CUENTA                :TInterCampo;

    Paquete                    :TCrPack;

    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    procedure   DataBaseChange; override;
  published
  end;

implementation

{$R *.DFM}

constructor TCrTip.Create( AOwner : TComponent );
begin
   inherited Create(AOwner);
   CVE_TIPO_CREDITO           :=CreaCampo('CVE_TIPO_CREDITO',ftInteger,tsNinguno,tsNinguno,True);
   DESC_TIPO_CRED             :=CreaCampo('DESC_TIPO_CRED',ftString,tsNinguno,tsNinguno,True);
   TIPO_CUENTA                :=CreaCampo('TIPO_CUENTA',ftInteger,tsNinguno,tsNinguno,True);

   Paquete := TCrPack.Create(Self);

   FKeyFields.Add('CVE_TIPO_CREDITO');
   TableName := 'CRE_TIPO_CREDITO';
   UseQuery := True;
   HelpFile := 'IntCrTip.hlp';
   ShowMenuReporte := True;
end;

destructor TCrTip.Destroy;
begin
  if Paquete <> nil then Paquete.Free;
  inherited;
end;

procedure TCrTip.DataBaseChange;
begin
  Paquete.Apli := Apli;
end;

function TCrTip.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrTip;
begin
   W:=TWCrTip.Create(Self);
   try
      W.Objeto:= Self;
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

Function TCrTip.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IntCrTip.it','S,S');
   try
      if Active then T.Param(0,CVE_TIPO_CREDITO.AsString);
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
      {end-if}
      finally
         T.Free;
      end;
end;

procedure TWCrTip.impresion(Preview: Boolean);
//var sql:String;
begin
//  case rgOpcion.ItemIndex of {VALIDACION DE LAS OPCIONES}
//    0 : begin {Objeto.Condicion1.as<Tipo> := <valor>;}
//        end;
//  end;
  ExecRepCrTip(Objeto, Preview);
end;

procedure TWCrTip.FormShow(Sender: TObject);
begin
   Objeto.CVE_TIPO_CREDITO.Control := edCveTipoCredito;
   Objeto.DESC_TIPO_CRED.Control := edDescTipoCred;
   Objeto.TIPO_CUENTA.Control := edTipoCuenta;
end;

procedure TWCrTip.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_TIPO_CREDITO.Control := nil;
   Objeto.DESC_TIPO_CRED.Control := nil;
   Objeto.TIPO_CUENTA.Control := nil;
end;

procedure TWCrTip.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrTip.InterForma1Nuevo(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Append;
   Realizado := True;
end;

procedure TWCrTip.InterForma1Aceptar(Sender: TObject;  var Realizado: Boolean);
begin
  Realizado := False;
  Objeto.Post;
  Realizado := True;
end;

procedure TWCrTip.InterForma1Cancelar(Sender: TObject; var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Cancel;
   Realizado := True;
end;

procedure TWCrTip.InterForma1Eliminar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado:=False;
   Objeto.Delete;
   Realizado:=True;
end;

procedure TWCrTip.InterForma1Buscar(Sender: TObject);
begin
   Objeto.Busca;
end;

procedure TWCrTip.InterForma1Modificar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Edit;
   Realizado := True;
end;

procedure TWCrTip.InterForma1Ayuda(Sender: TObject);
begin
   Objeto.Help;
end;

procedure TWCrTip.InterForma1DespuesNuevo(Sender: TObject);
begin
  Objeto.CVE_TIPO_CREDITO.AsInteger := Objeto.Paquete.DameFolio(foTipoCred);
  edDescTipoCred.SetFocus;
end;

procedure TWCrTip.InterForma1DespuesModificar(Sender: TObject);
begin
  edDescTipoCred.SetFocus;
end;

procedure TWCrTip.bbReporteClick(Sender: TObject);
begin
  Impresion(True);
end;

end.



