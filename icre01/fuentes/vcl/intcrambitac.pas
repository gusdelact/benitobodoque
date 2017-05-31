 // Sistema         : Clase de CR_AM_BITACORA
 // Fecha de Inicio : 17/03/2010
 // Función forma   : Clase de CR_AM_BITACORA
 // Desarrollo por  : MACV. Class Maker.
 // Diseñado por    : Manuel Romero Ibarra
 // Comentarios     :
unit IntCrAmBitac;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DBTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntParamCre,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk,
  //Clases Adicionales
  IntMPers, IntPers,       //PERSONA
  IntCrCredito,            //Disposición
  IntCrDispF,              //Disposición FIRA
  IntCrPersF,              //Persona FIRA
  IntCatClasCred,
  IntLinkit, InterEdit, IntSGCtrl, Menus, Excel97, OleServer
  ;

const

cRenRC = 19; //Primer renglón de Conceptos de inversión - Recursos del crédito
nRenRC = 7;  //Número de renglones definidos para este concepto
cRenRP = 30; //Primer renglón de Conceptos de inversión - Recursos del productor
nRenRP = 4;  //Número de renglones definidos para este concepto
cSubtotRC = 26; //Subtotal Conceptos de inversión - Recursos del crédito
cSubtotRP = 34; //Subtotal Conceptos de inversión - Recursos del productor
cDictamen = 113;


type
  TCrAmBitac = class;

  TWCrAmBitacora = class(TForm)
    InterForma1: TInterForma;
    lbF_EVENTO: TLabel;
    lbF_PROX_EVENTO: TLabel;
    lbID_DESPACHO: TLabel;
    lbNOMBRE_SPVISOR: TLabel;
    edNOMBRE_SPVISOR: TEdit;
    lbTXT_COMENTARIO: TLabel;
    lbF_LIM_ACLARA: TLabel;
    lbID_PROMOTOR: TLabel;
    Label2: TLabel;
    edID_CREDITO: TEdit;
    btID_CREDITO: TBitBtn;
    edTXT_COMENTARIO: TMemo;
    edTIPO_EVENTO: TRadioGroup;
    edTIPO_SUPERVISOR: TRadioGroup;
    edNOM_PROMOTOR: TEdit;
    Label1: TLabel;
    edDESPACHO: TEdit;
    edB_RES_DICTAMEN: TRadioGroup;
    sgBitacora: TSGCtrl;
    ilCVE_CLAS_CRED: TInterLinkit;
    edID_PROMOTOR: TEdit;
    edNOM_ACREDITADO: TEdit;
    MsgPanel: TPanel;
    Label3: TLabel;
    edID_ACREDITADO: TEdit;
    edID_DESPACHO: TEdit;
    pmAcreditado: TPopupMenu;
    ConsultaSectorPersona1: TMenuItem;
    edF_EVENTO: TEdit;
    dtpF_EVENTO: TInterDateTimePicker;
    edF_ENT_CRED: TEdit;
    dtpF_ENT_CRED: TInterDateTimePicker;
    edF_LIM_ACLARA: TEdit;
    dtpF_LIM_ACLARA: TInterDateTimePicker;
    edF_PROX_EVENTO: TEdit;
    dtpF_PROX_EVENTO: TInterDateTimePicker;
    bImportarCita: TButton;
    edB_REESTR_VIA: TRadioGroup;
    odArchivoEntrada: TOpenDialog;
    ExcelWorksheetI: TExcelWorksheet;
    ExcelApplicationI: TExcelApplication;
    ExcelWorkbookI: TExcelWorkbook;
    ExcelWorksheetO: TExcelWorksheet;
    ExcelWorkbookO: TExcelWorkbook;
    ExcelApplicationO: TExcelApplication;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label5: TLabel;
    edCVE_CLAS_CRED: TEdit;
    btCVE_CLAS_CRED: TBitBtn;
    Label4: TLabel;
    ilID_CREDITO: TInterLinkit;
    edDESC_CLAS_CRED: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure btID_DESPACHOClick(Sender: TObject);
    procedure edID_DESPACHOExit(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject; var Realizado: boolean);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure edF_EVENTOExit(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure edNOMBRE_SPVISORExit(Sender: TObject);
    procedure edTXT_COMENTARIOExit(Sender: TObject);
    procedure edF_LIM_ACLARAExit(Sender: TObject);
    procedure edF_PROX_EVENTOExit(Sender: TObject);
    procedure edTIPO_SUPERVISORClick(Sender: TObject);
    procedure edTIPO_SUPERVISORExit(Sender: TObject);
    procedure edTIPO_EVENTOExit(Sender: TObject);
    procedure edB_RES_DICTAMENExit(Sender: TObject);
    procedure edF_ENT_CREDExit(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure sgBitacoraDblClick(Sender: TObject);
    procedure edB_REESTR_VIAExit(Sender: TObject);
    procedure bImportarCitaClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edCVE_CLAS_CREDExit(Sender: TObject);
    procedure btCVE_CLAS_CREDClick(Sender: TObject);
    procedure ilCVE_CLAS_CREDEjecuta(Sender: TObject);
    procedure edCVE_CLAS_CREDChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto: TCrAmBitac;
    procedure MuestraDatosCredito;
    procedure Bitacora;
    procedure HabilitaFecha(peBHabilita: Boolean);
    procedure GeneraCita;
    function  VerificaRegistroDuplicado:Boolean;
  end;

  TCrAmBitac = class(TInterFrame)
  private
  protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
    { Public declarations }
    ID_CREDITO:      TInterCampo;
    F_EVENTO:        TInterCampo;
    F_PROX_EVENTO:   TInterCampo;
    TIPO_EVENTO:     TInterCampo;
    NOMBRE_SPVISOR:  TInterCampo;
    TXT_COMENTARIO:  TInterCampo;
    B_RES_DICTAMEN:  TInterCampo;
    F_LIM_ACLARA:    TInterCampo;
    TIPO_SUPERVISOR: TInterCampo;
    F_ENT_CRED:      TInterCampo;
    ID_DESPACHO:     TInterCampo;
    ID_PROMOTOR:     TInterCampo;
    B_REESTR_VIA:    TInterCampo;
    F_MODIFICACION:  TInterCampo;
    CVE_CLAS_CRED:   TInterCampo;

    ParamCre: TParamCre;
    Credito:  TCrCredito;     //Disposición
    Persona : TPersona;   //Persona
    PersonaDesp : TPersona;   //Persona Moral para despacho
    PromotorAdm : TPersona;  //Promotor Administrativo
    DispFIRA    : TCrDispF;   //Disposición de FIRA
    PersFIRA    : TCrPersF;   //Persona FIRA
    ClasCred    : TCatClasCred; //Catálogo de clasificación legal

    function InternalBusca: boolean; override;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ShowWindow(FormaTipo: TFormaTipo): integer; override;
    //function Reporte: boolean; override;
  published
  end;


implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrAmBitac.Create(AOwner: TComponent);
begin
  inherited;
  F_EVENTO := CreaCampo('F_EVENTO', ftDateTime, tsNinguno, tsNinguno, True);
  F_EVENTO.Caption := 'Fecha Evento';

  TIPO_SUPERVISOR := CreaCampo('TIPO_SUPERVISOR', ftString, tsNinguno, tsNinguno, True);
  with TIPO_SUPERVISOR do
  begin
    Size := 2;
    UseCombo := True;
    ComboLista.Add('0');    ComboDatos.Add('BI');
    ComboLista.Add('1');    ComboDatos.Add('FI');
    ComboLista.Add('2');    ComboDatos.Add('DE');
    ComboLista.Add('3');    ComboDatos.Add('AC');
  end;
  TIPO_SUPERVISOR.Caption := 'Tipo Supervisor';

  TIPO_EVENTO := CreaCampo('TIPO_EVENTO', ftString, tsNinguno, tsNinguno, True);
  with TIPO_EVENTO do
  begin
    Size := 2;
    UseCombo := True;
    ComboLista.Add('0');    ComboDatos.Add('VI');
    ComboLista.Add('1');    ComboDatos.Add('TE');
    ComboLista.Add('2');    ComboDatos.Add('CI');
  end;
  TIPO_EVENTO.Caption := 'Tipo Evento';

  ID_CREDITO := CreaCampo('ID_CREDITO', ftFloat, tsNinguno, tsNinguno, True);
  ID_CREDITO.Caption := 'Número de Credito';

  NOMBRE_SPVISOR := CreaCampo('NOMBRE_SPVISOR', ftString, tsNinguno, tsNinguno, True);
  NOMBRE_SPVISOR.Caption := 'Nombre Spvisor';

  TXT_COMENTARIO := CreaCampo('TXT_COMENTARIO', ftString, tsNinguno, tsNinguno, True);
  TXT_COMENTARIO.Caption := 'Txt Comentario';

  B_RES_DICTAMEN := CreaCampo('B_RES_DICTAMEN', ftString, tsNinguno, tsNinguno, True);
  with B_RES_DICTAMEN do
  begin
    Size := 2;
    UseCombo := True;
    ComboLista.Add('0');    ComboDatos.Add('0');
    ComboLista.Add('1');    ComboDatos.Add('V');
    ComboLista.Add('2');    ComboDatos.Add('F');
  end;
  B_RES_DICTAMEN.Caption := 'Res Dictamen';

  F_LIM_ACLARA := CreaCampo('F_LIM_ACLARA', ftDate, tsNinguno, tsNinguno, True);
  F_LIM_ACLARA.Caption := 'Fecha Lim Aclara';

  F_PROX_EVENTO := CreaCampo('F_PROX_EVENTO', ftDate, tsNinguno, tsNinguno, True);
  F_PROX_EVENTO.Caption := 'Fecha Prox Evento';

  F_ENT_CRED := CreaCampo('F_ENT_CRED', ftDate, tsNinguno, tsNinguno, True);
  F_ENT_CRED.Caption := 'Fecha entrega a credito';

  B_REESTR_VIA := CreaCampo('B_REESTR_VIA', ftString, tsNinguno, tsNinguno, True);
  with B_REESTR_VIA do
  begin
    Size := 2;
    UseCombo := True;
    ComboLista.Add('0');    ComboDatos.Add('0');
    ComboLista.Add('1');    ComboDatos.Add('V');
    ComboLista.Add('2');    ComboDatos.Add('F');
  end;
  B_REESTR_VIA.Caption := 'Reestructuración Viable';
  F_MODIFICACION := CreaCampo('F_MODIFICACION', ftDateTime, tsNinguno, tsNinguno, True);

  CVE_CLAS_CRED := CreaCampo('CVE_CLAS_CRED', ftString, tsNinguno, tsNinguno, True);


  //--> Campos informativos
  ID_PROMOTOR :=CreaCampo('ID_PROMOTOR',ftFloat,tsNinguno,tsNinguno,True);
  ID_PROMOTOR.Caption:='Número de Promotor';

  ID_DESPACHO :=CreaCampo('ID_DESPACHO',ftFloat,tsNinguno,tsNinguno,True);
  ID_DESPACHO.Caption:='Número de Despacho';
  //<--

  FKeyFields.Add('ID_CREDITO');
  FKeyFields.Add('F_EVENTO');
  FKeyFields.Add('TIPO_SUPERVISOR');
  FKeyFields.Add('TIPO_EVENTO');
  FKeyFields.Add('F_MODIFICACION');

  { Buscadores
  --> }
  Credito := TCrCredito.Create(Self);
  Credito.MasterSource := Self;
  Credito.ID_CREDITO.MasterField := 'ID_CREDITO';

  PromotorAdm := TPersona.Create(Self);
  PromotorAdm.MasterSource := Self;
  PromotorAdm.ID_Persona.MasterField := 'ID_PROMOTOR';

  PersonaDesp := TPersona.Create(Self);
  PersonaDesp.MasterSource := Self;
  PersonaDesp.ID_Persona.MasterField := 'ID_DESPACHO';

  DispFIRA := TCrDispF.Create(Self);
  DispFIRA.MasterSource := Self;

  PersFIRA := TCrPersF.Create(Self);
  PersFIRA.MasterSource := Self;

  ClasCred := TCatClasCred.Create(Self);
  ClasCred.MasterSource := Self;
  ClasCred.CVE_CLAS_CRED.MasterField := 'CVE_CLAS_CRED';

  TableName := 'ADMIPROD.CR_AM_BITACORA';
  UseQuery  := True;
  HelpFile  := 'IntCrAmBitac.Hlp';
  ShowMenuReporte := True;
end;

destructor TCrAmBitac.Destroy;
begin
  if Credito <> nil then
    Credito.Free;

  if PersonaDesp <> nil then
    PersonaDesp.Free;

  if PromotorAdm <> nil then
    PromotorAdm.Free;

  if DispFIRA <> nil then
    DispFIRA.Free;

  if PersFIRA <> nil then
    PersFIRA.Free;

  if ClasCred <> nil then
    ClasCred.Free;

  inherited;
end;


function TCrAmBitac.ShowWindow(FormaTipo: TFormaTipo): integer;
var
  W: TWCrAmBitacora;
begin
  W := TWCrAmBitacora.Create(Self);
  try
    W.Objeto := Self;
    W.InterForma1.InterFrame := Self;
    W.InterForma1.FormaTipo := FormaTipo;
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;


function TCrAmBitac.InternalBusca: boolean;
var
  T: TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICrAmBit.it', 'F,D,S,S,D');
  try
    if Active then
    begin
      T.Param(0, ID_CREDITO.AsString);
      T.Param(1, F_EVENTO.AsString);
      T.Param(2, TIPO_SUPERVISOR.AsString);
      T.Param(3, TIPO_EVENTO.AsString);
      T.Param(4, F_MODIFICACION.AsString);
    end;
    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1),T.DameCampo(2), T.DameCampo(3), T.DameCampo(4)]);
  finally
    T.Free;
  end;
end;

{
function TCrAmBitac.Reporte: boolean;
begin //Execute_Reporte();
end;
}

 (***********************************************FORMA CR_AM_BITACORA********************)
 (*                                                                              *)
 (*  FORMA DE CR_AM_BITACORA                                                            *)
 (*                                                                              *)
 (***********************************************FORMA CR_AM_BITACORA********************)

procedure TWCrAmBitacora.FormShow(Sender: TObject);
begin
  //Datos del panel de la parte inferior de la forma
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption  := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption := objeto.ParamCre.PERFIL.AsString;

  //Vincula los campos de la forma con los campos de la base de datos
  Objeto.F_EVENTO.Control := edF_EVENTO;
  Objeto.TIPO_SUPERVISOR.Control := edTIPO_SUPERVISOR;
  Objeto.TIPO_EVENTO.Control := edTIPO_EVENTO;

  Objeto.Credito.ID_CREDITO.Control := edID_CREDITO;
  Objeto.Credito.ContratoCre.Contrato.ID_Titular.Control := edID_ACREDITADO;
  Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edNOM_ACREDITADO;

  Objeto.PromotorAdm.ID_Persona.Control := edID_PROMOTOR;
  Objeto.PromotorAdm.Nombre.Control := edNOM_PROMOTOR;

  Objeto.PersonaDesp.ID_Persona.Control := edID_DESPACHO;
  Objeto.PersonaDesp.Nombre.Control := edDESPACHO;

  Objeto.NOMBRE_SPVISOR.Control := edNOMBRE_SPVISOR;
  Objeto.TXT_COMENTARIO.Control := edTXT_COMENTARIO;
  Objeto.B_RES_DICTAMEN.Control := edB_RES_DICTAMEN;
  Objeto.F_LIM_ACLARA.Control := edF_LIM_ACLARA;

  Objeto.F_PROX_EVENTO.Control := edF_PROX_EVENTO;
  Objeto.F_ENT_CRED.Control := edF_ENT_CRED;

  Objeto.B_REESTR_VIA.Control := edB_REESTR_VIA;

  Objeto.CVE_CLAS_CRED.Control := edCVE_CLAS_CRED;
  Objeto.ClasCred.DESC_CLAS_CRED.Control := edDESC_CLAS_CRED;

  Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrAmBitacora.FormDestroy(Sender: TObject);
begin

  Objeto.F_EVENTO.Control := nil;
  Objeto.TIPO_SUPERVISOR.Control := nil;
  Objeto.TIPO_EVENTO.Control := nil;

  Objeto.Credito.ID_CREDITO.Control := nil;
  Objeto.Credito.ContratoCre.Contrato.ID_Titular.Control := nil;
  Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;

  Objeto.PromotorAdm.ID_Persona.Control := nil;
  Objeto.PromotorAdm.Nombre.Control := nil;

  Objeto.PersonaDesp.ID_Persona.Control := nil;
  Objeto.PersonaDesp.Nombre.Control := nil;

  Objeto.NOMBRE_SPVISOR.Control := nil;
  Objeto.TXT_COMENTARIO.Control := nil;
  Objeto.B_RES_DICTAMEN.Control := nil;
  Objeto.F_LIM_ACLARA.Control := nil;

  Objeto.F_PROX_EVENTO.Control := nil;
  Objeto.F_ENT_CRED.Control := nil;

  Objeto.B_REESTR_VIA.Control := nil;
  Objeto.CVE_CLAS_CRED.Control := nil;
  Objeto.ClasCred.DESC_CLAS_CRED.Control := nil;

end;

procedure TWCrAmBitacora.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrAmBitacora.InterForma1DespuesNuevo(Sender: TObject);
begin
  //Establece las opciones por defecto de los controles RadioGroup
  edTIPO_EVENTO.ItemIndex := 0;
  Objeto.TIPO_EVENTO.GetFromControl;
  edTIPO_SUPERVISOR.ItemIndex := 0;
  Objeto.TIPO_SUPERVISOR.GetFromControl;
  edB_RES_DICTAMEN.ItemIndex := 0;
  Objeto.B_RES_DICTAMEN.GetFromControl;
  edB_REESTR_VIA.ItemIndex := 0;
  Objeto.B_REESTR_VIA.GetFromControl;

  Objeto.F_EVENTO.AsDateTime := Objeto.Apli.SysDateTime;
  Objeto.F_EVENTO.GetFromControl;

  bitacora; //Limpia la tabla

  edF_EVENTO.SetFocus;
end;

procedure TWCrAmBitacora.InterForma1DespuesModificar(Sender: TObject);
begin
  edF_EVENTO.SetFocus;
end;

 //procedure TWCrAmBitacora.BitBtn1Click(Sender: TObject);
 //begin // Objeto.Reporte;
 //end;
{ Genera reporte
}
procedure TWCrAmBitacora.GeneraCita;
var
  vlSQL : String;
  vlQry : TQuery;
  plantilla : String;
  Format: OleVariant;
  LCID : Integer;
  fila : Integer;
  fila1,ins1 : Integer;
  fila2,ins2 : Integer;
  subtotalRC : Real;
  subtotalRP : Real;
  nombre : String;
  hora : String;
begin
  if (objeto.Modo = moAppend) Or (objeto.Modo = moEdit) Then
    objeto.ID_CREDITO.GetFromControl;

  try
    try
        {* Instrucciones para el archivo excel de salida
       *}
      LCID := GetUserDefaultLCID;
      //Extre el nombre y ubicación de la plantilla
      vlQry := GetSqlQueryNoNil( ' select desc_clave from cr_con_cat_data where cve_con_gpo_cat = ''AGROMASIVOS'' and cve_clave = ''BITACORA-PLANTILLA''',
                                 Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);

      If Assigned(vlQry) Then
        plantilla := vlQry.FieldByName('desc_clave').AsString;
      // Abre el archivo
      ExcelApplicationO.Connect;
      //Si existe la plantilla la utiliza
      try
        ExcelWorkbookO.ConnectTo(ExcelApplicationO.Workbooks.add(plantilla,0));
      except
      on E: Exception do
        ExcelWorkbookO.ConnectTo(ExcelApplicationO.Workbooks.Add(EmptyParam, 0));
      end;


      ExcelWorksheetO.ConnectTo(ExcelApplicationO.ActiveSheet as _Worksheet);
      // Hace a Excel invisible
      ExcelApplicationO.Visible[LCID] := False;
      ExcelApplicationO.DisplayAlerts[LCID] := False;

      nombre := FormatDateTime('yyyymmdd_hhnnss',StrToDateTime(edF_EVENTO.Text))+'_'+edID_CREDITO.Text;

      //Guarda con el nombre definido la plantilla en formate de excel
      ExcelWorkbookO.SaveAs(nombre,
                                Null,
                                Null,
                                Null,
                                false,
                                false,
                                xlNoChange,
                                xlUserResolution,
                                false,
                                Null,
                                Null,
                                0
                                );


      //--> Encabezado
      Format := 'dd/mm/aaaa hh:mm:ss';
      ExcelWorksheetO.Range['AL1','AP1'].Merge(EmptyParam);
      //ExcelWorksheetO.Range['AL1','AP1'].NumberFormat := Format;
      hora := FormatDateTime('dd/mm/yyyy hh_nn_ss',StrToDateTime(edF_EVENTO.Text));
      ExcelWorksheetO.Cells.Item[1,'AL'] := hora;
      ExcelWorksheetO.Cells.Item[2,'AM'] := edID_CREDITO.Text;
      ExcelWorksheetO.Range['AM2','AP2'].Merge(EmptyParam);

      if objeto.TIPO_SUPERVISOR.AsString = 'BI' then
        ExcelWorksheetO.Cells.Item[3,'AI'] := 'BINTER'
      else if objeto.TIPO_SUPERVISOR.AsString = 'DE' then
        ExcelWorksheetO.Cells.Item[3,'AI'] := 'DESPACHO';

      ExcelWorksheetO.Cells.Item[6,'V'] := objeto.F_PROX_EVENTO.AsDateTime; //edF_PROX_EVENTO.Text;
      //<-- Encabezado

      //--> Acreditado
      ExcelWorksheetO.Cells.Item[8,'F'] := edNOM_ACREDITADO.Text;
      //Domicilio
      vlSQL :=
        ' select dom.calle_numero||'' ''||dom.colonia||'' ''||dom.codigo_postal||'' ''||dom.ciudad as domicilio, dom.estado ' +
        ' from   cr_credito cre, ' +
        ' 			 contrato con, ' +
        ' 			 persona p, ' +
        '        (select id_domicilio, ' +
        '                calle_numero, ' +
        '                calle, ' +
        '                num_exterior, ' +
        '                num_interior, ' +
        '                colonia, ' +
        '                codigo_postal, ' +
        '                a.desc_poblacion as ciudad, ' +
        '                b.desc_poblacion as estado, ' +
        '                c.desc_poblacion as pais ' +
        '         from   domicilio dom, ' +
        '                poblacion a, ' +
        '                poblacion b, ' +
        '                poblacion c ' +
        '         where  (a.cve_poblac_ubic = b.cve_poblacion) and (b.cve_poblac_ubic = c.cve_poblacion) and a.cve_poblacion = cve_ciudad) dom ' +
        ' where	 cre.id_contrato = con.id_contrato ' +
        ' and		 con.id_titular = p.id_persona ' +
        ' and		 p.id_domicilio = dom.id_domicilio ' +
        ' and		 cre.id_credito = ' + objeto.ID_CREDITO.AsString;

      vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
      if Assigned(vlQry) then
      begin
        try
        ExcelWorksheetO.Cells.Item[9,'I'] := vlQry.FieldByName('domicilio').AsString;
        finally vlQry.Free;
        end;
      end;

      //Domicilio fiscal y estado
      vlSQL :=
        ' select dom.calle_numero||'' ''||dom.colonia||'' ''||dom.codigo_postal||'' ''||dom.ciudad as domicilio, nvl(dom.estado,''-'') as estado ' +
        ' from   cr_credito cre, ' +
        ' 			 contrato con, ' +
        ' 			 persona p, ' +
        '        (select id_domicilio, ' +
        '                calle_numero, ' +
        '                calle, ' +
        '                num_exterior, ' +
        '                num_interior, ' +
        '                colonia, ' +
        '                codigo_postal, ' +
        '                a.desc_poblacion as ciudad, ' +
        '                b.desc_poblacion as estado, ' +
        '                c.desc_poblacion as pais ' +
        '         from   domicilio dom, ' +
        '                poblacion a, ' +
        '                poblacion b, ' +
        '                poblacion c ' +
        '         where  (a.cve_poblac_ubic = b.cve_poblacion) and (b.cve_poblac_ubic = c.cve_poblacion) and a.cve_poblacion = cve_ciudad) dom ' +
        ' where	 cre.id_contrato = con.id_contrato ' +
        ' and		 con.id_titular = p.id_persona ' +
        ' and		 p.id_dom_fiscal = dom.id_domicilio ' +
        ' and		 cre.id_credito = ' + objeto.ID_CREDITO.AsString;

      vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
      if Assigned(vlQry) then
      begin
        try
        ExcelWorksheetO.Cells.Item[10,'J'] := vlQry.FieldByName('domicilio').AsString;
        ExcelWorksheetO.Cells.Item[13,'G'] := vlQry.FieldByName('estado').AsString;
        finally vlQry.Free;
        end;
      end;

      //Telefonos
      vlSQL :=
        ' select telef_casa || '' '' || telef_fax || '' '' || telef_oficina as telefono ' +
        ' from   cr_credito cre, ' +
        ' 			 contrato con, ' +
        ' 			 persona p ' +
        ' where	 cre.id_contrato = con.id_contrato ' +
        ' and		 con.id_titular = p.id_persona ' +
        ' and		 cre.id_credito = ' + objeto.ID_CREDITO.AsString;
      vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
      if Assigned(vlQry) then
      begin
        try
        ExcelWorksheetO.Cells.Item[12,'G'] := vlQry.FieldByName('telefono').AsString;
        finally vlQry.Free;
        end;
      end;
      //<-- Acreditado

      //--> Credito
      ExcelWorksheetO.Cells.Item[8,'AH'] := Objeto.Credito.ContratoCre.Producto.DESC_C_PRODUCTO.AsString;
      ExcelWorksheetO.Cells.Item[9,'AE'] := Objeto.Credito.IMP_CREDITO.AsString;
      ExcelWorksheetO.Cells.Item[10,'AI'] := ''''+FormatDateTime('dd/mm/yyyy',Objeto.Credito.F_ALTA.AsDateTime);
      //Objeto.Credito.F_ALTA.AsString;
      //ExcelWorksheetO.Range['AI10','AP10'].Merge(EmptyParam);
      ExcelWorksheetO.Cells.Item[11,'AI'] := Objeto.Credito.F_VENCIMIENTO.AsString;
      //Próxima fecha de vencimiento de capital
      vlSQL :=
        ' select min(f_prog_pago) as f_prog_pago from ( ' +
        '   select min(f_prog_pago) as f_prog_pago from cr_capital ' +
        '   where f_prog_pago > ' + SQLFecha(StrToDateTime(edF_EVENTO.Text)) +
        '   and		id_credito = ' + objeto.ID_CREDITO.AsString +
        ' )';

      vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
      if Assigned(vlQry) then
      begin
        try
        ExcelWorksheetO.Cells.Item[12,'AL'] := vlQry.FieldByName('f_prog_pago').AsString;
        finally vlQry.Free;
        end;
      end;
      ExcelWorksheetO.Cells.Item[13,'AI'] := edDESPACHO.Text;
      //<-- Credito

      fila1 := 0;
      fila2 := 0;
      ins1 := 0;
      ins2 := 0;
      subtotalRC := 0;
      subtotalRP := 0;
      //--> Recursos del crédito
      vlSQL :=
        ' select cat.desc_con_inv, cac.unidades, cac.importe ' +
        ' from   cr_am_cinv cac, ' +
        ' 		   cr_con_inv cat ' +
        ' where  cat.cve_con_inv = cac.cve_con_inv ' +
        ' and		 b_rec_pres = ''V'' ' +
        ' and		 cac.id_credito = ' + objeto.ID_CREDITO.AsString;
      vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
      if Assigned(vlQry) then
      begin
        while Not vlQry.Eof Do
        begin
          ExcelWorksheetO.Cells.Item[cRenRC+fila1,'A'] := vlQry.FieldByName('desc_con_inv').AsString;
          ExcelWorksheetO.Cells.Item[cRenRC+fila1,'W'] := vlQry.FieldByName('importe').AsString;
          ExcelWorksheetO.Cells.Item[cRenRC+fila1,'Q'] := vlQry.FieldByName('unidades').AsString;

          subtotalRC := subtotalRC + vlQry.FieldByName('importe').AsFloat;
          inc(fila1);
          vlQry.Next;
        end;
        //Subtotales
        ExcelWorksheetO.Cells.Item[cSubtotRC+ins1,'W'] := subtotalRC;

      end;
      //<-- Recursos del crédito

      //--> Recursos del productor
      vlSQL :=
        ' select cat.desc_con_inv, cac.unidades, cac.importe ' +
        ' from   cr_am_cinv cac, ' +
        ' 		   cr_con_inv cat ' +
        ' where  cat.cve_con_inv = cac.cve_con_inv ' +
        ' and		 b_rec_pres = ''F'' ' +
        ' and		 cac.id_credito = ' + objeto.ID_CREDITO.AsString;
      vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
      if Assigned(vlQry) then
      begin
        while Not vlQry.Eof Do
        begin
          ExcelWorksheetO.Cells.Item[cRenRP+fila2,'A'] := vlQry.FieldByName('desc_con_inv').AsString;
          ExcelWorksheetO.Cells.Item[cRenRP+fila2,'W'] := vlQry.FieldByName('importe').AsString;
          ExcelWorksheetO.Cells.Item[cRenRP+fila2,'Q'] := vlQry.FieldByName('unidades').AsString;

          subtotalRP := subtotalRP + vlQry.FieldByName('importe').AsFloat;
          inc(fila2);
          vlQry.Next;
        end;

        //Subtotales
        ExcelWorksheetO.Cells.Item[cSubtotRP+ins1,'W'] := subtotalRP;
      end;
      //<-- Recursos del productor

      //Número de renglones agregados a la sección de conceptos de inversión
      //fila := ins1 + ins2;

      //--> Dictamen
      vlSQL :=
        ' select b_res_dictamen, f_evento from ( ' +
        ' select   b_res_dictamen, f_evento ' +
        ' from     cr_am_bitacora ' +
        ' where    id_credito = ' + objeto.ID_CREDITO.AsString +
        ' and			 tipo_evento = ''VI'' ' +
        ' order by f_evento desc ' +
        ' ) ' +
        ' where rownum = 1 ';

      vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
      if Assigned(vlQry) then
      begin
        try
        if vlQry.FieldByName('b_res_dictamen').AsString = 'V' then
          ExcelWorksheetO.Cells.Item[113,'AE'] := 'X'
        else if vlQry.FieldByName('b_res_dictamen').AsString = 'F' then
          ExcelWorksheetO.Cells.Item[113,'AM'] := 'X'
        finally vlQry.Free;
        end;
      end;
    finally
      ExcelWorkbookO.Save;
      ExcelApplicationO.Visible[LCID] := True;
    end;

  except
    on e : exception do
    Begin
      MessageDlg('No se generó el reporte debido a un error.' + e.Message, mtError, [mbOk], 0 );
    End;
  end;


end;

{ Llena la bitácora del crédito seleccionado
}
procedure TWCrAmBitacora.Bitacora;
var
  vlSQL : String;
  vgQryBitacora : TQuery;
begin
  sgBitacora.Clear('NO EXISTEN DATOS'#30'>C');
  if edID_CREDITO.Text <> '' then
  begin

    vlSQL :=
      ' select   f_evento, ' +
      '          case tipo_supervisor ' +
      '            when ''BI'' then ''BINTER'' ' +
      '            when ''FI'' then ''FIRA'' ' +
      '            when ''DE'' then ''Despacho'' ' +
      '            when ''AC'' then ''Acreditado'' ' +
      '          end as tipo_supervisor, ' +
      '          case tipo_evento ' +
      '            when ''VI'' then ''Visita'' ' +
      '            when ''TE'' then ''Telefono'' ' +
      '            when ''CI'' then ''Cita'' ' +
      '            when ''CC'' then ''Cita Cumplida'' ' +
      '          end as tipo_evento, ' +
      '          nombre_spvisor, ' +
      '          substr(txt_comentario,0,60) as txt_comentario, ' +
      '          case b_res_dictamen ' +
      '            when ''V'' then ''Positivo'' ' +
      '            when ''F'' then ''Negativo'' ' +
      '            else ''n/a'' ' +
      '          end as b_res_dictamen, ' +
      '          case b_reestr_via ' +
      '            when ''V'' then ''Si'' ' +
      '            when ''F'' then ''No'' ' +
      '            else ''n/a'' ' +
      '          end as b_reestr_via, ' +
      '          f_ent_cred, ' +
      '          f_lim_aclara, ' +
      '          f_prox_evento, ' +
      '          f_modificacion ' +      
      ' from     cr_am_bitacora ' +
      ' where		 id_credito = ' + edID_CREDITO.Text +
      ' order by f_evento desc ';

    vgQryBitacora  := GetSQLQueryNoNil(vlSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
    If Assigned(vgQryBitacora) Then
    begin
      try
      vgQryBitacora.FieldByName('f_evento').DisplayLabel := 'Fecha Evento';
      vgQryBitacora.FieldByName('f_evento').DisplayWidth := 24;
      vgQryBitacora.FieldByName('tipo_supervisor').DisplayLabel := 'Ente';
      vgQryBitacora.FieldByName('tipo_supervisor').DisplayWidth := 8;
      vgQryBitacora.FieldByName('tipo_evento').DisplayLabel := 'Tipo';
      vgQryBitacora.FieldByName('tipo_evento').DisplayWidth := 8;
      vgQryBitacora.FieldByName('nombre_spvisor').DisplayLabel := 'Visitó o Llamó';
      vgQryBitacora.FieldByName('nombre_spvisor').DisplayWidth := 24;
      vgQryBitacora.FieldByName('txt_comentario').DisplayLabel := 'Comentarios';
      vgQryBitacora.FieldByName('txt_comentario').DisplayWidth := 48;
      vgQryBitacora.FieldByName('b_res_dictamen').DisplayLabel := 'Dictamen';
      vgQryBitacora.FieldByName('b_res_dictamen').DisplayWidth := 8;
      vgQryBitacora.FieldByName('b_reestr_via').DisplayLabel := 'Reestr. Suscept.';
      vgQryBitacora.FieldByName('b_reestr_via').DisplayWidth := 12;
      vgQryBitacora.FieldByName('f_ent_cred').DisplayLabel := 'Entrega de crédito';
      vgQryBitacora.FieldByName('f_ent_cred').DisplayWidth := 12;
      vgQryBitacora.FieldByName('f_lim_aclara').DisplayLabel := 'Límite de aclaración';
      vgQryBitacora.FieldByName('f_lim_aclara').DisplayWidth := 12;
      vgQryBitacora.FieldByName('f_prox_evento').DisplayLabel := 'Próximo evento';
      vgQryBitacora.FieldByName('f_prox_evento').DisplayWidth := 12;
      vgQryBitacora.FieldByName('f_modificacion').DisplayLabel := 'Fecha alta';
      vgQryBitacora.FieldByName('f_modificacion').DisplayWidth := 12;
      sgBitacora.AddQry(vgQryBitacora,True,True,-1,-1,-1,True);
      finally vgQryBitacora.Free;
      end;
    end;

  end;
end;

procedure TWCrAmBitacora.MuestraDatosCredito;
begin
  Objeto.PromotorAdm.FindKey([Objeto.Credito.ID_PROM_ADM.AsString]);
  if Objeto.DispFIRA.FindKey([Objeto.Credito.ID_CREDITO.AsString]) then
  begin
    Objeto.PersonaDesp.FindKey([Objeto.DispFIRA.ID_DESPACHO.AsString]);
  end;
end;

procedure TWCrAmBitacora.btID_CREDITOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRAMBITAC_DISP',True,True) then
   begin
      Objeto.Credito.ShowAll := True;
      if Objeto.Credito.Busca then
      begin
        MuestraDatosCredito;
        Bitacora;
        InterForma1.NextTab(edID_CREDITO);
      end;
   end;
end;

procedure TWCrAmBitacora.btID_DESPACHOClick(Sender: TObject);
begin
  Objeto.PersonaDesp.ShowAll := True;
  if Objeto.PersonaDesp.Busca then
  begin
    InterForma1.NextTab(edID_DESPACHO);
  end;
end;

procedure TWCrAmBitacora.InterForma1AntesNuevo(Sender: TObject; var Realizado: boolean);
begin
  dtpF_EVENTO.Time := Time;
end;

procedure TWCrAmBitacora.ilID_CREDITOEjecuta(Sender: TObject);
begin
  if Objeto.Credito.findKey([ilID_CREDITO.buffer]) then
  begin
    MuestraDatosCredito;
    Bitacora;
    InterForma1.NextTab(edID_CREDITO);
  end;
end;

//Objeto.PersonaDesp.findKey([ilID_DESPACHO.buffer])

function TWCrAmBitacora.VerificaRegistroDuplicado:Boolean;
var
  vlSQL : String;
  vlQry : TQuery;
begin
  VerificaRegistroDuplicado := True;
  if (objeto.Modo = moAppend) Then
  begin
    objeto.F_EVENTO.GetFromControl;
    objeto.ID_CREDITO.GetFromControl;
    objeto.TIPO_SUPERVISOR.GetFromControl;
    objeto.TIPO_EVENTO.GetFromControl;
    if (edID_CREDITO.Text = '') or (edF_EVENTO.Text = '') then
      Exit;
    vlSQL :=
        ' select count(id_credito) as num ' +
        ' from	 cr_am_bitacora ' +
        ' where	 id_credito = ' + edID_CREDITO.Text +
        ' and    tipo_supervisor = ''' + objeto.TIPO_SUPERVISOR.AsString + ''' ' +
        ' and    tipo_evento = ''' + objeto.TIPO_EVENTO.AsString + ''' ' +
        ' and		 f_evento = to_date('''+edF_EVENTO.Text+''',''dd/mm/yyyy HH24:MI:SS'') ';
    vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
    if Assigned(vlQry) then
    begin
      try
      if vlQry.FieldByName('num').AsInteger > 0 then
        VerificaRegistroDuplicado := False;
      finally vlQry.Free;
      end;
    end;
  end;
end;

procedure TWCrAmBitacora.edF_EVENTOExit(Sender: TObject);
var
  fechaInf : TDateTime;
  fecha : TDateTime;
  vlbSalida  :  Boolean;
  vlStrMesg   :  String;
begin
  vlbSalida := True;
  vlStrMesg := '';
  if edF_EVENTO.text <> '' then
  begin
    fechaInf := StrToDateTime('01/01/2009');
    fecha := StrToDateTime(edF_EVENTO.Text);
    if (fecha < fechaInf) then
    begin
      vlbSalida := False;
      vlStrMesg := 'La fecha debe ser mayor a 01/01/2009';
    end
    else
    begin
      vlbSalida := VerificaRegistroDuplicado;
      if not vlbSalida then
        vlStrMesg := 'Registro duplicado';
    end;
  end;
  InterForma1.ValidaExit(edF_EVENTO, vlbSalida, vlStrMesg, True);
end;

{
procedure TWCrAmBitacora.dtpF_EVENTOCloseUp(Sender: TObject);
var
  fechaInf : TDateTime;
  fecha : TDateTime;
  vlbSalida  :  Boolean;
  vlStrMesg   :  String;
begin
  vlbSalida := True;
  vlStrMesg := 'La fecha debe ser mayor a 01/01/2009';
  fechaInf := StrToDateTime('01/01/2009');
  fecha := StrToDateTime(edF_EVENTO.Text);
  if (fecha < fechaInf) then
    vlbSalida := False;
  InterForma1.ValidaExit(edF_EVENTO, vlbSalida, vlStrMesg, True);
}

procedure TWCrAmBitacora.edID_CREDITOExit(Sender: TObject);
var
  vlbSalida  :  Boolean;
  vlStrMesg   :  String;
begin
  vlbSalida := True;
  vlStrMesg := '';
  if trim(edID_CREDITO.text) = '' then
  begin
    vlbSalida := False;
    vlStrMesg := 'El crédito no puede ser nulo';
  end
  else
  begin
    vlbSalida := VerificaRegistroDuplicado;
    if not vlbSalida then
      vlStrMesg := 'Registro duplicado';
  end;
  InterForma1.ValidaExit(edID_CREDITO, vlbSalida, vlStrMesg, True);
end;

procedure TWCrAmBitacora.edID_DESPACHOExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edID_DESPACHO, True, '', True);
end;

procedure TWCrAmBitacora.edNOMBRE_SPVISORExit(Sender: TObject);
var
  vlbSalida  :  Boolean;
  vlStrMesg   :  String;
begin
  vlbSalida := True;
  vlStrMesg := '';
  if trim(edNOMBRE_SPVISOR.text) = '' then
  begin
    vlbSalida := False;
    vlStrMesg := 'El nombre del quien visitó no puede ser nulo';
  end;
  InterForma1.ValidaExit(edNOMBRE_SPVISOR, vlbSalida, vlStrMesg, True);
end;

procedure TWCrAmBitacora.edTXT_COMENTARIOExit(Sender: TObject);
var
  vlbSalida  :  Boolean;
  vlStrMesg   :  String;
begin
  vlbSalida := True;
  vlStrMesg := '';
  if (trim(edTXT_COMENTARIO.text) = '') and (edTIPO_EVENTO.ItemIndex <> 2) then
  begin
    vlbSalida := False;
    vlStrMesg := 'El comentario no puede ser nulo';
  end;
  InterForma1.ValidaExit(edTXT_COMENTARIO, vlbSalida, vlStrMesg, True);
end;

procedure TWCrAmBitacora.edF_LIM_ACLARAExit(Sender: TObject);
var
  vlbSalida  :  Boolean;
  vlStrMesg   :  String;
  f_evento : TDateTime;
  f_lim_aclara : TDateTime;
Begin
  vlbSalida := True;
  vlStrMesg := '';
  if (objeto.Modo = moAppend) Or (objeto.Modo = moEdit) Then
  begin
    objeto.TIPO_SUPERVISOR.GetFromControl;
    objeto.F_LIM_ACLARA.GetFromControl;

    f_evento := StrToDateTime(edF_EVENTO.Text);

    //Si en el tipo de supervisor esta seleccionado FIRA la fecha no puede ser nula
    if (Trim(edF_LIM_ACLARA.Text) = '') and (objeto.TIPO_SUPERVISOR.AsString = 'FI') then
    begin
       vlbSalida := False;
       vlStrMesg := 'La fecha de límite de aclaración no puede ser nula';
    end
    else if (Trim(edF_LIM_ACLARA.Text) <> '') then
    begin
      f_lim_aclara := StrToDateTime(edF_LIM_ACLARA.Text);
      if f_lim_aclara < f_evento then
      begin
        vlbSalida := False;
        vlStrMesg := 'La fecha de límite de aclaración debe ser mayor a la fecha de evento';
      end;
    end;
  end;
  InterForma1.ValidaExit(edF_LIM_ACLARA, vlbSalida, vlStrMesg, True);
end;

procedure TWCrAmBitacora.edF_PROX_EVENTOExit(Sender: TObject);
var
  vlbSalida  :  Boolean;
  vlStrMesg   :  String;
  f_evento : TDateTime;
  f_prox_evento : TDateTime;
Begin
  vlbSalida := True;
  vlStrMesg := '';
  if (objeto.Modo = moAppend) Or (objeto.Modo = moEdit) Then
  begin
    f_evento := StrToDateTime(edF_EVENTO.Text);
    objeto.F_PROX_EVENTO.GetFromControl;
    objeto.TIPO_EVENTO.GetFromControl;

    if (trim(edF_PROX_EVENTO.Text) <> '') then
    begin
      f_prox_evento := StrToDateTime(edF_PROX_EVENTO.Text);
      if (f_prox_evento + 1) < f_evento then
      begin
        vlbSalida := False;
        vlStrMesg := 'La fecha de próximo evento debe ser mayor a la fecha de evento';
      end;
    end
    else if objeto.TIPO_EVENTO.AsString = 'CI' then
    begin
      vlbSalida := False;
      vlStrMesg := 'La fecha de próximo evento se debe definir para una cita.';
    end;

  end;
  InterForma1.ValidaExit(edF_PROX_EVENTO, vlbSalida, vlStrMesg, True);
end;

procedure TWCrAmBitacora.edF_ENT_CREDExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_ENT_CRED, True, '', True);
end;

procedure TWCrAmBitacora.edTIPO_SUPERVISORClick(Sender: TObject);
begin
  with Objeto Do
  if (Modo = moAppend) Or (Modo = moEdit) Then
  begin
    TIPO_SUPERVISOR.GetFromControl;
    HabilitaFecha(TIPO_SUPERVISOR.AsString = 'FI');
    If (TIPO_SUPERVISOR.AsString = 'FI') Then
    begin
      edF_LIM_ACLARA.Text := '';
      F_LIM_ACLARA.GetFromControl;
    end;
  end;
end;

procedure TWCrAmBitacora.HabilitaFecha(peBHabilita: Boolean);
var
  hc : Integer;
begin
  hc := edF_ENT_CRED.HelpContext + 100;
  if (peBHabilita) then
  begin
    edF_LIM_ACLARA.Enabled := True;
    edF_LIM_ACLARA.Color := clWindow;
    edF_LIM_ACLARA.TabStop := True;
    edF_LIM_ACLARA.ReadOnly := False;
    edF_LIM_ACLARA.Tag := 18;
    edF_LIM_ACLARA.HelpContext := hc;

    dtpF_LIM_ACLARA.Enabled := True;
    dtpF_LIM_ACLARA.TabStop := True;
    dtpF_LIM_ACLARA.Tag := 18;
    dtpF_LIM_ACLARA.HelpContext := hc+2;
  end
  else
  begin
    edF_LIM_ACLARA.Enabled := False;
    edF_LIM_ACLARA.Color := clBtnFace;
    edF_LIM_ACLARA.TabStop := False;
    edF_LIM_ACLARA.ReadOnly := True;
    edF_LIM_ACLARA.Tag := 0;
    edF_LIM_ACLARA.HelpContext := 0;

    dtpF_LIM_ACLARA.Enabled := False;
    dtpF_LIM_ACLARA.TabStop := False;
    dtpF_LIM_ACLARA.Tag := 0;
    dtpF_LIM_ACLARA.HelpContext := 0;
  end;
end;

procedure TWCrAmBitacora.edTIPO_SUPERVISORExit(Sender: TObject);
var
  vlbSalida  :  Boolean;
  vlStrMesg   :  String;
begin
  vlStrMesg := '';
  vlbSalida := VerificaRegistroDuplicado;
  if not vlbSalida then
    vlStrMesg := 'Registro duplicado';
  InterForma1.ValidaExit(edTIPO_SUPERVISOR, vlbSalida, vlStrMesg, True);
end;

procedure TWCrAmBitacora.edTIPO_EVENTOExit(Sender: TObject);
var
  vlbSalida  :  Boolean;
  vlStrMesg   :  String;
begin
  vlStrMesg := '';
  vlbSalida := true;

  if (objeto.Modo = moAppend) or (objeto.Modo = moEdit) Then
  begin
    objeto.TIPO_SUPERVISOR.GetFromControl;
    objeto.TIPO_EVENTO.GetFromControl;
    if (objeto.TIPO_SUPERVISOR.AsString = 'AC') and (objeto.TIPO_EVENTO.AsString = 'CI') then
    begin
      vlbSalida := false;
      vlStrMesg := 'No se puede seleccionar CITA para un Ente Acreditado';
    end
    else begin
      vlbSalida := VerificaRegistroDuplicado;
      if not vlbSalida then
        vlStrMesg := 'Registro duplicado';
    end;
  end;
  InterForma1.ValidaExit(edTIPO_EVENTO, vlbSalida, vlStrMesg, True);
end;

procedure TWCrAmBitacora.edB_RES_DICTAMENExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edB_RES_DICTAMEN, True, '', True);
end;

procedure TWCrAmBitacora.InterForma1DespuesAceptar(Sender: TObject);
begin
  Bitacora;
  //Si Tipo = CITA Imprime reporte (y ENTE no es FIRA)
  if (edTIPO_EVENTO.ItemIndex = 2) and (edTIPO_SUPERVISOR.ItemIndex <> 1) then
    GeneraCita;
end;

procedure TWCrAmBitacora.InterForma1Buscar(Sender: TObject);
var
  encontrado: Boolean;
begin
  encontrado := objeto.InternalBusca;
  if encontrado then
    Bitacora;
end;

procedure TWCrAmBitacora.sgBitacoraDblClick(Sender: TObject);
var
  row : Integer;
  fecha   : String;
  supervisor : String;
  evento : String;
  fmodificacion   : String;
begin
  if objeto.Modo = moBrowse then
  begin
    row := sgBitacora.SG.Row;
    fecha := sgBitacora.SG.Cells[3,row];
    supervisor := sgBitacora.SG.Cells[4,row];
    evento := sgBitacora.SG.Cells[5,row];
    fmodificacion := sgBitacora.SG.Cells[13,row];

    if supervisor = 'BINTER' then
      supervisor := 'BI'
    else if supervisor = 'FIRA' then
      supervisor := 'FI'
    else if supervisor = 'Despacho' then
      supervisor := 'DE'
    else if supervisor = 'Acreditado' then
      supervisor := 'AC';

    if evento = 'Visita' then
      evento := 'VI'
    else if evento = 'Telefono' then
      evento := 'TE'
    else if evento = 'Cita' then
      evento := 'CI'
    else if evento = 'Cita Cumplida' then
      evento := 'CC';

    Objeto.FindKey([edID_CREDITO.Text, fecha, supervisor, evento, fmodificacion]);
  end;
end;

procedure TWCrAmBitacora.edB_REESTR_VIAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edB_REESTR_VIA, True, '', True);
end;

procedure TWCrAmBitacora.edCVE_CLAS_CREDExit(Sender: TObject);
begin
  if (objeto.Modo = moAppend) Or (objeto.Modo = moEdit) and (trim(edCVE_CLAS_CRED.Text) = '') then
    edDESC_CLAS_CRED.Text := '';
  InterForma1.ValidaExit(edCVE_CLAS_CRED, True, '', True);
end;


procedure TWCrAmBitacora.bImportarCitaClick(Sender: TObject);
var
  correcto: boolean;
  LCID: integer;
  credito : String;
  ente : String;
  tipo_supervisor : String;
  txt_comentario : String;
  b_res_dictamen : String;
  b_reestr_via : String;
  fecha_original : String;
  fecha_evento : String;
  fecha_prox_visita : String;
  fecha_modificacion : String;
  nombre_spvisor : String;
  temp, sTemp1, sTemp2 : String;
  causap : String;
  subcausap : String;
  vlSQL : String;
  vlQry : TQuery;
  itemp : Integer;
  dtemp : TDateTime;
  valido : Boolean;
  campo : String;
  buttonSelected : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRAMBITAC_IMPR',True,True) then
   begin
      if (objeto.Modo = moEdit) or (objeto.Modo = moAppend) then
      begin
        ShowMessage('No se puede importar documento en modo de edición.');
        Exit;
      end;

      correcto := False;
      while not correcto and odArchivoEntrada.Execute do
      begin
        odArchivoEntrada.FileName;
        if FileExists(odArchivoEntrada.FileName) then
          correcto := True
        else
          ShowMessage('Reporte inexistente. Por favor seleccione un reporte existente');
      end;

      if not correcto then
        Exit;

      LCID := GetUserDefaultLCID;
      {* Instrucciones para el archivo excel de entrada
       *}
      ExcelApplicationI.Connect;
      // Hace a Excel invisible
      ExcelApplicationI.Visible[LCID] := False;
      ExcelApplicationI.DisplayAlerts[LCID] := False;

      // Abre el archivo
      ExcelApplicationI.Workbooks.Open(odArchivoEntrada.FileName,
        EmptyParam, //UpdateLinks: OleVariant
        EmptyParam, //ReadOnly: OleVariant
        EmptyParam, //Format: OleVariant
        EmptyParam, //Password: OleVariant
        EmptyParam, //WriteResPassword: OleVariant
        EmptyParam, //IgnoreReadOnlyRecommended: OleVariant
        EmptyParam, //Orign: OleVariant
        EmptyParam, //Delimiter: OleVariant
        EmptyParam, //Editable: OleVariant
        EmptyParam, //Notify: OleVariant
        EmptyParam, //Converter: OleVariant
        EmptyParam, //AddToMru: OleVariant
        LCID
        );
      ExcelWorkbookI.ConnectTo(ExcelApplicationI.ActiveWorkbook);
      ExcelWorksheetI.ConnectTo(ExcelApplicationI.ActiveSheet as _Worksheet);

      //Intenta verificar que el formato sea válido
      valido := true;
      campo := ExcelWorksheetI.Cells.Item[2, 'AG'];
      if trim(campo) <> 'Núm Disposición' then
        valido := false;
      campo := ExcelWorksheetI.Cells.Item[3, 'AG'];
      if trim(campo) <> 'por' then
        valido := false;
      campo := ExcelWorksheetI.Cells.Item[81, 'A'];
      if trim(campo) <> '7. COMENTARIOS DEL PROMOTOR (VISITA)' then
        valido := false;
      campo := ExcelWorksheetI.Cells.Item[114, 'Z'];
      if trim(campo) <> 'POSITIVO' then
        valido := false;
      campo := ExcelWorksheetI.Cells.Item[114, 'AH'];
      if trim(campo) <> 'NEGATIVO' then
        valido := false;
      campo := ExcelWorksheetI.Cells.Item[115, 'A'];
      if trim(campo) <> 'FECHA DE VISITA' then
        valido := false;
      campo := ExcelWorksheetI.Cells.Item[116, 'A'];
      if trim(campo) <> 'FECHA PROXIMO EVENTO' then
        valido := false;
      campo := ExcelWorksheetI.Cells.Item[118, 'A'];
      if trim(campo) <> 'NOMBRE Y FIRMA DE QUIEN HACE LA VISITA' then
        valido := false;

      if not valido then
      begin
        ShowMessage('Formato incorrecto. Alguna celda fue modificada. La información no puede ser cargarda');
        Exit;
      end;

      try
        try
          //Extrae solo la información necesaria
          credito := ExcelWorksheetI.Cells.Item[2, 'AM']; //Crédito

          try
            itemp :=strtoint(credito)
          except
            ShowMessage('La disposición no es válida. La información no puede ser cargarda');
            Exit;
          end;

          fecha_original := ExcelWorksheetI.Cells.Item[1, 'AL']; //fecha de original de la cita

          ente := ExcelWorksheetI.Cells.Item[3, 'AI'];
          if ente = 'BINTER' then //Tipo supervisor
            tipo_supervisor := 'BI'
          else if ente = 'DESPACHO' then //Tipo supervisor
            tipo_supervisor := 'DE';

          //Verifica si existe la cita asociada
          vlSQL :=
            ' select count(id_credito) as num ' +
            ' from	 cr_am_bitacora ' +
            ' where	 id_credito = ' + credito +
            ' and    tipo_supervisor = ''' + tipo_supervisor + ''' ' +
            ' and    tipo_evento = ''CI'' ' +
            ' and		 f_evento = to_date('''+fecha_original+''',''dd/mm/yyyy HH24_MI_SS'') ';
          vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );

          if Assigned(vlQry) then
          begin
            try
            if vlQry.FieldByName('num').AsInteger = 0 then
            begin
              ShowMessage('No se encontró la cita asociada a la visita. La información no puede ser cargarda.');
              Exit;
            end;
            finally vlQry.Free;
            end;
          end;

          txt_comentario := ExcelWorksheetI.Cells.Item[83, 'A']; //Comentarios

          sTemp1 := ExcelWorksheetI.Cells.Item[114, 'AE'];
          sTemp2 := ExcelWorksheetI.Cells.Item[114, 'AM'];
          b_res_dictamen := '0';
          if trim(sTemp1) <> '' then //dictamen
            b_res_dictamen := 'V'
          else if trim(sTemp2) <> '' then //dictamen
            b_res_dictamen := 'F';


          sTemp1 := ExcelWorksheetI.Cells.Item[117, 'AE'];
          sTemp2 := ExcelWorksheetI.Cells.Item[117, 'AM'];
          b_reestr_via := '0';
          if trim(sTemp1) <> '' then //dictamen
            b_reestr_via := 'V'
          else if trim(sTemp2) <> '' then //dictamen
            b_reestr_via := 'F';

          fecha_evento := ExcelWorksheetI.Cells.Item[115, 'L']; //fecha de evento
          try
            dtemp := StrToDate(fecha_evento);
          except
            ShowMessage('Falta o esta incorrecta la fecha de la visita. La información no puede ser cargarda.');
            Exit;
          end;


          fecha_prox_visita := ExcelWorksheetI.Cells.Item[116, 'L']; //fecha próximo evento
          try
            dtemp := StrToDate(fecha_prox_visita);
          except
            buttonSelected := MessageDlg('Falta o esta incorrecta la fecha próximo evento. ¿Desea continuar?.',mtCustom,
                                  [mbYes,mbNo], 0);
            if buttonSelected = mrYes    then fecha_prox_visita := ''
            else if buttonSelected = mrNo then Exit;
          end;

          nombre_spvisor := ExcelWorksheetI.Cells.Item[119, 'A']; //persona que visita
          if (trim(nombre_spvisor) = '') or (trim(nombre_spvisor) = 'NOMBRE DE QUIEN HACE LA VISITA') then
          begin
            ShowMessage('Es necesario el nombre de quien visitó.');
            Exit;
          end;


          //Actualiza disposicion
          causap := ExcelWorksheetI.Cells.Item[108, 'AF'];
          subcausap := ExcelWorksheetI.Cells.Item[109, 'AF'];
          if (causap <> '') and (subcausap <> '') then
            RunSQL( 'update cr_am_dispf set CVE_CPGARF = ''' + causap + ''', CVE_SPGARF = ''' + subcausap + ''' ' +
            'where id_credito = ' + credito
            , Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False)
          else if (causap <> '') and (subcausap = '') then
            RunSQL( 'update cr_am_dispf set CVE_CPGARF = ''' + causap + '''' +
            ' where id_credito = ' + credito
            , Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);


        finally
          ExcelWorkbookI.SaveAs(odArchivoEntrada.FileName,
            Null,
            Null,
            Null,
            false,
            false,
            xlNoChange,
            xlUserResolution,
            false,
            Null,
            Null,
            LCID
            );
          ExcelApplicationI.Visible[LCID] := True;
          ExcelApplicationI.Disconnect;

        end;

        fecha_modificacion := FormatDateTime('dd/mm/yyyy hh:nn:ss',Now);
        //Inserta el registro
        try
        dtpF_EVENTO.Time := Time;
        vlSQL :=
          ' insert into cr_am_bitacora ' +
          ' (id_credito, tipo_supervisor, txt_comentario, b_res_dictamen, b_reestr_via, f_evento,f_prox_evento, nombre_spvisor, tipo_evento, f_modificacion) values (' +
          credito + ', ' +
          ' ''' + tipo_supervisor + ''', ' +
          ' ''' + txt_comentario + ''', '+
          ' ''' + b_res_dictamen + ''',  '+
          ' ''' + b_reestr_via + ''',  '+
          ' to_date(''' + fecha_evento + ''',''dd/mm/yyyy''), ' +
          ' to_date(''' + fecha_prox_visita + ''',''dd/mm/yyyy''), ' +
          ' ''' + nombre_spvisor + ''',''VI'', '+
          ' to_date('''+fecha_modificacion+''',''dd/mm/yyyy HH24:MI:SS'')) ';
        RunSQL(vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
        except
          MessageDlg('No se importó el archivo. Ya existe el registro', mtError, [mbOK], 0);
          Exit;
        end;

        //Actualiza la cita
        vlSQL :=
          ' update cr_am_bitacora ' +
          ' set tipo_evento = ''CC'' ' +
          ' where	 id_credito = ' + credito +
          ' and    tipo_evento = ''CI''' +
          ' and		 f_evento = to_date('''+fecha_original+''',''dd/mm/yyyy HH24:MI:SS'') ';
        RunSQL(vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
    {
        vlSQL :=
          ' select f_modificacion from cr_am_bitacora ' +
          ' where	 id_credito = ' + credito +
          ' and    tipo_evento = ''CC''' +
          ' and		 f_evento = to_date('''+fecha_original+''',''dd/mm/yyyy HH24:MI:SS'') ';

          vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
          if Assigned(vlQry) then
          begin
            try
              fecha_modificacion := vlQry.FieldByName('f_modificacion').AsString;
            finally vlQry.Free;
            end;
          end;
    }

        Objeto.FindKey([credito, fecha_evento, tipo_supervisor, 'VI', fecha_modificacion]);
    //    objeto.FindKey([credito, fecha_evento]);
        MuestraDatosCredito;
        Bitacora;

      except
        on e: Exception do
        begin
          MessageDlg('Error.' + e.Message, mtError, [mbOK], 0);
        end;
      end;
   end;   
end;

procedure TWCrAmBitacora.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  objeto.F_MODIFICACION.AsDateTime := Now;
end;

procedure TWCrAmBitacora.btCVE_CLAS_CREDClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRAMBITAC_CLASI',True,True) then
   begin
      Objeto.ClasCred.ShowAll := True;
      if Objeto.ClasCred.Busca then
      begin
        InterForma1.NextTab(edCVE_CLAS_CRED);
      end;
   end;
end;

procedure TWCrAmBitacora.ilCVE_CLAS_CREDEjecuta(Sender: TObject);
begin
  if Objeto.ClasCred.findKey([ilCVE_CLAS_CRED.buffer]) then
  begin
    InterForma1.NextTab(edCVE_CLAS_CRED);
  end;
end;

procedure TWCrAmBitacora.edCVE_CLAS_CREDChange(Sender: TObject);
begin
  if (objeto.Modo = moAppend) Or (objeto.Modo = moEdit) and (trim(edCVE_CLAS_CRED.Text) = '') then
    edDESC_CLAS_CRED.Text := '';
end;

end.

