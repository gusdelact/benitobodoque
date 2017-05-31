// Sistema         : Clase de NET_CONTRATO
// Fecha de Inicio : 23/06/1998
// Función forma   : Clase de NET_CONTRATO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Jose Alberto Ramirez Pacheco
// Comentarios     :
Unit IntNetCto;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, IntCtto,UnGene;

Type
 TNetCto= class;

  TwNetCto=Class(TForm)
	 InterForma1   : TInterForma;
	 lbID_CONTRATO : TLabel;
	 edID_CONTRATO : TEdit;
	 lbCVE_CORRESP : TLabel;
	 cbCVE_CORRESP : TComboBox;
	 lbCVE_IDIOMA : TLabel;
	 cbCVE_IDIOMA : TComboBox;
	 lbNOMBRE : TLabel;
	 edNOMBRE : TEdit;
	 rgSIT_CONTRATO : TRadioGroup;
	 lbTX_BIENVEV : TLabel;
	 bContrato: TBitBtn;
	 lbFH_ULT_ACCESO: TLabel;
	 edFH_ULT_ACCESO: TEdit;
	 GroupBox2: TGroupBox;
	 lbPASSWORD: TLabel;
	 edPASSWORD: TEdit;
	 lbREC_PASSWORD: TLabel;
         edREC_PASSWORD: TEdit;
         edTX_BIENVEV: TMemo;
         lbF_CAMB_PASS: TLabel;
         edF_CAMB_PASS: TEdit;
         dtpF_CAMB_PASS: TInterDateTimePicker;
         lbF_VENC_PASS: TLabel;
         edF_VENC_PASS: TEdit;
         dtpF_VENC_PASS: TInterDateTimePicker;
         GroupBox1: TGroupBox;
         lbCVE_USUARIO: TLabel;
         edCVE_USUARIO: TEdit;
         lbE_MAIL: TLabel;
         edE_MAIL: TEdit;
         chB_NVOS_PROD: TRadioGroup;
         bServicios: TButton;
         bCtosAsoc: TButton;
         gbRevisionPass: TGroupBox;
         edRevisionPass: TEdit;
         Button1: TButton;
         Button2: TButton;
         bEMail: TButton;
         edStatus: TEdit;
         edCve_Operacion: TEdit;
         edTx_Comentarios: TEdit;
    rgProFacElec: TRadioGroup;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure bContratoClick(Sender: TObject);
    procedure bCtosAsocClick(Sender: TObject);
    procedure bServiciosClick(Sender: TObject);
    procedure edPASSWORDExit(Sender: TObject);
    procedure edRevisionPassKeyPress(Sender: TObject; var Key: Char);
    procedure edRevisionPassExit(Sender: TObject);
    procedure edPASSWORDEnter(Sender: TObject);
    procedure edPASSWORDKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure bEMailClick(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure rgSIT_CONTRATOClick(Sender: TObject);
    procedure cbCVE_CORRESPExit(Sender: TObject);
    procedure cbCVE_IDIOMAExit(Sender: TObject);
    procedure edCVE_USUARIOExit(Sender: TObject);
    procedure edE_MAILExit(Sender: TObject);
    procedure edTX_BIENVEVExit(Sender: TObject);
    procedure edF_CAMB_PASSExit(Sender: TObject);
    procedure edF_VENC_PASSExit(Sender: TObject);
    procedure chB_NVOS_PRODExit(Sender: TObject);
    procedure EnvioConfirmacionEMail; // CZR 19-OCT-2010
    procedure InterForma1DespuesCancelar(Sender: TObject);
    private
    	Revisar: Boolean;
    	Procedure ValidaPassWord;
    public
    Objeto : TNetCto;
end;


 TNetCto= class(TInterFrame)
      private
         W : TWNetCto;
      protected
      public
        ID_CONTRATO              : TInterCampo;
        B_NVOS_PROD              : TInterCampo;
        CVE_CORRESP              : TInterCampo;
        CVE_IDIOMA               : TInterCampo;
        CVE_USUARIO              : TInterCampo;
        E_MAIL                   : TInterCampo;
        F_CAMB_PASS              : TInterCampo;
        F_VENC_PASS              : TInterCampo;
        FH_ULT_ACCESO            : TInterCampo;
        NOMBRE                   : TInterCampo;
        PASSWORD                 : TInterCampo;
        REC_PASSWORD             : TInterCampo;
        SIT_CONTRATO             : TInterCampo;
        TX_BIENVEV               : TInterCampo;
        B_PRO_FAC_ELEC           : TInterCampo; // CZR 19-OCT-2010
        Contrato: TContrato;
        ContratoPadre : TContrato;
        FLastPass: String;
        FPassPaso: String;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        procedure   DataBaseChange; override;
        function    InternalBusca : Boolean; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
        procedure   GrabarLog;
      published
      end;

implementation

{$R *.DFM}

USES IntNetCtoAsoc, IntNetSerUsr, IntEMail, RepCttoInter, RepCttoInterAcuse, IntEMaiPers;

constructor TNetCto.Create( AOwner : TComponent );
begin
  Inherited;
  ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
  ID_CONTRATO.Caption:='Contrato';
  CVE_USUARIO :=CreaCampo('CVE_USUARIO',ftString,tsNinguno,tsNinguno,True);
  CVE_USUARIO .Size:=8;
  CVE_USUARIO.Caption:='Clave de Usuario';
  E_MAIL :=CreaCampo('E_MAIL',ftString,tsNinguno,tsNinguno,True);
  E_MAIL .Size:=60;
  E_MAIL.Caption:='E Mail';
  F_CAMB_PASS :=CreaCampo('F_CAMB_PASS',ftDate,tsNinguno,tsNinguno,True);
  F_CAMB_PASS.Caption:='Fecha Camb Pass';
  F_VENC_PASS :=CreaCampo('F_VENC_PASS',ftDate,tsNinguno,tsNinguno,True);
  F_VENC_PASS.Caption:='Fecha Venc Pass';
  FH_ULT_ACCESO :=CreaCampo('FH_ULT_ACCESO',ftDateTime,tsNinguno,tsNinguno,True);
  FH_ULT_ACCESO.Caption:='Fecha y Hora Última Acceso';
  NOMBRE :=CreaCampo('NOMBRE',ftString,tsNinguno,tsNinguno,True);
  NOMBRE.Caption:='Nombre';
  PASSWORD :=CreaCampo('PASSWORD',ftString,tsNinguno,tsNinguno,True);
  PASSWORD.Size:=8;
  PASSWORD.Caption:='Password';
  REC_PASSWORD :=CreaCampo('REC_PASSWORD',ftString,tsNinguno,tsNinguno,True);
  REC_PASSWORD .Size:=30;
  REC_PASSWORD.Caption:='Rec Password';
  TX_BIENVEV :=CreaCampo('TX_BIENVEV',ftString,tsNinguno,tsNinguno,True);
  TX_BIENVEV.Caption:='Bienvev';
  B_NVOS_PROD :=CreaCampo('B_NVOS_PROD',ftString,tsNinguno,tsNinguno,True);
  with B_NVOS_PROD do begin
    Size:=1;
    Caption:='Aviso sobre nuevos productos';
    UseCombo := True;
    ComboDatos.Add('V');			ComboLista.Add('0');
    ComboDatos.Add('F');			ComboLista.Add('1');
  end;
  CVE_CORRESP :=CreaCampo('CVE_CORRESP',ftString,tsNinguno,tsNinguno,True);
  With CVE_CORRESP do begin
    Size:=2;
    Caption:='Clave de Corresp';
    UseCombo := True;
    ComboDatos.Add('CR');			ComboLista.Add('CORREO');
    ComboDatos.Add('EM');			ComboLista.Add('EMAIL');
  end;
  CVE_IDIOMA :=CreaCampo('CVE_IDIOMA',ftString,tsNinguno,tsNinguno,True);
  With CVE_IDIOMA do begin
    Size:=4;
    Caption:='Clave de Idioma';
    UseCombo := True;
    ComboDatos.Add('ESP');			ComboLista.Add('ESPAÑOL');
    ComboDatos.Add('ING');			ComboLista.Add('INGLES');
  end;
  SIT_CONTRATO := CreaCampo('SIT_CONTRATO',ftString,tsNinguno,tsNinguno,True);
  With SIT_CONTRATO do begin
    Size     := 2;
    Caption  := 'Situación Contrato';
    UseCombo := True;
    ComboDatos.Add('AC');			ComboLista.Add('0');
    ComboDatos.Add('IN');			ComboLista.Add('1');
    ComboDatos.Add('CA');			ComboLista.Add('2');
  end;
  // CZR 19-OCT-2010
  B_PRO_FAC_ELEC := CreaCampo('B_PRO_FAC_ELEC', ftString, tsNinguno, tsNinguno, True);
  with B_PRO_FAC_ELEC do
  begin
     Size     := 1;
     Caption  := 'Proveedor Factoraje Electronico';
     UseCombo := True;
     ComboDatos.Add('V');			ComboLista.Add('0');
     ComboDatos.Add('F');			ComboLista.Add('1');
  end;

  Contrato := TContrato.Create(Self);
  Contrato.BuscaWhereString := 'CONTRATO.CVE_TIP_CONTRATO = ''INET''';
  Contrato.MasterSource := self;
  Contrato.ID_Contrato.MasterField := 'ID_CONTRATO';
//  Contrato.TITNOMBRE.MasterField := 'NOMBRE';

  FLastPass := '';
  FPassPaso := '';

  FKeyFields.Add('ID_CONTRATO');

  TableName := 'NET_CONTRATO';
  UseQuery := True;
  HelpFile := 'IntNetCto.Hlp';
  ShowMenuReporte:=False;
end;

Destructor TNetCto.Destroy;
begin
  inherited;
end;

procedure TNetCto.DataBaseChange;
begin
  inherited;
end;

function TNetCto.ShowWindow(FormaTipo:TFormaTipo):Integer;
begin
  W:=TwNetCto.Create(Self);
  try
    W.Objeto:= Self;
    W.InterForma1.InterFrame:= Self;
    W.InterForma1.FormaTipo := FormaTipo;
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.CentrarForma := True;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free; W:=nil;
  end;
end;

Function TNetCto.InternalBusca:Boolean;
Var
   T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('INetCto.it','F');
  Try
    if Active then begin
       T.Param(0,ID_CONTRATO.AsString);
    end;
    if T.Execute then begin
       InternalBusca := FindKey([T.DameCampo(0)]);
       FLastPass := PASSWORD.AsString;
       FPassPaso := PASSWORD.AsString;
    end;
  finally
    T.Free;
  end;
end;

function TNetCto.Reporte:Boolean;
begin
  Execute_RepCttoInt(Self, True);
  Execute_RepCttoIntAcuse(Self, True);
end;

(***********************************************FORMA NET_CONTRATO********************)
(*                                                                              *)
(*  FORMA DE NET_CONTRATO                                                            *)
(*                                                                              *)
(***********************************************FORMA NET_CONTRATO********************)

// CZR 19-OCT-2010
procedure TwNetCto.EnvioConfirmacionEMail;
begin
   if trim(Objeto.B_PRO_FAC_ELEC.AsString) = 'V' then
      bEMail.Enabled := True
   else
      bEMail.Enabled := False;
end;

procedure TwNetCto.FormShow(Sender: TObject);
begin
   Objeto.ID_CONTRATO.Control:=edID_CONTRATO;
   Objeto.B_NVOS_PROD.Control:=chB_NVOS_PROD;
   Objeto.CVE_CORRESP.Control:=cbCVE_CORRESP;
   Objeto.CVE_IDIOMA.Control:=cbCVE_IDIOMA;
   Objeto.CVE_USUARIO.Control:=edCVE_USUARIO;
   Objeto.E_MAIL.Control:=edE_MAIL;
   Objeto.F_CAMB_PASS.Control:=edF_CAMB_PASS;
   Objeto.F_VENC_PASS.Control:=edF_VENC_PASS;
   Objeto.FH_ULT_ACCESO.Control:=edFH_ULT_ACCESO;
   Objeto.NOMBRE.Control:=edNOMBRE;
   Objeto.PASSWORD.Control:=edPASSWORD;
   Objeto.REC_PASSWORD.Control:=edREC_PASSWORD;
   Objeto.SIT_CONTRATO.Control:=rgSIT_CONTRATO;
   Objeto.TX_BIENVEV.Control:=edTX_BIENVEV;

   // CZR 19-OCT-2010
   Objeto.B_PRO_FAC_ELEC.Control := rgProFacElec;
   EnvioConfirmacionEMail;
end;

procedure TwNetCto.FormDestroy(Sender: TObject);
begin
   Objeto.ID_CONTRATO.Control:=nil;
   Objeto.B_NVOS_PROD.Control:=nil;
   Objeto.CVE_CORRESP.Control:=nil;
   Objeto.CVE_IDIOMA.Control:=nil;
   Objeto.CVE_USUARIO.Control:=nil;
   Objeto.E_MAIL.Control:=nil;
   Objeto.F_CAMB_PASS.Control:=nil;
   Objeto.F_VENC_PASS.Control:=nil;
   Objeto.FH_ULT_ACCESO.Control:=nil;
   Objeto.NOMBRE.Control:=nil;
   Objeto.PASSWORD.Control:=nil;
   Objeto.REC_PASSWORD.Control:=nil;
   Objeto.SIT_CONTRATO.Control:=nil;
   Objeto.TX_BIENVEV.Control:=nil;
   Objeto.B_PRO_FAC_ELEC.Control := nil; // CZR 19-OCT-2010
end;

procedure TwNetCto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwNetCto.InterForma1DespuesNuevo(Sender: TObject);
begin
   if Objeto.ContratoPadre <> nil then begin
      Objeto.Contrato.FindKey([Objeto.ContratoPadre.Id_Contrato.AsString]);
   end;//if
   Objeto.SIT_CONTRATO.SetAsString('AC');
   rgSIT_CONTRATO.ItemIndex := 0;
   chB_NVOS_PROD.ItemIndex := 0;
   edF_CAMB_PASS.Text := FormatDateTime('dd/mm/yyyy',Now);
   edF_VENC_PASS.Text := FormatDateTime('dd/mm/yyyy',Now + 60);
   edStatus.Text := 'V';
   bContrato.SetFocus;

   // CZR 19-OCT-2010
   rgProFacElec.ItemIndex := 1;
   EnvioConfirmacionEMail
end;

procedure TwNetCto.InterForma1DespuesModificar(Sender: TObject);
begin
   edStatus.Text := 'X';
end;

procedure TwNetCto.bContratoClick(Sender: TObject);
begin
  Objeto.Contrato.Busca;
end;

procedure TwNetCto.bCtosAsocClick(Sender: TObject);
Var
   Ctto: TNetCtoAso;
begin
  if Objeto.Active Then begin
     Ctto:= TNetCtoAso.create(self);
     try
       Ctto.GetParams(Objeto);
       Ctto.Contrato := Objeto;
       Ctto.vId_Contrato := Objeto.ID_CONTRATO.AsInteger; // CZR 19-OCT-2010
       Ctto.Catalogo;
     finally
       if Ctto<> nil then
          Ctto.Free;
     end;
  end
  else
     messagedlg('No Existe un contrato activo',mtError,[mbOK],0);
end;

procedure TwNetCto.bServiciosClick(Sender: TObject);
Var
   Ser: TNetSerUsr;
begin
  if Objeto.Active Then begin
     Ser:= TNetSerUsr.create(self);
     try
        Ser.GetParams(Objeto);
        Ser.Contrato := Objeto;
        Ser.Catalogo;
     finally
        if Ser <> nil then
           Ser.Free;
     end;
  end
  else
     messagedlg('No Existe un contrato activo',mtError,[mbOK],0);
end;

procedure TwNetCto.edPASSWORDEnter(Sender: TObject);
begin
{
  InterForma1.F.btAceptar.Default := False;
  InterForma1.F.btCancelar.Cancel := False;
  Revisar:= True;
}  
end;

procedure TwNetCto.edPASSWORDExit(Sender: TObject);
begin
{
  edRevisionPass.Text := '';
  gbRevisionPass.Visible := True;
  edRevisionPass.SetFocus;
  edStatus.Text := 'F';
}  
end;

procedure TwNetCto.edPASSWORDKeyPress(Sender: TObject; var Key: Char);
begin
{
   if Key = #13 Then
      edREC_PASSWORD.SetFocus;
   if Key = #27 Then begin
      Objeto.Cancel;
      Objeto.FLastPass := Objeto.PASSWORD.AsString;
      InterForma1.CanEdit := False;
   end;
}
end;

Procedure TwNetCto.ValidaPassWord;
begin
  gbRevisionPass.Visible := False;
  if Revisar Then begin
     if edRevisionPass.Text <> edPassword.Text Then begin
        messagedlg('El password es incorrecto',mtError, [mbOK],0);
        edPASSWORD.SetFocus;
        edPASSWORD.Text := '';
        Objeto.FLastPass:= '';
     end
     else begin
        Objeto.FLastPass := edPassword.Text;
        edREC_PASSWORD.SetFocus;
        InterForma1.F.btAceptar.Default := True;
        InterForma1.F.btCancelar.Cancel := True;
     end;
  end;
end;

procedure TwNetCto.edRevisionPassExit(Sender: TObject);
begin
  ValidaPassWord;
end;

procedure TwNetCto.edRevisionPassKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 Then
     gbRevisionPass.SetFocus;  //ValidaPassWord;
  if Key = #27 Then begin
     Revisar:= False;
     Objeto.Cancel;
     Objeto.FLastPass := Objeto.PASSWORD.AsString;
     gbRevisionPass.Visible := False;
     InterForma1.CanEdit := False;
  end;
end;

procedure TwNetCto.Button1Click(Sender: TObject);
begin
  Objeto.Reporte;
end;

procedure TwNetCto.Button2Click(Sender: TObject);
var
  TR:TEmaiPers;
begin
  TR:=TEmaiPers.Create(Self);
  Try
    TR.Apli:=Objeto.Contrato.Apli;
    TR.Contrato:=Objeto.Contrato;
    TR.Catalogo;
  Finally
    TR.Free;
  end;
end;

procedure TwNetCto.bEMailClick(Sender: TObject);
var
   FrmEmail: TFrmEmail;
   Qry : TQuery; // CZR 19-OCT-2010
   //Q2: TQuery;
begin
   if Objeto.Active Then begin
      FrmEmail:= TFrmEmail.Create(Self);
      try
        ////////// RLA.- 30-Abril-2004 //////////
        {Q2:=GetSqlQuery('SELECT * FROM SECU_SERVIDOR WHERE TIPO_SERVICIO = ''SMTP'' AND B_DEFAULT = ''V'''
                        ,Objeto.Apli.SeguDataBaseName,Objeto.Apli.SeguSessionName,False);
        if Q2<>nil then
        begin
          Try
            FrmEmail.NMSMTP1.Host := Us_Ascii(Q2.FieldByName('DIRECCION_IP').AsString);
          Finally Q2.Free;
          end;
        end;}
        //FrmEmail.NMSMTP1.Host:='132.1.4.130';
        ////////// RLA.- 30-Abril-2004 //////////
        FrmEmail.Memo1.Text := edE_Mail.Text;
        FrmEmail.Edit4.Text := edNombre.Text;
        FrmEmail.Edit5.Text := edCve_usuario.Text;
        FrmEmail.Memo2.Lines.Strings[6] := '*** La Clave de Usuario que se registro es: ' + edCve_Usuario.Text + ' ***'; // CZR 19-OCT-2010

         // CZR 19-OCT-2010   Host
         try
            Qry := GetSqlQuery('SELECT VALOR FROM PARAMETROS WHERE ID_PARAMETRO = 109', Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
            if Qry = nil then
               raise EAbort.Create('No se encuentra configurado el Host de Correo')
            else
               FrmEmail.vHost := trim(Qry.FieldByName('VALOR').AsString);
         Finally
            if Qry <> nil then   Qry.Free;   Qry := nil;
         end;

         // CZR 19-OCT-2010   Puerto
         try
            Qry := GetSqlQuery('SELECT VALOR FROM PARAMETROS WHERE ID_PARAMETRO = 110', Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
            if Qry = nil then
               raise EAbort.Create('No se encuentra configurado el Puerto de Correo')
            else
               FrmEmail.vPort := StrToInt(Qry.FieldByName('VALOR').AsString);
         Finally
            if Qry <> nil then   Qry.Free;   Qry := nil;
         end;

         // CZR 19-OCT-2010   Copia Oculta
         try
            Qry := GetSqlQuery('SELECT VALOR FROM PARAMETROS WHERE ID_PARAMETRO = 111', Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
            if Qry <> nil then
               FrmEmail.vCCO := trim(Qry.FieldByName('VALOR').AsString);
         Finally
            if Qry <> nil then   Qry.Free;   Qry := nil;
         end;

        FrmEmail.showModal;
      finally
        FrmEmail.Free;
      end;
   end;
end;

procedure TwNetCto.InterForma1DespuesAceptar(Sender: TObject);
var
  stpPassword  : TStoredProc;
  vResul       : String;
begin
   If edStatus.Text = 'V' then begin  // es un registro nuevo
      stpPassword := TStoredProc.Create(Self);
      try
        stpPassword.DatabaseName := 'dbCorp';   // debe ser fijo porque si no el default es dbinet y ahí no está el paquete//
        stpPassword.SessionName  := Objeto.SessionName;
        with stpPassword do
          begin
            StoredProcName := 'PKGENCRIP.STPENCPASSINET';
            Params.CreateParam(ftString,  'PUSUARIO',   ptInput);
            Params.CreateParam(ftString,  'PPASSWORD',  ptInput);
            Params.CreateParam(ftString,  'PEVENTO',    ptInput);
            Params.CreateParam(ftString,  'PRESULTADO', ptOutput);
            Prepare;
            stpPassword.ParamByName('pUsuario').AsString := edCve_Usuario.Text;
            stpPassword.ParamByName('pPassword').AsString := edPassword.Text;
            stpPassword.ParamByName('pEvento').AsString := 'A';
            stpPassword.ExecProc;
            vResul := stpPassword.ParamByName('pResultado').AsString;
            Unprepare;
            Close;
          end;
      finally
        stpPassword.free;
      end;
      edcve_operacion.Text := 'REGNUE';
      edTx_Comentarios.Text := 'Creación de Registro Nuevo, Password ' + edPassword.Text;
      Objeto.GrabarLog;
   end;
   If(edStatus.Text = 'F')then begin  // es un registro actualizado
      stpPassword := TStoredProc.Create(Self);
      try
        stpPassword.DatabaseName := 'dbCorp';   // debe ser fijo porque si no el default es dbinet y ahí no está el paquete//
        stpPassword.SessionName  := Objeto.SessionName;
        with stpPassword do
          begin
            StoredProcName := 'PKGENCRIP.STPENCPASSINET';
            Params.CreateParam(ftString,  'PUSUARIO',   ptInput);
            Params.CreateParam(ftString,  'PPASSWORD',  ptInput);
            Params.CreateParam(ftString,  'PEVENTO',    ptInput);
            Params.CreateParam(ftString,  'PRESULTADO', ptOutput);
            Prepare;
            stpPassword.ParamByName('pUsuario').AsString := edCve_Usuario.Text;
            stpPassword.ParamByName('pPassword').AsString := edPassword.Text;
            stpPassword.ParamByName('pEvento').AsString := 'A';
            stpPassword.ExecProc;
            vResul := stpPassword.ParamByName('pResultado').AsString;
            Unprepare;
            Close;
          end;
      finally
        stpPassword.free;
      end;
      Objeto.FPassPaso := edPassword.Text;
      edcve_operacion.Text  := 'ACTPAS';
      edTx_Comentarios.Text := 'Actualización de Password ' + edPassword.Text;
      Objeto.GrabarLog;
   end;
   EnvioConfirmacionEMail; // CZR 19-OCT-2010
end;

procedure TNetCto.GrabarLog;
var
  qIns, Q  : TQuery;
  SQL      : String;
  vFolio   : Integer;
begin
  If Active Then begin
     SQL := ' SELECT NUM_FOLIO as FOLIO '
           +' FROM FOLIO_CORP '
           +' WHERE ID_EMPRESA = 2 '
           +'  AND  CVE_FOLIO  = ''BITPASS'' ';
     Q := GetSqlQuery(SQL,DataBaseName,SessionName,True);
     if Q<>nil then begin
        try
          vFolio := Q.FieldByName('FOLIO').AsInteger + 1;
        Finally
          Q.Free;
        end;
     end;
     if Q=nil then
        Q.Free;
     SQL := '';
     qIns:=TQuery.Create(Nil);
     try
       qIns.DataBaseName := 'dbCorp';
       qIns.SessionName  := 'Default';
       SQL  :=  ' INSERT INTO NET_LOG_TRANS ('
              + '        ID_CONTRATO, CONSECUTIVO, FECHA_HORA, '
              + '        CVE_USUARIO, CVE_OPERACION, TX_COMENTARIOS )'
              + ' VALUES ( '
              +       ID_CONTRATO.AsString
              + ' , ' + InttoStr(vFolio)
              + ' , to_date(to_char(sysdate,''dd/mm/yyyy hh:mi:ss AM''),''dd/mm/yyyy hh:mi:ss AM'') '
              + ' , ' + chr(39) + DameUsuario + chr(39)
              + ' , ' + chr(39) + w.edCve_Operacion.Text + chr(39)
              + ' , ' + chr(39) + w.edTx_Comentarios.Text + chr(39) + ')';
       qIns.SQL.Text:= SQL;
       qIns.ExecSQL;
     finally
       qIns.free;
     end;
     RunSQL('UPDATE FOLIO_CORP '+
            'SET NUM_FOLIO    = '+ InttoStr(vFolio) +
            'WHERE ID_EMPRESA = 2 '  +
            'AND   CVE_FOLIO = ''BITPASS'' ', DataBaseName, SessionName, True);
  end;
end;

procedure TwNetCto.rgSIT_CONTRATOClick(Sender: TObject);
var
  paso : String;
begin
  If rgSit_Contrato.ItemIndex = 0 Then
     paso := 'AC'
  Else
     If rgSit_Contrato.ItemIndex = 1 Then
        paso := 'IN'
     Else
        paso := 'CA';
  If paso <> Objeto.SIT_CONTRATO.AsString Then begin
     edcve_operacion.Text := 'CAMSTA';
     edTx_Comentarios.Text := 'Cambio a la situación del Contrato ' + paso;
     Objeto.GrabarLog;
  end;
end;

procedure TwNetCto.cbCVE_CORRESPExit(Sender: TObject);
begin
  If cbCve_Corresp.Text <> Objeto.CVE_CORRESP.AsString Then begin
     edcve_operacion.Text := 'CAMCOR';
     edTx_Comentarios.Text := 'Cambio de Clave de Correspondencia ' + cbCve_Corresp.Text;
     Objeto.GrabarLog;
  end;
end;

procedure TwNetCto.cbCVE_IDIOMAExit(Sender: TObject);
begin
  If cbCve_Idioma.Text <> Objeto.CVE_IDIOMA.AsString Then begin
     edcve_operacion.Text := 'CAMIDI';
     edTx_Comentarios.Text := 'Cambio de Clave de Idioma ' + cbCve_Idioma.Text;
     Objeto.GrabarLog;
  end;
end;

procedure TwNetCto.edCVE_USUARIOExit(Sender: TObject);
begin
  If edCve_Usuario.Text <> Objeto.CVE_USUARIO.AsString Then begin
     edcve_operacion.Text := 'CAMUSU';
     edTx_Comentarios.Text := 'Cambio de Clave de Usuario ' + edCve_Usuario.Text;
     Objeto.GrabarLog;
  end;
end;

procedure TwNetCto.edE_MAILExit(Sender: TObject);
begin
  If ede_Mail.Text <> Objeto.E_MAIL.AsString Then begin
     edcve_operacion.Text := 'CAMEMA';
     edTx_Comentarios.Text := 'Cambio de dirección de e-mail ' + edE_mail.Text;
     Objeto.GrabarLog;
  end;
end;

procedure TwNetCto.edTX_BIENVEVExit(Sender: TObject);
begin
  If edTx_Bienvev.Text <> Objeto.TX_BIENVEV.AsString Then begin
     edcve_operacion.Text := 'CAMTXT';
     edTx_Comentarios.Text := 'Modificación al Texto de Bienvenida ' + edTx_Bienvev.Text;
     Objeto.GrabarLog;
  end;
end;

procedure TwNetCto.edF_CAMB_PASSExit(Sender: TObject);
begin
  If edF_Camb_Pass.Text <> Objeto.F_CAMB_PASS.AsString Then begin
     edcve_operacion.Text := 'CAMFCA';
     edTx_Comentarios.Text := 'Modificación a la fecha de cambio de Password ' + edF_Camb_pass.Text;
     Objeto.GrabarLog;
  end;
end;

procedure TwNetCto.edF_VENC_PASSExit(Sender: TObject);
begin
  If edF_Venc_Pass.Text <> Objeto.F_VENC_PASS.AsString Then begin
     edcve_operacion.Text := 'CAMFVE';
     edTx_Comentarios.Text := 'Modificación a la fecha de vencimiento de Password ' + edF_Venc_Pass.Text;
     Objeto.GrabarLog;
  end;
end;

procedure TwNetCto.chB_NVOS_PRODExit(Sender: TObject);
var
  paso : String;
begin
  If chB_Nvos_Prod.ItemIndex = 0 Then
     paso := 'V'
  Else
     paso := 'F';
  If paso <> Objeto.B_NVOS_PROD.AsString Then begin
     edcve_operacion.Text := 'CAMANP';
     edTx_Comentarios.Text := 'Cambio al indicador de nuevos productos ' + paso;
     Objeto.GrabarLog;
  end;
end;

procedure TwNetCto.InterForma1DespuesCancelar(Sender: TObject);
begin
   EnvioConfirmacionEMail; // CZR 19-OCT-2010
end;
end.
