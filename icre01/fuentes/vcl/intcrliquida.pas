// Sistema         : Clase de CRLIQUIDA
// Fecha de Inicio : 15/01/2004
// Función forma   : Clase de CRLIQUIDA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :     
Unit IntCrliquida;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, IntLinkit, Ungene,
  //Unidades Adicionales
  IntParamCre,
  IntGenCre,
  IntCrCto,
  IntCrCredito,
  IntCrAcredit,
  IntCrProveed,
  IntCrLiqDis,
  IntConTransa,
  IntCractmech,
  IntCtoHeader, Menus,
  IntCrLiChRe,
  IntChCte,
  IntCrLiqMedi
  ;
const
   coPosSel = 17;
   coPosAgr = 18;

   CRED  = clRed;
   CBLUE = clBlue;
   CGREEN= clGreen;

   C_DISPCS = 'DISPCS';
   CSIT_DE  = 'DE';
Type
 TCrliquida= class;

  TWCrliquida=Class(TForm)
    InterForma1             : TInterForma;
    cbDISPOSICION: TCheckBox;
    edNOM_CREDITO: TEdit;
    btDISPOCISION: TBitBtn;
    edDISPOSICION: TEdit;
    Label1: TLabel;
    cbACREDITADO: TCheckBox;
    edNOM_ACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edACREDITADO: TEdit;
    Label2: TLabel;
    cbPROVEEDOR: TCheckBox;
    edNOM_PROVEEDOR: TEdit;
    btPROVEEDOR: TBitBtn;
    edPROVEEDOR: TEdit;
    Label3: TLabel;
    cbMEDIOS: TCheckBox;
    edNOMBRE_MEDIO: TEdit;
    btMEDIO: TBitBtn;
    edMEDIO: TEdit;
    Label4: TLabel;
    MErrores: TMemo;
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
    edTIT_MEDIO_LIQ: TEdit;
    edTIT_LIQUIDA: TEdit;
    edTIT_CHEQUERA: TEdit;
    edTIT_BANCO: TEdit;
    edTIT_BENEF: TEdit;
    edTIT_SITUACION: TEdit;
    edTIT_IMPORTE: TEdit;
    edTIT_DISP: TEdit;
    ilACREDITADO: TInterLinkit;
    ilDISPOSICION: TInterLinkit;
    ilPROVEEDOR: TInterLinkit;
    ilMEDIO: TInterLinkit;
    Edit1: TEdit;
    Edit2: TEdit;
    btAGRUPA: TBitBtn;
    btCANCELA: TBitBtn;
    btAUTORIZA: TBitBtn;
    Label6: TLabel;
    edF_OPER_INIC: TEdit;
    Label5: TLabel;
    edF_OPER_FIN: TEdit;
    dtF_OPER_FIN: TInterDateTimePicker;
    dtF_OPER_INIC: TInterDateTimePicker;
    btBUSCA: TBitBtn;
    rgSITUACION: TRadioGroup;
    pmMODIFICA: TPopupMenu;
    Modificar1: TMenuItem;
    N1: TMenuItem;
    ConsultaDisposicin1: TMenuItem;
    ConsultaAutorizacin1: TMenuItem;
    Edit3: TEdit;
    ConsultadatosdelaChequera1: TMenuItem;
    ConsultaDepsitosalaVista1: TMenuItem;
    btDESAGRUPAR: TBitBtn;
    Edit4: TEdit;
    N2: TMenuItem;
    InsertarNuevaOrdenLiquidacin1: TMenuItem;
    chAGRUP_TODOS: TCheckBox;
    Label7: TLabel;
    edLIQUIDACION: TEdit;
    btLIQUIDACION: TBitBtn;
    edDESC_LIQUIDA: TEdit;
    cbLIQUIDACION: TCheckBox;
    ilLIQUIDACION: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btDISPOCISIONClick(Sender: TObject);
    procedure cbDISPOSICIONClick(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilDISPOSICIONEjecuta(Sender: TObject);
    procedure cbACREDITADOClick(Sender: TObject);
    procedure btPROVEEDORClick(Sender: TObject);
    procedure ilPROVEEDOREjecuta(Sender: TObject);
    procedure cbPROVEEDORClick(Sender: TObject);
    procedure btMEDIOClick(Sender: TObject);
    procedure ilMEDIOEjecuta(Sender: TObject);
    procedure cbMEDIOSClick(Sender: TObject);
    procedure rgSITUACIONClick(Sender: TObject);
    procedure btBUSCAClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure sgcDATOSDblClick(Sender: TObject);
    procedure sgcDATOSCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure btAUTORIZAClick(Sender: TObject);
    procedure btCANCELAClick(Sender: TObject);
    procedure btAGRUPAClick(Sender: TObject);
    procedure btDESAGRUPARClick(Sender: TObject);
    procedure Modificar1Click(Sender: TObject);
    procedure ConsultaDisposicin1Click(Sender: TObject);
    procedure ConsultaAutorizacin1Click(Sender: TObject);
    procedure ConsultadatosdelaChequera1Click(Sender: TObject);
    procedure ConsultaDepsitosalaVista1Click(Sender: TObject);
    procedure InsertarNuevaOrdenLiquidacin1Click(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure chAGRUP_TODOSClick(Sender: TObject);
    procedure btLIQUIDACIONClick(Sender: TObject);
    procedure cbLIQUIDACIONClick(Sender: TObject);
    procedure ilLIQUIDACIONEjecuta(Sender: TObject);
    private
    { Private declarations }
    vlTotalGpo  : Double;
    vlFinicio   : Boolean;
    vlEnterSit  : Boolean;
       procedure   MuestraDatosLiq;
       Function    CadenaSql : String;
       Procedure   Botones;
       procedure   selecciona(sColum: string; nColum : Integer);
       procedure   MarcaGrupo (col, pGpoLiq : String);
    public
    { Public declarations }
    Objeto : TCrliquida;
        function    AutorizaLiquidacion( pCveMedio : String; pRefExterna : String;
                                         pIdCredito : Integer ): Boolean;
        function    CancelaOrden( pCveMedio : String; pRefExterna : String;
                                  pIdCredito : Integer ): Boolean;
        function    AgrupaSolic( pCveMedio : String; pRefExterna : String;
                                 pIdCredito : Integer; pIdGpoLiq : Integer; var vsIdGpoLiq : Integer): Boolean;
        function    DesagrupSolic( pCveMedio  : String; pRefExterna : String;
                                   pIdCredito : Integer ): Boolean;
        Function    PerfilAutorizacion( pCveMedio, pCveLiquida: String ): string;
        Function    PerfilCancelacion( pCveMedio, pCveLiquida: String ) : string;
        function    ReactivaOrdLiq( pCveMedio,pRefExterna : String; pIdCredito,pIdGpoLiq : Integer): Boolean;
end;
 TCrliquida= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        vgIdGpoLiq       : String;
        vgAutoriza       : String;
        vgCancela        : String;

        { Public declarations }
        B_APL_AUTO              : TInterCampo;
        B_APL_DISP              : TInterCampo;
        B_APL_ACRE              : TInterCampo;
        B_APL_PROV              : TInterCampo;
        B_APL_MED               : TInterCampo;
        B_APL_LIQ               : TInterCampo;
        SITUACION               : TInterCampo;
        F_OPER_INI              : TInterCampo;
        F_OPER_FIN              : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Autorizacion             : TCrCto;
        Disposicion              : TcrCredito;
        Acreditado               : TCrAcredit;
        Proveedor                : Tcrproveed;
        Medios                   : TCrLiqMedi;
        Liquida                  : TCrLiqDis;
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


constructor TCrliquida.Create( AOwner : TComponent );
begin Inherited;
      B_APL_AUTO :=CreaCampo('B_APL_AUTO',ftString,tsNinguno,tsNinguno,False);
      B_APL_DISP :=CreaCampo('B_APL_DISP',ftString,tsNinguno,tsNinguno,False);
      B_APL_ACRE :=CreaCampo('B_APL_ACRE',ftString,tsNinguno,tsNinguno,False);
      B_APL_PROV :=CreaCampo('B_APL_PROV',ftString,tsNinguno,tsNinguno,False);
      B_APL_MED  :=CreaCampo('B_APL_MED',ftString,tsNinguno,tsNinguno,False);
      B_APL_LIQ  :=CreaCampo('B_APL_LIQ',ftString,tsNinguno,tsNinguno,False);
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
      HelpFile := 'IntCrliquida.Hlp';
      ShowMenuReporte:=True;

      Autorizacion := TCrCto.Create(Self);
      Autorizacion.MasterSource:=Self;

      Disposicion := TcrCredito.Create(Self);
      Disposicion.MasterSource:=Self;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource:=Self;
      Acreditado.BuscaWhereString := 'CR_ACREDITADO.SIT_ACREDITADO =' + #39 + CSIT_AC + #39;
      Acreditado.FilterString := Acreditado.BuscaWhereString;

      Proveedor := Tcrproveed.Create(Self);
      Proveedor.MasterSource:=Self;

      Medios := TCrLiqMedi.Create(Self);
      Medios.MasterSource:=Self;

      Liquida := TCrLiqDis.Create(Self);
      Liquida.MasterSource:=Self;

      ConTransa := TConTransa.Create( Self );
      ConTransa.MasterSource  := Self;

      Contrato  := TCtrlCto.Create( Self );
      Contrato.MasterSource   := Self;

end;

Destructor TCrliquida.Destroy;
begin
   if Autorizacion  <> nil then
      Autorizacion.Free;
   //end if

   if Disposicion  <> nil then
      Disposicion.Free;
   //end if

   if Acreditado <> nil then
      Acreditado.Free;
   //end if

   if Proveedor  <> nil then
      Proveedor.Free;
   //end if

   if Medios  <> nil then
      Medios.Free;
   //end if

   if Liquida  <> nil then
      Liquida.Free;
   //end if

   if ConTransa <> nil then
      ConTransa.free;
   //end if

   if Contrato <> nil then
      Contrato.Free;
   //end if
   inherited;
end;


function TCrliquida.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrliquida;
begin
   W:=TWCrliquida.Create(Self);
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
                        Autoriza Orden de Liquidación
----------------------------------------------------------------------------------------}
function TWCrliquida.AutorizaLiquidacion( pCveMedio : String; pRefExterna : String;
                                         pIdCredito : Integer): Boolean;
var vlResult         : Boolean;
    StpAutorizaOrden : TStoredProc;
    vlMsgErr         : String;
begin
    vlResult := True;
    StpAutorizaOrden := TStoredProc.Create(Self);
    try
       with StpAutorizaOrden do
       begin
          StpAutorizaOrden.DatabaseName:= Objeto.Apli.DatabaseName;
          StpAutorizaOrden.SessionName:= Objeto.Apli.SessionName;
          StpAutorizaOrden.StoredProcName:='PKGCRLIQUIDA.STPAUTOORDENLIQ';

          Params.Clear;
          Params.CreateParam(ftString,'PECVEAPLI',ptInput);
          Params.CreateParam(ftString,'PECVEINDADIC',ptInput);
          Params.CreateParam(ftString,'PECVEMEDIO',ptInput);
          Params.CreateParam(ftString,'PEREFEXTERNA',ptInput);
          Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
          Params.CreateParam(ftString,'PECVEUSUAUTORIZA',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('PECVEAPLI').AsString := Objeto.Apli.Apli;
          ParamByName('PECVEINDADIC').AsString := Objeto.Apli.Indicador;
          ParamByName('PECVEMEDIO').AsString := pCveMedio;
          ParamByName('PEREFEXTERNA').AsString := pRefExterna;
          ParamByName('PEIDCREDITO').AsInteger := pIdCredito;
          ParamByName('PECVEUSUAUTORIZA').AsString := Objeto.Apli.Usuario;
          ParamByName('PEBCOMMIT').AsString := CVERDAD;
          ExecProc;

          if ParamByName('PSResultado').AsInteger <> 0 then
          Begin
             vlMsgErr :=  '    ' + ParamByName('psRESULTADO').AsString + ' : ' + ParamByName('psTxResultado').AsString;
             ShowMessage(vlMsgErr);
             AddLine(MErrores, ' ');
             AddLine(MErrores,vlMsgErr);
             AddLine(MErrores, ' ');
             vlResult := False;
             vlResult := False;
          end;
          UnPrepare;
       end;
    finally
       StpAutorizaOrden.Free;
    end;
    AutorizaLiquidacion:= vlResult;
end;
{---------------------------------------------------------------------------------------
                        Cancela Orden de Liquidación
----------------------------------------------------------------------------------------}
function TWCrliquida.CancelaOrden( pCveMedio  : String; pRefExterna : String;
                                   pIdCredito : Integer ): Boolean;
var vlResult         : Boolean;
    StpCancelaOrden  : TStoredProc;
    vlMsgErr         : String;
begin
    vlResult := True;
    StpCancelaOrden := TStoredProc.Create(Self);
    try
       with StpCancelaOrden do
       begin
          StpCancelaOrden.DatabaseName:= Objeto.Apli.DatabaseName;
          StpCancelaOrden.SessionName:= Objeto.Apli.SessionName;
          StpCancelaOrden.StoredProcName:='PKGCRLIQUIDA.STPCANCORDENLIQ';

          Params.Clear;
          Params.CreateParam(ftString,'PECVEAPLI',ptInput);
          Params.CreateParam(ftString,'PECVEINDADIC',ptInput);
          Params.CreateParam(ftString,'PECVEMEDIO',ptInput);
          Params.CreateParam(ftString,'PEREFEXTERNA',ptInput);
          Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
          Params.CreateParam(ftString,'PECVEUSUARIOCANC',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('PECVEAPLI').AsString := Objeto.Apli.Apli;
          ParamByName('PECVEINDADIC').AsString := Objeto.Apli.Indicador;
          ParamByName('PECVEMEDIO').AsString := pCveMedio;
          ParamByName('PEREFEXTERNA').AsString := pRefExterna;
          ParamByName('PEIDCREDITO').AsInteger := pIdCredito;
          ParamByName('PECVEUSUARIOCANC').AsString := Objeto.Apli.Usuario;
          ParamByName('PEBCOMMIT').AsString := CVERDAD;
          ExecProc;

          if ParamByName('PSResultado').AsInteger <> 0 then
          Begin
             vlMsgErr :=  '    ' + ParamByName('psRESULTADO').AsString + ' : ' + ParamByName('psTxResultado').AsString;
             ShowMessage(vlMsgErr);
             AddLine(MErrores, ' ');
             AddLine(MErrores,vlMsgErr);
             AddLine(MErrores, ' ');
             vlResult := False;
          end;
          UnPrepare;
       end;
    finally
       STPCancelaOrden.Free;
    end;
    CancelaOrden:= vlResult;
end;
{---------------------------------------------------------------------------------------
                        Agrupa solicitudes de liquidación
----------------------------------------------------------------------------------------}
function TWCrliquida.AgrupaSolic( pCveMedio : String; pRefExterna : String;
                                  pIdCredito : Integer; pIdGpoLiq : Integer; var vsIdGpoLiq : Integer): Boolean;
var vlResult         : Boolean;
    StpAgrupaSolic   : TStoredProc;
    vlMsgErr         : String;
begin
    vlResult := True;
    StpAgrupaSolic := TStoredProc.Create(Self);
    try
       with StpAgrupaSolic do
       begin
          StpAgrupaSolic.DatabaseName:= Objeto.Apli.DatabaseName;
          StpAgrupaSolic.SessionName:= Objeto.Apli.SessionName;
          StpAgrupaSolic.StoredProcName:='PKGCRLIQUIDA.STPAGRUPA';

          Params.Clear;
          Params.CreateParam(ftString,'PECVEMEDIO',ptInput);
          Params.CreateParam(ftString,'PEREFEXTERNA',ptInput);
          Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
          Params.CreateParam(ftInteger,'PEIDGRUPOLIQ',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftInteger,'PSIDGRUPOLIQ',ptOutput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('PECVEMEDIO').AsString := pCveMedio;
          ParamByName('PEREFEXTERNA').AsString := pRefExterna;
          ParamByName('PEIDCREDITO').AsInteger := pIdCredito;
          ParamByName('PEIDGRUPOLIQ').AsInteger := pIdGpoLiq;
          ParamByName('PEBCOMMIT').AsString := CVERDAD;
          ExecProc;

          if ParamByName('PSResultado').AsInteger = 0 then
          Begin
             vsIdGpoLiq := ParamByName('PSIDGRUPOLIQ').AsInteger;
          end
          else
          Begin
             vlMsgErr :=  '    ' + ParamByName('psRESULTADO').AsString + ' : ' + ParamByName('psTxResultado').AsString;
             ShowMessage(vlMsgErr);
             AddLine(MErrores, ' ');
             AddLine(MErrores,vlMsgErr);
             AddLine(MErrores, ' ');
             vlResult := False;
          end;
          UnPrepare;
       end;
    finally
       StpAgrupaSolic.Free;
    end;
    AgrupaSolic:= vlResult;
end;
{---------------------------------------------------------------------------------------
                        Desagrupa solicitudes de liquidación
----------------------------------------------------------------------------------------}
function TWCrliquida.DesagrupSolic( pCveMedio  : String; pRefExterna : String;
                                   pIdCredito : Integer ): Boolean;
var vlResult         : Boolean;
    STPDesAgrSol     : TStoredProc;
    vlMsgErr         : String;
begin
    vlResult := True;
    STPDesAgrSol := TStoredProc.Create(Self);
    try
       with STPDesAgrSol do
       begin
          STPDesAgrSol.DatabaseName:= Objeto.Apli.DatabaseName;
          STPDesAgrSol.SessionName:= Objeto.Apli.SessionName;
          STPDesAgrSol.StoredProcName:='PKGCRLIQUIDA.STPDESAGRUPA';

          Params.Clear;
          Params.CreateParam(ftString,'PECVEMEDIO',ptInput);
          Params.CreateParam(ftString,'PEREFEXTERNA',ptInput);
          Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('PECVEMEDIO').AsString := pCveMedio;
          ParamByName('PEREFEXTERNA').AsString := pRefExterna;
          ParamByName('PEIDCREDITO').AsInteger := pIdCredito;
          ParamByName('PEBCOMMIT').AsString := CVERDAD;
          ExecProc;

          if ParamByName('PSResultado').AsInteger <> 0 then
          Begin
             vlMsgErr :=  '    ' + ParamByName('psRESULTADO').AsString + ' : ' + ParamByName('psTxResultado').AsString;
             ShowMessage(vlMsgErr);
             AddLine(MErrores, ' ');
             AddLine(MErrores,vlMsgErr);
             AddLine(MErrores, ' ');
             vlResult := False;
          end;
          UnPrepare;
       end;
    finally
       STPDesAgrSol.Free;
    end;
    DesagrupSolic:= vlResult;
end;
{---------------------------------------------------------------------------------------
                        Valida Perfil de Autorización de liquidación
----------------------------------------------------------------------------------------}
function TWCrliquida.PerfilAutorizacion(pCveMedio, pCveLiquida: String): string;
Var vlSql       : String;
    vlAutLiq    : String;
Begin
   vlSql:= ' SELECT B_REQ_AUTOR ' +
           ' FROM CR_LIQ_PERFIL ' +
           ' WHERE CVE_GPO_ACCESO = ' + IntToStr(Objeto.Apli.CvePerfil) +
           ' AND CVE_MEDIO = ' + SQLStr(pCveMedio) +
           ' AND CVE_LIQUIDACION = ' + SQLStr(pCveLiquida);
   GetSQLStr(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'B_REQ_AUTOR',vlAutLiq, False);
   PerfilAutorizacion := vlAutLiq;
end;
{---------------------------------------------------------------------------------------
                        Valida Perfil de Cancelación de liquidación
----------------------------------------------------------------------------------------}
function TWCrliquida.PerfilCancelacion(pCveMedio, pCveLiquida: String): string;
Var vlSql       : String;
    vlCanLiq    : String;
Begin
   vlSql:= ' SELECT B_CANCELA ' +
           ' FROM CR_LIQ_PERFIL ' +
           ' WHERE CVE_GPO_ACCESO = ' + IntToStr(Objeto.Apli.CvePerfil) +
           ' AND CVE_MEDIO = ' + SQLStr(pCveMedio) +
           ' AND CVE_LIQUIDACION = ' + SQLStr(pCveLiquida);
   GetSQLStr(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'B_CANCELA',vlCanLiq, False);
   PerfilCancelacion := vlCanLiq;
end;
{---------------------------------------------------------------------------------------
                    Inserta Nueva Orden de solicitud de liquidación
----------------------------------------------------------------------------------------}
function TWCrliquida.ReactivaOrdLiq( pCveMedio,pRefExterna : String; pIdCredito,pIdGpoLiq : Integer): Boolean;
var vlResult         : Boolean;
    StpNewOrdenLiq   : TStoredProc;
    vlMsgErr         : String;
begin
    vlResult := True;
    StpNewOrdenLiq := TStoredProc.Create(Self);
    try
       with StpNewOrdenLiq do
       begin
          StpNewOrdenLiq.DatabaseName:= Objeto.Apli.DatabaseName;
          StpNewOrdenLiq.SessionName:= Objeto.Apli.SessionName;
          StpNewOrdenLiq.StoredProcName:='PKGCRLIQUIDA.STPREACTIVAORDENLIQ';

          Params.Clear;
          Params.CreateParam(ftString,'PECVEMEDIO',ptInput);
          Params.CreateParam(ftString,'PEREFEXTERNA',ptInput);
          Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
          Params.CreateParam(ftInteger,'PEIDGRUPO',ptInput);
          Params.CreateParam(ftString,'PECVEUSUALTA',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('PECVEMEDIO').AsString := pCveMedio;
          ParamByName('PEREFEXTERNA').AsString := pRefExterna;
          ParamByName('PEIDCREDITO').AsInteger := pIdCredito;
          ParamByName('PEIDGRUPO').AsInteger := pIdGpoLiq;
          ParamByName('PECVEUSUALTA').AsString := Objeto.Apli.Usuario;
          ParamByName('PEBCOMMIT').AsString := CVERDAD;
          ExecProc;

          if ParamByName('PSResultado').AsInteger <> 0 then
          Begin
             vlMsgErr :=  '    ' + ParamByName('psRESULTADO').AsString + ' : ' + ParamByName('psTxResultado').AsString;
             ShowMessage(vlMsgErr);
             AddLine(MErrores, ' ');
             AddLine(MErrores,vlMsgErr);
             AddLine(MErrores, ' ');
             vlResult := False;
          end;
          UnPrepare;
       end;
    finally
       StpNewOrdenLiq.Free;
    end;
    ReactivaOrdLiq := vlResult;
end;

{---------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------}
function TWCrliquida.CadenaSql: String;
var vlSql     : String;
    vlSit     : String;
begin
   if rgSITUACION.ItemIndex = 0 then
      vlSit := '                     AND SIT_LIQ_RECEP = ' + SQLStr(CSIT_NA) + coCRLF
   else if rgSITUACION.ItemIndex = 1 then
      vlSit := '                     AND SIT_LIQ_RECEP IN ( ' + SQLStr(CSIT_AU) + ',' + SQLStr(CSIT_RA) + ' )' + coCRLF
   else if rgSITUACION.ItemIndex = 2 then
      vlSit := '                     AND SIT_LIQ_RECEP = ' + SQLStr(CSIT_CA) + coCRLF;

   vlSql  := ' SELECT  ' + #39 + '  ' + #39 + ' AUT_CAN ,''  '' AGRUPAR ,' + coCRLF +
             '         CLR.ID_GRUPO_LIQ GRUPO   ,       CLR.ID_CREDITO  DISPOSICION ,' + coCRLF +
             '         CLR.CVE_MEDIO 	MEDIO   ,       CLR.LIQUIDACION             ,' + coCRLF +
             '         CLR.CHEQ_ORIGEN	        ,       P.NOMBRE 	BANCO	    ,' + coCRLF +
             '         CLR.CHEQ_DESTINO         ,       CLR.IMP_MOVTO 	IMPORTE	    ,' + coCRLF +
             '         CLR.NOMBRE_BENEFICIA BENEFICIARIO,       CLR.SIT_LIQ_RECEP       SITUACION   ,' + coCRLF +
             '         SUBSTR(PKGCRLIQUIDA.FunDameSitLiqExt( NVL(CLR.Fol_Movto_Liq,0), CLR.F_Operacion,CLR.Cve_Liquidacion),1,2)  SIT_EXT,' + coCRLF +
//             '         '' ''  SIT_EXT,' + coCRLF +
             '         CLR.AUTORIZACION         ,       CLR.REF_EXTERNA               ,' + coCRLF +
             '         CLR.ID_CONTRATANTE CONTRATANTE,  CLR.ID_BANCO_CHQRA ID_BANCO   ,' + coCRLF +
             '         CLR.TITULAR                   ,  CLR.CVE_LIQUIDACION LIQUIDA   ,' + coCRLF +
             '         CLR.B_ABONO_CUENTA            ,  CLR.CVE_TIPO_BENEF            ,' + coCRLF +
             '         CLR.CVE_SUC_BANCO             ,  CLR.MONEDA                    ,' + coCRLF +
             '         CLR.PRODUCTO                  ,  CLR.TASA                      ,' + coCRLF +
             '         SUBSTR(CLR.TX_DESC_INSTRUC,1,255) TX_DESC_INSTRUC' + coCRLF +
             ' FROM (' + coCRLF +
             '         SELECT RECEP.*, CLCR.CUENTA_BANCO CHEQ_DESTINO, CLCR.ID_BANCO_CHQRA,' + coCRLF +
             '                CLD.DESC_LIQUIDACION	  LIQUIDACION, CLCR.CVE_SUC_BANCO, CLM.FOL_MOVTO_LIQ' + coCRLF +
             '         FROM' + coCRLF +
             '         (  SELECT CLR.*, CR.ID_CONTRATO  AUTORIZACION,' + coCRLF +
             '                   CT.ID_CTO_LIQ 	        CHEQ_ORIGEN,    CTO.ID_TITULAR         TITULAR,' + coCRLF +
             '                   CCTO.CVE_PRODUCTO_CRE  PRODUCTO,       CTO.CVE_MONEDA         MONEDA,' + coCRLF +
             '                   CCTO.CVE_TASA_REFER     TASA' + coCRLF +
             '            FROM ( SELECT * FROM CR_TRANSACCION   ' + coCRLF +
             '                   WHERE CVE_OPERACION IN (''DISPCS'',''DISPCR'',''DSCSDL'', ''DSCRDL'')' + coCRLF +
             '                 )CT,' + coCRLF +
             '                 ( SELECT * FROM CR_LIQ_RECEP' + coCRLF +
             '                   WHERE CVE_MEDIO      NOT IN (''REMADD'')' + coCRLF +
             '                     AND F_OPERACION BETWEEN ' + SQLFecha(StrToDateTime(edF_OPER_INIC.Text)) + ' AND ' +
                                                               SQLFecha(StrToDateTime(edF_OPER_FIN.Text )) + coCRLF + vlSit +
             '                 ) CLR,' + coCRLF +
             '                 CR_CREDITO     CR,' + coCRLF +
             '                 CR_CESION      CS,' + coCRLF +
             '                 CR_CONTRATO    CCTO,' + coCRLF +
             '                 CONTRATO       CTO' + coCRLF +
             '            WHERE  1=1 ' + coCRLF +
             '             AND   CTO.ID_EMPRESA = ' + IntToStr(Objeto.Apli.IdEmpresa) + coCRLF; // LOLS 08 SEP 2005

             if cbDISPOSICION.Checked then
                vlSql := vlSql + ' AND CR.ID_CREDITO = ' + edDISPOSICION.Text + coCRLF;
             //end if
             if cbACREDITADO.Checked then
                vlSql := vlSql + ' AND CTO.ID_TITULAR = ' + edACREDITADO.Text + coCRLF;
             //end if
             if cbMEDIOS.Checked then
                vlSql := vlSql + ' AND CLR.CVE_MEDIO = ' + SQLStr(edMEDIO.Text) + coCRLF;
             //end if
             if cbPROVEEDOR.Checked then
                vlSql := vlSql + ' AND CS.ID_PROVEEDOR = ' + edPROVEEDOR.Text + coCRLF;
             //en if

   vlSql  := vlSql + '     AND CR.ID_TRANSAC_DISP = CT.ID_GRUPO_TRANSAC' + coCRLF +
             '             AND CR.REF_EXTERNA_LIQ = CLR.REF_EXTERNA' + coCRLF +
             '             AND CR.ID_CREDITO      = CLR.ID_CREDITO' + coCRLF +
             '             AND CS.ID_CESION(+)    = CR.ID_CREDITO' + coCRLF +
             '             AND CCTO.ID_CONTRATO   = CR.ID_CONTRATO' + coCRLF +
             '             AND CCTO.FOL_CONTRATO  = CR.FOL_CONTRATO' + coCRLF +
             '             AND CTO.ID_CONTRATO    = CR.ID_CONTRATO' + coCRLF +
             '          UNION' + coCRLF +        
             '            SELECT CLR.*, CR.ID_CONTRATO  AUTORIZACION,' + coCRLF +
             '                   TO_NUMBER(PKGCRPERIODO.STPObtChqCte(CS.ID_PROVEEDOR,''0'',CS.ID_CESION,''PR'',''AD'',''CR'')) CHEQ_ORIGEN,' + coCRLF +
             '                   CTO.ID_TITULAR         TITULAR,' + coCRLF +
             '                   CCTO.CVE_PRODUCTO_CRE  PRODUCTO, CTO.CVE_MONEDA         MONEDA,' + coCRLF +
             '                   CCTO.CVE_TASA_REFER    TASA' + coCRLF +
             '            FROM ( SELECT * FROM CR_LIQ_RECEP' + coCRLF +
             '                   WHERE CVE_MEDIO   IN (''REMADD'')' + coCRLF +
             '                     AND F_OPERACION BETWEEN ' + SQLFecha(StrToDateTime(edF_OPER_INIC.Text)) + ' AND ' +
                                                               SQLFecha(StrToDateTime(edF_OPER_FIN.Text )) + coCRLF + vlSit +
             '                 ) CLR,' + coCRLF +
             '                 CR_REMANENTE   CREM,' + coCRLF +
             '                 CR_CREDITO     CR,' + coCRLF +
             '                 CR_CESION      CS,' + coCRLF +
             '                 CR_CONTRATO    CCTO,' + coCRLF +
             '                 CONTRATO       CTO' + coCRLF +
             '            WHERE 1=1' + coCRLF +
             '             AND   CTO.ID_EMPRESA = ' + IntToStr(Objeto.Apli.IdEmpresa) + coCRLF; // LOLS 08 SEP 2005

             if cbDISPOSICION.Checked then
                vlSql := vlSql + ' AND CR.ID_CREDITO = ' + edDISPOSICION.Text + coCRLF;
             //end if
             if cbACREDITADO.Checked then
                vlSql := vlSql + ' AND CTO.ID_TITULAR = ' + edACREDITADO.Text + coCRLF;
             //end if
             if cbMEDIOS.Checked then
                vlSql := vlSql + ' AND CLR.CVE_MEDIO = ' + SQLStr(edMEDIO.Text) + coCRLF;
             //end if
             if cbPROVEEDOR.Checked then
                vlSql := vlSql + ' AND CS.ID_PROVEEDOR = ' + edPROVEEDOR.Text + coCRLF;
             //en if
   vlSql  := vlSql +
             '            AND CREM.REF_EXTERNA_LIQ = CLR.REF_EXTERNA' + coCRLF +
             '            AND CREM.ID_CESION       = CLR.ID_CREDITO' + coCRLF +
             '            AND CREM.ID_CESION       = CR.ID_CREDITO' + coCRLF +
             '            AND CS.ID_CESION         = CR.ID_CREDITO' + coCRLF +
             '            AND CCTO.ID_CONTRATO     = CR.ID_CONTRATO' + coCRLF +
             '            AND CCTO.FOL_CONTRATO    = CR.FOL_CONTRATO' + coCRLF +
             '            AND CTO.ID_CONTRATO      = CR.ID_CONTRATO' + coCRLF +
             '         ) RECEP,' + coCRLF +
             '         CR_LIQ_CHE_RECEP CLCR,' + coCRLF +
             '         CR_LIQUIDA_DISP  CLD, CR_LIQ_MOVTO CLM' + coCRLF +

             '         WHERE CLCR.CVE_MEDIO      = RECEP.CVE_MEDIO' + coCRLF +
             '           AND CLCR.REF_EXTERNA    = RECEP.REF_EXTERNA' + coCRLF +
             '           AND CLCR.ID_CREDITO     = RECEP.ID_CREDITO' + coCRLF +
             '           AND CLD.CVE_LIQUIDACION = RECEP.CVE_LIQUIDACION' + coCRLF +
             '           AND CLM.FOL_MOVTO(+)    = RECEP.FOL_MOVTO ' + coCRLF +
             '           AND CLM.ID_GRUPO_LIQ(+) = RECEP.ID_GRUPO_LIQ ' + coCRLF +
             '         ORDER BY RECEP.ID_GRUPO_LIQ DESC, RECEP.NOMBRE_BENEFICIA ASC' + coCRLF +
             '      ) CLR,' + coCRLF +
             '      PERSONA P' + coCRLF +
             ' WHERE 1 = 1' + coCRLF +
             '   AND CLR.CVE_MEDIO IN ( SELECT CVE_MEDIO FROM CR_LIQ_PERFIL WHERE CVE_GPO_ACCESO = ' +
                                                     IntToStr(Objeto.Apli.CvePerfil) + ' )' + coCRLF;

             if cbLIQUIDACION.Checked then
                vlSql := vlSql + ' AND CLR.CVE_LIQUIDACION = ' + SQLStr(edLIQUIDACION.Text) + coCRLF;
             //end if

   vlSql  := vlSql + ' AND CLR.ID_BANCO_CHQRA = P.ID_PERSONA ' + coCRLF;

   CadenaSql := vlSql;
end;

procedure TWCrliquida.MuestraDatosLiq;
var vlQry : TQuery;
    vlsql : String;
begin
     vlQry := GetSQLQuery(CadenaSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

     try
        if vlQry <> nil then
        Begin
        //Datos que no se muestran
            vlQry.FieldByName('GRUPO').Visible := False;
            vlQry.FieldByName('REF_EXTERNA').Visible := False;
            vlQry.FieldByName('CONTRATANTE').Visible := False;
            vlQry.FieldByName('ID_BANCO').Visible := False;
            vlQry.FieldByName('TITULAR').Visible := False;
            vlQry.FieldByName('PRODUCTO').Visible := False;
            vlQry.FieldByName('MONEDA').Visible := False;
            vlQry.FieldByName('TASA').Visible := False;
            vlQry.FieldByName('AUTORIZACION').Visible := False;
            vlQry.FieldByName('LIQUIDA').Visible := False;
            vlQry.FieldByName('B_ABONO_CUENTA').Visible := False;
            vlQry.FieldByName('CVE_TIPO_BENEF').Visible := False;
            vlQry.FieldByName('TX_DESC_INSTRUC').Visible := False;
            vlQry.FieldByName('CVE_SUC_BANCO').Visible := False;

            vlQry.FieldByName('AUT_CAN').DisplayWidth := 3;
            vlQry.FieldByName('AGRUPAR').DisplayWidth := 3;
            vlQry.FieldByName('DISPOSICION').DisplayWidth := 9;
            vlQry.FieldByName('MEDIO').DisplayWidth := 8;
            vlQry.FieldByName('LIQUIDACION').DisplayWidth := 10;
            vlQry.FieldByName('CHEQ_ORIGEN').DisplayWidth := 10;
            vlQry.FieldByName('BANCO').DisplayWidth := 24;
            vlQry.FieldByName('CHEQ_DESTINO').DisplayWidth := 14;
            vlQry.FieldByName('IMPORTE').DisplayWidth := 14;
            vlQry.FieldByName('BENEFICIARIO').DisplayWidth := 24;
            vlQry.FieldByName('SITUACION').DisplayWidth := 3;
            vlQry.FieldByName('SIT_EXT').DisplayWidth := 3;

            TNumericField(vlQry.FieldByName('IMPORTE')).DisplayFormat := '###,###,###,###,###,###,##0.00';

            sgcDATOS.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY
            sgcDATOS.ColumnByName('AUT_CAN').IsCheck := True;//DEFINIR EL CAMPO AUT DEL QUERY COMO CHECKBOX
            sgcDATOS.ColumnByName('AGRUPAR').IsCheck := True;//DEFINIR EL CAMPO AUT DEL QUERY COMO CHECKBOX

            Botones; //Habilita o deshabilita botones segun la situación
        end
        else
        Begin
            btAUTORIZA.Enabled := False;
            btCANCELA.Enabled := False;
            btAGRUPA.Enabled := False;
            btDESAGRUPAR.Enabled := False;
            pmMODIFICA.Items.Enabled := False;
            sgcDATOS.Clear('NO EXISTEN DATOS'#30'>C');
        end;
     finally
       if vlQry <> nil then
          vlQry.free;
       //end if
     end;
end;

procedure TWCrliquida.FormShow(Sender: TObject);
begin
     //Pinta los datos del panel inferior
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
    with Objeto do
    Begin
       B_APL_DISP.Control := cbDISPOSICION;
       B_APL_ACRE.Control := cbACREDITADO;
       B_APL_PROV.Control := cbPROVEEDOR;
       B_APL_MED.Control := cbMEDIOS;
       B_APL_LIQ.Control := cbLIQUIDACION;
       SITUACION.Control := rgSITUACION;
       F_OPER_INI.Control := edF_OPER_INIC;
       F_OPER_FIN.Control := edF_OPER_FIN;

       Disposicion.ID_CREDITO.Control := edDISPOSICION;
       //Disposicion.ContratoCre.Acreditado.Persona.Nombre.Control := edNOM_CREDITO; // LOLS 08 SEP 2005
       Disposicion.ContratoCre.Contrato.TITNombre.Control := edNOM_CREDITO;          // LOLS 08 SEP 2005
       Disposicion.GetParams(Objeto);
       edNOM_CREDITO.Hint := Disposicion.ContratoCre.Acreditado.Persona.Nombre.AsString;
       edNOM_CREDITO.ShowHint := True;

       Acreditado.ID_ACREDITADO.Control := edACREDITADO;
       Acreditado.Persona.Nombre.Control := edNOM_ACREDITADO;
       Acreditado.GetParams(Objeto);
       edNOM_ACREDITADO.Hint := Acreditado.Persona.Nombre.AsString;
       edNOM_ACREDITADO.ShowHint := True;

       Proveedor.ID_ACREDITADO.Control := edPROVEEDOR;
       Proveedor.Persona.Nombre.Control := edNOM_PROVEEDOR;
       Proveedor.GetParams(Objeto);
       edNOM_PROVEEDOR.Hint := Proveedor.Persona.Nombre.AsString;
       edNOM_PROVEEDOR.ShowHint := True;

       Medios.CVE_MEDIO.Control := edMEDIO;
       Medios.DESC_MEDIO.Control := edNOMBRE_MEDIO;
       Medios.GetParams(Objeto);

       Liquida.CVE_LIQUIDACION.Control := edLIQUIDACION;
       Liquida.DESC_LIQUIDACION.Control := edDESC_LIQUIDA;
       Liquida.GetParams(Objeto);

       edMEDIO.Hint := Medios.DESC_MEDIO.AsString;
       edMEDIO.ShowHint := True;

       edLIQUIDACION.Hint := Liquida.DESC_LIQUIDACION.AsString;
       edLIQUIDACION.ShowHint := True;
    end;
end;

procedure TWCrliquida.FormDestroy(Sender: TObject);
begin
    with Objeto do
    Begin
       Disposicion.ID_CREDITO.Control := nil;
       // Disposicion.ContratoCre.Acreditado.Persona.Nombre.Control := nil; // LOLS 08 SEP 2005
       Disposicion.ContratoCre.Contrato.TITNombre.Control := nil;           // LOLS 08 SEP 2005
       Acreditado.ID_ACREDITADO.Control := nil;
       Acreditado.Persona.Nombre.Control := nil;
       Proveedor.ID_ACREDITADO.Control := nil;
       Proveedor.Persona.Nombre.Control := nil;
       Medios.CVE_MEDIO.Control := nil;
       Medios.DESC_MEDIO.Control := nil;
       Liquida.CVE_LIQUIDACION.Control := nil;
       Liquida.DESC_LIQUIDACION.Control := nil;
       Liquida.GetParams(Objeto);

       B_APL_DISP.Control := nil;
       B_APL_ACRE.Control := nil;
       B_APL_PROV.Control := nil;
       B_APL_MED.Control := nil;
       B_APL_LIQ.Control := nil;
       SITUACION.Control := nil;
       F_OPER_INI.Control := nil;
       F_OPER_FIN.Control := nil;

    end;
end;

procedure TWCrliquida.Botones;
begin
   if rgSITUACION.ItemIndex = 0 then
   Begin
      btAUTORIZA.Enabled := True;
      btCANCELA.Enabled := True;
      btAGRUPA.Enabled := True;
      btDESAGRUPAR.Enabled := True;
      pmMODIFICA.Items.Enabled := True;
   end
   else if rgSITUACION.ItemIndex = 1 then
   Begin
      btAUTORIZA.Enabled := False;
      btCANCELA.Enabled := True;
      btAGRUPA.Enabled := False;
      btDESAGRUPAR.Enabled := False;
      pmMODIFICA.Items.Enabled := False;
   end
   else if rgSITUACION.ItemIndex = 2 then
   Begin
      btAUTORIZA.Enabled := False;
      btCANCELA.Enabled := False;
      btAGRUPA.Enabled := False;
      btDESAGRUPAR.Enabled := False;
      pmMODIFICA.Items.Enabled := False;
   end;
end;

procedure TWCrliquida.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrliquida.btDISPOCISIONClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRLIQUIDA_DISP',True,True) then
   begin
     Objeto.Disposicion.ShowAll := True;
     if Objeto.Disposicion.Busca then
     Begin
        cbDISPOSICION.Enabled := True;
        cbDISPOSICION.Checked := True;
        InterForma1.NextTab(edDISPOSICION);
        MuestraDatosLiq;
     end;
   end;  
end;

procedure TWCrliquida.ilDISPOSICIONEjecuta(Sender: TObject);
begin
   if Objeto.Disposicion.FindKey([ilDISPOSICION.Buffer]) then
   Begin
      cbDISPOSICION.Enabled := True;
      cbDISPOSICION.Checked := True;
      InterForma1.NextTab(edDISPOSICION);
      MuestraDatosLiq;
   end;
end;

procedure TWCrliquida.cbDISPOSICIONClick(Sender: TObject);
begin
    if not(cbDISPOSICION.Checked) then
       Objeto.Disposicion.Active := False;
    //end if

   if not(Objeto.Disposicion.Active) then
       cbDISPOSICION.Checked := False;
    //end if
    MuestraDatosLiq;
end;

procedure TWCrliquida.btACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRLIQUIDA_ACRED',True,True) then
   begin
     Objeto.Acreditado.ShowAll := True;
     if Objeto.Acreditado.Busca then
     Begin
        cbACREDITADO.Enabled := True;
        cbACREDITADO.Checked := True;
        InterForma1.NextTab(edACREDITADO);
        MuestraDatosLiq;
     end;
   end;  
end;

procedure TWCrliquida.cbACREDITADOClick(Sender: TObject);
begin
    if not(cbACREDITADO.Checked) then
       Objeto.Acreditado.Active := False;
    //end if

   if not(Objeto.Acreditado.Active) then
       cbACREDITADO.Checked := False;
    //end if
    MuestraDatosLiq;
end;

procedure TWCrliquida.btPROVEEDORClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRLIQUIDA_PROV',True,True) then
   begin
     Objeto.Proveedor.ShowAll := True;
     if Objeto.Proveedor.Busca then
     Begin
        cbPROVEEDOR.Enabled := True;
        cbPROVEEDOR.Checked := True;
        InterForma1.NextTab(edPROVEEDOR);
        MuestraDatosLiq;
     end;
   end;  
end;

procedure TWCrliquida.ilPROVEEDOREjecuta(Sender: TObject);
begin
   if Objeto.Proveedor.FindKey([ilPROVEEDOR.Buffer]) then
   Begin
      cbPROVEEDOR.Enabled := True;
      cbPROVEEDOR.Checked := True;
      InterForma1.NextTab(edPROVEEDOR);
      MuestraDatosLiq;
   end;
end;

procedure TWCrliquida.cbPROVEEDORClick(Sender: TObject);
begin
    if not(cbPROVEEDOR.Checked) then
       Objeto.Proveedor.Active := False;
    //end if

   if not(Objeto.Proveedor.Active) then
       cbPROVEEDOR.Checked := False;
    //end if
    MuestraDatosLiq;
end;

procedure TWCrliquida.btMEDIOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRLIQUIDA_MEDIO',True,True) then
   begin
     Objeto.Medios.ShowAll := True;
     if Objeto.Medios.Busca then
     Begin
        cbMEDIOS.Enabled := True;
        cbMEDIOS.Checked := True;
        InterForma1.NextTab(edMEDIO);
        MuestraDatosLiq;
     end;
   end;  
end;

procedure TWCrliquida.ilMEDIOEjecuta(Sender: TObject);
begin
   if Objeto.Medios.FindKey([ilMEDIO.Buffer]) then
   Begin
      cbMEDIOS.Enabled := True;
      cbMEDIOS.Checked := True;
      InterForma1.NextTab(edMEDIO);
      MuestraDatosLiq;
   end;
end;

procedure TWCrliquida.cbMEDIOSClick(Sender: TObject);
begin
    if not(cbMEDIOS.Checked) then
       Objeto.Medios.Active := False;
    //end if

   if not(Objeto.Medios.Active) then
       cbMEDIOS.Checked := False;
    //end if
    MuestraDatosLiq;
end;

procedure TWCrliquida.rgSITUACIONClick(Sender: TObject);
begin
   MuestraDatosLiq;
end;

procedure TWCrliquida.btBUSCAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRLIQUIDA_BUSCA',True,True) then
   begin
      MuestraDatosLiq;
   end;   
end;

procedure TWCrliquida.InterForma1DespuesShow(Sender: TObject);
begin
   dtF_OPER_INIC.DateTime:= Objeto.Apli.DameFechaEmpresa;
   edF_OPER_INIC.text:=FormatDateTime('dd/mm/yyyy',dtF_OPER_INIC.DateTime);
   dtF_OPER_FIN.DateTime:= Objeto.Apli.DameFechaEmpresa;
   edF_OPER_FIN.text:=FormatDateTime('dd/mm/yyyy',dtF_OPER_FIN.DateTime);
   // LOLS 08 SEP 2005
   Objeto.Disposicion.BuscaWhereString := 'PKGCRACTUALIZA.STPOBTEMPCTTO(CR_CREDITO.ID_CONTRATO)= ' +
                                          IntToStr(Objeto.Apli.IdEmpresa);
   Objeto.Disposicion.FilterString     := Objeto.Disposicion.BuscaWhereString;
   // ENDS_LOLS_08_SEP_2005
   if Objeto.Disposicion.ID_CREDITO.AsString <> '' then
   Begin
      cbDISPOSICION.Enabled := True;
      cbDISPOSICION.Checked := True;
      MuestraDatosLiq;
   end;
     rgSITUACION.ItemIndex := 0;
end;

procedure TWCrliquida.selecciona(sColum: string; nColum : Integer);
Begin
   if sgcDATOS.CellStr[sColum,nColum] = 'SI' + #30 + '>C' then
      sgcDATOS.CellStr[sColum,nColum]:= ''
   else
      sgcDATOS.CellStr[sColum,nColum]:= 'SI' + #30 + '>C';
end;

procedure TWCrliquida.MarcaGrupo (col, pGpoLiq : String);
var nRow : Integer;
Begin
   For nRow := 0 To sgcDATOS.SG.RowCount - 1 Do
      if sgcDATOS.CellStr['GRUPO',nRow] = pGpoLiq then
         selecciona(col,nRow);
      //enf id
   //end for
end;

procedure TWCrliquida.sgcDATOSDblClick(Sender: TObject);
var Y : integer;
    vlContrato : String;
    vlIdGpoLiq : String;
begin
  with Objeto, sgcDATOS do
  Begin
      Y := SG.Row;
//      SHowMessage(IntToStr(sgcDATOS.SG.Selection.Left));
      vlIdGpoLiq := sgcDATOS.CellStr['GRUPO',Y];
      if ( SG.Selection.Left = coPosSel) AND
         ( ( CellStr['SITUACION',Y] = CSIT_NA ) OR ( CellStr['SITUACION',Y] = CSIT_AU )) AND
         ( CellStr['GRUPO',Y] <> '0' ) then
          Marcagrupo('AUT_CAN',vlIdGpoLiq)
      else if( SG.Selection.Left = coPosSel) AND ( CellStr['GRUPO',Y] = '0' ) then
          selecciona('AUT_CAN',Y)
      else if ( SG.Selection.Left = coPosAgr ) AND ( CellStr['SITUACION',Y] = CSIT_NA ) then
          selecciona('AGRUPAR',Y);
      end;
end;

procedure TWCrliquida.sgcDATOSCalcRow(Sendet: TObject; DataSet: TDataSet;
  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
var vlGpoPago : String;
    vlCompara : Boolean;
    vlCadTotGpo : String;
begin
  {Inicializa las variable de total }
  if ( RowCaso = rcQueryBegin ) then
  begin
      vlTotalGpo := 0;
      vlFinicio  := True;
      oBJETO.vgIdGpoLiq := '';
  end;//ends_if

  if ( RowCaso = rcRowBegin ) then
    begin
        { Valida un cambio de grupo }
        if ( Objeto.vgIdGpoLiq <> DataSet.FieldByName('GRUPO').AsString ) then
        begin
          { Cierra el grupo anterior }
          if vlFinicio then
            vlFinicio := False
          else begin
            vlCadTotGpo:='IMP. TOTAL GRUPO: ' + Format(CFORMAT_DINERO,[ vlTotalGpo ] );
            sgcDATOS.AddTexto( vlCadTotGpo, tcCenter, clMaroon, 15);
            sgcDATOS.AddTexto('' , tcCenter, clMaroon, 15);
          end;

          { Inicializa con los nuevos datos del siguiente grupo }
          vlTotalGpo := DataSet.FieldByName('IMPORTE').AsFloat;
          Objeto.vgIdGpoLiq := DataSet.FieldByName('GRUPO').AsString;

          IF Objeto.vgIdGpoLiq = '0' THEN
             sgcDATOS.AddTitle('NO AGRUPADOS', tcCenter)
          ELSE  sgcDATOS.AddTitle('GRUPO DE LIQUIDACION ' + Objeto.vgIdGpoLiq, tcCenter);
        end
        else begin
          vlTotalGpo := vlTotalGpo + DataSet.FieldByName('IMPORTE').AsFloat;
        end;
    end;
    { Valida fin de Query }
    if ( RowCaso = rcQueryEnd ) then
    begin
        vlCadTotGpo := 'IMP. TOTAL GRUPO: '+Format(CFORMAT_DINERO,[ vlTotalGpo ] );
        sgcDATOS.AddTexto( vlCadTotGpo, tcCenter, clMaroon, 15);
    end;//ends_if

    {COLOR A LAS SITUACIONES}
    //Si es CANCELADO lo pone de color rojo
    if ((DataSet.FieldByName('SITUACION').AsString = CSIT_CA)
     OR (DataSet.FieldByName('SIT_EXT').AsString = CSIT_CA)
     OR (DataSet.FieldByName('SIT_EXT').AsString = CSIT_DE)) then
       sgcDATOS.SetFontColor(CRED)
    //Si es AUTORIZADO lo pone de color verde
    else if DataSet.FieldByName('SITUACION').AsString = CSIT_AU then
       sgcDATOS.SetFontColor(CGREEN)
        //Si es NO AUTORIZADO LO PONE COLOR NEGRO
    else if DataSet.FieldByName('SITUACION').AsString = CSIT_NA then
       sgcDATOS.SetFontColor(clBlack);

    //PARA SPEUA
    if (DataSet.FieldByName('SIT_EXT').AsString = 'RE') then
       sgcDATOS.SetFontColor(CRED);
    //END IF;

end;

procedure TWCrliquida.btAUTORIZAClick(Sender: TObject);
var nCount      : Integer;
    vlCveMedio  : String;
    vlRefExter  : String;
    vlIdCredit  : Integer;
    vlIdGpoLiq  : Integer;
    nRow        : Integer;
    vlCveLiquida: String;
    vlclave : String;
begin
   if Objeto.ValidaAccesoEsp('TCRLIQUIDA_AUTO',True,True) then
   begin
      vlclave := '21';
   if ValidaUsuario(Objeto.Apli, vlClave) then
     begin
       nCount := CountSelec(sgcDatos,'AUT_CAN');
       nRow := sgcDATOS.SG.Row;
       MErrores.Clear;
       vlIdGpoLiq := 0;
       if ( btAUTORIZA.Enabled ) AND (  sgcDATOS.CellStr['SITUACION',nRow] = CSIT_NA  )then
       Begin
         if nCount > 0 then
         Begin
            if MessageDlg('¿Está seguro de Autorizar  ' + IntToStr(nCount) + ', registro (s) ?',
                           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            Begin
                messageIniFinProceso(MErrores,CINICIO);
                For nRow := 0 To sgcDATOS.SG.RowCount - 1 Do
                Begin
                  if ( IntToStr(vlIdGpoLiq) <> sgcDATOS.CellStr['GRUPO',nRow] ) or ( vlIdGpoLiq = 0 ) then
                  Begin
                    if (sgcDATOS.CellStr['AUT_CAN',nRow] = 'SI' + #30 + '>C') then
                    Begin
                        vlCveMedio  := sgcDATOS.CellStr['MEDIO',nRow];
                        vlRefExter  := sgcDATOS.CellStr['REF_EXTERNA',nRow];
                        vlIdCredit  := StrToInt( sgcDATOS.CellStr['DISPOSICION',nRow] );
                        vlIdGpoLiq  := StrToInt( sgcDATOS.CellStr['GRUPO',nRow] );
                        vlCveLiquida:= sgcDATOS.CellStr['LIQUIDA',nRow];
                        if PerfilAutorizacion(vlCveMedio,vlCveLiquida) = CVERDAD then
                           AutorizaLiquidacion( vlCveMedio, vlRefExter,vlIdCredit)
                        else
                        Begin
                            ShowMessage('No tiene permiso para autorizar : <<' + vlCveMedio +
                                        '>> con liquidaciones <<' + vlCveLiquida  + '>>.');
                        end;
                    end;
                  end;
                end;
                messageIniFinProceso(MErrores,CFINAL);
            end;
         end
         else ShowMessage('Favor de seleccionar el o los registros a autorizar');
         MuestraDatosLiq;
       end
       else ShowMessage('No puede seleccionar registros para autorizar')
    end
    else
     begin
     ShowMessage('    No tiene suficientes permisos para esta Acción')
     end;
   end;  
end;

procedure TWCrliquida.btCANCELAClick(Sender: TObject);
var nCount      : Integer;
    vlCveMedio  : String;
    vlRefExter  : String;
    vlIdCredit  : Integer;
    vlIdGpoLiq  : Integer;
    nRow        : Integer;
    vlCveLiquida: String;
    vlclave : String;
begin
   if Objeto.ValidaAccesoEsp('TCRLIQUIDA_CANC',True,True) then
   begin
     vlclave := '20';
   if ValidaUsuario(Objeto.Apli, vlClave) then
    begin
       nCount := CountSelec(sgcDatos,'AUT_CAN');
       nRow := sgcDATOS.SG.Row;
       MErrores.Clear;
       vlIdGpoLiq := 0;
       if ( btCANCELA.Enabled ) AND ( ( sgcDATOS.CellStr['SITUACION',nRow] = CSIT_NA ) or
                                      ( sgcDATOS.CellStr['SITUACION',nRow] = CSIT_AU ) )then
       Begin
         if nCount > 0 then
         Begin
            if MessageDlg('¿Está seguro de cancelar  ' + IntToStr(nCount) + ', registro (s) ?',
                           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            Begin
                messageIniFinProceso(MErrores,CINICIO);
                For nRow := 0 To sgcDATOS.SG.RowCount - 1 Do
                Begin
                  if ( IntToStr(vlIdGpoLiq) <> sgcDATOS.CellStr['GRUPO',nRow] ) or ( vlIdGpoLiq = 0 ) then
                  Begin
                     if (sgcDATOS.CellStr['AUT_CAN',nRow] = 'SI' + #30 + '>C') then
                     Begin
                        vlCveMedio  := sgcDATOS.CellStr['MEDIO',nRow];
                        vlRefExter  := sgcDATOS.CellStr['REF_EXTERNA',nRow];
                        vlIdCredit  := StrToInt( sgcDATOS.CellStr['DISPOSICION',nRow] );
                        vlIdGpoLiq  := StrToInt( sgcDATOS.CellStr['GRUPO',nRow] );
                        vlCveLiquida:= sgcDATOS.CellStr['LIQUIDA',nRow];
                        if PerfilCancelacion(vlCveMedio,vlCveLiquida) = CVERDAD then
                           CancelaOrden( vlCveMedio, vlRefExter, vlIdCredit)
                        else
                        Begin
                            ShowMessage('No tiene permiso para Cancelar : <<' + vlCveMedio +
                                        '>> con liquidaciones <<' + vlCveLiquida  + '>>.');
                        end;
                     end;
                  end;
                end;
                messageIniFinProceso(MErrores,CFINAL);
            end;
         end
         else ShowMessage('Favor de seleccionar el o los registros a cancelar');
         MuestraDatosLiq;
       end
       else ShowMessage('No puede seleccionar registros para cancelar');
    end
    else
     begin
     ShowMessage('    No tiene suficientes permisos para esta Acción')
     end;
   end;  
end;



procedure TWCrliquida.btAGRUPAClick(Sender: TObject);
var nCount        : Integer;
    vlCveMedio    : String;
    vlRefExter    : String;
    vlIdCredit    : Integer;
    vlIdGpoLiq    : Integer;
    vsIdGpoLiq    : Integer;
    nRow, nAgrupa : Integer;
    Y             : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRLIQUIDA_AGRU',True,True) then
   begin
     nCount := CountSelec(sgcDatos,'AGRUPAR');
     nRow := sgcDATOS.SG.Row;
     nAgrupa := 0;
     MErrores.Clear;
     if ( btAGRUPA.Enabled ) AND ( sgcDATOS.CellStr['SITUACION',nRow] = CSIT_NA ) then
     Begin
       if nCount > 1 then
       Begin
          if MessageDlg('¿Está seguro de agrupar  ' + IntToStr(nCount) + ', registro (s) ?',
                         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          Begin
              messageIniFinProceso(MErrores,CINICIO);
              For nRow := 0 To sgcDATOS.SG.RowCount - 1 Do
              Begin
                if ( sgcDATOS.CellStr['AGRUPAR',nRow] = 'SI' + #30 + '>C') then
                  if ( StrToInt( sgcDATOS.CellStr['GRUPO',nRow])  <> 0 ) then
                  Begin // adiciona a un grupo
                     vlIdGpoLiq  := StrToInt( sgcDATOS.CellStr['GRUPO',nRow] );
                     For Y := 0 To sgcDATOS.SG.RowCount - 1 Do
                     Begin
                        if ( sgcDATOS.CellStr['AGRUPAR',Y] = 'SI' + #30 + '>C') and
                           ( StrToInt( sgcDATOS.CellStr['GRUPO',Y]) = 0 )  then
                        Begin
                           vlCveMedio  := sgcDATOS.CellStr['MEDIO',Y];
                           vlRefExter  := sgcDATOS.CellStr['REF_EXTERNA',Y];
                           vlIdCredit  := StrToInt( sgcDATOS.CellStr['DISPOSICION',Y] );
                           AgrupaSolic( vlCveMedio, vlRefExter, vlIdCredit, vlIdGpoLiq, vsIdGpoLiq);
                        end;
                     end;
                     break;
                  end
                  else
                  Begin  // Agrupa
                     if nAgrupa = 0 then
                         vlIdGpoLiq  := StrToInt( sgcDATOS.CellStr['GRUPO',nRow] );
                     //end IF
                     vlCveMedio  := sgcDATOS.CellStr['MEDIO',nRow];
                     vlRefExter  := sgcDATOS.CellStr['REF_EXTERNA',nRow];
                     vlIdCredit  := StrToInt( sgcDATOS.CellStr['DISPOSICION',nRow] );
                     if AgrupaSolic( vlCveMedio, vlRefExter, vlIdCredit, vlIdGpoLiq, vsIdGpoLiq) then
                     Begin
                        nAgrupa := nAgrupa + 1;
                        if nAgrupa = 1 then
                           vlIdGpoLiq  := vsIdGpoLiq;
                        //end if
                     end;
                  end
              end;
              messageIniFinProceso(MErrores,CFINAL);
          end;
       end
       else ShowMessage('Favor de seleccionar 2 o más registros para agrupar');
       MuestraDatosLiq;
     end
     else ShowMessage('No puede seleccionar registros para agrupar');
   end;  
end;

procedure TWCrliquida.btDESAGRUPARClick(Sender: TObject);
var nCount      : Integer;
    vlCveMedio  : String;
    vlRefExter  : String;
    vlIdCredit  : Integer;
    vlIdGpoLiq  : Integer;
    nRow        : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRLIQUIDA_DESAG',True,True) then
   begin
     nCount := CountSelec(sgcDatos,'AGRUPAR');
     nRow := sgcDATOS.SG.Row;
     MErrores.Clear;
     if ( btAGRUPA.Enabled ) AND ( sgcDATOS.CellStr['SITUACION',nRow] = CSIT_NA ) then
     Begin
       if nCount > 0 then
       Begin
          if MessageDlg('¿Está seguro de desagrupar  ' + IntToStr(nCount) + ', registro (s) ?',
                         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          Begin
              messageIniFinProceso(MErrores,CINICIO);
              For nRow := 0 To sgcDATOS.SG.RowCount - 1 Do
              Begin
                if ( sgcDATOS.CellStr['GRUPO',nRow] <> '0' ) then
                  if ( sgcDATOS.CellStr['AGRUPAR',nRow] = 'SI' + #30 + '>C' ) then
                  Begin
                      vlCveMedio  := sgcDATOS.CellStr['MEDIO',nRow];
                      vlRefExter  := sgcDATOS.CellStr['REF_EXTERNA',nRow];
                      vlIdCredit  := StrToInt( sgcDATOS.CellStr['DISPOSICION',nRow] );
                      DesagrupSolic(vlCveMedio,vlRefExter,vlIdCredit)
                  end;
                //end if
              end;
              messageIniFinProceso(MErrores,CFINAL);
          end;
       end
       else ShowMessage('Favor de seleccionar registros para desagrupar');
       MuestraDatosLiq;
     end
     else ShowMessage('No puede seleccionar registros para desagrupar');
   end;  
end;

procedure TWCrliquida.Modificar1Click(Sender: TObject);
var  ActMedChq          : TCractmech;
     vlCveMedio         : String;
     vlChequera         : String;
     vlBenefic          : String;
     vlIdBcoChq         : String;
     vlRefExterna       : String;
     vlIdCredito        : String;
     vlGrupo            : String;
     vlCveLiquida       : String;
     vlImporte          : String;
     vlLiqMoneda        : String;
begin
   vlCveMedio   := sgcDATOS.CellStr['MEDIO',sgcDATOS.SG.Row];
   vlRefExterna := sgcDATOS.CellStr['REF_EXTERNA',sgcDATOS.SG.Row];
   vlIdCredito  := sgcDATOS.CellStr['DISPOSICION',sgcDATOS.SG.Row];
   vlCveLiquida := sgcDATOS.CellStr['LIQUIDA',sgcDATOS.SG.Row];
   vlBenefic    :=sgcDATOS.CellStr['CONTRATANTE',sgcDATOS.SG.Row];
   vlChequera   := sgcDATOS.CellStr['CHEQ_DESTINO',sgcDATOS.SG.Row];
   vlIdBcoChq   := sgcDATOS.CellStr['ID_BANCO',sgcDATOS.SG.Row];
   vlGrupo      := sgcDATOS.CellStr['GRUPO',sgcDATOS.SG.Row];
   vlImporte    := sgcDATOS.CellStr['IMPORTE',sgcDATOS.SG.Row];
   vlLiqMoneda  := ObtLiqMoneda(sgcDATOS.CellStr['MONEDA',sgcDATOS.SG.Row],Objeto.Apli); //intgencre

   ActMedChq := TCractmech.Create(self);
   Try
      ActMedChq.Apli:=Objeto.Apli;
      ActMedChq.MediosLiq.FindKey([ vlCveLiquida ]);
      ActMedChq.Chequera.FindKey([ vlBenefic, C_PROVE, 0,C_LIQUI,0,vlIdBcoChq,vlChequera ]);
      ActMedChq.vgCveMedio      := vlCveMedio;
      ActMedChq.vgRefExterna    := vlRefExterna;
      ActMedChq.vgIdCredito     := vlIdCredito;
      ActMedChq.vgCveLiquida    := vlCveLiquida;
      ActMedChq.vgChequera      := vlChequera;
      ActMedChq.vgBenefic       := vlBenefic;
      ActMedChq.vgIdBcoChq      := vlIdBcoChq;
      ActMedChq.vgImporte       := vlImporte;
      ActMedChq.vgGrupo         := vlGrupo;
      ActMedChq.vgLiqMoneda     := vlLiqMoneda;
      ActMedChq.ParamCre:=Objeto.ParamCre;
      ActMedChq.Catalogo;
   finally
      ActMedChq.Free;
   end;
      MuestraDatosLiq;
end;

procedure TWCrliquida.ConsultaDisposicin1Click(Sender: TObject);
var  Credito : TCrCredito;
     vlIdCredito : String;
begin
   vlIdCredito := sgcDATOS.CellStr['DISPOSICION',sgcDATOS.SG.Row];
   Credito := TCrCredito.Create(self);
   Try
      Credito.Apli:=Objeto.Apli;
      Credito.FindKey([vlIdCredito]);
      Credito.ParamCre:=Objeto.ParamCre;
      Credito.Catalogo;
   finally
      Credito.Free;
      Objeto.Disposicion.FindKey([vlIdCredito]);
   end;
end;

procedure TWCrliquida.ConsultaAutorizacin1Click(Sender: TObject);
var  CrCto : TCrCto;
     vlIdAutorizacion : String;
     vlIdAcreditado   : String;
     vlProducto       : String;
     vlMoneda         : String;
     vlTasa           : String;
begin
   vlIdAutorizacion := sgcDATOS.CellStr['AUTORIZACION',sgcDATOS.SG.Row];
   vlIdAcreditado := sgcDATOS.CellStr['TITULAR',sgcDATOS.SG.Row];
   vlProducto := sgcDATOS.CellStr['PRODUCTO',sgcDATOS.SG.Row];
   vlMoneda := sgcDATOS.CellStr['MONEDA',sgcDATOS.SG.Row];
   vlTasa := sgcDATOS.CellStr['TASA',sgcDATOS.SG.Row];
   CrCto := TCrCto.Create(self);
   Try
      CrCto.Apli:=Objeto.Apli;
      Crcto.FindKey([vlIdAutorizacion,'1']);
      Crcto.Acreditado.FindKey([vlIdAcreditado]);
      Crcto.Moneda.FindKey([vlMoneda]);
      Crcto.TasaRefer.FindKey([vlTasa]);
      CrCto.ParamCre:=Objeto.ParamCre;
      CrCto.Catalogo;
   finally
      CrCto.Free;
      Objeto.Autorizacion.FindKey([vlIdAutorizacion,'1']);
   end;
end;
//Llama a la clase de chequera Cliente corporativo
procedure TWCrliquida.ConsultadatosdelaChequera1Click(Sender: TObject);
var  ChequeraDest       : TCheqCte;
     vlIdBcoChq         : String;
     vlchequera         : String;
     vlPersona          : STring;
begin
   vlChequera := sgcDATOS.CellStr['CHEQ_DESTINO',sgcDATOS.SG.Row];
   vlIdBcoChq := sgcDATOS.CellStr['ID_BANCO',sgcDATOS.SG.Row];
   vlPersona :=  sgcDATOS.CellStr['CONTRATANTE',sgcDATOS.SG.Row];

   ChequeraDest := TCheqCte.Create(self);
   Try
      ChequeraDest.Apli:=Objeto.Apli;
      ChequeraDest.FindKey([vlPersona,vlIdBcoChq,vlChequera ]);
      ChequeraDest.Catalogo;
   finally
      ChequeraDest.Free;
   end;
      MuestraDatosLiq;
end;
//Llama a la clase de Depositos a la vista
procedure TWCrliquida.ConsultaDepsitosalaVista1Click(Sender: TObject);
var  ChequeraDest       : TCheqCte;
     vlIdBcoChq         : String;
     vlContrato         : String;
     vlPersona          : STring;
begin
     vlContrato := sgcDATOS.CellStr['CHEQ_ORIGEN',sgcDATOS.SG.Row];
     if ( vlContrato <> '' ) and ( Objeto.Contrato.FindKey( [ vlContrato ] )  ) then
     begin
        Objeto.ConTransa.Contrato := Objeto.Contrato;
        Objeto.ConTransa.Catalogo;

     end;
end;

procedure TWCrliquida.InsertarNuevaOrdenLiquidacin1Click(Sender: TObject);
var vlSitExterna        : String;
    vlCveMedio          : String;
    vlRefExterna        : String;
    vlIdCredito         : Integer;
    vlIdGrupo           : Integer;
    nRow                : Integer;
begin
   nRow := sgcDATOS.SG.Row;
   MErrores.Clear;
   vlSitExterna  := sgcDATOS.CellStr['SIT_EXT',nRow];
   vlCveMedio    := sgcDATOS.CellStr['MEDIO',nRow];
   vlRefExterna  := sgcDATOS.CellStr['REF_EXTERNA',nRow];
   vlIdCredito   := StrToInt(sgcDATOS.CellStr['DISPOSICION',nRow]);
   vlIdGrupo   := StrToInt(sgcDATOS.CellStr['GRUPO',nRow]);
   if ( vlSitExterna = CSIT_RE ) or ( vlSitExterna = CSIT_CA) OR ( vlSitExterna = CSIT_DE)then
   Begin
      if MessageDlg('¿Está seguro de solicitar una nueva orden del registro <<' + vlCveMedio
                    + '>> : <<' + IntToStr(vlIdCredito) + '>> ?',
                       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Begin
           //Obtiene datos de solicitud
           messageIniFinProceso(MErrores,CINICIO);
           //Inicia Proceso de Solicitud
           if ReactivaOrdLiq(vlCveMedio, vlRefExterna, vlIdCredito, vlIdGrupo) then
           Begin
                    //Finaliza proceso de Inserción de solicitud
                    messageIniFinProceso(MErrores,CFINAL);
                    ShowMessage('Solicitud Realizada');
                    MuestraDatosLiq;
           end;
        end;
   end
   else ShowMessage('No se puede realizar una nueva solicitud, situación no válida');
end;

procedure TWCrliquida.ilACREDITADOEjecuta(Sender: TObject);
begin
   if Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) then
   Begin
      cbACREDITADO.Enabled := True;
      cbACREDITADO.Checked := True;
      InterForma1.NextTab(edACREDITADO);
      MuestraDatosLiq;
   end;
end;

procedure TWCrliquida.chAGRUP_TODOSClick(Sender: TObject);
var nRow : Integer;
begin
   IF chAGRUP_TODOS.Checked THEN
      BEGIN
        For nRow := 0 To sgcDATOS.SG.RowCount - 1 Do
         if sgcDATOS.CellStr['GRUPO',nRow] = '0' then
            sgcDATOS.CellStr['AGRUPAR',nRow]:= 'SI' + #30 + '>C';
      END
   ELSE
      BEGIN
        For nRow := 0 To sgcDATOS.SG.RowCount - 1 Do
         if sgcDATOS.CellStr['GRUPO',nRow] = '0' then
            sgcDATOS.CellStr['AGRUPAR',nRow]:= ''
      END;
end;

procedure TWCrliquida.btLIQUIDACIONClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRLIQUIDA_LIQUI',True,True) then
   begin
     Objeto.Liquida.ShowAll := True;
     if Objeto.Liquida.Busca then
     Begin
        cbLIQUIDACION.Enabled := True;
        cbLIQUIDACION.Checked := True;
        InterForma1.NextTab(edLIQUIDACION);
        MuestraDatosLiq;
     end;
   end;  
end;

procedure TWCrliquida.cbLIQUIDACIONClick(Sender: TObject);
begin
    if not(cbLIQUIDACION.Checked) then
       Objeto.Liquida.Active := False;
    //end if

   if not(Objeto.Liquida.Active) then
       cbLIQUIDACION.Checked := False;
    //end if
    MuestraDatosLiq;
end;

procedure TWCrliquida.ilLIQUIDACIONEjecuta(Sender: TObject);
begin
   if Objeto.Liquida.FindKey([ilLIQUIDACION.Buffer]) then
   Begin
      cbLIQUIDACION.Enabled := True;
      cbLIQUIDACION.Checked := True;
      InterForma1.NextTab(edLIQUIDACION);
      MuestraDatosLiq;
   end;
end;

end.

