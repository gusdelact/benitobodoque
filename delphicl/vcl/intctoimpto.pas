//------------------------------------------------------------------------------
// Función    : Impuesto por Contrato
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 20 de Febrero del 2013
//------------------------------------------------------------------------------
Unit IntCtoImpto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IntFrm,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind, UnSQL2,
  InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit, IntCtoHeader, IntCtoTipoImpto;

Type
  TCtoImpto = Class;

  TWCtoImpto = Class(TForm)
    InterForma1 : TInterForma;
    eDescImpuesto: TEdit;
    eTitular: TEdit;
    sbContrato: TSpeedButton;
    sbImpuesto: TSpeedButton;
    ieCveImpuesto: TInterEdit;
    ieIdContrato: TInterEdit;
    lImpuesto: TLabel;
    lContrato: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure sbImpuestoClick(Sender: TObject);
    procedure sbContratoClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    private
       { Private declarations }
    public
       { Public declarations }
       Objeto : TCtoImpto;
    end;

  TCtoImpto = class(TInterFrame)
    private
       { Private declarations }
    protected
       { Protected declarations }
       vContrato : TInterFrame;
    public
       { Public declarations }
       Contrato : TCtrlCto;
       Impuesto : TCtoTipImp;

       Id_Contrato  : TInterCampo;
       Cve_Impuesto : TInterCampo;

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

procedure TCtoImpto.ObtenerCtoPadre;
begin
   if (pContrato <> nil) and (pContrato.Active) then
      Contrato.FindKey([pContrato.FieldByName('ID_CONTRATO').AsInteger]);
end;

constructor TCtoImpto.Create( AOwner : TComponent );
begin
   Inherited;

   Contrato              := TCtrlCto.Create(Self);
   Contrato.MasterSource := Self;
   Contrato.FieldByName('ID_CONTRATO').MasterField := 'ID_CONTRATO';

   Impuesto              := TCtoTipImp.Create(Self);
   Impuesto.MasterSource := Self;
   Impuesto.FieldByName('CVE_IMPUESTO').MasterField := 'CVE_IMPUESTO';

   Id_Contrato  := CreaCampo('ID_CONTRATO',  ftInteger, tsNinguno, tsNinguno, True);
   Cve_Impuesto := CreaCampo('CVE_IMPUESTO', ftString,  tsNinguno, tsNinguno, True);

   FKeyFields.Add('ID_CONTRATO');
   FKeyFields.Add('CVE_IMPUESTO');

   TableName       := 'CTO_IMPUESTO';
   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TCtoImpto.Destroy;
begin
   inherited;
end;

procedure TCtoImpto.DataBaseChange;
begin
   inherited;
   Contrato.GetParams(Self);
   Impuesto.GetParams(Self);
end;

function TCtoImpto.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWCtoImpto;
begin
   W := TWCtoImpto.Create(Self);
   try
      W.Objeto                       := Self;
      W.InterForma1.InterFrame       := Self;
      W.InterForma1.FormaTipo        := FormaTipo;
      W.InterForma1.ShowBtnModificar := False;
      W.InterForma1.ShowBtnAyuda     := False;
      W.InterForma1.ShowGrid         := False;
      W.InterForma1.ShowNavigator    := False;
      W.InterForma1.Funcion          := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow                     := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

function TCtoImpto.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITCTOIMPTO.IT', 'S,S');
   try
      if Active then
      begin
         T.Param(0, Contrato.Id_Contrato.AsString);
         T.Param(1, Impuesto.Cve_Impuesto.AsString);
      end;
      if Contrato.Active then
      begin
         if Contrato.ID_CONTRATO.AsInteger > 0 then
            T.WhereString := 'CTO_IMPUESTO.ID_CONTRATO = ' + Contrato.ID_CONTRATO.AsSQL;
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1)]);
   finally
      T.Free;
   end;
end;

procedure TWCtoImpto.sbContratoClick(Sender: TObject);
begin
   if (Objeto.pContrato <> nil) and (Objeto.pContrato.Active) then
      Objeto.ObtenerCtoPadre
   else
      Objeto.Contrato.Busca;
end;

procedure TWCtoImpto.sbImpuestoClick(Sender: TObject);
begin
   Objeto.Impuesto.Busca;
end;

procedure TWCtoImpto.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Contrato.ID_CONTRATO.Control   := ieIdContrato;
      Contrato.TITNombre.Control     := eTitular;
      Contrato.ShowMenuCatalogo      := True;
      Contrato.ShowMenuReporte       := False;
      Contrato.ShowMenuClear         := False;
      ieIdContrato.PopupMenu         := Contrato.PopMenu;
      Impuesto.Cve_Impuesto.Control  := ieCveImpuesto;
      Impuesto.Desc_Impuesto.Control := eDescImpuesto;
      Impuesto.ShowMenuCatalogo      := True;
      Impuesto.ShowMenuReporte       := False;
      Impuesto.ShowMenuClear         := False;
      ieCveImpuesto.PopupMenu        := Impuesto.PopMenu;
      ObtenerCtoPadre;
   end;
end;

procedure TWCtoImpto.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Contrato.ID_CONTRATO.Control   := nil;
      Contrato.TITNombre.Control     := nil;
      Impuesto.Cve_Impuesto.Control  := nil;
      Impuesto.Desc_Impuesto.Control := nil;
   end;
end;

procedure TWCtoImpto.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
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
         if trim(Impuesto.Cve_Impuesto.AsString) = '' then
         begin
            ieCveImpuesto.SetFocus;
            raise EInterFrame.Create('Seleccione un Impuesto');
         end;
         if IsNewData then
         begin
            if GetSQL('select * '
                    + '  from cto_impuesto '
                    + ' where id_contrato  = ' + Contrato.ID_CONTRATO.AsSQL
                    + '   and cve_impuesto = ' + Impuesto.Cve_Impuesto.AsSQL,
                      SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('Ya existe el Impuesto para el Contrato');
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

procedure TWCtoImpto.InterForma1DespuesNuevo(Sender: TObject);
begin
   if Objeto.pContrato = nil then
      ieIdContrato.SetFocus
   else
   begin
      Objeto.ObtenerCtoPadre;
      ieCveImpuesto.SetFocus;
   end;
end;

procedure TWCtoImpto.InterForma1DespuesCancelar(Sender: TObject);
begin
   if not Objeto.Contrato.Active then
      Objeto.ObtenerCtoPadre;
end;

procedure TWCtoImpto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
