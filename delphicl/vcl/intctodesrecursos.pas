//------------------------------------------------------------------------------
// Función    : Destino de Recursos por Contrato
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 12 de Febrero del 2013
//------------------------------------------------------------------------------
Unit IntCtoDesRecursos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IntFrm,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind, UnSQL2,
  InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit, IntCtoHeader, IntCtoDesRec,
  UnFunProcICB;

Type
  TCDesRec = Class;

  TWCDesRec = Class(TForm)
    InterForma1 : TInterForma;
    eTitular: TEdit;
    sbContrato: TSpeedButton;
    ieIdContrato: TInterEdit;
    lContrato: TLabel;
    lDesRec: TLabel;
    ieIdDesRec: TInterEdit;
    sbDesRec: TSpeedButton;
    eDescDesRec: TEdit;
    ieDescOtro: TInterEdit;
    lOtro: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbDesRecClick(Sender: TObject);
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
       Objeto : TCDesRec;
    end;

  TCDesRec = class(TInterFrame)
    private
       { Private declarations }
    protected
       { Protected declarations }
       vContrato : TInterFrame;
    public
       { Public declarations }
       Ventana        : TWCDesRec;
       Contrato       : TCtrlCto;
       DesRecursos    : TCtoDesRec;

       Id_Contrato    : TInterCampo;
       Id_Destino_Rec : TInterCampo;
       Desc_Otro      : TInterCampo;

       procedure    ObtenerCtoPadre;
       procedure    HabilitarEspecifique(pHabilitar : Boolean);

       procedure    DataBaseChange;
       function     InternalBusca : Boolean; override;
       constructor  Create( AOwner : TComponent ); override;
       destructor   Destroy; override;
       function     ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
       procedure    AfterLocalizaDes(Sender : TObject);
       property     pContrato : TInterFrame read vContrato write vContrato;
    published
       { Published declarations }
    end;
implementation
   {$R *.DFM}

procedure TCDesRec.ObtenerCtoPadre;
begin
   if (pContrato <> nil) and (pContrato.Active) then
      Contrato.FindKey([pContrato.FieldByName('ID_CONTRATO').AsInteger]);
end;

procedure TCDesRec.HabilitarEspecifique(pHabilitar : Boolean);
begin
   if pHabilitar then Ventana.ieDescOtro.Color := clWindow
   else               Ventana.ieDescOtro.Color := clBtnFace;
   Ventana.ieDescOtro.Enabled := pHabilitar;
end;

procedure TCDesRec.AfterLocalizaDes(Sender : TObject);
begin
   if DesRecursos.Active then
   begin
      if not (DesRecursos.ID_DESTINO_REC.AsInteger = 6) then   Ventana.ieDescOtro.Clear;
      HabilitarEspecifique(DesRecursos.ID_DESTINO_REC.AsInteger = 6) // Otro
   end
   else
   begin
      Ventana.ieDescOtro.Clear;
      HabilitarEspecifique(DesRecursos.Active);
   end;
end;

constructor TCDesRec.Create( AOwner : TComponent );
begin
   Inherited;

   Ventana := Nil;

   Contrato              := TCtrlCto.Create(Self);
   Contrato.MasterSource := Self;
   Contrato.FieldByName('ID_CONTRATO').MasterField := 'ID_CONTRATO';

   DesRecursos                                           := TCtoDesRec.Create(Self);
   DesRecursos.MasterSource                              := Self;
   DesRecursos.FieldByName('ID_DESTINO_REC').MasterField := 'ID_DESTINO_REC';
   DesRecursos.OnAfterLocaliza                           := AfterLocalizaDes;

   Id_Contrato    := CreaCampo('ID_CONTRATO',    ftInteger, tsNinguno, tsNinguno, True);
   Id_Destino_Rec := CreaCampo('ID_DESTINO_REC', ftInteger, tsNinguno, tsNinguno, True);
   Desc_Otro      := CreaCampo('DESC_OTRO',      ftString,  tsNinguno, tsNinguno, True);

   FKeyFields.Add('ID_CONTRATO');
   FKeyFields.Add('ID_DESTINO_REC');

   TableName       := 'CTO_DESTINO_RECURSOS';
   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TCDesRec.Destroy;
begin
   inherited;
end;

procedure TCDesRec.DataBaseChange;
begin
   inherited;
   Contrato.GetParams(Self);
   DesRecursos.GetParams(Self);
end;

function TCDesRec.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWCDesRec;
begin
   W := TWCDesRec.Create(Self);
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

function TCDesRec.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITCTODESREC.IT', 'S,S');
   try
      if Active then
      begin
         T.Param(0, Contrato.ID_CONTRATO.AsString);
         T.Param(1, DesRecursos.ID_DESTINO_REC.AsString);
      end;
      if Contrato.Active then
      begin
         if Contrato.ID_CONTRATO.AsInteger > 0 then
            T.WhereString := 'CTO_DESTINO_RECURSOS.ID_CONTRATO = ' + Contrato.ID_CONTRATO.AsSQL;
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1)]);
   finally
      T.Free;
   end;
end;

procedure TWCDesRec.sbContratoClick(Sender: TObject);
begin
   if (Objeto.pContrato <> nil) and (Objeto.pContrato.Active) then
      Objeto.ObtenerCtoPadre
   else
      Objeto.Contrato.Busca;
end;

procedure TWCDesRec.sbDesRecClick(Sender: TObject);
begin
   if trim(Objeto.Contrato.TITCVE_PER_JURIDICA.AsString) = cPerMoral then
      Objeto.DesRecursos.BuscaWhereString := 'CTO_DESTINO_REC.ID_DESTINO_REC = 6 AND CTO_DESTINO_REC.B_VAL_PLD = ''V'''
   else
      Objeto.DesRecursos.BuscaWhereString := 'CTO_DESTINO_REC.B_VAL_PLD = ''V''';
   Objeto.DesRecursos.Busca;
   Objeto.DesRecursos.BuscaWhereString := '';
end;

procedure TWCDesRec.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Contrato.ID_CONTRATO.Control         := ieIdContrato;
      Contrato.TITNOMBRE.Control           := eTitular;
      Contrato.ShowMenuCatalogo            := True;
      Contrato.ShowMenuReporte             := False;
      Contrato.ShowMenuClear               := False;
      ieIdContrato.PopupMenu               := Contrato.PopMenu;
      DesRecursos.ID_DESTINO_REC.Control   := ieIdDesRec;
      DesRecursos.DESC_DESTINO_REC.Control := eDescDesRec;
      DesRecursos.ShowMenuCatalogo         := True;
      DesRecursos.ShowMenuReporte          := False;
      DesRecursos.ShowMenuClear            := False;
      ieIdDesRec.PopupMenu                 := DesRecursos.PopMenu;
      Desc_Otro.Control                    := ieDescOtro;
      ObtenerCtoPadre;
   end;
end;

procedure TWCDesRec.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Contrato.ID_CONTRATO.Control         := nil;
      Contrato.TITNOMBRE.Control           := nil;
      DesRecursos.ID_DESTINO_REC.Control   := nil;
      DesRecursos.DESC_DESTINO_REC.Control := nil;
      Desc_Otro.Control                    := nil;
   end;
end;

procedure TWCDesRec.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
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
         if DesRecursos.ID_DESTINO_REC.AsInteger <= 0 then
         begin
            ieIdDesRec.SetFocus;
            raise EInterFrame.Create('Seleccione un Destino de Recursos');
         end;
         if DesRecursos.ID_DESTINO_REC.AsInteger = 6 then
         begin
            if trim(Desc_Otro.AsString) = '' then
            begin
               ieDescOtro.SetFocus;
               raise EInterFrame.Create('Especifique un Destino de Recursos');
            end;
         end;
         if IsNewData then
         begin
            if GetSQL('select * '
                    + '  from cto_destino_recursos '
                    + ' where id_contrato    = ' + Contrato.ID_CONTRATO.AsSQL
                    + '   and id_destino_rec = ' + DesRecursos.ID_DESTINO_REC.AsSQL,
                      SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('Ya existe el Recurso Depositado en GFI para el Contrato');
         end;
         Objeto.HabilitarEspecifique(False);
         Realizado := True;
      except
         on e: EInterFrame do
         begin
            MessageDlg(e.Message, mtInformation, [mbOK], 0);
            Realizado := False;
         end;
      end;
end;

procedure TWCDesRec.InterForma1DespuesNuevo(Sender: TObject);
begin
   if Objeto.pContrato = nil then
      ieIdContrato.SetFocus
   else
   begin
      Objeto.ObtenerCtoPadre;
      ieIdDesRec.SetFocus;
   end;
   Objeto.HabilitarEspecifique(False);
end;

procedure TWCDesRec.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.AfterLocalizaDes(Sender);
   ieIdContrato.SetFocus;
end;

procedure TWCDesRec.InterForma1DespuesEliminar(Sender: TObject);
begin
   Objeto.HabilitarEspecifique(False);
end;

procedure TWCDesRec.InterForma1DespuesAceptar(Sender: TObject);
begin
   Objeto.HabilitarEspecifique(False);
end;

procedure TWCDesRec.InterForma1DespuesCancelar(Sender: TObject);
begin
   if not Objeto.Contrato.Active then
      Objeto.ObtenerCtoPadre;
   Objeto.HabilitarEspecifique(False);
end;

procedure TWCDesRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
