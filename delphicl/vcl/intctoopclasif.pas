//------------------------------------------------------------------------------
// Función    : Clasificacion de Operacion por Contrato
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 15 de Febrero del 2013
//------------------------------------------------------------------------------
Unit IntCtoOpClasif;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit;

Type
  TCtoOpClas = Class;

  TWCtoOpClas = Class(TForm)
    InterForma1 : TInterForma;
    lClave: TLabel;
    lDescripcion: TLabel;
    ieDescClasifOp: TInterEdit;
    ieCveClasifOp: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
       { Private declarations }
    public
       { Public declarations }
       Objeto : TCtoOpClas;
    end;

  TCtoOpClas = class(TInterFrame)
    private
       { Private declarations }
    protected
       { Protected declarations }
    public
       { Public declarations }
       Cve_Clasif_Operacion  : TInterCampo;
       Desc_Clasif_Operacion : TInterCampo;

       procedure   DataBaseChange;
       function    InternalBusca : Boolean; override;
       constructor Create( AOwner : TComponent ); override;
       destructor  Destroy; override;
       function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
       { Published declarations }
    end;
implementation
   {$R *.DFM}

constructor TCtoOpClas.Create( AOwner : TComponent );
begin
   Inherited;

   Cve_Clasif_Operacion  := CreaCampo('CVE_CLASIF_OPERACION',  ftString, tsNinguno, tsNinguno, True);
   Desc_Clasif_Operacion := CreaCampo('DESC_CLASIF_OPERACION', ftString, tsNinguno, tsNinguno, True);

   FKeyFields.Add('CVE_CLASIF_OPERACION');

   TableName       := 'CTO_OPERACION_CLASIF';
   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TCtoOpClas.Destroy;
begin
   inherited;
end;

procedure TCtoOpClas.DataBaseChange;
begin
   inherited;
end;

function TCtoOpClas.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWCtoOpClas;
begin
   W := TWCtoOpClas.Create(Self);
   try
      W.Objeto                    := Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := FormaTipo;
      W.InterForma1.ShowBtnAyuda  := False;
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow                  := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

function TCtoOpClas.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITCTOOPCLASIF.IT', 'S');
   try
      if Active    then   T.Param(0, Cve_Clasif_Operacion.AsString);
      if T.Execute then   InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

procedure TWCtoOpClas.FormShow(Sender: TObject);
begin
   Objeto.Cve_Clasif_Operacion.Control  := ieCveClasifOp;
   Objeto.Desc_Clasif_Operacion.Control := ieDescClasifOp;
end;

procedure TWCtoOpClas.FormDestroy(Sender: TObject);
begin
   Objeto.Cve_Clasif_Operacion.Control  := nil;
   Objeto.Desc_Clasif_Operacion.Control := nil;
end;

procedure TWCtoOpClas.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
begin
   with Objeto do
      try
         InterForma1.ShowError := False;
         GetFromControl;
         if trim(Cve_Clasif_Operacion.AsString) = '' then
         begin
            ieCveClasifOp.SetFocus;
            raise EInterFrame.Create('Ingrese una Clave');
         end;
         if trim(Desc_Clasif_Operacion.AsString) = '' then
         begin
            ieDescClasifOp.SetFocus;
            raise EInterFrame.Create('Ingrese una Descripcion');
         end;
         if IsNewData then
         begin
            if GetSQL('select * '
                    + '  from cto_operacion_clasif '
                    + ' where cve_clasif_operacion = ' + Cve_Clasif_Operacion.AsSQL,
                      SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('La Clasificacion de Operacion por Contrato ya existe');
         end;
         Realizado := True;
      except
         on e: EInterFrame do
         begin
            MessageDlg(e.Message, mtInformation, [mbOK], 0);
            Realizado := False;
         end;
      end;
end;

procedure TWCtoOpClas.InterForma1DespuesNuevo(Sender: TObject);
begin
   ieCveClasifOp.SetFocus;
end;

procedure TWCtoOpClas.InterForma1DespuesModificar(Sender: TObject);
begin
   ieDescClasifOp.SetFocus;
end;

procedure TWCtoOpClas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
