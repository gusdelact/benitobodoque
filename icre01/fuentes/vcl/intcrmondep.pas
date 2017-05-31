// Sistema         : Clase de CRLIQUIDA
// Fecha de Inicio : 15/01/2004
// Función forma   : Clase de CRLIQUIDA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrMonDep;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, IntLinkit, Ungene, Menus,
  //Unidades Adicionales
  IntParamCre,
  IntGenCre,
  IntCtoHeader,
  IntConTransa,
  IntCrBlqRece,
  IntMensaje
  ;
const
   CRED  = clRed;
   CBLUE = clBlue;
   CGREEN= clGreen;

Type
 TCrMonDep= class;

  TWCrMonDep=Class(TForm)
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
    sgcDATOS: TSGCtrl;
    edTIT_CHEQUERA: TEdit;
    edTIT_BANCO: TEdit;
    pmMODIFICA: TPopupMenu;
    ConsultaDisposicin1: TMenuItem;
    ConsultaDepsitosalaVista1: TMenuItem;
    N2: TMenuItem;
    InsertarNuevaOrdenLiquidacin1: TMenuItem;
    Edit2: TEdit;
    Edit5: TEdit;
    pgbMonitor: TProgressBar;
    Edit1: TEdit;
    tTiempo: TTimer;
    btFIND: TBitBtn;
    MErrores: TMemo;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure ConsultaDepsitosalaVista1Click(Sender: TObject);
    procedure tTiempoTimer(Sender: TObject);
    procedure btFINDClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    private
    { Private declarations }
    vlFinicio   : Boolean;
    vlEnterSit  : Boolean;
       procedure   MuestraDatos;
       Function    StpBloqueoAut(var pMsg: String): Boolean;
       Function    CadenaSql     : String;

    public
    { Public declarations }
    Objeto : TCrMonDep;
end;
 TCrMonDep= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        vgAutoriza       : String;

        { Public declarations }
        B_APL_AUTO              : TInterCampo;
        B_APL_DISP              : TInterCampo;
        B_APL_ACRE              : TInterCampo;
        SITUACION               : TInterCampo;
        F_OPER_INI              : TInterCampo;
        F_OPER_FIN              : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        ConTransa                : TConTransa;
        Contrato                 : TCtrlCto;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrMonDep.Create( AOwner : TComponent );
begin Inherited;
      B_APL_AUTO :=CreaCampo('B_APL_AUTO',ftString,tsNinguno,tsNinguno,False);
      B_APL_DISP :=CreaCampo('B_APL_DISP',ftString,tsNinguno,tsNinguno,False);
      B_APL_ACRE :=CreaCampo('B_APL_ACRE',ftString,tsNinguno,tsNinguno,False);
      SITUACION :=CreaCampo('SITUACION',ftString,tsNinguno,tsNinguno,False);
      With SITUACION do
      begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('0'); ComboDatos.Add(CSIT_NA);
            ComboLista.Add('1'); ComboDatos.Add(CSIT_AU);
            ComboLista.Add('2'); ComboDatos.Add(CSIT_CA);
      end;
      F_OPER_INI :=CreaCampo('F_OPER_INI',ftDate,tsNinguno,tsNinguno,False);
      F_OPER_FIN :=CreaCampo('F_OPER_FIN',ftDate,tsNinguno,tsNinguno,False);


      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrMonDep.Hlp';
      ShowMenuReporte:=True;

end;

Destructor TCrMonDep.Destroy;
begin
   inherited;
end;


function TCrMonDep.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMonDep;
begin
   W:=TWCrMonDep.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

(***********************************************FORMA CRLIQUIDA********************)
(*                                                                              *)
(*  FORMA DE CRLIQUIDA                                                            *)
(*                                                                              *)
(***********************************************FORMA CRLIQUIDA********************)
{---------------------------------------------------------------------------------------
                                Proceso de Bloqueo Automático
----------------------------------------------------------------------------------------}
function TWCrMonDep.StpBloqueoAut(var pMsg: String): Boolean;
var vlResult  : Boolean;
    StpBlqAut : TStoredProc;
    vlMsgErr  : String;
begin
    messageIniFinProceso(MErrores,CINICIO);
    vlResult := True;
    StpBlqAut := TStoredProc.Create(Nil);
    try
       with StpBlqAut do
       begin
          StpBlqAut.DatabaseName:= Objeto.Apli.DatabaseName;
          StpBlqAut.SessionName := Objeto.Apli.SessionName;
          StpBlqAut.StoredProcName:='PKGCRSALDOS.STPBLOQUEOAUT';
          Params.Clear;
          Params.CreateParam(ftDateTime,'PEFOPERACION',ptInput);
          Params.CreateParam(ftString,'PECVETIPOOPERAC',ptInput);
          Params.CreateParam(ftString,'PECVEUSUALTA',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('peFOperacion').AsDateTime := Objeto.Apli.DameFechaEmpresa;
          ParamByName('peCveTipoOperac').AsString := 'BL';
          ParamByName('peCveUsuAlta').AsString := Objeto.Apli.Usuario;
          ParamByName('peBCommit').AsString := CVERDAD;
          ExecProc;

          if ParamByName('PSResultado').AsInteger <> 0 then
          Begin
             vlMsgErr := 'Error [ ' + ParamByName('psRESULTADO').AsString + '] ' +
                         ParamByName('psTxResultado').AsString;
             AddLine(MErrores,vlMsgErr);
             vlResult := False;
             GenMsg('Monitor de Depósitos [' + vlMsgErr + ' ]',Objeto.Apli);
          end
          else Begin
             vlResult := True;
          end;
          UnPrepare;
       end;
    finally
       StpBlqAut.Free;
    end;
    StpBloqueoAut := vlResult;
    messageIniFinProceso(MErrores,CFINAL);
end;
{---------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------}
function TWCrMonDep.CadenaSql: String;
var vlSql     : String;
begin
   Objeto.F_OPER_INI.GetFromControl;
   Objeto.F_OPER_FIN.GetFromControl;

   vlSql  := ' SELECT  CRCC.ID_CREDITO   ,' + coCRLF +
             '         CRCC.CUENTA_BANCO ,' + coCRLF +
             '         P.NOMBRE TITULAR  ,' + coCRLF +
             '         NVL(PKGCRSALDOS.StpObtTipSdoCtaDV(CRCC.CUENTA_BANCO,3),0) IMP_DEPOSITADO,' + coCRLF +
             '         PKGCRSALDOS.ObtImporteVto(CRCC.ID_CREDITO,1) IMP_A_BLOQUEAR,' + coCRLF +
             '         NVL(PKGCRSALDOS.StpImpaBlq(CRCC.ID_CREDITO),0) IMP_X_BLOQUEAR,' + coCRLF +
             '         CRCC.SECUENCIA,' + coCRLF +
             '         PKGCRSALDOS.ObtFRecepRec(CRCC.ID_CREDITO,CRCC.ID_BANCO_CHQRA,CRCC.CUENTA_BANCO,CRCC.SECUENCIA) F_PROG_DESBLQ' + coCRLF +
             ' FROM CR_REL_CRED_CHEQ CRCC, ' + coCRLF +
             '      CONTRATO   C, ' + coCRLF +
             '      PERSONA    P, ' + coCRLF +
             '      CR_CREDITO CR ' + coCRLF +
             ' WHERE B_DEPOSITO_APORT = ''V'' ' + coCRLF +
             '   AND B_BLOQUEADA      = ''F'' ' + coCRLF +
             '   AND CR.SIT_CREDITO   NOT IN (''LQ'',''CA'') ' + coCRLF +
             '   AND CRCC.SIT_REL_CRED= ''AC'' ' + coCRLF +
             '   AND ( B_ACTIVA_BUSQ  = ''V''  ' + coCRLF +
             '       AND PKGCRSALDOS.StpImpaBlq(CRCC.ID_CREDITO) > 0) ' + coCRLF +
//             '       AND PKGCRSALDOS.ObtFRecepRec(CRCC.ID_CREDITO,CRCC.ID_BANCO_CHQRA, ' + coCRLF +
//             '	 	        CRCC.CUENTA_BANCO,CRCC.SECUENCIA) <= ' + SQLFecha(Objeto.Apli.DameFechaEmpresa) + coCRLF +
             '   AND CRCC.CUENTA_BANCO = C.ID_CONTRATO ' + coCRLF +
             '   AND C.ID_TITULAR      = P.ID_PERSONA ' + coCRLF +
             '   AND CRCC.ID_CREDITO   = CR.ID_CREDITO ' + coCRLF +
             ' ORDER BY CRCC.ID_CREDITO, CRCC.SECUENCIA ' + coCRLF;
   CadenaSql := vlSql;
end;

procedure TWCrMonDep.MuestraDatos;
var vlQry : TQuery;
    vlsql : String;
    vlMsg : String;
begin
     vlQry := GetSQLQuery(CadenaSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

     try
        if vlQry <> nil then
        Begin
        //Datos que no se muestran
            vlQry.FieldByName('ID_CREDITO').Visible :=False;
            vlQry.FieldByName('F_PROG_DESBLQ').Visible :=False;
            vlQry.FieldByName('SECUENCIA').Visible :=False;

            vlQry.FieldByName('CUENTA_BANCO').DisplayWidth := 12;
            vlQry.FieldByName('TITULAR').DisplayWidth := 43;
            vlQry.FieldByName('IMP_DEPOSITADO').DisplayWidth := 14;
            vlQry.FieldByName('IMP_A_BLOQUEAR').DisplayWidth := 14;
            vlQry.FieldByName('IMP_X_BLOQUEAR').DisplayWidth := 14;

            TNumericField(vlQry.FieldByName('IMP_DEPOSITADO')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('IMP_A_BLOQUEAR')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('IMP_X_BLOQUEAR')).DisplayFormat := '###,###,###,###,###,###,##0.00';

            sgcDATOS.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY
        end
        else
        Begin
            sgcDATOS.Clear('NO EXISTEN DATOS'#30'>C');
        end;
     finally
       if vlQry <> nil then
          vlQry.free;
       //end if
     end;
     pgbMonitor.Position := 0;
end;

procedure TWCrMonDep.FormShow(Sender: TObject);
begin
    //Pinta los datos del panel inferior
    lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
    lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
end;

procedure TWCrMonDep.FormDestroy(Sender: TObject);
begin
//
end;

procedure TWCrMonDep.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

//Llama a la clase de Depositos a la vista
procedure TWCrMonDep.ConsultaDepsitosalaVista1Click(Sender: TObject);
var  vlIdBcoChq         : String;
     vlCheqra         : String;
begin
     vlCheqra := sgcDATOS.CellStr['CUENTA_BANCO',sgcDATOS.SG.Row];
     if ( vlCheqra <> '' ) and ( Objeto.Contrato.FindKey( [ vlCheqra ] )  ) then
     begin
        Objeto.ConTransa.Contrato := Objeto.Contrato;
        Objeto.ConTransa.Catalogo;
     end;
end;

procedure TWCrMonDep.tTiempoTimer(Sender: TObject);
var vlPosicion: Integer;
    vlTiempo  : Integer;
    vlMsg     : String;
begin
   pgbMonitor.Position := pgbMonitor.Position + 1;
   if pgbMonitor.Position = 100 then
   Begin
     MuestraDatos;
    //AUTORIZA
     if not ( StpBloqueoAut(vlMsg) ) then
     BEGIN
       AddLine(MErrores,'PROBLEMAS AL AUTORIZAR LA CUENTA: '+ vlMsg);
       EXECUTE_MUESTRAMENSAJE('PROBLEMAS AL AUTORIZAR LA CUENTA: '+ vlMsg);
     END;
     MuestraDatos;
     pgbMonitor.Position := 0;
   end;
end;

procedure TWCrMonDep.btFINDClick(Sender: TObject);
var vlMsg: String;
begin
   MuestraDatos;
  //AUTORIZA
   if not ( StpBloqueoAut(vlMsg)) then
   BEGIN
     AddLine(MErrores,'PROBLEMAS AL AUTORIZAR LA CUENTA: '+ vlMsg);
     EXECUTE_MUESTRAMENSAJE('PROBLEMAS AL AUTORIZAR LA CUENTA: '+ vlMsg);
   END;
   MuestraDatos;
   pgbMonitor.Position := 0;
end;

procedure TWCrMonDep.InterForma1DespuesShow(Sender: TObject);
begin
  MuestraDatos;
end;

end.
