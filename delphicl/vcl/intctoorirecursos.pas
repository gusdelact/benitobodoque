//------------------------------------------------------------------------------
// Función    : Origen de Recursos por Contrato
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 12 de Febrero del 2013
//------------------------------------------------------------------------------
Unit IntCtoOriRecursos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IntFrm,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind, UnSQL2,
  InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit, IntCtoHeader, IntCtoOriRec,
  IntPerFrecue;

Type
  TCOriRec = Class;

  TWCOriRec = Class(TForm)
    InterForma1 : TInterForma;
    eTitular: TEdit;
    sbContrato: TSpeedButton;
    ieIdContrato: TInterEdit;
    lContrato: TLabel;
    eDescFrecuencia: TEdit;
    sbFrecuencia: TSpeedButton;
    ieCveFrecuencia: TInterEdit;
    lFrecuencia: TLabel;
    lOtro: TLabel;
    ieDescOtro: TInterEdit;
    lOriRec: TLabel;
    ieIdOriRec: TInterEdit;
    sbOriRec: TSpeedButton;
    eDescOriRec: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbOriRecClick(Sender: TObject);
    procedure sbContratoClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure sbFrecuenciaClick(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    private
       { Private declarations }
    public
       { Public declarations }
       Objeto : TCOriRec;
    end;

  TCOriRec = class(TInterFrame)
    private
       { Private declarations }
    protected
       { Protected declarations }
       vContrato : TInterFrame;
    public
       { Public declarations }
       Ventana        : TWCOriRec;
       Contrato       : TCtrlCto;
       OriRecursos    : TCtoOriRec;
       Frecuencia     : TPerFrecue;

       Id_Contrato    : TInterCampo;
       Id_Origen_Rec  : TInterCampo;
       Desc_Otro      : TInterCampo;
       Cve_Frecuencia : TInterCampo;

       procedure    ObtenerCtoPadre;
       procedure    HabilitarEspecifique(pHabilitar : Boolean);

       procedure    DataBaseChange;
       function     InternalBusca : Boolean; override;
       constructor  Create( AOwner : TComponent ); override;
       destructor   Destroy; override;
       function     ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
       procedure    AfterLocalizaOri(Sender : TObject);
       property     pContrato : TInterFrame read vContrato write vContrato;
    published
       { Published declarations }
    end;
implementation
   {$R *.DFM}

procedure TCOriRec.ObtenerCtoPadre;
begin
   if (pContrato <> nil) and (pContrato.Active) then
      Contrato.FindKey([pContrato.FieldByName('ID_CONTRATO').AsInteger]);
end;

procedure TCOriRec.HabilitarEspecifique(pHabilitar : Boolean);
begin
   if pHabilitar then Ventana.ieDescOtro.Color := clWindow
   else               Ventana.ieDescOtro.Color := clBtnFace;
   Ventana.ieDescOtro.Enabled := pHabilitar;
end;

procedure TCOriRec.AfterLocalizaOri(Sender : TObject);
begin
   if OriRecursos.Active then
   begin
      // Negocio Propio u Otro (PF y PM)
      if (OriRecursos.ID_ORIGEN_REC.AsInteger = 4) or (OriRecursos.ID_ORIGEN_REC.AsInteger = 7) or (OriRecursos.ID_ORIGEN_REC.AsInteger = 948) then
         HabilitarEspecifique(True)
      else
      begin
         Ventana.ieDescOtro.Clear;
         HabilitarEspecifique(False);
      end;
   end
   else
   begin
      Ventana.ieDescOtro.Clear;
      HabilitarEspecifique(OriRecursos.Active);
   end;
end;

constructor TCOriRec.Create( AOwner : TComponent );
begin
   Inherited;

   Ventana := Nil;

   Contrato              := TCtrlCto.Create(Self);
   Contrato.MasterSource := Self;
   Contrato.FieldByName('ID_CONTRATO').MasterField := 'ID_CONTRATO';

   OriRecursos                                          := TCtoOriRec.Create(Self);
   OriRecursos.MasterSource                             := Self;
   OriRecursos.FieldByName('ID_ORIGEN_REC').MasterField := 'ID_ORIGEN_REC';
   OriRecursos.OnAfterLocaliza                          := AfterLocalizaOri;

   Frecuencia              := TPerFrecue.Create(Self);
   Frecuencia.MasterSource := Self;
   Frecuencia.FieldByName('CVE_FRECUENCIA').MasterField := 'CVE_FRECUENCIA';

   Id_Contrato    := CreaCampo('ID_CONTRATO',    ftInteger, tsNinguno, tsNinguno, True);
   Id_Origen_Rec  := CreaCampo('ID_ORIGEN_REC',  ftInteger, tsNinguno, tsNinguno, True);
   Desc_Otro      := CreaCampo('DESC_OTRO',      ftString,  tsNinguno, tsNinguno, True);
   Cve_Frecuencia := CreaCampo('CVE_FRECUENCIA', ftString,  tsNinguno, tsNinguno, True);

   FKeyFields.Add('ID_CONTRATO');
   FKeyFields.Add('ID_ORIGEN_REC');

   TableName       := 'CTO_ORIGEN_RECURSOS';
   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TCOriRec.Destroy;
begin
   inherited;
end;

procedure TCOriRec.DataBaseChange;
begin
   inherited;
   Contrato.GetParams(Self);
   OriRecursos.GetParams(Self);
   Frecuencia.GetParams(Self);
end;

function TCOriRec.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWCOriRec;
begin
   W := TWCOriRec.Create(Self);
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

function TCOriRec.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITCTOORIREC.IT', 'S,S');
   try
      if Active then
      begin
         T.Param(0, Contrato.ID_CONTRATO.AsString);
         T.Param(1, OriRecursos.ID_ORIGEN_REC.AsString);
      end;
      if Contrato.Active then
      begin
         if Contrato.ID_CONTRATO.AsInteger > 0 then
            T.WhereString := 'CTO_ORIGEN_RECURSOS.ID_CONTRATO = ' + Contrato.ID_CONTRATO.AsSQL;
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1)]);
   finally
      T.Free;
   end;
end;

procedure TWCOriRec.sbContratoClick(Sender: TObject);
begin
   if (Objeto.pContrato <> nil) and (Objeto.pContrato.Active) then
      Objeto.ObtenerCtoPadre
   else
      Objeto.Contrato.Busca;
end;

procedure TWCOriRec.sbOriRecClick(Sender: TObject);
begin
   Objeto.OriRecursos.BuscaWhereString := 'CTO_ORIGEN_REC.B_VAL_PLD = ''V'' AND CVE_PER_JURIDICA = ' + Objeto.Contrato.TITCVE_PER_JURIDICA.AsSQL;
   Objeto.OriRecursos.Busca;
   Objeto.OriRecursos.BuscaWhereString := '';
end;

procedure TWCOriRec.sbFrecuenciaClick(Sender: TObject);
begin
   Objeto.Frecuencia.Busca;
end;

procedure TWCOriRec.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Contrato.ID_CONTRATO.Control        := ieIdContrato;
      Contrato.TITNOMBRE.Control          := eTitular;
      Contrato.ShowMenuCatalogo           := True;
      Contrato.ShowMenuReporte            := False;
      Contrato.ShowMenuClear              := False;
      ieIdContrato.PopupMenu              := Contrato.PopMenu;
      OriRecursos.ID_ORIGEN_REC.Control   := ieIdOriRec;
      OriRecursos.DESC_ORIGEN_REC.Control := eDescOriRec;
      OriRecursos.ShowMenuCatalogo        := True;
      OriRecursos.ShowMenuReporte         := False;
      OriRecursos.ShowMenuClear           := False;
      ieIdOriRec.PopupMenu                := OriRecursos.PopMenu;
      Desc_Otro.Control                   := ieDescOtro;
      Frecuencia.Clave.Control            := ieCveFrecuencia;
      Frecuencia.Descripcion.Control      := eDescFrecuencia;
      Frecuencia.ShowMenuCatalogo         := True;
      Frecuencia.ShowMenuReporte          := False;
      Frecuencia.ShowMenuClear            := False;
      ieCveFrecuencia.PopupMenu           := Frecuencia.PopMenu;
      ObtenerCtoPadre;
   end;
end;

procedure TWCOriRec.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Contrato.ID_CONTRATO.Control        := nil;
      Contrato.TITNOMBRE.Control          := nil;
      OriRecursos.ID_ORIGEN_REC.Control   := nil;
      OriRecursos.DESC_ORIGEN_REC.Control := nil;
      Desc_Otro.Control                   := nil;
      Frecuencia.Clave.Control            := nil;
      Frecuencia.Descripcion.Control      := nil;
   end;
end;

procedure TWCOriRec.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
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
         if OriRecursos.ID_ORIGEN_REC.AsInteger <= 0 then
         begin
            ieIdOriRec.SetFocus;
            raise EInterFrame.Create('Seleccione un Origen de Recursos');
         end;
         // Negocio Propio u Otro (PF y PM)
         if (OriRecursos.ID_ORIGEN_REC.AsInteger = 4) or (OriRecursos.ID_ORIGEN_REC.AsInteger = 7) or (OriRecursos.ID_ORIGEN_REC.AsInteger = 948) then
         begin
            if trim(Desc_Otro.AsString) = '' then
            begin
               ieDescOtro.SetFocus;
               raise EInterFrame.Create('Especifique un Origen de Recursos');
            end;
         end;
         {if trim(Frecuencia.Clave.AsString) = '' then
         begin
            ieCveFrecuencia.SetFocus;
            raise EInterFrame.Create('Seleccione una Frecuencia');
         end;}
         if IsNewData then
         begin
            if GetSQL('select * '
                    + '  from cto_origen_recursos '
                    + ' where id_contrato   = ' + Contrato.ID_CONTRATO.AsSQL
                    + '   and id_origen_rec = ' + OriRecursos.ID_ORIGEN_REC.AsSQL,
                      SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('Ya existe el Origen de Recursos para el Contrato');
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

procedure TWCOriRec.InterForma1DespuesNuevo(Sender: TObject);
begin
   if Objeto.pContrato = nil then
      ieIdContrato.SetFocus
   else
   begin
      Objeto.ObtenerCtoPadre;
      ieIdOriRec.SetFocus;
   end;
   Objeto.HabilitarEspecifique(False);
end;

procedure TWCOriRec.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.AfterLocalizaOri(Sender);
   //ieCveFrecuencia.SetFocus;
end;

procedure TWCOriRec.InterForma1DespuesEliminar(Sender: TObject);
begin
   Objeto.HabilitarEspecifique(False);
end;

procedure TWCOriRec.InterForma1DespuesAceptar(Sender: TObject);
begin
   Objeto.HabilitarEspecifique(False);
end;

procedure TWCOriRec.InterForma1DespuesCancelar(Sender: TObject);
begin
   if not Objeto.Contrato.Active then
      Objeto.ObtenerCtoPadre;
   Objeto.HabilitarEspecifique(False);
end;

procedure TWCOriRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
