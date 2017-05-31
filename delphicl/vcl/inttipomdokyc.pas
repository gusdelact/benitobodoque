//------------------------------------------------------------------------------
// Función    : Tipo de Mercado
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 01 de Febrero del 2013
//------------------------------------------------------------------------------
Unit IntTipoMdoKYC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IntFrm,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind, UnSQL2,
  InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit, IntTipoProdKYC;

Type
  TTMdoKYC = Class;

  TWTipoMdoKYC = Class(TForm)
    InterForma1 : TInterForma;
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
    gbMercado: TGroupBox;
    lCveMdo: TLabel;
    lDescMdo: TLabel;
    ieCveMdo: TInterEdit;
    ieDescMdo: TInterEdit;
    lCveTipoProd: TLabel;
    sbTipoMdo: TSpeedButton;
    eDescTipoProd: TEdit;
    ieCveTipoProd: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure sbTipoMdoClick(Sender: TObject);
    private
       { Private declarations }
    public
       { Public declarations }
       Objeto : TTMdoKYC;
    end;

  TTMdoKYC = class(TInterFrame)
    private
       { Private declarations }
    protected
       { Protected declarations }
    public
       { Public declarations }
       TipoProd             : TTProdKYC;

       Cve_Tipo_Producto    : TInterCampo;
       Cve_Mercado          : TInterCampo;
       Desc_Mercado         : TInterCampo;
       Cve_Usuario_Alta     : TInterCampo;
       FH_Alta              : TInterCampo;
       Cve_Usuario_Modifica : TInterCampo;
       FH_Modifica          : TInterCampo;

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

constructor TTMdoKYC.Create( AOwner : TComponent );
begin
   Inherited;

   TipoProd              := TTProdKYC.Create(Self);
   TipoProd.MasterSource := Self;
   TipoProd.FieldByName('CVE_TIPO_PRODUCTO').MasterField := 'CVE_TIPO_PRODUCTO';

   Cve_Tipo_Producto    := CreaCampo('CVE_TIPO_PRODUCTO',    ftString,   tsNinguno, tsNinguno, True);
   Cve_Mercado          := CreaCampo('CVE_MERCADO',          ftString,   tsNinguno, tsNinguno, True);
   Desc_Mercado         := CreaCampo('DESC_MERCADO',         ftString,   tsNinguno, tsNinguno, True);
   Cve_Usuario_Alta     := CreaCampo('CVE_USUARIO_ALTA',     ftString,   tsNinguno, tsNinguno, True);
   FH_Alta              := CreaCampo('FH_ALTA',              ftDateTime, tsNinguno, tsNinguno, True);
   Cve_Usuario_Modifica := CreaCampo('CVE_USUARIO_MODIFICA', ftString,   tsNinguno, tsNinguno, True);
   FH_Modifica          := CreaCampo('FH_MODIFICA',          ftDateTime, tsNinguno, tsNinguno, True);

   FKeyFields.Add('CVE_TIPO_PRODUCTO');
   FKeyFields.Add('CVE_MERCADO');

   TableName       := 'PER_TIPO_MERCADO';
   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TTMdoKYC.Destroy;
begin
   inherited;
end;

procedure TTMdoKYC.DataBaseChange;
begin
   inherited;
   TipoProd.GetParams(Self);
end;

function TTMdoKYC.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWTipoMdoKYC;
begin
   W := TWTipoMdoKYC.Create(Self);
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

function TTMdoKYC.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITTMDOKYC.IT', 'S,S');
   try
      if Active then
      begin
         T.Param(0, Cve_Tipo_Producto.AsString);
         T.Param(1, Cve_Mercado.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1)]);
   finally
      T.Free;
   end;
end;

procedure TWTipoMdoKYC.sbTipoMdoClick(Sender: TObject);
begin
   Objeto.TipoProd.Busca;
end;

procedure TWTipoMdoKYC.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      TipoProd.Cve_Tipo_Producto.Control  := ieCveTipoProd;
      TipoProd.Desc_Tipo_Producto.Control := eDescTipoProd;
      TipoProd.ShowMenuCatalogo           := True;
      TipoProd.ShowMenuReporte            := False;
      TipoProd.ShowMenuClear              := False;
      ieCveTipoProd.PopupMenu             := TipoProd.PopMenu;
      Cve_Mercado.Control                 := ieCveMdo;
      Desc_Mercado.Control                := ieDescMdo;
      Cve_Usuario_Alta.Control            := eCveUsrAlta;
      FH_Alta.Control                     := eFHAlta;
      Cve_Usuario_Modifica.Control        := eCveUsrMod;
      FH_Modifica.Control                 := eFHMod;
   end;
end;

procedure TWTipoMdoKYC.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      TipoProd.Cve_Tipo_Producto.Control  := nil;
      TipoProd.Desc_Tipo_Producto.Control := nil;
      Cve_Mercado.Control                 := nil;
      Desc_Mercado.Control                := nil;
      Cve_Usuario_Alta.Control            := nil;
      FH_Alta.Control                     := nil;
      Cve_Usuario_Modifica.Control        := nil;
      FH_Modifica.Control                 := nil;
   end;
end;

procedure TWTipoMdoKYC.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
begin
   with Objeto do
      try
         InterForma1.ShowError := False;
         GetFromControl;
         if trim(TipoProd.Cve_Tipo_Producto.AsString) = '' then
         begin
            ieCveTipoProd.SetFocus;
            raise EInterFrame.Create('Seleccione un Tipo');
         end;
         if trim(Cve_Mercado.AsString) = '' then
         begin
            ieCveMdo.SetFocus;
            raise EInterFrame.Create('Ingrese una Clave');
         end;
         if trim(Desc_Mercado.AsString) = '' then
         begin
            ieDescMdo.SetFocus;
            raise EInterFrame.Create('Ingrese una Descripcion');
         end;
         if IsNewData then
         begin
            if GetSQL('select * '
                    + '  from per_tipo_mercado '
                    + ' where cve_tipo_producto = ' + TipoProd.Cve_Tipo_Producto.AsSQL
                    + '   and cve_mercado       = ' + Cve_Mercado.AsSQL,
                      SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('El Tipo de Mercado ya existe');
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

procedure TWTipoMdoKYC.InterForma1DespuesNuevo(Sender: TObject);
begin
   ieCveTipoProd.SetFocus;
end;

procedure TWTipoMdoKYC.InterForma1DespuesModificar(Sender: TObject);
begin
   ieCveTipoProd.SetFocus;
end;

procedure TWTipoMdoKYC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
