//------------------------------------------------------------------------------
// Función    : Transaccionalidad por Contrato
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 15 de Febrero del 2013
//------------------------------------------------------------------------------
Unit IntCtoOp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IntFrm,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind, UnSQL2,
  InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit, IntCtoHeader, IntCtoOpReg,
  UnFunProcICB,
    IntProdKYC;     // Producto

Type
  TCtoOp = Class;

  TWCtoOp = Class(TForm)
    InterForma1 : TInterForma;
    lRango: TLabel;
    lOtroRango: TLabel;
    ieOtroRango: TInterEdit;
    ieCveRangoOp: TInterEdit;
    sbRango: TSpeedButton;
    eDescRangoOp: TEdit;
    lContrato: TLabel;
    ieIdContrato: TInterEdit;
    sbContrato: TSpeedButton;
    eTitular: TEdit;
    lTipo: TLabel;
    eCveTipoOp: TEdit;
    eDescTipoOp: TEdit;
    lClasificacion: TLabel;
    eCveClasifOp: TEdit;
    eDescClasifOp: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edCveTipoProducto: TInterEdit;
    edDescProducto: TEdit;
    edCveMercado: TInterEdit;
    edCveProducto: TInterEdit;
    edDescTipoProducto: TEdit;
    edDescMercado: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbRangoClick(Sender: TObject);
    procedure sbContratoClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    private
       { Private declarations }
    public
       { Public declarations }
       Objeto : TCtoOp;
    end;

  TCtoOp = class(TInterFrame)
    private
       { Private declarations }
    protected
       { Protected declarations }
       vContrato : TInterFrame;
    public
       { Public declarations }
       Ventana  : TWCtoOp;
       Contrato : TCtrlCto;
       Registro : TCtoOpReg;
       Producto: TProdKYC;

       Id_Contrato          : TInterCampo;
       Cve_Tipo_Operacion   : TInterCampo;
       Cve_Clasif_Operacion : TInterCampo;
       Cve_Rango_Operacion  : TInterCampo;
       Otro_Rango           : TInterCampo;
       Cve_Tipo_Producto    : TInterCampo;
       Cve_Mercado          : TInterCampo;
       Cve_Producto         : TInterCampo;

       procedure   ObtenerCtoPadre;
       procedure   ActivarEspecifique(pActivar : Boolean);
       function    RangoLimite(pCveRangoOp : String) : Integer;

       procedure   DataBaseChange;
       function    InternalBusca : Boolean; override;
       constructor Create( AOwner : TComponent ); override;
       destructor  Destroy; override;
       function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
       procedure   AfterLocalizaRegistro(Sender : TObject);
       procedure   AfterLocalizaContrato(Sender : TObject);
       property    pContrato : TInterFrame read vContrato write vContrato;
    published
       { Published declarations }
    end;
implementation

uses
  IntCtoProdSol;

var
   vCveRangoOpAnt : String;

{$R *.DFM}

procedure TCtoOp.ObtenerCtoPadre;
begin
   if (pContrato <> nil) and (pContrato.Active) then
      Contrato.FindKey([pContrato.FieldByName('ID_CONTRATO').AsInteger]);
end;

procedure TCtoOp.ActivarEspecifique(pActivar : Boolean);
begin
   if pActivar then   Ventana.ieOtroRango.Color := clWindow
   else               Ventana.ieOtroRango.Color := clBtnFace;
   Ventana.ieOtroRango.Enabled := pActivar;
end;

function TCtoOp.RangoLimite(pCveRangoOp : String) : Integer;
var
   Qry : TQuery;
begin
   try
      Qry := GetSQLQuery('select * '
                       + '  from sb_parametro_icb '
                       + ' where id_param  = 14 ' // Parametro de Claves de Rangos Limite
                        + '  and parametro = ' + QuotedStr(pCveRangoOp),
                         Apli.DataBaseName, Apli.SessionName, False);
      if Qry <> nil then
         result := StrToInt(Qry.FieldByName('VALUE_PARAM').AsString)
      else
         result := 0;
   finally
      if Qry <> nil then   Qry.Free;   Qry := nil;
   end;
end;

procedure TCtoOp.AfterLocalizaRegistro(Sender : TObject);
begin
   if Registro.Active then
   begin
      if RangoLimite(Registro.Rango.Cve_Rango_Operacion.AsString) <> 0 then
         ActivarEspecifique(Registro.Active)
      else
      begin
         ActivarEspecifique(not Registro.Active);
         Ventana.ieOtroRango.Clear;
      end;
   end
   else
   begin
      ActivarEspecifique(Registro.Active);
      Ventana.ieOtroRango.Clear;
   end;
end;


procedure TCtoOp.AfterLocalizaContrato(Sender : TObject);
var qProd: TQuery;
begin
  if contrato.active then
  begin
    Try
      qProd:= getQueryRangos(contrato.id_Contrato.asString, dataBaseName, sessionName);
      {
      showMessage('Consulta los rangos configurados para el contrato [' + contrato.id_Contrato.asString + ']' +
        chr(VK_RETURN) + chr(VK_RETURN) +
        'Producto [' + qProd.fieldByName('cve_Tipo_Producto').asString + '] [' + qProd.fieldByName('cve_Mercado').asString + '] [' + qProd.fieldByName('cve_Producto').asString + ']'
      );
      }
      if qProd <> nil Then
      begin
        producto.FindKey([
          qProd.fieldByName('cve_Tipo_Producto').asString,
          qProd.fieldByName('cve_Mercado').asString,
          qProd.fieldByName('cve_Producto').asString
        ]);
      end;
    finally
      if qProd <> nil Then qProd.free; qProd:= nil;
    end;
  end;
end;


constructor TCtoOp.Create( AOwner : TComponent );
begin
   Inherited;

   Ventana := Nil;

   Contrato              := TCtrlCto.Create(Self);
   Contrato.MasterSource := Self;
   Contrato.FieldByName('ID_CONTRATO').MasterField := 'ID_CONTRATO';
   Contrato.OnAfterLocaliza:= AfterLocalizaContrato;

   Registro              := TCtoOpReg.Create(Self);
   Registro.MasterSource := Self;
   Registro.FieldByName('CVE_TIPO_OPERACION').MasterField   := 'CVE_TIPO_OPERACION';
   Registro.FieldByName('CVE_CLASIF_OPERACION').MasterField := 'CVE_CLASIF_OPERACION';
   Registro.FieldByName('CVE_RANGO_OPERACION').MasterField  := 'CVE_RANGO_OPERACION';
   Registro.FieldByName('CVE_TIPO_PRODUCTO').MasterField:= 'CVE_TIPO_PRODUCTO';
   Registro.FieldByName('CVE_MERCADO').MasterField      := 'CVE_MERCADO';
   Registro.FieldByName('CVE_PRODUCTO').MasterField     := 'CVE_PRODUCTO';
   Registro.OnAfterLocaliza := AfterLocalizaRegistro;

   Producto:= TProdKYC.Create(Self);
   Producto.MasterSource:= Self;
   Producto.FieldByName('CVE_TIPO_PRODUCTO').MasterField := 'CVE_TIPO_PRODUCTO';
   Producto.FieldByName('CVE_MERCADO').MasterField := 'CVE_MERCADO';
   Producto.FieldByName('CVE_PRODUCTO').MasterField := 'CVE_PRODUCTO';

   Id_Contrato          := CreaCampo('ID_CONTRATO',          ftInteger, tsNinguno, tsNinguno, True);
   Cve_Tipo_Operacion   := CreaCampo('CVE_TIPO_OPERACION',   ftString,  tsNinguno, tsNinguno, True);
   Cve_Clasif_Operacion := CreaCampo('CVE_CLASIF_OPERACION', ftString,  tsNinguno, tsNinguno, True);
   Cve_Rango_Operacion  := CreaCampo('CVE_RANGO_OPERACION',  ftString,  tsNinguno, tsNinguno, True);
   Otro_Rango           := CreaCampo('OTRO_RANGO',           ftFloat,   tsNinguno, tsNinguno, True);

   Cve_Tipo_Producto:= CreaCampo('CVE_TIPO_PRODUCTO', ftString,  tsNinguno, tsNinguno, True);
   Cve_Mercado:= CreaCampo('CVE_MERCADO', ftString,  tsNinguno, tsNinguno, True);
   Cve_Producto:= CreaCampo('CVE_PRODUCTO', ftString,  tsNinguno, tsNinguno, True);

   FKeyFields.Add('ID_CONTRATO');
   FKeyFields.Add('CVE_TIPO_OPERACION');
   FKeyFields.Add('CVE_CLASIF_OPERACION');
   FKeyFields.Add('CVE_RANGO_OPERACION');
   FKeyFields.Add('CVE_TIPO_PRODUCTO');
   FKeyFields.Add('CVE_MERCADO');
   FKeyFields.Add('CVE_PRODUCTO');

   TableName       := 'CTO_OPERACION';
   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TCtoOp.Destroy;
begin
   inherited;
end;

procedure TCtoOp.DataBaseChange;
begin
   inherited;
   Contrato.GetParams(Self);
   Registro.GetParams(Self);
   Producto.getParams(Self);
end;

function TCtoOp.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWCtoOp;
begin
   W := TWCtoOp.Create(Self);
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

function TCtoOp.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITCTOOP.IT', 'S,S,S,S,S,S,S');
   try
      if Active then
      begin
         T.Param(0, Contrato.ID_CONTRATO.AsString);
         T.Param(1, Registro.Tipo.Cve_Tipo_Operacion.AsString);
         T.Param(2, Registro.Clasificacion.Cve_Clasif_Operacion.AsString);
         T.Param(3, Registro.Rango.Cve_Rango_Operacion.AsString);
         T.Param(4, Cve_Tipo_Producto.AsString);
         T.Param(5, Cve_Mercado.AsString);
         T.Param(6, Cve_Producto.AsString);
      end;
      if Contrato.Active then
      begin
         if Contrato.ID_CONTRATO.AsInteger > 0 then
            T.WhereString := 'CTO_OPERACION.ID_CONTRATO = ' + Contrato.ID_CONTRATO.AsSQL;
         T.WhereString := T.WhereString + ' AND CTO_OPERACION_GRUPO.CVE_GRUPO_OPERACION = ' + QuotedStr('TRAMES')
                                        + ' AND CTO_OPERACION_REG.CVE_PER_JURIDICA      = ' + QuotedStr(Contrato.TITCVE_PER_JURIDICA.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1), T.DameCampo(2), T.DameCampo(3), T.DameCampo(4), T.DameCampo(5), T.DameCampo(6)]);
   finally
      T.Free;
   end;
end;

procedure TWCtoOp.sbContratoClick(Sender: TObject);
begin
   if (Objeto.pContrato <> nil) and (Objeto.pContrato.Active) then
      Objeto.ObtenerCtoPadre
   else
      Objeto.Contrato.Busca;
end;

procedure TWCtoOp.sbRangoClick(Sender: TObject);
begin
  if objeto.producto.Active then
  begin
     Objeto.Registro.BuscaWhereString:=
      'CTO_OPERACION_GRUPO.CVE_GRUPO_OPERACION = ' + QuotedStr('TRAMES')
      + ' AND CTO_OPERACION_REG.CVE_PER_JURIDICA = ' + QuotedStr(Objeto.Contrato.TITCVE_PER_JURIDICA.AsString)
      + ' and Cto_Operacion_Reg.Cve_Tipo_Producto = ' + objeto.Producto.Cve_Tipo_Producto.asSql
      + ' and Cto_Operacion_Reg.Cve_Mercado = ' + objeto.Producto.Cve_Mercado.asSql
      + ' and Cto_Operacion_Reg.Cve_Producto = ' + objeto.Producto.Cve_Producto.asSql;

     Objeto.Registro.Busca;
  end
  else
  Begin
    ieIdContrato.SetFocus;
    MessageDlg('Revise que el contrato para el cual se configurarán los rangos este seleccionado', mtInformation, [mbOK], 0);
  end;
end;

procedure TWCtoOp.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Contrato.ID_CONTRATO.Control                         := ieIdContrato;
      Contrato.TITNOMBRE.Control                           := eTitular;
      Contrato.ShowMenuCatalogo                            := True;
      Contrato.ShowMenuReporte                             := False;
      Contrato.ShowMenuClear                               := False;
      ieIdContrato.PopupMenu                               := Contrato.PopMenu;
      Registro.Tipo.Cve_Tipo_Operacion.Control             := eCveTipoOp;
      Registro.Tipo.Desc_Tipo_Operacion.Control            := eDescTipoOp;
      Registro.Tipo.ShowMenuCatalogo                       := True;
      Registro.Tipo.ShowMenuReporte                        := False;
      Registro.Tipo.ShowMenuClear                          := False;
      eCveTipoOp.PopupMenu                                 := Registro.Tipo.PopMenu;
      Registro.Clasificacion.Cve_Clasif_Operacion.Control  := eCveClasifOp;
      Registro.Clasificacion.Desc_Clasif_Operacion.Control := eDescClasifOp;
      Registro.Clasificacion.ShowMenuCatalogo              := True;
      Registro.Clasificacion.ShowMenuReporte               := False;
      Registro.Clasificacion.ShowMenuClear                 := False;
      eCveClasifOp.PopupMenu                               := Registro.Clasificacion.PopMenu;
      Registro.Rango.Cve_Rango_Operacion.Control           := ieCveRangoOp;
      Registro.Rango.Desc_Rango_Operacion.Control          := eDescRangoOp;
      Registro.Rango.ShowMenuCatalogo                      := True;
      Registro.Rango.ShowMenuReporte                       := False;
      Registro.Rango.ShowMenuClear                         := False;
      ieCveRangoOp.PopupMenu                               := Registro.Rango.PopMenu;
      Otro_Rango.Control                                   := ieOtroRango;

      Producto.cve_Tipo_Producto.control:= edCveTipoProducto;
      Producto.cve_Mercado.control:= edCveMercado;
      Producto.cve_Producto.control:= edCveProducto;
      Producto.Desc_Producto.control:= edDescProducto;
      Producto.TipoMdo.TipoProd.Desc_Tipo_Producto.control:= edDescTipoProducto;
      Producto.TipoMdo.Desc_Mercado.control:= edDescMercado;

      ObtenerCtoPadre;
   end;
end;


procedure TWCtoOp.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Contrato.ID_CONTRATO.Control                         := nil;
      Contrato.TITNOMBRE.Control                           := nil;
      Registro.Tipo.Cve_Tipo_Operacion.Control             := nil;
      Registro.Tipo.Desc_Tipo_Operacion.Control            := nil;
      Registro.Clasificacion.Cve_Clasif_Operacion.Control  := nil;
      Registro.Clasificacion.Desc_Clasif_Operacion.Control := nil;
      Registro.Rango.Cve_Rango_Operacion.Control           := nil;
      Registro.Rango.Desc_Rango_Operacion.Control          := nil;
      Otro_Rango.Control                                   := nil;

      Producto.cve_Tipo_Producto.control:= nil;
      Producto.cve_Mercado.control:= nil;
      Producto.cve_Producto.control:= nil;
      Producto.Desc_Producto.control:= nil;
      Producto.TipoMdo.TipoProd.Desc_Tipo_Producto.control:= nil;
      Producto.TipoMdo.Desc_Mercado.control:= nil;
      
   end;
end;

procedure TWCtoOp.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
var
   vRangoLimite : Integer;
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
         if trim(Registro.Rango.Cve_Rango_Operacion.AsString) = '' then
         begin
            ieCveRangoOp.SetFocus;
            raise EInterFrame.Create('Seleccione un Rango');
         end;
         vRangoLimite := RangoLimite(Registro.Rango.Cve_Rango_Operacion.AsString);
         if vRangoLimite <> 0 then
         begin
            if Otro_Rango.AsFloat = 0 then
            begin
               ieOtroRango.SetFocus;
               raise EInterFrame.Create('Especifique un Rango');
            end;
            if Otro_Rango.AsFloat <= vRangoLimite then
            begin
               ieOtroRango.SetFocus;
               raise EInterFrame.Create('La cantidad especificada debe ser ' + trim(Registro.Rango.Desc_Rango_Operacion.AsString));
            end;
         end;

         if not producto.active then raise EInterFrame.create('Revise que exista un producto seleccioado');
         
         // Por solicitud de Victor Hugo Reyes Rodriguez, solo se puede asignar una transaccionalidad, por fila en la solicitud.
         if (IsNewData) or (trim(vCveRangoOpAnt) <> trim(Cve_Rango_Operacion.AsString)) then
         begin
            if GetSQL('select * '
                    + '  from cto_operacion '
                    + ' where id_contrato          = ' + Contrato.ID_CONTRATO.AsSQL
                    + '   and cve_tipo_operacion   = ' + Registro.Tipo.Cve_Tipo_Operacion.AsSQL
                    + '   and cve_clasif_operacion = ' + Registro.Clasificacion.Cve_Clasif_Operacion.AsSQL,
                      SeguDataBaseName, SeguSessionName, False) then
            begin
               ieCveRangoOp.SetFocus;
               raise EInterFrame.Create('El Contrato ya tiene asignado un Rango, para la fila seleccionada');
            end;
         end;

         if IsNewData then
         begin
            if GetSQL('select * '
                    + '  from cto_operacion '
                    + ' where id_contrato          = ' + Contrato.ID_CONTRATO.AsSQL
                    + '   and cve_tipo_operacion   = ' + Registro.Tipo.Cve_Tipo_Operacion.AsSQL
                    + '   and cve_clasif_operacion = ' + Registro.Clasificacion.Cve_Clasif_Operacion.AsSQL
                    + '   and cve_rango_operacion  = ' + Registro.Rango.Cve_Rango_Operacion.AsSQL,
                      SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('Ya existe la Transaccionalidad para el Contrato');
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

procedure TWCtoOp.InterForma1DespuesNuevo(Sender: TObject);
begin
   if Objeto.pContrato = nil then
      ieIdContrato.SetFocus
   else
   begin
      Objeto.ObtenerCtoPadre;
      ieCveRangoOp.SetFocus;
   end;
   vCveRangoOpAnt := '';
   Objeto.ActivarEspecifique(False);
end;

procedure TWCtoOp.InterForma1DespuesModificar(Sender: TObject);
begin
   vCveRangoOpAnt := trim(Objeto.Cve_Rango_Operacion.AsString);
   Objeto.AfterLocalizaRegistro(Sender);
end;

procedure TWCtoOp.InterForma1DespuesEliminar(Sender: TObject);
begin
   Objeto.ActivarEspecifique(False);
end;

procedure TWCtoOp.InterForma1DespuesAceptar(Sender: TObject);
begin
   Objeto.ActivarEspecifique(False);
end;

procedure TWCtoOp.InterForma1DespuesCancelar(Sender: TObject);
begin
   if not Objeto.Contrato.Active then
      Objeto.ObtenerCtoPadre;
   Objeto.ActivarEspecifique(False);
end;

procedure TWCtoOp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
