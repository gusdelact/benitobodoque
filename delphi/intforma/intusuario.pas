// Sistema         : Clase de USUARIO
// Fecha de Inicio : 22/04/1998
// Función forma   : Clase de USUARIO
// Desarrollo por  : Alberto Ramirez, Victor Martinez, Julio Ruiloba
// Diseñado por    : Los mismos
// Comentarios     :

Unit IntUsuario;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind, UnSQL2, InterFun, ComCtrls, IntMPers, IntDtPk, IntUnNeg, IntLinkit,
IntEmple;

Type
  TUsuario= class;

  TWUsuario=Class(TForm)
    edCVE_SUCURSAL: TEdit;
    edCVE_USUARIO: TEdit;
    EdDescEntidad: TEdit;
    edID_EMPRESA: TEdit;
    edID_PERSONA: TEdit;
    edNombreEmpresa: TEdit;
    edNombrePersona: TEdit;
    EdPassword: TEdit;
    GrpBxPassword: TGroupBox;
    GrpBxUnidadNegocio: TGroupBox;
    InterForma1: TInterForma;
    InterLinkit1: TInterLinkit;
    InterLinkit2: TInterLinkit;
    InterLinkit3: TInterLinkit;
    lbCVE_USUARIO: TLabel;
    lbID_PERSONA: TLabel;
    lbPASSWORD: TLabel;
    rgCveIdioma: TRadioGroup;
    rgSIT_USUARIO: TRadioGroup;
    sbEntidad: TSpeedButton;
    sbIdPersona: TSpeedButton;
    ChkBoxBPideNvoPass: TCheckBox;
    GrpBoxFechas: TGroupBox;
    lbF_CAMB_PASSWORD: TLabel;
    lbF_VENC_PASSWORD: TLabel;
    edF_VENC_PASSWORD: TEdit;
    dtpF_VENC_PASSWORD: TInterDateTimePicker;
    dtpF_CAMB_PASSWORD: TInterDateTimePicker;
    edF_CAMB_PASSWORD: TEdit;
    Label1: TLabel;
    edF_Pro_Scan: TEdit;
    dtF_Pro_Scan: TInterDateTimePicker;
    GrpBoxCamposAuditoria: TGroupBox;
    Label2: TLabel;
    EdCveUsuarioAlta: TEdit;
    Label3: TLabel;
    EdFHAlta: TEdit;
    Label4: TLabel;
    EdCveUsuarioMod: TEdit;
    Label5: TLabel;
    EdFHModificacion: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbIdPersonaClick(Sender: TObject);
    procedure sbEntidadClick(Sender: TObject);
    procedure InterLinkit1Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit1Ejecuta(Sender: TObject);
    procedure InterLinkit2Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit2Ejecuta(Sender: TObject);
    procedure InterLinkit3Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit3Ejecuta(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure EdPasswordExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
    procedure dtF_Pro_ScanChange(Sender: TObject);
    procedure dtF_Pro_ScanExit(Sender: TObject);
    procedure EdPasswordChange(Sender: TObject);
  private
  public
    Objeto : TUsuario;
    cveError : integer;
    cambioPassword : Boolean;
    procedure EncriptaPassword(pePassword: String);
    procedure ValidaPassword(peCveUsuario, pePassword : String);
    procedure BuscaRFC(peIdPersona: String);
    function NumeroEmpleado(peIdPersona: String): String;
  end;

  TUsuario= class(TInterFrame)
    private
    protected
    public
      CVE_USUARIO      : TInterCampo;
      CVE_IDIOMA       : TInterCampo;
      CVE_SUCURSAL     : TInterCampo;
      F_CAMB_PASSWORD  : TInterCampo;
      F_VENC_PASSWORD  : TInterCampo;
      ID_EMPRESA       : TInterCampo;
      ID_PERSONA       : TInterCampo;
      PASSWORD         : TInterCampo;
      B_CONTRATO       : TInterCampo;
      B_UNID_NEG       : TInterCampo;
      B_USR_USR        : TInterCampo;
      CVE_TIPO_USUARIO : TInterCampo;
      B_EMPRESA        : TInterCampo;
      SIT_USUARIO      : TInterCampo;
      F_PRO_SCAN       : TInterCampo;
      B_PIDE_NVO_PASS  : TInterCampo;
      CVE_USUARIO_ALTA : TInterCampo;
      FH_ALTA          : TInterCampo;
      CVE_USUARIO_MOD  : TInterCampo;
      FH_MODIFICACION  : TInterCampo;
      EMPRESA          : TMPersona;
      EMPLEADO         : TEmpleado;
      Entidad	       : TUnNegocio;
      function    InternalBusca : Boolean; override;
      constructor Create(AOwner : TComponent); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
  end;

implementation

uses IntBitPassword;

{$R *.DFM}

constructor TUsuario.Create( AOwner : TComponent );
begin
  Inherited;
  Cve_Usuario := CreaCampo('CVE_USUARIO',ftString,tsNinguno,tsNinguno,True);
  CVE_USUARIO.Size:=8;
  CVE_USUARIO.Caption:='Clave de Usuario';
  CVE_SUCURSAL :=CreaCampo('CVE_SUCURSAL',ftString,tsNinguno,tsNinguno,True);
  CVE_SUCURSAL.Caption:='Clave de Sucursal';
  F_CAMB_PASSWORD :=CreaCampo('F_CAMB_PASSWORD',ftDate,tsNinguno,tsNinguno,True);
  F_CAMB_PASSWORD.Caption:='Fecha Camb Password';
  F_VENC_PASSWORD :=CreaCampo('F_VENC_PASSWORD',ftDate,tsNinguno,tsNinguno,True);
  F_VENC_PASSWORD.Caption:='Fecha Venc Password';
  ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,True);
  ID_EMPRESA.Caption:='Id Empresa';
  ID_PERSONA :=CreaCampo('ID_PERSONA',ftFloat,tsNinguno,tsNinguno,True);
  ID_PERSONA.Caption:='Id Persona';
  PASSWORD :=CreaCampo('PASSWORD',ftString,tsNinguno,tsNinguno,True);
  PASSWORD.Size:=8;
  PASSWORD.Caption:='Password';
  B_CONTRATO :=CreaCampo('B_CONTRATO',ftString,tsNinguno,tsNinguno,True);
  B_CONTRATO.Size:=1;
  B_CONTRATO.Caption:='Contrato';
  B_UNID_NEG :=CreaCampo('B_UNID_NEG',ftString,tsNinguno,tsNinguno,True);
  B_UNID_NEG.Size:=1;
  B_UNID_NEG.Caption:='Unid Neg';
  B_USR_USR :=CreaCampo('B_USR_USR',ftString,tsNinguno,tsNinguno,True);
  B_USR_USR .Size:=1;
  B_USR_USR.Caption:='Usr Usr';
  B_EMPRESA :=CreaCampo('B_EMPRESA',ftString,tsNinguno,tsNinguno,True);
  B_EMPRESA.Size:=1;
  B_EMPRESA.Caption:='Empresa';
  Cve_Idioma:= CreaCampo('CVE_IDIOMA',ftString,tsNinguno,tsNinguno,True);
  with Cve_Idioma do begin
    Caption:='Clave de Idioma';
    UseCombo := True;
    ComboDatos.Add('ESP');				ComboLista.Add('0');
    ComboDatos.Add('INGL');				ComboLista.Add('1');
  end;

  Sit_Usuario:= CreaCampo('SIT_USUARIO',ftString,tsNinguno,tsNinguno,True);
  with Sit_Usuario do begin
     Size:= 2;
     Caption:= 'Situación Usuario';
     UseCombo := True;
     ComboDatos.Add('AC');				ComboLista.Add('0');
     ComboDatos.Add('IN');				ComboLista.Add('1');
  end;

  CVE_TIPO_USUARIO :=CreaCampo('CVE_TIPO_USUARIO',ftString,tsNinguno,tsNinguno,True);
  with Cve_Tipo_Usuario do begin
    Size := 2;
    Caption:='Clave de Tipo Usuario';
    UseCombo := True;
    ComboDatos.Add('SU'); ComboLista.Add('Super Usuario');
    ComboDatos.Add('SE'); ComboLista.Add('Super Usuario por Empresa');
    ComboDatos.Add('AD'); ComboLista.Add('Administrador');
    ComboDatos.Add('UF'); ComboLista.Add('Grupo Financiero');
    ComboDatos.Add('SC'); ComboLista.Add('Sucursal');
    ComboDatos.Add('EM'); ComboLista.Add('Empresa');
    ComboDatos.Add('UN'); ComboLista.Add('Usuario Normal');
  end;

  F_PRO_SCAN :=CreaCampo('F_PRO_SCAN',ftDate,tsNinguno,tsNinguno,True);
  F_PRO_SCAN.Caption:='Fecha Proximo Scaneo';

  B_PIDE_NVO_PASS := CreaCampo('B_PIDE_NVO_PASS',ftString,tsNinguno,tsNinguno,True);
  B_PIDE_NVO_PASS.Size:=1;
  B_PIDE_NVO_PASS.Caption:='Pide nuevo password';

  CVE_USUARIO_ALTA := CreaCampo('CVE_USUARIO_ALTA',ftString,tsNinguno,tsNinguno,True);
  CVE_USUARIO_ALTA.Size := 8;
  CVE_USUARIO_ALTA.Caption := 'Clave de Usuario que dio de alta el registro';

  FH_ALTA := CreaCampo('FH_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
  FH_ALTA.Caption := 'Fecha y hora de alta';

  CVE_USUARIO_MOD := CreaCampo('CVE_USUARIO_MOD',ftString,tsNinguno,tsNinguno,True);
  CVE_USUARIO_ALTA.Size := 8;
  CVE_USUARIO_ALTA.Caption := 'Clave de Usuario que modifico el registro';

  FH_MODIFICACION := CreaCampo('FH_MODIFICACION',ftDateTime,tsNinguno,tsNinguno,True);
  FH_MODIFICACION.Caption := 'Fecha y hora de modificación';

  Empresa := TMPersona.create(self);
  Empresa.FilterBy := fbTMPersonaEmpresa;
  Empresa.MasterSource := self;
  Empresa.ID_Persona.MasterField := 'ID_EMPRESA';

  Empleado := TEmpleado.create(self);
  Empleado.MasterSource := self;
  Empleado.Id_Persona.MasterField := 'ID_PERSONA';

  Entidad:= TUnNegocio.Create(self);
  Entidad.MasterSource := self;
  Entidad.Id_Entidad.MasterField := 'CVE_SUCURSAL';

  TableName := 'USUARIO';

  FKeyFields.Add('CVE_USUARIO');
  UseQuery := True;
  HelpFile := 'IntUsuario.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TUsuario.Destroy;
begin
  inherited;
end;

function TUsuario.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W : TWUsuario;
begin
  W := TWUsuario.Create(Self);
  try
    W.Objeto:= Self;
    W.InterForma1.InterFrame:= Self;
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

Function TUsuario.InternalBusca:Boolean;
Var
  T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('IUsuario.it','S');
  Try
    if Active then begin
       T.Param(0,CVE_USUARIO.AsString);
    end;
    if T.Execute then
       InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;
end;

(***********************************************FORMA USUARIO********************)
(*                                                                              *)
(*  FORMA DE USUARIO                                                            *)
(*                                                                              *)
(***********************************************FORMA USUARIO********************)

procedure TWUsuario.FormShow(Sender: TObject);
begin
  Objeto.CVE_USUARIO.Control     := edCVE_USUARIO;
  Objeto.CVE_IDIOMA.Control      := rgCveIdioma;
  Objeto.CVE_SUCURSAL.Control    := edCVE_SUCURSAL;
  Objeto.F_CAMB_PASSWORD.Control := edF_CAMB_PASSWORD;
  Objeto.F_VENC_PASSWORD.Control := edF_VENC_PASSWORD;
  Objeto.ID_EMPRESA.Control  := edID_EMPRESA;
  Objeto.ID_PERSONA.Control  := edID_PERSONA;
  Objeto.PASSWORD.Control    := edPASSWORD;
  Objeto.SIT_USUARIO.Control := rgSIT_USUARIO;
  Objeto.F_PRO_SCAN.Control  := edF_PRO_SCAN;

  Objeto.B_PIDE_NVO_PASS.Control  := ChkBoxBPideNvoPass;
  Objeto.CVE_USUARIO_ALTA.Control := EdCveUsuarioAlta;
  Objeto.FH_ALTA.Control          := EdFHAlta;
  Objeto.CVE_USUARIO_MOD.Control  := EdCveUsuarioMod;
  Objeto.FH_MODIFICACION.Control  := EdFHModificacion;

  Objeto.EMPRESA.Nombre.Control          := edNombreEmpresa;
  Objeto.Empleado.Persona.Nombre.Control := edNombrePersona;
  Objeto.Entidad.Desc_Entidad.Control    := EdDescEntidad;

  dtF_Pro_Scan.Date := Objeto.Apli.DameFechaEmpresa;
end;//procedure

procedure TWUsuario.FormDestroy(Sender: TObject);
begin
  Objeto.CVE_USUARIO.Control:=nil;
  Objeto.CVE_IDIOMA.Control:=nil;
  Objeto.CVE_SUCURSAL.Control:=nil;
  Objeto.F_CAMB_PASSWORD.Control:=nil;
  Objeto.F_VENC_PASSWORD.Control:=nil;
  Objeto.ID_EMPRESA.Control:=nil;
  Objeto.ID_PERSONA.Control:=nil;
  Objeto.PASSWORD.Control:=nil;
  Objeto.SIT_USUARIO.Control:=nil;
  Objeto.F_PRO_SCAN.Control:=nil;

  Objeto.B_PIDE_NVO_PASS.Control  := nil;
  Objeto.CVE_USUARIO_ALTA.Control := nil;
  Objeto.FH_ALTA.Control          := nil;
  Objeto.CVE_USUARIO_MOD.Control  := nil;
  Objeto.FH_MODIFICACION.Control  := nil;

  Objeto.EMPRESA.Nombre.Control := nil;
  Objeto.Empleado.Persona.Nombre.Control := nil;
  Objeto.Entidad.Desc_Entidad.Control := nil;
end;//procedure

procedure TWUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;//procdure

procedure TWUsuario.InterForma1DespuesNuevo(Sender: TObject);
begin
  cambioPassword := FALSE;
  cveError := 0;
  Objeto.CVE_IDIOMA.AsString := 'ESP';
  rgCveIdioma.ItemIndex := 0;
  Objeto.SIT_USUARIO.AsString := 'AC';
  rgSIT_USUARIO.ItemIndex := 0;
  Objeto.CVE_USUARIO_ALTA.AsString := Objeto.Apli.Usuario;
  Objeto.CVE_USUARIO_ALTA.DrawControl;
  edID_PERSONA.SetFocus;
end;//procedure

procedure TWUsuario.InterForma1DespuesModificar(Sender: TObject);
begin
  cambioPassword := FALSE;
  cveError := 0;
  Objeto.CVE_USUARIO_MOD.AsString := Objeto.Apli.Usuario;
  Objeto.CVE_USUARIO_MOD.DrawControl;
  edID_PERSONA.SetFocus;
end;//procedure

procedure TWUsuario.InterLinkit1Capture(Sender: TObject;
  var Show: Boolean);
begin
  Show := Not InterForma1.CanEdit;
end;//procedure

procedure TWUsuario.InterLinkit1Ejecuta(Sender: TObject);
begin
  Objeto.FindKey([InterLinkit1.Buffer]);
end;//procedure

procedure TWUsuario.sbIdPersonaClick(Sender: TObject);
begin
  Objeto.Empleado.BuscaWhereString := ' SIT_EMPLEADO = ''AC'' ';
  Objeto.Empleado.Busca;
  if(Objeto.ID_PERSONA.AsString <> '')and(Objeto.ID_PERSONA.AsInteger > 0)then begin
     BuscaRFC(Objeto.ID_PERSONA.AsString);
     Objeto.Entidad.FindKey([Objeto.EMPLEADO.Id_Entidad.AsString]);
     Objeto.EMPRESA.FindKey([Objeto.EMPLEADO.Id_Empresa.AsString]);
  end;//
end;//procedure

procedure TWUsuario.sbEntidadClick(Sender: TObject);
begin
  if(Objeto.EMPLEADO.Id_empresa.AsString <> '')and
    (Objeto.EMPLEADO.Id_Entidad.AsString <> '')then begin
     Objeto.Entidad.BuscaWhereString := ' UN_NEG.ID_ENTIDAD = '+ Objeto.EMPLEADO.Id_Entidad.AsString;
                                     // + ' AND UN_NEG.ID_EMPRESA = '+Objeto.EMPLEADO.Id_empresa.AsString;
     if Objeto.Entidad.Busca then
        Objeto.EMPRESA.FindKey([Objeto.Entidad.Id_Empresa.AsString]);
  end;//if
end;//procedure

procedure TWUsuario.InterLinkit2Capture(Sender: TObject;
  var Show: Boolean);
begin
  Show:= InterForma1.CanEdit;
end;//procedure

procedure TWUsuario.InterLinkit2Ejecuta(Sender: TObject);
begin
  if(Objeto.Empleado.FindKey([InterLinkit2.Buffer]))and
    (Objeto.ID_PERSONA.AsString <> '')and
    (Objeto.ID_PERSONA.AsInteger > 0)then begin
     BuscaRFC(Objeto.ID_PERSONA.AsString);
     Objeto.Entidad.FindKey([Objeto.EMPLEADO.Id_Entidad.AsString]);
     Objeto.EMPRESA.FindKey([Objeto.EMPLEADO.Id_Empresa.AsString]);
  end;//if
end;//procedure

procedure TWUsuario.InterLinkit3Capture(Sender: TObject;
  var Show: Boolean);
begin
  Show:= InterForma1.CanEdit;
end;//procedure

procedure TWUsuario.InterLinkit3Ejecuta(Sender: TObject);
begin
  if Objeto.Entidad.FindKey([InterLinkit3.Buffer]) then
     Objeto.EMPRESA.FindKey([Objeto.Entidad.Id_Empresa.AsString])
end;//procedure

procedure TWUsuario.InterForma1DespuesAceptar(Sender: TObject);
var
  bit : TBitPass;
begin
  if cambioPassword then begin
     bit := TBitPass.Create(Self);
     try
       with bit do begin
         GetParams(Objeto);
         if not FindKey([Objeto.CVE_USUARIO.AsString,Objeto.PASSWORD.AsString]) then begin
            BuscaWhereString := ' A.CVE_USUARIO = ''' + Objeto.CVE_USUARIO.AsString + ''' ';
            ShowAll := TRUE;
            Busca;
         end;//if
         ShowWindow(ftModifica)
       end;
     finally
       bit.Destroy;
     end;
  end
end;

procedure TWUsuario.EdPasswordExit(Sender: TObject);
var
  i,numero,letra : integer;
  paso : char;
begin
  if Objeto.Modo in [moEdit,moAppend] then
     if(Length(EdPassword.Text) = 8)then begin
        Interforma1.BtnAceptar.Enabled := True;
        ValidaPassword(Objeto.CVE_USUARIO.AsString, EdPassword.Text);
     end//if
     else
        Application.MessageBox('La longitud del password es de 8 caracteres. Por favor verifique','Error',MB_ICONERROR);
end;//procedure

procedure TWUsuario.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  if IsNewData then
     Objeto.FH_ALTA.AsDateTime := Objeto.Apli.SysDateTime
  else
     Objeto.FH_MODIFICACION.AsDateTime := Objeto.Apli.SysDateTime;
  if cveError <> 0 then
     Realizado := False
  else
     Realizado := True;
end;//procedure

procedure TWUsuario.dtF_Pro_ScanChange(Sender: TObject);
begin
  edF_Pro_Scan.Text := DateToStr(dtF_Pro_Scan.Date);
end;//procedure

procedure TWUsuario.dtF_Pro_ScanExit(Sender: TObject);
begin
  edF_Pro_Scan.Text := DateToStr(dtF_Pro_Scan.Date);
end;//procedure

procedure TWUsuario.BuscaRFC(peIdPersona: String);
var
  Qry: TQuery;
begin
  Qry := TQuery.Create(nil);
  Qry.DatabaseName := Objeto.DataBaseName;
  Qry.SessionName  := Objeto.SessionName;
  Qry.SQL.Append('SELECT * FROM RFC WHERE ID_PERSONA = '+ peIdPersona);
  Qry.Open;
  if Qry.FindFirst then begin
     Objeto.CVE_USUARIO.AsString := Qry.FieldByName('SIGLAS_RFC').AsString + NumeroEmpleado(peIdPersona);
     Objeto.CVE_USUARIO.DrawControl;
  end;
  Qry.close;
  Qry.Free;
end;//procedure

function TWUsuario.NumeroEmpleado(peIdPersona: String): String;
var
   l_temp : String;
begin
  if(Objeto.EMPLEADO.Num_empleado.AsString = '')or
    (Objeto.ID_PERSONA.AsString = '')then
    Objeto.EMPLEADO.FindKey([peIdPersona]);
  l_temp := Copy(Objeto.EMPLEADO.Num_empleado.AsString,1,1);
  l_temp := l_temp + Copy(Objeto.EMPLEADO.Num_empleado.AsString,3,length(Objeto.EMPLEADO.Num_empleado.AsString)-2);
  result := l_temp;
end;//function

procedure TWUsuario.EncriptaPassword(pePassword: String);
var
 stpPassword : TStoredProc;
begin
  stpPassword := TStoredProc.Create(Self);
  try
    with stpPassword do begin
      DatabaseName := Objeto.DataBaseName;
      SessionName  := Objeto.SessionName;
      StoredProcName := 'PKGSEGURIDAD.ENCRIPTAPASSWORD';
      Params.CreateParam(ftString,'pePassword', ptInput);
      Params.CreateParam(ftString,'psResultado', ptOutput);
      Prepare;
      ParamByName('pePassword').AsString := pePassword;
      ExecProc;
      Objeto.PASSWORD.AsString := ParamByName('psResultado').AsString;
      Objeto.PASSWORD.DrawControl;
      Unprepare;
      Close;
    end;
  finally
    stpPassword.free;
  end;
end;//procedure

procedure TWUsuario.ValidaPassword(peCveUsuario, pePassword : String);
var
 stpPassword : TStoredProc;
begin
  stpPassword := TStoredProc.Create(Self);
  try
    with stpPassword do begin
      DatabaseName := Objeto.DataBaseName;
      SessionName  := Objeto.SessionName;
      StoredProcName := 'PKGSEGURIDAD.VALIDAPASSWORD';
      Params.CreateParam(ftString,'peCveUsuario', ptInput);
      Params.CreateParam(ftString,'pePassword', ptInput);
      Params.CreateParam(ftInteger,'psResultado', ptOutput);
      Params.CreateParam(ftString,'psTxtResultado', ptOutput);
      Prepare;
      ParamByName('peCveUsuario').AsString := peCveUsuario;
      ParamByName('pePassword').AsString := pePassword;
      ExecProc;
      if ParamByName('psResultado').AsInteger  = 0 then begin
         Objeto.PASSWORD.AsString := ParamByName('psTxtResultado').AsString;
         cveError := 0;
      end//if
      else begin
        cveError := ParamByName('psResultado').AsInteger;
        Application.MessageBox(PChar(ParamByName('psTxtResultado').AsString),'Error',MB_ICONERROR);
      end;//else
    end;
  finally
    stpPassword.Unprepare;
    stpPassword.Close;
    stpPassword.free;
  end;
end;//procedure

procedure TWUsuario.EdPasswordChange(Sender: TObject);
begin
  cambioPassword := TRUE;
end;//procdure

end.
