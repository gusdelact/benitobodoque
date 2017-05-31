//------------------------------------------------------------------------------
// Función    : Productos solicitados por Contrato
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 07 de Febrero del 2013
//------------------------------------------------------------------------------
Unit IntCtoProdSol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IntFrm,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind, UnSQL2,
  InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit, IntCtoHeader, IntProdKYC,
  IntMon;

Type
  TProSolCto = Class;

  TWProSolCto = Class(TForm)
    InterForma1 : TInterForma;
    gbProducto: TGroupBox;
    lTipo: TLabel;
    sbProducto: TSpeedButton;
    eDescTipoProd: TEdit;
    lMercado: TLabel;
    eDescMdo: TEdit;
    ieCveMdo: TInterEdit;
    eCveTipoProd: TEdit;
    lCveProd: TLabel;
    ieCveProd: TInterEdit;
    eDescProd: TEdit;
    lContrato: TLabel;
    ieIdContrato: TInterEdit;
    sbContrato: TSpeedButton;
    eTitular: TEdit;
    gbInversion: TGroupBox;
    ieCveMoneda: TInterEdit;
    sbMoneda: TSpeedButton;
    eDescMoneda: TEdit;
    lMoneda: TLabel;
    ieMontoInv: TInterEdit;
    lMontoInv: TLabel;
    ieDescTipoInv: TInterEdit;
    lTipoInv: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbProductoClick(Sender: TObject);
    procedure sbContratoClick(Sender: TObject);
    procedure sbMonedaClick(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    private
      { Private declarations }
    public
      { Public declarations }
      Objeto : TProSolCto;
    end;

  TProSolCto = class(TInterFrame)
    private
      { Private declarations }
      bEliminaConfigRangosCto: Boolean;
      function validaConfigRangosAlta: boolean;
      function validaConfigRangosBaja: boolean;
      procedure eliminaConfigRangosCto(pIdContrato: String);
    protected
      { Protected declarations }
      vContrato : TInterFrame;
    public
      { Public declarations }
      Ventana             : TWProSolCto;
      Contrato            : TCtrlCto;
      Producto            : TProdKYC;
      Moneda              : TMoneda;

      Id_Contrato         : TInterCampo;
      Cve_Tipo_Producto   : TInterCampo;
      Cve_Mercado         : TInterCampo;
      Cve_Producto        : TInterCampo;
      Cve_Moneda          : TInterCampo;
      Monto_Inversion     : TInterCampo;
      Desc_Tipo_Inversion : TInterCampo;

      procedure    ObtenerCtoPadre;
      procedure    ActivarInversion(pBCapturaAdic : String; pBReqTipoInv : String);

      procedure    DataBaseChange;
      function     InternalBusca : Boolean; override;
      function InternalPost:Boolean; override;
      Function InternalDelete:Boolean; override;
      constructor  Create( AOwner : TComponent ); override;
      destructor   Destroy; override;
      function     ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      procedure    AfterLocalizaProd(Sender : TObject);
      property     pContrato : TInterFrame read vContrato write vContrato;
    published
      { Published declarations }
    end;


    function getQueryRangos(idContrato, dataBaseName, sessionName: String): TQuery;

implementation
   {$R *.DFM}




function getQueryRangos(idContrato, dataBaseName, sessionName: String): TQuery;
begin
  getQueryRangos:=
    GetSQLQuery(
      ' Select cto.Id_Contrato, cto.num_Rangos, prod.B_Rangos_Especiales, ' +
      '   prod.cve_Tipo_Producto, prod.cve_Mercado, prod.cve_Producto, prod.desc_producto ' +
      ' From ' +
      '     ( ' +
      '         select ' + idContrato + ' id_Contrato, count(*) num_Rangos ' +
      '         From Cto_Operacion ' +
      '         where Id_Contrato = ' + idContrato + ' ' +
      '     ) cto, ' +
      '     ( ' +
      '       Select * From ( ' +
      '         Select 1 as Orden, ' +
      '             ' + idContrato + ' id_Contrato, prod.B_Rangos_Especiales, prod.cve_Tipo_Producto, prod.cve_Mercado, prod.Cve_Producto, ' +
      '             ''['' || prod.Cve_Producto || ''] '' || prod.Desc_Producto desc_producto ' +
      '         From cto_prod_Solicitado ctoProd, per_Producto prod ' +
      '         Where ctoProd.Cve_Tipo_Producto = prod.cve_Tipo_Producto ' +
      '            and ctoProd.Cve_Mercado = prod.cve_Mercado ' +
      '            and ctoProd.Cve_Producto = prod.Cve_Producto ' +
      '            and ctoProd.Id_Contrato = ' + idContrato + ' ' +
      '            and prod.B_Rangos_Especiales = ''V'' ' +
      '         UNION ' +
      '         Select 2 as Orden, ' +
      '             ' + idContrato + ' id_Contrato, ''F'' B_Rangos_Especiales, prod.cve_Tipo_Producto, prod.cve_Mercado, prod.Cve_Producto, ' +
      '             ''['' || prod.Cve_Producto || ''] '' || prod.Desc_Producto desc_producto ' +
      '         From per_Producto prod ' +
      '         Where prod.cve_Tipo_Producto = ''PGFI'' ' +
      '           and prod.cve_Mercado = ''PGFI'' ' +
      '           and prod.cve_Producto = ''PGFI'' ' +
      '         Order by Orden ' +
      '       ) Where RowNum = 1 ' +
      '     ) prod ' +
      ' where cto.Id_Contrato = prod.Id_Contrato (+) ',
    dataBaseName, sessionName, true);
end;


procedure TProSolCto.ObtenerCtoPadre;
begin
   if (pContrato <> nil) and (pContrato.Active) then
      Contrato.FindKey([pContrato.FieldByName('ID_CONTRATO').AsInteger]);
end;

procedure TProSolCto.ActivarInversion(pBCapturaAdic : String; pBReqTipoInv : String);
begin
   with Ventana do
   begin
      if trim(pBCapturaAdic) = 'V' then
      begin
         if trim(pBReqTipoInv) = 'V' then   ieDescTipoInv.Color := clWindow
         else                               ieDescTipoInv.Color := clBtnFace;
         ieDescTipoInv.Enabled := (trim(pBReqTipoInv) = 'V');
         ieMontoInv.Color      := clWindow;
      end
      else
      begin
         ieDescTipoInv.Color   := clBtnFace;
         ieMontoInv.Color      := clBtnFace;
         ieDescTipoInv.Enabled := (trim(pBCapturaAdic) = 'V');
      end;
      sbMoneda.Enabled   := (trim(pBCapturaAdic) = 'V');
      ieMontoInv.Enabled := (trim(pBCapturaAdic) = 'V');
   end;
end;

procedure TProSolCto.AfterLocalizaProd(Sender : TObject);
begin
   if Producto.Active then
   begin
      ActivarInversion(Producto.B_Captura_Adic.AsString, Producto.B_Req_Tipo_Inv.AsString);
      if trim(Producto.B_Captura_Adic.AsString) = 'F' then   Ventana.ieMontoInv.Clear;
      if trim(Producto.B_Req_Tipo_Inv.AsString) = 'F' then   Ventana.ieDescTipoInv.Clear;
   end
   else
   begin
      ActivarInversion('F', 'F');
      Ventana.ieDescTipoInv.Clear;
      Ventana.ieMontoInv.Clear;
   end;
end;

constructor TProSolCto.Create( AOwner : TComponent );
begin
   Inherited;

   Ventana := Nil;

   Contrato              := TCtrlCto.Create(Self);
   Contrato.MasterSource := Self;
   Contrato.FieldByName('ID_CONTRATO').MasterField := 'ID_CONTRATO';

   Producto              := TProdKYC.Create(Self);
   Producto.MasterSource := Self;
   Producto.FieldByName('CVE_TIPO_PRODUCTO').MasterField := 'CVE_TIPO_PRODUCTO';
   Producto.FieldByName('CVE_MERCADO').MasterField       := 'CVE_MERCADO';
   Producto.FieldByName('CVE_PRODUCTO').MasterField      := 'CVE_PRODUCTO';
   Producto.OnAfterLocaliza := AfterLocalizaProd;

   Moneda              := TMoneda.Create(Self);
   Moneda.MasterSource := Self;
   Moneda.FieldByName('CVE_MONEDA').MasterField := 'CVE_MONEDA';

   Id_Contrato         := CreaCampo('ID_CONTRATO',         ftInteger, tsNinguno, tsNinguno, True);
   Cve_Tipo_Producto   := CreaCampo('CVE_TIPO_PRODUCTO',   ftString,  tsNinguno, tsNinguno, True);
   Cve_Mercado         := CreaCampo('CVE_MERCADO',         ftString,  tsNinguno, tsNinguno, True);
   Cve_Producto        := CreaCampo('CVE_PRODUCTO',        ftString,  tsNinguno, tsNinguno, True);
   Cve_Moneda          := CreaCampo('CVE_MONEDA',          ftString,  tsNinguno, tsNinguno, True);
   Monto_Inversion     := CreaCampo('MONTO_INVERSION',     ftFloat,   tsNinguno, tsNinguno, True);
   Desc_Tipo_Inversion := CreaCampo('DESC_TIPO_INVERSION', ftString,  tsNinguno, tsNinguno, True);

   FKeyFields.Add('ID_CONTRATO');
   FKeyFields.Add('CVE_TIPO_PRODUCTO');
   FKeyFields.Add('CVE_MERCADO');
   FKeyFields.Add('CVE_PRODUCTO');

   TableName       := 'CTO_PROD_SOLICITADO';
   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TProSolCto.Destroy;
begin
   inherited;
end;

procedure TProSolCto.DataBaseChange;
begin
   inherited;
   Producto.GetParams(Self);
   Contrato.GetParams(Self);
   Moneda.GetParams(Self);
end;

function TProSolCto.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWProSolCto;
begin
   W := TWProSolCto.Create(Self);
   try
      W.Objeto                    := Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := FormaTipo;
      W.InterForma1.ShowBtnAyuda  := False;
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      Ventana                     := W;
      W.InterForma1.ShowModal;
      ShowWindow                  := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

function TProSolCto.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITCTOPRODSOL.IT', 'S,S,S,S');
   try
      if Active then
      begin
         T.Param(0, Id_Contrato.AsString);
         T.Param(1, Cve_Tipo_Producto.AsString);
         T.Param(2, Cve_Mercado.AsString);
         T.Param(3, Cve_Producto.AsString);
      end;

      if (Contrato.Active) and  (Contrato.ID_CONTRATO.AsInteger > 0) then
        T.WhereString := 'CTO_PROD_SOLICITADO.ID_CONTRATO = ' + Contrato.ID_CONTRATO.AsSQL
      else if (pContrato <> nil) and (pContrato.Active) then
        T.WhereString := 'CTO_PROD_SOLICITADO.ID_CONTRATO = ' + pContrato.FieldByName('ID_CONTRATO').asSql;

      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1), T.DameCampo(2), T.DameCampo(3)]);
   finally
      T.Free;
   end;
end;


Function TProSolCto.InternalDelete: Boolean;
var
  resultado: boolean;
  strIdContrato: string;
begin
  resultado:= false;
  if (active and contrato.active) then strIdContrato:= contrato.id_Contrato.asString;

  resultado:= Inherited InternalDelete;

  if (resultado) Then
  Begin
    If (bEliminaConfigRangosCto and (strIdContrato <> '')) then
      eliminaConfigRangosCto(strIdContrato);
  end;
end;


Function TProSolCto.InternalPost:Boolean;
var
  resultado: boolean;
  strIdContrato: string;
begin
  resultado:= false;
  if (active and contrato.active) then strIdContrato:= contrato.id_Contrato.asString;

  resultado:= Inherited InternalPost;

  if (resultado) Then
  Begin
    If (bEliminaConfigRangosCto and (strIdContrato <> '')) then
      eliminaConfigRangosCto(strIdContrato);
  end;
end;



function TProSolCto.validaConfigRangosBaja: boolean;
var
  qProd: TQuery;
  blnResultado: boolean;
begin
  blnResultado:= True;
  bEliminaConfigRangosCto:= false;
  askDelete:= true; //Por default se solicita que el frame confirme la baja del registro

  if (active) then
  Begin
    if (producto.B_Rangos_Especiales.asString = 'V') then
      try
        { Se obtiene el numero de rangos configurados para el contrato y si existiera, la descripción
          de su producto asociado con Rangos Especiales }
        //qProd:= getQueryRangos;
        qProd:= getQueryRangos(contrato.Id_Contrato.asString, dataBaseName, sessionName);

        if (qProd <> nil) then
        Begin
          if (qProd.fieldByName('num_Rangos').asInteger > 0) then
          Begin
            askDelete:= False;

            if (MessageDlg('¿Está seguro de eliminar el producto ' + producto.desc_Producto.asString + '?' +
                  chr(VK_RETURN) + chr(VK_RETURN) +
                  'El producto tiene configurados Rangos Especiales, si continúa con el proceso la configuración actual de transaccionalidad y Tipos de Operaciones del contrato será eliminada.',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
              bEliminaConfigRangosCto:= true
            else
              blnResultado:= false;
          end;
        end
        else
          raise EInterFrame.Create('Error en la validación de rangos especiales.');

      finally
        if qProd <> nil Then qProd.free; qProd:= nil;
      end;
  end
  else
  Begin
    blnResultado:= false;
    MessageDlg('No existe un producto activo para ser eliminado', mtWarning, [mbOK], 0);
  end;

  validaConfigRangosBaja:= blnResultado;
end;


function TProSolCto.validaConfigRangosAlta: boolean;
var
  qProd: TQuery;
  strProducto: String;
begin
  bEliminaConfigRangosCto:= false;

  if (producto.active and (producto.B_Rangos_Especiales.asString = 'V')) then
    try
      { Se obtiene el numero de rangos configurados para el contrato y si existiera, la descripción
        de su producto asociado con Rangos Especiales }
      //qProd:= getQueryRangos;
      qProd:= getQueryRangos(contrato.Id_Contrato.asString, dataBaseName, sessionName);

      if (qProd <> nil) then
      Begin
        { Si ya existiera un producto con rangos especiales asignado al contrato se genera un error }
        if (qProd.fieldByName('B_Rangos_Especiales').asString = 'V') then
        //if (not qProd.FieldByName('desc_Producto').IsNull) then
          raise EInterFrame.Create('Solo es posible seleccionar un producto con Rangos Especiales. ' +
            chr(VK_RETURN) + chr(VK_RETURN) +
            'El contrato ya tiene configurado el producto ' + qProd.FieldByName('desc_Producto').asString)
        else
          {
            Se notifica al usuario que los registros de operatividad y servicios configurados para el contrato serán
            eliminados (Aplica solo cuando el contrato ya tiene registros confgiurados)
          }
          if (qProd.fieldByName('num_Rangos').asInteger > 0) then
          Begin
            { Se notifica al cliente que la configuración de rangos del contrato existente se eliminan }
            if (MessageDlg('El producto ' + producto.desc_Producto.asString + ' tiene configurados Rangos Especiales. ' +
                  chr(VK_RETURN) + chr(VK_RETURN) +
                  'Si confirma su creación la configuración actual de transaccionalidad y Tipos de Operaciones del contrato será eliminada.',
                  mtConfirmation, mbOKCancel, 0) = mrOk) Then
                bEliminaConfigRangosCto:= true
            else
              raise EInterFrame.Create('Proceso de creación del producto cancelado por el Usuario.');
          end;
      end
      else
        raise EInterFrame.Create('Error en la validación de rangos especiales.');

    finally
      if qProd <> nil Then qProd.free; qProd:= nil;
    end;

  validaConfigRangosAlta:= true;
end;


procedure TProSolCto.eliminaConfigRangosCto(pIdContrato: String);
begin
  //showMessage('Inicializa Rangos.... [' + pIdContrato + ']');
  RunSQL('Delete cto_Operacion Where Id_Contrato = ' + pIdContrato,
    dataBaseName, sessionName, true);
end;


procedure TWProSolCto.sbContratoClick(Sender: TObject);
begin
   if (Objeto.pContrato <> nil) and (Objeto.pContrato.Active) then
      Objeto.ObtenerCtoPadre
   else
      Objeto.Contrato.Busca;
end;

procedure TWProSolCto.sbProductoClick(Sender: TObject);
begin
   Objeto.Producto.Busca;
end;

procedure TWProSolCto.sbMonedaClick(Sender: TObject);
begin
   Objeto.Moneda.Busca;
end;

procedure TWProSolCto.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Contrato.ID_CONTRATO.Control                         := ieIdContrato;
      Contrato.TITNOMBRE.Control                           := eTitular;
      Contrato.ShowMenuCatalogo                            := True;
      Contrato.ShowMenuReporte                             := False;
      Contrato.ShowMenuClear                               := False;
      ieIdContrato.PopupMenu                               := Contrato.PopMenu;
      Producto.TipoMdo.TipoProd.Cve_Tipo_Producto.Control  := eCveTipoProd;
      Producto.TipoMdo.TipoProd.Desc_Tipo_Producto.Control := eDescTipoProd;
      Producto.TipoMdo.TipoProd.ShowMenuCatalogo           := True;
      Producto.TipoMdo.TipoProd.ShowMenuReporte            := False;
      Producto.TipoMdo.TipoProd.ShowMenuClear              := False;
      eCveTipoProd.PopupMenu                               := Producto.TipoMdo.TipoProd.PopMenu;
      Producto.TipoMdo.Cve_Mercado.Control                 := ieCveMdo;
      Producto.TipoMdo.Desc_Mercado.Control                := eDescMdo;
      Producto.TipoMdo.ShowMenuCatalogo                    := True;
      Producto.TipoMdo.ShowMenuReporte                     := False;
      Producto.TipoMdo.ShowMenuClear                       := False;
      ieCveMdo.PopupMenu                                   := Producto.TipoMdo.PopMenu;
      Producto.Cve_Producto.Control                        := ieCveProd;
      Producto.Desc_Producto.Control                       := eDescProd;
      Producto.ShowMenuCatalogo                            := True;
      Producto.ShowMenuReporte                             := False;
      Producto.ShowMenuClear                               := False;
      ieCveProd.PopupMenu                                  := Producto.PopMenu;
      Moneda.Cve_Moneda.Control                            := ieCveMoneda;
      Moneda.Desc_Moneda.Control                           := eDescMoneda;
      Moneda.ShowMenuCatalogo                              := True;
      Moneda.ShowMenuReporte                               := False;
      Moneda.ShowMenuClear                                 := False;
      ieCveMoneda.PopupMenu                                := Moneda.PopMenu;
      Monto_Inversion.Control                              := ieMontoInv;
      Desc_Tipo_Inversion.Control                          := ieDescTipoInv;
      ObtenerCtoPadre;
   end;
end;

procedure TWProSolCto.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Contrato.ID_CONTRATO.Control                         := nil;
      Contrato.TITNOMBRE.Control                           := nil;
      Producto.TipoMdo.TipoProd.Cve_Tipo_Producto.Control  := nil;
      Producto.TipoMdo.TipoProd.Desc_Tipo_Producto.Control := nil;
      Producto.TipoMdo.Cve_Mercado.Control                 := nil;
      Producto.TipoMdo.Desc_Mercado.Control                := nil;
      Producto.Cve_Producto.Control                        := nil;
      Producto.Desc_Producto.Control                       := nil;
      Moneda.Cve_Moneda.Control                            := nil;
      Moneda.Desc_Moneda.Control                           := nil;
      Monto_Inversion.Control                              := nil;
      Desc_Tipo_Inversion.Control                          := nil;
   end;
end;

procedure TWProSolCto.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
begin
   with Objeto do
      try
         InterForma1.ShowError := False;
         GetFromControl;
         if Contrato.ID_CONTRATO.AsInteger <= 0 then
         begin
            ieIdContrato.SetFocus;
            raise EInterFrame.Create('Seleccione un Contrato');
         end;
         if trim(Producto.Cve_Producto.AsString) = '' then
         begin
            ieCveProd.SetFocus;
            raise EInterFrame.Create('Seleccione un Producto');
         end;
         if trim(Producto.B_Captura_Adic.AsString) = 'V' then
         begin
            if trim(Producto.B_Req_Tipo_Inv.AsString) = 'V' then
            begin
               if trim(Desc_Tipo_Inversion.AsString) = '' then
               begin
                  ieDescTipoInv.SetFocus;
                  raise EInterFrame.Create('Ingrese un Tipo de Inversion');
               end;
            end;
            if trim(Moneda.Cve_Moneda.AsString) = '' then
            begin
               ieCveMoneda.SetFocus;
               raise EInterFrame.Create('Seleccione una Moneda');
            end;
            if Monto_Inversion.AsFloat <= 0 then
            begin
               ieMontoInv.SetFocus;
               raise EInterFrame.Create('Ingrese un Monto de Inversion');
            end;
         end;
         if IsNewData then
         begin
            if GetSQL('select * '
                    + '  from cto_prod_solicitado '
                    + ' where id_contrato       = ' + Contrato.ID_CONTRATO.AsSQL
                    + '   and cve_tipo_producto = ' + Producto.TipoMdo.TipoProd.Cve_Tipo_Producto.AsSQL
                    + '   and cve_mercado       = ' + Producto.TipoMdo.Cve_Mercado.AsSQL
                    + '   and cve_producto      = ' + Producto.Cve_Producto.AsSQL,
                      SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('Ya existe el Producto para el Contrato');


            if (not validaConfigRangosAlta) then
              raise EInterFrame.Create('Error en la validación de la configruacion de Rangos Especiales');

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



procedure TWProSolCto.InterForma1DespuesNuevo(Sender: TObject);
begin
   if Objeto.pContrato = nil then
      ieIdContrato.SetFocus
   else
   begin
      Objeto.ObtenerCtoPadre;
      ieCveProd.SetFocus;
   end;
   Objeto.ActivarInversion('F', 'F');
end;

procedure TWProSolCto.InterForma1DespuesModificar(Sender: TObject);
begin
   ieIdContrato.SetFocus;
   Objeto.AfterLocalizaProd(Sender);
end;

procedure TWProSolCto.InterForma1DespuesEliminar(Sender: TObject);
begin
   Objeto.ActivarInversion('F', 'F');
end;

procedure TWProSolCto.InterForma1DespuesAceptar(Sender: TObject);
begin
   Objeto.ActivarInversion('F', 'F');
end;

procedure TWProSolCto.InterForma1DespuesCancelar(Sender: TObject);
begin
   if not Objeto.Contrato.Active then
      Objeto.ObtenerCtoPadre;
   Objeto.ActivarInversion('F', 'F');
end;

procedure TWProSolCto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWProSolCto.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
begin
  Realizado:= objeto.validaConfigRangosBaja;
  InterForma1.ShowError:= Realizado;
end;

end.
