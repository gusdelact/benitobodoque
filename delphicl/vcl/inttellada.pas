//------------------------------------------------------------------------------
// Función    : Telefono Lada
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 11 de Octubre del 2013
//------------------------------------------------------------------------------
Unit IntTelLada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IntFrm,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind, UnSQL2,
  InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit, UnFunProcICB, IntTelPais,
  IntPob;

Type
  TTelLada = Class;

  TWTelLada = Class(TForm)
    InterForma1 : TInterForma;
    eDescPais: TEdit;
    sbPais: TSpeedButton;
    ieCvePais: TInterEdit;
    lPais: TLabel;
    lLada: TLabel;
    ieLada: TInterEdit;
    lDigNumLoc: TLabel;
    ieDigNumLoc: TInterEdit;
    sbEstado: TSpeedButton;
    lEstado: TLabel;
    eDescEstado: TEdit;
    ieCveEstado: TInterEdit;
    sbRegion: TSpeedButton;
    lRegion: TLabel;
    eDescRegion: TEdit;
    ieCveRegion: TInterEdit;
    sbCiudad: TSpeedButton;
    lCiudad: TLabel;
    eDescCiudad: TEdit;
    ieCveCiudad: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbPaisClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure sbEstadoClick(Sender: TObject);
    procedure sbRegionClick(Sender: TObject);
    procedure sbCiudadClick(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    private
      { Private declarations }
    public
      { Public declarations }
      Objeto : TTelLada;
    end;

  TTelLada = class(TInterFrame)
    private
      { Private declarations }
    protected
      { Protected declarations }
    public
      { Public declarations }
      Pais   : TTelPais;
      Estado : TPoblacion;
      Region : TPoblacion; // Campo [Ciudad] en tabla Poblacion
      Ciudad : TPoblacion; // Campo [Poblacion] en tabla Poblacion

      Cve_Poblac_Lada : TInterCampo;
      Cve_Lada        : TInterCampo;
      Dig_Num_Local   : TInterCampo;

      procedure   DataBaseChange;
      function    InternalBusca : Boolean; override;
      constructor Create(AOwner : TComponent); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      procedure   InternalDespuesLocaliza(Sender : TObject);
    published
      { Published declarations }
    end;
implementation
  {$R *.DFM}

procedure TTelLada.InternalDespuesLocaliza(Sender : TObject);
var
   Qry : TQuery;
begin
   try
      Qry := GetSQLQuery('select pa.cve_poblacion as cve_poblac_pais, '
                       + '       ed.cve_poblacion as cve_poblac_estado, '
                       + '       re.cve_poblacion as cve_poblac_region, '
                       + '       null             as cve_poblac_ciudad '
                       + '  from poblacion            re '
                       + '       inner join poblacion ed on ed.cve_poblacion = re.cve_poblac_ubic '
                       + '       inner join poblacion pa on pa.cve_poblacion = ed.cve_poblac_ubic '
                       + ' where re.cve_poblacion   = ' + Cve_Poblac_Lada.AsSQL
                       + '   and re.cve_tipo_poblac = ' + QuotedStr(cCiudad)
                       + ' union '
                       + 'select pa.cve_poblacion, '
                       + '       ed.cve_poblacion, '
                       + '       re.cve_poblacion, '
                       + '       cd.cve_poblacion '
                       + '  from poblacion            cd '
                       + '       inner join poblacion re on re.cve_poblacion = cd.cve_poblac_ubic '
                       + '       inner join poblacion ed on ed.cve_poblacion = re.cve_poblac_ubic '
                       + '       inner join poblacion pa on pa.cve_poblacion = ed.cve_poblac_ubic '
                       + ' where cd.cve_poblacion   = ' + Cve_Poblac_Lada.AsSQL
                       + '   and cd.cve_tipo_poblac = ' + QuotedStr(cPoblacion),
                         Self.Apli.DataBaseName, Self.Apli.SessionName, False);
      if Qry <> nil then
      begin
         Pais.FindKey  ([trim(Qry.FieldByName('CVE_POBLAC_PAIS').AsString)]);
         Estado.FindKey([trim(Qry.FieldByName('CVE_POBLAC_ESTADO').AsString)]);
         Region.FindKey([trim(Qry.FieldByName('CVE_POBLAC_REGION').AsString)]);
         Ciudad.FindKey([trim(Qry.FieldByName('CVE_POBLAC_CIUDAD').AsString)]);
      end;
   finally
      if Qry <> nil then
         Qry.Free;
   end;
end;

constructor TTelLada.Create(AOwner : TComponent);
begin
   Inherited;

   Pais                    := TTelPais.Create(Self);
   Pais.MasterSource       := Self;

   Estado                  := TPoblacion.Create(Self);
   Estado.MasterSource     := Self;
   Estado.BuscaWhereString := 'TIPO_POBLACION.CVE_TIPO_POBLAC = ' + QuotedStr(cEstado);

   Region                  := TPoblacion.Create(Self);
   Region.MasterSource     := Self;
   Region.BuscaWhereString := 'TIPO_POBLACION.CVE_TIPO_POBLAC = ' + QuotedStr(cCiudad);

   Ciudad                  := TPoblacion.Create(Self);
   Ciudad.MasterSource     := Self;
   Ciudad.BuscaWhereString := 'TIPO_POBLACION.CVE_TIPO_POBLAC = ' + QuotedStr(cPoblacion);

   Cve_Poblac_Lada := CreaCampo('CVE_POBLAC_LADA', ftString,  tsNinguno, tsNinguno, True);
   Cve_Lada        := CreaCampo('CVE_LADA',        ftInteger, tsNinguno, tsNinguno, True);
   Dig_Num_Local   := CreaCampo('DIG_NUM_LOCAL',   ftInteger, tsNinguno, tsNinguno, True);

   TableName       := 'TEL_LADA';
   FKeyFields.Add('CVE_POBLAC_LADA');

   OnAfterLocaliza := InternalDespuesLocaliza;
   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TTelLada.Destroy;
begin
   inherited;
end;

procedure TTelLada.DataBaseChange;
begin
   inherited;
   Pais.GetParams(Self);
   Estado.GetParams(Self);
   Region.GetParams(Self);
   Ciudad.GetParams(Self);
end;

function TTelLada.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWTelLada;
begin
   W := TWTelLada.Create(Self);
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

function TTelLada.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITTELLADA.IT', 'S');
   try
      if Active    then
      begin
         if Ciudad.Active then
            T.Param(0, Ciudad.Cve_Poblacion.AsString)
         else if Region.Active then
            T.Param(0, Region.Cve_Poblacion.AsString);
      end;
      if T.Execute then   InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

procedure TWTelLada.sbPaisClick(Sender: TObject);
begin
   Objeto.Pais.Busca;
end;

procedure TWTelLada.sbEstadoClick(Sender: TObject);
begin
   if Objeto.Pais.Active then
   begin
      Objeto.Estado.BuscaWhereString := 'POBLACION.CVE_POBLAC_UBIC = ' + Objeto.Pais.Cve_Poblac_Pais.AsSQL;
      Objeto.Estado.Busca;
   end
   else
      MessageDlg('Seleccione un Pais', mtInformation, [mbOK], 0);
end;

procedure TWTelLada.sbRegionClick(Sender: TObject);
begin
   if Objeto.Estado.Active then
   begin
      Objeto.Region.BuscaWhereString := 'POBLACION.CVE_POBLAC_UBIC = ' + Objeto.Estado.Cve_Poblacion.AsSQL;
      Objeto.Region.Busca;
   end
   else
      MessageDlg('Seleccione un Estado', mtInformation, [mbOK], 0);
end;

procedure TWTelLada.sbCiudadClick(Sender: TObject);
begin
   if Objeto.Region.Active then
   begin
      Objeto.Ciudad.BuscaWhereString := 'POBLACION.CVE_POBLAC_UBIC = ' + Objeto.Region.Cve_Poblacion.AsSQL;
      Objeto.Ciudad.Busca;
   end
   else
      MessageDlg('Seleccione una Region', mtInformation, [mbOK], 0);
end;

procedure TWTelLada.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Pais.Cve_Poblac_Pais.Control     := ieCvePais;
      Pais.Pais.Desc_Poblacion.Control := eDescPais;
      Pais.ShowMenuCatalogo            := True;
      Pais.ShowMenuReporte             := False;
      Pais.ShowMenuClear               := False;
      ieCvePais.PopupMenu              := Pais.PopMenu;
      Estado.Cve_Poblacion.Control     := ieCveEstado;
      Estado.Desc_Poblacion.Control    := eDescEstado;
      Estado.ShowMenuCatalogo          := True;
      Estado.ShowMenuReporte           := False;
      Estado.ShowMenuClear             := False;
      ieCveEstado.PopupMenu            := Estado.PopMenu;
      Region.Cve_Poblacion.Control     := ieCveRegion;
      Region.Desc_Poblacion.Control    := eDescRegion;
      Region.ShowMenuCatalogo          := True;
      Region.ShowMenuReporte           := False;
      Region.ShowMenuClear             := False;
      ieCveRegion.PopupMenu            := Region.PopMenu;
      Ciudad.Cve_Poblacion.Control     := ieCveCiudad;
      Ciudad.Desc_Poblacion.Control    := eDescCiudad;
      Ciudad.ShowMenuCatalogo          := True;
      Ciudad.ShowMenuReporte           := False;
      Ciudad.ShowMenuClear             := False;
      ieCveCiudad.PopupMenu            := Ciudad.PopMenu;
      Cve_Lada.Control                 := ieLada;
      Dig_Num_Local.Control            := ieDigNumLoc;
   end;
end;

procedure TWTelLada.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Pais.Cve_Poblac_Pais.Control     := nil;
      Pais.Pais.Desc_Poblacion.Control := nil;
      Estado.Cve_Poblacion.Control     := nil;
      Estado.Desc_Poblacion.Control    := nil;
      Region.Cve_Poblacion.Control     := nil;
      Region.Desc_Poblacion.Control    := nil;
      Ciudad.Cve_Poblacion.Control     := nil;
      Ciudad.Desc_Poblacion.Control    := nil;
      Cve_Lada.Control                 := nil;
      Dig_Num_Local.Control            := nil;
   end;
end;

procedure TWTelLada.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
begin
   with Objeto do
      try
         InterForma1.ShowError := False;
         GetFromControl;
         if trim(Pais.Cve_Poblac_Pais.AsString) = '' then
         begin
            ieCvePais.SetFocus;
            raise EInterFrame.Create('Seleccione un Pais');
         end;
         if trim(Estado.Cve_Poblacion.AsString) = '' then
         begin
            ieCveEstado.SetFocus;
            raise EInterFrame.Create('Seleccione un Estado');
         end;
         if (trim(Region.Cve_Poblacion.AsString) = '') and (trim(Ciudad.Cve_Poblacion.AsString) = '')  then
         begin
            ieCveRegion.SetFocus;
            raise EInterFrame.Create('Seleccione una Region o Ciudad');
         end;
         if trim(Cve_Lada.AsString) = '' then
         begin
            ieLada.SetFocus;
            raise EInterFrame.Create('Ingrese una Clave Lada');
         end;
         if trim(Dig_Num_Local.AsString) = '' then
         begin
            ieDigNumLoc.SetFocus;
            raise EInterFrame.Create('Ingrese los digitos del numero local');
         end;
         if Ciudad.Active then
            Cve_Poblac_Lada.AsString := trim(Ciudad.Cve_Poblacion.AsString)
         else
            Cve_Poblac_Lada.AsString := trim(Region.Cve_Poblacion.AsString);
         if IsNewData then
         begin
            if GetSQL('select * from tel_lada where cve_poblac_lada = ' + Cve_Poblac_Lada.AsSQL, SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('Ya existe el Telefono Lada');
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

procedure TWTelLada.InterForma1DespuesNuevo(Sender: TObject);
begin
   ieCvePais.SetFocus;
end;

procedure TWTelLada.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.InternalDespuesLocaliza(Sender);
   ieLada.SetFocus;
end;

procedure TWTelLada.InterForma1DespuesAceptar(Sender: TObject);
begin
   Objeto.InternalDespuesLocaliza(Sender);
end;

procedure TWTelLada.InterForma1DespuesCancelar(Sender: TObject);
begin
   Objeto.InternalDespuesLocaliza(Sender);
end;

procedure TWTelLada.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
