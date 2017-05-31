// Sistema         : Clase de CR_REL_CRED_CHEQ
// Fecha de Inicio : 28/04/2005
// Función forma   : Clase de CR_REL_CRED_CHEQ
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :

Unit IntCrReCrCh;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit,

//UNIDADES ADICONALES
IntParamCre,
IntGenCre,
IntBasicCred,
IntCrMeSiRe, Grids, Aligrid, Menus,
  IntConTransa,
  IntCtoHeader
;
Const
   C_SEC = 0; //SECUENCIA
   C_CHQ = 1; //CHEQUERA
   C_TIT = 2; //TITULAR
   C_SIT = 3; //SITUACION
   C_BCO = 4;
Type
 TCrReCrCh= class;

  TWCrRelCredCheq=Class(TForm)
    InterForma1             : TInterForma;
    lbID_CREDITO : TLabel;
    edID_CREDITO : TEdit;
    lbCUENTA_BANCO : TLabel; 
    edCUENTA_BANCO : TEdit;
    lbIMP_BLOQUEADO : TLabel;
    IedIMP_A_BLOQUEAR: TInterEdit; 
    rgSIT_REL_CRED : TRadioGroup;
    Label3: TLabel;
    edNOMBRE_TITULAR: TEdit;
    lbUSUA_ALTA: TLabel;
    lbF_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    lbF_MODIF: TLabel;
    edF_ALTA: TEdit;
    edCVE_USUA_ALTA: TEdit;
    edF_MODIF: TEdit;
    edCVE_USUA_MODIF: TEdit;
    MsgPanel: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    sgDATOS: TStringAlignGrid;
    Label23: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    lbCTA_FIDEICOMISO: TLabel;
    IedCTA_FIDEICOMISO: TInterEdit;
    lbIMP_MIN_DEPOSITO: TLabel;
    IedIMP_MIN_DEPOSITO: TInterEdit;
    lbDIA_RECEP_APORT: TLabel;
    IedDIA_RECEP_APORT: TInterEdit;
    chB_MES_SIN_REC: TCheckBox;
    chB_DEPOSITO_APORT: TCheckBox;
    lbDIA_SOLIC_PAGO: TLabel;
    IedDIA_SOLIC_PAGO: TInterEdit;
    rgCVE_TIPO_RAMO: TRadioGroup;
    btMESES_EXCEP: TBitBtn;
    lbSECUENCIA: TLabel;
    edSECUENCIA: TEdit;
    pmDV: TPopupMenu;
    Bevel1: TBevel;
    Bevel2: TBevel;
    ConsultaDepsitosalaVista1: TMenuItem;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure IedIMP_A_BLOQUEARExit(Sender: TObject);
    procedure IedIMP_MIN_DEPOSITOExit(Sender: TObject);
    procedure IedDIA_RECEP_APORTExit(Sender: TObject);
    procedure IedDIA_SOLIC_PAGOExit(Sender: TObject);
    procedure IedCTA_FIDEICOMISOExit(Sender: TObject);
    procedure chB_DEPOSITO_APORTExit(Sender: TObject);
    procedure chB_MES_SIN_RECExit(Sender: TObject);
    procedure rgCVE_TIPO_RAMOExit(Sender: TObject);
    procedure rgSIT_REL_CREDExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure btMESES_EXCEPClick(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure sgDATOSClick(Sender: TObject);
    procedure ConsultaDepsitosalaVista1Click(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    private
    { Private declarations }
       Procedure ConfigMesExcep;
       Procedure StpObtImpABloquear(peIdCredito: String);
       Procedure MuestraDatos;
    public
    { Public declarations }
    Objeto : TCrReCrCh;
end;
 TCrReCrCh= class(TInterFrame)
      private

      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        vgNomAcreditado          : String;
        vgNomBanco               : String;
        vgNomTitular             : String;
        vgIdCredito              : String;
        vgCtaBanco               : String;
        vgBanco                  : String;
        vlgBanco                 : String;

        ID_CREDITO               : TInterCampo;
        ID_BANCO_CHQRA           : TInterCampo;
        CUENTA_BANCO             : TInterCampo;
        SECUENCIA                : TInterCampo;
        IMP_A_BLOQUEAR           : TInterCampo;
        IMP_MIN_DEPOSITO         : TInterCampo;
        CTA_FIDEICOMISO          : TInterCampo;
        B_DEPOSITO_APORT         : TInterCampo;
        DIA_RECEP_APORT          : TInterCampo;
        DIA_SOLIC_PAGO           : TInterCampo;
        B_MES_SIN_REC            : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        SIT_REL_CRED             : TInterCampo;
        CVE_TIPO_RAMO            : TInterCampo;
        B_ACTIVA_BUSQ            : TInterCampo;
        B_BLOQUEADA              : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        BasicCred                : TBasicCred;
        Contrato                 : TCtrlCto;
        ConTransa                : TConTransa;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Function    ObtNumSecuencia : Integer;
        Function    ActSecuencia(pIdCredito : Integer; pCuentaBanco,pSecuencia :String ): Boolean;
      published
      end;



implementation

{$R *.DFM}


constructor TCrReCrCh.Create( AOwner : TComponent );
begin Inherited;
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Disposición';
      ID_BANCO_CHQRA :=CreaCampo('ID_BANCO_CHQRA',ftFloat,tsNinguno,tsNinguno,True);
                ID_BANCO_CHQRA.Caption:='Número de Banco Chqra';
      CUENTA_BANCO :=CreaCampo('CUENTA_BANCO',ftString,tsNinguno,tsNinguno,True);
                CUENTA_BANCO.Caption:='Cuenta  / Banco';
      SECUENCIA :=CreaCampo('SECUENCIA',ftFloat,tsNinguno,tsNinguno,True);
                SECUENCIA.Caption:='Secuencia';
      IMP_A_BLOQUEAR :=CreaCampo('IMP_A_BLOQUEAR',ftFloat,tsNinguno,tsNinguno,True);
                IMP_A_BLOQUEAR.Caption:='Imp. a Bloquear';
      IMP_MIN_DEPOSITO :=CreaCampo('IMP_MIN_DEPOSITO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_MIN_DEPOSITO.Caption:='Imp. Minimo';
      CTA_FIDEICOMISO :=CreaCampo('CTA_FIDEICOMISO',ftString,tsNinguno,tsNinguno,True);
                CTA_FIDEICOMISO.Caption:='Cta. Fidei. Maestro';
      B_DEPOSITO_APORT :=CreaCampo('B_DEPOSITO_APORT',ftString,tsNinguno,tsNinguno,True);
                B_DEPOSITO_APORT.Caption:='Se recibirán depósitos por concepto de Aport./ Participaciones u Otro';
      DIA_RECEP_APORT :=CreaCampo('DIA_RECEP_APORT',ftInteger,tsNinguno,tsNinguno,True);
                DIA_RECEP_APORT.Caption:='Día Recep. Aport';
      DIA_SOLIC_PAGO :=CreaCampo('DIA_SOLIC_PAGO',ftFloat,tsNinguno,tsNinguno,True);
                DIA_SOLIC_PAGO.Caption:='Día Sol. Pago';
      B_MES_SIN_REC :=CreaCampo('B_MES_SIN_REC',ftString,tsNinguno,tsNinguno,True);
                B_MES_SIN_REC.Caption:='Aplica Meses sin Recepción de Recursos';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      SIT_REL_CRED :=CreaCampo('SIT_REL_CRED',ftString,tsNinguno,tsNinguno,True);
        With SIT_REL_CRED do
        begin
          Size:=2;
          UseCombo:=True;
          ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
          ComboLista.Add('1'); ComboDatos.Add(CSIT_IN);
        end;
                SIT_REL_CRED.Caption:='Situación';
      CVE_TIPO_RAMO :=CreaCampo('CVE_TIPO_RAMO',ftString,tsNinguno,tsNinguno,True);
        With CVE_TIPO_RAMO do
        begin
          Size:=2;                            
          UseCombo:=True;
          ComboLista.Add('0'); ComboDatos.Add('28');
          ComboLista.Add('1'); ComboDatos.Add('33');
          ComboLista.Add('2'); ComboDatos.Add('00');          
        end;
                CVE_TIPO_RAMO.Caption:='Tipo Ramo';
        B_ACTIVA_BUSQ :=CreaCampo('B_ACTIVA_BUSQ',ftString,tsNinguno,tsNinguno,True);
                B_ACTIVA_BUSQ.Caption:='Activa busqueda de recursos';
        B_BLOQUEADA :=CreaCampo('B_BLOQUEADA',ftString,tsNinguno,tsNinguno,True);
                B_ACTIVA_BUSQ.Caption:='Indica si esta bloqueda';

      FKeyFields.Add('ID_CREDITO');
      FKeyFields.Add('ID_BANCO_CHQRA');
      FKeyFields.Add('CUENTA_BANCO');

      TableName := 'CR_REL_CRED_CHEQ';
      UseQuery := True;
      HelpFile := 'IntCrReCrCh.Hlp';
      ShowMenuReporte:=True;

      ConTransa := TConTransa.Create( Self );
      ConTransa.MasterSource  := Self;

      Contrato  := TCtrlCto.Create( Self );
      Contrato.MasterSource   := Self;
end;

Destructor TCrReCrCh.Destroy;
begin
   if ConTransa <> nil then
      ConTransa.free;
   //end if

   if Contrato <> nil then
      Contrato.Free;
   //end if
   
   inherited;
end;


function TCrReCrCh.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrRelCredCheq;
begin
   W:=TWCrRelCredCheq.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
// </ RABA > ENE 2012
      W.Interforma1.ShowBtnEliminar := False;
// < RABA />
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrReCrCh.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrReCC.it','F,F,S,F');
      Try if Active then begin T.Param(0,ID_CREDITO.AsString);
                               T.Param(1,ID_BANCO_CHQRA.AsString);
                               T.Param(2,CUENTA_BANCO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3)]);
      finally  T.Free;
      end;
end;

Function TCrReCrCh.ObtNumSecuencia : Integer;
var vlsql : String;
    vlSecuencia : Integer;
begin
   vlSql := ' SELECT NVL(MAX(SECUENCIA),0) SECUENCIA FROM CR_REL_CRED_CHEQ ' +
            ' WHERE ID_CREDITO     = ' + ID_CREDITO.AsString;
   GetSQLInt(vlsql,Apli.DataBaseName, Apli.SessionName,'SECUENCIA', vlSecuencia, False);
   Result := vlSecuencia;
end;
{---------------------------------------------------------------------------------------
                        Actualiza Secuancia
----------------------------------------------------------------------------------------}
function TCrReCrCh.ActSecuencia(pIdCredito : Integer; pCuentaBanco,pSecuencia :String ): Boolean;
var vlResult         : Boolean;
    StpActSecuencia  : TStoredProc;
    vlMsgErr         : String;
begin
    vlResult := True;
    StpActSecuencia := TStoredProc.Create(Self);
    try
       with StpActSecuencia do
       begin
          StpActSecuencia.DatabaseName:= Apli.DatabaseName;
          StpActSecuencia.SessionName:= Apli.SessionName;
          StpActSecuencia.StoredProcName:='PKGCRSALDOS.STPACTSECUENCIA';

          Params.Clear;
          Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
          Params.CreateParam(ftString,'PECUENTABANCO',ptInput);
          Params.CreateParam(ftString,'PESECUENCIA',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('PEIDCREDITO').AsInteger := pIdCredito;
          ParamByName('PECUENTABANCO').AsString := pCuentaBanco;
          ParamByName('PESECUENCIA').AsString := pSecuencia;
          ParamByName('PEBCOMMIT').AsString := CVERDAD;
          ExecProc;

          if ParamByName('PSResultado').AsInteger <> 0 then
          Begin
             ShowMessage(ParamByName('psRESULTADO').AsString + ' : ' + ParamByName('psTxResultado').AsString);
             vlResult := False;
          end;
          UnPrepare;
       end;
    finally
       StpActSecuencia.Free;
    end;
    ActSecuencia:= vlResult;
end;

(***********************************************FORMA CR_REL_CRED_CHEQ********************)
(*                                                                              *)
(*  FORMA DE CR_REL_CRED_CHEQ                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_REL_CRED_CHEQ********************)
procedure TWCrRelCredCheq.StpObtImpABloquear(peIdCredito: String);
Var vlSql     : String;
    vlImpABlq : String;
begin
   if Objeto.BasicCred.SIT_CREDITO.AsString = 'AC' then
   Begin
     vlSql:= 'SELECT NVL(PKGCRSALDOS.ObtImporteVto(' + peIdCredito + ',3 ),0) IMPORTE FROM DUAL';
     GetSQLStr(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'IMPORTE',vlImpABlq,False);
     IedIMP_A_BLOQUEAR.Text := vlImpABlq;
   end
   else IedIMP_A_BLOQUEAR.Text := '0';
end;

procedure TWCrRelCredCheq.FormShow(Sender: TObject);
begin
      // Pinta datos del panel
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_CREDITO.Control:=edID_CREDITO;
      Objeto.CUENTA_BANCO.Control:=edCUENTA_BANCO;
      Objeto.SECUENCIA.Control:=edSECUENCIA;
      Objeto.IMP_A_BLOQUEAR.Control:=IedIMP_A_BLOQUEAR;
      Objeto.IMP_MIN_DEPOSITO.Control:=IedIMP_MIN_DEPOSITO;
      Objeto.CTA_FIDEICOMISO.Control:=IedCTA_FIDEICOMISO;
      Objeto.B_DEPOSITO_APORT.Control:=chB_DEPOSITO_APORT;
      Objeto.DIA_RECEP_APORT.Control:=IedDIA_RECEP_APORT;
      Objeto.DIA_SOLIC_PAGO.Control:=IedDIA_SOLIC_PAGO;
      Objeto.B_MES_SIN_REC.Control:=chB_MES_SIN_REC;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USUA_ALTA;
      Objeto.F_MODIFICA.Control:=edF_MODIF;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USUA_MODIF;
      Objeto.SIT_REL_CRED.Control:=rgSIT_REL_CRED;
      Objeto.CVE_TIPO_RAMO.Control:=rgCVE_TIPO_RAMO;

      edID_CREDITO.Text := Objeto.BasicCred.ID_CREDITO.AsString;
      edCUENTA_BANCO.Text := Objeto.vgCtaBanco;
      edNOMBRE_TITULAR.Text := Objeto.vgNomTitular;

      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrRelCredCheq.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CREDITO.Control:=nil;
      Objeto.CUENTA_BANCO.Control:=nil;
      Objeto.SECUENCIA.Control:=nil;
      Objeto.IMP_A_BLOQUEAR.Control:=nil;
      Objeto.IMP_MIN_DEPOSITO.Control:=nil;
      Objeto.CTA_FIDEICOMISO.Control:=nil;
      Objeto.B_DEPOSITO_APORT.Control:=nil;
      Objeto.DIA_RECEP_APORT.Control:=nil;
      Objeto.DIA_SOLIC_PAGO.Control:=nil;
      Objeto.B_MES_SIN_REC.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
      Objeto.SIT_REL_CRED.Control:=nil;
      Objeto.CVE_TIPO_RAMO.Control:=nil;
end;

procedure TWCrRelCredCheq.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrRelCredCheq.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.ID_CREDITO.GetFromControl;
   rgSIT_REL_CRED.ItemIndex := 0;
   rgCVE_TIPO_RAMO.ItemIndex := 0;
   StpObtImpABloquear(Objeto.vgIdCredito);
   Objeto.IMP_MIN_DEPOSITO.AsFloat := 0;
   Objeto.DIA_RECEP_APORT.AsInteger := 0;
   Objeto.DIA_SOLIC_PAGO.AsInteger := 0;
   Objeto.ID_CREDITO.AsString:= Objeto.BasicCred.ID_CREDITO.AsString;
   Objeto.ID_BANCO_CHQRA.AsString:= Objeto.vgBanco;
   Objeto.CUENTA_BANCO.AsString:= Objeto.vgCtaBanco;
   Objeto.SECUENCIA.AsInteger := Objeto.ObtNumSecuencia + 1;
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   edCUENTA_BANCO.Text := Objeto.vgCtaBanco;
   Objeto.B_ACTIVA_BUSQ.AsString := 'F';
   Objeto.B_BLOQUEADA .AsString := 'F';
   Objeto.DIA_RECEP_APORT.AsInteger := 10;
   rgCVE_TIPO_RAMO.SetFocus;

end;

procedure TWCrRelCredCheq.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   StpObtImpABloquear(Objeto.vgIdCredito);
   edSECUENCIA.SetFocus;
end;

procedure TWCrRelCredCheq.IedIMP_A_BLOQUEARExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMesg    :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMesg   := CNULL;
      vlSalida := True;
      Objeto.IMP_A_BLOQUEAR.GetFromControl;
      if Objeto.IMP_A_BLOQUEAR.AsFloat < 0 then
      Begin
         vlSalida  := False;
         vlMesg    := 'El importe no puede ser negativo';
      end;
      InterForma1.ValidaExit(IedIMP_A_BLOQUEAR,VLSalida,VLMesg,True);
   end;
end;

procedure TWCrRelCredCheq.IedIMP_MIN_DEPOSITOExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMesg    :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMesg   := CNULL;
      vlSalida := True;
      Objeto.IMP_MIN_DEPOSITO.GetFromControl;
      if Objeto.IMP_MIN_DEPOSITO.AsFloat < 0 then
      Begin
         vlSalida  := False;
         vlMesg    := 'El importe no puede ser negativo';
      end;
      InterForma1.ValidaExit(IedIMP_MIN_DEPOSITO,VLSalida,VLMesg,True);
   end;
end;

procedure TWCrRelCredCheq.IedDIA_RECEP_APORTExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMesg    :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMesg   := CNULL;
      vlSalida := True;
      objeto.B_DEPOSITO_APORT.GetFromControl;
      Objeto.DIA_RECEP_APORT.GetFromControl;
      if objeto.B_DEPOSITO_APORT.AsString = 'V' then Begin
        if Objeto.DIA_RECEP_APORT.AsInteger <= 0 then
        Begin
           vlSalida  := False;
           vlMesg    := 'Favo de indicar un día de recepción de pago';
        end;
        if Objeto.DIA_RECEP_APORT.AsInteger > 31 then
        Begin
           vlSalida  := False;
           vlMesg    := 'El día no puede mayor a 31';
        end;
        InterForma1.ValidaExit(IedDIA_RECEP_APORT,VLSalida,VLMesg,True);
      end;
   end;
end;

procedure TWCrRelCredCheq.IedDIA_SOLIC_PAGOExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMesg    :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMesg   := CNULL;
      vlSalida := True;
      Objeto.DIA_SOLIC_PAGO.GetFromControl;
      if Objeto.DIA_SOLIC_PAGO.AsInteger < 0 then
      Begin
         vlSalida  := False;
         vlMesg    := 'El día no puede ser negativo';
      end;
      if Objeto.DIA_SOLIC_PAGO.AsInteger > 31 then
      Begin
         vlSalida  := False;
         vlMesg    := 'El día no puede mayor a 31';
      end;
      InterForma1.ValidaExit(IedDIA_SOLIC_PAGO,VLSalida,VLMesg,True);
   end;
end;

procedure TWCrRelCredCheq.IedCTA_FIDEICOMISOExit(Sender: TObject);
Begin
     InterForma1.ValidaExit(IedCTA_FIDEICOMISO,True,'',True);
end;

procedure TWCrRelCredCheq.chB_DEPOSITO_APORTExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_DEPOSITO_APORT,True,'',True);
end;

procedure TWCrRelCredCheq.chB_MES_SIN_RECExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_MES_SIN_REC,True,'',True);
end;

procedure TWCrRelCredCheq.rgCVE_TIPO_RAMOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_TIPO_RAMO,True,'',True);
end;

procedure TWCrRelCredCheq.rgSIT_REL_CREDExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_REL_CRED,True,'',True);
end;

procedure TWCrRelCredCheq.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   if IsNewData then    //nuevo
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guradar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
         if  not ( Objeto.ActSecuencia(Objeto.ID_CREDITO.AsInteger, Objeto.CUENTA_BANCO.AsString, edSECUENCIA.Text)) then
           Realizado := False
         else
           Realizado := True;
      end
      else Realizado := False;
   end;

   if chB_MES_SIN_REC.Checked then
   Begin
     ShowMessage('Favor de indicar los meses de excepción de envío de recursos');
     ConfigMesExcep;
     btMESES_EXCEP.Enabled := True;
   end
   else Begin
     btMESES_EXCEP.Enabled := False;
   end;
end;

Procedure TWCrRelCredCheq.ConfigMesExcep;
var  MesExcep : TCrMeSiRe;
begin
          MesExcep := TCrMeSiRe.Create(self);
          try
             MesExcep.Apli:= Objeto.Apli;
             MesExcep.ParamCre:=Objeto.ParamCre;
             Objeto.BasicCred.LlenaDatos(Objeto.ID_CREDITO.AsInteger);
             MesExcep.BasicCred := Objeto.BasicCred;
             MesExcep.vgBanco:= Objeto.ID_BANCO_CHQRA.AsString;
             MesExcep.vgNomBanco := Objeto.vlgBanco;
             MesExcep.vgCtaBanco:= Objeto.CUENTA_BANCO.AsString;
             MesExcep.vgNomTitular := Objeto.vgNomTitular;
             MesExcep.vgSecuencia := Objeto.SECUENCIA.AsString;
             MesExcep.BuscaWhereString := '  CR_MESES_SIN_REC.ID_CREDITO     = ' + Objeto.ID_CREDITO.AsString +
                                       ' AND CR_MESES_SIN_REC.ID_BANCO_CHQRA = ' + Objeto.ID_BANCO_CHQRA.AsString +
                                       ' AND CR_MESES_SIN_REC.CUENTA_BANCO   = ' + Objeto.CUENTA_BANCO.AsString +
                                       ' AND CR_MESES_SIN_REC.SECUENCIA      = ' + Objeto.SECUENCIA.AsString;
             MesExcep.FilterString := MesExcep.BuscaWhereString;
             MesExcep.Catalogo;
          finally
                 if MesExcep <> nil then
                    MesExcep.Free;
                 //end if
          end;
end;

procedure TWCrRelCredCheq.btMESES_EXCEPClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRRECRCH_MESEX',True,True) then
   begin
     if Objeto.Active then
        ConfigMesExcep
     else ShowMessage('No esiste resgistro Activo');
   end;  
end;

procedure TWCrRelCredCheq.InterForma1Buscar(Sender: TObject);
begin
   if Objeto.Busca then Begin
     if Objeto.B_MES_SIN_REC.AsString = 'V' then
       btMESES_EXCEP.Enabled := True
     else
       btMESES_EXCEP.Enabled := False;
   end;
end;

procedure TWCrRelCredCheq.MuestraDatos;
Var Qry         : TQuery;
    i,nRowCount : Integer;
    vlSql       : String;
begin
   with sgDATOS do
   begin
      ClearGrid(sgDATOS);
      Application.ProcessMessages;
      for i:= 0 to RowCount-1 do
         RemoveRow(Row);
      //end for
   end;
   Application.ProcessMessages;
// RABA ENE 2012
// SE AGREGA LA PALABRA DISTINCT PARA QUE DE LA TABLA CR_CRED_CHEQ SOLO TOME
// UNA CUENTA AUNQUE ESTE DADA DE ALTA PARA CADA EMISOR NAFIN QUE EL ACREDITADO
// TENGA DEFINIDO
//   vlsql := ' SELECT  CRCC.SECUENCIA, ' + coCRLF +
   vlsql := ' SELECT  DISTINCT CRCC.SECUENCIA, ' + coCRLF +
// FIN RABA
            '         CRCC.CUENTA_BANCO, ' + coCRLF +
            '         P.NOMBRE, ' + coCRLF +
            '         CRCC.SIT_REL_CRED, ' + coCRLF +
            '         CRCC.ID_BANCO_CHQRA ' + coCRLF +

            ' FROM CR_REL_CRED_CHEQ CRCC, ' + coCRLF +
            '      CR_CRED_CHEQ     CCC,  ' + coCRLF +
            '      PERSONA          P     ' + coCRLF +
            ' WHERE 1 = 1 ' + coCRLF ;

     if Objeto.vgIdCredito <> CNULL then
        vlsql := vlsql + ' AND CRCC.ID_CREDITO   =  ' + Objeto.vgIdCredito;
     //end if;

   vlsql := vlsql + '   AND CRCC.ID_CREDITO   = CCC.ID_CREDITO ' + coCRLF +
                    '   AND CRCC.CUENTA_BANCO = CCC.CUENTA_BANCO ' + coCRLF +
                    '   AND P.ID_PERSONA      = CCC.ID_TITULAR ' + coCRLF +
                    ' ORDER BY CRCC.SECUENCIA '+ coCRLF ;
  nRowCount := 0;
  with Objeto do
  Begin
    Qry := GetSQLQueryNoNil( vlSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
    if Assigned(Qry) and NOT( Qry.IsEmpty ) THEN
    begin
       while Not Qry.Eof Do
       begin
          with sgDATOS do
          begin
             //LLENA EL RENGLON
             Cells[C_SEC,nRowCount] := Qry.FieldByName('SECUENCIA').AsString;
             Cells[C_CHQ,nRowCount] := Qry.FieldByName('CUENTA_BANCO').AsString;
             Cells[C_TIT,nRowCount] := Qry.FieldByName('NOMBRE').AsString;
             Cells[C_SIT,nRowCount] := Qry.FieldByName('SIT_REL_CRED').AsString;
             Cells[C_BCO,nRowCount] := Qry.FieldByName('ID_BANCO_CHQRA').AsString;
             nRowCount := nRowCount + 1;     //Incrementa un reglon
          end;
          Qry.Next;
          sgDATOS.RowCount := nRowCount + 1;
          Application.ProcessMessages;
       end; //end While
    end;
  end;
  if Assigned(Qry) then
  begin
    Qry.Close;
    Qry.Free;
  end;
end;

procedure TWCrRelCredCheq.InterForma1DespuesShow(Sender: TObject);
begin
   MuestraDatos;
   StpObtImpABloquear(Objeto.vgIdCredito);
end;

procedure TWCrRelCredCheq.sgDATOSClick(Sender: TObject);
begin
   Objeto.FindKey([Objeto.vgIdCredito,sgDATOS.Cells[C_BCO,sgDATOS.Row],sgDATOS.Cells[C_CHQ,sgDATOS.Row]]);
   StpObtImpABloquear(Objeto.vgIdCredito);
end;

procedure TWCrRelCredCheq.ConsultaDepsitosalaVista1Click(Sender: TObject);
var  vlContrato         : String;
     vlPersona          : STring;
begin
     vlContrato := sgDATOS.Cells[C_CHQ,sgDATOS.Row];
     if ( vlContrato <> '' ) and ( Objeto.Contrato.FindKey( [ vlContrato ] )  ) then
     begin
        Objeto.ConTransa.Contrato := Objeto.Contrato;
        Objeto.ConTransa.Catalogo;

     end;
end;

procedure TWCrRelCredCheq.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraDatos;
end;

procedure TWCrRelCredCheq.InterForma1DespuesEliminar(Sender: TObject);
begin
   MuestraDatos; // LOLS 22 SEP 2005
end;

procedure TWCrRelCredCheq.InterForma1DespuesCancelar(Sender: TObject);
begin
   Objeto.FindKey([Objeto.vgIdCredito,sgDATOS.Cells[C_BCO,sgDATOS.Row],sgDATOS.Cells[C_CHQ,sgDATOS.Row]]);
   StpObtImpABloquear(Objeto.vgIdCredito);
end;

end.
