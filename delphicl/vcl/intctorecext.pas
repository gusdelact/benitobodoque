//------------------------------------------------------------------------------
// Función    : Recursos Extranjeros
// Desarrollo : Abel Alejandro Salazar Carrillo
// Fecha      : Abril del 2013
//------------------------------------------------------------------------------
Unit IntCtoRecExt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind,
  UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntCtoHeader, IntPob;

Type
  TCtoRecExt = class;

  TWCtoRecursosExt = Class(TForm)
    InterForma1 : TInterForma;
    lbBANCO_ORIGEN : TLabel;
    edBancoOrigen: TEdit;
    lbORDENANTE_ORIGEN : TLabel;
    edOrdOrigen: TEdit;
    lContrato: TLabel;
    ieIdContrato: TInterEdit;
    sbContrato: TSpeedButton;
    edTitular: TEdit;
    lbNACIONALIDAD_PEPS: TLabel;
    edCvePais: TEdit;
    sbPais: TSpeedButton;
    edDescPais: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure sbContratoClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure sbPaisClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCtoRecExt;
end;

  TCtoRecExt= class(TInterFrame)
   private
   protected
     vContrato : TInterFrame;

   public
     Contrato : TCtrlCto;
     Pais     : TPoblacion;

     Id_Contrato      : TInterCampo;
     Pais_Origen      : TInterCampo;
     Banco_Origen     : TInterCampo;
     Ordenante_Origen : tintercampo;

     procedure   ObtenerCtoPadre;

     procedure   DataBaseChange;
     function    InternalBusca : Boolean; override;
     constructor Create( AOwner : TComponent ); override;
     destructor  Destroy; override;
     function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
     property    pContrato : TInterFrame read vContrato write vContrato;
   published
   end;

implementation
  {$R *.DFM}

procedure TCtoRecExt.ObtenerCtoPadre;
begin
   if (pContrato <> nil) and (pContrato.Active) then
      Contrato.FindKey([pContrato.FieldByName('ID_CONTRATO').AsInteger]);
end;

constructor TCtoRecExt.Create( AOwner : TComponent );
begin
   Inherited;

   Contrato              := TCtrlCto.Create(Self);
   Contrato.MasterSource := Self;
   Contrato.FieldByName('ID_CONTRATO').MasterField := 'ID_CONTRATO';

   Pais                           := TPoblacion.Create(Self);
   Pais.MasterSource              := self;
   Pais.Cve_Poblacion.MasterField := 'PAIS_ORIGEN';
   Pais.FilterBy                  := fbTPoblacionPais;

   Id_Contrato      := CreaCampo('ID_CONTRATO'     ,ftFloat,tsNinguno,tsNinguno,True);
   Pais_Origen      := CreaCampo('PAIS_ORIGEN'     ,ftString,tsNinguno,tsNinguno,True);
   Banco_Origen     := CreaCampo('BANCO_ORIGEN'    ,ftString,tsNinguno,tsNinguno,True);
   Ordenante_Origen := CreaCampo('ORDENANTE_ORIGEN',ftString,tsNinguno,tsNinguno,True);

   FKeyFields.Add('ID_CONTRATO');

   TableName := 'CTO_RECURSOS_EXT';
   UseQuery  := True;
end;

Destructor TCtoRecExt.Destroy;
begin
   inherited;
end;

function TCtoRecExt.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWCtoRecursosExt;
begin
   W := TWCtoRecursosExt.Create(Self);
   try
      W.Objeto                    := Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := FormaTipo;
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.ShowBtnAyuda  := False;
      W.InterForma1.Funcion       := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow                  := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCtoRecExt.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ICTREEX.IT', 'F');
   try
      if Active then
         T.Param(0, Contrato.Id_Contrato.AsString);
      if Contrato.Active then
      begin
         if Contrato.ID_CONTRATO.AsInteger > 0 then
            T.WhereString := 'CTO_RECURSOS_EXT.ID_CONTRATO = ' + Contrato.Id_Contrato.AsSQL;
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

procedure TCtoRecExt.DataBaseChange;
begin
   inherited;
   Contrato.GetParams(Self);
   Pais.GetParams(Self);
end;

procedure TWCtoRecursosExt.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Contrato.Id_Contrato.Control := ieIdContrato;
      Contrato.TITNOMBRE.Control   := edTitular;
      Pais.Cve_Poblacion.Control   := edCvePais;
      Pais.Desc_Poblacion.Control  := edDescPais;
      Banco_Origen.Control         := edBancoOrigen;
      Ordenante_Origen.Control     := edOrdOrigen;
      ObtenerCtoPadre;
   end;
end;

procedure TWCtoRecursosExt.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Contrato.Id_Contrato.Control := nil;
      Contrato.TITNOMBRE.Control   := nil;
      Pais.Cve_Poblacion.Control   := nil;
      Pais.Desc_Poblacion.Control  := nil;
      Banco_Origen.Control         := nil;
      Ordenante_Origen.Control     := nil;
   end;
end;

procedure TWCtoRecursosExt.InterForma1DespuesNuevo(Sender: TObject);
begin
   if Objeto.pContrato = nil then   ieIdContrato.SetFocus
   else                             Objeto.ObtenerCtoPadre;
end;

procedure TWCtoRecursosExt.sbContratoClick(Sender: TObject);
begin
   if (Objeto.pContrato <> nil) and (Objeto.pContrato.Active) then   Objeto.ObtenerCtoPadre
   else                                                              Objeto.Contrato.Busca;
end;

procedure TWCtoRecursosExt.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
begin
   with Objeto do
      try
         InterForma1.ShowError := False;
         GetFromControl;
         if Contrato.Id_Contrato.AsInteger <= 0 then
         begin
            ieIdContrato.SetFocus;
            raise EInterFrame.Create('Seleccione un Contrato');
         end;
         if trim(edCvePais.Text) = '' then
         begin
            edCvePais.SetFocus;
            raise EInterFrame.Create('Seleccione un Pais');
         end;
         if trim(edBancoOrigen.Text) = '' then
         begin
            edBancoOrigen.SetFocus;
            raise EInterFrame.Create('Ingrese el Banco');
         end;
         if trim(edOrdOrigen.Text) = '' then
         begin
            edOrdOrigen.SetFocus;
            raise EInterFrame.Create('Ingrese el Nombre de Ordenante');
         end;
         if IsNewData then
         begin
            if GetSQL('select * from cto_recursos_ext where id_contrato = ' + Contrato.ID_CONTRATO.AsSQL, SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('Ya existe el Recurso Extranjero para el Contrato');
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

procedure TWCtoRecursosExt.InterForma1DespuesCancelar(Sender: TObject);
begin
   if not Objeto.Contrato.Active then
      Objeto.ObtenerCtoPadre;
end;

procedure TWCtoRecursosExt.sbPaisClick(Sender: TObject);
begin
   Objeto.Pais.Busca;
end;

procedure TWCtoRecursosExt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
