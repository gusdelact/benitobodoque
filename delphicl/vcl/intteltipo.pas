//------------------------------------------------------------------------------
// Función    : Tipo de Telefono
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 10 de Octubre del 2013
//------------------------------------------------------------------------------
Unit IntTelTipo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IntFrm,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind, UnSQL2,
  InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit;

Type
  TTipoTel = Class;

  TWTelTipo = Class(TForm)
    InterForma1 : TInterForma;
    eDescripcion: TEdit;
    ieClave: TInterEdit;
    lDescripcion: TLabel;
    lClave: TLabel;
    rgExtension: TRadioGroup;
    lExtension: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesModificar(Sender: TObject);
    private
      { Private declarations }
    public
      { Public declarations }
      Objeto : TTipoTel;
    end;

  TTipoTel = class(TInterFrame)
    private
      { Private declarations }
    protected
      { Protected declarations }
    public
      { Public declarations }
      Cve_Tel_Tipo  : TInterCampo;
      Desc_Tel_Tipo : TInterCampo;
      B_Extension   : TInterCampo;

      procedure   DataBaseChange;
      function    InternalBusca : Boolean; override;
      constructor Create(AOwner : TComponent); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
      { Published declarations }
    end;
implementation
  {$R *.DFM}

constructor TTipoTel.Create(AOwner : TComponent);
begin
   Inherited;

   Cve_Tel_Tipo    := CreaCampo('CVE_TEL_TIPO',  ftString, tsNinguno, tsNinguno, True);
   Desc_Tel_Tipo   := CreaCampo('DESC_TEL_TIPO', ftString, tsNinguno, tsNinguno, True);
   B_Extension     := CreaCampo('B_EXTENSION',   ftString, tsNinguno, tsNinguno, True);
   with B_Extension do
   begin
      Size := 1;             UseCombo := True;
      ComboLista.Add('0');   ComboDatos.Add('V');
      ComboLista.Add('1');   ComboDatos.Add('F');
   end;

   TableName       := 'TEL_TIPO';
   FKeyFields.Add('CVE_TEL_TIPO');

   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TTipoTel.Destroy;
begin
   inherited;
end;

procedure TTipoTel.DataBaseChange;
begin
   inherited;
end;

function TTipoTel.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWTelTipo;
begin
   W := TWTelTipo.Create(Self);
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

function TTipoTel.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITTIPOTEL.IT', 'S');
   try
      if Active    then   T.Param(0, Cve_Tel_Tipo.AsString);
      if T.Execute then   InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

procedure TWTelTipo.FormShow(Sender: TObject);
begin
   Objeto.Cve_Tel_Tipo.Control  := ieClave;
   Objeto.Desc_Tel_Tipo.Control := eDescripcion;
   Objeto.B_Extension.Control   := rgExtension;
end;

procedure TWTelTipo.FormDestroy(Sender: TObject);
begin
   Objeto.Cve_Tel_Tipo.Control  := nil;
   Objeto.Desc_Tel_Tipo.Control := nil;
   Objeto.B_Extension.Control   := nil;
end;

procedure TWTelTipo.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
begin
   with Objeto do
      try
         InterForma1.ShowError := False;
         GetFromControl;
         if trim(Cve_Tel_Tipo.AsString) = '' then
         begin
            ieClave.SetFocus;
            raise EInterFrame.Create('Ingrese una Clave');
         end;
         if trim(Desc_Tel_Tipo.AsString) = '' then
         begin
            eDescripcion.SetFocus;
            raise EInterFrame.Create('Ingrese una Descripcion');
         end;
         if trim(B_Extension.AsString) = '' then
         begin
            rgExtension.SetFocus;
            raise EInterFrame.Create('Especifique si Requiere Extension');
         end;
         if IsNewData then
         begin
            if GetSQL('select * from tel_tipo where cve_tel_tipo = ' + Cve_Tel_Tipo.AsSQL, SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('Ya existe el Tipo de Telefono');
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

procedure TWTelTipo.InterForma1DespuesNuevo(Sender: TObject);
begin
   ieClave.SetFocus;
end;

procedure TWTelTipo.InterForma1DespuesModificar(Sender: TObject);
begin
   eDescripcion.SetFocus;
end;

procedure TWTelTipo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
