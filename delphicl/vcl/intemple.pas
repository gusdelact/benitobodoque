// Sistema         : Clase de Empleado
// Fecha de Inicio : Diciembre de 1997
// Función forma   : Clase de Empleado
// Desarrollo por  : Alberto Ramirez
// Comentarios     : Modificaciones por Benjamin Hernandez 19/02/1998
//                                      Eleuterio Arellano 14/06/2000
//                                      Fernando Ramirez M 08/03/2004
unit IntEmple;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, Menus, RepEmple, RepEmpl2, IntEmpre, IntUnNeg,
  IntPers, IntPuest, DB, DbTables, DBCtrls, ComCtrls, IntMPers, IntDtPk,
  ExtDlgs, Jpeg, Clipbrd, llo, lli;

Const
  WM_DESPUESSHOW = WM_USER+1;
  cIdCasa = 1;
  cIdBanco = 2;
  cIdAseguradora = 8;
  cIdServiCorp = 7888;

type
  TEmpleado = Class;

  TWEmpleado = class(TForm)
    bbCargaFoto: TBitBtn;
    BdCred: TDatabase;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtnEnviarInfo: TBitBtn;
    BtnGenCred: TButton;
    Catalogo1: TMenuItem;
    Catalogo2: TMenuItem;
    Catalogo3: TMenuItem;
    Catalogo4: TMenuItem;
    Catalogo5: TMenuItem;
    Catalogo6: TMenuItem;
    cbGM: TCheckBox;
    cbMa: TCheckBox;
    cbSV: TCheckBox;
    cbTipoSangre: TComboBox;
    dtFBaja: MacvDatePicker;
    dtFIngreso: MacvDatePicker;
    EdAntiguedad: TEdit;
    edBono: TCheckBox;
    EdCvePuesto: TEdit;
    EdDescEntidad: TEdit;
    EdDescPuesto: TEdit;
    edFAntiguedad: TEdit;
    edFBaja: TEdit;
    edFechaIngreso: TEdit;
    edFingreso: TEdit;
    EdFMatrimonio: TEdit;
    edFVenceContrato: TEdit;
    EdIdempresa: TEdit;
    edIdEmpresaHon: TEdit;
    EdidEntidad: TEdit;
    EdIdPersona: TEdit;
    EdIdPersonaJefe: TEdit;
    EdNombreEmpresa: TEdit;
    edNombreEmpresaHon: TEdit;
    EdNombreJefe: TEdit;
    EdNombrePersona: TEdit;
    EdNumEmpleado: TEdit;
    EdNumIMSS: TMaskEdit;
    edNumMeses: TEdit;
    edTxAvisar: TEdit;
    GroupBox1: TGroupBox;
    Image1: TImage;
    ImagenFotoPersona: TImageWindow;
    InfoCred: TTable;
    InfoCredAPELLIDO_MATERNO: TStringField;
    InfoCredAPELLIDO_PATERNO: TStringField;
    InfoCredDEPARTAMENTO: TStringField;
    InfoCredDOMICILIO1: TStringField;
    InfoCredDOMICILIO2: TStringField;
    InfoCredDOMICILIO3: TStringField;
    InfoCredEMPRESA: TStringField;
    InfoCredF_INGRESO: TStringField;
    InfoCredFOTO: TBlobField;
    InfoCredID_PERSONA: TIntegerField;
    InfoCredIMSS: TStringField;
    InfoCredNOMBRE: TStringField;
    InfoCredNUM_EMPLEADO: TStringField;
    InfoCredRFC: TStringField;
    InfoCredTIENE_FOTO: TBooleanField;
    InfoCredTIPO : TStringField;
    InterForma1 : TInterForma;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbAnt: TLabel;
    lbCalleNumero: TLabel;
    lbIdDomicilio: TLabel;
    lbIngreso: TLabel;
    lbMatr: TLabel;
    lbTxAccidente: TLabel;
    Listado: TMenuItem;
    MacvDatePicker1: MacvDatePicker;
    MacvDatePicker2: MacvDatePicker;
    MacvDatePicker3: MacvDatePicker;
    N1: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    PopupEmpresa: TPopupMenu;
    PopupEmpresaHon: TPopupMenu;
    PopupEntidad: TPopupMenu;
    PopupJefe: TPopupMenu;
    PopupNombre: TPopupMenu;
    PopupPuesto: TPopupMenu;
    PopupReportes: TPopupMenu;
    PorUnidaddeNegocio1: TMenuItem;
    qDepto: TQuery;
    qDepto2: TQuery;
    qDepto2CVE_CENTRO_COSTO: TStringField;
    qDepto2DESC_CORTA: TStringField;
    qDepto2DESC_LARGA: TStringField;
    qDeptocve_centro_costo: TStringField;
    qImagen: TQuery;
    qObtNbr: TQuery;
    qObtNbrAPELLIDO_MATERNO: TStringField;
    qObtNbrAPELLIDO_PATERNO: TStringField;
    qObtNbrNOMBRE_PERSONA: TStringField;
    qObtNbrRFC_EMPLEADO: TStringField;
    qObtNbrUBICACION: TStringField;
    qTodos: TQuery;
    rgBEventual: TRadioGroup;
    rgSitEmpleado: TRadioGroup;
    SaveDialog1: TSaveDialog;
    sbEmpresa: TSpeedButton;
    sbEmpresaHon: TSpeedButton;
    SbEntidad: TSpeedButton;
    SbJefe: TSpeedButton;
    SbNombre: TSpeedButton;
    SbPuesto: TSpeedButton;
    Table1: TTable;
    BtnGenFoto: TButton;
    procedure bbCargaFotoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtnEnviarInfoClick(Sender: TObject);
    procedure BtnGenCredClick(Sender: TObject);
    procedure CambiaFormatoImagen(var ImgConvertir:TImageWindow; Sender: TObject);
    procedure Catalogo1Click(Sender: TObject);
    procedure Catalogo2Click(Sender: TObject);
    procedure Catalogo3Click(Sender: TObject);
    procedure Catalogo4Click(Sender: TObject);
    procedure Catalogo5Click(Sender: TObject);
    procedure Catalogo6Click(Sender: TObject);
    procedure dtFBajaChange(Sender: TObject);
    procedure dtFIngresoChange(Sender: TObject);
    procedure edBonoClick(Sender: TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure FormShow(Sender : TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1CanEdit(Sender: TObject; CanEdit: Boolean);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1Nuevo(Sender: TObject; var Realizado: Boolean);
    procedure PorUnidaddeNegocio1Click(Sender: TObject);
    procedure rgBEventualClick(Sender: TObject);
    procedure sbEmpresaClick(Sender : TObject);
    procedure sbEmpresaHonClick(Sender: TObject);
    procedure SbEntidadClick(Sender: TObject);
    procedure SbJefeClick(Sender: TObject);
    procedure SbNombreClick(Sender: TObject);
    procedure SbPuestoClick(Sender: TObject);
    procedure BtnGenFotoClick(Sender: TObject);
  private
  public
    Emple:   TEmpleado;
    Procedure DespuesShow(Var Msg:TMessage); message WM_DESPUESSHOW;
  end;

(************************************************************TEMPLEADO********)
  TEmpleado = class(TInterFrame)
  private
    FImagen: TImageWindow;
    ImagenCargada: Boolean;
  protected
  public
    Id_Persona     	 :TInterCampo;
    Id_Entidad     	 :TInterCampo;
    Cve_Puesto     	 :TInterCampo;
    F_Matrimonio   	 :TInterCampo;
    Num_empleado   	 :TInterCampo;
    Id_empresa     	 :TInterCampo;
    Id_persona_jefe	 :TInterCampo;
    Num_imss       	 :TInterCampo;
    Sit_empleado   	 :TInterCampo;
    B_Eventual        :TInterCampo;
    Tipo_sangre    	 :TInterCampo;
    Id_Empresa_Hon 	 :TIntercampo;
    Tx_Avisar	 	    :TIntercampo;
    Fecha_Ingreso  	 :TInterCampo;
    F_INGRESO            : TInterCampo;
    Antiguedad     	 :TInterCampo;
    F_VTO_CTO         :TInterCampo;
    F_antiguedad      :TInterCampo;
    F_baja            :TInterCampo;
    B_madre           : TInterCampo;
    B_seguro_vida     : TInterCampo;
    B_gastos_medicos  : TInterCampo;
    B_bono            : TInterCampo;
    Meses_bono        : TInterCampo;
    Cve_usu_alta      : TInterCampo;
    F_alta            : TInterCampo;
    Regimen_mat       : TInterCampo;

//    Foto_Persona   :TInterCampo;

    TablaImagen:TTable;
    Persona    :TMPersona;
    Jefe       :TMPersona;
    Empresa    :TMPersona;
    EmpresaHon :TMPersona;
    Puesto     :TPuesto;
    Entidad    :TUnNegocio;
    function InternalBusca : Boolean; override;
    function InternalLocaliza:Boolean; override;
    Function InternalPost:Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
    function ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    Function Reporte: Boolean; Override;
    Procedure DataBaseChange; override;

    Property Imagen: TImageWindow Read FImagen Write FImagen;
  published
  end;

implementation

{$R *.DFM}

constructor TEmpleado.Create( AOwner : TComponent );
begin
   inherited
   Create(AOwner);
   Id_Persona	:= CreaCampo('ID_PERSONA',ftInteger,tsNinguno,tsNinguno,True);
   Id_Entidad	:= CreaCampo('ID_ENTIDAD',ftInteger,tsNinguno,tsNinguno,True);
   Cve_Puesto	:=CreaCampo('CVE_PUESTO',ftString,tsNinguno,tsNinguno,True);
   F_Matrimonio	:= CreaCampo('F_MATRIMONIO',ftDate,tsNinguno,tsNinguno,True);
   Num_empleado	:= CreaCampo('NUM_EMPLEADO',ftInteger,tsNinguno,tsNinguno,True);
   Id_empresa	:= CreaCampo('ID_EMPRESA',ftInteger,tsNinguno,tsNinguno,True);
   Id_persona_jefe:= CreaCampo('ID_PERSONA_JEFE',ftInteger,tsNinguno,tsNinguno,True);
   Num_imss	:= CreaCampo('NUM_IMSS',ftString,tsNinguno,tsNinguno,True);
   Tipo_sangre	:= CreaCampo('TIPO_SANGRE',ftString,tsNinguno,tsNinguno,True);
   Id_Empresa_Hon := CreaCampo('ID_EMPRESA_HON',ftInteger,tsNinguno,tsNinguno,True);
   TX_AVISAR      :=CreaCampo('TX_AVISAR',ftString,tsNinguno,tsNinguno,True);
   Fecha_Ingreso  := CreaCampo('FECHA_INGRESO',ftDate,tsNinguno,tsNinguno,False);
   Antiguedad	  := CreaCampo('ANTIGUEDAD',ftString,tsNinguno,tsNinguno,False);
   F_VTO_CTO      :=CreaCampo('F_VTO_CTO',ftDate,tsNinguno,tsNinguno,True);
   F_ANTIGUEDAD   :=CreaCampo('F_ANTIGUEDAD',ftDate,tsNinguno,tsNinguno,True);
   F_INGRESO      :=CreaCampo('F_INGRESO', ftDate, tsNinguno,tsNinguno,True);
   F_BAJA         :=CreaCampo('F_BAJA', ftDate, tsNinguno,tsNinguno,True);
   MESES_BONO     :=CreaCampo('MESES_BONO', ftInteger, tsNinguno,tsNinguno,True);
//   Foto_Persona:= CreaCampo('FOTO_PERSONA',ftString,tsNinguno,tsNinguno,True);
   UseQuery := True;
   FActive := False;
   TableName := 'EMPLEADO';
   FKeyFields.Add('ID_PERSONA');
//   FKeyFields.Add('ID_EMPRESA');
   HelpFile := 'IntEmple.hlp';
   ShowMenuReporte := True;

   Sit_empleado:= CreaCampo('SIT_EMPLEADO',ftString,tsNinguno,tsNinguno,True);
   With Sit_empleado do
   begin Size:=2;
       	UseCombo:=True;
       	ComboLista.Add('0');	ComboDatos.Add('AC');
       	ComboLista.Add('1');	ComboDatos.Add('IN');
       	ComboLista.Add('2');	ComboDatos.Add('CA');
        ComboLista.Add('3');	ComboDatos.Add('BA');
   end;

   B_Eventual:= CreaCampo('B_EVENTUAL',ftString,tsNinguno,tsNinguno,True);
   With B_Eventual do begin
     Size:=1;
     UseCombo:=True;
     ComboLista.Add('0');	ComboDatos.Add('P');
     ComboLista.Add('1');	ComboDatos.Add('E');
     ComboLista.Add('2');	ComboDatos.Add('H');
     ComboLista.Add('3');	ComboDatos.Add('C');
     ComboLista.Add('4');	ComboDatos.Add('M');
     ComboLista.Add('5');	ComboDatos.Add('O');
   end;

   B_madre:= CreaCampo('B_MADRE',ftString,tsNinguno,tsNinguno,True);
   B_madre.size := 1;

   B_gastos_medicos := CreaCampo('B_GASTOS_MEDICOS',ftString,tsNinguno,tsNinguno,True);
   B_gastos_medicos.size := 1;

   B_seguro_vida := CreaCampo('B_SEGURO_VIDA',ftString,tsNinguno,tsNinguno,True);
   B_seguro_vida.size := 1;

   B_bono := CreaCampo('B_BONO',ftString,tsNinguno,tsNinguno,True);
   B_bono.size := 1;

   Cve_usu_alta := CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
   Cve_usu_alta.size := 8;
   F_alta :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
   Regimen_mat:= CreaCampo('REGIMEN_MAT',ftString,tsNinguno,tsNinguno,True);
   Regimen_mat.size := 2;

   Persona:=TMPersona.Create(Self);
   Persona.FilterBy:=fbTMPersonaFisica;
   Persona.MasterSource:=Self;
   Persona.FieldByName('ID_PERSONA').MasterField:='ID_PERSONA';

   Empresa:=TMPersona.Create(Self);
   Empresa.FilterBy:=fbTMPersonaEmpresa;
   Empresa.MasterSource:=Self;
   Empresa.FieldByName('ID_PERSONA').MasterField:='ID_EMPRESA';

   Puesto := TPuesto.Create(Self);
   Puesto.MasterSource:=Self;
   Puesto.FieldByName('CVE_PUESTO').MasterField:='CVE_PUESTO';

   Entidad:=TUnNegocio.Create(Self);
   Entidad.MasterSource:=Self;
   Entidad.FieldByName('ID_ENTIDAD').MasterField:='ID_ENTIDAD';

   Jefe := TMPersona.Create(Self);
   Jefe.FilterBy:=fbTMPersonaEmpleado;
   Jefe.MasterSource:=Self;
   Jefe.FieldByName('ID_PERSONA').MasterField:='ID_PERSONA_JEFE';

   EmpresaHon:= TMPersona.Create(Self);
   EmpresaHon.FilterBy:=fbTMPersonaEmpresa;
   EmpresaHon.MasterSource:=Self;
   EmpresaHon.FieldByName('ID_PERSONA').MasterField:='ID_EMPRESA_HON';

   TablaImagen := TTable.Create(self);
   TablaImagen.TableName := 'IMAGEN';
   TablaImagen.Filtered := True;
   FInternalDataSource.DataSet := TablaImagen;
   TablaImagen.Filter := 'ID_PERSONA = -1';
   ImagenCargada := False;
   Imagen:= nil;
end;

destructor TEmpleado.Destroy;
begin
   if TablaImagen <> nil then TablaImagen.Free;
   if Persona<>nil then Persona.Free;
   if Jefe<>nil then Jefe.Free;
   if Empresa<>nil then Empresa.Free;
   if EmpresaHon<>nil then EmpresaHon.Free;
   if Puesto<>nil then Puesto.Free;
   if Entidad<>nil then Entidad.Free;
   inherited;
end;

Procedure TEmpleado.DataBaseChange;
begin
  Inherited;
  TablaImagen.Active := False;
  TablaImagen.DatabaseName := SeguDataBaseName;
  TablaImagen.SessionName := SeguSessionName;
  TablaImagen.Active := True;
end;

function TEmpleado.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWEmpleado;
begin
  W := TWEmpleado.Create(Self);
  try
    W.Emple := Self;
    W.InterForma1.InterFrame:=Self;
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

function TEmpleado.InternalBusca:Boolean;
var
  T:TInterFindit;
  s: string;
begin
   InternalBusca := False;
   T:=CreaBuscador('IntEmple.it','I,S');
   try
      T.WhereString:=BuscaWhereString;
      if T.Execute then begin
         InternalBusca := FindKey([T.DameCampo(0)]);
         InternalBusca := True;
      end;
   finally
     T.Free;
   end;
end;

function TEmpleado.InternalLocaliza:Boolean;
var
  Q : TQuery;
  Str1 : String;
  Fecha : TDateTime;
begin
  Str1 := '';
  Q := GetSQLQuery(
     ' SELECT'+
     '   MAX(F_INICIO_TRABAJO) ULTIMA,'+
     '   MIN(F_INICIO_TRABAJO) ANTIGUEDAD '+
     ' FROM'+
     '   RH_DATO_LABORAL'+
     ' WHERE'+
     '   B_TRANS_GPO = ''V'''+
     '   AND ID_EMPLEADO='+Id_Persona.AsString,
     DataBaseName,SessionName,false);
  Try
    Fecha_Ingreso.asString := Q.FieldByName('ANTIGUEDAD').asString;
    if F_ANTIGUEDAD.AsString <> '' then begin
       Fecha := F_ANTIGUEDAD.AsDateTime;
       Antiguedad.AsString := IntToStr(Trunc(Trunc(Now - Fecha)/365))+' años';
    end
    else
       Antiguedad.AsString := '';
{FILTRO PARA LA FOTO}
    if(Imagen<>nil)then begin
       Imagen.Visible := False;
       TablaImagen.Filter := 'ID_PERSONA = -1';
       TablaImagen.Filter := 'ID_PERSONA = '+Id_Persona.AsString;
       TablaImagen.Filtered := True;
       if (Not TablaImagen.IsEmpty) then
          Imagen.Visible := True
       else
          Imagen.Visible := False;
     end;
     Drawcontrol;
   finally
     if Q<>nil then
        Q.Free;
   end;
   Result := True;
end;

Function TEmpleado.InternalPost:Boolean;
Var
  Q : TTable;
begin
   Result := inherited InternalPost;
   if (Imagen <> nil) and (Result) and (ImagenCargada) then begin
     Q := TTable.Create(Self);
     Try
         Q.DatabaseName := DataBaseName;
         Q.SessionName := SessionName;
         Q.TableName := 'IMAGEN';
         Q.Active := True;

         if Q.Locate('ID_PERSONA',Id_Persona.AsString,[loCaseInsensitive]) then begin
            Q.Edit;
            TBlobField(Q.FieldByName('FOTO_PERSONA')).LoadFromFile(Imagen.ImageName);
            Q.Post;
         end
         else begin
            Q.Insert;
            Q.FieldByName('ID_PERSONA').AsString := Id_Persona.AsString;
            TBlobField(Q.FieldByName('FOTO_PERSONA')).LoadFromFile(Imagen.ImageName);
            Q.Post;
         end;
      Finally
         Q.Free;
      end;
   end;
   ImagenCargada := False;
end;

Function TEmpleado.Reporte: Boolean;
Begin
End;

(***********************************************FORMA DE EMPLEADO ***************)
(*                                                                              *)
(*  FORMA DE EMPLEADO                                                           *)
(*                                                                              *)
(***********************************************FORMA DE EMPLEADO ***************)
Procedure TWEmpleado.DespuesShow(Var Msg:TMessage);
begin
  if Emple.TablaImagen.IsEmpty then
     ImagenFotoPersona.Visible := False;
end;

procedure TWEmpleado.FormShow(Sender: TObject);
begin
  Emple.Id_Persona.Control:= EdIDPERSONA;
  Emple.Id_Entidad.Control:= EdIDENTIDAD;
  Emple.Cve_Puesto.Control:=EdCVEPUESTO;
  Emple.F_Matrimonio.Control:= EdFMATRIMONIO;
  Emple.Num_empleado.Control:= edNumEmpleado;
  Emple.Id_empresa.Control:= EDIDEMPRESA;
  Emple.Id_persona_jefe.Control:= EdIDPERSONAJEFE;
  Emple.Num_imss.Control:= EdNUMIMSS;
  Emple.Sit_empleado.Control:= rgSITEMPLEADO;
  Emple.B_Eventual.Control := rgBEventual;
  Emple.Tipo_sangre.Control:= cbTipoSangre;
  Emple.Id_Empresa_Hon.Control:= edIdEmpresaHon;
  Emple.Fecha_Ingreso.Control:= edFechaIngreso;
  Emple.F_baja.Control    := edFBaja;
  Emple.f_ingreso.control := edFIngreso;
  Emple.Antiguedad.Control:=edAntiguedad;
  Emple.F_VTO_CTO.Control := edFVenceContrato;
  Emple.Tx_Avisar.Control := edTxAvisar;
  Emple.F_antiguedad.Control := edFAntiguedad;
  Emple.B_madre.Control := cbMA;
  Emple.B_gastos_medicos.Control := cbGM;
  Emple.B_seguro_vida.Control := cbSV;
  Emple.B_bono.Control     := edBono;
  Emple.Meses_bono.Control := edNumMeses;

  Emple.Persona.Nombre.Control := edNombrePersona;
  Emple.Persona.MasterSourceEditControl:= sbNombre;
  Emple.jefe.Nombre.Control := edNombreJefe;
  Emple.jefe.MasterSourceEditControl:= sbJefe;
  Emple.Empresa.Nombre.Control := edNombreEmpresa;
  Emple.Empresa.MasterSourceEditControl:= sbEmpresa;
  Emple.EmpresaHon.Nombre.Control := edNombreEmpresaHon;
  Emple.EmpresaHon.MasterSourceEditControl:= sbEmpresaHon;
//   Emple.Puesto.Desc_Puesto.Control := edDescPuesto;
  Emple.Puesto.Nombre_Puesto.Control := edDescPuesto;
  Emple.Puesto.MasterSourceEditControl:= sbPuesto;
  Emple.Entidad.Desc_Entidad.Control := edDescEntidad;
  Emple.Entidad.MasterSourceEditControl:= sbEntidad;

  ImagenFotoPersona.DataSource := Emple.FInternalDataSource;
  ImagenFotoPersona.DataField := 'FOTO_PERSONA';
  Emple.Imagen := ImagenFotoPersona;

  PostMessage(Handle,WM_DESPUESSHOW,0,0);

  Label3.Caption := 'Empresa Honorarios ';
  if rgBEventual.ItemIndex = 5 then
    Label3.Caption := 'Empresa Outsourcing ';
end;

procedure TWEmpleado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWEmpleado.FormDestroy(Sender: TObject);
begin
  Emple.Id_Persona.Control:= nil;
  Emple.Id_Entidad.Control:= nil;
  Emple.Cve_Puesto.Control:=nil;
  Emple.F_Matrimonio.Control:= nil;
  Emple.Num_empleado.Control:= nil;
  Emple.Id_empresa.Control:= nil;
  Emple.Id_persona_jefe.Control:= nil;
  Emple.Num_imss.Control:= nil;
  Emple.Sit_empleado.Control:= nil;
  Emple.B_Eventual.Control := nil;
  Emple.Tipo_sangre.Control:= nil;
  Emple.Id_Empresa_Hon.Control:= nil;
  Emple.Tx_Avisar.Control:= nil;
  Emple.Fecha_Ingreso.Control:= nil;
  Emple.F_baja.Control    := nil;
  Emple.f_ingreso.control := nil;
  Emple.F_antiguedad.Control := nil;
  Emple.Antiguedad.Control := nil;
  Emple.F_VTO_CTO.Control:=nil;
  Emple.B_madre.Control := nil;
  Emple.B_gastos_medicos.Control := nil;
  Emple.B_seguro_vida.Control := nil;
  Emple.B_bono.Control     := nil;
  Emple.Meses_bono.Control := nil;

  Emple.Persona.Nombre.Control := nil;
  Emple.Persona.MasterSourceEditControl:= nil;
  Emple.jefe.Nombre.Control := nil;
  Emple.jefe.MasterSourceEditControl:= nil;
  Emple.Empresa.Nombre.Control := nil;
  Emple.Empresa.MasterSourceEditControl:= nil;
  Emple.EmpresaHon.Nombre.Control := nil;
  Emple.EmpresaHon.MasterSourceEditControl:= nil;
//   Emple.Puesto.Desc_Puesto.Control := nil;
  Emple.Puesto.Nombre_Puesto.Control := nil;
  Emple.Puesto.MasterSourceEditControl:= nil;
  Emple.Entidad.Desc_Entidad.Control := nil;
  Emple.Entidad.MasterSourceEditControl:= nil;
  Emple.Imagen := nil;
end;

procedure TWEmpleado.BitBtn1Click(Sender: TObject);
begin
  If Emple.ValidaAccesoEsp('EMPL_REPORTE',True,True) Then
  Begin
    Emple.Reporte;
  End;
end;

procedure TWEmpleado.InterForma1DespuesNuevo(Sender: TObject);
begin
  ImagenFotoPersona.DataSource.DataSet.Filter := 'ID_PERSONA = -1';
  ImagenFotoPersona.Visible := False;
  Emple.Sit_empleado.AsString:='AC';
  Emple.B_Eventual.AsString := 'P';
  Emple.F_alta.AsDateTime := Emple.Apli.DameFechaEmpresa;
  Emple.Cve_usu_alta.AsString := Emple.Apli.Usuario;
  sbEmpresaHon.Enabled := False;
  edNumEmpleado.SetFocus;
end;

procedure TWEmpleado.InterForma1DespuesModificar(Sender: TObject);
begin
  sbEmpresaHon.Enabled := (rgBEventual.ItemIndex = 2);
  Emple.F_alta.AsDateTime := Emple.Apli.DameFechaEmpresa;
  Emple.Cve_usu_alta.AsString := Emple.Apli.Usuario;
end;

procedure TWEmpleado.Catalogo1Click(Sender: TObject);
Begin Emple.Persona.catalogo;
end;

procedure TWEmpleado.Catalogo2Click(Sender: TObject);
Begin Emple.Empresa.Catalogo;
end;

procedure TWEmpleado.Catalogo3Click(Sender: TObject);
Begin Emple.Puesto.Catalogo;
end;

procedure TWEmpleado.Catalogo4Click(Sender: TObject);
Begin Emple.Jefe.catalogo;
end;

procedure TWEmpleado.Catalogo5Click(Sender: TObject);
Begin Emple.Entidad.Catalogo;
end;

procedure TWEmpleado.Catalogo6Click(Sender: TObject);
Begin Emple.EmpresaHon.Catalogo;
end;

procedure TWEmpleado.sbEmpresaClick(Sender: TObject);
Begin
  If Emple.ValidaAccesoEsp('EMPL_EMPRESA',True,True) Then
  Begin
    Emple.Empresa.Busca;
  End;
end;

procedure TWEmpleado.SbPuestoClick(Sender: TObject);
begin
  If Emple.ValidaAccesoEsp('EMPL_PUESTO',True,True) Then
  Begin
    Emple.Puesto.Busca;
  End;
end;

procedure TWEmpleado.SbJefeClick(Sender: TObject);
begin
  If Emple.ValidaAccesoEsp('EMPL_EMPHON',True,True) Then
  Begin
    Emple.Jefe.Busca;
  End;
end;

procedure TWEmpleado.SbEntidadClick(Sender: TObject);
begin
  If Emple.ValidaAccesoEsp('EMPL_ENTIDAD',True,True) Then
  Begin
    if(Trim(Emple.Id_empresa.AsString) <> '')or(Emple.Id_empresa.AsInteger > 0)then begin
       Emple.Entidad.Busca;
    end//if
    else
       Application.MessageBox('¡Antes debe seleccionar una empresa válida!','Empresa no válida',MB_ICONERROR);
  End;
end;

procedure TWEmpleado.SbNombreClick(Sender: TObject);
begin
  If Emple.ValidaAccesoEsp('EMPL_NOMBRE',True,True) Then
  Begin
    Emple.Persona.Busca;
  End;
end;

procedure TWEmpleado.sbEmpresaHonClick(Sender: TObject);
begin
  If Emple.ValidaAccesoEsp('EMPL_EMPHON',True,True) Then
  Begin
    Emple.Empresahon.Busca;
  End;
end;

procedure TWEmpleado.PorUnidaddeNegocio1Click(Sender: TObject);
begin
  Execute_RepEmpl2(True,Emple);
end;

procedure TWEmpleado.CambiaFormatoImagen(var ImgConvertir:TImageWindow; Sender: TObject);
var
 Bitmap     : TBitmap;
 jp         : TJpegImage;
 ImageRepos : TImage;
begin
   Bitmap     := TBitMap.create;
   ImageRepos := TImage.create(Self);
   ImgConvertir.CopyToClipboard;
   try
     Bitmap.LoadFromClipBoardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);
   finally
     Bitmap.SaveToFile('c:\tmp.bmp');
     Bitmap.free;
   end;
   jp := TJpegImage.Create;
   try
     with jp do
     begin
       ImageRepos.Picture.LoadFromFile('c:\tmp.bmp');
       Assign(ImageRepos.Picture.Bitmap);
       SaveToFile('c:\tmp.jpg');
     end;
   finally
     jp.Free;
     ImageRepos.Free;
     DeleteFile('c:\tmp.bmp');
   end;
   ImgConvertir.ImageName :='c:\tmp.jpg';
end;

procedure TWEmpleado.bbCargaFotoClick(Sender: TObject);
begin
  If Emple.ValidaAccesoEsp('EMPL_CARGFOT',True,True) Then
  Begin
     if OpenPictureDialog1.Execute then begin
        ImagenFotoPersona.ImageName := OpenPictureDialog1.FileName;
        CambiaFormatoImagen(ImagenFotoPersona, Sender);
        Emple.ImagenCargada:= True;
        ImagenFotoPersona.Visible := True;
     end;
  End;
end;

procedure TWEmpleado.rgBEventualClick(Sender: TObject);
var
  bhonorarios : boolean;
begin
  bhonorarios := (rgBEventual.ItemIndex = 2);
  if (Emple.Modo=moAppend) or (Emple.Modo=moEdit) then begin
     sbEmpresaHon.Enabled := bhonorarios;
     if Not bhonorarios then begin
        Emple.Id_Empresa_Hon.AsString := '';
        Emple.EmpresaHon.Active := False;
     end;

     if (rgBEventual.ItemIndex = 0) then begin
           edFVenceContrato.Clear;
           edFVenceContrato.Enabled := False;
           MacvDatePicker3.Enabled := False;
        end
     else begin
               edFVenceContrato.Enabled := True;
           MacvDatePicker3.Enabled := True;
        end;
  end
  else
       sbEmpresaHon.Enabled := False;
  Label3.Caption := 'Empresa Honorarios ';
  if rgBEventual.ItemIndex = 5 then
     Label3.Caption := 'Empresa Outsourcing ';
end;

procedure TWEmpleado.InterForma1Buscar(Sender: TObject);
begin
  Emple.Busca;
end;

procedure TWEmpleado.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  Realizado := False;
  if(rgBEventual.ItemIndex = 1) then begin
     if edFVenceContrato.Text = '' then begin
        Application.MessageBox('La fecha de vencimiento no puede ser nula por ser un contrato eventual','Error',MB_ICONERROR);
        InterForma1.ShowError := False;
     end
     else
       	Realizado := True;
     end
  else
     Realizado := True;
end;

procedure TWEmpleado.InterForma1CanEdit(Sender: TObject; CanEdit: Boolean);
begin
  if(CanEdit) and (Emple.Active) then
     if(Emple.persona.persona <> nil) then begin
        if(rgBEventual.ItemIndex = 0) then begin
           edFVenceContrato.Clear;
           edFVenceContrato.Enabled := False;
           MacvDatePicker3.Enabled := False;
        end
        else begin
           edFVenceContrato.Enabled := True;
           MacvDatePicker3.Enabled := True;
        end;
        Emple.persona.persona.FindKey([Emple.Id_Persona.AsString]);
        if(Emple.Persona.Persona.FieldByName('CVE_ESTADO_CIVIL').asString = 'S') then begin
           EdFMatrimonio.Clear;
           EdFMatrimonio.Enabled := False;
           MacvDatePicker1.Enabled := False;
        end
        else begin
           EdFMatrimonio.Enabled := True;
           MacvDatePicker1.Enabled := True;
        end;
     end;
end;

procedure TWEmpleado.dtFIngresoChange(Sender: TObject);
begin
  edFIngreso.text := DateToStr(dtFIngreso.Date);
end;

procedure TWEmpleado.dtFBajaChange(Sender: TObject);
begin
  edFBaja.Text := DateToStr(dtFBaja.date);
end;

procedure TWEmpleado.InterForma1Nuevo(Sender: TObject;
  var Realizado: Boolean);
begin
  Emple.Append;
  Emple.ImagenCargada := False;
end;

procedure TWEmpleado.edBonoClick(Sender: TObject);
begin
  edNumMeses.Visible := True;
  Label12.Visible := True;
  if not (edBono.Checked) then begin
    edNumMeses.Visible := False;
    Label12.Visible := False;
  end;
end;

procedure TWEmpleado.BitBtnEnviarInfoClick(Sender: TObject);
var
   Bitmap : TBitmap;
   Archivo : String;
begin
  If Emple.ValidaAccesoEsp('EMPL_ENVIAINFO',True,True) Then
  Begin
    SaveDialog1.InitialDir := 'I:\';
    SaveDialog1.FileName := Emple.Id_Persona.AsString + '.bmp';
    if(SaveDialog1.Execute) then begin
       Try
         Archivo := SaveDialog1.FileName;
         BdCred.Connected := True;
         InfoCred.Active := True;
         // Verifica que exista la foto, sino no crea el archivo
         if InfoCred.FindKey([Emple.Num_empleado.AsString,Emple.Id_Persona.AsInteger]) then
            InfoCred.Edit
         else
            InfoCred.Append;
         qImagen.Active := False;
         qImagen.DatabaseName := Emple.Apli.DataBaseName;
         qImagen.SessionName  := Emple.Apli.SessionName;
         qImagen.ParamByName('PIDPERSONA').AsFloat := Emple.Id_Persona.AsFloat;
         qImagen.Active := True;
         if qImagen.FindFirst then begin
            InfoCred.FieldByName('TIENE_FOTO').AsBoolean := True;
            ImagenFotoPersona.ImageInWindow.SaveAs(Archivo,LLI_DISK_BMP,0)
         end
         else
           InfoCred.FieldByName('TIENE_FOTO').AsBoolean := False;

         qObtNbr.Active := False;
         qObtNbr.DatabaseName := Emple.Apli.DataBaseName;
         qObtNbr.SessionName  := Emple.Apli.SessionName;
         qObtNbr.ParamByName('PIDPERSONA').AsFloat := Emple.Id_persona.AsFloat;
         qObtNbr.Active := True;

         InfoCred.FieldByName('ID_PERSONA').AsString := Emple.Id_Persona.AsString;
         InfoCred.FieldByName('NOMBRE').AsString     := qObtNbr.FieldByName('NOMBRE_PERSONA').AsString;
         InfoCred.FieldByName('APELLIDO_PATERNO').AsString := qObtNbr.FieldByName('APELLIDO_PATERNO').AsString;
         InfoCred.FieldByName('APELLIDO_MATERNO').AsString := qObtNbr.FieldByName('APELLIDO_MATERNO').AsString;
         InfoCred.FieldByName('NUM_EMPLEADO').AsString := Emple.Num_empleado.AsString;

         if Trim(qObtNbr.FieldByName('RFC_EMPLEADO').AsString) <> '' then
            InfoCred.FieldByName('RFC').AsString  := qObtNbr.FieldByName('RFC_EMPLEADO').AsString;
         if Trim(Emple.Num_imss.AsString) <> '' then
            InfoCred.FieldByName('IMSS').AsString := Emple.Num_imss.AsString;
         if Emple.Fecha_Ingreso.AsString <> '' then
            InfoCred.FieldByName('F_INGRESO').AsString := Emple.Fecha_Ingreso.AsString;
         if Emple.B_Eventual.AsString = 'O' then
            InfoCred.FieldByName('TIPO').AsString := 'OUTSOURCING';
         if Emple.B_Eventual.AsString = 'P' then
            InfoCred.FieldByName('TIPO').AsString := 'PLANTA';
         if Emple.B_Eventual.AsString = 'E' then
            InfoCred.FieldByName('TIPO').AsString := 'EVENTUAL';
         if Emple.B_Eventual.AsString = 'H' then
            InfoCred.FieldByName('TIPO').AsString := 'HONORARIOS';

         if Emple.Id_empresa.AsFloat = cIdCasa then begin
            InfoCred.FieldByName('EMPRESA').AsString := 'CASA DE BOLSA';
            if Pos('PUEBLA', uppercase(qObtNbr.FieldByName('UBICACION').AsString)) > 0 then begin
              InfoCred.FieldByName('DOMICILIO1').AsString   := 'AV. JUAREZ No. 2310';
              InfoCred.FieldByName('DOMICILIO2').AsString   := 'COL. LA PAZ';
              InfoCred.FieldByName('DOMICILIO3').AsString   := 'C.P. 72160 PUEBLA, PUE.'
            end
            else
            if Pos('MONTERREY', uppercase(qObtNbr.FieldByName('UBICACION').AsString)) > 0 then begin
              InfoCred.FieldByName('DOMICILIO1').AsString    := 'VASCONCELOS No. 630 OTE.';
              InfoCred.FieldByName('DOMICILIO2').AsString    := 'COL. VALLE DEL CAMPESTRE';
              InfoCred.FieldByName('DOMICILIO3').AsString    := 'C.P. 66250 GARZA GARCIA, N.L.'
            end
            else begin
              InfoCred.FieldByName('DOMICILIO1').AsString    := 'AV. PASEO DE LA REFORMA No. 383';
              InfoCred.FieldByName('DOMICILIO2').AsString    := 'COL. CUAUHTEMOC';
              InfoCred.FieldByName('DOMICILIO3').AsString    := '06500 MEXICO, D.F.'
            end
         end
         else
         if Emple.Id_empresa.AsFloat = cIdBanco then begin
            InfoCred.FieldByName('EMPRESA').AsString       := 'BANCO';
            if Pos('GUADALAJARA', uppercase(qObtNbr.FieldByName('UBICACION').AsString)) > 0 then begin
              InfoCred.FieldByName('DOMICILIO1').AsString    := 'AV. CIRCUNVALACION AGUSTIN YAÑEZ No. 2895';
              InfoCred.FieldByName('DOMICILIO2').AsString    := 'COL. ARCOS VALLARTA SUR';
              InfoCred.FieldByName('DOMICILIO3').AsString    := 'C.P. 44130 GUADALAJARA, JAL.'
            end
            else
            if Pos('TOLUCA', uppercase(qObtNbr.FieldByName('UBICACION').AsString)) > 0 then begin
              InfoCred.FieldByName('DOMICILIO1').AsString    := 'AV. PASEO COLON No. 123';
              InfoCred.FieldByName('DOMICILIO2').AsString    := 'COL. FRANCISCO MURGUIA';
              InfoCred.FieldByName('DOMICILIO3').AsString    := 'C.P. 50130 TOLUCA, EDO. DE MEXICO'
            end
            else begin
              InfoCred.FieldByName('DOMICILIO1').AsString    := 'AV. PASEO DE LA REFORMA No. 383';
              InfoCred.FieldByName('DOMICILIO2').AsString    := 'COL. CUAUHTEMOC';
              InfoCred.FieldByName('DOMICILIO3').AsString    := '06500 MEXICO, D.F.'
            end
         end
         else
         if(Emple.Id_empresa.AsFloat = cIdServiCorp)or(Emple.Id_empresa.AsFloat = cIdAseguradora)then begin
            if Emple.Id_empresa.AsFloat = cIdServiCorp then
               InfoCred.FieldByName('EMPRESA').AsString      := 'SERVICIOS CORPORATIVOS'
            else
               InfoCred.FieldByName('EMPRESA').AsString      := 'ASEGURADORA INTERACCIONES';
           InfoCred.FieldByName('F_INGRESO').AsString := Emple.F_antiguedad.AsString;
           if Pos('GUADALAJARA', uppercase(qObtNbr.FieldByName('UBICACION').AsString)) > 0 then begin
              InfoCred.FieldByName('DOMICILIO1').AsString    := 'AV. CIRCUNVALACION AGUSTIN YAÑEZ No. 2895';
              InfoCred.FieldByName('DOMICILIO2').AsString    := 'COL. ARCOS VALLARTA SUR';
              InfoCred.FieldByName('DOMICILIO3').AsString    := 'C.P. 44130 GUADALAJARA, JAL.'
            end
            else
            if Pos('PUEBLA', uppercase(qObtNbr.FieldByName('UBICACION').AsString)) > 0 then begin
              InfoCred.FieldByName('DOMICILIO1').AsString    := 'AV. 25 PONIENTE No. 3517';
              InfoCred.FieldByName('DOMICILIO2').AsString    := 'COL. BELIZARIO DOMINGUEZ';
              InfoCred.FieldByName('DOMICILIO3').AsString    := 'C.P. 72440 PUEBLA, PUE.'
            end
            else
            if Pos('MONTERREY', uppercase(qObtNbr.FieldByName('UBICACION').AsString)) > 0 then begin
              InfoCred.FieldByName('DOMICILIO1').AsString    := 'VASCONCELOS No. 630 OTE.';
              InfoCred.FieldByName('DOMICILIO2').AsString    := 'COL. VALLE DEL CAMPESTRE';
              InfoCred.FieldByName('DOMICILIO3').AsString    := 'C.P. 66250 GARZA GARCIA, N.L.'
            end
            else begin
              InfoCred.FieldByName('DOMICILIO1').AsString    := 'AV. PASEO DE LA REFORMA No. 383';
              InfoCred.FieldByName('DOMICILIO2').AsString    := 'COL. CUAUHTEMOC';
              InfoCred.FieldByName('DOMICILIO3').AsString    := '06500 MEXICO, D.F.'
            end
         end;
         Try
           qDepto.Active := False;
           qDepto.ParamByName('PCUAL').AsFloat := Emple.Num_empleado.AsFloat;
           qDepto.Active := True;

           qDepto2.Active := False;
           qDepto2.ParamByName('PCVECENTRO').AsString := qDepto.FieldByName('CVE_CENTRO_COSTO').AsString;
           qDepto2.Active := True;

           if qDepto.Eof then
              InfoCred.FieldByName('DEPARTAMENTO').AsString := 'DEPTO. DESCONOCIDO'
           else begin
              if qDepto2.FieldByName('DESC_CORTA').AsString = '' then
                InfoCred.FieldByName('DEPARTAMENTO').AsString := ' '
              else
                InfoCred.FieldByName('DEPARTAMENTO').AsString := qDepto2.FieldByName('DESC_CORTA').AsString
           end;
         Except
           InfoCred.FieldByName('DEPARTAMENTO').AsString := ' ';
         end;
         InfoCred.Post;
      Finally
        BdCred.Connected := False;
      End;
    end;
  End;
end;

procedure TWEmpleado.BtnGenCredClick(Sender: TObject);
var
   Bitmap : TBitmap;
   Archivo : String;
begin
  If Emple.ValidaAccesoEsp('EMPL_GENCRED',True,True) Then
  Begin
    Screen.Cursor := crHourGlass;
    qTodos.Active := False;
    qTodos.DatabaseName := Emple.Apli.DataBaseName;
    qTodos.SessionName  := Emple.Apli.SessionName;

    qTodos.SQL.Clear;
    qTodos.SQL.Append('SELECT NVL(e.num_empleado,0) NUM_EMPLEADO, p.nombre_persona, p.apellido_materno, p.apellido_paterno, ');
    qTodos.SQL.Append('       e.id_persona, e.id_empresa, NVL(LTRIM(e.num_imss),0) NUM_IMSS , e.F_ANTIGUEDAD, e.F_INGRESO, ');
    qTodos.SQL.Append('       r.siglas_rfc || r.f_rfc || r.homoclave_rfc RFC_EMPLEADO, d.ubicacion, ');
    qTodos.SQL.Append('       DECODE(e.b_eventual,''H'',''HONORARIOS'',''P'',''PLANTA'',''O'',''OUTSOURCING'',''E'',''EVENTUAL'',''C'',''COMISIONISTA'') TIPO ');
    qTodos.SQL.Append('FROM   empleado e, persona_fisica p, rfc r, direc_empleado d ');
    qTodos.SQL.Append('WHERE  e.id_empresa   = '+ Emple.FrameParam.FieldByName('ID_EMPRESA').AsString +' AND ');
    qTodos.SQL.Append('       e.sit_empleado = ''AC''     AND ');
    qTodos.SQL.Append('       p.id_persona = e.id_persona AND ');
    qTodos.SQL.Append('       r.id_persona = p.id_persona AND ');
    qTodos.SQL.Append('       d.id_empleado (+)= e.id_persona ');
    qTodos.SQL.Append('ORDER BY e.num_empleado, e.id_persona');

    qTodos.Active := True;
    if qTodos.FindFirst then begin
       BdCred.Connected := True;
       repeat
         InfoCred.Active := True;
         if not InfoCred.FindKey([qTodos.FieldByName('NUM_EMPLEADO').AsString,qTodos.FieldByName('ID_PERSONA').AsInteger]) then begin
            InfoCred.Append;
            Archivo := 'C:\Temp\RH\Cred\' + qTodos.FieldByName('ID_PERSONA').AsString + '.bmp';
            if not FileExists(Archivo) then begin
               //Verifica que exista la foto, sino no crea el archivo
               qImagen.Active := False;
               qImagen.DatabaseName := Emple.Apli.DataBaseName;
               qImagen.SessionName  := Emple.Apli.SessionName;
               qImagen.ParamByName('PIDPERSONA').AsFloat := qTodos.FieldByName('ID_PERSONA').AsFloat;
               qImagen.Active := True;
               if qImagen.FindFirst then begin
                  if Emple.FindKey([qTodos.FieldByName('ID_PERSONA').AsString]) then begin
                     ImagenFotoPersona.ImageInWindow.SaveAs(Archivo,LLI_DISK_BMP,0);
                     InfoCred.FieldByName('TIENE_FOTO').AsBoolean := True;//}
                  end//if
                  else
                     InfoCred.FieldByName('TIENE_FOTO').AsBoolean := False;//}
               end//if
               else
                  InfoCred.FieldByName('TIENE_FOTO').AsBoolean := False;//}
            end//if
            else
               InfoCred.FieldByName('TIENE_FOTO').AsBoolean := True;

            InfoCred.FieldByName('ID_PERSONA').AsString := qTodos.FieldByName('ID_PERSONA').AsString;
            InfoCred.FieldByName('NOMBRE').AsString     := qTodos.FieldByName('NOMBRE_PERSONA').AsString;
            InfoCred.FieldByName('APELLIDO_PATERNO').AsString := qTodos.FieldByName('APELLIDO_PATERNO').AsString;
            InfoCred.FieldByName('APELLIDO_MATERNO').AsString := qTodos.FieldByName('APELLIDO_MATERNO').AsString;
            InfoCred.FieldByName('NUM_EMPLEADO').AsString := qTodos.FieldByName('NUM_EMPLEADO').AsString;
            InfoCred.FieldByName('RFC').AsString          := qTodos.FieldByName('RFC_EMPLEADO').AsString;
            InfoCred.FieldByName('IMSS').AsString         := qTodos.FieldByName('NUM_IMSS').AsString;
            try
              if(not qTodos.FieldByName('TIPO').IsNull)and(Trim(qTodos.FieldByName('TIPO').AsString) <> '')then
                 InfoCred.FieldByName('TIPO').AsString := qTodos.FieldByName('TIPO').AsString
              else
                 InfoCred.FieldByName('TIPO').AsString := ' ';
            except
              InfoCred.FieldByName('TIPO').AsString := ' ';
            end;//
            if qTodos.FieldByName('ID_EMPRESA').AsFloat = cIdCasa then begin
               InfoCred.FieldByName('EMPRESA').AsString      := 'CASA DE BOLSA';
               if qTodos.FieldByName('F_INGRESO').AsString = '' then
                  InfoCred.FieldByName('F_INGRESO').AsString := '0'
               else
                  InfoCred.FieldByName('F_INGRESO').AsString := qTodos.FieldByName('F_INGRESO').AsString;
               if Pos('PUEBLA', uppercase(qTodos.FieldByName('UBICACION').AsString)) > 0 then begin
                 InfoCred.FieldByName('DOMICILIO1').AsString := 'AV. JUAREZ No. 2310';
                 InfoCred.FieldByName('DOMICILIO2').AsString := 'COL. LA PAZ';
                 InfoCred.FieldByName('DOMICILIO3').AsString := 'C.P. 72160 PUEBLA, PUE.'
               end
               else if Pos('MONTERREY', uppercase(qTodos.FieldByName('UBICACION').AsString)) > 0 then begin
                 InfoCred.FieldByName('DOMICILIO1').AsString := 'VASCONCELOS No. 630 OTE.';
                 InfoCred.FieldByName('DOMICILIO2').AsString := 'COL. VALLE DEL CAMPESTRE';
                 InfoCred.FieldByName('DOMICILIO3').AsString := 'C.P. 66250 GARZA GARCIA, N.L.'
               end
               else begin
                 InfoCred.FieldByName('DOMICILIO1').AsString := 'AV. PASEO DE LA REFORMA No. 383';
                 InfoCred.FieldByName('DOMICILIO2').AsString := 'COL. CUAUHTEMOC';
                 InfoCred.FieldByName('DOMICILIO3').AsString := '06500 MEXICO, D.F.'
               end
            end;

            if qTodos.FieldByName('ID_EMPRESA').AsFloat = cIdBanco then begin
               if qTodos.FieldByName('F_INGRESO').AsString = '' then
                  InfoCred.FieldByName('F_INGRESO').AsString := '0'
               else
                  InfoCred.FieldByName('F_INGRESO').AsString := qTodos.FieldByName('F_INGRESO').AsString;
               InfoCred.FieldByName('EMPRESA').AsString      := 'BANCO';
               if Pos('GUADALAJARA', uppercase(qTodos.FieldByName('UBICACION').AsString)) > 0 then begin
                 InfoCred.FieldByName('DOMICILIO1').AsString := 'AV. CIRCUNVALACION AGUSTIN YAÑEZ No. 2895';
                 InfoCred.FieldByName('DOMICILIO2').AsString := 'COL. ARCOS VALLARTA SUR';
                 InfoCred.FieldByName('DOMICILIO3').AsString := 'C.P. 44130 GUADALAJARA, JAL.'
               end
               else
               if Pos('TOLUCA', uppercase(qTodos.FieldByName('UBICACION').AsString)) > 0 then begin
                 InfoCred.FieldByName('DOMICILIO1').AsString := 'AV. PASEO COLON No. 123';
                 InfoCred.FieldByName('DOMICILIO2').AsString := 'COL. FRANCISCO MURGUIA';
                 InfoCred.FieldByName('DOMICILIO3').AsString := 'C.P. 50130 TOLUCA, EDO. DE MEXICO'
               end
               else begin
                 InfoCred.FieldByName('DOMICILIO1').AsString := 'AV. PASEO DE LA REFORMA No. 383';
                 InfoCred.FieldByName('DOMICILIO2').AsString := 'COL. CUAUHTEMOC';
                 InfoCred.FieldByName('DOMICILIO3').AsString := '06500 MEXICO, D.F.'
               end
            end;
            if(qTodos.FieldByName('ID_EMPRESA').AsFloat = cIdServiCorp)or
              (qTodos.FieldByName('ID_EMPRESA').AsFloat = cIdAseguradora) then begin

               if qTodos.FieldByName('ID_EMPRESA').AsFloat = cIdServiCorp then
                  InfoCred.FieldByName('EMPRESA').AsString   := 'SERVICIOS CORPORATIVOS'
               else
                  InfoCred.FieldByName('EMPRESA').AsString   := 'ASEGURADORA INTERACCIONES';

               if qTodos.FieldByName('F_ANTIGUEDAD').AsString = '' then
                  InfoCred.FieldByName('F_INGRESO').AsString := '0'
               else
                  InfoCred.FieldByName('F_INGRESO').AsString := qTodos.FieldByName('F_ANTIGUEDAD').AsString;

               if Pos('GUADALAJARA', uppercase(qTodos.FieldByName('UBICACION').AsString)) > 0 then begin
                 InfoCred.FieldByName('DOMICILIO1').AsString := 'AV. CIRCUNVALACION AGUSTIN YAÑEZ No. 2895';
                 InfoCred.FieldByName('DOMICILIO2').AsString := 'COL. ARCOS VALLARTA SUR';
                 InfoCred.FieldByName('DOMICILIO3').AsString := 'C.P. 44130 GUADALAJARA, JAL.'
               end
               else if Pos('PUEBLA', uppercase(qTodos.FieldByName('UBICACION').AsString)) > 0 then begin
                 InfoCred.FieldByName('DOMICILIO1').AsString := 'AV. 25 PONIENTE No. 3517';
                 InfoCred.FieldByName('DOMICILIO2').AsString := 'COL. BELIZARIO DOMINGUEZ';
                 InfoCred.FieldByName('DOMICILIO3').AsString := 'C.P. 72440 PUEBLA, PUE.'
               end
               else if Pos('MONTERREY', uppercase(qTodos.FieldByName('UBICACION').AsString)) > 0 then begin
                 InfoCred.FieldByName('DOMICILIO1').AsString := 'VASCONCELOS No. 630 OTE.';
                 InfoCred.FieldByName('DOMICILIO2').AsString := 'COL. VALLE DEL CAMPESTRE';
                 InfoCred.FieldByName('DOMICILIO3').AsString := 'C.P. 66250 GARZA GARCIA, N.L.'
               end
               else begin
                 InfoCred.FieldByName('DOMICILIO1').AsString := 'AV. PASEO DE LA REFORMA No. 383';
                 InfoCred.FieldByName('DOMICILIO2').AsString := 'COL. CUAUHTEMOC';
                 InfoCred.FieldByName('DOMICILIO3').AsString := '06500 MEXICO, D.F.'
               end
            end;

            Try
              qDepto.Active := False;
              qDepto.ParamByName('PCUAL').AsFloat := qTodos.FieldByName('NUM_EMPLEADO').AsFloat;
              qDepto.Active := True;

              if not qDepto.FindFirst then
                 InfoCred.FieldByName('DEPARTAMENTO').AsString := 'DEPTO. DESCONOCIDO'
              else begin
                 qDepto2.Active := False;
                 qDepto2.ParamByName('PCVECENTRO').AsString := qDepto.FieldByName('CVE_CENTRO_COSTO').AsString;
                 qDepto2.Active := True;
                 if qDepto2.FieldByName('DESC_CORTA').AsString = '' then
                    InfoCred.FieldByName('DEPARTAMENTO').AsString := ' '
                 else
                    InfoCred.FieldByName('DEPARTAMENTO').AsString := qDepto2.FieldByName('DESC_CORTA').AsString
              end;
            Except
              InfoCred.FieldByName('DEPARTAMENTO').AsString := ' ';
            end;
            InfoCred.Post;
         end;
       until not qTodos.FindNext;
       BdCred.Connected := False;
    end;
    qTodos.Close;
    Screen.Cursor := crDefault;
  End;
end;

procedure TWEmpleado.BtnGenFotoClick(Sender: TObject);
var
   Bitmap  : TBitmap;
   Archivo : String;
begin
  If Emple.ValidaAccesoEsp('EMPL_GENFOT',True,True) Then
  Begin
    Screen.Cursor := crHourGlass;
    qTodos.Active := False;
    qTodos.DatabaseName := Emple.Apli.DataBaseName;
    qTodos.SessionName  := Emple.Apli.SessionName;
    qTodos.SQL.Clear;
    qTodos.SQL.Append('SELECT NVL(e.num_empleado,0) NUM_EMPLEADO, p.nombre_persona, p.apellido_materno, p.apellido_paterno, ');
    qTodos.SQL.Append('       e.id_persona, e.id_empresa, NVL(LTRIM(e.num_imss),0) NUM_IMSS , e.F_ANTIGUEDAD, ');
    qTodos.SQL.Append('       r.siglas_rfc || r.f_rfc || r.homoclave_rfc RFC_EMPLEADO, d.ubicacion, ');
    qTodos.SQL.Append('       DECODE(e.b_eventual,''H'',''HONORARIOS'',''P'',''PLANTA'',''O'',''OUTSOURCING'',''E'',''EVENTUAL'',''C'',''COMISIONISTA'') TIPO ');
    qTodos.SQL.Append('FROM   empleado e, persona_fisica p, rfc r, direc_empleado d, imagen i ');
    qTodos.SQL.Append('WHERE  e.id_empresa   = '+ Emple.FrameParam.FieldByName('ID_EMPRESA').AsString +' AND ');
    qTodos.SQL.Append('       e.sit_empleado = ''AC''     AND ');
    qTodos.SQL.Append('       p.id_persona = e.id_persona AND ');
    qTodos.SQL.Append('       r.id_persona = p.id_persona AND ');
    qTodos.SQL.Append('       i.id_persona = p.id_persona AND ');
    qTodos.SQL.Append('       d.id_empleado (+)= e.id_persona ');
    qTodos.SQL.Append('ORDER BY e.num_empleado, e.id_persona');
    qTodos.Active := True;
    if qTodos.FindFirst then begin
       repeat
         Archivo := 'I:\' + qTodos.FieldByName('ID_PERSONA').AsString + '.bmp';
         if not FileExists(Archivo) then begin
            Emple.FindKey([qTodos.FieldByName('ID_PERSONA').AsString]);
            ImagenFotoPersona.ImageInWindow.SaveAs(Archivo,LLI_DISK_BMP,0);
         end;//if
       until not qTodos.FindNext;
    end;
    qTodos.Close;
    Screen.Cursor := crDefault;
  End;
end;

end.

