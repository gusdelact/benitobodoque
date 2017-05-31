//------------------------------------------------------------------------------
// Función    : Tipo de Producto
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 01 de Febrero del 2013
//------------------------------------------------------------------------------
Unit IntTipoProdKYC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind,
  UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit, IntEmpre;

Type
  TTProdKYC = Class;

  TWTipoProdKYC = Class(TForm)
    InterForma1 : TInterForma;
    lCveTipoProd: TLabel;
    lDescTipoProd: TLabel;
    ieDescTipoProd: TInterEdit;
    ieCveTipoProd: TInterEdit;
    gbAlta: TGroupBox;
    lCveUsrAlta: TLabel;
    lFHAlta: TLabel;
    eCveUsrAlta: TEdit;
    eFHAlta: TEdit;
    gbModifica: TGroupBox;
    lCveUsrMod: TLabel;
    lFHMod: TLabel;
    eCveUsrMod: TEdit;
    eFHMod: TEdit;
    lEmpresa: TLabel;
    sbEmpresa: TSpeedButton;
    edNomEmpresa: TEdit;
    ieIdEmpresa: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure sbEmpresaClick(Sender: TObject);
    private
       { Private declarations }
    public
       { Public declarations }
       Objeto : TTProdKYC;
    end;

  TTProdKYC = class(TInterFrame)
    private
       { Private declarations }
    protected
       { Protected declarations }
    public
       { Public declarations }
       Empresa : TEmpresa;

       Cve_Tipo_Producto    : TInterCampo;
       Desc_Tipo_Producto   : TInterCampo;
       Cve_Usuario_Alta     : TInterCampo;
       FH_Alta              : TInterCampo;
       Cve_Usuario_Modifica : TInterCampo;
       FH_Modifica          : TInterCampo;
       Id_Empresa           : TInterCampo;

       procedure    DataBaseChange;
       function     InternalBusca : Boolean; override;
       constructor  Create( AOwner : TComponent ); override;
       destructor   Destroy; override;
       function     ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
       { Published declarations }
    end;
implementation
   {$R *.DFM}

constructor TTProdKYC.Create( AOwner : TComponent );
begin
   Inherited;

   Empresa              := TEmpresa.Create(Self);
   Empresa.MasterSource := Self;
   Empresa.FieldByName('ID_EMPRESA').MasterField := 'ID_EMPRESA';

   Cve_Tipo_Producto    := CreaCampo('CVE_TIPO_PRODUCTO',    ftString,   tsNinguno, tsNinguno, True);
   Desc_Tipo_Producto   := CreaCampo('DESC_TIPO_PRODUCTO',   ftString,   tsNinguno, tsNinguno, True);
   Cve_Usuario_Alta     := CreaCampo('CVE_USUARIO_ALTA',     ftString,   tsNinguno, tsNinguno, True);
   FH_Alta              := CreaCampo('FH_ALTA',              ftDateTime, tsNinguno, tsNinguno, True);
   Cve_Usuario_Modifica := CreaCampo('CVE_USUARIO_MODIFICA', ftString,   tsNinguno, tsNinguno, True);
   FH_Modifica          := CreaCampo('FH_MODIFICA',          ftDateTime, tsNinguno, tsNinguno, True);
   Id_Empresa           := CreaCampo('ID_EMPRESA',           ftInteger,  tsNinguno, tsNinguno, True);

   FKeyFields.Add('CVE_TIPO_PRODUCTO');

   TableName       := 'PER_TIPO_PRODUCTO';
   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TTProdKYC.Destroy;
begin
   inherited;
end;

procedure TTProdKYC.DataBaseChange;
begin
   inherited;
   Empresa.GetParams(Self);
end;

function TTProdKYC.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWTipoProdKYC;
begin
   W := TWTipoProdKYC.Create(Self);
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

function TTProdKYC.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITTPRODKYC.IT', 'S');
   try
      if Active    then   T.Param(0, Cve_Tipo_Producto.AsString);
      if T.Execute then   InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

procedure TWTipoProdKYC.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Cve_Tipo_Producto.Control               := ieCveTipoProd;
      Desc_Tipo_Producto.Control              := ieDescTipoProd;
      Cve_Usuario_Alta.Control                := eCveUsrAlta;
      FH_Alta.Control                         := eFHAlta;
      Cve_Usuario_Modifica.Control            := eCveUsrMod;
      FH_Modifica.Control                     := eFHMod;
      Empresa.PersonaMoral.ID_Persona.Control := ieIdEmpresa;
      Empresa.PersonaMoral.Nombre.Control     := edNomEmpresa;
   end;
end;

procedure TWTipoProdKYC.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Cve_Tipo_Producto.Control               := nil;
      Desc_Tipo_Producto.Control              := nil;
      Cve_Usuario_Alta.Control                := nil;
      FH_Alta.Control                         := nil;
      Cve_Usuario_Modifica.Control            := nil;
      FH_Modifica.Control                     := nil;
      Empresa.PersonaMoral.ID_Persona.Control := nil;
      Empresa.PersonaMoral.Nombre.Control     := nil;
   end;
end;

procedure TWTipoProdKYC.sbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.Busca;
end;

procedure TWTipoProdKYC.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
begin
   with Objeto do
      try
         InterForma1.ShowError := False;
         GetFromControl;
         if Empresa.PersonaMoral.ID_Persona.AsInteger <= 0 then
         begin
            ieIdEmpresa.SetFocus;
            raise EInterFrame.Create('Seleccione una Empresa');
         end;
         if trim(Cve_Tipo_Producto.AsString) = '' then
         begin
            ieCveTipoProd.SetFocus;
            raise EInterFrame.Create('Ingrese una Clave');
         end;
         if trim(Desc_Tipo_Producto.AsString) = '' then
         begin
            ieDescTipoProd.SetFocus;
            raise EInterFrame.Create('Ingrese una Descripcion');
         end;
         if IsNewData then
         begin
            if GetSQL('select * '
                    + '  from per_tipo_producto '
                    + ' where cve_tipo_producto = ' + Cve_Tipo_Producto.AsSQL,
                      SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('El Tipo de Producto ya existe');
            Cve_Usuario_Alta.AsString     := DameUsuario;
            FH_Alta.AsDateTime            := Now;
         end
         else
         begin
            Cve_Usuario_Modifica.AsString := DameUsuario;
            FH_Modifica.AsDateTime        := Now;
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

procedure TWTipoProdKYC.InterForma1DespuesNuevo(Sender: TObject);
begin
   ieIdEmpresa.SetFocus;
end;

procedure TWTipoProdKYC.InterForma1DespuesModificar(Sender: TObject);
begin
   ieDescTipoProd.SetFocus;
end;

procedure TWTipoProdKYC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
