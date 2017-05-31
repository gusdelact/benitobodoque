//------------------------------------------------------------------------------
// Función    : Tarjetas solicitadas por Contrato
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 19 de Febrero del 2013
//------------------------------------------------------------------------------
Unit IntCtoSolTar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IntFrm,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind, UnSQL2,
  InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit, IntCtoHeader, IntPers;

Type
  TCtoSolTar = Class;

  TWCtoSolTar = Class(TForm)
    InterForma1 : TInterForma;
    eNombre: TEdit;
    eTitular: TEdit;
    sbContrato: TSpeedButton;
    sbPersona: TSpeedButton;
    ieIdPersona: TInterEdit;
    ieIdContrato: TInterEdit;
    lPersona: TLabel;
    lContrato: TLabel;
    cbBPrincipal: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbPersonaClick(Sender: TObject);
    procedure sbContratoClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    private
       { Private declarations }
    public
       { Public declarations }
       Objeto : TCtoSolTar;
    end;

  TCtoSolTar = class(TInterFrame)
    private
       { Private declarations }
    protected
       { Protected declarations }
       vContrato : TInterFrame;
    public
       { Public declarations }
       Contrato : TCtrlCto;
       Persona  : TPersona;

       Id_Contrato : TInterCampo;
       Id_Persona  : TInterCampo;
       B_Principal : TInterCampo;

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

procedure TCtoSolTar.ObtenerCtoPadre;
begin
   if (pContrato <> nil) and (pContrato.Active) then
      Contrato.FindKey([pContrato.FieldByName('ID_CONTRATO').AsInteger]);
end;

constructor TCtoSolTar.Create( AOwner : TComponent );
begin
   Inherited;

   Contrato              := TCtrlCto.Create(Self);
   Contrato.MasterSource := Self;
   Contrato.FieldByName('ID_CONTRATO').MasterField := 'ID_CONTRATO';

   Persona              := TPersona.Create(Self);
   Persona.MasterSource := Self;
   Persona.FieldByName('ID_PERSONA').MasterField := 'ID_PERSONA';

   Id_Contrato := CreaCampo('ID_CONTRATO', ftInteger, tsNinguno, tsNinguno, True);
   Id_Persona  := CreaCampo('ID_PERSONA',  ftInteger, tsNinguno, tsNinguno, True);
   B_Principal := CreaCampo('B_PRINCIPAL', ftString,  tsNinguno, tsNinguno, True);

   FKeyFields.Add('ID_CONTRATO');
   FKeyFields.Add('ID_PERSONA');

   TableName       := 'CTO_SOL_TARJETA';
   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TCtoSolTar.Destroy;
begin
   inherited;
end;

procedure TCtoSolTar.DataBaseChange;
begin
   inherited;
   Contrato.GetParams(Self);
   Persona.GetParams(Self);
end;

function TCtoSolTar.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWCtoSolTar;
begin
   W := TWCtoSolTar.Create(Self);
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

function TCtoSolTar.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITCTOSOLTAR.IT', 'S,S');
   try
      if Active then
      begin
         T.Param(0, Id_Contrato.AsString);
         T.Param(1, Id_Persona.AsString);
      end;
      if Contrato.Active then
      begin
         if Contrato.ID_CONTRATO.AsInteger > 0 then
            T.WhereString := 'CTO_SOL_TARJETA.ID_CONTRATO = ' + Contrato.ID_CONTRATO.AsSQL;
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1)]);
   finally
      T.Free;
   end;
end;

procedure TWCtoSolTar.sbContratoClick(Sender: TObject);
begin
   if (Objeto.pContrato <> nil) and (Objeto.pContrato.Active) then
      Objeto.ObtenerCtoPadre
   else
      Objeto.Contrato.Busca;
end;

procedure TWCtoSolTar.sbPersonaClick(Sender: TObject);
begin
   if Objeto.Contrato.Id_Contrato.AsInteger <= 0 then
   begin
      MessageDlg('Seleccione un Contrato', mtInformation, [mbOk], 0);
      ieIdContrato.SetFocus;
      exit;
   end;
   Objeto.Persona.BuscaWhereString := 'persona.id_persona in (select id_persona from contratante where id_contrato = ' + Objeto.Contrato.Id_Contrato.AsSQL + ')';
   Objeto.Persona.Busca;
end;

procedure TWCtoSolTar.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Contrato.ID_CONTRATO.Control := ieIdContrato;
      Contrato.TITNOMBRE.Control   := eTitular;
      Contrato.ShowMenuCatalogo    := True;
      Contrato.ShowMenuReporte     := False;
      Contrato.ShowMenuClear       := False;
      ieIdContrato.PopupMenu       := Contrato.PopMenu;
      Persona.Id_Persona.Control   := ieIdPersona;
      Persona.Nombre.Control       := eNombre;
      Persona.ShowMenuCatalogo     := True;
      Persona.ShowMenuReporte      := False;
      Persona.ShowMenuClear        := False;
      ieIdPersona.PopupMenu        := Persona.PopMenu;
      B_Principal.Control          := cbBPrincipal;
      ObtenerCtoPadre;
   end;
end;

procedure TWCtoSolTar.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Contrato.ID_CONTRATO.Control := nil;
      Contrato.TITNOMBRE.Control   := nil;
      Persona.Id_Persona.Control   := nil;
      Persona.Nombre.Control       := nil;
      B_Principal.Control          := nil;
   end;
end;

procedure TWCtoSolTar.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
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
         if Persona.Id_Persona.AsInteger <= 0 then
         begin
            ieIdPersona.SetFocus;
            raise EInterFrame.Create('Seleccione una Persona');
         end;
         if IsNewData then
         begin
            if GetSQL('select * '
                    + '  from cto_sol_tarjeta '
                    + ' where id_contrato = ' + Contrato.ID_CONTRATO.AsSQL
                    + '   and id_persona  = ' + Persona.Id_Persona.AsSQL,
                      SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('Ya existe la Tarjeta para el Contrato');
         end;
         if trim(B_Principal.AsString) = 'V' then
         begin
            RunSQL('update cto_sol_tarjeta'
                 + '   set b_principal = ''F'''
                 + ' where id_contrato = ' + Contrato.Id_Contrato.AsSQL,
                   DataBaseName, SessionName, False);
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

procedure TWCtoSolTar.InterForma1DespuesNuevo(Sender: TObject);
begin
   if Objeto.pContrato = nil then
      ieIdContrato.SetFocus
   else
   begin
      Objeto.ObtenerCtoPadre;
      ieIdPersona.SetFocus;
   end;
end;

procedure TWCtoSolTar.InterForma1DespuesModificar(Sender: TObject);
begin
   cbBPrincipal.SetFocus;
end;

procedure TWCtoSolTar.InterForma1DespuesCancelar(Sender: TObject);
begin
   if not Objeto.Contrato.Active then
      Objeto.ObtenerCtoPadre;
end;

procedure TWCtoSolTar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
