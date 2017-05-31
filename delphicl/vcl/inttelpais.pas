//------------------------------------------------------------------------------
// Función    : Telefono Pais
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 10 de Octubre del 2013
//------------------------------------------------------------------------------
Unit IntTelPais;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IntFrm,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind, UnSQL2,
  InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit, UnFunProcICB, IntPob;

Type
  TTelPais = Class;

  TWTelPais = Class(TForm)
    InterForma1 : TInterForma;
    eDescPais: TEdit;
    sbPais: TSpeedButton;
    ieCvePais: TInterEdit;
    lPais: TLabel;
    lPrefijo: TLabel;
    iePrefijo: TInterEdit;
    lCodigo: TLabel;
    ieCodigo: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbPaisClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
      { Private declarations }
    public
      { Public declarations }
      Objeto : TTelPais;
    end;

  TTelPais = class(TInterFrame)
    private
      { Private declarations }
    protected
      { Protected declarations }
    public
      { Public declarations }
      Pais : TPoblacion;

      Cve_Poblac_Pais : TInterCampo;
      Prefijo_Pais    : TInterCampo;
      Codigo_Pais     : TInterCampo;

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

constructor TTelPais.Create(AOwner : TComponent);
begin
   Inherited;

   Pais                  := TPoblacion.Create(Self);
   Pais.MasterSource     := Self;
   Pais.FieldByName('CVE_POBLACION').MasterField := 'CVE_POBLAC_PAIS';
   Pais.BuscaWhereString := 'TIPO_POBLACION.CVE_TIPO_POBLAC = ' + QuotedStr(cPais);

   Cve_Poblac_Pais := CreaCampo('CVE_POBLAC_PAIS', ftString,  tsNinguno, tsNinguno, True);
   Prefijo_Pais    := CreaCampo('PREFIJO_PAIS',    ftString,  tsNinguno, tsNinguno, True);
   Codigo_Pais     := CreaCampo('CODIGO_PAIS',     ftString,  tsNinguno, tsNinguno, True);

   TableName       := 'TEL_PAIS';
   FKeyFields.Add('CVE_POBLAC_PAIS');

   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TTelPais.Destroy;
begin
   inherited;
end;

procedure TTelPais.DataBaseChange;
begin
   inherited;
   Pais.GetParams(Self);
end;

function TTelPais.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWTelPais;
begin
   W := TWTelPais.Create(Self);
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

function TTelPais.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITTELPAIS.IT', 'S');
   try
      if Active    then   T.Param(0, Pais.Cve_Poblacion.AsString);
      if T.Execute then   InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

procedure TWTelPais.sbPaisClick(Sender: TObject);
begin
   Objeto.Pais.Busca;
end;

procedure TWTelPais.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Pais.Cve_Poblacion.Control  := ieCvePais;
      Pais.Desc_Poblacion.Control := eDescPais;
      Pais.ShowMenuCatalogo       := True;
      Pais.ShowMenuReporte        := False;
      Pais.ShowMenuClear          := False;
      ieCvePais.PopupMenu         := Pais.PopMenu;
      Prefijo_Pais.Control        := iePrefijo;
      Codigo_Pais.Control         := ieCodigo;
   end;
end;

procedure TWTelPais.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Pais.Cve_Poblacion.Control  := nil;
      Pais.Desc_Poblacion.Control := nil;
      Prefijo_Pais.Control        := nil;
      Codigo_Pais.Control         := nil;
   end;
end;

procedure TWTelPais.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
begin
   with Objeto do
      try
         InterForma1.ShowError := False;
         GetFromControl;
         if trim(Pais.Cve_Poblacion.AsString) = '' then
         begin
            ieCvePais.SetFocus;
            raise EInterFrame.Create('Seleccione un Pais');
         end;
         if trim(Prefijo_Pais.AsString) = '' then
         begin
            iePrefijo.SetFocus;
            raise EInterFrame.Create('Ingrese un Prefijo');
         end;
         if IsNewData then
         begin
            if GetSQL('select * from tel_pais where cve_poblac_pais = ' + Pais.Cve_Poblacion.AsSQL, SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('Ya existe el Telefono Pais');
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

procedure TWTelPais.InterForma1DespuesNuevo(Sender: TObject);
begin
   ieCvePais.SetFocus;
end;

procedure TWTelPais.InterForma1DespuesModificar(Sender: TObject);
begin
   iePrefijo.SetFocus;
end;

procedure TWTelPais.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
