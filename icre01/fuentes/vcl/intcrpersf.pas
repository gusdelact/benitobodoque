// Sistema         : Clase de CR_AM_BITACORA
// Fecha de Inicio : 17/03/2010
// Función forma   : Clase de CR_AM_BITACORA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntCrPersF;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,     IntParamCre,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntCrCredito, IntLinkit, InterEdit, IntSGCtrl,
IntCrAcredit,  //Acreditado
IntPers,       //PERSONA
IntCrSen,      //Senicreb, clave SITI
IntDom         //Domicilio
;

Type
 TCrPersF= class;

  TWCrPersF=Class(TForm)
    InterForma1             : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Panel1: TPanel;
    Label11: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label5: TLabel;
    Label27: TLabel;
    btID_PERSONA: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    edCVE_SENICREB: TEdit;
    edRFC: TEdit;
    Edit20: TEdit;
    edDESC_SENICREB: TEdit;
    edID_PERSONA: TEdit;
    Label6: TLabel;
    edID_PERS_FIRA: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edNDomincilio: TEdit;
    btAnt: TButton;
    btSig: TButton;
    Label2: TLabel;
    edCALLE: TEdit;
    Label26: TLabel;
    Label3: TLabel;
    edPOBLACION: TEdit;
    edNum_Exterior: TEdit;
    Label7: TLabel;
    edNUM_INTERIOR: TEdit;
    Label8: TLabel;
    edCOLONIA: TEdit;
    edCIUDAD: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    edCODIGOPOSTAL: TEdit;
    Label12: TLabel;
    edESTADO: TEdit;
    Label13: TLabel;
    edTelefono: TEdit;
    Panel2: TPanel;
    edB_EXP_DIA: TCheckBox;
    Label4: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edFRECUENCIA: TComboBox;
    ilID_PERSONA: TInterLinkit;
    MsgPanel: TPanel;
    edF_ULT_REV: TEdit;
    dptF_ULT_REV: TInterDateTimePicker;
    edF_PROX_REV: TEdit;
    dptF_PROX_REV: TInterDateTimePicker;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btID_PERSONAClick(Sender: TObject);
    procedure ilID_PERSONAEjecuta(Sender: TObject);
    procedure btSigClick(Sender: TObject);
    procedure btAntClick(Sender: TObject);
    procedure edID_PERSONAExit(Sender: TObject);
    procedure edID_PERS_FIRAExit(Sender: TObject);
    procedure edB_EXP_DIAExit(Sender: TObject);
    procedure edF_ULT_REVExit(Sender: TObject);
    procedure edFRECUENCIAExit(Sender: TObject);
    procedure edF_PROX_REVExit(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrPersF;
    cDom   : Integer;
    procedure MuestraDatosCredito;
    procedure MuestraDomicilio;
end; 
 TCrPersF= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ID_PERSONA               : TInterCampo;
        ID_PERS_FIRA             : TInterCampo;
        RFC                      : TInterCampo;
        B_EXP_DIA                : TInterCampo;
        F_ULT_REV                : TInterCampo;
        FRECUENCIA               : TInterCampo;
        F_PROX_REV               : TInterCampo;

        ParamCre                 : TParamCre;

        Credito                  : TCrCredito;//Disposición
        Persona                  : TPersona; //Persona
        Acreditado               : TCrAcredit; //Acreditado
        Senicreb                 : TCrSen; //Senicreb
        Domicilio                : TDomicilio; //Domicilio

//        Ventana : TWCrPersF;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
        procedure MuestraDatosCredito;
      published
      end;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrPersF.Create( AOwner : TComponent );
begin Inherited;
  ID_PERSONA :=CreaCampo('ID_PERSONA',ftFloat,tsNinguno,tsNinguno,True);
  ID_PERSONA.Caption:='ID Persona';

  ID_PERS_FIRA :=CreaCampo('ID_PERS_FIRA',ftFloat,tsNinguno,tsNinguno,True);
  ID_PERS_FIRA.Caption:='ID Persona FIRA';

  RFC :=CreaCampo('RFC',ftFloat,tsNinguno,tsNinguno,False);

  B_EXP_DIA :=CreaCampo('B_EXP_DIA',ftString,tsNinguno,tsNinguno,True);
  B_EXP_DIA.Caption:='Expediente al día';

  F_ULT_REV :=CreaCampo('F_ULT_REV',ftDate,tsNinguno,tsNinguno,True);
  F_ULT_REV.Caption:='Fecha última revisión';

  FRECUENCIA:=CreaCampo('FRECUENCIA',ftString,tsNinguno,tsNinguno,True);
  With FRECUENCIA do
  begin Size:=4;
        UseCombo:=True;
        ComboLista.Add('Mensual'); ComboDatos.Add('01M');
        ComboLista.Add('Trimestral'); ComboDatos.Add('03M');
        ComboLista.Add('Semestral'); ComboDatos.Add('06M');
        ComboLista.Add('Anual'); ComboDatos.Add('12M');
  end;
  FRECUENCIA.Caption:='Frecuencia';

  F_PROX_REV :=CreaCampo('F_PROX_REV',ftDate,tsNinguno,tsNinguno,True);
  F_PROX_REV.Caption:='Fecha próxima revisión';

  FKeyFields.Add('ID_PERSONA');

  { Buscadores
  --> }

  Persona := TPersona.Create(Self);
  Persona.MasterSource:=Self;
  Persona.FieldByName('ID_PERSONA').MasterField:='ID_PERSONA';

  Acreditado := TCrAcredit.Create(Self);
  Acreditado.MasterSource:=Self;

  Senicreb := TCrSen.Create(Self);
  Senicreb.MasterSource:=Self;

  Domicilio := TDomicilio.Create(Self);
  Domicilio.MasterSource:=Self;


  {<-- Buscadores}

  TableName := 'ADMIPROD.CR_AM_PERSF';
  UseQuery := True;
  HelpFile := 'IntCrPersF.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrPersF.Destroy;
begin
   if Persona <> nil then
      Persona.Free;

   if Acreditado <> nil then
      Acreditado.Free;

   if Domicilio <> nil then
      Domicilio.Free;

   inherited;
end;


function TCrPersF.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrPersF;
begin
   W:=TWCrPersF.Create(Self);
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


Function TCrPersF.InternalBusca:Boolean;
Var T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICrAMPF.it','F,D');
  Try
  if Active then begin
    T.Param(0,ID_PERSONA.AsString);
  end;
  if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
  finally  T.Free;
  end;
end;

function TCrPersF.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CR_AM_BITACORA********************)
(*                                                                              *)
(*  FORMA DE CR_AM_BITACORA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_AM_BITACORA********************)

procedure TWCrPersF.FormShow(Sender: TObject);
begin
  //Datos del panel de la parte inferior de la forma
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

  Objeto.ID_PERSONA.Control := edID_PERSONA;
  Objeto.ID_PERS_FIRA.Control := edID_PERS_FIRA;

  Objeto.RFC.Control := edRFC;

  Objeto.Persona.Nombre.Control := edNOM_ACREDITADO;
  Objeto.Acreditado.CVE_SENICREB.Control := edCVE_SENICREB;
  Objeto.Senicreb.DESC_SENICREB.Control := edDESC_SENICREB;

  Objeto.Domicilio.Calle.Control := edCALLE;
  Objeto.Domicilio.Num_Exterior.Control := edNUM_EXTERIOR;
  Objeto.Domicilio.Num_Interior.Control := edNUM_INTERIOR;
  Objeto.Domicilio.Colonia.Control := edCOLONIA;
  Objeto.Domicilio.Ciudad.Control := edCIUDAD;
  Objeto.Domicilio.Poblacion.Control := edPOBLACION;
  Objeto.Domicilio.CodigoPostal.Control := edCODIGOPOSTAL;
  Objeto.Domicilio.Estado.Control := edESTADO;

  Objeto.B_EXP_DIA.Control := edB_EXP_DIA;
  Objeto.F_ULT_REV.Control := edF_ULT_REV;
  Objeto.FRECUENCIA.Control := edFRECUENCIA;
  Objeto.F_PROX_REV.Control := edF_PROX_REV;

  Interforma1.MsgPanel := MsgPanel;

end;

procedure TWCrPersF.FormDestroy(Sender: TObject);
begin
  Objeto.ID_PERSONA.Control := nil;
  Objeto.ID_PERS_FIRA.Control := nil;
  Objeto.RFC.Control := nil;
  Objeto.Persona.Nombre.Control := nil;
  Objeto.Acreditado.CVE_SENICREB.Control := nil;
  Objeto.Senicreb.DESC_SENICREB.Control := nil;

  Objeto.Domicilio.Calle.Control := nil;
  Objeto.Domicilio.Num_Exterior.Control := nil;
  Objeto.Domicilio.Num_Interior.Control := nil;
  Objeto.Domicilio.Colonia.Control := nil;
  Objeto.Domicilio.Ciudad.Control := nil;
  Objeto.Domicilio.Poblacion.Control := nil;
  Objeto.Domicilio.CodigoPostal.Control := nil;
  Objeto.Domicilio.Estado.Control := nil;

  Objeto.B_EXP_DIA.Control := nil;
  Objeto.F_ULT_REV.Control := nil;
  Objeto.FRECUENCIA.Control := nil;
  Objeto.F_PROX_REV.Control := nil;
end;

procedure TWCrPersF.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrPersF.InterForma1DespuesNuevo(Sender: TObject);
begin
  cDom := 0;
  edID_PERSONA.SetFocus;

end;

procedure TWCrPersF.InterForma1DespuesModificar(Sender: TObject);
begin
end;

//procedure TWCrPersF.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;

procedure TWCrPersF.MuestraDomicilio;
var
  sIDdomi : String;
  sText   : String;
  vlSQL : String;
  vlQry : TQuery;
begin
  if (cDom mod 2) = 0 then
  begin
    sIDdomi := Objeto.Persona.Id_Domicilio.AsString;
    GetSQLStr('select telef_casa as telefono from persona where id_persona = ' + edID_PERSONA.Text,
    Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, 'telefono', sText, False);
  end
  else
  begin
    sIDdomi := Objeto.Persona.Id_Dom_Fiscal.AsString;
    GetSQLStr('select telef_oficina as telefono from persona where id_persona = ' + edID_PERSONA.Text,
    Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, 'telefono', sText, False);
  end;
  edTelefono.Text := sText;
  Objeto.Domicilio.FindKey([sIDdomi]);

  //Encuentra altenativamente el domicilio

  vlSQL :=
    ' select calle, num_exterior, num_interior, colonia, codigo_postal, ' +
    ' 			 a.desc_poblacion as ciudad, ' +
    '        b.desc_poblacion as estado, ' +
    '        c.desc_poblacion as pais ' +
    ' from   domicilio dom, ' +
    ' 			 poblacion a, ' +
    '        poblacion b, ' +
    '        poblacion c ' +
    ' where  (a.cve_poblac_ubic = b.cve_poblacion) and (b.cve_poblac_ubic = c.cve_poblacion) and a.cve_poblacion = cve_ciudad ' +
    ' and 	 id_domicilio = ' + sIDdomi;
  vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
  if Assigned(vlQry) then
  begin
    try
    edCALLE.Text := vlQry.FieldByName('calle').AsString;
    edNum_Exterior.Text := vlQry.FieldByName('num_exterior').AsString;
    edNUM_INTERIOR.Text := vlQry.FieldByName('num_interior').AsString;
    edCOLONIA.Text := vlQry.FieldByName('colonia').AsString;
    edCIUDAD.Text := vlQry.FieldByName('ciudad').AsString;
    edPOBLACION.Text := vlQry.FieldByName('ciudad').AsString;
    edCODIGOPOSTAL.Text := vlQry.FieldByName('codigo_postal').AsString;
    edESTADO.Text := vlQry.FieldByName('estado').AsString;
    finally vlQry.Free;
    end;
  end;

  edNDomincilio.Text := IntToStr((cDom mod 2)+1);

end;

procedure TCrPersF.MuestraDatosCredito;
var
  sText : String;
  encontrado : Boolean;
begin
  Acreditado.FindKey([Persona.ID_PERSONA.AsString]);
  Senicreb.FindKey([Acreditado.CVE_SENICREB.AsString]);

  //Domicilio seleccionado
  //MuestraDomicilio;

  //RFC
  GetSQLStr('select siglas_rfc||f_rfc||homoclave_rfc as rfc from rfc where id_persona = ' + Persona.ID_PERSONA.AsString,
    Apli.DatabaseName, Apli.SessionName, 'rfc', sText, False);
  RFC.AsString := sText;
end;

procedure TWCrPersF.MuestraDatosCredito;
var
  sText : String;
  encontrado : Boolean;
begin
  Objeto.Acreditado.FindKey([Objeto.Persona.ID_PERSONA.AsString]);
  Objeto.Senicreb.FindKey([Objeto.Acreditado.CVE_SENICREB.AsString]);

  //Domicilio seleccionado
  MuestraDomicilio;

  //RFC
  GetSQLStr('select siglas_rfc||f_rfc||homoclave_rfc as rfc from rfc where id_persona = ' + edID_PERSONA.Text,
    Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, 'rfc', sText, False);
  edRFC.Text := sText;
end;

procedure TWCrPersF.btID_PERSONAClick(Sender: TObject);
begin
  if Objeto.Persona.Busca then
  begin
    MuestraDatosCredito;
    edID_PERSONAExit(nil);    
    InterForma1.NextTab(edID_PERSONA);
  end;
end;

procedure TWCrPersF.ilID_PERSONAEjecuta(Sender: TObject);
begin
  if Objeto.Persona.findKey([ilID_PERSONA.buffer]) then
  begin
    MuestraDatosCredito;
    InterForma1.NextTab(edID_PERSONA);
  end;
end;

procedure TWCrPersF.btSigClick(Sender: TObject);
begin
 inc(cDom);
 MuestraDomicilio;
end;

procedure TWCrPersF.btAntClick(Sender: TObject);
begin
 if cDom = 0 then exit;
 dec(cDom);
 MuestraDomicilio;
end;

procedure TWCrPersF.edID_PERSONAExit(Sender: TObject);
var
  vlbSalida  :  Boolean;
  vlStrMesg   :  String;
  vlSQL : String;
  vlQry  : TQuery;
  count : Integer;
begin
  vlbSalida := True;
  vlStrMesg := '';

  if (objeto.Modo = moAppend) or (objeto.Modo = moEdit) then
  begin
    objeto.ID_PERSONA.GetFromControl;

    if trim(edID_PERSONA.text) = '' then
    begin
      vlbSalida := False;
      vlStrMesg := 'ID Persona puede ser nulo';
    end
    else if (objeto.Modo = moAppend) then
    begin
      //Verifica que no exista en la tabla
      vlSQL :=
        ' select count(*) as count from cr_am_persf where ID_PERSONA = ' + edID_PERSONA.Text;
      vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
      if Assigned(vlQry) then
      begin
        try
        count := vlQry.FieldByName('count').AsInteger;
        finally vlQry.Free;
        end;
      end;

      if (count <> 0) then
      begin
        vlbSalida := False;
        vlStrMesg := 'La persona ya existe';
      end;
    end;

  end;

  InterForma1.ValidaExit(edID_PERSONA, vlbSalida, vlStrMesg, True);
end;

procedure TWCrPersF.edID_PERS_FIRAExit(Sender: TObject);
var
  vlbSalida  :  Boolean;
  vlStrMesg   :  String;
begin
  vlbSalida := True;
  vlStrMesg := '';

  if (objeto.Modo = moAppend) or (objeto.Modo = moEdit) then
  begin
    objeto.ID_PERS_FIRA.GetFromControl;

    if trim(edID_PERS_FIRA.text) = '' then
    begin
      vlbSalida := False;
      vlStrMesg := 'ID Persona FIRA no puede ser nulo';
    end;
  end;

  InterForma1.ValidaExit(edID_PERS_FIRA, vlbSalida, vlStrMesg, True);
end;

procedure TWCrPersF.edB_EXP_DIAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edB_EXP_DIA, True, '', True);
end;

procedure TWCrPersF.edF_ULT_REVExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_ULT_REV, True, '', True);
end;

procedure TWCrPersF.edFRECUENCIAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edFRECUENCIA, True, '', True);
end;

procedure TWCrPersF.edF_PROX_REVExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_PROX_REV, True, '', True);
end;

procedure TWCrPersF.InterForma1Buscar(Sender: TObject);
var
  encontrado: Boolean;
begin
  encontrado := objeto.InternalBusca;
  if encontrado then
    MuestraDatosCredito;
end;

end.
