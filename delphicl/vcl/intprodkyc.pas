//------------------------------------------------------------------------------
// Función    : Producto
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 01 de Febrero del 2013
//------------------------------------------------------------------------------
Unit IntProdKYC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IntFrm,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind, UnSQL2,
  InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit, IntTipoMdoKYC;

Type
  TProdKYC = Class;

  TWProdKYC = Class(TForm)
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
    gbProducto: TGroupBox;
    lCveProd: TLabel;
    lDescProd: TLabel;
    ieCveProd: TInterEdit;
    ieDescProd: TInterEdit;
    lTipo: TLabel;
    sbMercado: TSpeedButton;
    eDescTipoProd: TEdit;
    lMercado: TLabel;
    eDescMdo: TEdit;
    ieCveMdo: TInterEdit;
    eCveTipoProd: TEdit;
    cbBCapAdic: TCheckBox;
    cbBReqTipInv: TCheckBox;
    ieNoPtosRiesgo: TInterEdit;
    lNoPtosRiesgo: TLabel;
    cbBRangos: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure sbMercadoClick(Sender: TObject);
    private
       { Private declarations }
    public
       { Public declarations }
       Objeto : TProdKYC;
    end;

  TProdKYC = class(TInterFrame)
    private
       { Private declarations }
    protected
       { Protected declarations }
    public
       { Public declarations }
       TipoMdo              : TTMdoKYC;

       Cve_Tipo_Producto    : TInterCampo;
       Cve_Mercado          : TInterCampo;
       Cve_Producto         : TInterCampo;
       Desc_Producto        : TInterCampo;
       B_Captura_Adic       : TInterCampo;
       B_Req_Tipo_Inv       : TInterCampo;
       Cve_Usuario_Alta     : TInterCampo;
       FH_Alta              : TInterCampo;
       Cve_Usuario_Modifica : TInterCampo;
       FH_Modifica          : TInterCampo;
       Num_Puntos_Riesgo    : TInterCampo;
       B_Rangos_Especiales  : TInterCampo;

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

constructor TProdKYC.Create( AOwner : TComponent );
begin
   Inherited;

   TipoMdo              := TTMdoKYC.Create(Self);
   TipoMdo.MasterSource := Self;
   TipoMdo.FieldByName('CVE_TIPO_PRODUCTO').MasterField := 'CVE_TIPO_PRODUCTO';
   TipoMdo.FieldByName('CVE_MERCADO').MasterField       := 'CVE_MERCADO';

   Cve_Tipo_Producto    := CreaCampo('CVE_TIPO_PRODUCTO',    ftString,   tsNinguno, tsNinguno, True);
   Cve_Mercado          := CreaCampo('CVE_MERCADO',          ftString,   tsNinguno, tsNinguno, True);
   Cve_Producto         := CreaCampo('CVE_PRODUCTO',         ftString,   tsNinguno, tsNinguno, True);
   Desc_Producto        := CreaCampo('DESC_PRODUCTO',        ftString,   tsNinguno, tsNinguno, True);
   B_Captura_Adic       := CreaCampo('B_CAPTURA_ADIC',       ftString,   tsNinguno, tsNinguno, True);
   B_Req_Tipo_Inv       := CreaCampo('B_REQ_TIPO_INV',       ftString,   tsNinguno, tsNinguno, True);
   Cve_Usuario_Alta     := CreaCampo('CVE_USUARIO_ALTA',     ftString,   tsNinguno, tsNinguno, True);
   FH_Alta              := CreaCampo('FH_ALTA',              ftDateTime, tsNinguno, tsNinguno, True);
   Cve_Usuario_Modifica := CreaCampo('CVE_USUARIO_MODIFICA', ftString,   tsNinguno, tsNinguno, True);
   FH_Modifica          := CreaCampo('FH_MODIFICA',          ftDateTime, tsNinguno, tsNinguno, True);
   Num_Puntos_Riesgo    := CreaCampo('NUM_PUNTOS_RIESGO',    ftInteger,  tsNinguno, tsNinguno, True);
   B_Rangos_Especiales  := CreaCampo('B_RANGOS_ESPECIALES',       ftString,   tsNinguno, tsNinguno, True);

   FKeyFields.Add('CVE_TIPO_PRODUCTO');
   FKeyFields.Add('CVE_MERCADO');
   FKeyFields.Add('CVE_PRODUCTO');

   TableName       := 'PER_PRODUCTO';
   UseQuery        := True;
   ShowMenuReporte := True;

end;

destructor TProdKYC.Destroy;
begin
   inherited;
end;

procedure TProdKYC.DataBaseChange;
begin
   inherited;
   TipoMdo.GetParams(Self);
end;

function TProdKYC.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWProdKYC;
begin
   W := TWProdKYC.Create(Self);
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

function TProdKYC.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITPRODKYC.IT', 'S,S,S');
   try
      if Active then
      begin
         T.Param(0, Cve_Tipo_Producto.AsString);
         T.Param(1, Cve_Mercado.AsString);
         T.Param(2, Cve_Producto.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1), T.DameCampo(2)]);
   finally
      T.Free;
   end;
end;

procedure TWProdKYC.sbMercadoClick(Sender: TObject);
begin
   Objeto.TipoMdo.Busca;
end;

procedure TWProdKYC.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      TipoMdo.TipoProd.Cve_Tipo_Producto.Control  := eCveTipoProd;
      TipoMdo.TipoProd.Desc_Tipo_Producto.Control := eDescTipoProd;
      TipoMdo.TipoProd.ShowMenuCatalogo           := True;
      TipoMdo.TipoProd.ShowMenuReporte            := False;
      TipoMdo.TipoProd.ShowMenuClear              := False;
      eCveTipoProd.PopupMenu                      := TipoMdo.TipoProd.PopMenu;
      TipoMdo.Cve_Mercado.Control                 := ieCveMdo;
      TipoMdo.Desc_Mercado.Control                := eDescMdo;
      TipoMdo.ShowMenuCatalogo                    := True;
      TipoMdo.ShowMenuReporte                     := False;
      TipoMdo.ShowMenuClear                       := False;
      ieCveMdo.PopupMenu                          := TipoMdo.PopMenu;
      Cve_Producto.Control                        := ieCveProd;
      Desc_Producto.Control                       := ieDescProd;
      B_Captura_Adic.Control                      := cbBCapAdic;
      B_Req_Tipo_Inv.Control                      := cbBReqTipInv;
      Cve_Usuario_Alta.Control                    := eCveUsrAlta;
      FH_Alta.Control                             := eFHAlta;
      Cve_Usuario_Modifica.Control                := eCveUsrMod;
      FH_Modifica.Control                         := eFHMod;
      Num_Puntos_Riesgo.Control                   := ieNoPtosRiesgo;
      B_Rangos_Especiales.control:= cbBRangos;
   end;
end;

procedure TWProdKYC.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      TipoMdo.TipoProd.Cve_Tipo_Producto.Control  := nil;
      TipoMdo.TipoProd.Desc_Tipo_Producto.Control := nil;
      TipoMdo.Cve_Mercado.Control                 := nil;
      TipoMdo.Desc_Mercado.Control                := nil;
      Cve_Producto.Control                        := nil;
      Desc_Producto.Control                       := nil;
      B_Captura_Adic.Control                      := nil;
      B_Req_Tipo_Inv.Control                      := nil;
      Cve_Usuario_Alta.Control                    := nil;
      FH_Alta.Control                             := nil;
      Cve_Usuario_Modifica.Control                := nil;
      FH_Modifica.Control                         := nil;
      Num_Puntos_Riesgo.Control                   := nil;
      B_Rangos_Especiales.control:= nil;
   end;
end;

procedure TWProdKYC.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
begin
   with Objeto do
      try
         InterForma1.ShowError := False;
         GetFromControl;
         if trim(TipoMdo.Cve_Mercado.AsString) = '' then
         begin
            ieCveMdo.SetFocus;
            raise EInterFrame.Create('Seleccione un Mercado');
         end;
         if trim(Cve_Producto.AsString) = '' then
         begin
            ieCveProd.SetFocus;
            raise EInterFrame.Create('Ingrese una Clave');
         end;
         if trim(Desc_Producto.AsString) = '' then
         begin
            ieDescProd.SetFocus;
            raise EInterFrame.Create('Ingrese una Descripcion');
         end;
         if IsNewData then
         begin
            if GetSQL('select * '
                    + '  from per_producto '
                    + ' where cve_tipo_producto = ' + TipoMdo.TipoProd.Cve_Tipo_Producto.AsSQL
                    + '   and cve_mercado       = ' + TipoMdo.Cve_Mercado.AsSQL
                    + '   and cve_producto      = ' + Cve_Producto.AsSQL,
                      SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('El Producto ya existe');
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

procedure TWProdKYC.InterForma1DespuesNuevo(Sender: TObject);
begin
   ieCveMdo.SetFocus;
end;

procedure TWProdKYC.InterForma1DespuesModificar(Sender: TObject);
begin
   ieDescProd.SetFocus;
end;

procedure TWProdKYC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
