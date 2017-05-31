//------------------------------------------------------------------------------
// Función    : Telefono Persona
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 14 de Octubre del 2013
//------------------------------------------------------------------------------
Unit IntTelPersona;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IntFrm,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind, UnSQL2,
  InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit, UnFunProcICB, IntPers,
  IntTelTipo, IntTelLada;

Type
  EAbort = class(eConvertError)
end;

Type
  TTelPers = Class;

  TWTelPers = Class(TForm)
    InterForma1 : TInterForma;
    lNumero: TLabel;
    ieNumero: TInterEdit;
    lExtension: TLabel;
    ieExtension: TInterEdit;
    sbPersona: TSpeedButton;
    lPersona: TLabel;
    eNomPersona: TEdit;
    ieIdPersona: TInterEdit;
    gbLada: TGroupBox;
    lPais: TLabel;
    lEstado: TLabel;
    lRegion: TLabel;
    lCiudad: TLabel;
    eDescPais: TEdit;
    ieCvePais: TInterEdit;
    eDescEstado: TEdit;
    ieCveEstado: TInterEdit;
    eDescRegion: TEdit;
    ieCveRegion: TInterEdit;
    eDescCiudad: TEdit;
    ieCveCiudad: TInterEdit;
    sbTipo: TSpeedButton;
    lTipo: TLabel;
    eDescTipo: TEdit;
    ieCveTipo: TInterEdit;
    sbLada: TSpeedButton;
    lLada: TLabel;
    ieLada: TInterEdit;
    rgPrincipal: TRadioGroup;
    lPrincipal: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure sbPersonaClick(Sender: TObject);
    procedure sbTipoClick(Sender: TObject);
    procedure sbLadaClick(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    private
      { Private declarations }
    public
      { Public declarations }
      Objeto : TTelPers;
    end;

  TTelPers = class(TInterFrame)
    private
      { Private declarations }
    protected
      { Protected declarations }
      vPersonaPadre : TInterFrame;
    public
      { Public declarations }
      Pers : TPersona;
      Tipo : TTipoTel;
      Lada : TTelLada;

      Id_Persona      : TInterCampo;
      Cve_Tel_Tipo    : TInterCampo;
      Cve_Poblac_Lada : TInterCampo;
      Numero          : TInterCampo;
      Extension       : TInterCampo;
      B_Principal     : TInterCampo;

      procedure   ObtenerPersonaPadre;

      procedure   DataBaseChange;
      function    InternalBusca : Boolean; override;
      constructor Create(AOwner : TComponent); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      procedure   InternalDespuesLocaliza(Sender : TObject);
      property    pPersonaPadre : TInterFrame read vPersonaPadre write vPersonaPadre;
    published
      { Published declarations }
    end;
implementation
  {$R *.DFM}

procedure TTelPers.ObtenerPersonaPadre;
begin
   if (pPersonaPadre <> nil) and (pPersonaPadre.Active) then
      Pers.FindKey([pPersonaPadre.FieldByName('ID_PERSONA').AsInteger]);
end;

procedure TTelPers.InternalDespuesLocaliza(Sender : TObject);
begin
   Lada.InternalDespuesLocaliza(Self);
end;

constructor TTelPers.Create(AOwner : TComponent);
begin
   Inherited;

   Pers              := TPersona.Create(Self);
   Pers.MasterSource := Self;
   Pers.FieldByName('ID_PERSONA').MasterField := 'ID_PERSONA';

   Tipo              := TTipoTel.Create(Self);
   Tipo.MasterSource := Self;
   Tipo.FieldByName('CVE_TEL_TIPO').MasterField := 'CVE_TEL_TIPO';

   Lada              := TTelLada.Create(Self);
   Lada.MasterSource := Self;
   Lada.FieldByName('CVE_POBLAC_LADA').MasterField := 'CVE_POBLAC_LADA';

   Id_Persona      := CreaCampo('ID_PERSONA',      ftInteger, tsNinguno, tsNinguno, True);
   Cve_Tel_Tipo    := CreaCampo('CVE_TEL_TIPO',    ftString,  tsNinguno, tsNinguno, True);
   Cve_Poblac_Lada := CreaCampo('CVE_POBLAC_LADA', ftString,  tsNinguno, tsNinguno, True);
   Numero          := CreaCampo('NUMERO',          ftString,  tsNinguno, tsNinguno, True);
   Extension       := CreaCampo('EXTENSION',       ftString,  tsNinguno, tsNinguno, True);
   B_Principal     := CreaCampo('B_PRINCIPAL',     ftString,  tsNinguno, tsNinguno, True);
   with B_Principal do
   begin
      Size := 1;             UseCombo := True;
      ComboLista.Add('0');   ComboDatos.Add('V');
      ComboLista.Add('1');   ComboDatos.Add('F');
   end;

   TableName := 'TEL_PERSONA';
   FKeyFields.Add('ID_PERSONA');
   FKeyFields.Add('CVE_TEL_TIPO');
   FKeyFields.Add('CVE_POBLAC_LADA');
   FKeyFields.Add('NUMERO');

   OnAfterLocaliza := InternalDespuesLocaliza;
   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TTelPers.Destroy;
begin
   inherited;
end;

procedure TTelPers.DataBaseChange;
begin
   inherited;
   Pers.GetParams(Self);
   Tipo.GetParams(Self);
   Lada.GetParams(Self);
end;

function TTelPers.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWTelPers;
begin
   W := TWTelPers.Create(Self);
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

function TTelPers.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITTELPERSONA.IT', 'S,S,S,S');
   try
      if Active    then
      begin
         T.Param(0, Pers.Id_Persona.AsString);
         T.Param(1, Tipo.Cve_Tel_Tipo.AsString);
         T.Param(2, Lada.Cve_Poblac_Lada.AsString);
         T.Param(3, Numero.AsString);
      end;
      if T.Execute then   InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3)]);
   finally
      T.Free;
   end;
end;

procedure TWTelPers.sbPersonaClick(Sender: TObject);
begin
   if (Objeto.pPersonaPadre <> nil) and (Objeto.pPersonaPadre.Active) then
      Objeto.ObtenerPersonaPadre
   else
      Objeto.Pers.Busca;
end;

procedure TWTelPers.sbTipoClick(Sender: TObject);
begin
   Objeto.Tipo.Busca;
end;

procedure TWTelPers.sbLadaClick(Sender: TObject);
begin
   Objeto.Lada.Busca;
end;

procedure TWTelPers.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Pers.Id_Persona.Control               := ieIdPersona;
      Pers.Nombre.Control                   := eNomPersona;
      Pers.ShowMenuCatalogo                 := True;
      Pers.ShowMenuReporte                  := False;
      Pers.ShowMenuClear                    := False;
      ieIdPersona.PopupMenu                 := Pers.PopMenu;
      Tipo.Cve_Tel_Tipo.Control             := ieCveTipo;
      Tipo.Desc_Tel_Tipo.Control            := eDescTipo;
      Tipo.ShowMenuCatalogo                 := True;
      Tipo.ShowMenuReporte                  := False;
      Tipo.ShowMenuClear                    := False;
      ieCveTipo.PopupMenu                   := Tipo.PopMenu;
      Lada.Pais.Cve_Poblac_Pais.Control     := ieCvePais;
      Lada.Pais.Pais.Desc_Poblacion.Control := eDescPais;
      Lada.Estado.Cve_Poblacion.Control     := ieCveEstado;
      Lada.Estado.Desc_Poblacion.Control    := eDescEstado;
      Lada.Region.Cve_Poblacion.Control     := ieCveRegion;
      Lada.Region.Desc_Poblacion.Control    := eDescRegion;
      Lada.Ciudad.Cve_Poblacion.Control     := ieCveCiudad;
      Lada.Ciudad.Desc_Poblacion.Control    := eDescCiudad;
      Lada.Cve_Lada.Control                 := ieLada;
      Lada.ShowMenuCatalogo                 := True;
      Lada.ShowMenuReporte                  := False;
      Lada.ShowMenuClear                    := False;
      ieLada.PopupMenu                      := Lada.PopMenu;
      Numero.Control                        := ieNumero;
      Extension.Control                     := ieExtension;
      B_Principal.Control                   := rgPrincipal;
      ObtenerPersonaPadre;
   end;
end;

procedure TWTelPers.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Pers.Id_Persona.Control               := nil;
      Pers.Nombre.Control                   := nil;
      Tipo.Cve_Tel_Tipo.Control             := nil;
      Tipo.Desc_Tel_Tipo.Control            := nil;
      Lada.Pais.Cve_Poblac_Pais.Control     := nil;
      Lada.Pais.Pais.Desc_Poblacion.Control := nil;
      Lada.Estado.Cve_Poblacion.Control     := nil;
      Lada.Estado.Desc_Poblacion.Control    := nil;
      Lada.Region.Cve_Poblacion.Control     := nil;
      Lada.Region.Desc_Poblacion.Control    := nil;
      Lada.Ciudad.Cve_Poblacion.Control     := nil;
      Lada.Ciudad.Desc_Poblacion.Control    := nil;
      Lada.Cve_Lada.Control                 := nil;
      Numero.Control                        := nil;
      Extension.Control                     := nil;
      B_Principal.Control                   := nil;
   end;
end;

procedure TWTelPers.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
begin
   with Objeto do
      try
         InterForma1.ShowError := False;
         GetFromControl;
         if Pers.Id_Persona.AsInteger = 0 then
         begin
            ieIdPersona.SetFocus;
            raise EInterFrame.Create('Seleccione una Persona');
         end;
         if trim(Tipo.Cve_Tel_Tipo.AsString) = '' then
         begin
            ieIdPersona.SetFocus;
            raise EInterFrame.Create('Seleccione un Tipo');
         end;
         if trim(Lada.Cve_Poblac_Lada.AsString) = '' then
         begin
            ieLada.SetFocus;
            raise EInterFrame.Create('Seleccione una Lada');
         end;
         if trim(Numero.AsString) = '' then
         begin
            ieNumero.SetFocus;
            raise EInterFrame.Create('Ingrese un Numero');
         end;
         if Lada.Dig_Num_Local.AsInteger <> length(ieNumero.Text) then
         begin
            if MessageDlg('El numero de digitos para el numero local de lada, debe ser de ' + IntToStr(Lada.Dig_Num_Local.AsInteger) + ' digito(s) ¿Desea continuar?', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
            begin
               ieNumero.SetFocus;
               raise EAbort.Create('');
            end;
         end;
         if (trim(Tipo.B_Extension.AsString) = cVerdadero) and (trim(Extension.AsString) = '') then
         begin
            if MessageDlg('El Tipo de Telefono requiere Extension, ¿Desea continuar?', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
            begin
               ieExtension.SetFocus;
               raise EAbort.Create('');
            end;
         end;
         if trim(B_Principal.AsString) = cVerdadero then
         begin
            // Por peticion de Rafael Hernandez Callejas, solo se permite 2 telefonos principales para efectos de impresion en el proemio ICB.
            if GetSQL('select id_persona, count(*) '
                    + '  from tel_persona '
                    + ' where id_persona  = ' + Pers.Id_Persona.AsSQL
                    + '   and b_principal = ' + QuotedStr(cVerdadero)
                    + '   and (cve_tel_tipo, cve_poblac_lada, numero) not in (select ' + Tipo.Cve_Tel_Tipo.AsSQL    + ', ' // Excluir registro en pantalla
                                                                                       + Lada.Cve_Poblac_Lada.AsSQL + ', '
                                                                                       + Numero.AsSQL               +
                                                                              ' from dual)'
                    + ' group by id_persona '
                    + 'having count(*) >= 2',
                      SeguDataBaseName, SeguSessionName, False) then
            begin
               rgPrincipal.SetFocus;
               raise EInterFrame.Create('Ya se han configurado los 2 telefonos permitidos para Imprimir en el Proemio');
            end;
         end;
         if IsNewData then
         begin
            if GetSQL('select * '
                    + '  from tel_persona '
                    + ' where id_persona      = ' + Pers.Id_Persona.AsSQL
                    + '   and cve_tel_tipo    = ' + Tipo.Cve_Tel_Tipo.AsSQL
                    + '   and cve_poblac_lada = ' + Lada.Cve_Poblac_Lada.AsSQL
                    + '   and numero          = ' + Numero.AsSQL,
                      SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('Ya existe el Telefono de Persona');
         end;
         Realizado := True;
      except
         on e: EInterFrame do
         begin
            MessageDlg(e.Message, mtInformation, [mbOK], 0);
            Realizado := False;
         end;
         on e: EAbort do
            Realizado := False;
      end;
end;

procedure TWTelPers.InterForma1DespuesNuevo(Sender: TObject);
begin
   if Objeto.pPersonaPadre = nil then
      ieIdPersona.SetFocus
   else
   begin
      Objeto.ObtenerPersonaPadre;
      ieCveTipo.SetFocus;
   end;
end;

procedure TWTelPers.InterForma1DespuesModificar(Sender: TObject);
begin
   ieExtension.SetFocus;
end;

procedure TWTelPers.InterForma1DespuesCancelar(Sender: TObject);
begin
   if not Objeto.Pers.Active then
      Objeto.ObtenerPersonaPadre;
end;

procedure TWTelPers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
