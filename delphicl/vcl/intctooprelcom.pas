//------------------------------------------------------------------------------
// Función    : Relacion Comercial por Contrato
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 11 de Febrero del 2013
//------------------------------------------------------------------------------
Unit IntCtoOpRelCom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind,
  UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit,
  IntCtoHeader,      // Contrato
  IntCtoTipoOpDiv,   // Tipo de Operacion por Divisa
  IntCtoOpRelComDiv, // Relacion Comercial por Divisa
  IntPob,            // Pais
  IntMon,            // Moneda
  IntCtoOpFrecDiv;   // Frecuencia por Divisa
                              
Type
  TCtoRelCom = Class;

  TWCtoRelCom = Class(TForm)
    InterForma1 : TInterForma;
    sbRelCom: TSpeedButton;
    eDescOpRelComDiv: TEdit;
    eDescTipoOperDivisa: TEdit;
    sbTipoOp: TSpeedButton;
    sbContrato: TSpeedButton;
    eTitular: TEdit;
    ieCveOpRelComDiv: TInterEdit;
    ieCveTipoOperDivisa: TInterEdit;
    ieIdContrato: TInterEdit;
    lRelCom: TLabel;
    lTipoOp: TLabel;
    lContrato: TLabel;
    lMoneda: TLabel;
    ieCveMoneda: TInterEdit;
    sbMoneda: TSpeedButton;
    eDescMoneda: TEdit;
    lFrecuencia: TLabel;
    ieCveOpFrecDiv: TInterEdit;
    sbFrecuencia: TSpeedButton;
    eDescOpFrecDiv: TEdit;
    lPais: TLabel;
    ieCvePais: TInterEdit;
    sbPais: TSpeedButton;
    eDescPais: TEdit;
    ieIdRelCom: TInterEdit;
    lIdentificador: TLabel;
    lNombre1: TLabel;
    ieNomRelCom: TInterEdit;
    lActividad: TLabel;
    ieActRelCom: TInterEdit;
    lMonto: TLabel;
    ieMontoRelCom: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbRelComClick(Sender: TObject);
    procedure sbContratoClick(Sender: TObject);
    procedure sbMonedaClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure sbTipoOpClick(Sender: TObject);
    procedure sbPaisClick(Sender: TObject);
    procedure sbFrecuenciaClick(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    private
       { Private declarations }
    public
       { Public declarations }
       Objeto : TCtoRelCom;
    end;

  TCtoRelCom = class(TInterFrame)
    private
       { Private declarations }
    protected
       { Protected declarations }
       vContrato : TInterFrame;
    public
       { Public declarations }
       Contrato      : TCtrlCto;
       TipoOperacion : TCtoTOpDiv;
       RelComercial  : TRelComDiv;
       Pais          : TPoblacion;
       Moneda        : TMoneda;
       Frecuencia    : TFrecDiv;

       Id_Contrato             : TInterCampo;
       Id_Rel_Comercial        : TInterCampo;
       Cve_Tipo_Oper_Divisa    : TInterCampo;
       Nombre_Rel_Comercial    : TInterCampo;
       Cve_Oper_Rel_Comer_Div  : TInterCampo;
       Actividad_Rel_Comercial : TInterCampo;
       Cve_Pais                : TInterCampo;
       Cve_Moneda              : TInterCampo;
       Monto_Rel_Comercial     : TInterCampo;
       Cve_Oper_Frecuencia_Div : TInterCampo;

       procedure    ObtenerCtoPadre;

       procedure    DataBaseChange;
       function     InternalBusca : Boolean; override;
       constructor  Create( AOwner : TComponent ); override;
       destructor   Destroy; override;
       function     ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
       property     pContrato : TInterFrame read vContrato write vContrato;
    published
       { Published declarations }
    end;
implementation
   {$R *.DFM}

procedure TCtoRelCom.ObtenerCtoPadre;
begin
   if (pContrato <> nil) and (pContrato.Active) then
      Contrato.FindKey([pContrato.FieldByName('ID_CONTRATO').AsInteger]);
end;

constructor TCtoRelCom.Create( AOwner : TComponent );
begin
   Inherited;

   Contrato              := TCtrlCto.Create(Self);
   Contrato.MasterSource := Self;
   Contrato.FieldByName('ID_CONTRATO').MasterField := 'ID_CONTRATO';

   TipoOperacion              := TCtoTOpDiv.Create(Self);
   TipoOperacion.MasterSource := Self;
   TipoOperacion.FieldByName('CVE_TIPO_OPER_DIVISA').MasterField := 'CVE_TIPO_OPER_DIVISA';

   RelComercial              := TRelComDiv.Create(Self);
   RelComercial.MasterSource := Self;
   RelComercial.FieldByName('CVE_OPER_REL_COMER_DIV').MasterField := 'CVE_OPER_REL_COMER_DIV';

   Pais              := TPoblacion.Create(Self);
   Pais.MasterSource := Self;
   Pais.FieldByName('CVE_POBLACION').MasterField := 'CVE_PAIS';
   Pais.FilterBy     := fbTPoblacionPais;

   Moneda              := TMoneda.Create(Self);
   Moneda.MasterSource := Self;
   Moneda.FieldByName('CVE_MONEDA').MasterField := 'CVE_MONEDA';

   Frecuencia              := TFrecDiv.Create(Self);
   Frecuencia.MasterSource := Self;
   Frecuencia.FieldByName('CVE_OPER_FRECUENCIA_DIV').MasterField := 'CVE_OPER_FRECUENCIA_DIV';

   Id_Contrato             := CreaCampo('ID_CONTRATO',             ftInteger, tsNinguno, tsNinguno, True);
   Id_Rel_Comercial        := CreaCampo('ID_REL_COMERCIAL',        ftInteger, tsNinguno, tsNinguno, True);
   Cve_Tipo_Oper_Divisa    := CreaCampo('CVE_TIPO_OPER_DIVISA',    ftString,  tsNinguno, tsNinguno, True);
   Nombre_Rel_Comercial    := CreaCampo('NOMBRE_REL_COMERCIAL',    ftString,  tsNinguno, tsNinguno, True);
   Cve_Oper_Rel_Comer_Div  := CreaCampo('CVE_OPER_REL_COMER_DIV',  ftString,  tsNinguno, tsNinguno, True);
   Actividad_Rel_Comercial := CreaCampo('ACTIVIDAD_REL_COMERCIAL', ftString,  tsNinguno, tsNinguno, True);
   Cve_Pais                := CreaCampo('CVE_PAIS',                ftString,  tsNinguno, tsNinguno, True);
   Cve_Moneda              := CreaCampo('CVE_MONEDA',              ftString,  tsNinguno, tsNinguno, True);
   Monto_Rel_Comercial     := CreaCampo('MONTO_REL_COMERCIAL',     ftFloat,   tsNinguno, tsNinguno, True);
   Cve_Oper_Frecuencia_Div := CreaCampo('CVE_OPER_FRECUENCIA_DIV', ftString,  tsNinguno, tsNinguno, True);

   FKeyFields.Add('ID_CONTRATO');
   FKeyFields.Add('ID_REL_COMERCIAL');

   TableName       := 'CTO_OPER_REL_COMERCIAL';
   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TCtoRelCom.Destroy;
begin
   inherited;
end;

procedure TCtoRelCom.DataBaseChange;
begin
   inherited;
   Contrato.GetParams(Self);
   TipoOperacion.GetParams(Self);
   RelComercial.GetParams(Self);
   Pais.GetParams(Self);
   Moneda.GetParams(Self);
   Frecuencia.GetParams(Self);
end;

function TCtoRelCom.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWCtoRelCom;
begin
   W := TWCtoRelCom.Create(Self);
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

function TCtoRelCom.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITCTOOPRELCOM.IT', 'S,S');
   try
      if Active then
      begin
         T.Param(0, Contrato.ID_CONTRATO.AsString);
         T.Param(1, Id_Rel_Comercial.AsString);
      end;
      if Contrato.Active then
      begin
         if Contrato.ID_CONTRATO.AsInteger > 0 then
            T.WhereString := 'CTO_OPER_REL_COMERCIAL.ID_CONTRATO = ' + Contrato.ID_CONTRATO.AsSQL;
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1)]);
   finally
      T.Free;
   end;
end;

procedure TWCtoRelCom.sbContratoClick(Sender: TObject);
begin
   if (Objeto.pContrato <> nil) and (Objeto.pContrato.Active) then
      Objeto.ObtenerCtoPadre
   else
      Objeto.Contrato.Busca;
end;

procedure TWCtoRelCom.sbTipoOpClick(Sender: TObject);
begin
   Objeto.TipoOperacion.Busca;
end;

procedure TWCtoRelCom.sbRelComClick(Sender: TObject);
begin
   Objeto.RelComercial.Busca;
end;

procedure TWCtoRelCom.sbPaisClick(Sender: TObject);
begin
   Objeto.Pais.Busca;
end;

procedure TWCtoRelCom.sbMonedaClick(Sender: TObject);
begin
   Objeto.Moneda.Busca;
end;

procedure TWCtoRelCom.sbFrecuenciaClick(Sender: TObject);
begin
   Objeto.Frecuencia.Busca;
end;

procedure TWCtoRelCom.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Contrato.ID_CONTRATO.Control                 := ieIdContrato;
      Contrato.TITNOMBRE.Control                   := eTitular;
      Contrato.ShowMenuCatalogo                    := True;
      Contrato.ShowMenuReporte                     := False;
      Contrato.ShowMenuClear                       := False;
      ieIdContrato.PopupMenu                       := Contrato.PopMenu;
      Id_Rel_Comercial.Control                     := ieIdRelCom;
      TipoOperacion.Cve_Tipo_Oper_Divisa.Control   := ieCveTipoOperDivisa;
      TipoOperacion.Desc_Tipo_Oper_Divisa.Control  := eDescTipoOperDivisa;
      TipoOperacion.ShowMenuCatalogo               := True;
      TipoOperacion.ShowMenuReporte                := False;
      TipoOperacion.ShowMenuClear                  := False;
      ieCveTipoOperDivisa.PopupMenu                := TipoOperacion.PopMenu;
      Nombre_Rel_Comercial.Control                 := ieNomRelCom;
      RelComercial.Cve_Oper_Rel_Comer_Div.Control  := ieCveOpRelComDiv;
      RelComercial.Desc_Oper_Rel_Comer_Div.Control := eDescOpRelComDiv;
      RelComercial.ShowMenuCatalogo                := True;
      RelComercial.ShowMenuReporte                 := False;
      RelComercial.ShowMenuClear                   := False;
      ieCveOpRelComDiv.PopupMenu                   := RelComercial.PopMenu;
      Actividad_Rel_Comercial.Control              := ieActRelCom;
      Pais.Cve_Poblacion.Control                   := ieCvePais;
      Pais.Desc_Poblacion.Control                  := eDescPais;
      Pais.ShowMenuCatalogo                        := True;
      Pais.ShowMenuReporte                         := False;
      Pais.ShowMenuClear                           := False;
      ieCvePais.PopupMenu                          := Pais.PopMenu;
      Moneda.Cve_Moneda.Control                    := ieCveMoneda;
      Moneda.Desc_Moneda.Control                   := eDescMoneda;
      Moneda.ShowMenuCatalogo                      := True;
      Moneda.ShowMenuReporte                       := False;
      Moneda.ShowMenuClear                         := False;
      ieCveMoneda.PopupMenu                        := Moneda.PopMenu;
      Monto_Rel_Comercial.Control                  := ieMontoRelCom;
      Frecuencia.Cve_Oper_Frecuencia_Div.Control   := ieCveOpFrecDiv;
      Frecuencia.Desc_Oper_Frecuencia_Div.Control  := eDescOpFrecDiv;
      Frecuencia.ShowMenuCatalogo                  := True;
      Frecuencia.ShowMenuReporte                   := False;
      Frecuencia.ShowMenuClear                     := False;
      ieCveOpFrecDiv.PopupMenu                     := Frecuencia.PopMenu;
      ObtenerCtoPadre;
   end;
end;

procedure TWCtoRelCom.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Contrato.ID_CONTRATO.Control                 := nil;
      Contrato.TITNOMBRE.Control                   := nil;
      Id_Rel_Comercial.Control                     := nil;
      TipoOperacion.Cve_Tipo_Oper_Divisa.Control   := nil;
      TipoOperacion.Desc_Tipo_Oper_Divisa.Control  := nil;
      Nombre_Rel_Comercial.Control                 := nil;
      RelComercial.Cve_Oper_Rel_Comer_Div.Control  := nil;
      RelComercial.Desc_Oper_Rel_Comer_Div.Control := nil;
      Actividad_Rel_Comercial.Control              := nil;
      Pais.Cve_Poblacion.Control                   := nil;
      Pais.Desc_Poblacion.Control                  := nil;
      Moneda.Cve_Moneda.Control                    := nil;
      Moneda.Desc_Moneda.Control                   := nil;
      Monto_Rel_Comercial.Control                  := nil;
      Frecuencia.Cve_Oper_Frecuencia_Div.Control   := nil;
      Frecuencia.Desc_Oper_Frecuencia_Div.Control  := nil;
   end;
end;

procedure TWCtoRelCom.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
var
   Qry : TQuery;
begin
   with Objeto do
      try
         // Obtener automaticamente el Id_Rel_Comercial
         if IsNewData then
         begin
            try
               Qry := GetSQLQuery('select nvl(max(id_rel_comercial)+1, 1) id_rel_comercial from cto_oper_rel_comercial',
                                  Apli.DataBaseName, Apli.SessionName, False);
               if Qry <> nil then
                  ieIdRelCom.Text := IntToStr(Qry.FieldByName('ID_REL_COMERCIAL').AsInteger);
            finally
               if Qry <> nil then   Qry.Free;   Qry := nil;
            end;
         end;
         InterForma1.ShowError := False;
         GetFromControl;
         if Contrato.ID_CONTRATO.AsInteger <= 0 then
         begin
            ieIdContrato.SetFocus;
            raise EInterFrame.Create('Seleccione un Contrato');
         end;
         if trim(TipoOperacion.Cve_Tipo_Oper_Divisa.AsString) = '' then
         begin
            ieCveTipoOperDivisa.SetFocus;
            raise EInterFrame.Create('Seleccione un Tipo de Operacion');
         end;
         if trim(Nombre_Rel_Comercial.AsString) = '' then
         begin
            ieNomRelCom.SetFocus;
            raise EInterFrame.Create('Ingrese un Nombre o Razón Social');
         end;
         if trim(RelComercial.Cve_Oper_Rel_Comer_Div.AsString) = '' then
         begin
            ieCveOpRelComDiv.SetFocus;
            raise EInterFrame.Create('Seleccione una Relacion Comercial');
         end;
         if trim(Actividad_Rel_Comercial.AsString) = '' then
         begin
            ieActRelCom.SetFocus;
            raise EInterFrame.Create('Ingrese una Actividad de la Contraparte');
         end;
         if trim(Pais.Cve_Poblacion.AsString) = '' then
         begin
            ieCvePais.SetFocus;
            raise EInterFrame.Create('Seleccione un Pais');
         end;
         if trim(Moneda.Cve_Moneda.AsString) = '' then
         begin
            ieCveMoneda.SetFocus;
            raise EInterFrame.Create('Seleccione una Moneda');
         end;
         if Monto_Rel_Comercial.AsFloat <= 0 then
         begin
            ieMontoRelCom.SetFocus;
            raise EInterFrame.Create('Ingrese un Monto Aproximado');
         end;
         if trim(Frecuencia.Cve_Oper_Frecuencia_Div.AsString) = '' then
         begin
            ieCveOpFrecDiv.SetFocus;
            raise EInterFrame.Create('Seleccione una Frecuencia KYC');
         end;
         if IsNewData then
         begin
            if GetSQL('select * '
                    + '  from cto_oper_rel_comercial '
                    + ' where id_contrato      = ' + Contrato.ID_CONTRATO.AsSQL
                    + '   and id_rel_comercial = ' + Id_Rel_Comercial.AsSQL,
                      SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('Ya existe la Transferencia en Moneda Extranjera para el Contrato');
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

procedure TWCtoRelCom.InterForma1DespuesNuevo(Sender: TObject);
begin
   if Objeto.pContrato = nil then
      ieIdContrato.SetFocus
   else
   begin
      Objeto.ObtenerCtoPadre;
      ieCveTipoOperDivisa.SetFocus;
   end;
end;

procedure TWCtoRelCom.InterForma1DespuesModificar(Sender: TObject);
begin
   ieIdContrato.SetFocus;
end;

procedure TWCtoRelCom.InterForma1DespuesCancelar(Sender: TObject);
begin
   if not Objeto.Contrato.Active then
      Objeto.ObtenerCtoPadre;
end;

procedure TWCtoRelCom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
