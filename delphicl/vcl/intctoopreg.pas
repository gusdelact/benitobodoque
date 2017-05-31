//------------------------------------------------------------------------------
// Función    : Registro de Operacion por Contrato
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 15 de Febrero del 2013
//------------------------------------------------------------------------------
Unit IntCtoOpReg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind,
  UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit,
  IntCtoOpTipo,   // Tipo
  IntCtoOpClasif, // Clasificacion
  IntCtoOpRango,  // Rango
  IntProdKYC;     // Producto

Type
  TCtoOpReg = Class;

  TWCtoOpReg = Class(TForm)
    InterForma1 : TInterForma;
    lPuntosRiesgo: TLabel;
    ieNumPunRiesgo: TInterEdit;
    ieCveTipoOp: TInterEdit;
    eCveGpoOp: TEdit;
    lGrupo: TLabel;
    lTipo: TLabel;
    eDescGpoOp: TEdit;
    sbTipo: TSpeedButton;
    eDescTipoOp: TEdit;
    lClasificacion: TLabel;
    ieCveClasifOp: TInterEdit;
    sbClasificacion: TSpeedButton;
    eDescClasifOp: TEdit;
    lRango: TLabel;
    ieCveRangoOp: TInterEdit;
    sbRango: TSpeedButton;
    ieDescRangoOp: TEdit;
    rgPerJuridica: TRadioGroup;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    btnProducto: TSpeedButton;
    edCveTipoProducto: TInterEdit;
    edDescProducto: TEdit;
    edCveMercado: TInterEdit;
    edCveProducto: TInterEdit;
    Label2: TLabel;
    Label3: TLabel;
    edDescTipoProducto: TEdit;
    edDescMercado: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbTipoClick(Sender: TObject);
    procedure sbClasificacionClick(Sender: TObject);
    procedure sbRangoClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure btnProductoClick(Sender: TObject);
    private
       { Private declarations }
    public
       { Public declarations }
       Objeto : TCtoOpReg;
    end;

  TCtoOpReg = class(TInterFrame)
    private
       { Private declarations }
    protected
       { Protected declarations }
    public
       { Public declarations }
       Tipo          : TCtoOpTipo;
       Clasificacion : TCtoOpClas;
       Rango         : TCtoOpRan;
       Producto: TProdKYC;

       Cve_Tipo_Operacion   : TInterCampo;
       Cve_Clasif_Operacion : TInterCampo;
       Cve_Rango_Operacion  : TInterCampo;
       Num_Puntos_Riesgo    : TInterCampo;
       Cve_Per_juridica     : TInterCampo;
       Cve_Tipo_Producto    : TInterCampo;
       Cve_Mercado          : TInterCampo;
       Cve_Producto         : TInterCampo;

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

constructor TCtoOpReg.Create( AOwner : TComponent );
begin
   Inherited;

   Tipo              := TCtoOpTipo.Create(Self);
   Tipo.MasterSource := Self;
   Tipo.FieldByName('CVE_TIPO_OPERACION').MasterField := 'CVE_TIPO_OPERACION';

   Clasificacion              := TCtoOpClas.Create(Self);
   Clasificacion.MasterSource := Self;
   Clasificacion.FieldByName('CVE_CLASIF_OPERACION').MasterField := 'CVE_CLASIF_OPERACION';

   Rango              := TCtoOpRan.Create(Self);
   Rango.MasterSource := Self;
   Rango.FieldByName('CVE_RANGO_OPERACION').MasterField := 'CVE_RANGO_OPERACION';

   Producto:= TProdKYC.Create(Self);
   Producto.MasterSource:= Self;
   Producto.FieldByName('CVE_TIPO_PRODUCTO').MasterField := 'CVE_TIPO_PRODUCTO';
   Producto.FieldByName('CVE_MERCADO').MasterField := 'CVE_MERCADO';
   Producto.FieldByName('CVE_PRODUCTO').MasterField := 'CVE_PRODUCTO';
   producto.FilterString:= '( (PER_PRODUCTO.B_RANGOS_ESPECIALES = ''V'') OR ' +
    '(PER_PRODUCTO.CVE_TIPO_PRODUCTO = ''PGFI'' AND ' +
    ' PER_PRODUCTO.CVE_MERCADO = ''PGFI'' AND ' +
    ' PER_PRODUCTO.CVE_PRODUCTO = ''PGFI'') )';
   producto.BuscaWhereString:= producto.FilterString;

   Cve_Tipo_Operacion   := CreaCampo('CVE_TIPO_OPERACION',   ftString,  tsNinguno, tsNinguno, True);
   Cve_Clasif_Operacion := CreaCampo('CVE_CLASIF_OPERACION', ftString,  tsNinguno, tsNinguno, True);
   Cve_Rango_Operacion  := CreaCampo('CVE_RANGO_OPERACION',  ftString,  tsNinguno, tsNinguno, True);
   Num_Puntos_Riesgo    := CreaCampo('NUM_PUNTOS_RIESGO',    ftInteger, tsNinguno, tsNinguno, True);
   Cve_Per_juridica     := CreaCampo('CVE_PER_JURIDICA',     ftString,  tsNinguno, tsNinguno, True);
   with Cve_Per_juridica do
   begin
      Size     := 2;
      UseCombo := True;
      ComboLista.Add('0');   ComboDatos.Add('PF');
      ComboLista.Add('1');   ComboDatos.Add('PM');
   end;

   Cve_Tipo_Producto:= CreaCampo('CVE_TIPO_PRODUCTO', ftString,  tsNinguno, tsNinguno, True);
   Cve_Mercado:= CreaCampo('CVE_MERCADO', ftString,  tsNinguno, tsNinguno, True);
   Cve_Producto:= CreaCampo('CVE_PRODUCTO', ftString,  tsNinguno, tsNinguno, True);

   FKeyFields.Add('CVE_TIPO_OPERACION');
   FKeyFields.Add('CVE_CLASIF_OPERACION');
   FKeyFields.Add('CVE_RANGO_OPERACION');
   FKeyFields.Add('CVE_TIPO_PRODUCTO');
   FKeyFields.Add('CVE_MERCADO');
   FKeyFields.Add('CVE_PRODUCTO');

   TableName       := 'CTO_OPERACION_REG';
   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TCtoOpReg.Destroy;
begin
   inherited;
end;

procedure TCtoOpReg.DataBaseChange;
begin
   inherited;
   Tipo.GetParams(Self);
   Clasificacion.GetParams(Self);
   Rango.GetParams(Self);
   Producto.getParams(Self);
end;

function TCtoOpReg.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWCtoOpReg;
begin
   W := TWCtoOpReg.Create(Self);
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

function TCtoOpReg.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITCTOOPREG.IT', 'S,S,S,S,S,S');
   try
      if Active then
      begin
         T.Param(0, Tipo.Cve_Tipo_Operacion.AsString);
         T.Param(1, Clasificacion.Cve_Clasif_Operacion.AsString);
         T.Param(2, Rango.Cve_Rango_Operacion.AsString);
         T.Param(3, Cve_Tipo_Producto.AsString);
         T.Param(4, Cve_Mercado.AsString);
         T.Param(5, Cve_Producto.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1), T.DameCampo(2), T.DameCampo(3), T.DameCampo(4), T.DameCampo(5)]);
   finally
      T.Free;
   end;
end;

procedure TWCtoOpReg.sbTipoClick(Sender: TObject);
begin
   Objeto.Tipo.Busca;
end;

procedure TWCtoOpReg.sbClasificacionClick(Sender: TObject);
begin
   Objeto.Clasificacion.Busca;
end;

procedure TWCtoOpReg.sbRangoClick(Sender: TObject);
begin
   Objeto.Rango.Busca;
end;

procedure TWCtoOpReg.btnProductoClick(Sender: TObject);
begin objeto.producto.busca;
end;

procedure TWCtoOpReg.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Tipo.Grupo.Cve_Grupo_Operacion.Control      := eCveGpoOp;
      Tipo.Grupo.Desc_Grupo_Operacion.Control     := eDescGpoOp;
      Tipo.Grupo.ShowMenuCatalogo                 := True;
      Tipo.Grupo.ShowMenuReporte                  := False;
      Tipo.Grupo.ShowMenuClear                    := False;
      eCveGpoOp.PopupMenu                         := Tipo.Grupo.PopMenu;
      Tipo.Cve_Tipo_Operacion.Control             := ieCveTipoOp;
      Tipo.Desc_Tipo_Operacion.Control            := eDescTipoOp;
      Tipo.ShowMenuCatalogo                       := True;
      Tipo.ShowMenuReporte                        := False;
      Tipo.ShowMenuClear                          := False;
      ieCveTipoOp.PopupMenu                       := Tipo.PopMenu;
      Clasificacion.Cve_Clasif_Operacion.Control  := ieCveClasifOp;
      Clasificacion.Desc_Clasif_Operacion.Control := eDescClasifOp;
      Clasificacion.ShowMenuCatalogo              := True;
      Clasificacion.ShowMenuReporte               := False;
      Clasificacion.ShowMenuClear                 := False;
      ieCveClasifOp.PopupMenu                     := Clasificacion.PopMenu;
      Rango.Cve_Rango_Operacion.Control           := ieCveRangoOp;
      Rango.Desc_Rango_Operacion.Control          := ieDescRangoOp;
      Rango.ShowMenuCatalogo                      := True;
      Rango.ShowMenuReporte                       := False;
      Rango.ShowMenuClear                         := False;
      ieCveRangoOp.PopupMenu                      := Rango.PopMenu;
      Num_Puntos_Riesgo.Control                   := ieNumPunRiesgo;
      Cve_Per_Juridica.Control                    := rgPerJuridica;

      cve_Tipo_Producto.control:= edCveTipoProducto;
      cve_Mercado.control:= edCveMercado;
      cve_Producto.control:= edCveProducto;
      Producto.Desc_Producto.control:= edDescProducto;
      Producto.TipoMdo.TipoProd.Desc_Tipo_Producto.control:= edDescTipoProducto;
      Producto.TipoMdo.Desc_Mercado.control:= edDescMercado;
   end;
end;

procedure TWCtoOpReg.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Tipo.Grupo.Cve_Grupo_Operacion.Control      := nil;
      Tipo.Grupo.Desc_Grupo_Operacion.Control     := nil;
      Tipo.Cve_Tipo_Operacion.Control             := nil;
      Tipo.Desc_Tipo_Operacion.Control            := nil;
      Clasificacion.Cve_Clasif_Operacion.Control  := nil;
      Clasificacion.Desc_Clasif_Operacion.Control := nil;
      Rango.Cve_Rango_Operacion.Control           := nil;
      Rango.Desc_Rango_Operacion.Control          := nil;
      Num_Puntos_Riesgo.Control                   := nil;
      Cve_Per_Juridica.Control                    := nil;

      cve_Tipo_Producto.control:= nil;
      cve_Mercado.control:= nil;
      cve_Producto.control:= nil;
      Producto.Desc_Producto.control:= nil;
      Producto.TipoMdo.TipoProd.Desc_Tipo_Producto.control:= nil;
      Producto.TipoMdo.Desc_Mercado.control:= nil;
   end;
end;

procedure TWCtoOpReg.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
begin
   with Objeto do
      try
         InterForma1.ShowError := False;
         GetFromControl;
         if trim(Tipo.Cve_Tipo_Operacion.AsString) = '' then
         begin
            ieCveTipoOp.SetFocus;
            raise EInterFrame.Create('Seleccione un Tipo');
         end;
         if trim(Clasificacion.Cve_Clasif_Operacion.AsString) = '' then
         begin
            ieCveClasifOp.SetFocus;
            raise EInterFrame.Create('Seleccione una Clasificacion');
         end;
         if trim(Rango.Cve_Rango_Operacion.AsString) = '' then
         begin
            ieCveRangoOp.SetFocus;
            raise EInterFrame.Create('Seleccione un Rango');
         end;

         if not producto.active then raise EInterFrame.create('Revise que exista un producto seleccioado');


         if IsNewData then
         begin
            if GetSQL('select * '
                    + '  from cto_operacion_reg '
                    + ' where cve_tipo_operacion   = ' + Tipo.Cve_Tipo_Operacion.AsSQL
                    + '   and cve_clasif_operacion = ' + Clasificacion.Cve_Clasif_Operacion.AsSQL
                    + '   and cve_rango_operacion  = ' + Rango.Cve_Rango_Operacion.AsSQL
                    + '   and cve_tipo_producto  = ' + Cve_Tipo_producto.AsSQL
                    + '   and cve_mercado  = ' + cve_mercado.AsSQL
                    + '   and cve_producto  = ' + cve_producto.AsSQL,
                      SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('El Registro de Operacion por Contrato ya existe');
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

procedure TWCtoOpReg.InterForma1DespuesNuevo(Sender: TObject);
begin
   ieCveTipoOp.SetFocus;
   rgPerJuridica.ItemIndex := 0;
end;

procedure TWCtoOpReg.InterForma1DespuesModificar(Sender: TObject);
begin
   ieNumPunRiesgo.SetFocus;
end;

procedure TWCtoOpReg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;


end.
