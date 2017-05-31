// Sistema         : Clase de CrAmMacro
// Fecha de Inicio : 06/05/2010
// Función forma   : Clase de CrAmMacro
// Desarrollo por  : Roberto Andres Silva Tello
// Diseñado por    : Roberto Andres Silva Tello
// Comentarios     : Macro Base
Unit IntCrAmMacro;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntSGCtrl,
IntLinkit, IntCrCto, IntPers, IntMPers,
IntMQrTasaActB, //Pronóstico de Adeudos
IntMQrTasaActF //Pronóstico de Adeudos tropicalizado

,IntHead, InterApl, IntGenCre
;

Type
 TCrAmMacro= class; 

  TWCrAmMacro=Class(TForm)
    InterForma1             : TInterForma; 
    edCAMPO1 : TEdit;
    secciones: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    sgDisposicion: TSGCtrl;
    sgBitacora: TSGCtrl;
    sgConcInv: TSGCtrl;
    sgOtrAdeu: TSGCtrl;
    sgSeguro: TSGCtrl;
    edFechaIniB: TEdit;
    edPromotor: TEdit;
    edPromotorO: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dtpFIniB: TDateTimePicker;
    Label6: TLabel;
    edFechaFinB: TEdit;
    dtpFFinB: TDateTimePicker;
    btnConsultarB: TButton;
    ilID_PROMOTORCI: TInterLinkit;
    btID_CREDITO: TBitBtn;
    btnConsultarC: TButton;
    btnConsultarO: TButton;
    btnConsultarS: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btnConsultarD: TButton;
    dtFCierre: TDateTimePicker;
    edPromotorS: TEdit;
    ilID_PROMOTORS: TInterLinkit;
    ilID_PROMOTORO: TInterLinkit;
    Label7: TLabel;
    TabSheet6: TTabSheet;
    Label8: TLabel;
    edPromotorSP: TEdit;
    BitBtn3: TBitBtn;
    btnConsultarSP: TButton;
    sgSeguroP: TSGCtrl;
    TabSheet7: TTabSheet;
    btnConsultaD: TButton;
    sgDemandas: TSGCtrl;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure dtpFIniBChange(Sender: TObject);
    procedure dtpFFinBChange(Sender: TObject);
    procedure btnConsultarBClick(Sender: TObject);
    procedure ilID_PROMOTORCIEjecuta(Sender: TObject);
    procedure btnConsultarCClick(Sender: TObject);
    procedure btnConsultarSClick(Sender: TObject);
    procedure btnConsultarOClick(Sender: TObject);
    procedure btnConsultarDClick(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ilID_PROMOTOROEjecuta(Sender: TObject);
    procedure ilID_PROMOTORSEjecuta(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnConsultarSPClick(Sender: TObject);
    procedure btnConsultaDClick(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrAmMacro;
    procedure Disposicion;
    procedure Bitacora;
    procedure ConcInversion;
    procedure OtrAdeudos;
    procedure Seguro;
    procedure SeguroP;
end;
 TCrAmMacro= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
         Contrato                 : TCrCto;
         Promotor                 : TMPersona;

        CAMPO1                   : TInterCampo;
        EdPromotor               : TInterCampo;
        EdPromotorO              : TInterCampo;
        EdPromotorS              : TInterCampo;

        Persona                  : TPersona; //Persona
        PersonaO                  : TPersona; //Persona
        PersonaS                  : TPersona; //Persona
        PersonaSP                  : TPersona; //Persona

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override; 
      published 
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrAmMacro.Create( AOwner : TComponent ); 
begin Inherited; 
      CAMPO1 :=CreaCampo('CAMPO1',ftString,tsNinguno,tsNinguno,False);
                CAMPO1.Caption:='Campo1';
                CAMPO1.Parametro:='CAMPO1';
      EdPromotor := CreaCampo('EdPromotor',ftString,tsNinguno,tsNinguno,False);
                EdPromotor.Caption:='EdPromotor';
                EdPromotor.Parametro:='EdPromotor';
      EdPromotorO:= CreaCampo('EdPromotorO',ftString,tsNinguno,tsNinguno,False);
                EdPromotorO.Caption:='EdPromotorO';
                EdPromotorO.Parametro:='EdPromotorO';
      EdPromotorS:= CreaCampo('EdPromotorS',ftString,tsNinguno,tsNinguno,False);
                EdPromotorS.Caption:='EdPromotorS';
                EdPromotorS.Parametro:='EdPromotorS';

      Persona := TPersona.Create(Self);
      Persona.MasterSource:=Self;
      PersonaO := TPersona.Create(Self);
      PersonaO.MasterSource:=Self;
      PersonaS := TPersona.Create(Self);
      PersonaS.MasterSource:=Self;
      PersonaSP := TPersona.Create(Self);
      PersonaSP.MasterSource:=Self;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrAmMacro.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrAmMacro.Destroy;
begin
  if Persona <> nil then
      Persona.Free;
  inherited;
end;


function TCrAmMacro.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAmMacro;
begin
   W:=TWCrAmMacro.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.ShowBtnAceptar := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrAmMacro.InternalBusca:Boolean;
begin
end;

function TCrAmMacro.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CrAmMacro********************)
(*                                                                              *)
(*  FORMA DE CrAmMacro                                                            *)
(*                                                                              *)
(***********************************************FORMA CrAmMacro********************)

procedure TWCrAmMacro.FormShow(Sender: TObject);
begin
  dtFCierre.DateTime := Date;
  dtpFIniB.DateTime := Date;
  dtpFFinB.DateTime := Date;
  Objeto.CAMPO1.Control:=edCAMPO1;
  Objeto.Persona.ID_PERSONA.Control := edPromotor;
  Objeto.PersonaO.ID_PERSONA.Control := edPromotorO;
  Objeto.PersonaS.ID_PERSONA.Control := edPromotorS;
  Objeto.PersonaSP.ID_PERSONA.Control := edPromotorSP;
end;

procedure TWCrAmMacro.FormDestroy(Sender: TObject);
begin
  Objeto.CAMPO1.Control:=nil;
  Objeto.Persona.ID_PERSONA.Control := nil;
  Objeto.PersonaO.ID_PERSONA.Control := nil;
  Objeto.PersonaS.ID_PERSONA.Control := nil;
  Objeto.PersonaSP.ID_PERSONA.Control := nil;
end;

procedure TWCrAmMacro.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrAmMacro.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrAmMacro.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrAmMacro.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWCrAmMacro.Disposicion;
Var
  vlSQL : String;
  vgQryDisposicion : TQuery;
  vlQry : TQuery;
  i,rows : Integer;
  BNivela      : String;
  fecha        : String;
  RProAdeu     : TQrTasaActB;
  RTrop     : TQrTasaActF;
  idcredito : String;
  sTemp:String;
  vlIMPORTE : Real;
  vlTIPO_CAMBIO_UDIS : Real;
  importe : Real;
  fecha2        : String;
  rVal1, rVal2 : Real;
  stpGeneraSaldos : TStoredProc;
begin
  //Genera los saldos
  //--> **MAGV  20110202
  stpGeneraSaldos := TStoredProc.Create(Nil);
  If Assigned(stpGeneraSaldos) Then
  begin
     With stpGeneraSaldos Do
     Try
        DatabaseName := Objeto.Apli.DataBaseName;
        SessionName  := Objeto.Apli.SessionName;
        StoredProcName := 'PKGPROADEUSDO_BIS.STPOBTIENESALDOSAGRO';
        Params.CreateParam(ftDate,  'peFecha',ptInput);
        Params.CreateParam(ftDate,  'peIter',ptInput);
        Prepare;
        ParamByName('peFecha').AsDateTime :=  dtFCierre.date;
        ParamByName('peIter').AsInteger :=  0;
        ExecProc;
     Finally
        Close;
        Params.Clear;
        Free;
     End;
  end;
  //<-- **MAGV  20110202
  
  //Ejecuta la consulta general
  sgDisposicion.Clear('NO EXISTEN DATOS'#30'>C');
  vlSQL :=
' select a.ID_CREDITO, ' + coCRLF +
'        po.DESC_POBLACION EDOREP, ' + coCRLF +
'        p.ID_PERSONA, ' + coCRLF +
'        p.NOMBRE, ' + coCRLF +
'        pr.CVE_PRODUCTO_CRE, ' + coCRLF +
'        pr.DESC_L_PRODUCTO, ' + coCRLF +
'        c.ID_CONTRATO, ' + coCRLF +
'        cc.F_ALTA F_SUSCRIPCION, ' + coCRLF +
'        cc.F_VENCIMIENTO F_VENCIMIENTO, ' + coCRLF +
'        to_char(CC.IMP_AUTORIZADO,''9,999,999,999.99'') IMP_CONTRATO, ' + coCRLF +
'        cc.DIAS_PLAZO, ' + coCRLF +
'        cc.ID_PROM_ADMON ID_PROMOTOR, ' + coCRLF +
'        (select Nombre ' + coCRLF +
'         from   Persona per ' + coCRLF +
'         where  per.ID_PERSONA = cc.ID_PROM_ADMON) NombrePromotor, ' + coCRLF +
'        (select dcto.id_contrato as contratoDV ' + coCRLF +
'         from   cr_acreditado ca, ' + coCRLF +
'                contrato cto, ' + coCRLF +
'                dv_contrato dcto ' + coCRLF +
'         where  cto.id_titular = ca.id_acreditado and cto.id_contrato = dcto.id_contrato and ca.id_acreditado = p.ID_PERSONA and rownum = 1) CONTRATODV, ' + coCRLF +
'        to_char((select sdo_efe_virt as saldoDV ' + coCRLF +
'         from   cr_acreditado ca, ' + coCRLF +
'                contrato cto, ' + coCRLF +
'                dv_contrato dcto ' + coCRLF +
'         where  cto.id_titular = ca.id_acreditado and cto.id_contrato = dcto.id_contrato and ca.id_acreditado = p.ID_PERSONA and rownum = 1),''9,999,999,999.99'') SALDODV, ' + coCRLF +
'        (select min (f_vencimiento) as f_vencimiento ' + coCRLF +
'         from   (select   id_credito, ' + coCRLF +
'                          min (f_vencimiento) as f_vencimiento ' + coCRLF +
'                 from     cr_capital ' + coCRLF +
'                 where    f_vencimiento >  ' + SQLFecha(dtFCierre.date) + ' ' + coCRLF +
'                 group by id_credito) ' + coCRLF +
'         where  id_credito = c.id_credito) VENCTOCAP, ' + coCRLF +
'        a.ID_CRED_FIRA_N, ' + coCRLF +
'        a.NUM_CONTROL_FIRA, ' + coCRLF +
'        a.ID_DESPACHO, ' + coCRLF +
'        (select Nombre ' + coCRLF +
'         from   Persona per ' + coCRLF +
'         where  per.ID_PERSONA = a.ID_DESPACHO) NombreDespacho, ' + coCRLF +
'        to_char(c.IMP_CREDITO,''9,999,999,999.99'') IMP_CREDITO, ' + coCRLF +
'        c.F_INICIO, ' + coCRLF +
'        c.F_VENCIMIENTO F_VEN_CRED, ' + coCRLF +
'        (select case ' + coCRLF +
'                  when cre.operador_stasa = ''*'' then cre.tasa_credito / cre.sobretasa ' + coCRLF +
'                  when cre.operador_stasa = ''+'' then cre.tasa_credito - cre.sobretasa ' + coCRLF +
'                  when cre.operador_stasa = ''%'' then cre.tasa_credito * cre.sobretasa ' + coCRLF +
'                  when cre.operador_stasa = ''-'' then cre.tasa_credito + cre.sobretasa ' + coCRLF +
'                  else -1.11 ' + coCRLF +
'                end as tasa ' + coCRLF +
'         from   cr_credito cre ' + coCRLF +
'         where  cre.id_credito = c.ID_CREDITO) as TasaFondeo, ' + coCRLF +
'        c.SOBRETASA MARGENINTER, ' + coCRLF +
'        c.TASA_CREDITO TasaCliente, ' + coCRLF +
'        (select cuenta_banco ' + coCRLF +
'         from   cr_cred_cheq crec ' + coCRLF +
'         where  crec.id_credito = c.ID_CREDITO and rownum = 1) CLABE_DESTINO, ' + coCRLF +
'        ( ' + coCRLF +
'         nvl ( (select p.nombre ' + coCRLF +
'                from   cr_cred_cheq ccc, ' + coCRLF +
'                       persona p ' + coCRLF +
'                where  ccc.cve_tipo_acred = ''AC'' and ccc.cve_tipo_cheq = ''LQ'' and ccc.b_predeterminada = ''V'' and ccc.id_banco_chqra = p.id_persona and id_credito = c.ID_CREDITO), ' + coCRLF +
'           (select p.nombre ' + coCRLF +
'            from   cr_cred_cheq ccc, ' + coCRLF +
'                   cr_credito cred, ' + coCRLF +
'                   contrato cto, ' + coCRLF +
'                   persona p ' + coCRLF +
'            where  ccc.cve_tipo_acred = ''AC'' ' + coCRLF +
'            and    ccc.cve_tipo_cheq = ''LQ'' ' + coCRLF +
'            and    ccc.b_predeterminada = ''V'' ' + coCRLF +
'            and    ccc.id_acreditado = cto.id_titular ' + coCRLF +
'            and    cto.id_contrato = cred.id_contrato ' + coCRLF +
'            and    ccc.id_banco_chqra = p.id_persona ' + coCRLF +
'            and    rownum = 1 ' + coCRLF +
'            and    cred.id_credito = c.ID_CREDITO) ) ) BANCO_DESTINO, ' + coCRLF +
'        to_char((c.IMP_CREDITO * (select distinct ga.pct_gtia_liq ' + coCRLF +
'                          from            cr_ga_fira_cto ga ' + coCRLF +
'                          where           cc.id_contrato = ga.id_contrato and sit_ga_fira = ''AC'' and rownum = 1) / 100),''9,999,999,999.99'') mGtiaLiqO, ' + coCRLF +
'        (select ga.pct_gtia_liq ' + coCRLF +
'         from   cr_ga_fira_cto ga ' + coCRLF +
'         where  ga.id_contrato = cc.id_contrato and rownum = 1) pcGtiaLiqO, ' + coCRLF +
'        to_char((select sum (imp_saldo) as imp_bloq ' + coCRLF +
'         from   (select (cbt.imp_saldo * decode (cbt.tipo_afectacion, ''I'', 1, -1) ) as imp_saldo, ' + coCRLF +
'                        ccr.id_credito ' + coCRLF +
'                 from   (select cbt.id_credito, ' + coCRLF +
'                                tipo_afectacion, ' + coCRLF +
'                                imp_saldo ' + coCRLF +
'                         from   cr_blq_transac cbt, ' + coCRLF +
'                                cr_blq_operacion cbo, ' + coCRLF +
'                                cr_blq_concepto cbc ' + coCRLF +
'                         where  cbo.cve_blq_operacion = cbt.cve_blq_operacion ' + coCRLF +
'                         and    cbt.sit_trans_bloq not in (''PA'', ''ER'') ' + coCRLF +
'                         and    cbc.cve_blq_cpto = cbt.cve_blq_cpto ' + coCRLF +
      //HERJA 08.09.2010
'		          AND    CBT.SIT_TRANS_BLOQ IN (''AC'') ' + coCRLF +
'			  AND    CBT.ID_TRANS_CANCELA IS NULL ' + coCRLF +
      //FIN HERJA 08.09.2010
'                         and    cbc.cve_blq_cpto in (''BLGTIA'', ''BLPRLV'', ''SUSTGT'') ) cbt, ' + coCRLF +
'                        cr_credito ccr, ' + coCRLF +
'                        cr_contrato con, ' + coCRLF +
'                        cr_producto cp ' + coCRLF +
'                 where  ccr.id_credito = cbt.id_credito and con.id_contrato = ccr.id_contrato and cp.cve_producto_cre = con.cve_producto_cre) ' + coCRLF +
'         where  id_credito = c.ID_CREDITO),''9,999,999,999.99'') ImpGtiaLiqActt, ' + coCRLF +
'        ( ' + coCRLF +
'         case ' + coCRLF +
'           when c.sdo_insoluto = 0 then ''-'' ' + coCRLF +
'           else to_char ( ( ' + coCRLF +
'                    100 ' + coCRLF +
'                  * (select sum (imp_saldo) as imp_bloq ' + coCRLF +
'                     from   (select (cbt.imp_saldo * decode (cbt.tipo_afectacion, ''I'', 1, -1) ) as imp_saldo, ' + coCRLF +
'                                    ccr.id_credito ' + coCRLF +
'                             from   (select cbt.id_credito, ' + coCRLF +
'                                            tipo_afectacion, ' + coCRLF +
'                                            imp_saldo ' + coCRLF +
'                                     from   cr_blq_transac cbt, ' + coCRLF +
'                                            cr_blq_operacion cbo, ' + coCRLF +
'                                            cr_blq_concepto cbc ' + coCRLF +
'                                     where  cbo.cve_blq_operacion = cbt.cve_blq_operacion ' + coCRLF +
'                                     and    cbt.sit_trans_bloq not in (''PA'', ''ER'') ' + coCRLF +
'                                     and    cbc.cve_blq_cpto = cbt.cve_blq_cpto ' + coCRLF +
'                                     and    cbc.cve_blq_cpto in (''BLGTIA'', ''BLPRLV'', ''SUSTGT'') ) cbt, ' + coCRLF +
'                                    cr_credito ccr, ' + coCRLF +
'                                    cr_contrato con, ' + coCRLF +
'                                    cr_producto cp ' + coCRLF +
'                             where  ccr.id_credito = cbt.id_credito and con.id_contrato = ccr.id_contrato and cp.cve_producto_cre = con.cve_producto_cre) ' + coCRLF +
'                     where  id_credito = c.ID_CREDITO) ' + coCRLF +
'                  / c.sdo_insoluto), ' + coCRLF +
'                 ''9,999.99'') ' + coCRLF +
'         end) pctGtiaLiqActt, ' + coCRLF +
'        (case ' + coCRLF +
'           when a.tipo_poliza = ''AN'' then ''ANUAL'' ' + coCRLF +
'           when a.tipo_poliza = ''MU'' then ''MULTIANUAL'' ' + coCRLF +
'         end) TipoPoliza, ' + coCRLF +
'        a.ASEGURADORA, ' + coCRLF +
'        to_char(a.IMP_FND_CONT_ORIG,''9,999,999,999.99'') IMP_FND_CONT_ORIG, ' + coCRLF +

'        to_char((select sum (imp_saldo) as imp_bloq ' + coCRLF +
'        from   (select cc.id_credito, ' + coCRLF +
'                       cp.cve_producto_gpo, ' + coCRLF +
'                       co.cve_producto_cre, ' + coCRLF +
'                       cp.desc_c_producto, ' + coCRLF +
'                       cbt.id_blq_transac, ' + coCRLF +
'                       cbt.cve_blq_cpto, ' + coCRLF +
'                       cbt.cve_blq_operacion, ' + coCRLF +
'                       cbt.id_contrato_dv, ' + coCRLF +
'                       (cbt.imp_saldo * decode (cbt.tipo_afectacion, ''I'', 1, -1) ) as imp_saldo, ' + coCRLF +
'                       cbt.fh_activacion, ' + coCRLF +
'                       cbt.cve_usu_activacion, ' + coCRLF +
'                       cbt.desc_blq_cpto, ' + coCRLF +
'                       cbt.tipo_afectacion ' + coCRLF +
'                from   (select cbt.*, ' + coCRLF +
'                               cbo.tipo_afectacion, ' + coCRLF +
'                               cbc.desc_blq_cpto ' + coCRLF +
'                        from   cr_blq_transac cbt, ' + coCRLF +
'                               cr_blq_operacion cbo, ' + coCRLF +
'                               cr_blq_concepto cbc ' + coCRLF +
'                        where  cbo.cve_blq_operacion = cbt.cve_blq_operacion ' + coCRLF +
'                        and    cbt.sit_trans_bloq not in (''PA'', ''ER'') ' + coCRLF +
'                        and    cbc.cve_blq_cpto = cbt.cve_blq_cpto ' + coCRLF +
'                        and    cbc.cve_blq_cpto in (''BLSEGU'') ) cbt, ' + coCRLF +
'                       cr_credito cc, ' + coCRLF +
'                       cr_contrato co, ' + coCRLF +
'                       cr_producto cp ' + coCRLF +
'                where  cc.id_credito = cbt.id_credito and co.id_contrato = cc.id_contrato and cp.cve_producto_cre = co.cve_producto_cre) ' + coCRLF +
'        where  id_credito = c.id_credito),''9,999,999,999.99'') IMP_FND_CONT_ACT, ' + coCRLF +

'        to_char(a.GAR_FIDUC_ORIG,''9,999,999,999.99'') GAR_FIDUC_ORIG, ' + coCRLF +
'        (100 * a.GAR_FIDUC_ORIG / c.IMP_CREDITO) PCT_GAR_FIDUC_ORIG, ' + coCRLF +
'        to_char(a.GAR_FIDUC_ACT,''9,999,999,999.99'') GAR_FIDUC_ACT, ' + coCRLF +
'        (100 * a.GAR_FIDUC_ACT / c.IMP_CREDITO) PCT_GAR_FIDUC_ACT, ' + coCRLF +
'        NOM_FIDEICOM, ' + coCRLF +
'        NUM_FIDEICOM, ' + coCRLF +
'        NOM_FIDUC, ' + coCRLF +
'        B_GAR_HIPO, ' + coCRLF +
//Vigentes **MAGV  20110202
'        to_char(nvl(sdos.SDO_CAP_ACTUAL,0),''9,999,999,999.99'') as SDO_CAP_ACTUAL, ' + coCRLF +
'        to_char(nvl(sdos.SDO_FINAN_ADIC,0),''9,999,999,999.99'') as SDO_FINAN_ADIC, ' + coCRLF +
'        to_char(nvl(sdos.IMP_INT,0)+nvl(sdos.IMP_INT_IVA,0),''9,999,999,999.99'') as IMP_INT, ' + coCRLF +
'        to_char(nvl(sdos.COMISION,0)+nvl(sdos.COMISION_IVA,0),''9,999,999,999.99'') as SDO_CUOTA_FEGA, ' + coCRLF +
'        to_char(nvl(sdos.SEGURO,0)+nvl(sdos.SEGURO_VIDA,0),''9,999,999,999.99'') as SEGURO, ' + coCRLF +
'        to_char(nvl(sdos.SDO_CAP_ACTUAL,0) + nvl(sdos.SDO_FINAN_ADIC,0) + nvl(sdos.IMP_INT,0) + nvl(sdos.IMP_INT_IVA,0) + ' + coCRLF +
'        nvl(sdos.COMISION,0)+nvl(sdos.COMISION_IVA,0) + nvl(sdos.SEGURO,0) + nvl(sdos.SEGURO_VIDA,0),''9,999,999,999.99'') as TOTAL_VIGENTE, ' + coCRLF +
//Vencidos **MAGV  20110202
'        to_char(nvl(sdos.SDO_CAP_VENCIDO,0),''9,999,999,999.99'') as SDO_CAP_VENCIDO, ' + coCRLF +
'        to_char(nvl(sdos.MORA_CAP_VENCIDO,0)+nvl(sdos.MORA_CAP_VENCIDO_IVA,0),''9,999,999,999.99'') as MORA_CAP_VENCIDO, ' + coCRLF +
'        to_char(nvl(sdos.SDO_FINAN_ADIC_VDO,0),''9,999,999,999.99'') as SDO_FINAN_ADIC_VDO, ' + coCRLF +
'        to_char(nvl(sdos.MORA_FINAN_ADIC_VDO,0)+nvl(sdos.MORA_FINAN_ADIC_VDO_IVA,0),''9,999,999,999.99'') as MORA_FINAN_ADIC_VDO, ' + coCRLF +
'        to_char(nvl(sdos.IMP_INT_VDO,0)+nvl(sdos.IMP_INT_VDO_IVA,0),''9,999,999,999.99'') as IMP_INT_VDO, ' + coCRLF +
'        to_char(nvl(sdos.MORA_INT_VDO,0)+nvl(sdos.MORA_INT_VDO_IVA,0),''9,999,999,999.99'') as MORA_INT_VDO, ' + coCRLF +
'        to_char(nvl(sdos.SDO_CUOTA_FEGA_VDO,0)+nvl(sdos.SDO_CUOTA_FEGA_VDO_IVA,0),''9,999,999,999.99'') as SDO_CUOTA_FEGA_VDO, ' + coCRLF +
'        to_char(nvl(sdos.MORA_CUOTA_FEGA_VDO,0)+nvl(sdos.MORA_CUOTA_FEGA_VDO_IVA,0),''9,999,999,999.99'') as MORA_CUOTA_FEGA_VDO, ' + coCRLF +
'        to_char(nvl(sdos.SEGURO_VDO,0)+nvl(sdos.SEGURO_VIDA_VDO,0),''9,999,999,999.99'') as SEGURO_VDO, ' + coCRLF +
'        to_char(nvl(sdos.MORA_SEGURO_VDO,0)+nvl(sdos.MORA_SEGURO_VDO_IVA,0),''9,999,999,999.99'') as MORA_SEGURO_VDO, ' + coCRLF +
//-> **MAGV 20110504
'        to_char(nvl(sdos.ADEUDOS_BINTER,0),''9,999,999,999.99'') as OTROS_ADEUDOS_BINTER, ' + coCRLF +
'        to_char(nvl(sdos.ADEUDOS_FIRA,0),''9,999,999,999.99'') as OTROS_ADEUDOS_FIRA, ' + coCRLF +
//Total Vencido **MAGV  20110202
'        to_char(nvl(sdos.SDO_CAP_VENCIDO,0) + nvl(sdos.MORA_CAP_VENCIDO,0) + nvl(sdos.MORA_CAP_VENCIDO_IVA,0) + ' + coCRLF +
'        nvl(sdos.SDO_FINAN_ADIC_VDO,0) + nvl(sdos.MORA_FINAN_ADIC_VDO,0) + nvl(sdos.MORA_FINAN_ADIC_VDO_IVA,0) + ' + coCRLF +
'        nvl(sdos.IMP_INT_VDO,0) + nvl(sdos.IMP_INT_VDO_IVA,0) + ' + coCRLF +
'        nvl(sdos.MORA_INT_VDO,0) + nvl(sdos.MORA_INT_VDO_IVA,0) + ' + coCRLF +
'        nvl(sdos.SDO_CUOTA_FEGA_VDO,0) + nvl(sdos.SDO_CUOTA_FEGA_VDO_IVA,0) + ' + coCRLF +
'        nvl(sdos.MORA_CUOTA_FEGA_VDO,0) + nvl(sdos.MORA_CUOTA_FEGA_VDO_IVA,0) + ' + coCRLF +
'        nvl(sdos.SEGURO_VDO,0) + nvl(sdos.SEGURO_VIDA_VDO,0) + nvl(sdos.MORA_SEGURO_VDO,0) + nvl(sdos.MORA_SEGURO_VDO_IVA,0) + ' + coCRLF +
'        nvl(sdos.ADEUDOS_BINTER,0) + nvl(sdos.ADEUDOS_FIRA,0),''9,999,999,999.99'') as TOTAL_VENCIDO, ' + coCRLF +
//Total vigente + vencido **MAGV  20110202
'        to_char(nvl(sdos.SDO_CAP_ACTUAL,0) + nvl(sdos.SDO_FINAN_ADIC,0) + nvl(sdos.IMP_INT,0) + nvl(sdos.IMP_INT_IVA,0) + ' + coCRLF +
'        nvl(sdos.SDO_CUOTA_FEGA,0) + nvl(sdos.SEGURO,0) + nvl(sdos.SEGURO_VIDA,0) +  ' + coCRLF +
'        nvl(sdos.SDO_CAP_VENCIDO,0) + nvl(sdos.MORA_CAP_VENCIDO,0) + nvl(sdos.MORA_CAP_VENCIDO_IVA,0) + ' + coCRLF +
'        nvl(sdos.SDO_FINAN_ADIC_VDO,0) + nvl(sdos.MORA_FINAN_ADIC_VDO,0) + nvl(sdos.MORA_FINAN_ADIC_VDO_IVA,0) + ' + coCRLF +
'        nvl(sdos.IMP_INT_VDO,0) + nvl(sdos.IMP_INT_VDO_IVA,0) + ' + coCRLF +
'        nvl(sdos.MORA_INT_VDO,0) + nvl(sdos.MORA_INT_VDO_IVA,0) + ' + coCRLF +
'        nvl(sdos.SDO_CUOTA_FEGA_VDO,0) + nvl(sdos.SDO_CUOTA_FEGA_VDO_IVA,0) + ' + coCRLF +
'        nvl(sdos.MORA_CUOTA_FEGA_VDO,0) + nvl(sdos.MORA_CUOTA_FEGA_VDO_IVA,0) + ' + coCRLF +
'        nvl(sdos.SEGURO_VDO,0) + nvl(sdos.SEGURO_VIDA_VDO,0) + nvl(sdos.MORA_SEGURO_VDO,0) + nvl(sdos.MORA_SEGURO_VDO_IVA,0) + ' + coCRLF +
'        nvl(sdos.ADEUDOS_BINTER,0) + nvl(sdos.ADEUDOS_FIRA,0),''9,999,999,999.99'') as TOTAL_VIGENTE_VENCIDO, ' + coCRLF +
//<- **MAGV 20110504
//continua...
'        (select nvl(floor(sysdate - f_vencimiento),0) as dias_vdo from ( ' + coCRLF +
'           select id_credito, min(f_vencimiento) as f_vencimiento from cr_capital ' + coCRLF +
'           where f_vencimiento < ' + SQLFecha(dtFCierre.date) + ' ' + coCRLF +
'         	and 	sit_capital = ''IM'' ' + coCRLF +
'         	group by id_credito ' + coCRLF +
'         )where id_credito = c.id_credito) as DIAS_VENCIDO, ' + coCRLF +
'        (select cve_clas_cred ' + coCRLF +
'         from   (select   id_credito, ' + coCRLF +
'                          cve_clas_cred ' + coCRLF +
'                 from     CR_AM_BITACORA ' + coCRLF +
'                 order by id_credito, ' + coCRLF +
'                          f_evento desc) ' + coCRLF +
'         where  id_credito = c.id_credito and rownum = 1) CVE_CLAS_CRED, ' + coCRLF +
'        (select cd.desc_clas_cred ' + coCRLF +
'         from   (select   id_credito, ' + coCRLF +
'                          cve_clas_cred ' + coCRLF +
'                 from     CR_AM_BITACORA ' + coCRLF +
'                 order by id_credito, ' + coCRLF +
'                          f_evento desc) cv, ' + coCRLF +
'         			 cr_clas_cred cd ' + coCRLF +
'         where  cv.cve_clas_cred =  cd.cve_clas_cred ' + coCRLF +
'         and		 id_credito = c.id_credito and rownum = 1) CLAS_CRED, ' + coCRLF +
'        (select pct_gtia_fega_no ' + coCRLF +
'         from   cr_ga_fira_cto ga, ' + coCRLF +
'                cr_credito cre, ' + coCRLF +
'                cr_fira_equiv cfe ' + coCRLF +
'         where  cre.id_contrato = ga.id_contrato and ga.cve_operativa = cfe.cve_operativa and sit_ga_fira = ''AC'' and cre.id_credito = c.id_credito and rownum = 1) GTA_FEGA_PCT_NOM, ' + coCRLF +
'        a.GAR_FONAGA_PCT, ' + coCRLF +
'        a.ID_CRED_FIRA_GAR, ' + coCRLF +
'        a.STATUS, ' + coCRLF +
'        a.F_PAGO_GAR_FIRA, ' + coCRLF +
'        to_char(a.IMP_GAR_FIRA,''9,999,999,999.99'') IMP_GAR_FIRA, ' + coCRLF +
'        to_char(a.IMP_MNTO_REC,''9,999,999,999.99'') IMP_MNTO_REC, ' + coCRLF +
'        to_char(a.IMP_REC_GAR_FIRA,''9,999,999,999.99'') GAR_FIR_SDO_RECUPERAR, ' + coCRLF +
'        a.CVE_CPGARF CveCauFira, ' + coCRLF +
'        (select Desc_cpgarf ' + coCRLF +
'         from   CR_CPGARF cp ' + coCRLF +
'         where  cp.CVE_CPGARF = a.CVE_CPGARF) DescCausaGtiaFira, ' + coCRLF +
'        a.CVE_SPGARF SubCveGtiaFira, ' + coCRLF +
'        (select Desc_spgarf ' + coCRLF +
'         from   CR_SPGARF cp ' + coCRLF +
'         where  cp.CVE_SPGARF = a.CVE_CPGARF and cp.SUBCVE_SPGARF = a.CVE_SPGARF) DescSubCausa, ' + coCRLF +
'        a.CVE_VIAREC CveRecGtiaFira, ' + coCRLF +
'        (select Desc_viarec ' + coCRLF +
'         from   CR_VIAREC cp ' + coCRLF +
'         where  cp.CVE_VIAREC = a.CVE_VIAREC) DescViaRec, ' + coCRLF +
'        a.F_ENV_RECUP, ' + coCRLF +
'        a.F_ENVIO_CC, ' + coCRLF +
'        a.F_ACUSE_CC, ' + coCRLF +
'        a.RES_DICT, ' + coCRLF +
'        a.PCT_COB_NOM, ' + coCRLF +
'        a.PCT_COB_EFEC, ' + coCRLF +
//'        a.B_GAR_VIGENTE, ' + coCRLF +
//-->**MAGV  20110202
'        sdos.estrato as ESTRATO, ' + coCRLF +
//'        -1 as ESTRATO, ' + coCRLF +
//<-- **MAGV  20110202
'        a.F_VEN_GAR_FIRA, ' + coCRLF +
'        a.F_RESC_GAR_FIRA, ' + coCRLF +
'        a.F_CAST_FIRA, ' + coCRLF +
'        a.F_LIM_ENTRG_INF, ' + coCRLF +
'        a.F_DICT_INCOBR, ' + coCRLF +
'        a.F_SOL_CAST_FIRA, ' + coCRLF +
'        a.F_LIM_INI_AC_JUD, ' + coCRLF +
'        a.F_PRESEN_DMDA, ' + coCRLF +
'        a.F_LIM_PRSTN_P_R, ' + coCRLF +
'        a.F_PROG_RECUP, ' + coCRLF +
'        (select siglas_rfc || f_rfc || homoclave_rfc as rfc ' + coCRLF +
'         from   rfc ' + coCRLF +
'         where  id_persona = p.ID_PERSONA) RFC, ' + coCRLF +
'        (dom.calle_numero) DOMICILIO1, ' + coCRLF +
'        dom.colonia COLONIA1, ' + coCRLF +
'        dom.estado ESTADO1, ' + coCRLF +
'        dom.ciudad CIUDAD1, ' + coCRLF +
'        dom.codigo_postal CODIGO_POSTAL1, ' + coCRLF +
'        (select telef_casa as telefono ' + coCRLF +
'         from   persona ' + coCRLF +
'         where  id_persona = p.ID_PERSONA) TELEFONO1, ' + coCRLF +
'        ac.CVE_SENICREB, ' + coCRLF +
'        pf.ID_PERS_FIRA, ' + coCRLF +
'        (select id_persona_rel ' + coCRLF +
'         from   cr_am_contrf ' + coCRLF +
'         where  tipo_rel = ''AV'' and id_contrato = cc.id_contrato and rownum = 1) AVAL, ' + coCRLF +
'        (select nombre ' + coCRLF +
'         from   cr_am_contrf cac, ' + coCRLF +
'                persona p ' + coCRLF +
'         where  id_persona_rel = p.id_persona and tipo_rel = ''AV'' and id_contrato = cc.id_contrato and rownum = 1) NOMBRE_AVAL, ' + coCRLF +
'        (select siglas_rfc || f_rfc || homoclave_rfc as rfc ' + coCRLF +
'         from   rfc ' + coCRLF +
'         where  id_persona = (select id_persona ' + coCRLF +
'                              from   cr_am_contrf cac, ' + coCRLF +
'                                     persona p ' + coCRLF +
'                              where  id_persona_rel = p.id_persona and tipo_rel = ''AV'' and id_contrato = cc.id_contrato and rownum = 1) ) RFC_AVAL, ' + coCRLF +
'        (select dom.calle_numero ' + coCRLF +
'         from   domicilio dom, ' + coCRLF +
'                persona p ' + coCRLF +
'         where  p.id_domicilio = dom.id_domicilio and p.id_persona = (select id_persona ' + coCRLF +
'                                                                      from   cr_am_contrf cac, ' + coCRLF +
'                                                                             persona p ' + coCRLF +
'                                                                      where  id_persona_rel = p.id_persona and tipo_rel = ''AV'' and id_contrato = cc.id_contrato and rownum = 1) ) ' + coCRLF +
'                                                                                                                                                                      DOMICILIO_AVAL, ' + coCRLF +
'        (select dom.colonia ' + coCRLF +
'         from   domicilio dom, ' + coCRLF +
'                persona p ' + coCRLF +
'         where  p.id_domicilio = dom.id_domicilio and p.id_persona = (select id_persona ' + coCRLF +
'                                                                      from   cr_am_contrf cac, ' + coCRLF +
'                                                                             persona p ' + coCRLF +
'                                                                      where  id_persona_rel = p.id_persona and tipo_rel = ''AV'' and id_contrato = cc.id_contrato and rownum = 1) ) ' + coCRLF +
'                                                                                                                                                                        COLONIA_AVAL, ' + coCRLF +
'        (select b.desc_poblacion as estado ' + coCRLF +
'         from   domicilio dom, ' + coCRLF +
'                poblacion a, ' + coCRLF +
'                poblacion b, ' + coCRLF +
'                poblacion c, ' + coCRLF +
'                persona p ' + coCRLF +
'         where  (a.cve_poblac_ubic = b.cve_poblacion) ' + coCRLF +
'         and    (b.cve_poblac_ubic = c.cve_poblacion) ' + coCRLF +
'         and    a.cve_poblacion = cve_ciudad ' + coCRLF +
'         and    p.id_domicilio = dom.id_domicilio ' + coCRLF +
'         and    p.id_persona = (select id_persona ' + coCRLF +
'                                from   cr_am_contrf cac, ' + coCRLF +
'                                       persona p ' + coCRLF +
'                                where  id_persona_rel = p.id_persona and tipo_rel = ''AV'' and id_contrato = cc.id_contrato and rownum = 1) ) ESTADO_AVAL, ' + coCRLF +
'        (select a.desc_poblacion as ciudad ' + coCRLF +
'         from   domicilio dom, ' + coCRLF +
'                poblacion a, ' + coCRLF +
'                poblacion b, ' + coCRLF +
'                poblacion c, ' + coCRLF +
'                persona p ' + coCRLF +
'         where  (a.cve_poblac_ubic = b.cve_poblacion) ' + coCRLF +
'         and    (b.cve_poblac_ubic = c.cve_poblacion) ' + coCRLF +
'         and    a.cve_poblacion = cve_ciudad ' + coCRLF +
'         and    p.id_domicilio = dom.id_domicilio ' + coCRLF +
'         and    p.id_persona = (select id_persona ' + coCRLF +
'                                from   cr_am_contrf cac, ' + coCRLF +
'                                       persona p ' + coCRLF +
'                                where  id_persona_rel = p.id_persona and tipo_rel = ''AV'' and id_contrato = cc.id_contrato and rownum = 1) ) CIUDAD_AVAL, ' + coCRLF +
'        (select dom.codigo_postal ' + coCRLF +
'         from   domicilio dom, ' + coCRLF +
'                persona p ' + coCRLF +
'         where  p.id_domicilio = dom.id_domicilio and p.id_persona = (select id_persona ' + coCRLF +
'                                                                      from   cr_am_contrf cac, ' + coCRLF +
'                                                                             persona p ' + coCRLF +
'                                                                      where  id_persona_rel = p.id_persona and tipo_rel = ''AV'' and id_contrato = cc.id_contrato and rownum = 1) ) ' + coCRLF +
'                                                                                                                                                                  CODIGO_POSTAL_AVAL, ' + coCRLF +
'        (select telef_casa as telefono ' + coCRLF +
'         from   persona ' + coCRLF +
'         where  id_persona = (select id_persona ' + coCRLF +
'                              from   cr_am_contrf cac, ' + coCRLF +
'                                     persona p ' + coCRLF +
'                              where  id_persona_rel = p.id_persona and tipo_rel = ''AV'' and id_contrato = cc.id_contrato and rownum = 1) ) TELEFONO1_AVAL, ' + coCRLF +
'        (select telef_oficina as telefono ' + coCRLF +
'         from   persona ' + coCRLF +
'         where  id_persona = (select id_persona ' + coCRLF +
'                              from   cr_am_contrf cac, ' + coCRLF +
'                                     persona p ' + coCRLF +
'                              where  id_persona_rel = p.id_persona and tipo_rel = ''AV'' and id_contrato = cc.id_contrato and rownum = 1) ) TELEFONO2_AVAL, ' + coCRLF +
'        (select telef_fax as telefono ' + coCRLF +
'         from   persona ' + coCRLF +
'         where  id_persona = (select id_persona ' + coCRLF +
'                              from   cr_am_contrf cac, ' + coCRLF +
'                                     persona p ' + coCRLF +
'                              where  id_persona_rel = p.id_persona and tipo_rel = ''AV'' and id_contrato = cc.id_contrato and rownum = 1) ) TELEFONO3_AVAL, ' + coCRLF +
'        pf.B_EXP_DIA, ' + coCRLF +
'        pf.F_ULT_REV, ' + coCRLF +
'        ( ' + coCRLF +
'         case ' + coCRLF +
'           when pf.FRECUENCIA = ''01M'' then ''MENSUAL'' ' + coCRLF +
'           when pf.FRECUENCIA = ''03M'' then ''TRIMESTRAL'' ' + coCRLF +
'           when pf.FRECUENCIA = ''06M'' then ''SEMESTRAL'' ' + coCRLF +
'           when pf.FRECUENCIA = ''12M'' then ''ANUAL'' ' + coCRLF +
'         end) FRECUENCIA, ' + coCRLF +
'        pf.F_PROX_REV ' + coCRLF +
' from   cr_am_dispf a, ' + coCRLF +
'        cr_am_saldos sdos, ' + coCRLF +
'        cr_credito c, ' + coCRLF +
'        cr_contrato cc, ' + coCRLF +
'        cr_producto pr, ' + coCRLF +
'        contrato co, ' + coCRLF +
'        persona p, ' + coCRLF +
'        cr_acreditado ac, ' + coCRLF +
'        cr_am_persf pf, ' + coCRLF +
'        domicilio d, ' + coCRLF +
'        poblacion po, ' + coCRLF +
'        (select id_domicilio, ' + coCRLF +
'                calle_numero, ' + coCRLF +
'                calle, ' + coCRLF +
'                num_exterior, ' + coCRLF +
'                num_interior, ' + coCRLF +
'                colonia, ' + coCRLF +
'                codigo_postal, ' + coCRLF +
'                a.desc_poblacion as ciudad, ' + coCRLF +
'                b.desc_poblacion as estado, ' + coCRLF +
'                c.desc_poblacion as pais ' + coCRLF +
'         from   domicilio dom, ' + coCRLF +
'                poblacion a, ' + coCRLF +
'                poblacion b, ' + coCRLF +
'                poblacion c ' + coCRLF +
'         where  (a.cve_poblac_ubic = b.cve_poblacion) and (b.cve_poblac_ubic = c.cve_poblacion) and a.cve_poblacion = cve_ciudad) dom, ' + coCRLF +
'        (select id_domicilio, ' + coCRLF +
'                calle, ' + coCRLF +
'                num_exterior, ' + coCRLF +
'                num_interior, ' + coCRLF +
'                colonia, ' + coCRLF +
'                codigo_postal, ' + coCRLF +
'                a.desc_poblacion as ciudad, ' + coCRLF +
'                b.desc_poblacion as estado, ' + coCRLF +
'                c.desc_poblacion as pais ' + coCRLF +
'         from   domicilio dom, ' + coCRLF +
'                poblacion a, ' + coCRLF +
'                poblacion b, ' + coCRLF +
'                poblacion c ' + coCRLF +
'         where  (a.cve_poblac_ubic = b.cve_poblacion) and (b.cve_poblac_ubic = c.cve_poblacion) and a.cve_poblacion = cve_ciudad) domfis ' + coCRLF +
' where  a.ID_CREDITO = c.ID_CREDITO ' + coCRLF +
' and    sdos.fecha = ' + SQLFecha(dtFCierre.date) + ' ' + coCRLF +
' and    a.ID_CREDITO = sdos.ID_CREDITO ' + coCRLF +
' and    c.ID_CONTRATO = cc.ID_CONTRATO ' + coCRLF +
' and    cc.CVE_PRODUCTO_CRE = pr.CVE_PRODUCTO_CRE ' + coCRLF +
' and    c.ID_CONTRATO = co.ID_CONTRATO ' + coCRLF +
' and    co.ID_TITULAR = p.ID_PERSONA ' + coCRLF +
' and    co.ID_TITULAR = pf.ID_PERSONA(+) ' + coCRLF +
' and    co.ID_TITULAR = ac.ID_ACREDITADO ' + coCRLF +
' and    p.ID_DOMICILIO = dom.ID_DOMICILIO ' + coCRLF +
' and    p.ID_DOM_FISCAL = domfis.ID_DOMICILIO ' + coCRLF +
' and    p.ID_DOMICILIO = d.ID_DOMICILIO ' + coCRLF +
' and    d.CVE_ESTADO = po.CVE_POBLACION ';

  vgQryDisposicion  := GetSQLQueryNoNil(vlSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
  vgQryDisposicion.SQL.SaveToFile('c:\disposicion.sql');
  If Assigned(vgQryDisposicion) Then
  begin
    try

    vgQryDisposicion.FieldByName('ID_CREDITO').DisplayLabel := 'ID CREDITO';
    vgQryDisposicion.FieldByName('ID_CREDITO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('ID_PERSONA').DisplayLabel := 'ID PERSONA';
    vgQryDisposicion.FieldByName('ID_PERSONA').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('NOMBRE').DisplayLabel := 'NOMBRE DEL ACREDITADO';
    vgQryDisposicion.FieldByName('NOMBRE').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('EDOREP').DisplayLabel := 'ESTADO/REGIÓN';
    vgQryDisposicion.FieldByName('EDOREP').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('ID_CONTRATO').DisplayLabel := 'ID CONTRATO';
    vgQryDisposicion.FieldByName('ID_CONTRATO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('CVE_PRODUCTO_CRE').DisplayLabel := 'PRODUCTO';
    vgQryDisposicion.FieldByName('CVE_PRODUCTO_CRE').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('DESC_L_PRODUCTO').DisplayLabel := 'DESCRIPCION DEL PRODUCTO';
    vgQryDisposicion.FieldByName('DESC_L_PRODUCTO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('IMP_CONTRATO').DisplayLabel := 'IMPORTE CONTRATO';
    vgQryDisposicion.FieldByName('IMP_CONTRATO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('DIAS_PLAZO').DisplayLabel := 'PLAZO DEL CONTRATO DE CREDITO';
    vgQryDisposicion.FieldByName('DIAS_PLAZO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('ID_PROMOTOR').DisplayLabel := 'ID PROMOTOR';
    vgQryDisposicion.FieldByName('ID_PROMOTOR').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('NOMBREPROMOTOR').DisplayLabel := 'NOMBRE DEL PROMOTOR';
    vgQryDisposicion.FieldByName('NOMBREPROMOTOR').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('CONTRATODV').DisplayLabel := 'CHEQUERA';
    vgQryDisposicion.FieldByName('CONTRATODV').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('SALDODV').DisplayLabel := 'SALDO CHEQUERA';
    vgQryDisposicion.FieldByName('SALDODV').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('VENCTOCAP').DisplayLabel := 'F. PROX. VENC. CAPITAL';
    vgQryDisposicion.FieldByName('VENCTOCAP').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('NUM_CONTROL_FIRA').DisplayLabel := 'NUM CONTROL  FIRA';
    vgQryDisposicion.FieldByName('NUM_CONTROL_FIRA').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('ID_CRED_FIRA_N').DisplayLabel := 'ID CREDITO FIRA NORMAL';
    vgQryDisposicion.FieldByName('ID_CRED_FIRA_N').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('ID_DESPACHO').DisplayLabel := 'ID PERSONA DESPACHO';
    vgQryDisposicion.FieldByName('ID_DESPACHO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('NOMBREDESPACHO').DisplayLabel := 'NOMBRE DEL DESPACHO';
    vgQryDisposicion.FieldByName('NOMBREDESPACHO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('CVECAUFIRA').DisplayLabel := 'CLAVE CAUSA GTIA. FIRA';
    vgQryDisposicion.FieldByName('CVECAUFIRA').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('DESCCAUSAGTIAFIRA').DisplayLabel := 'DESCRIPCION DE LA CAUSA';
    vgQryDisposicion.FieldByName('DESCCAUSAGTIAFIRA').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('SUBCVEGTIAFIRA').DisplayLabel := 'SUBCLAVE CAUSA GTIA. FIRA';
    vgQryDisposicion.FieldByName('SUBCVEGTIAFIRA').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('DESCSUBCAUSA').DisplayLabel := 'DESCRIPCION DE LA SUBCAUSA';
    vgQryDisposicion.FieldByName('DESCSUBCAUSA').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('CVERECGTIAFIRA').DisplayLabel := 'CLAVE VÍA RECUPERACCIÓN GTIA. FIRA';
    vgQryDisposicion.FieldByName('CVERECGTIAFIRA').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('DESCVIAREC').DisplayLabel := 'DESCRIPCIÓN DE LA VIA';
    vgQryDisposicion.FieldByName('DESCVIAREC').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('IMP_CREDITO').DisplayLabel := 'IMPORTE ORIGINAL';
    vgQryDisposicion.FieldByName('IMP_CREDITO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('F_INICIO').DisplayLabel := 'FECHA INICIO';
    vgQryDisposicion.FieldByName('F_INICIO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('F_VENCIMIENTO').DisplayLabel := 'FECHA VEN_CONT';
    vgQryDisposicion.FieldByName('F_VENCIMIENTO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('F_VEN_CRED').DisplayLabel := 'FECHA VEN_CRED';
    vgQryDisposicion.FieldByName('F_VEN_CRED').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('TASAFONDEO').DisplayLabel := 'TASA DE FONDEO';
    vgQryDisposicion.FieldByName('TASAFONDEO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('MARGENINTER').DisplayLabel := 'MARGEN DE INTERMEDIACION';
    vgQryDisposicion.FieldByName('MARGENINTER').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('TASACLIENTE').DisplayLabel := 'TASA CLIENTE';
    vgQryDisposicion.FieldByName('TASACLIENTE').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('CLABE_DESTINO').DisplayLabel := 'CLABE DESTINO';
    vgQryDisposicion.FieldByName('CLABE_DESTINO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('BANCO_DESTINO').DisplayLabel := 'BANCO DESTINO';
    vgQryDisposicion.FieldByName('BANCO_DESTINO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('MGTIALIQO').DisplayLabel := 'GTIA. LIQUIDA ORIGINAL ($)';
    vgQryDisposicion.FieldByName('MGTIALIQO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('PCGTIALIQO').DisplayLabel := 'GTIA. LIQUIDA ORIGINAL (%)';
    vgQryDisposicion.FieldByName('PCGTIALIQO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('IMPGTIALIQACTT').DisplayLabel := 'GTIA. LIQUIDA ACTUAL ($)';
    vgQryDisposicion.FieldByName('IMPGTIALIQACTT').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('PCTGTIALIQACTT').DisplayLabel := 'GTIA. LIQUIDA ACTUAL (%)';
    vgQryDisposicion.FieldByName('PCTGTIALIQACTT').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('TIPOPOLIZA').DisplayLabel := 'TIPO DE POLIZA (ANUAL/MULTIANUAL)';
    vgQryDisposicion.FieldByName('TIPOPOLIZA').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('ASEGURADORA').DisplayLabel := 'ASEGURADORA';
    vgQryDisposicion.FieldByName('ASEGURADORA').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('IMP_FND_CONT_ORIG').DisplayLabel := 'FONDO DE CONTINGENCIA ORIGINAL ($)';
    vgQryDisposicion.FieldByName('IMP_FND_CONT_ORIG').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('IMP_FND_CONT_ACT').DisplayLabel := 'FONDO DE CONTINGENCIA ACTUAL ($)';
    vgQryDisposicion.FieldByName('IMP_FND_CONT_ACT').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('GAR_FIDUC_ORIG').DisplayLabel := 'GTIA FIDUCIARIA ORIGINAL';
    vgQryDisposicion.FieldByName('GAR_FIDUC_ORIG').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('PCT_GAR_FIDUC_ORIG').DisplayLabel := 'GTIA FIDUCIARIA ORIGINAL %';
    vgQryDisposicion.FieldByName('PCT_GAR_FIDUC_ORIG').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('GAR_FIDUC_ACT').DisplayLabel := 'GTIA FIDUCIARIA ACTUAL';
    vgQryDisposicion.FieldByName('GAR_FIDUC_ACT').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('PCT_GAR_FIDUC_ACT').DisplayLabel := 'GTIA FIDUCIARIA ACTUAL %';
    vgQryDisposicion.FieldByName('PCT_GAR_FIDUC_ACT').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('NOM_FIDEICOM').DisplayLabel := 'GTIA FIDEICOMISO NOMBRE';
    vgQryDisposicion.FieldByName('NOM_FIDEICOM').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('NUM_FIDEICOM').DisplayLabel := 'GTIA NUM FIDEICOMISO';
    vgQryDisposicion.FieldByName('NUM_FIDEICOM').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('NOM_FIDUC').DisplayLabel := 'GTIA FIDUCIARIO';
    vgQryDisposicion.FieldByName('NOM_FIDUC').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('B_GAR_HIPO').DisplayLabel := 'GTIA HIPOTECARIA';
    vgQryDisposicion.FieldByName('B_GAR_HIPO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('SDO_CAP_ACTUAL').DisplayLabel := 'SALDO CAPITAL ACTUAL';
    vgQryDisposicion.FieldByName('SDO_CAP_ACTUAL').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('SDO_CAP_VENCIDO').DisplayLabel := 'SALDO CAPITAL VENCIDO';
    vgQryDisposicion.FieldByName('SDO_CAP_VENCIDO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('MORA_CAP_VENCIDO').DisplayLabel := 'MORA CAPITAL VENCIDO';
    vgQryDisposicion.FieldByName('MORA_CAP_VENCIDO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('IMP_INT').DisplayLabel := 'SALDO INTERESES';
    vgQryDisposicion.FieldByName('IMP_INT').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('IMP_INT_VDO').DisplayLabel := 'SALDO INTERESES VENCIDO';
    vgQryDisposicion.FieldByName('IMP_INT_VDO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('MORA_INT_VDO').DisplayLabel := 'MORA INTERESES VENCIDO';
    vgQryDisposicion.FieldByName('MORA_INT_VDO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('SDO_FINAN_ADIC').DisplayLabel := 'SALDO REFINANCIAMIENTO';
    vgQryDisposicion.FieldByName('SDO_FINAN_ADIC').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('SDO_FINAN_ADIC_VDO').DisplayLabel := 'SALDO REFINANCIAMIENTO VENCIDO';
    vgQryDisposicion.FieldByName('SDO_FINAN_ADIC_VDO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('MORA_FINAN_ADIC_VDO').DisplayLabel := 'MORA REFINANCIAMIENTO VENCIDO';
    vgQryDisposicion.FieldByName('MORA_FINAN_ADIC_VDO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('SDO_CUOTA_FEGA').DisplayLabel := 'SALDO CUOTA FEGA';
    vgQryDisposicion.FieldByName('SDO_CUOTA_FEGA').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('SDO_CUOTA_FEGA_VDO').DisplayLabel := 'SALDO CUOTA FEGA VENCIDO';
    vgQryDisposicion.FieldByName('SDO_CUOTA_FEGA_VDO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('MORA_CUOTA_FEGA_VDO').DisplayLabel := 'MORA CUOTA FEGA VENCIDO';
    vgQryDisposicion.FieldByName('MORA_CUOTA_FEGA_VDO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('SEGURO').DisplayLabel := 'SALDO SEGURO';
    vgQryDisposicion.FieldByName('SEGURO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('SEGURO_VDO').DisplayLabel := 'SALDO SEGURO VENCIDO';
    vgQryDisposicion.FieldByName('SEGURO_VDO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('MORA_SEGURO_VDO').DisplayLabel := 'MORA SEGURO VENCIDO';
    vgQryDisposicion.FieldByName('MORA_SEGURO_VDO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('TOTAL_VIGENTE').DisplayLabel := 'TOTAL VIGENTE';
    vgQryDisposicion.FieldByName('TOTAL_VIGENTE').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('TOTAL_VENCIDO').DisplayLabel := 'TOTAL VENCIDO';
    vgQryDisposicion.FieldByName('TOTAL_VENCIDO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('TOTAL_VIGENTE_VENCIDO').DisplayLabel := 'TOTAL VIGENTE+VENCIDO';
    vgQryDisposicion.FieldByName('TOTAL_VIGENTE_VENCIDO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('OTROS_ADEUDOS_BINTER').DisplayLabel := 'SALDO OTROS ADEUDOS BINTER';
    vgQryDisposicion.FieldByName('OTROS_ADEUDOS_BINTER').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('OTROS_ADEUDOS_FIRA').DisplayLabel := 'SALDO OTROS ADEUDOS FIRA';
    vgQryDisposicion.FieldByName('OTROS_ADEUDOS_FIRA').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('DIAS_VENCIDO').DisplayLabel := 'DÍAS DE VENCIDO';
    vgQryDisposicion.FieldByName('DIAS_VENCIDO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('CVE_CLAS_CRED').DisplayLabel := 'CLAVE CLASIFIC. CRED';
    vgQryDisposicion.FieldByName('CVE_CLAS_CRED').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('CLAS_CRED').DisplayLabel := 'DESCRIPCION CLASIFIC. CRED.';
    vgQryDisposicion.FieldByName('CLAS_CRED').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('GTA_FEGA_PCT_NOM').DisplayLabel := 'GTIA FEGA % NOMINAL';
    vgQryDisposicion.FieldByName('GTA_FEGA_PCT_NOM').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('GAR_FONAGA_PCT').DisplayLabel := 'GTIA FONAGA %';
    vgQryDisposicion.FieldByName('GAR_FONAGA_PCT').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('GAR_FIR_SDO_RECUPERAR').DisplayLabel := 'GTIA FIRA SALDO POR RECUPERAR';
    vgQryDisposicion.FieldByName('GAR_FIR_SDO_RECUPERAR').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('IMP_MNTO_REC').DisplayLabel := 'GTIA FIRA SALDO RECUPERADO';
    vgQryDisposicion.FieldByName('IMP_MNTO_REC').DisplayWidth := 24;
//    vgQryDisposicion.FieldByName('B_GAR_VIGENTE').DisplayLabel := 'GTIA FIRA VIGENTE';
//    vgQryDisposicion.FieldByName('B_GAR_VIGENTE').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('ID_CRED_FIRA_GAR').DisplayLabel := 'ID CREDITO FIRA GARANTÍA';
    vgQryDisposicion.FieldByName('ID_CRED_FIRA_GAR').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('STATUS').DisplayLabel := 'STATUS_GTÍA';
    vgQryDisposicion.FieldByName('STATUS').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('IMP_GAR_FIRA').DisplayLabel := 'GTIA FIRA IMPORTE';
    vgQryDisposicion.FieldByName('IMP_GAR_FIRA').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('ESTRATO').DisplayLabel := 'GTIA FIRA ESTRATO';
    vgQryDisposicion.FieldByName('ESTRATO').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('F_PAGO_GAR_FIRA').DisplayLabel := 'GTIA FIRA FECHA PAGO';
    vgQryDisposicion.FieldByName('F_PAGO_GAR_FIRA').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('F_RESC_GAR_FIRA').DisplayLabel := 'GTIA FIRA FECHA RESCATE';
    vgQryDisposicion.FieldByName('F_RESC_GAR_FIRA').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('F_VEN_GAR_FIRA').DisplayLabel := 'GTIA FIRA FECHA VENCIMIENTO';
    vgQryDisposicion.FieldByName('F_VEN_GAR_FIRA').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('F_CAST_FIRA').DisplayLabel := 'GTIA FIRA FECHA CASTIGO';
    vgQryDisposicion.FieldByName('F_CAST_FIRA').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('F_LIM_ENTRG_INF').DisplayLabel := 'Fecha límite para entregar el informe a FIRA de seguimiento.';
    vgQryDisposicion.FieldByName('F_LIM_ENTRG_INF').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('F_DICT_INCOBR').DisplayLabel := 'Fecha dictamen de incobrabilidad';
    vgQryDisposicion.FieldByName('F_DICT_INCOBR').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('F_SOL_CAST_FIRA').DisplayLabel := 'Fecha de solilcitud de castigo a FIRA';
    vgQryDisposicion.FieldByName('F_SOL_CAST_FIRA').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('F_LIM_INI_AC_JUD').DisplayLabel := 'Fecha límite para iniciar acciones judiciales';
    vgQryDisposicion.FieldByName('F_LIM_INI_AC_JUD').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('F_PRESEN_DMDA').DisplayLabel := 'Fecha de presentación de la demanda';
    vgQryDisposicion.FieldByName('F_PRESEN_DMDA').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('F_LIM_PRSTN_P_R').DisplayLabel := 'Fecha límite para presentar propuesta de reestructura';
    vgQryDisposicion.FieldByName('F_LIM_PRSTN_P_R').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('F_PROG_RECUP').DisplayLabel := 'Fecha programada de recuperación';
    vgQryDisposicion.FieldByName('F_PROG_RECUP').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('F_ENV_RECUP').DisplayLabel := 'FECHA ENVÍO A RECUPERACIÓN';
    vgQryDisposicion.FieldByName('F_ENV_RECUP').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('F_ENVIO_CC').DisplayLabel := 'F_ENVÍO_CARTA_CANC_CRED';
    vgQryDisposicion.FieldByName('F_ENVIO_CC').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('F_ACUSE_CC').DisplayLabel := 'F_ACUSE_CARTA_CANC_CRED';
    vgQryDisposicion.FieldByName('F_ACUSE_CC').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('RES_DICT').DisplayLabel := 'RESULTADO_DICTAMEN_FIRA';
    vgQryDisposicion.FieldByName('RES_DICT').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('PCT_COB_NOM').DisplayLabel := 'COB_NOMINAL (%)';
    vgQryDisposicion.FieldByName('PCT_COB_NOM').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('PCT_COB_EFEC').DisplayLabel := 'COB_EFECTIVA (%)';
    vgQryDisposicion.FieldByName('PCT_COB_EFEC').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('RFC').DisplayLabel := 'R.F.C.';
    vgQryDisposicion.FieldByName('RFC').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('DOMICILIO1').DisplayLabel := 'DOMICILIO 1';
    vgQryDisposicion.FieldByName('DOMICILIO1').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('COLONIA1').DisplayLabel := 'COLONIA 1';
    vgQryDisposicion.FieldByName('COLONIA1').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('ESTADO1').DisplayLabel := 'ESTADO 1';
    vgQryDisposicion.FieldByName('ESTADO1').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('CIUDAD1').DisplayLabel := 'CIUDAD 1';
    vgQryDisposicion.FieldByName('CIUDAD1').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('CODIGO_POSTAL1').DisplayLabel := 'CP 1';
    vgQryDisposicion.FieldByName('CODIGO_POSTAL1').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('TELEFONO1').DisplayLabel := 'TELEFONO 1';
    vgQryDisposicion.FieldByName('TELEFONO1').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('CVE_SENICREB').DisplayLabel := 'SECTOR ECONOMICO';
    vgQryDisposicion.FieldByName('CVE_SENICREB').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('ID_PERS_FIRA').DisplayLabel := 'ID PERSONA FIRA';
    vgQryDisposicion.FieldByName('ID_PERS_FIRA').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('B_EXP_DIA').DisplayLabel := 'EXPEDIENTE AL DÍA';
    vgQryDisposicion.FieldByName('B_EXP_DIA').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('F_ULT_REV').DisplayLabel := 'FECHA DE ÚLTIMA REVISIÓN';
    vgQryDisposicion.FieldByName('F_ULT_REV').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('FRECUENCIA').DisplayLabel := 'FRECUENCIA';
    vgQryDisposicion.FieldByName('FRECUENCIA').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('F_PROX_REV').DisplayLabel := 'FECHA DE PRÓXIMA REVISIÓN';
    vgQryDisposicion.FieldByName('F_PROX_REV').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('AVAL').DisplayLabel := 'ID PERSONA AVAL';
    vgQryDisposicion.FieldByName('AVAL').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('NOMBRE_AVAL').DisplayLabel := 'NOMBRE DE LA PERSONA RELACIONADA';
    vgQryDisposicion.FieldByName('NOMBRE_AVAL').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('RFC_AVAL').DisplayLabel := 'PERSONA AVAL	R.F.C.';
    vgQryDisposicion.FieldByName('RFC_AVAL').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('DOMICILIO_AVAL').DisplayLabel := 'PERSONA AVAL	DOMICILIO 1';
    vgQryDisposicion.FieldByName('DOMICILIO_AVAL').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('COLONIA_AVAL').DisplayLabel := 'PERSONA AVAL	COLONIA 1';
    vgQryDisposicion.FieldByName('COLONIA_AVAL').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('ESTADO_AVAL').DisplayLabel := 'PERSONA AVAL	ESTADO 1';
    vgQryDisposicion.FieldByName('ESTADO_AVAL').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('CIUDAD_AVAL').DisplayLabel := 'PERSONA AVAL	CIUDAD 1';
    vgQryDisposicion.FieldByName('CIUDAD_AVAL').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('CODIGO_POSTAL_AVAL').DisplayLabel := 'PERSONA AVAL	CP 1';
    vgQryDisposicion.FieldByName('CODIGO_POSTAL_AVAL').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('TELEFONO1_AVAL').DisplayLabel := 'PERSONA AVAL	TELEFONO 1';
    vgQryDisposicion.FieldByName('TELEFONO1_AVAL').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('TELEFONO2_AVAL').DisplayLabel := 'PERSONA AVAL	TELEFONO 2';
    vgQryDisposicion.FieldByName('TELEFONO2_AVAL').DisplayWidth := 24;
    vgQryDisposicion.FieldByName('TELEFONO3_AVAL').DisplayLabel := 'PERSONA AVAL	TELEFONO 3';
    vgQryDisposicion.FieldByName('TELEFONO3_AVAL').DisplayWidth := 24;

    sgDisposicion.AddQry(vgQryDisposicion,True,True,-1,-1,-1,True);
    finally vgQryDisposicion.Free;
    end;


    //sgDisposicion.Enabled := True;
  end;

end;

procedure TWCrAmMacro.Bitacora;
Var
  vlSQL : String;
  vgQryBitacora : TQuery;
  vlQry : TQuery;
begin
  sgBitacora.Clear('NO EXISTEN DATOS'#30'>C');

  vlSQL :=
    ' select   ' +
    '          a.ID_CREDITO as id_disposicion, ' + coCRLF +
    '          c.ID_CONTRATO, ' + coCRLF +
    '          (select Desc_Poblacion ' + coCRLF +
    '           from   Persona p, ' + coCRLF +
    '                  Contrato co, ' + coCRLF +
    '                  domicilio d, ' + coCRLF +
    '                  poblacion po ' + coCRLF +
    '           where  co.ID_TITULAR = p.ID_PERSONA and co.ID_CONTRATO = c.ID_CONTRATO and p.ID_DOMICILIO = d.ID_DOMICILIO and d.CVE_ESTADO = po.CVE_POBLACION) EDOREP, ' + coCRLF +
    '          (select Nombre ' + coCRLF +
    '           from   Persona p, ' + coCRLF +
    '                  Contrato co ' + coCRLF +
    '           where  co.ID_TITULAR = p.ID_PERSONA and co.ID_CONTRATO = c.ID_CONTRATO) NombreAcreditado, ' + coCRLF +
    '          a.NOMBRE_SPVISOR, ' + coCRLF +
    '          a.ID_DESPACHO, ' + coCRLF +
    '          (select Nombre ' + coCRLF +
    '           from   Persona p ' + coCRLF +            
    '           where  p.ID_PERSONA = a.ID_DESPACHO) NombreDespacho, ' + coCRLF +
    '          a.F_EVENTO, ' + coCRLF +
    '          a.F_PROX_EVENTO, ' + coCRLF +
    '          (case ' + coCRLF +
    '             when A.B_RES_DICTAMEN = ''F'' then ''Negativo'' ' + coCRLF +
    '             when A.B_RES_DICTAMEN = ''V'' then ''Positivo'' ' + coCRLF +
    '             else ''n/a'' ' + coCRLF +
    '           end) ResDictamen, ' + coCRLF +
    '          a.F_LIM_ACLARA, ' + coCRLF +
    '          cast (trim(substr (a.txt_comentario, 0, 254)) as char (254) ) as txt_comentario, ' + coCRLF +
    '          c.ID_PROM_ADM ID_PROMOTOR, ' + coCRLF +
    '          (Select Nombre from Persona pe where pe.ID_PERSONA = c.ID_PROM_ADM) NombrePromotor, ' + coCRLF +
    '          ( ' + coCRLF +
    '           case ' + coCRLF +
    '             when a.TIPO_SUPERVISOR = ''BI'' then ''BINTER'' ' + coCRLF +
    '             when a.TIPO_SUPERVISOR = ''DE'' then ''DESPACHO'' ' + coCRLF +
    '             when a.TIPO_SUPERVISOR = ''FI'' then ''FIRA'' ' + coCRLF +
    '             when a.TIPO_SUPERVISOR = ''AC'' then ''ACREDITADO'' ' + coCRLF +
    '           end) ENTE_SUP, ' + coCRLF +
    '          (case ' + coCRLF +
    '             when a.TIPO_EVENTO = ''VI'' then ''VISITA'' ' + coCRLF +
    '             when a.TIPO_EVENTO = ''TE'' then ''LLAMADA'' ' + coCRLF +
    ' 						when a.TIPO_EVENTO = ''CI'' then ''CITA'' ' + coCRLF +
    ' 						when a.TIPO_EVENTO = ''CC'' then ''CITA CUMPLIDA'' ' + coCRLF +
    '           end) TIPO_EVENTO, ' + coCRLF +
    '          (case ' + coCRLF +
    '             when a.B_REESTR_VIA = ''V'' then ''SI'' ' + coCRLF +
    '             when a.B_REESTR_VIA = ''F'' then ''NO'' ' + coCRLF +
    ' 						else ''n/a'' ' + coCRLF +
    '           end) B_REESTR_VIA, ' + coCRLF +
    '          a.CVE_CLAS_CRED, ' + coCRLF +
    '          (select cc.DESC_CLAS_CRED from cr_clas_cred cc where cc.CVE_CLAS_CRED = a.CVE_CLAS_CRED) as DESC_CLAS_CRED, ' + coCRLF +
    '          (select id_cred_fira_n ' + coCRLF +
    '           from   cr_am_dispf ad ' + coCRLF +
    '           where  ad.ID_CREDITO = a.ID_CREDITO) id_cred_fira_n, ' + coCRLF +
    '          (select num_control_Fira ' + coCRLF +
    '           from   cr_am_dispf ad ' + coCRLF +
    '           where  ad.ID_CREDITO = a.ID_CREDITO) num_control_Fira, ' + coCRLF +
    '          (select id_cred_fira_gar ' + coCRLF +
    '           from   cr_am_dispf ad ' + coCRLF +
    '           where  ad.ID_CREDITO = a.ID_CREDITO) id_cred_fira_gar ' + coCRLF +
    ' from     cr_am_bitacora a, ' + coCRLF +
    '          cr_credito c ' + coCRLF +
    ' where    a.ID_CREDITO = c.ID_CREDITO and a.F_EVENTO between to_date ('''+edFechaIniB.Text+''', ''DD/MM/YYYY'') and to_date ('''+edFechaFinB.Text+''', ''DD/MM/YYYY'') + 1 ' + coCRLF +
    ' order by a.F_EVENTO ';

    vgQryBitacora  := GetSQLQueryNoNil(vlSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
    If Assigned(vgQryBitacora) Then
    begin
      try
      vgQryBitacora.FieldByName('ID_CONTRATO').DisplayLabel := 'ID CONTRATO';
      vgQryBitacora.FieldByName('ID_CONTRATO').DisplayWidth := 24;
      vgQryBitacora.FieldByName('ID_DISPOSICION').DisplayLabel := 'ID DISPOSICION';
      vgQryBitacora.FieldByName('ID_DISPOSICION').DisplayWidth := 24;
      vgQryBitacora.FieldByName('NOMBREACREDITADO').DisplayLabel := 'NOMBRE DEL ACREDITADO';
      vgQryBitacora.FieldByName('NOMBREACREDITADO').DisplayWidth := 24;
      vgQryBitacora.FieldByName('EDOREP').DisplayLabel := 'ESTADO/REGIÓN';
      vgQryBitacora.FieldByName('EDOREP').DisplayWidth := 24;
      vgQryBitacora.FieldByName('NOMBRE_SPVISOR').DisplayLabel := 'NOMBRE SUPERVISOR';
      vgQryBitacora.FieldByName('NOMBRE_SPVISOR').DisplayWidth := 24;
      vgQryBitacora.FieldByName('ID_DESPACHO').DisplayLabel := 'ID DESPACHO';
      vgQryBitacora.FieldByName('ID_DESPACHO').DisplayWidth := 24;
      vgQryBitacora.FieldByName('NOMBREDESPACHO').DisplayLabel := 'NOMBRE DEL DESPACHO';
      vgQryBitacora.FieldByName('NOMBREDESPACHO').DisplayWidth := 24;
      vgQryBitacora.FieldByName('F_EVENTO').DisplayLabel := 'FECHA DE EVENTO';
      vgQryBitacora.FieldByName('F_EVENTO').DisplayWidth := 24;
      vgQryBitacora.FieldByName('F_PROX_EVENTO').DisplayLabel := 'FECHA PROXIMO EVENTO';
      vgQryBitacora.FieldByName('F_PROX_EVENTO').DisplayWidth := 24;
      vgQryBitacora.FieldByName('RESDICTAMEN').DisplayLabel := 'RES DICTAMEN';
      vgQryBitacora.FieldByName('RESDICTAMEN').DisplayWidth := 24;
      vgQryBitacora.FieldByName('F_LIM_ACLARA').DisplayLabel := 'FECHA LÍMITE DE ACLARACIÓN';
      vgQryBitacora.FieldByName('F_LIM_ACLARA').DisplayWidth := 24;
      vgQryBitacora.FieldByName('TXT_COMENTARIO').DisplayLabel := 'COMENTARIO';
      vgQryBitacora.FieldByName('TXT_COMENTARIO').DisplayWidth := 24;
      vgQryBitacora.FieldByName('ID_PROMOTOR').DisplayLabel := 'ID PROMOTOR';
      vgQryBitacora.FieldByName('ID_PROMOTOR').DisplayWidth := 24;
      vgQryBitacora.FieldByName('NOMBREPROMOTOR').DisplayLabel := 'NOMBRE DEL PROMOTOR';
      vgQryBitacora.FieldByName('NOMBREPROMOTOR').DisplayWidth := 24;
      vgQryBitacora.FieldByName('ENTE_SUP').DisplayLabel := 'ENTE SUPERVISOR';
      vgQryBitacora.FieldByName('ENTE_SUP').DisplayWidth := 24;
      vgQryBitacora.FieldByName('TIPO_EVENTO').DisplayLabel := 'TIPO DE EVENTO';
      vgQryBitacora.FieldByName('TIPO_EVENTO').DisplayWidth := 24;
      vgQryBitacora.FieldByName('B_REESTR_VIA').DisplayLabel := 'REESTRUCTURA SUSCEPTIBLE';
      vgQryBitacora.FieldByName('B_REESTR_VIA').DisplayWidth := 24;
      vgQryBitacora.FieldByName('CVE_CLAS_CRED').DisplayLabel := 'CLAVE CLASIFICACIÓN DEL CRÉDITO';
      vgQryBitacora.FieldByName('CVE_CLAS_CRED').DisplayWidth := 24;
      vgQryBitacora.FieldByName('DESC_CLAS_CRED').DisplayLabel := 'CLASIFICACIÓN DEL CRÉDITO';
      vgQryBitacora.FieldByName('DESC_CLAS_CRED').DisplayWidth := 24;
      vgQryBitacora.FieldByName('ID_CRED_FIRA_N').DisplayLabel := 'ID CREDITO FIRA NORMAL';
      vgQryBitacora.FieldByName('ID_CRED_FIRA_N').DisplayWidth := 24;
      vgQryBitacora.FieldByName('NUM_CONTROL_FIRA').DisplayLabel := 'NUM CONTROL  FIRA';
      vgQryBitacora.FieldByName('NUM_CONTROL_FIRA').DisplayWidth := 24;
      vgQryBitacora.FieldByName('ID_CRED_FIRA_GAR').DisplayLabel := 'ID CREDITO FIRA GARANTÍA';
      vgQryBitacora.FieldByName('ID_CRED_FIRA_GAR').DisplayWidth := 24;

      sgBitacora.AddQry(vgQryBitacora,True,True,-1,-1,-1,True);
      finally vgQryBitacora.Free;
      end;
    end;
end;

procedure TWCrAmMacro.ConcInversion;
Var
  vlSQL : String;
  vgQryInversion : TQuery;
  vlQry : TQuery;
begin
sgConcInv.Clear('NO EXISTEN DATOS'#30'>C');


    vlSQL :=
      ' select a.ID_CREDITO ID_DISPOSICION, ' + coCRLF +
      '        c.ID_CONTRATO, ' + coCRLF +
      '        Desc_poblacion EDO, ' + coCRLF +
      '        Nombre, ' + coCRLF +
      ' 			 a.CVE_CON_INV, ' + coCRLF +
      ' 			 di.DESC_CON_INV Desc_Concepto, ' + coCRLF +
      ' 			 a.UNIDADES, ' + coCRLF +
      ' 			 a.IMPORTE, ' + coCRLF +
      ' 			 (case ' + coCRLF +
      '           when a.B_REC_PRES = ''V   '' then ''SI'' ' + coCRLF +
      '           when a.B_REC_PRES = ''F'' then ''NO   '' ' + coCRLF +
      '         end) RecursoPrestamo, ' + coCRLF +
      '        (select desp.Id_Despacho ' + coCRLF +
      '         from   cr_am_dispf desp ' + coCRLF +
      '         where  desp.ID_CREDITO = a.ID_CREDITO) IdDespacho, ' + coCRLF +
      '        (select Nombre ' + coCRLF +
      '         from   cr_am_dispf desp, ' + coCRLF +
      '                persona pe ' + coCRLF +
      '         where  desp.ID_CREDITO = a.ID_CREDITO and desp.id_despacho = pe.ID_PERSONA) Nombre_Despacho, ' + coCRLF +
      '        c.ID_PROM_ADM, ' + coCRLF +
      '        (select Nombre ' + coCRLF +
      '         from   Persona pe ' + coCRLF +
      '         where  pe.ID_PERSONA = c.ID_PROM_ADM) Nombre_Promotor, ' + coCRLF +
      '        (select id_cred_fira_n ' + coCRLF +
      '         from   cr_am_dispf ad ' + coCRLF +
      '         where  ad.ID_CREDITO = a.ID_CREDITO) id_cred_fira_n, ' + coCRLF +
      '        (select num_control_Fira ' + coCRLF +
      '         from   cr_am_dispf ad ' + coCRLF +
      '         where  ad.ID_CREDITO = a.ID_CREDITO) num_control_Fira, ' + coCRLF +
      '        (select id_cred_fira_gar ' + coCRLF +
      '         from   cr_am_dispf ad ' + coCRLF +
      '         where  ad.ID_CREDITO = a.ID_CREDITO) id_cred_fira_gar ' + coCRLF +
      ' from   cr_am_cinv a, ' + coCRLF +
      '        cr_credito c, ' + coCRLF +
      '        contrato co, ' + coCRLF +
      '        persona p, ' + coCRLF +
      '        domicilio d, ' + coCRLF +
      '        poblacion po, ' + coCRLF +
      '        cr_con_inv di ' + coCRLF +
      ' where  a.ID_CREDITO = c.ID_CREDITO ' + coCRLF +
      ' and    c.ID_CONTRATO = co.ID_CONTRATO ' + coCRLF +
      ' and    co.ID_TITULAR = p.ID_PERSONA ' + coCRLF +
      ' and    p.ID_DOMICILIO = d.ID_DOMICILIO ' + coCRLF +
      ' and    d.CVE_ESTADO = po.CVE_POBLACION ' + coCRLF +
      ' and    a.CVE_CON_INV = di.CVE_CON_INV ';
   if trim(EdPromotor.Text) <> '' then
   vlSQL := vlSQL +
     'and c.ID_PROM_ADM = ' + EdPromotor.Text;

    vgQryInversion  := GetSQLQueryNoNil(vlSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
    If Assigned(vgQryInversion) Then
    begin
      try
      vgQryInversion.FieldByName('ID_CONTRATO').DisplayLabel := 'ID CONTRATO';
      vgQryInversion.FieldByName('ID_CONTRATO').DisplayWidth := 24;
      vgQryInversion.FieldByName('ID_DISPOSICION').DisplayLabel := 'ID DISPOSICION';
      vgQryInversion.FieldByName('ID_DISPOSICION').DisplayWidth := 24;
      vgQryInversion.FieldByName('NOMBRE').DisplayLabel := 'NOMBRE DEL ACREDITADO';
      vgQryInversion.FieldByName('NOMBRE').DisplayWidth := 24;
      vgQryInversion.FieldByName('EDO').DisplayLabel := 'ESTADO/REGIÓN';
      vgQryInversion.FieldByName('EDO').DisplayWidth := 24;
      vgQryInversion.FieldByName('IDDESPACHO').DisplayLabel := 'ID DESPACHO';
      vgQryInversion.FieldByName('IDDESPACHO').DisplayWidth := 24;
      vgQryInversion.FieldByName('NOMBRE_DESPACHO').DisplayLabel := 'NOMBRE DEL DESPACHO';
      vgQryInversion.FieldByName('NOMBRE_DESPACHO').DisplayWidth := 24;
      vgQryInversion.FieldByName('ID_PROM_ADM').DisplayLabel := 'ID PROMOTOR';
      vgQryInversion.FieldByName('ID_PROM_ADM').DisplayWidth := 24;
      vgQryInversion.FieldByName('NOMBRE_PROMOTOR').DisplayLabel := 'NOMBRE DEL PROMOTOR';
      vgQryInversion.FieldByName('NOMBRE_PROMOTOR').DisplayWidth := 24;
      vgQryInversion.FieldByName('CVE_CON_INV').DisplayLabel := 'CLAVE CONCEPTO';
      vgQryInversion.FieldByName('CVE_CON_INV').DisplayWidth := 24;
      vgQryInversion.FieldByName('DESC_CONCEPTO').DisplayLabel := 'DESCRIPCIÓN CONCEPTO';
      vgQryInversion.FieldByName('DESC_CONCEPTO').DisplayWidth := 24;
      vgQryInversion.FieldByName('UNIDADES').DisplayLabel := 'UNIDADES';
      vgQryInversion.FieldByName('UNIDADES').DisplayWidth := 24;
      vgQryInversion.FieldByName('IMPORTE').DisplayLabel := 'IMPORTE  CONCEPTO';
      vgQryInversion.FieldByName('IMPORTE').DisplayWidth := 24;
      vgQryInversion.FieldByName('RECURSOPRESTAMO').DisplayLabel := 'RECURSOS DEL PRESTAMO';
      vgQryInversion.FieldByName('RECURSOPRESTAMO').DisplayWidth := 24;
      vgQryInversion.FieldByName('ID_CRED_FIRA_N').DisplayLabel := 'ID CREDITO FIRA NORMAL';
      vgQryInversion.FieldByName('ID_CRED_FIRA_N').DisplayWidth := 24;
      vgQryInversion.FieldByName('NUM_CONTROL_FIRA').DisplayLabel := 'NUM CONTROL  FIRA';
      vgQryInversion.FieldByName('NUM_CONTROL_FIRA').DisplayWidth := 24;
      vgQryInversion.FieldByName('ID_CRED_FIRA_GAR').DisplayLabel := 'ID CREDITO FIRA GARANTÍA';
      vgQryInversion.FieldByName('ID_CRED_FIRA_GAR').DisplayWidth := 24;

      sgConcInv.AddQry(vgQryInversion,True,True,-1,-1,-1,True);
      finally vgQryInversion.Free;
      end;
    end;
//
end;

procedure TWCrAmMacro.OtrAdeudos;
Var
  vlSQL : String;
  vgQryAdeudos : TQuery;
  vlQry : TQuery;
begin
  sgOtrAdeu.Clear('NO EXISTEN DATOS'#30'>C');

  vlSQL :=
    'SELECT ' +
      '  a.ID_CREDITO ID_DISPOSICION, ' + coCRLF +
      '  Desc_poblacion EDO, Nombre, ' + coCRLF +
      '  (Select desp.Id_Despacho From cr_am_dispf desp where desp.ID_CREDITO = a.ID_CREDITO)IdDespacho, ' + coCRLF +
      '  (Select Nombre From cr_am_dispf desp , persona pe where desp.ID_CREDITO = a.ID_CREDITO and desp.id_despacho = pe.ID_PERSONA )Nombre_Despacho, ' + coCRLF +
      '  c.ID_PROM_ADM, (Select Nombre from Persona pe where pe.ID_PERSONA = c.ID_PROM_ADM) Nombre_Promotor, ' + coCRLF +
      '  RowNum Secuencia, a.Concepto, a.Importe, a.F_ORIGEN, a.F_COBRO, ' + coCRLF +
      '  (CASE WHEN a.TIPO_ADEU = ' + #39 + 'BI' + #39 + ' THEN ' + #39 + 'BINTER' + #39 + coCRLF +
       ' 		WHEN a.TIPO_ADEU = ' + #39 + 'FI' + #39 + ' THEN ' + #39 + 'FIRA' + #39 + ' END)AdeudoBinter, ' + coCRLF +
       '  (Select id_cred_fira_n from cr_am_dispf ad where ad.ID_CREDITO = a.ID_CREDITO)id_cred_fira_n,      ' + coCRLF +
       '  (Select num_control_Fira from cr_am_dispf ad where ad.ID_CREDITO = a.ID_CREDITO)num_control_Fira,  ' + coCRLF +
       '  (Select id_cred_fira_gar from cr_am_dispf ad where ad.ID_CREDITO = a.ID_CREDITO)id_cred_fira_gar ' + coCRLF +
    'FROM                                        ' + coCRLF +
     '	  CR_AM_OTRADEU a, CR_CREDITO C, ' + coCRLF +
      '	  CONTRATO CO, PERSONA P,  ' + coCRLF +
       '	 domicilio d, poblacion po ' + coCRLF +
    ' WHERE                                        ' + coCRLF +
      '	  a.ID_CREDITO = C.ID_CREDITO AND ' + coCRLF +
      '	  C.ID_CONTRATO = CO.ID_CONTRATO AND ' + coCRLF +
      '	  CO.ID_TITULAR = P.ID_PERSONA AND ' + coCRLF +
      '	  P.ID_DOMICILIO = d.ID_DOMICILIO AND ' + coCRLF +
      '	  d.CVE_ESTADO = po.CVE_POBLACION ';
  if trim(edPromotorO.Text) <> '' then
  vlSQL := vlSQL +
    'and c.ID_PROM_ADM = ' + EdPromotorO.Text;

  vgQryAdeudos  := GetSQLQueryNoNil(vlSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
  If Assigned(vgQryAdeudos) Then
  begin
    try
    vgQryAdeudos.FieldByName('ID_DISPOSICION').DisplayLabel := 'ID DISPOSICION';
    vgQryAdeudos.FieldByName('ID_DISPOSICION').DisplayWidth := 24;
    vgQryAdeudos.FieldByName('NOMBRE').DisplayLabel := 'NOMBRE DEL ACREDITADO';
    vgQryAdeudos.FieldByName('NOMBRE').DisplayWidth := 24;
    vgQryAdeudos.FieldByName('EDO').DisplayLabel := 'ESTADO/REGIÓN';
    vgQryAdeudos.FieldByName('EDO').DisplayWidth := 24;
    vgQryAdeudos.FieldByName('IDDESPACHO').DisplayLabel := 'ID DESPACHO ';
    vgQryAdeudos.FieldByName('IDDESPACHO').DisplayWidth := 24;
    vgQryAdeudos.FieldByName('NOMBRE_DESPACHO').DisplayLabel := 'NOMBRE DEL DESPACHO';
    vgQryAdeudos.FieldByName('NOMBRE_DESPACHO').DisplayWidth := 24;
    vgQryAdeudos.FieldByName('ID_PROM_ADM').DisplayLabel := 'ID PROMOTOR';
    vgQryAdeudos.FieldByName('ID_PROM_ADM').DisplayWidth := 24;
    vgQryAdeudos.FieldByName('NOMBRE_PROMOTOR').DisplayLabel := 'NOMBRE DEL PROMOTOR';
    vgQryAdeudos.FieldByName('NOMBRE_PROMOTOR').DisplayWidth := 24;
    vgQryAdeudos.FieldByName('SECUENCIA').DisplayLabel := 'SECUENCIA';
    vgQryAdeudos.FieldByName('SECUENCIA').DisplayWidth := 24;
    vgQryAdeudos.FieldByName('CONCEPTO').DisplayLabel := 'CONCEPTO';
    vgQryAdeudos.FieldByName('CONCEPTO').DisplayWidth := 24;
    vgQryAdeudos.FieldByName('IMPORTE').DisplayLabel := 'IMPORTE CONCEPTO';
    vgQryAdeudos.FieldByName('IMPORTE').DisplayWidth := 24;
    vgQryAdeudos.FieldByName('F_ORIGEN').DisplayLabel := 'FECHA DE ORÍGEN';
    vgQryAdeudos.FieldByName('F_ORIGEN').DisplayWidth := 24;
    vgQryAdeudos.FieldByName('F_COBRO').DisplayLabel := 'FECHA DE COBRO';
    vgQryAdeudos.FieldByName('F_COBRO').DisplayWidth := 24;
    vgQryAdeudos.FieldByName('ADEUDOBINTER').DisplayLabel := 'TIPO DE ADEUDO';
    vgQryAdeudos.FieldByName('ADEUDOBINTER').DisplayWidth := 24;
    vgQryAdeudos.FieldByName('ID_CRED_FIRA_N').DisplayLabel := 'ID CREDITO FIRA NORMAL';
    vgQryAdeudos.FieldByName('ID_CRED_FIRA_N').DisplayWidth := 24;
    vgQryAdeudos.FieldByName('NUM_CONTROL_FIRA').DisplayLabel := 'NUM CONTROL  FIRA';
    vgQryAdeudos.FieldByName('NUM_CONTROL_FIRA').DisplayWidth := 24;
    vgQryAdeudos.FieldByName('ID_CRED_FIRA_GAR').DisplayLabel := 'ID CREDITO FIRA GARANTÍA';
    vgQryAdeudos.FieldByName('ID_CRED_FIRA_GAR').DisplayWidth := 24;

    sgOtrAdeu.AddQry(vgQryAdeudos,True,True,-1,-1,-1,True);
    finally vgQryAdeudos.Free;
    end;
  end;
//
end;

procedure TWCrAmMacro.Seguro;
Var
  vlSQL : String;
  vgQrySeguro : TQuery;
  vlQry : TQuery;
begin
  sgSeguro.Clear('NO EXISTEN DATOS'#30'>C');

  vlSQL :=
    ' select sp.ID_CREDITO ID_DISPOSICION, ' + coCRLF +
    '        po.DESC_POBLACION EDO, ' + coCRLF +
    '        p.nombre, ' + coCRLF +
    '        (select desp.Id_Despacho ' + coCRLF +
    '         from   cr_am_dispf desp ' + coCRLF +
    '         where  desp.ID_CREDITO = sp.ID_CREDITO) IdDespacho, ' + coCRLF +
    '        (select Nombre ' + coCRLF +
    '         from   cr_am_dispf desp, ' + coCRLF +
    '                persona pe ' + coCRLF +
    '         where  desp.ID_CREDITO = sp.ID_CREDITO and desp.id_despacho = pe.ID_PERSONA) Nombre_Despacho, ' + coCRLF +
    '        cr.ID_PROM_ADM, ' + coCRLF +
    '        (select Nombre ' + coCRLF +
    '         from   Persona pe ' + coCRLF +
    '         where  pe.ID_PERSONA = cr.ID_PROM_ADM) Nombre_Promotor, ' + coCRLF +
    '        sp.NUM_POLIZA, ' + coCRLF +
    '        sp.PRIMA, ' + coCRLF +
    '        sp.COBERTURA, ' + coCRLF +
    '        (case ' + coCRLF +
    '           when sp.UNIDAD = ''CA'' then ''CABEZAS'' ' + coCRLF +
    '           when sp.UNIDAD = ''VI'' then ''VIDA'' ' + coCRLF +
    '           when sp.UNIDAD = ''HA'' then ''HECTARIA'' ' + coCRLF +
    '           when sp.UNIDAD = ''MA'' then ''MAQUINARIA'' ' + coCRLF +
    '         end) UNIDAD, ' + coCRLF +
    '        sp.F_INI_VIG, ' + coCRLF +
    '        sp.F_FIN_VIG, ' + coCRLF +
    '        sp.F_PAGO FPagoBindeAcre, ' + coCRLF +
    '        sp.F_COBRO FPagoAcreaBin, ' + coCRLF +
    '        (case		 ' + coCRLF +
    ' 					when sp.F_INI_VIG is null or sp.F_FIN_VIG is null then '''' ' + coCRLF +
    ' 				  when sp.F_INI_VIG <= sysdate and sysdate <= sp.F_FIN_VIG and sp.F_PAGO is null and sp.F_COBRO is null then ''VIGENTE NO PAGADA'' ' + coCRLF +
    ' 					when sp.F_INI_VIG <= sysdate and sysdate <= sp.F_FIN_VIG and (sp.F_PAGO is not null or  sp.F_COBRO is not null) then ''VIGENTE PAGADA'' ' + coCRLF +
    ' 					when sp.F_INI_VIG <= sysdate and sp.F_FIN_VIG <= sysdate and sp.F_PAGO is null and sp.F_COBRO is null then ''VENCIDA NO PAGADA'' ' + coCRLF +
    ' 					when sp.F_INI_VIG <= sysdate and sp.F_FIN_VIG <= sysdate and (sp.F_PAGO is not null or  sp.F_COBRO is not null) then ''VENCIDA PAGADA''  ' + coCRLF +
    '           else '''' ' + coCRLF +
    '         end) STATUS, ' + coCRLF +
    ' 			 cast (trim(substr (sp.observaciones, 0, 254)) as char (254) ) as OBSERVACIONES, ' + coCRLF +
    '        sp.F_SINIESTRO, ' + coCRLF +
    '        sp.F_REPORTE, ' + coCRLF +
    '        sp.F_INDEMN, ' + coCRLF +
    '        sp.IMP_INDEMN, ' + coCRLF +
    '        sp.NUM_CHEQUE, ' + coCRLF +
    '        (select id_cred_fira_n ' + coCRLF +
    '         from   cr_am_dispf ad ' + coCRLF +
    '         where  ad.ID_CREDITO = cr.ID_CREDITO) id_cred_fira_n, ' + coCRLF +
    '        (select num_control_Fira ' + coCRLF +
    '         from   cr_am_dispf ad ' + coCRLF +
    '         where  ad.ID_CREDITO = cr.ID_CREDITO) num_control_Fira, ' + coCRLF +
    '        (select id_cred_fira_gar ' + coCRLF +
    '         from   cr_am_dispf ad ' + coCRLF +
    '         where  ad.ID_CREDITO = cr.ID_CREDITO) id_cred_fira_gar ' + coCRLF +
    ' from   cr_am_segupol sp, ' + coCRLF +
    '        Persona p, ' + coCRLF +
    '        contrato c, ' + coCRLF +
    '        cr_credito cr, ' + coCRLF +
    '        domicilio d, ' + coCRLF +
    '        poblacion po ' + coCRLF +
    ' where  sp.ID_CREDITO = cr.ID_CREDITO and cr.ID_CONTRATO = c.ID_CONTRATO and c.ID_TITULAR = p.ID_PERSONA and p.ID_DOMICILIO = d.ID_DOMICILIO and d.CVE_ESTADO = po.CVE_POBLACION ';

  if trim(edPromotorS.Text) <> '' then
    vlSQL := vlSQL +
      'and cr.ID_PROM_ADM = ' + EdPromotorS.Text;

  vgQrySeguro  := GetSQLQueryNoNil(vlSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
  If Assigned(vgQrySeguro) Then
  begin
    try
    vgQrySeguro.FieldByName('ID_DISPOSICION').DisplayLabel := 'ID DISPOSICION';
    vgQrySeguro.FieldByName('ID_DISPOSICION').DisplayWidth := 24;
    vgQrySeguro.FieldByName('NOMBRE').DisplayLabel := 'NOMBRE DEL ACREDITADO';
    vgQrySeguro.FieldByName('NOMBRE').DisplayWidth := 24;
    vgQrySeguro.FieldByName('EDO').DisplayLabel := 'ESTADO/REGIÓN';
    vgQrySeguro.FieldByName('EDO').DisplayWidth := 24;
    vgQrySeguro.FieldByName('IDDESPACHO').DisplayLabel := 'ID DESPACHO ';
    vgQrySeguro.FieldByName('IDDESPACHO').DisplayWidth := 24;
    vgQrySeguro.FieldByName('NOMBRE_DESPACHO').DisplayLabel := 'NOMBRE DEL DESPACHO';
    vgQrySeguro.FieldByName('NOMBRE_DESPACHO').DisplayWidth := 24;
    vgQrySeguro.FieldByName('ID_PROM_ADM').DisplayLabel := 'ID PROMOTOR';
    vgQrySeguro.FieldByName('ID_PROM_ADM').DisplayWidth := 24;
    vgQrySeguro.FieldByName('NOMBRE_PROMOTOR').DisplayLabel := 'NOMBRE DEL PROMOTOR';
    vgQrySeguro.FieldByName('NOMBRE_PROMOTOR').DisplayWidth := 24;
    vgQrySeguro.FieldByName('NUM_POLIZA').DisplayLabel := 'NUM DE POLIZA/CONSTANCIA';
    vgQrySeguro.FieldByName('NUM_POLIZA').DisplayWidth := 24;
    vgQrySeguro.FieldByName('PRIMA').DisplayLabel := 'PRIMA';
    vgQrySeguro.FieldByName('PRIMA').DisplayWidth := 24;
    vgQrySeguro.FieldByName('COBERTURA').DisplayLabel := 'COBERTURA / Unidades aseguradas';
    vgQrySeguro.FieldByName('COBERTURA').DisplayWidth := 24;
    vgQrySeguro.FieldByName('UNIDAD').DisplayLabel := 'UNIDAD / HAS. CABEZAS ';
    vgQrySeguro.FieldByName('UNIDAD').DisplayWidth := 24;
    vgQrySeguro.FieldByName('F_INI_VIG').DisplayLabel := 'VIGENCIA INICIAL';
    vgQrySeguro.FieldByName('F_INI_VIG').DisplayWidth := 24;
    vgQrySeguro.FieldByName('F_FIN_VIG').DisplayLabel := 'VIGENCIA VENCIMIENTO';
    vgQrySeguro.FieldByName('F_FIN_VIG').DisplayWidth := 24;
    vgQrySeguro.FieldByName('FPAGOBINDEACRE').DisplayLabel := 'FECHA PAGO BINTER POR CUENTA  DE ACREDITADO';
    vgQrySeguro.FieldByName('FPAGOBINDEACRE').DisplayWidth := 24;
    vgQrySeguro.FieldByName('FPAGOACREABIN').DisplayLabel := 'FECHA PAGO ACREDITADO A BINTER';
    vgQrySeguro.FieldByName('FPAGOACREABIN').DisplayWidth := 24;
    vgQrySeguro.FieldByName('STATUS').DisplayLabel := 'STATUS';
    vgQrySeguro.FieldByName('STATUS').DisplayWidth := 24;
    vgQrySeguro.FieldByName('OBSERVACIONES').DisplayLabel := 'OBSERVACIONES';
    vgQrySeguro.FieldByName('OBSERVACIONES').DisplayWidth := 24;
    vgQrySeguro.FieldByName('F_SINIESTRO').DisplayLabel := 'FECHA DE SINIESTRO';
    vgQrySeguro.FieldByName('F_SINIESTRO').DisplayWidth := 24;
    vgQrySeguro.FieldByName('F_REPORTE').DisplayLabel := 'FECHA DE REPORTE DE SINIESTRO';
    vgQrySeguro.FieldByName('F_REPORTE').DisplayWidth := 24;
    vgQrySeguro.FieldByName('F_INDEMN').DisplayLabel := 'FECHA DE INDEMNIZACIÓN';
    vgQrySeguro.FieldByName('F_INDEMN').DisplayWidth := 24;
    vgQrySeguro.FieldByName('IMP_INDEMN').DisplayLabel := 'IMPORTE DE INDEMNIZACIÓN';
    vgQrySeguro.FieldByName('IMP_INDEMN').DisplayWidth := 24;
    vgQrySeguro.FieldByName('NUM_CHEQUE').DisplayLabel := 'NÚMERO DE CHEQUE DE INDEMNIZACIÓN';
    vgQrySeguro.FieldByName('NUM_CHEQUE').DisplayWidth := 24;
    vgQrySeguro.FieldByName('ID_CRED_FIRA_N').DisplayLabel := 'ID CREDITO FIRA NORMAL';
    vgQrySeguro.FieldByName('ID_CRED_FIRA_N').DisplayWidth := 24;
    vgQrySeguro.FieldByName('NUM_CONTROL_fIRA').DisplayLabel := 'NUM CONTROL  FIRA';
    vgQrySeguro.FieldByName('NUM_CONTROL_fIRA').DisplayWidth := 24;
    vgQrySeguro.FieldByName('ID_CRED_FIRA_GAR').DisplayLabel := 'ID CREDITO FIRA GARANTÍA';
    vgQrySeguro.FieldByName('ID_CRED_FIRA_GAR').DisplayWidth := 24;

    sgSeguro.AddQry(vgQrySeguro,True,True,-1,-1,-1,True);
    finally vgQrySeguro.Free;
    end;
  end;
//
end;

procedure TWCrAmMacro.SeguroP;
Var
  vlSQL : String;
  vgQrySeguroP : TQuery;
  vlQry : TQuery;
begin
  sgSeguroP.Clear('NO EXISTEN DATOS'#30'>C');

  vlSQL :=
    ' select sp.ID_CREDITO ID_DISPOSICION, ' + coCRLF +
    '        po.DESC_POBLACION EDO, ' + coCRLF +
    '        p.nombre, ' + coCRLF +
    '        sp.num_poliza, ' + coCRLF +
    '        sp.indem, ' + coCRLF +
    '        sp.imp ' + coCRLF +
    ' from   (select   id_credito, ' + coCRLF +
    '                  sp.num_poliza, ' + coCRLF +
    '                  count (sp.num_poliza) as indem, ' + coCRLF +
    '                  sum (sp.prima) as imp ' + coCRLF +
    '         from     cr_am_segupol sp ' + coCRLF +
    '         where		 sp.num_poliza is not null ' + coCRLF +
    '         group by id_credito, ' + coCRLF +
    '                  num_poliza) sp, ' + coCRLF +
    '        Persona p, ' + coCRLF +
    '        contrato c, ' + coCRLF +
    '        cr_credito cr, ' + coCRLF +
    '        domicilio d, ' + coCRLF +
    '        poblacion po ' + coCRLF +
    ' where  sp.ID_CREDITO = cr.ID_CREDITO and cr.ID_CONTRATO = c.ID_CONTRATO and c.ID_TITULAR = p.ID_PERSONA and p.ID_DOMICILIO = d.ID_DOMICILIO and d.CVE_ESTADO = po.CVE_POBLACION ';

  if trim(edPromotorSP.Text) <> '' then
    vlSQL := vlSQL +
      'and cr.ID_PROM_ADM = ' + EdPromotorSP.Text;

  vgQrySeguroP  := GetSQLQueryNoNil(vlSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
  If Assigned(vgQrySeguroP) Then
  begin
    try
    vgQrySeguroP.FieldByName('ID_DISPOSICION').DisplayLabel := 'ID DISPOSICION';
    vgQrySeguroP.FieldByName('ID_DISPOSICION').DisplayWidth := 24;
    vgQrySeguroP.FieldByName('NOMBRE').DisplayLabel := 'NOMBRE DEL ACREDITADO';
    vgQrySeguroP.FieldByName('NOMBRE').DisplayWidth := 24;
    vgQrySeguroP.FieldByName('EDO').DisplayLabel := 'ESTADO/REGIÓN';
    vgQrySeguroP.FieldByName('EDO').DisplayWidth := 24;
    vgQrySeguroP.FieldByName('NUM_POLIZA').DisplayLabel := 'NUM DE POLIZA/CONSTANCIA';
    vgQrySeguroP.FieldByName('NUM_POLIZA').DisplayWidth := 24;
    vgQrySeguroP.FieldByName('INDEM').DisplayLabel := 'TOTAL_SINIESTROS';
    vgQrySeguroP.FieldByName('INDEM').DisplayWidth := 24;
    vgQrySeguroP.FieldByName('IMP').DisplayLabel := 'TOTAL_IMPORTE';
    vgQrySeguroP.FieldByName('IMP').DisplayWidth := 24;

    sgSeguroP.AddQry(vgQrySeguroP,True,True,-1,-1,-1,True);
    finally vgQrySeguroP.Free;
    end;
  end;
//
end;

procedure TWCrAmMacro.dtpFIniBChange(Sender: TObject);
begin
edFechaIniB.Text := datetostr(dtpFIniB.Date);
end;

procedure TWCrAmMacro.dtpFFinBChange(Sender: TObject);
begin
edFechaFinB.Text := datetostr(dtpFFinB.Date);
end;

procedure TWCrAmMacro.btnConsultarBClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRAMMACRO_CONS2',True,True) then
   begin
      If edFechaIniB.Text = '' Then
      Begin
        ShowMessage('No ha ingresado la Fecha de Inicio');
        Exit;
      End;

      If edFechaFinB.Text = '' Then
      Begin
        ShowMessage('No ha ingresado la Fecha de Final');
        Exit;
      End;

      If dtpFIniB.Date > dtpFFinB.Date Then
      Begin
        ShowMessage('La Fecha Inicial no puede ser mayor que la Fecha Final');
        Exit;
      End;

      Bitacora;
   end;
end;


procedure TWCrAmMacro.btnConsultarCClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRAMMACRO_CONS3',True,True) then
      ConcInversion;
end;

procedure TWCrAmMacro.btnConsultarSClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRAMMACRO_CONS5',True,True) then
      Seguro;
end;

procedure TWCrAmMacro.btnConsultarOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRAMMACRO_CONS4',True,True) then
      OtrAdeudos;
end;

procedure TWCrAmMacro.btnConsultarDClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRAMMACRO_CONS1',True,True) then
      Disposicion;
end;

procedure TWCrAmMacro.btID_CREDITOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRAMMACRO_PROM1',True,True) then
      Objeto.Persona.Busca
end;

procedure TWCrAmMacro.BitBtn1Click(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRAMMACRO_PROM2',True,True) then
      Objeto.PersonaO.Busca
end;

procedure TWCrAmMacro.BitBtn2Click(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRAMMACRO_PROM3',True,True) then
      Objeto.PersonaS.Busca
end;

procedure TWCrAmMacro.ilID_PROMOTORCIEjecuta(Sender: TObject);
begin
  Objeto.Persona.FindKey([ilID_PROMOTORCI.buffer]);
end;

procedure TWCrAmMacro.ilID_PROMOTOROEjecuta(Sender: TObject);
begin
  Objeto.PersonaO.FindKey([ilID_PROMOTORO.buffer]);
end;

procedure TWCrAmMacro.ilID_PROMOTORSEjecuta(Sender: TObject);
begin
  Objeto.PersonaS.FindKey([ilID_PROMOTORS.buffer]);
end;

procedure TWCrAmMacro.BitBtn3Click(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRAMMACRO_PROM4',True,True) then
      Objeto.PersonaSP.Busca
end;

procedure TWCrAmMacro.btnConsultarSPClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRAMMACRO_CONS6',True,True) then
      SeguroP;
end;

procedure TWCrAmMacro.btnConsultaDClick(Sender: TObject);
Var
  vlSQL : String;
  vgQryDemandas : TQuery;
  vlQry : TQuery;
begin
   if Objeto.ValidaAccesoEsp('TCRAMMACRO_CONS7',True,True) then
   begin
      sgDemandas.Clear('NO EXISTEN DATOS'#30'>C');

      vlSQL :=
          ' select d.id_credito, ' + coCRLF +
          '        p.nombre, ' + coCRLF +
          '        d.cred_dem, ' + coCRLF +
          '        d.abog_resp, ' + coCRLF +
          '        d.tel_abog, ' + coCRLF +
          '        d.desp_resp, ' + coCRLF +
          '        d.region, ' + coCRLF +
          '        d.tel_desp, ' + coCRLF +
          '        d.f_t_abog_ex, ' + coCRLF +
          '        d.f_t_desp_ex, ' + coCRLF +
          '        d.f_demanda, ' + coCRLF +
          '        d.f_auto_ad, ' + coCRLF +
          '        d.f_exh, ' + coCRLF +
          '        d.env_exh, ' + coCRLF +
          '        d.exhorto, ' + coCRLF +
          '        d.mun_exh, ' + coCRLF +
          '        d.est_exh, ' + coCRLF +
          '        d.tipo_juicio, ' + coCRLF +
          '        d.num_exp, ' + coCRLF +
          '        d.juzgado, ' + coCRLF +
          '        d.tipo_juz, ' + coCRLF +
          '        pr.desc_l_producto, ' + coCRLF +
          '        d.tipo_gar, ' + coCRLF +
          '        d.imp_deman, ' + coCRLF +
          '        d.moneda, ' + coCRLF +
          '        cast (trim(substr (d.bien_emb, 0, 254)) as char (254) ) as bien_emb, ' + coCRLF +
          '        d.f_inf_proc, ' + coCRLF +
          '        cast (trim(substr (d.est_proc, 0, 254)) as char (254) ) as est_proc, ' + coCRLF +
          '        cast (trim(substr (d.observaciones, 0, 254)) as char (254) ) as observaciones ' + coCRLF +
          ' from   cr_credito c, ' + coCRLF +
          '        cr_am_dispf d, ' + coCRLF +
          '        cr_contrato cc, ' + coCRLF +
          '        contrato con, ' + coCRLF +
          '        cr_producto pr, ' + coCRLF +
          '        persona p ' + coCRLF +
          ' where  d.id_credito = c.id_credito ' + coCRLF +
          ' and    c.id_contrato = cc.id_contrato ' + coCRLF +
          ' and    con.id_contrato = cc.id_contrato ' + coCRLF +
          ' and    cc.cve_producto_cre = pr.cve_producto_cre ' + coCRLF +
          ' and    con.id_titular = p.id_persona ';

        vgQryDemandas  := GetSQLQueryNoNil(vlSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
        If Assigned(vgQryDemandas) Then
        begin
          try
          vgQryDemandas.FieldByName('id_credito').DisplayLabel := 'DISPOSICIÓN';
          vgQryDemandas.FieldByName('id_credito').DisplayWidth := 24;
          vgQryDemandas.FieldByName('cred_dem').DisplayLabel := 'CRÉDITO DEMANDADO';
          vgQryDemandas.FieldByName('cred_dem').DisplayWidth := 24;
          vgQryDemandas.FieldByName('nombre').DisplayLabel := 'ACREDITADO';
          vgQryDemandas.FieldByName('nombre').DisplayWidth := 24;
          vgQryDemandas.FieldByName('abog_resp').DisplayLabel := 'ABOGADO RESPONSABLE';
          vgQryDemandas.FieldByName('abog_resp').DisplayWidth := 24;
          vgQryDemandas.FieldByName('tel_abog').DisplayLabel := 'TELEFONO ABOGADO';
          vgQryDemandas.FieldByName('tel_abog').DisplayWidth := 24;
          vgQryDemandas.FieldByName('desp_resp').DisplayLabel := 'DESPACHO RESPONSABLE';
          vgQryDemandas.FieldByName('desp_resp').DisplayWidth := 24;
          vgQryDemandas.FieldByName('region').DisplayLabel := 'REGION';
          vgQryDemandas.FieldByName('region').DisplayWidth := 24;
          vgQryDemandas.FieldByName('tel_desp').DisplayLabel := 'TELEFONO DESPACHO';
          vgQryDemandas.FieldByName('tel_desp').DisplayWidth := 24;
          vgQryDemandas.FieldByName('f_t_abog_ex').DisplayLabel := 'F_TURNO A ABOGADO EXT';
          vgQryDemandas.FieldByName('f_t_abog_ex').DisplayWidth := 24;
          vgQryDemandas.FieldByName('f_t_desp_ex').DisplayLabel := 'F_TURNO A DESPACHO EXT';
          vgQryDemandas.FieldByName('f_t_desp_ex').DisplayWidth := 24;
          vgQryDemandas.FieldByName('f_demanda').DisplayLabel := 'FECHA DE DEMANDA';
          vgQryDemandas.FieldByName('f_demanda').DisplayWidth := 24;
          vgQryDemandas.FieldByName('f_auto_ad').DisplayLabel := 'F_AUTO ADMISORIO';
          vgQryDemandas.FieldByName('f_auto_ad').DisplayWidth := 24;
          vgQryDemandas.FieldByName('f_exh').DisplayLabel := 'FECHA DE EXHORTO';
          vgQryDemandas.FieldByName('f_exh').DisplayWidth := 24;
          vgQryDemandas.FieldByName('env_exh').DisplayLabel := 'ENVIADO A';
          vgQryDemandas.FieldByName('env_exh').DisplayWidth := 24;
          vgQryDemandas.FieldByName('exhorto').DisplayLabel := 'EXHORTO';
          vgQryDemandas.FieldByName('exhorto').DisplayWidth := 24;
          vgQryDemandas.FieldByName('mun_exh').DisplayLabel := 'MNPO EXHORTO';
          vgQryDemandas.FieldByName('mun_exh').DisplayWidth := 24;
          vgQryDemandas.FieldByName('est_exh').DisplayLabel := 'ESTADO EXHORTO';
          vgQryDemandas.FieldByName('est_exh').DisplayWidth := 24;
          vgQryDemandas.FieldByName('tipo_juicio').DisplayLabel := 'TIPO DE JUICIO';
          vgQryDemandas.FieldByName('tipo_juicio').DisplayWidth := 24;
          vgQryDemandas.FieldByName('desc_l_producto').DisplayLabel := 'TIPO DE CRÉDITO';
          vgQryDemandas.FieldByName('desc_l_producto').DisplayWidth := 24;
          vgQryDemandas.FieldByName('num_exp').DisplayLabel := 'NÚMERO DE EXPEDIENTE';
          vgQryDemandas.FieldByName('num_exp').DisplayWidth := 24;
          vgQryDemandas.FieldByName('juzgado').DisplayLabel := 'JUZGADO';
          vgQryDemandas.FieldByName('juzgado').DisplayWidth := 24;
          vgQryDemandas.FieldByName('tipo_juz').DisplayLabel := 'TIPO DE JUZGADO';
          vgQryDemandas.FieldByName('tipo_juz').DisplayWidth := 24;
          vgQryDemandas.FieldByName('tipo_gar').DisplayLabel := 'TIPO DE GARANTÍA';
          vgQryDemandas.FieldByName('tipo_gar').DisplayWidth := 24;
          vgQryDemandas.FieldByName('imp_deman').DisplayLabel := 'IMPORTE DE LA DEMANDA';
          vgQryDemandas.FieldByName('imp_deman').DisplayWidth := 24;
          vgQryDemandas.FieldByName('moneda').DisplayLabel := 'MONEDA';
          vgQryDemandas.FieldByName('moneda').DisplayWidth := 24;
          vgQryDemandas.FieldByName('bien_emb').DisplayLabel := 'BIENES EMBARGADOS';
          vgQryDemandas.FieldByName('bien_emb').DisplayWidth := 24;
          vgQryDemandas.FieldByName('f_inf_proc').DisplayLabel := 'FECHA DE INFORME PROCESAL';
          vgQryDemandas.FieldByName('f_inf_proc').DisplayWidth := 24;
          vgQryDemandas.FieldByName('est_proc').DisplayLabel := 'ESTADO PROCESAL';
          vgQryDemandas.FieldByName('est_proc').DisplayWidth := 24;
          vgQryDemandas.FieldByName('observaciones').DisplayLabel := 'OBSERVACIONES';
          vgQryDemandas.FieldByName('observaciones').DisplayWidth := 24;

          sgDemandas.AddQry(vgQryDemandas,True,True,-1,-1,-1,True);
          finally vgQryDemandas.Free;
          end;
        end;
   end;
end;

end.

