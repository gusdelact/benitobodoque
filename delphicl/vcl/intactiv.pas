//------------------------------------------------------------------------------
// Función    : Catálogo de Actividades
// Desarrollo : Jose Alberto Ramirez Pacheco
// Modifico   : Cesar Zamora Ramirez
// Fecha      : 05 de Abril del 2000
//------------------------------------------------------------------------------
unit IntActiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind,
  UnSQL2, InterFun, UnGene, InterEdit, IntLDiActEco, IntLinkit;

Type
  TTipoSeccion = (tsNOCaptura, tsLocate, tsTipoCliente, tsResidencia, tsTipoSector, tsSector, tsSubSector, tsRama, tsSubRama, tsInciso);

  TActividad= Class;
  TWActividad= class(TForm)
    InterForma1    : TInterForma;
    lbICveActividad: TLabel;
    EdCveActividad: TEdit;
    lbDescActividad: TLabel;
    EdActividad: TEdit;
    rgSituacion: TRadioGroup;
    btReporte: TBitBtn;
    Label1: TLabel;
    edCveOriginal: TEdit;
    Label34: TLabel;
    sbTipoCliente: TSpeedButton;
    Label39: TLabel;
    Label40: TLabel;
    sbResidencia: TSpeedButton;
    Label44: TLabel;
    sbTipoSector: TSpeedButton;
    sbSector: TSpeedButton;
    sbSubSector: TSpeedButton;
    sbRama: TSpeedButton;
    sbSubRama: TSpeedButton;
    Label41: TLabel;
    Label42: TLabel;
    Label45: TLabel;
    edCveTipoCliente: TEdit;
    edCveResidencia: TEdit;
    edCveTipoSector: TEdit;
    edCveSector: TEdit;
    edCveSubSector: TEdit;
    edCveRama: TEdit;
    edCveSubRama: TEdit;
    edTipoCliente: TEdit;
    edResidencia: TEdit;
    edTipoSector: TEdit;
    edSector: TEdit;
    edSubSector: TEdit;
    edRama: TEdit;
    edSubRama: TEdit;
    Bevel1: TBevel;
    Label2: TLabel;
    sbInciso: TSpeedButton;
    Label3: TLabel;
    edCveInciso: TEdit;
    edInciso: TEdit;
    Label4: TLabel;
    iedPtosRiesgo: TInterEdit;
    Label5: TLabel;
    sbCveSITI: TSpeedButton;
    edDescSITI: TEdit;
    edCveSITI: TEdit;
    linkActPadre: TInterLinkit;
    sbActPadre: TSpeedButton;
    chkAplicaRFC: TCheckBox;
    Bevel2: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    cbCveTipoSector: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cbCveSector: TComboBox;
    cbCveRama: TComboBox;
    cbCveSubRama: TComboBox;
    cB_CONDUSEF: TCheckBox;
    Label11: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btReporteClick(Sender: TObject);
    procedure sbTipoClienteClick(Sender: TObject);
    procedure sbResidenciaClick(Sender: TObject);
    procedure sbTipoSectorClick(Sender: TObject);
    procedure sbSectorClick(Sender: TObject);
    procedure sbSubSectorClick(Sender: TObject);
    procedure sbRamaClick(Sender: TObject);
    procedure sbSubRamaClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure sbIncisoClick(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1ErrorAceptar(Sender: TObject);
    procedure sbCveSITIClick(Sender: TObject);
    procedure sbActPadreClick(Sender: TObject);
    procedure linkActPadreEjecuta(Sender: TObject);
    procedure linkActPadreCapture(Sender: TObject; var Show: Boolean);
    procedure cbCveSectorChange(Sender: TObject);
    procedure cbCveRamaChange(Sender: TObject);
  private
    { Private declarations }
    FTipoCaptura: TTipoSeccion;
  protected
    Procedure SetTipoCaptura(Value: TTipoSeccion);
  public
    { Public declarations }
    Objeto : TActividad;
    Property TipoCaptura: TTipoSeccion Read FTipoCaptura Write SetTipoCaptura;
  end;

  TActividad  = class(TInterFrame)
  private
    { RAPA4293 Mar2014 Campos de Clasificación Contable }
    qInfoConta: TQuery;

    FDecodeKey    : Boolean;
    FTipoSeccion  : TTipoSeccion;
    Procedure CreateBaseObject;
    Function  PrepareSearch(): Boolean;
    Function  AfterSearch(): Boolean;
  protected
    Procedure SetDecodeKey(Value: Boolean);
    Procedure LocalizaClaveOrigen(Padre: TActividad);

    { RAPA4293 Mar2014 Campos de Clasificación Contable }
    procedure refreshCombosConta(pSector: String = ''; pRama: String = ''; pSubRama: String = '');
    function getCvePerJuridica(): String;

    Procedure AfterLocalizaTipoCliente(Sender:TObject);
    Procedure AfterLocalizaResidencia(Sender:TObject);
    Procedure AfterLocalizaTipoSector(Sender:TObject);
    Procedure AfterLocalizaSector(Sender:TObject);
    Procedure AfterLocalizaSubSector(Sender:TObject);
    Procedure AfterLocalizaRama(Sender:TObject);
    Procedure AfterLocalizaSubRama(Sender:TObject);
    Procedure AfterLocalizaInciso(Sender:TObject);
  public
    { Public declarations }
    CVE_ACTIV_CTO  : TInterCampo;
    CVE_ACTIV_ORIG : TInterCampo;
    DESC_ACTIVIDAD : TInterCampo;
    B_PRESENTA     : TInterCampo;
    B_APLICA_RFC   : TInterCampo;
    Ptos_Riesgo    : TInterCampo;
    Cve_Activ_SITI : TInterCampo;  
    CveSeccion     : TInterCampo;  //Campo virtual para almacenar la llave del elemento parcial
    cveTipoSector  : TInterCampo;
    cveSector      : TInterCampo;
    cveRama        : TInterCampo;
    cveSubRama     : TInterCampo;
    B_CONDUSEF     : TInterCampo; // CZR 25-nov-2014

    ActividadSITI  : TLdiActEco;
    TipoCliente    : TActividad;
    Residencia     : TActividad;
    TipoSector     : TActividad;
    Sector         : TActividad;
    SubSector      : TActividad;
    Rama           : TActividad;
    SubRama        : TActividad;
    Inciso         : TActividad;

    { RAPA4293 Mar2014 Campos de Clasificación Contable
      Sustituye la configuración contable en la persona en los procesos de replicación
      de personas de PCORPO a PCORP, los campos que se modifican en PCORP son:
         • cveTipoSector - Persona.Cve_Tipo_Sector
         • cveSector     - Persona_Moral.Cve_Tipo_Sector
         • cveRama       - Persona_Moral.Cve_Rama_Activ o Persona_Fisica.Cve_Rama_PF
         • cveSubRama    - Persona_Moral.Cve_Sub_Rama_Ac o Persona_Fisica.Cve_Actividad_PF
    }

    Property DecodeKey: Boolean Read FDecodeKey Write SetDecodeKey;

    Constructor Create(AOwner : TComponent); overload; override;
    Constructor Create(AOwner:TComponent; pDecodeKey: Boolean); overload;
    Destructor Destroy; override;
    Procedure DatabaseChange; override;
    Function ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    Function InternalBusca : Boolean; override;
    Function InternalLocaliza:Boolean; override;
    Function Reporte:Boolean; override;
    Function GetCveActividad(TipoSeccion: TTipoSeccion): String; //Obtiene Cve_Activ_Cto
    Function GetCveSeccion(TipoSeccion: TTipoSeccion): String;   //Obtiene unicamente la seccion requerida
  published
  end;

  const cTipoClienteSize: Integer = 1;
  const cResidenciaSize: Integer = 2;
  const cTipoSectorSize: Integer = 4;
  const cSectorSize: Integer = 6;
  const cSubSectorSize: Integer = 8;
  const cRamaSize: Integer = 10;
  const cSubRamaSize: Integer = 12;
  const cIncisoSize: Integer = 14;

  { RAPA4293 Mar2014 Campos de Clasificación Contable }
  const cCveTipoSectorPerMoral = '31';
  const cCveTipoSectorPerFisica = '32';


implementation

Uses RepActi;
{$R *.DFM}

Procedure TActividad.CreateBaseObject;
Begin
  Cve_Activ_Cto:= CreaCampo('CVE_ACTIV_CTO',ftString,tsNinguno,tsNinguno,True);
  Cve_Activ_Cto.Size := 14;
  Cve_Activ_Orig:= CreaCampo('CVE_ACTIV_ORIG',ftString,tsNinguno,tsNinguno,True);
  Cve_Activ_Orig.Size := 14;
  Desc_Actividad:= CreaCampo('DESC_ACTIVIDAD',ftString,tsNinguno,tsNinguno,True);
  B_Presenta:= CreaCampo('B_PRESENTA',ftString,tsNinguno,tsNinguno,True);
  With B_PRESENTA do
  Begin
    Size := 1;
    UseCombo := True;
    ComboDatos.Add('V');			ComboLista.Add('0');
    ComboDatos.Add('F');			ComboLista.Add('1');
  end;
  B_Aplica_RFC:= CreaCampo('B_APLICA_RFC', ftString, tsNinguno, tsNinguno, True);
  Ptos_Riesgo:= CreaCampo('PTOS_RIESGO', ftFloat, tsNinguno, tsNinguno, True);
  Cve_Activ_SITI:= CreaCampo('CVE_ACTIV_SITI', ftString, tsNinguno, tsNinguno, True);
  Cve_Activ_SITI.Size:= 7;

  CveSeccion:= CreaCampo('CVESECCION', ftString, tsNinguno, tsNinguno, False);


  { RAPA4293 Mar2014 Campos de Clasificación Contable }
  cveTipoSector:= CreaCampo('CVE_TIPO_SECTOR', ftString, tsNinguno, tsNinguno, True);
  With cveTipoSector do
  Begin
    Size := 2;
    UseCombo := True;
    ComboDatos.Add('11');  ComboLista.Add('11 GOBIERNO FEDERAL');
    ComboDatos.Add('12');  ComboLista.Add('12 GOBIERNO DEL DEPARTAMENTO DEL DF');
    ComboDatos.Add('13');  ComboLista.Add('13 GOBIERNOS ESTATALES Y MUNICIPALES');
    ComboDatos.Add('14');  ComboLista.Add('14 ORGANISMOS DESCENTRALIZADOS');
    ComboDatos.Add('21');  ComboLista.Add('21 BANCO DE MEXICO');
    ComboDatos.Add('22');  ComboLista.Add('22 BANCA DE DESARROLLO');
    ComboDatos.Add('23');  ComboLista.Add('23 BANCA MULTIPLE');
    ComboDatos.Add('25');  ComboLista.Add('25 OTRAS ENTIDADES FINANCIERAS PUBLICAS');
    ComboDatos.Add('26');  ComboLista.Add('26 OTRAS ENTIDADES FINANCIERAS PRIVADAS');
    ComboDatos.Add('31');  ComboLista.Add('31 EMPRESAS');
    ComboDatos.Add('32');  ComboLista.Add('32 PARTICULARES');
    ComboDatos.Add('41');  ComboLista.Add('41 INSTITUCIONES FINANCIERAS DEL EXTRANJERO');
    ComboDatos.Add('42');  ComboLista.Add('42 EMPRESAS NO FINANCIERAS Y PARTICULARES DEL EXTRANJERO');
    ComboDatos.Add('51');  ComboLista.Add('51 SECTOR IPAB');
    ComboDatos.Add('52');  ComboLista.Add('52 SECTOR PIDIREGAS');
    ComboDatos.Add('53');  ComboLista.Add('53 SECTOR FARAC');
  end;
  cveSector:= CreaCampo('CVE_SECTOR', ftString, tsNinguno, tsNinguno, True);
  cveRama:= CreaCampo('CVE_RAMA', ftString, tsNinguno, tsNinguno, True);
  cveSubRama:= CreaCampo('CVE_SUB_RAMA', ftString, tsNinguno, tsNinguno, True);
  cveSector.useCombo:= True;
  cveRama.useCombo:= True;
  cveSubRama.useCombo:= True;

  // CZR 25-nov-2014
  B_CONDUSEF := CreaCampo('B_CONDUSEF', ftString, tsNinguno, tsNinguno, True);
  with B_CONDUSEF do
  begin
     size := 1;
     B_CONDUSEF.UseCombo := True;
     B_CONDUSEF.ComboDatos.add('F');    B_CONDUSEF.ComboLista.Add('0');
     B_CONDUSEF.ComboDatos.add('V');    B_CONDUSEF.ComboLista.Add('1');
  end;

  { RAPA4293 Mar2014 Campos de Clasificación Contable }
  ActividadSITI:= TLdiActEco.Create(self);
  ActividadSITI.MasterSource := Self;
  ActividadSITI.FieldByName('CVE_ACTIV_ECON').MasterField:= 'CVE_ACTIV_SITI';


  FActive := False;
  FKeyFields.Add('CVE_ACTIV_CTO');
  TableName := 'ACT_CONTRATO';
  UseQuery := True;
  HelpFile := 'IntActiv.hlp';
  ShowMenuReporte:=True;
  IsCorp:=True;
  UseLink:= True;

  FDecodeKey:= False;
  FTipoSeccion:= tsNOCaptura;

  FilterString:= 'Cve_Activ_Cto <> 0';
  BuscaWhereString:= 'Cve_Activ_Cto <> 0';
end;

constructor TActividad.Create( AOwner : TComponent );
begin
  Inherited;
  CreateBaseObject;
end;

Constructor TActividad.Create(AOwner:TComponent; pDecodeKey: Boolean);
Begin
  inherited Create(AOwner);

  CreateBaseObject;

  TipoCliente:= TActividad.Create(self);
  Residencia:= TActividad.Create(self);
  TipoSector:= TActividad.Create(self);
  Sector:= TActividad.Create(self);
  SubSector:= TActividad.Create(self);
  Rama:= TActividad.Create(self);
  SubRama:= TActividad.Create(self);
  Inciso:= TActividad.Create(self);

  TipoCliente.FTipoSeccion:= tsTipoCliente;
  Residencia.FTipoSeccion:= tsResidencia;
  TipoSector.FTipoSeccion:= tsTipoSector;
  Sector.FTipoSeccion:= tsSector;
  SubSector.FTipoSeccion:= tsSubSector;
  Rama.FTipoSeccion:= tsRama;
  SubRama.FTipoSeccion:= tsSubRama;
  Inciso.FTipoSeccion:= tsInciso;

  TipoCliente.MasterSource:= Self;
  Residencia.MasterSource:= Self;
  TipoSector.MasterSource:= Self;
  Sector.MasterSource:= Self;
  SubSector.MasterSource:= Self;
  Rama.MasterSource:= Self;
  SubRama.MasterSource:= Self;
  Inciso.MasterSource:= Self;

  TipoCliente.GetParams(self);
  Residencia.GetParams(self);
  TipoSector.GetParams(self);
  Sector.GetParams(self);
  SubSector.GetParams(self);
  Rama.GetParams(self);
  SubRama.GetParams(self);
  Inciso.GetParams(self);

  TipoCliente.OnAfterLocaliza:= AfterLocalizaTipoCliente;
  Residencia.OnAfterLocaliza:= AfterLocalizaResidencia;
  TipoSector.OnAfterLocaliza:= AfterLocalizaTipoSector;
  Sector.OnAfterLocaliza:= AfterLocalizaSector;
  SubSector.OnAfterLocaliza:= AfterLocalizaSubSector;
  Rama.OnAfterLocaliza:= AfterLocalizaRama;
  SubRama.OnAfterLocaliza:= AfterLocalizaSubRama;
  Inciso.OnAfterLocaliza:= AfterLocalizaInciso;

  FDecodeKey:= pDecodeKey;
end;

destructor TActividad.Destroy;
begin
  If TipoCliente = nil Then TipoCliente.Free; TipoCliente:= nil;
  If Residencia = nil Then Residencia.Free; Residencia:= nil;
  If TipoSector = nil Then TipoSector.Free; TipoSector:= nil;
  If Sector = nil Then Sector.Free; Sector:= nil;
  If SubSector = nil Then SubSector.Free; SubSector:= nil;
  If Rama = nil Then Rama.Free; Rama:= nil;
  If SubRama = nil Then SubRama.Free; SubRama:= nil;
  If Inciso = nil Then Inciso.Free; Inciso:= nil;

  If ActividadSITI <> nil then ActividadSITI.Free;

  { RAPA4293 Mar2014 Campos de Clasificación Contable }
  if qInfoConta <> nil then qInfoConta.free; qInfoConta:= nil;

  inherited;
end;

procedure TActividad.DatabaseChange;
begin
  inherited;
  If TipoCliente <> nil Then TipoCliente.GetParams(self);
  If Residencia <> nil Then Residencia.GetParams(self);
  If TipoSector <> nil Then TipoSector.GetParams(self);
  If Sector <> nil Then Sector.GetParams(self);
  If SubSector <> nil Then SubSector.GetParams(self);
  If Rama <> nil Then Rama.GetParams(self);
  If SubRama <> nil Then SubRama.GetParams(self);
  If Inciso <> nil Then Inciso.GetParams(self);

  ActividadSITI.GetParams(self);

  { RAPA4293 Mar2014 Campos de Clasificación Contable }
  if ((fTipoSeccion = tsNOCaptura) and (qInfoConta = nil) and (databasename <> '')) then
  begin
      qInfoConta:= GetSQLQuery(
        ' Select * ' +
        ' From ( ' +
        '     select ''PF'' cve_Per_Juridica, null cve_sector, cve_rama_PF cve_Rama, null cve_Sub_Rama, cve_Rama_Pf || '' '' || Desc_Rama_PF desc_Clasificacion ' +
        '     From Per_Rama_PF rama ' +
        '     union ' +
        '     select ''PF'' cve_Per_Juridica, null cve_sector, cve_Rama_PF cve_Rama, cve_Actividad_PF cve_Sub_Rama, cve_Actividad_PF || '' '' || Desc_Actividad_PF ' +
        '     From Per_Actividad_PF subRama ' +
        '     union ' +
        '     select ''PM'' cve_Per_Juridica, cve_Tipo_Sector cve_sector, null cve_Rama, null cve_Sub_Rama, sector.cve_Tipo_Sector || '' '' || Desc_Tipo_Sector ' +
        '     from Per_Sector_PM sector ' +
        '     union ' +
        '     select ''PM'' cve_Per_Juridica, Cve_Tipo_Sector cve_sector, cve_Rama_Activ cve_Rama, null cve_Sub_Rama, cve_Rama_Activ || '' '' || Desc_Rama_Activ ' +
        '     From Per_Rama_PM rama ' +
        '     union ' +
        '     select ''PM'' cve_Per_Juridica, cve_Tipo_Sector cve_sector, cve_Rama_Activ cve_Rama, cve_Sub_Rama_Ac cve_Sub_Rama, cve_Sub_Rama_Ac || '' '' || Desc_Sub_Rama_Ac ' +
        '     From Per_Sub_Rama_PM subRama ' +
        '     Order by cve_Per_Juridica, cve_Sector nulls first, cve_Rama nulls first, cve_Sub_Rama nulls first ' +
        ' ) info ',
        DataBaseName, SessionName, true);
  end;
  { RAPA4293 Mar2014 Campos de Clasificación Contable }
end;

Function TActividad.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWActividad;
begin
   W := TWActividad.Create(Self);
   try
      W.Objeto                    := Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := FormaTipo;
      W.InterForma1.ShowBtnAyuda  := False;
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

Function TActividad.PrepareSearch(): Boolean;
Begin
  PrepareSearch:= True;
  if (Owner is TActividad) and ( TActividad(Owner).FDecodeKey ) Then
  Begin
    case FTipoSeccion of
      tsTipoCliente:
      Begin
        BuscaWhereString:= ' Cve_Activ_Cto <> 0 and Cve_Activ_Orig = 0 ';
        FilterString:= ' Cve_Activ_Cto <> 0 and Cve_Activ_Orig = 0 ';
      end;

      tsResidencia:
        If TActividad(Owner).TipoCliente.Active Then
        Begin
          BuscaWhereString:= 'Cve_Activ_Orig = ' + TActividad(Owner).TipoCliente.CVE_ACTIV_CTO.AsSQL;
          FilterString:= 'Cve_Activ_Orig = ' + TActividad(Owner).TipoCliente.CVE_ACTIV_CTO.AsSQL;
        end
        else
        Begin
          BuscaWhereString:= '';
          PrepareSearch:= False;
          InterMsg(tmMal, '', 0, 'Verifique que se haya seleccionado un Tipo de Cliente');
        end;

      tsTipoSector:
        If TActividad(Owner).Residencia.Active Then BuscaWhereString:= 'Cve_Activ_Orig = ' + TActividad(Owner).Residencia.CVE_ACTIV_CTO.AsSQL
        else
        Begin
          BuscaWhereString:= '';
          PrepareSearch:= False;
          InterMsg(tmMal, '', 0, 'Verifique que se haya seleccionado una Residencia');
        end;

      tsSector:
        If TActividad(Owner).TipoSector.Active Then BuscaWhereString:= 'Cve_Activ_Orig = ' + TActividad(Owner).TipoSector.CVE_ACTIV_CTO.AsSQL
        else
        Begin
          BuscaWhereString:= '';
          PrepareSearch:= False;
          InterMsg(tmMal, '', 0, 'Verifique que se haya seleccionado un Tipo de Sector');
        end;

      tsSubSector:
        If TActividad(Owner).Sector.Active Then BuscaWhereString:= 'Cve_Activ_Orig = ' + TActividad(Owner).Sector.CVE_ACTIV_CTO.AsSQL
        else
        Begin
          BuscaWhereString:= '';
          PrepareSearch:= False;
          InterMsg(tmMal, '', 0, 'Verifique que se haya seleccionado un Sector');
        end;

      tsRama:
        If TActividad(Owner).SubSector.Active Then BuscaWhereString:= 'Cve_Activ_Orig = ' + TActividad(Owner).SubSector.CVE_ACTIV_CTO.AsSQL
        else
        Begin
          BuscaWhereString:= '';
          PrepareSearch:= False;
          InterMsg(tmMal, '', 0, 'Verifique que se haya seleccionado un SubSector');
        end;

      tsSubRama:
        If TActividad(Owner).Rama.Active Then BuscaWhereString:= 'Cve_Activ_Orig = ' + TActividad(Owner).Rama.CVE_ACTIV_CTO.AsSQL
        else
        Begin
          BuscaWhereString:= '';
          PrepareSearch:= False;
          InterMsg(tmMal, '', 0, 'Verifique que se haya seleccionado una Rama');
        end;

      tsInciso:
        If TActividad(Owner).SubRama.Active Then BuscaWhereString:= 'Cve_Activ_Orig = ' + TActividad(Owner).SubRama.CVE_ACTIV_CTO.AsSQL
        else
        Begin
          BuscaWhereString:= '';
          PrepareSearch:= False;
          InterMsg(tmMal, '', 0, 'Verifique que se haya seleccionado una SubRama');
        end;
    end;
  end;
end;


Function TActividad.AfterSearch(): Boolean;
Begin
  AfterSearch:= True;
  if (Owner is TActividad) and ( TActividad(Owner).FDecodeKey ) Then
  Begin
    With TActividad(Owner) do
    Begin
      case Self.FTipoSeccion of
      tsTipoCliente:
        Begin
          Residencia.Active:= False;
          TipoSector.Active:= False;
          Sector.Active:= False;
          SubSector.Active:= False;
          Rama.Active:= False;
          SubRama.Active:= False;
          Inciso.Active:= False;

          { RAPA4293 Mar2014 Campos de Clasificación Contable }
          if TipoCliente.Active then
          begin
            if (tipoCliente.CveSeccion.AsString = '1') then cveTipoSector.AsString:= cCveTipoSectorPerMoral;
            if (tipoCliente.CveSeccion.AsString = '2') then cveTipoSector.AsString:= cCveTipoSectorPerFisica;
          end;
          refreshCombosConta;
          { RAPA4293 Mar2014 Campos de Clasificación Contable }

        end;
      tsResidencia:
        Begin
          TipoSector.Active:= False;
          Sector.Active:= False;
          SubSector.Active:= False;
          Rama.Active:= False;
          SubRama.Active:= False;
          Inciso.Active:= False;
        end;
      tsTipoSector:
        Begin
          Sector.Active:= False;
          SubSector.Active:= False;
          Rama.Active:= False;
          SubRama.Active:= False;
          Inciso.Active:= False;
        end;
      tsSector:
        Begin
          SubSector.Active:= False;
          Rama.Active:= False;
          SubRama.Active:= False;
          Inciso.Active:= False;
        end;
      tsSubSector:
        Begin
          Rama.Active:= False;
          SubRama.Active:= False;
          Inciso.Active:= False;
        end;
      tsRama:
        Begin
          SubRama.Active:= False;
          Inciso.Active:= False;
        end;

      tsSubRama:
        Begin
          Inciso.Active:= False;
        end;

      end;
    end;
  end;

end;



Function TActividad.InternalBusca:Boolean;
Var T:TInterFindit;
begin
  InternalBusca := False;
  If PrepareSearch Then
  Begin
    T:=CreaBuscador('IntActiv.it','S,S,S,S');
    try
      if Active then T.Param(0,Cve_Activ_Cto.AsString);
      if T.Execute then
      Begin
        If FindKey([T.DameCampo(0)]) Then
        Begin
          InternalBusca:= True;
          AfterSearch;
        end
      end;
    finally
      T.Free;
    end;
  end;
end;

Procedure TActividad.LocalizaClaveOrigen(Padre: TActividad);
Begin
  If FDecodeKey Then
  Begin
    TipoCliente.CveSeccion.AsString:= Padre.GetCveSeccion(tsTipoCliente);
    Residencia.CveSeccion.AsString:= Padre.GetCveSeccion(tsResidencia);
    TipoSector.CveSeccion.AsString:= Padre.GetCveSeccion(tsTipoSector);
    Sector.CveSeccion.AsString:= Padre.GetCveSeccion(tsSector);
    SubSector.CveSeccion.AsString:= Padre.GetCveSeccion(tsSubSector);
    Rama.CveSeccion.AsString:= Padre.GetCveSeccion(tsRama);
    SubRama.CveSeccion.AsString:= Padre.GetCveSeccion(tsSubRama);
    Inciso.CveSeccion.AsString:= Padre.GetCveSeccion(tsInciso);

    TipoCliente.FindKey([Padre.GetCveActividad(tsTipoCliente)]);
    Residencia.FindKey([Padre.GetCveActividad(tsResidencia)]);
    TipoSector.FindKey([Padre.GetCveActividad(tsTipoSector)]);
    Sector.FindKey([Padre.GetCveActividad(tsSector)]);
    SubSector.FindKey([Padre.GetCveActividad(tsSubSector)]);
    Rama.FindKey([Padre.GetCveActividad(tsRama)]);
    SubRama.FindKey([Padre.GetCveActividad(tsSubRama)]);
    Inciso.FindKey([Padre.GetCveActividad(tsInciso)]);
  end;

  { RAPA4293 Mar2014 Campos de Clasificación Contable }
  refreshCombosConta(cveSector.asString, cveRama.asString, cveSubRama.asString);
end;


Function TActividad.InternalLocaliza: Boolean;
var strPartialKey: String;
Begin
  if FDecodeKey Then
  Begin
    If Active Then LocalizaClaveOrigen(Self)
    else
    Begin
      TipoCliente.Active:= False;
      Residencia.Active:= False;
      TipoSector.Active:= False;
      Sector.Active:= False;
      SubSector.Active:= False;
      Rama.Active:= False;
      SubRama.Active:= False;
      Inciso.Active:= False;
    end;
  end;

  Result:= True;
end;

Procedure TActividad.SetDecodeKey(Value: Boolean);
Begin
  FDecodeKey:= Value;

  If FDecodeKey Then
  Begin
    If TipoCliente = nil Then
    Begin
      TipoCliente:= TActividad.Create(self);
      TipoCliente.FTipoSeccion:= tsTipoCliente;
      TipoCliente.MasterSource:= Self;
      TipoCliente.GetParams(self);
      TipoCliente.OnAfterLocaliza:= AfterLocalizaTipoCliente;
    end;

    If Residencia = nil Then
    Begin
      Residencia:= TActividad.Create(self);
      Residencia.FTipoSeccion:= tsResidencia;
      Residencia.MasterSource:= Self;
      Residencia.GetParams(self);
      Residencia.OnAfterLocaliza:= AfterLocalizaResidencia;
    end;

    If TipoSector = nil Then
    Begin
      TipoSector:= TActividad.Create(self);
      TipoSector.FTipoSeccion:= tsTipoSector;
      TipoSector.MasterSource:= Self;
      TipoSector.GetParams(self);
      TipoSector.OnAfterLocaliza:= AfterLocalizaTipoSector;
    end;

    If Sector = nil Then
    Begin
      Sector:= TActividad.Create(self);
      Sector.FTipoSeccion:= tsSector;
      Sector.MasterSource:= Self;
      Sector.GetParams(self);
      Sector.OnAfterLocaliza:= AfterLocalizaSector;
    end;

    If SubSector = nil Then
    Begin
      SubSector:= TActividad.Create(self);
      SubSector.FTipoSeccion:= tsSubSector;
      SubSector.MasterSource:= Self;
      SubSector.GetParams(self);
      SubSector.OnAfterLocaliza:= AfterLocalizaSubSector;
    end;

    If Rama = nil Then
    Begin
      Rama:= TActividad.Create(self);
      Rama.FTipoSeccion:= tsRama;
      Rama.MasterSource:= Self;
      Rama.GetParams(self);
      Rama.OnAfterLocaliza:= AfterLocalizaRama;
    end;

    If SubRama = nil Then
    Begin
      SubRama:= TActividad.Create(self);
      SubRama.FTipoSeccion:= tsSubRama;
      SubRama.MasterSource:= Self;
      SubRama.GetParams(self);
      SubRama.OnAfterLocaliza:= AfterLocalizaSubRama;
    end;

    If Inciso = nil Then
    Begin
      Inciso:= TActividad.Create(self);
      Inciso.FTipoSeccion:= tsInciso;
      Inciso.MasterSource:= Self;
      Inciso.GetParams(self);
      Inciso.OnAfterLocaliza:= AfterLocalizaInciso;
    end;
  end
  else
  Begin
    If TipoCliente <> nil Then TipoCliente.Free; TipoCliente:= nil;
    If Residencia <> nil Then Residencia.Free; Residencia:= nil;
    If TipoSector <> nil Then TipoSector.Free; TipoSector:= nil;
    If Sector <> nil Then Sector.Free; Sector:= nil;
    If SubSector <> nil Then SubSector.Free; SubSector:= nil;
    If Rama <> nil Then Rama.Free; Rama:= nil;
    If SubRama <> nil Then SubRama.Free; SubRama:= nil;
    If Inciso <> nil Then Inciso.Free; Inciso:= nil;
  end;
end;

Function TActividad.GetCveActividad(TipoSeccion: TTipoSeccion): String;
Begin
  GetCveActividad:= '';

  If Active Then
  Begin
    Case TipoSeccion of
      tsTipoCliente:
        if Length(CVE_ACTIV_CTO.AsString) >= cTipoClienteSize Then
          GetCveActividad:= Copy(CVE_ACTIV_CTO.AsString, 1, cTipoClienteSize);

      tsResidencia:
        if Length(CVE_ACTIV_CTO.AsString) >= cResidenciaSize Then
          GetCveActividad:= Copy(CVE_ACTIV_CTO.AsString, 1, cResidenciaSize);

      tsTipoSector:
        if Length(CVE_ACTIV_CTO.AsString) >= cTipoSectorSize Then
          GetCveActividad:= Copy(CVE_ACTIV_CTO.AsString, 1, cTipoSectorSize);

      tsSector:
        if Length(CVE_ACTIV_CTO.AsString) >= cSectorSize Then
          GetCveActividad:= Copy(CVE_ACTIV_CTO.AsString, 1, cSectorSize);

      tsSubSector:
        if Length(CVE_ACTIV_CTO.AsString) >= cSubSectorSize Then
          GetCveActividad:= Copy(CVE_ACTIV_CTO.AsString, 1, cSubSectorSize);

      tsRama:
        if Length(CVE_ACTIV_CTO.AsString) >= cRamaSize Then
          GetCveActividad:= Copy(CVE_ACTIV_CTO.AsString, 1, cRamaSize);

      tsSubRama:
        if Length(CVE_ACTIV_CTO.AsString) >= cSubRamaSize Then
          GetCveActividad:= Copy(CVE_ACTIV_CTO.AsString, 1, cSubRamaSize);

      tsInciso:
        if Length(CVE_ACTIV_CTO.AsString) >= cIncisoSize Then
          GetCveActividad:= Copy(CVE_ACTIV_CTO.AsString, 1, cIncisoSize);
    end;
  end;
end;

Function TActividad.GetCveSeccion(TipoSeccion: TTipoSeccion): String;
Begin
  GetCveSeccion:= '';

  If Active Then
  Begin
    Case TipoSeccion of
      tsTipoCliente: GetCveSeccion:= Copy(CVE_ACTIV_CTO.AsString, 1, cTipoClienteSize);
      tsResidencia:  GetCveSeccion:= Copy(CVE_ACTIV_CTO.AsString, cTipoClienteSize + 1, cResidenciaSize - cTipoClienteSize);
      tsTipoSector:  GetCveSeccion:= Copy(CVE_ACTIV_CTO.AsString, cResidenciaSize + 1, cTipoSectorSize - cResidenciaSize);
      tsSector:      GetCveSeccion:= Copy(CVE_ACTIV_CTO.AsString, cTipoSectorSize + 1, cSectorSize - cTipoSectorSize);
      tsSubSector:   GetCveSeccion:= Copy(CVE_ACTIV_CTO.AsString, cSectorSize + 1, cSubSectorSize - cSectorSize);
      tsRama:        GetCveSeccion:= Copy(CVE_ACTIV_CTO.AsString, cSubSectorSize + 1, cRamaSize - cSubSectorSize);
      tsSubRama:     GetCveSeccion:= Copy(CVE_ACTIV_CTO.AsString, cRamaSize + 1, cSubRamaSize - cRamaSize);
      tsInciso:      GetCveSeccion:= Copy(CVE_ACTIV_CTO.AsString, cSubRamaSize + 1, cIncisoSize - cSubRamaSize);
    end;
  end;
end;

Procedure TActividad.AfterLocalizaTipoCliente(Sender:TObject);
Begin TipoCliente.CveSeccion.AsString:= TipoCliente.GetCveSeccion(tsTipoCliente);
end;

Procedure TActividad.AfterLocalizaResidencia(Sender:TObject);
Begin Residencia.CveSeccion.AsString:= Residencia.GetCveSeccion(tsResidencia);
end;

Procedure TActividad.AfterLocalizaTipoSector(Sender:TObject);
Begin TipoSector.CveSeccion.AsString:= TipoSector.GetCveSeccion(tsTipoSector);
end;

Procedure TActividad.AfterLocalizaSector(Sender:TObject);
Begin Sector.CveSeccion.AsString:= Sector.GetCveSeccion(tsSector);
end;

Procedure TActividad.AfterLocalizaSubSector(Sender:TObject);
Begin SubSector.CveSeccion.AsString:= SubSector.GetCveSeccion(tsSubSector);
end;

Procedure TActividad.AfterLocalizaRama(Sender:TObject);
Begin Rama.CveSeccion.AsString:= Rama.GetCveSeccion(tsRama);
end;

Procedure TActividad.AfterLocalizaSubRama(Sender:TObject);
Begin SubRama.CveSeccion.AsString:= SubRama.GetCveSeccion(tsSubRama);
end;

Procedure TActividad.AfterLocalizaInciso(Sender:TObject);
Begin Inciso.CveSeccion.AsString:= Inciso.GetCveSeccion(tsInciso);
end;

function TActividad.Reporte:Boolean;
begin Execute_RepActi(True,Self);
end;

{ RAPA4293 Mar2014 Campos de Clasificación Contable }
Procedure TActividad.refreshCombosConta(pSector: String = ''; pRama: String = ''; pSubRama: String = '');
var cvePerJuridica: String;
    sector, rama, subRama: string;
Begin
  if ((qInfoConta <> nil) and Active) then
  begin
    cvePerJuridica:= getCvePerJuridica();

    if (cvePerJuridica <> '') then
    begin
      { Se inicializan los valores contables y las listas de sus combos... en edicion se forzan los valores de los intercampos }
      if ((modo = moAppend) or (modo = moEdit)) then
      Begin
        cveSector.AsString:= pSector;
        cveRama.asString:= pRama;
        cveSubRama.asString:= pSubRama;
      end;
      cveSector.ComboLista.Clear;
      cveSector.ComboDatos.Clear;
      cveRama.ComboLista.Clear;
      cveRama.ComboDatos.Clear;
      cveSubRama.ComboLista.Clear;
      cveSubRama.ComboDatos.Clear;

      //qInfoConta.Filtered:= false;
      qInfoConta.Filter:= 'cve_Per_Juridica = ''' + cvePerJuridica + '''';
      qInfoConta.Filtered:= true;
      qInfoConta.First;

      { Se agregan los elemenos a los combos correspondientes }
      while (not qInfoConta.Eof) do
      Begin
        sector:= qInfoConta.fieldByName('cve_Sector').asString;
        rama:= qInfoConta.fieldByName('cve_Rama').asString;
        subRama:= qInfoConta.fieldByName('cve_Sub_Rama').asString;

        { Elementos del Sector... Solo personas morales }
        if ((sector <> '') and (rama = '') and (subRama = '')) then
        begin
          cveSector.ComboDatos.add(sector);
          cveSector.ComboLista.add(qInfoConta.fieldByName('Desc_Clasificacion').asString);
        end;

        { Elementos del la Rama }
        if ((sector = pSector) and (rama <> '') and (subRama = '')) then
        begin
          cveRama.ComboDatos.add(rama);
          cveRama.ComboLista.add(qInfoConta.fieldByName('Desc_Clasificacion').asString);
        end;

        { Elementos del la SubRama }
        if ((sector = pSector) and (rama = pRama) and (subRama <> '')) then
        begin
          cveSubRama.ComboDatos.add(subRama);
          cveSubRama.ComboLista.add(qInfoConta.fieldByName('Desc_Clasificacion').asString);
        end;

         qInfoConta.Next;
      end;

      { Se reasignan los controles para que se recarguen las listas de datos a los controles visuales }
      if (cveSector.control <> nil) then cveSector.Control:= cveSector.Control;
      if (cveRama.control <> nil) then cveRama.Control:= cveRama.Control;
      if (cveSubRama.control <> nil) then cveSubRama.Control:= cveSubRama.Control;

    end;
  end;
end;

{ RAPA4293 Mar2014 Campos de Clasificación Contable }
function TActividad.getCvePerJuridica(): String;
var cvePerJuridica: String;
begin
  // En edición (solo en alta se modifica la clave) la actividad no se ha cargado por lo que se toma el valor de tipoCliente
  if ((modo = moAppend) and (TipoCliente <> nil) and (TipoCliente.Active)) then
    cvePerJuridica:= tipoCliente.CveSeccion.AsString
  else cvePerJuridica:= GetCveSeccion(tsTipoCliente);

  if (cvePerJuridica = '1') Then cvePerJuridica:= 'PM';
  if (cvePerJuridica = '2') Then cvePerJuridica:= 'PF';

  getCvePerJuridica:= cvePerJuridica;
end;



(***********************************************FORMA DE Actividad***************)
(*                                                                              *)
(*  FORMA DE Actividad                                                          *)
(*                                                                              *)
(***********************************************FORMA DE Actividad***************)

procedure TWActividad.FormShow(Sender: TObject);
begin
  With Objeto do
  Begin
    DecodeKey:= True;

    Cve_Activ_Cto.Control  := EdCveActividad;
    Cve_Activ_Orig.Control := EdCveOriginal;
    Desc_Actividad.Control := EdActividad;
    B_Presenta.Control     := rgSituacion;
    B_Aplica_RFC.Control   := chkAplicaRFC;
    Ptos_Riesgo.Control    := iedPtosRiesgo;
    Cve_Activ_SITI.Control := edCveSITI;

    ActividadSITI.DESC_ACTIV_ECON.Control:= edDescSITI;
    ActividadSITI.MasterSourceEditControl:= sbCveSITI;

    { RAPA4293 Mar2014 Campos de Clasificación Contable }
    cveTipoSector.control:= cbCveTipoSector;
    cveSector.control:= cbCveSector;
    cveRama.control:= cbCveRama;
    cveSubRama.control:= cbCveSubRama;


    TipoCliente.CveSeccion.Control:= edCveTipoCliente;
    TipoCliente.DESC_ACTIVIDAD.Control:= edTipoCliente;
    Residencia.CveSeccion.Control:= edCveResidencia;
    Residencia.DESC_ACTIVIDAD.Control:= edResidencia;
    TipoSector.CveSeccion.Control:= edCveTipoSector;
    TipoSector.DESC_ACTIVIDAD.Control:= edTipoSector;
    Sector.CveSeccion.Control:= edCveSector;
    Sector.DESC_ACTIVIDAD.Control:= edSector;
    SubSector.CveSeccion.Control:= edCveSubSector;
    SubSector.DESC_ACTIVIDAD.Control:= edSubSector;
    Rama.CveSeccion.Control:= edCveRama;
    Rama.DESC_ACTIVIDAD.Control:= edRama;
    SubRama.CveSeccion.Control:= edCveSubRama;
    SubRama.DESC_ACTIVIDAD.Control:= edSubRama;
    Inciso.CveSeccion.Control:= edCveInciso;
    Inciso.DESC_ACTIVIDAD.Control:= edInciso;

    edCveTipoCliente.PopupMenu:= TipoCliente.PopMenu;
    edCveResidencia.PopupMenu:= Residencia.PopMenu;
    edCveTipoSector.PopupMenu:= TipoSector.PopMenu;
    edCveSector.PopupMenu:= Sector.PopMenu;
    edCveSubSector.PopupMenu:= SubSector.PopMenu;
    edCveRama.PopupMenu:= Rama.PopMenu;
    edCveSubRama.PopupMenu:= SubRama.PopMenu;
    edCveInciso.PopupMenu:= Inciso.PopMenu;
    B_CONDUSEF.Control := cB_CONDUSEF; // CZR 25-nov-2014
  end;
end;

procedure TWActividad.FormDestroy(Sender: TObject);
begin
  With Objeto do
  Begin
    Cve_Activ_Cto.Control  := nil;
    Cve_Activ_Orig.Control := nil;
    Desc_Actividad.Control := nil;
    B_Presenta.Control     := nil;
    B_Aplica_RFC.Control   := nil;
    Ptos_Riesgo.Control    := nil;
    Cve_Activ_SITI.Control := nil;

    ActividadSITI.DESC_ACTIV_ECON.Control:= nil;
    ActividadSITI.MasterSourceEditControl:= nil;

    { RAPA4293 Mar2014 Campos de Clasificación Contable }
    cveTipoSector.control:= nil;
    cveSector.control:= nil;
    cveRama.control:= nil;
    cveSubRama.control:= nil;

    TipoCliente.CveSeccion.Control:= nil;
    TipoCliente.DESC_ACTIVIDAD.Control:= nil;
    Residencia.CveSeccion.Control:= nil;
    Residencia.DESC_ACTIVIDAD.Control:= nil;
    TipoSector.CveSeccion.Control:= nil;
    TipoSector.DESC_ACTIVIDAD.Control:= nil;
    Sector.CveSeccion.Control:= nil;
    Sector.DESC_ACTIVIDAD.Control:= nil;
    SubSector.CveSeccion.Control:= nil;
    SubSector.DESC_ACTIVIDAD.Control:= nil;
    Rama.CveSeccion.Control:= nil;
    Rama.DESC_ACTIVIDAD.Control:= nil;
    SubRama.CveSeccion.Control:= nil;
    SubRama.DESC_ACTIVIDAD.Control:= nil;
    Inciso.CveSeccion.Control:= nil;
    Inciso.DESC_ACTIVIDAD.Control:= nil;
    B_CONDUSEF.Control := nil;// CZR 25-nov-2014
  end;
end;


procedure TWActividad.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;


procedure TWActividad.InterForma1DespuesNuevo(Sender: TObject);
begin
  rgSituacion.ItemIndex := 0;
  edCveActividad.SetFocus;
  TipoCaptura:= tsTipoCliente;
end;

procedure TWActividad.InterForma1DespuesModificar(Sender: TObject);
begin edActividad.SetFocus;
end;

procedure TWActividad.btReporteClick(Sender: TObject);
begin Objeto.Reporte;
end;

procedure TWActividad.sbTipoClienteClick(Sender: TObject);
begin
  If Objeto.TipoCliente.Busca Then TipoCaptura:= tsResidencia;
end;

procedure TWActividad.sbResidenciaClick(Sender: TObject);
begin If Objeto.Residencia.Busca Then TipoCaptura:= tsTipoSector;
end;

procedure TWActividad.sbTipoSectorClick(Sender: TObject);
begin If Objeto.TipoSector.Busca Then TipoCaptura:= tsSector;
end;

procedure TWActividad.sbSectorClick(Sender: TObject);
begin If Objeto.Sector.Busca Then TipoCaptura:= tsSubSector;
end;

procedure TWActividad.sbSubSectorClick(Sender: TObject);
begin If Objeto.SubSector.Busca Then TipoCaptura:= tsRama;
end;

procedure TWActividad.sbRamaClick(Sender: TObject);
begin If Objeto.Rama.Busca Then TipoCaptura:= tsSubRama;
end;

procedure TWActividad.sbSubRamaClick(Sender: TObject);
begin If Objeto.SubRama.Busca Then TipoCaptura:= tsInciso;
end;

procedure TWActividad.sbIncisoClick(Sender: TObject);
begin If Objeto.Inciso.Busca Then TipoCaptura:= tsNOCaptura;
end;

procedure TWActividad.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var cvePerJuridica: String;
begin
  try
      { RAPA4293 Mar2014 Campos de Clasificación Contable }
      objeto.cveTipoSector.GetFromControl;
      objeto.b_Presenta.GetFromControl;
      // Validaciones de clasificación contable - Requerido en alta y modificaciones de claves de último nivel
      if (isNewData or (not isNewData and (objeto.b_Presenta.AsString = 'V'))) then
      begin
        cvePerJuridica:= objeto.getCvePerJuridica();

        // TipoSector
        if (objeto.cveTipoSector.asString = '') then
          Raise EInterFrame.Create('El Tipo de Sector es requerido en la creación de actividades económicas');

        // Personas Fisica - Rama Requerida
        if ((cvePerJuridica = 'PF') and (objeto.cveRama.AsString = ''))Then
          Raise EInterFrame.Create('Clasificación Contable - La Rama es un dato requerido para actividades de Personas Físicas');

        // Personas Morales - Sector Requerido
        if ((cvePerJuridica = 'PM') and (objeto.cveSector.AsString = ''))Then
          Raise EInterFrame.Create('Clasificación Contable - El sector es un dato requerido para actividades de Personas Morales');
      end;


      if IsNewData then
      begin
        objeto.cve_Activ_Cto.GetFromControl;
        objeto.CveSeccion.AsString := Objeto.CVE_ACTIV_CTO.AsString;
        if Length(Objeto.CVE_ACTIV_CTO.AsString) <> EdCveActividad.MaxLength then
        Begin
          if edCveActividad.MaxLength > 1 then
            Raise EInterFrame.Create('La clave de ' + lbICveActividad.Caption + ' debe contener ' + intToStr(EdCveActividad.MaxLength) + ' caracteres')
          else
            Raise EInterFrame.Create('La clave de ' + lbICveActividad.Caption + ' debe contener un caracter');
        end;

        With Objeto do
          CVE_ACTIV_CTO.AsString:= TipoCliente.CveSeccion.AsString +
                                   Residencia.CveSeccion.AsString +
                                   TipoSector.CveSeccion.AsString +
                                   Sector.CveSeccion.AsString +
                                   SubSector.CveSeccion.AsString +
                                   Rama.CveSeccion.AsString +
                                   SubRama.CveSeccion.AsString +
                                   Inciso.CveSeccion.AsString +
                                   CVE_ACTIV_CTO.AsString;
      end;

  except
    on e: Exception do
    begin
      Realizado:= False;
      InterForma1.ShowError:= False;
      InterMsg(tmMal, '', 0, 'Eror en actualización de Actividad Económica' + char(VK_RETURN) + e.message);
    end;
  end;

end;

procedure TWActividad.InterForma1DespuesCancelar(Sender: TObject);
begin TipoCaptura:= tsNOCaptura;
end;

procedure TWActividad.InterForma1DespuesAceptar(Sender: TObject);
begin TipoCaptura:= tsNOCaptura;
end;

Procedure TWActividad.SetTipoCaptura(Value: TTipoSeccion);
Begin
  FTipoCaptura:= Value;

  Case Value of
  tsNOCaptura:
    Begin
      lbICveActividad.Caption:= 'Clave';
      EdCveActividad.MaxLength:= 0;
      edCveOriginal.Text:= '';
    end;

  tsLocate:
    Begin
      If objeto.Inciso.Active Then TipoCaptura:= tsNOCaptura
      else If objeto.SubRama.Active Then TipoCaptura:= tsInciso
      else If objeto.Rama.Active Then TipoCaptura:= tsSubRama
      else If objeto.SubSector.Active Then TipoCaptura:= tsRama
      else If objeto.Sector.Active Then TipoCaptura:= tsSubSector
      else If objeto.TipoSector.Active Then TipoCaptura:= tsSector
      else If objeto.Residencia.Active Then TipoCaptura:= tsTipoSector
      else If objeto.TipoCliente.Active Then TipoCaptura:= tsResidencia;
    end;


  tsTipoCliente:
    Begin
      lbICveActividad.Caption:= 'Tipo Cliente';
      EdCveActividad.MaxLength:= cTipoClienteSize;
      edCveOriginal.Text:= '0';
    end;

  tsResidencia:
    Begin
      lbICveActividad.Caption:= 'Residencia';
      EdCveActividad.MaxLength:= cResidenciaSize - cTipoClienteSize;
      edCveOriginal.Text:= Objeto.TipoCliente.CVE_ACTIV_CTO.AsString;
    end;

  tsTipoSector:
    Begin
      lbICveActividad.Caption:= 'Tipo Sector';
      EdCveActividad.MaxLength:= cTipoSectorSize - cResidenciaSize;
      edCveOriginal.Text:= Objeto.Residencia.CVE_ACTIV_CTO.AsString;
    end;

  tsSector:
    Begin
      lbICveActividad.Caption:= 'Sector';
      EdCveActividad.MaxLength:= cSectorSize - cTipoSectorSize;
      edCveOriginal.Text:= Objeto.TipoSector.CVE_ACTIV_CTO.AsString;
    end;

  tsSubSector:
    Begin
      lbICveActividad.Caption:= 'SubSector';
      EdCveActividad.MaxLength:= cSubSectorSize - cSectorSize;
      edCveOriginal.Text:= Objeto.Sector.CVE_ACTIV_CTO.AsString;
    end;

  tsRama:
    Begin
      lbICveActividad.Caption:= 'Rama';
      EdCveActividad.MaxLength:= cRamaSize - cSubSectorSize;
      edCveOriginal.Text:= Objeto.SubSector.CVE_ACTIV_CTO.AsString;
    end;

  tsSubRama:
    Begin
      lbICveActividad.Caption:= 'SubRama';
      EdCveActividad.MaxLength:= cSubRamaSize - cRamaSize;
      edCveOriginal.Text:= Objeto.Rama.CVE_ACTIV_CTO.AsString;
    end;

  tsInciso:
    Begin
      lbICveActividad.Caption:= 'Inciso';
      EdCveActividad.MaxLength:= cIncisoSize - cSubRamaSize;
      edCveOriginal.Text:= Objeto.SubRama.CVE_ACTIV_CTO.AsString;
    end;
  end;
end;

procedure TWActividad.InterForma1ErrorAceptar(Sender: TObject);
begin
  if (objeto.modo = moAppend) then
    Objeto.CVE_ACTIV_CTO.AsString:= Objeto.CveSeccion.AsString;
end;

procedure TWActividad.sbCveSITIClick(Sender: TObject);
begin Objeto.ActividadSITI.Busca;
end;

procedure TWActividad.sbActPadreClick(Sender: TObject);
var objActividad: TActividad;
begin
  objActividad:= TActividad.Create(Objeto, False);
  objActividad.GetParams(Objeto);
  Try
    If objActividad.Busca then
    Begin
      Objeto.LocalizaClaveOrigen(objActividad);
      TipoCaptura:= tsLocate;
    end;

  Finally
    if objActividad <> nil Then objActividad.Free; objActividad:= nil;
  end;
end;

procedure TWActividad.linkActPadreEjecuta(Sender: TObject);
var objActividad: TActividad;
begin
  objActividad:= TActividad.Create(Objeto, False);
  objActividad.GetParams(Objeto);
  Try
    If objActividad.FindKey([linkActPadre.Buffer]) then
    Begin
      Objeto.LocalizaClaveOrigen(objActividad);
      TipoCaptura:= tsLocate;
    end;
  Finally
    if objActividad <> nil Then objActividad.Free; objActividad:= nil;
  end;
end;

procedure TWActividad.linkActPadreCapture(Sender: TObject;
  var Show: Boolean);
begin Show:= (Objeto.Modo = moAppend);
end;

procedure TWActividad.cbCveSectorChange(Sender: TObject);
begin
  { RAPA4293 Mar2014 Campos de Clasificación Contable }
  with objeto do
    if (Modo=moEdit) or (Modo=moAppend) Then
    begin
      cveSector.GetFromControl;
      refreshCombosConta(cveSector.AsString);
    end;
end;

procedure TWActividad.cbCveRamaChange(Sender: TObject);
Begin
  { RAPA4293 Mar2014 Campos de Clasificación Contable }
  with objeto do
    if (Modo=moEdit) or (Modo=moAppend) Then
    begin
      cveSector.GetFromControl;
      cveRama.GetFromControl;
      refreshCombosConta(cveSector.AsString, cveRama.asString);
    end;
end;

end.





