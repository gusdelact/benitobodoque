{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
// Sistema         : Clase de CrSeCoPr
// Fecha de Inicio : 30/07/2003
// Función forma   : Clase de CrSeCoPr
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrSeCoPr;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntSGCtrl,
  IntLinkit,Ungene,

  //Unidades Adicionales
  IntParamCre,
  IntGenCre,
  IntGcto, // Promotor Asociado y Administrativo
  IntCrAcredit,
  IntCrCredito,
  IntCrSeguimi,
  IntCrSeCoPrRe,
  IntCrBitSgui, Menus,IntConTransa, IntCtoHeader,IntCrSeCoTo;
const
    coCRLF      = #13#10;
    CTODO = 'TODO';
    CRED  = clRed;
    CBLUE = clBlue;
    CTEAL = clTeal;
    CGREEN= clGreen;

Type
  TCrSeCoPr= class;

  TWCrSeCoPr=Class(TForm)
    InterForma1             : TInterForma;
    GroupBox2: TGroupBox;
    Label17: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    edF_INICIAL: TEdit;
    dtFRealPago: TInterDateTimePicker;
    edF_FINAL: TEdit;
    InterDateTimePicker1: TInterDateTimePicker;
    rgSITUACION: TRadioGroup;
    edNOM_ACREDITADO: TEdit;
    edNOM_PROM_ADMI: TEdit;
    cbB_PROM_ADMI: TCheckBox;
    cbB_APLI_ACRED: TCheckBox;
    btBUSCA: TBitBtn;
    edTIT_SEL: TEdit;
    edTIT_MODO_PAGO: TEdit;
    edTIT_IMPORTE: TEdit;
    edTIT_CHEQRA: TEdit;
    edTIT_CLIENTE: TEdit;
    edTIT_PROMOTOR: TEdit;
    sgcDATOS: TSGCtrl;
    edID_PROM_ADMIN: TEdit;
    edID_ACREDITADO: TEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label33: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    edCOMENTARIO: TEdit;
    rgTIPO_PAGO: TRadioGroup;
    edDESC_MODO_PAGO: TEdit;
    edTIT_CREDITO: TEdit;
    edID_CREDITO: TEdit;
    edMODO_PAGO: TEdit;
    edTIT_SIT: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    MsgPanel: TPanel;
    btPROM_ADMIN: TBitBtn;
    btCREDITO: TBitBtn;
    btMODO_PAGO: TBitBtn;
    ilCREDITO: TInterLinkit;
    ilACREDITADO: TInterLinkit;
    ilPROM_ADMIN: TInterLinkit;
    ilMODO_PAGO: TInterLinkit;
    btACREDITADO: TBitBtn;
    edIMPORTE: TInterEdit;
    pmAgrupar: TPopupMenu;
    Agrupar1: TMenuItem;
    Desagrupar1: TMenuItem;
    DesagruparTodo1: TMenuItem;
    edTIT_FECHA: TEdit;
    edTIT_ID_CREDITO: TEdit;
    cbSELECCIONA: TCheckBox;
    Label9: TLabel;
    edPROM_ASOCIADO: TEdit;
    btPROM_ASOCIADO: TBitBtn;
    edNOM_PROM_ASOC: TEdit;
    edTIT_DISPOSICION: TEdit;
    btDISPOSICION: TBitBtn;
    edDISPOSICION: TEdit;
    Label10: TLabel;
    cbB_PROM_ASOC: TCheckBox;
    cbB_DISPOSICION: TCheckBox;
    ilDISPOSICION: TInterLinkit;
    ilPROM_ASOCIADO: TInterLinkit;
    N1: TMenuItem;
    ReactivarGrupo1: TMenuItem;
    ReactivarGrupo2: TMenuItem;
    N2: TMenuItem;
    CancelaMovimientos1: TMenuItem;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btPROM_ADMINClick(Sender: TObject);
    procedure ilPROM_ADMINEjecuta(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure btCREDITOClick(Sender: TObject);
    procedure ilCREDITOEjecuta(Sender: TObject);
    procedure cbB_PROM_ADMIClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure cbB_APLI_ACREDClick(Sender: TObject);
    Procedure MuestraDatos;
    procedure edF_FINALExit(Sender: TObject);
    procedure dtFRealPagoExit(Sender: TObject);
    procedure btBUSCAClick(Sender: TObject);
    procedure sgcDATOSDblClick(Sender: TObject);
    procedure sgcDATOSCalcRow(Sendet: TObject; DataSet: TDataSet; CurrRow: Integer;
                              RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure btMODO_PAGOClick(Sender: TObject);
    procedure ilMODO_PAGOEjecuta(Sender: TObject);
    procedure Agrupar1Click(Sender: TObject);
    procedure SumaImpTotal;
    procedure edID_CREDITOExit(Sender: TObject);
    procedure edMODO_PAGOExit(Sender: TObject);
    procedure rgTIPO_PAGOExit(Sender: TObject);
    procedure edIMPORTEExit(Sender: TObject);
    procedure edCOMENTARIOExit(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure Desagrupar1Click(Sender: TObject);
    Procedure ActualizaGP(pRow: Integer; pCveGP : String; pGrupo : String; pIndica : String);
    procedure DesagruparTodo1Click(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject; var Realizado: Boolean);
    procedure cbSELECCIONAClick(Sender: TObject);
    procedure btDISPOSICIONClick(Sender: TObject);
    procedure ilDISPOSICIONEjecuta(Sender: TObject);
    procedure cbB_DISPOSICIONClick(Sender: TObject);
    procedure ReactivarGrupo1Click(Sender: TObject);
    procedure ReactivarGrupo2Click(Sender: TObject);
    procedure btPROM_ASOCIADOClick(Sender: TObject);
    procedure ilPROM_ASOCIADOEjecuta(Sender: TObject);
    procedure InterForma1AntesModificar(Sender: TObject; var Realizado: Boolean);
    procedure CancelaMovimientos1Click(Sender: TObject);
    procedure cbB_PROM_ASOCClick(Sender: TObject);
    procedure rgSITUACIONClick(Sender: TObject);
  private
    vlTotalGpo : Double;
    vlFinicio  : Boolean;
//    vlEnterSit : Boolean;
  private
  private
    Function  CadSQLTotal : String;
  public
    Objeto : TCrSeCoPr;
  end;


  TCrSeCoPr= class(TCrBitSgui)
  private
  protected
  public
        { Public declarations }
        vgTipoPago        : String;
        vgIdGpoPago       : String;

        ID_PROM_ADMI             : TInterCampo;
        ID_PROM_ASOC             : TInterCampo;
        ID_ACREDITADO            : TInterCampo;
        ID_DISPOSICION           : TInterCampo;
        B_APLICA_PROM            : TInterCampo;
        B_APL_PROM_ASOC          : TInterCampo;
        B_APLICA_ACRED           : TInterCampo;
        B_APLICA_DISP            : TInterCampo;
        SITUACION                : TInterCampo;
        F_INICIAL                : TInterCampo;
        F_FINAL                  : TInterCampo;
        //Clases Adicionales
        ParamCre                 : TParamCre;
        PromAdmi                 : TGpoCto;
        PromAsoc                 : TGpoCto;
        Acreditado               : TCrAcredit;
        Disposicion              : TCrCredito;
        ConTransa                : TConTransa;
        Contrato                 : TCtrlCto;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Function    CadenaSql : String;
        Function    ObtenRangoHora : Boolean;
  published
  end;


implementation
//Uses RepMon;

{$R *.DFM}
const
   CoPosChq = 13;
   coPosSel = 8;
   coConfirRe = '¿Desea reactivar esta (s) transacción (es)?';
   coAvisoRe  = 'No se reactivarán %d transaccion(es) de %d transaccion(es). ' + #13#10 +
                'Probablemente son movimientos identificados ó movimientos NI del día de hoy';
constructor TCrSeCoPr.Create( AOwner : TComponent );
begin Inherited;
      ID_PROM_ADMI :=CreaCampo('ID_PROM_ADMI',ftString,tsNinguno,tsNinguno,False);
      ID_PROM_ASOC :=CreaCampo('ID_PROM_ASOC',ftString,tsNinguno,tsNinguno,False);
      ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftString,tsNinguno,tsNinguno,False);
      ID_DISPOSICION :=CreaCampo('ID_DISPOSICION',ftFloat,tsNinguno,tsNinguno,False);
      B_APLICA_PROM :=CreaCampo('B_APLICA_PROM',ftString,tsNinguno,tsNinguno,False);
      B_APL_PROM_ASOC :=CreaCampo('B_APL_PROM_ASOC',ftString,tsNinguno,tsNinguno,False);
      B_APLICA_ACRED :=CreaCampo('B_APLICA_ACRED',ftString,tsNinguno,tsNinguno,False);
      B_APLICA_DISP :=CreaCampo('B_APLICA_DISP',ftString,tsNinguno,tsNinguno,False);
      SITUACION :=CreaCampo('SITUACION',ftString,tsNinguno,tsNinguno,False);
      With SITUACION do
      begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('0'); ComboDatos.Add(CSIT_NI);
            ComboLista.Add('1'); ComboDatos.Add(CSIT_ID);
            ComboLista.Add('2'); ComboDatos.Add(CSIT_CA);
            ComboLista.Add('3'); ComboDatos.Add(CSIT_TO);
      end;
      F_INICIAL :=CreaCampo('F_INICIAL',ftDate,tsNinguno,tsNinguno,False);
      F_FINAL :=CreaCampo('F_FINAL',ftDate,tsNinguno,tsNinguno,False);
//      IMP_TOTAL :=CreaCampo('IMPORTE TOTAL',ftFloat,tsNinguno,tsNinguno,False);
      StpName  := ' ';
      UseQuery := True;
      HelpFile := 'IntCrSeCoPr.Hlp';
      ShowMenuReporte:=True;

      PromAdmi := TGpoCto.Create(Self);
      PromAdmi.MasterSource := Self;

      PromAsoc := TGpoCto.Create(Self);
      PromAsoc.MasterSource := Self;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource:=Self;
      Acreditado.FieldByName('ID_ACREDITADO').MasterField:='ID_ACREDITADO';
      Acreditado.BuscaWhereString := 'CR_ACREDITADO.SIT_ACREDITADO =' + #39 + CSIT_AC + #39;
      Acreditado.FilterString := Acreditado.BuscaWhereString;
      Disposicion := TCrCredito.Create(Self);
      Disposicion.MasterSource:=Self;
      Disposicion.FieldByName('ID_CREDITO').MasterField:='ID_DISPOSICION';
      ConTransa := TConTransa.Create( Self );
      ConTransa.MasterSource  := Self;
      Contrato  := TCtrlCto.Create( Self );
      Contrato.MasterSource   := Self;
end;

Destructor TCrSeCoPr.Destroy;
begin
   if PromAdmi <> nil then
      PromAdmi.Free;
   //end if

   if PromAsoc <> nil then
      PromAsoc.Free;
   //end if

   if Acreditado <> nil then
      Acreditado.Free;
   //end if

   if Disposicion <> nil then
      Disposicion.Free;
   //end if
   if ConTransa <> nil then
      ConTransa.free;
   //end if

   if Contrato <> nil then
        Contrato.Free;
   //end if

   inherited;
end;


function TCrSeCoPr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrSeCoPr;
begin
   W:=TWCrSeCoPr.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

Function TCrSeCoPr.CadenaSql : String;
var vlSql     : String;
Begin
   ID_PROM_ADMI.GetFromControl;
   ID_PROM_ASOC.GetFromControl;
   ID_ACREDITADO.GetFromControl;
   ID_DISPOSICION.GetFromControl;
   B_APLICA_PROM.GetFromControl;
   B_APL_PROM_ASOC.GetFromControl;
   B_APLICA_ACRED.GetFromControl;
   B_APLICA_DISP.GetFromControl;
   SITUACION.GetFromControl;
   F_INICIAL.GetFromControl;
   F_FINAL.GetFromControl;

   vlSql  := ' SELECT DECODE( B.CVE_TIPO_PAGO,' + #39 + CPROGRAMADO + #39 +
                             ', 1,' + #39 + CANTICIPADO + #39 +
                             ', 2,' + #39 + CIMPAGADO   + #39 + ', 3, 4 ) ORDEN_COB, ' +
                      #39 + '  ' + #39 + ' SEL, ' +
             '        B.ID_SEGUIMIENTO, ' +
             '        B.ID_CREDITO, ' +
             '        B.F_COBRANZA, ' +
             '        S.CVE_SEGUIMIENTO, ' +
             '        S.DESC_SEGUIMIENTO,  ' +
             '        B.ID_GRUPO_PAGO, ' +
             '        B.IMP_TOTAL, ' +
             '        TO_NUMBER(SUBSTR(PKGCRPERIODO.STPObtChqCte(C.ID_TITULAR,NVL(CS.CVE_EMISOR_NAFIN,0),' +
                                                                   ' CR.ID_CREDITO, ' +
                                                                 #39 + C_ACRED + #39 + ',' +
                                                                 #39 + C_ADMIN + #39 + ',' +
                                                                 #39 + C_ABONO + #39 + '),1, 10)) AS CHEQUERA, ' +
             '        C.ID_TITULAR, ' +
             '        PA.NOMBRE AS ACREDITADO, ' +
             '        PR.NOMBRE AS PROMOTOR, ' +
             '        B.SIT_SEGUIMIENTO ' +
             ' FROM CR_BIT_SEGUIMIENTO B, '+
             '      CR_SEGUIMIENTO S, ' +
             '      CONTRATO C, ' +
             '      CR_CESION CS, ' +
             '      CR_CONTRATO CC, ' +
             '      CR_CREDITO CR, ' +
             '      PERSONA PA, ' +
             '      PERSONA PR ' +
             ' WHERE   C.ID_CONTRATO = CC.ID_CONTRATO ' +
             ' AND    CC.ID_CONTRATO = CR.ID_CONTRATO ' +
             ' AND   CC.FOL_CONTRATO = CR.FOL_CONTRATO ' +
             ' AND     CR.ID_CREDITO = B.ID_CREDITO ' +
             ' AND      C.ID_TITULAR = PA.ID_PERSONA '+
             ' AND C.ID_PERS_ASOCIAD = PR.ID_PERSONA '+
             ' AND B.CVE_SEGUIMIENTO = S.CVE_SEGUIMIENTO ' +
             ' AND C.ID_EMPRESA = ' + IntToStr(Apli.IdEmpresa) + // LOLS 08 SEP 2005
             ' AND B.F_COBRANZA BETWEEN TO_DATE( ' + #39 + F_INICIAL.AsString + #39 +
                                                ','+ #39 +'DD/MM/YYYY' + #39 + ')' +
                              ' AND TO_DATE( ' + #39 + F_FINAL.AsString + #39 + ',' +
                                                 #39 +'DD/MM/YYYY' + #39 + ')' +
             ' AND CS.ID_CESION(+) = CR.ID_CREDITO ';


   if B_APLICA_PROM.AsString = CVERDAD then
      vlSql := vlSql + ' AND CR.ID_PROM_ADM = ' + ID_PROM_ADMI.AsString;
   //end if
   if B_APL_PROM_ASOC.AsString = CVERDAD then
      vlSql := vlSql + ' AND C.ID_PERS_ASOCIAD = ' + ID_PROM_ASOC.AsString;
   //end if
   if B_APLICA_ACRED.AsString = CVERDAD then
   Begin
      vlSql := vlSql + ' AND C.ID_TITULAR = ' + ID_ACREDITADO.AsString;
   end;
   // end if
   if B_APLICA_DISP.AsString = CVERDAD then
   Begin
      vlSql := vlSql + ' AND CR.ID_CREDITO = ' + ID_DISPOSICION.AsString;
   end;
   // end if

   if SITUACION.AsString <> CSIT_TO then
   Begin
      if SITUACION.AsString = CSIT_ID then
         vlsql := vlsql + 'AND B.SIT_SEGUIMIENTO = ' + #39 + CSIT_ID + #39
      else if SITUACION.AsString = CSIT_NI then
         vlsql := vlsql + 'AND B.SIT_SEGUIMIENTO = ' + #39 + CSIT_NI + #39
      else if SITUACION.AsString = CSIT_CA then
      Begin
         vlsql := vlsql + 'AND B.SIT_SEGUIMIENTO IN ( ' + #39 + CSIT_CA + #39 +
                  ' , ' + #39 + CSIT_CI + #39 + ' ) ';
      end;
   end;
   CadenaSql := vlSql;
end;

Function TCrSeCoPr.ObtenRangoHora: Boolean;
var vlSql       : String;
    vlValHrSeg  : String;
    Q           : TQuery;
    vlSqlParam  : String;
    vlHrInicial : Integer;
    vlHrFinal   : Integer;
    vlHrSystem  : Integer;
    vlResult    : Boolean;
begin
   vlResult := True;
   vlsql:= ' SELECT B_VAL_HORA_SEG ' +
           ' FROM CR_PERFIL_USUAR ' +
           ' WHERE CVE_GPO_ACCESO = ' + IntToStr(Apli.CvePerfil);
   GetSQLStr(vlsql,Apli.DataBaseName,Apli.SessionName,'B_VAL_HORA_SEG',vlValHrSeg, False);
   if vlValHrSeg = CVERDAD then
   Begin

         vlSqlParam := ' SELECT * FROM CR_PARAMETRO ' +
                       ' WHERE CVE_PARAMETRO = ' + #39 + C_CRE + #39 +
                       ' AND SIT_ACC_SEGMTO = ' + #39 + CSIT_AC + #39;

         GetSQLInt('SELECT TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE,' + #39 + 'HH24MISS' + #39 + '),1,6)) AS HORA FROM DUAL',
                   Apli.DataBaseName,Apli.SessionName,'HORA',vlHrSystem,False);
           Q := TQuery.Create(Self);
           Try
              Q.SessionName := SessionName;
              Q.DataBaseName := DataBaseName;
              Q.SQL.Clear;
              Q.SQL.Add(vlsqlParam);
              Q.Open;
              if Q.FieldByName('SIT_ACC_SEGMTO').AsString = CSIT_AC then
              While Not Q.Eof Do
              Begin
                 if ((vlHrsystem < Q.FieldByName('H_INICIO_SEGMTO').AsInteger) and
                     (vlHrsystem < Q.FieldByName('H_FIN_SEGMTO').AsInteger))   OR
                    ((vlHrsystem > Q.FieldByName('H_INICIO_SEGMTO').AsInteger) and
                     (vlHrsystem > Q.FieldByName('H_FIN_SEGMTO').AsInteger)) then
                     Begin
                        vlResult := False;
                        ShowMessage('Usuario fuera del tiempo de captura.');
                     end;
                 Q.Next;
              End //end while
              else
              Begin
                 ShowMessage('No tiene acceso para capturar ');
                 vlResult := False;
              end;
           Finally
              If Assigned(Q) Then
              Begin
                 Q.Close;
                 Q.Free;
              End;
           end; //end Try finally
   end;
   ObtenRangoHora := vlResult;
end;
{----------------------------------------------------------------------------------------------------------------------
                                                REACTIVA TRANSACCIONES
----------------------------------------------------------------------------------------------------------------------
procedure TCrSeCoPr.StpReactivaSegui(pTransaccion, pGrupo: String; pFechaCob : TdateTime);
var StpReactivaSegui :  TStoredProc;
Begin
    StpReactivaSegui := TStoredProc.Create(Self);
    try
       with StpReactivaSegui do
       begin
          StpReactivaSegui.DatabaseName:= Apli.DatabaseName;
          StpReactivaSegui.SessionName:= Apli.SessionName;
          StpReactivaSegui.StoredProcName:='PKGCRCREDITO.STPREACTIVASEGTO';

          Params.Clear;
          Params.CreateParam(ftDate,'PEFCOBRANZA',ptInput);
          Params.CreateParam(ftString,'PEIDSEGUIMIENTO',ptInput);
          Params.CreateParam(ftInteger,'PEIDGRUPOPAGO',ptInput);
          Params.CreateParam(ftInteger,'PEIDEMPRESA',ptInput);
          Params.CreateParam(ftString,'PECVEUSUARIO',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('peFCobranza').AsDateTime := pFechaCob;
          ParamByName('peIdSeguimiento').AsString := pTransaccion;
          ParamByName('peIdGrupoPago').AsString := pGrupo;
          ParamByName('peIdEmpresa').AsInteger := Apli.IdEmpresa;
          ParamByName('peCveUsuario').AsString := Apli.Usuario;
          ParamByName('peBCommit').AsString := CVERDAD;
          ExecProc;

          if ParamByName('PSResultado').AsInteger <> 0 then
          Begin
             ShowMessage('PROBLEMAS EN LA REACTIVACION: ' +
                         ParamByName('psRESULTADO').AsString);
             ShowMessage(ParamByName('psTxResultado').AsString);
          end;
          UnPrepare;
       end;
    finally
       StpReactivaSegui.Free;
    end;
end;
                             }

(***********************************************FORMA CrSeCoPr********************)
(*                                                                              *)
(*  FORMA DE CrSeCoPr                                                            *)
(*                                                                              *)
(***********************************************FORMA CrSeCoPr********************)
Procedure TWCrSeCoPr.MuestraDatos;
var vlQry : TQuery;
    vlsql : String;
begin
     Objeto.vgTipoPago := '';
     Objeto.vgIdGpoPago:= '';
     if cbSELECCIONA.Checked then
        vlsql := Objeto.CadenaSql + ' ORDER BY PA.NOMBRE, B.ID_GRUPO_PAGO,ORDEN_COB  '
     else vlsql := Objeto.CadenaSql + ' ORDER BY ORDEN_COB,PA.NOMBRE  ';
     vlQry := GetSQLQuery(vlsql,
                       Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     try
        if vlQry <> nil then
        Begin
        //Datos que no se muestran
            vlQry.FieldByName('ORDEN_COB').Visible := False;
            vlQry.FieldByName('ID_SEGUIMIENTO').Visible := False;
            vlQry.FieldByName('CVE_SEGUIMIENTO').Visible := False;
            vlQry.FieldByName('ID_TITULAR').Visible := False;
            vlQry.FieldByName('ID_GRUPO_PAGO').Visible := False;

            vlQry.FieldByName('SEL').DisplayWidth := 3;
            vlQry.FieldByName('ID_CREDITO').DisplayWidth := 8;
            vlQry.FieldByName('F_COBRANZA').DisplayWidth := 11;
            vlQry.FieldByName('DESC_SEGUIMIENTO').DisplayWidth := 18;
            vlQry.FieldByName('IMP_TOTAL').DisplayWidth := 14;
            vlQry.FieldByName('CHEQUERA').DisplayWidth := 10;
            vlQry.FieldByName('ACREDITADO').DisplayWidth := 25;
            vlQry.FieldByName('PROMOTOR').DisplayWidth := 28;
            vlQry.FieldByName('SIT_SEGUIMIENTO').DisplayWidth := 3;

            TNumericField(vlQry.FieldByName('IMP_TOTAL')).DisplayFormat := '###,###,###,###,###,###,##0.00';

            sgcDATOS.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY
            sgcDATOS.ColumnByName('SEL').IsCheck := True;//DEFINIR EL CAMPO AUT DEL QUERY COMO CHECKBOX
            Agrupar1.Enabled := True;
        end
        else
        Begin
           sgcDATOS.Clear('NO EXISTEN DATOS'#30'>C');
           Agrupar1.Enabled := False;
        end;
     finally
       if vlQry <> nil then
          vlQry.free;
       //end if
     end;
end;

procedure TWCrSeCoPr.FormShow(Sender: TObject);
begin
      //Pinta los datos del panel inferior
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.AutoRefresh := False;

      Objeto.ID_PROM_ADMI.Control:=edID_PROM_ADMIN;
      Objeto.ID_PROM_ASOC.Control:=edPROM_ASOCIADO;
      Objeto.ID_ACREDITADO.Control:=edID_ACREDITADO;
      Objeto.ID_DISPOSICION.Control:=edDISPOSICION;
      Objeto.B_APLICA_PROM.Control :=cbB_PROM_ADMI;
      Objeto.B_APL_PROM_ASOC.Control :=cbB_PROM_ASOC;
      Objeto.B_APLICA_ACRED.Control := cbB_APLI_ACRED;
      Objeto.B_APLICA_DISP.Control := cbB_DISPOSICION;
      Objeto.SITUACION.Control:=rgSITUACION;
      Objeto.F_INICIAL.Control:=edF_INICIAL;
      Objeto.F_FINAL.Control:=edF_FINAL;

      Objeto.ID_CREDITO.Control:=edID_CREDITO;
      Objeto.CVE_TIPO_PAGO.Control:=rgTIPO_PAGO;
      Objeto.CVE_SEGUIMIENTO.Control:=edMODO_PAGO;
      Objeto.IMP_TOTAL.Control:=edIMPORTE;
      Objeto.TX_DESC_INSTRUC.Control:=edCOMENTARIO;


      Objeto.PromAdmi.PromAsociado.Nombre.Control := edNOM_PROM_ADMI;
      Objeto.PromAdmi.Id_Pers_Asociad.Control := edID_PROM_ADMIN;
      Objeto.PromAdmi.GetParams(Objeto);

      Objeto.PromAsoc.PromAsociado.Nombre.Control := edNOM_PROM_ASOC;
      Objeto.PromAsoc.Id_Pers_Asociad.Control := edPROM_ASOCIADO;
      Objeto.PromAsoc.GetParams(Objeto);

      Objeto.Acreditado.Persona.Nombre.Control := edNOM_ACREDITADO;
      Objeto.Acreditado.ID_ACREDITADO.Control := edID_ACREDITADO;
      Objeto.Acreditado.GetParams(Objeto);

      Objeto.Disposicion.ID_CREDITO.Control:=edDISPOSICION;
      Objeto.Disposicion.ContratoCre.Contrato.TITNombre.Control := edTIT_DISPOSICION;
      Objeto.Disposicion.GetParams(Objeto);

      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edTIT_CREDITO;
      Objeto.Seguimiento.DESC_SEGUIMIENTO.Control := edDESC_MODO_PAGO;
      InterForma1.MsgPanel := MsgPanel;
end;

procedure TWCrSeCoPr.FormDestroy(Sender: TObject);
begin
      Objeto.ID_PROM_ADMI.Control:=nil;
      Objeto.ID_PROM_ASOC.Control:=nil;
      Objeto.ID_ACREDITADO.Control:=nil;
      Objeto.ID_DISPOSICION.Control:=nil;
      Objeto.B_APLICA_PROM.Control :=nil;
      Objeto.B_APL_PROM_ASOC.Control :=nil;
      Objeto.B_APLICA_ACRED.Control := nil;
      Objeto.B_APLICA_DISP.Control := nil;
      Objeto.SITUACION.Control:=nil;
      Objeto.F_INICIAL.Control:=nil;
      Objeto.F_FINAL.Control:=nil;
      Objeto.ID_CREDITO.Control:=nil;
      Objeto.CVE_TIPO_PAGO.Control:=nil;
      Objeto.CVE_SEGUIMIENTO.Control:=nil;
      Objeto.IMP_TOTAL.Control:=nil;
      Objeto.TX_DESC_INSTRUC.Control:=nil;



      Objeto.PromAdmi.PromAsociado.Nombre.Control := nil;
      Objeto.PromAdmi.Id_Pers_Asociad.Control := nil;

      Objeto.PromAsoc.PromAsociado.Nombre.Control := nil;
      Objeto.PromAsoc.Id_Pers_Asociad.Control := nil;

      Objeto.Acreditado.Persona.Nombre.Control := nil;
      Objeto.Acreditado.ID_ACREDITADO.Control := nil;
      Objeto.Disposicion.ID_CREDITO.Control:=nil;
      Objeto.Disposicion.ContratoCre.Contrato.TITNombre.Control := nil;

      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
      Objeto.Seguimiento.DESC_SEGUIMIENTO.Control := nil;
   //Objeto
end;

procedure TWCrSeCoPr.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrSeCoPr.InterForma1DespuesNuevo(Sender: TObject);
begin
   rgTIPO_PAGO.ItemIndex := 0;
   edID_CREDITO.SetFocus;
end;

procedure TWCrSeCoPr.InterForma1DespuesModificar(Sender: TObject);
begin
   edID_PROM_ADMIN.SetFocus;
end;


procedure TWCrSeCoPr.btPROM_ADMINClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRSECOPR_PRMADM',True,True) then
   begin
       Objeto.PromAdmi.ShowAll := True;
       if (Objeto.PromAdmi.Busca) then
       Begin
          cbB_PROM_ADMI.Checked := True;
          cbB_PROM_ADMI.Enabled := True;
          InterForma1.NextTab(edID_PROM_ADMIN);
       end;
          cbB_PROM_ADMI.Checked := True;
          cbB_PROM_ADMI.Enabled := True;
       MuestraDatos;
   end;
end;

procedure TWCrSeCoPr.ilPROM_ADMINEjecuta(Sender: TObject);
begin
   if Objeto.PromAdmi.FindKey([ilPROM_ADMIN.Buffer]) then
   Begin
      cbB_PROM_ADMI.Checked := True;
      cbB_PROM_ADMI.Enabled := True;
      InterForma1.NextTab(edID_PROM_ADMIN);
      MuestraDatos;
   end;
end;

procedure TWCrSeCoPr.btACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRSECOPR_ACRED',True,True) then
   begin
       Objeto.Acreditado.ShowAll := True;
       if Objeto.Acreditado.Busca then
       Begin
          cbB_APLI_ACRED.Checked := True;
          cbB_APLI_ACRED.Enabled := True;
          InterForma1.NextTab(edID_ACREDITADO);
          MuestraDatos;
       end;
   end;
end;

procedure TWCrSeCoPr.ilACREDITADOEjecuta(Sender: TObject);
begin
   if Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) then
   Begin
      cbB_APLI_ACRED.Checked := True;
      cbB_APLI_ACRED.Enabled := True;
      InterForma1.NextTab(edID_ACREDITADO);
      MuestraDatos;
   end;
end;

procedure TWCrSeCoPr.btCREDITOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRSECOPR_DISP2',True,True) then
   begin
       Objeto.Credito.ShowAll := True;
       if Objeto.Credito.Busca then
          InterForma1.NextTab(edID_CREDITO);
       //end IF
   end;
end;

procedure TWCrSeCoPr.ilCREDITOEjecuta(Sender: TObject);
var vlBuscaWhere : String;
begin
   //LOLS 07 SEP 2005
   vlBuscaWhere := Objeto.Credito.BuscaWhereString;
   Objeto.Credito.BuscaWhereString := 'CONTRATO.ID_EMPRESA = ' + IntToStr(Objeto.Apli.IdEmpresa);
   //ENDS_LOLS_07_SEP_2005
   if Objeto.Credito.FindKey([ilCREDITO.Buffer]) then
      InterForma1.NextTab(edID_CREDITO);
   //end if
   //LOLS 07 SEP 2005
   Objeto.Credito.BuscaWhereString := vlBuscaWhere;
   //ENDS_LOLS_07_SEP_2005
end;

procedure TWCrSeCoPr.cbB_PROM_ADMIClick(Sender: TObject);
begin
   if not(cbB_PROM_ADMI.Checked) then
   Begin
      Objeto.PromAdmi.Active := False;
   end;

   if not(Objeto.PromAdmi.Active) then
      cbB_PROM_ADMI.Checked := False;
end;

procedure TWCrSeCoPr.InterForma1DespuesShow(Sender: TObject);
begin
   rgSITUACION.ItemIndex := 3;
   Objeto.F_INICIAL.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.F_FINAL.AsDateTime := Objeto.Apli.DameFechaEmpresa;

   edTIT_SEL.Color := clAmarillito;
   edTIT_MODO_PAGO.Color := clAmarillito;
   edTIT_IMPORTE.Color := clAmarillito;
   edTIT_CHEQRA.Color := clAmarillito;
   edTIT_CLIENTE.Color := clAmarillito;
   edTIT_PROMOTOR.Color := clAmarillito;
   edTIT_SIT.Color := clAmarillito;
   edTIT_FECHA.Color := clAmarillito;
   edTIT_ID_CREDITO.Color := clAmarillito;

   // LOLS 07 SEP 2005
   Objeto.Credito.BuscaWhereString := 'CONTRATO.ID_EMPRESA = ' + IntToStr(Objeto.Apli.IdEmpresa);
   Objeto.Credito.FilterString     := 'PKGCRACTUALIZA.STPOBTEMPCTTO( CR_CREDITO.ID_CONTRATO ) = ' + IntToStr(Objeto.Apli.IdEmpresa);
   Objeto.Disposicion.BuscaWhereString := Objeto.Credito.BuscaWhereString;
   Objeto.Disposicion.FilterString     := Objeto.Credito.FilterString;
   //ENDS_LOLS_07_SEP_2005

   edID_PROM_ADMIN.SetFocus;
   MuestraDatos;
end;

procedure TWCrSeCoPr.cbB_APLI_ACREDClick(Sender: TObject);
begin
   if not(cbB_APLI_ACRED.Checked) then
   Begin
      Objeto.Acreditado.Active := False;
   end;

   if not(Objeto.Acreditado.Active) then
      cbB_APLI_ACRED.Checked := False;
end;

procedure TWCrSeCoPr.edF_FINALExit(Sender: TObject);
begin
     Objeto.F_INICIAL.GetFromControl;
     Objeto.F_FINAL.GetFromControl;
     if (Objeto.F_FINAL.AsDateTime < Objeto.F_INICIAL.AsDateTime)  then
     Begin
        ShowMessage('La fecha inicial no debe de ser mayor a la fecha final');
        edF_FINAL.SetFocus;
     end
end;

procedure TWCrSeCoPr.dtFRealPagoExit(Sender: TObject);
begin
     Objeto.F_INICIAL.GetFromControl;
     Objeto.F_FINAL.GetFromControl;
     if (Objeto.F_FINAL.AsDateTime < Objeto.F_INICIAL.AsDateTime)  then
     Begin
        ShowMessage('La fecha inicial no debe de ser mayor a la fecha final');
        edF_INICIAL.SetFocus;
     end
end;

procedure TWCrSeCoPr.btBUSCAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRSECOPR_BUSCA',True,True) then
      MuestraDatos;
end;

procedure TWCrSeCoPr.sgcDATOSDblClick(Sender: TObject);
var Y : integer;
    vlContrato : String;
    vlChequera : String;
    vlfecha1, vlcveseg : String;
    vlFecha    : TDate;
begin
  with Objeto, sgcDATOS do
  Begin
     Y := SG.Row;
//     ShowMessage(IntToStr(SG.Selection.Left));
      if SG.Selection.Left = coPosChq then         // Muestra los movtos sobre la chequera
      Begin
            //Llama a la clase de Depositos a la vista
         vlContrato := CellStr[ 'CHEQUERA', Y ];
         if ( vlContrato <> '' ) and ( Contrato.FindKey( [ vlContrato ] )  ) then
         begin
           ConTransa.Contrato := Contrato;
           ConTransa.Catalogo;
         end;
      end    // Marca Registro a Identificar
      else if SG.Selection.Left = coPosSel then
           Begin
{           if CountSelec(sgcDatos,'SEL') = 0 then
           Begin
              vlMedio := '';
              vlCliente := '';
           end;

           if ((vlMedio = '')or(vlCliente = '')) then
           Begin
              vlMedio := CellStr['CVE_SEGUIMIENTO',Y];
              vlCliente := CellStr['ID_TITULAR',Y];
           end;

           if ((vlMedio = CellStr['CVE_SEGUIMIENTO',Y]) and
               (vlCliente = CellStr['ID_TITULAR',Y]) and
               (CellStr['SIT_SEGUIMIENTO',Y] <> CSIT_ID) and
               (CellStr['SIT_SEGUIMIENTO',Y] <> CSIT_CA)and
               (CellStr['SIT_SEGUIMIENTO',Y] <> CSIT_CI)) then
           Begin}
             if CellStr['SEL',Y] = 'SI' + #30 + '>C' then
                CellStr['SEL',Y]:= ''
             else
             Begin
                CellStr['SEL',Y]:= 'SI' + #30 + '>C';
             end;
           end;
      end;
  //END;
end;

procedure TWCrSeCoPr.sgcDATOSCalcRow(Sendet: TObject; DataSet: TDataSet;
  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
var vlGpoPago : String;
    vlCompara : Boolean;
    vlCadTotGpo : String;
   Function NomTipPago(CveTipPago: string): String;
   var vlNombre :string;
   Begin
      if  DataSet.FieldByName('ORDEN_COB').AsInteger = 3 then
          vlNombre := 'IMPAGADA'
      else if DataSet.FieldByName('ORDEN_COB').AsInteger = 1 then
          vlNombre := 'PROGRAMADA'
      else if DataSet.FieldByName('ORDEN_COB').AsInteger = 2 then
          vlNombre := 'ANTICIPADA';
      NomTipPago := vlNombre;
   end;

begin
  {Inicializa las variable de total }
  if ( RowCaso = rcQueryBegin ) then
  begin
      vlTotalGpo := 0;
      vlFinicio  := True;
  end;//ends_if

  {}
  if cbSELECCIONA.Checked then
  Begin
    if ( RowCaso = rcRowBegin ) then
    begin
        { Valida un cambio de grupo }
        if ( Objeto.vgIdGpoPago <> DataSet.FieldByName('ID_GRUPO_PAGO').AsString ) then
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
          vlTotalGpo := DataSet.FieldByName('IMP_TOTAL').AsFloat;
          Objeto.vgTipoPago := '';  { Resetea tipo de cobranza ( anticipada, impagada, programada ) }
          Objeto.vgIdGpoPago := DataSet.FieldByName('ID_GRUPO_PAGO').AsString;
          sgcDATOS.AddTexto('GRUPO PAGO: ' + Objeto.vgIdGpoPago , tcCenter, clMaroon, 15);
        end else
        begin
          vlTotalGpo := vlTotalGpo + DataSet.FieldByName('IMP_TOTAL').AsFloat;
        end;
    end;
    { Valida fin de Query }
    if ( RowCaso = rcQueryEnd ) then
    begin
        vlCadTotGpo := 'IMP. TOTAL GRUPO: '+Format(CFORMAT_DINERO,[ vlTotalGpo ] );
        sgcDATOS.AddTexto( vlCadTotGpo, tcCenter, clMaroon, 15);
    end;//ends_if
    {}
  end;

    if Objeto.vgTipoPago <> DataSet.FieldByName('ORDEN_COB').AsString then
    Begin
      Objeto.vgTipoPago := DataSet.FieldByName('ORDEN_COB').AsString;
      sgcDATOS.AddTitle('COBRANZA ' + NomTipPago(Objeto.vgTipoPago), tcCenter);
    end;
    // Si No identificado lo pone en color azul
    if DataSet.FieldByName('SIT_SEGUIMIENTO').AsString = CSIT_NI then
       sgcDATOS.SetFontColor(CBLUE)
    //Si es identificado lo pone de color rojo
    else if DataSet.FieldByName('SIT_SEGUIMIENTO').AsString = CSIT_ID then
       sgcDATOS.SetFontColor(CRED)
    //Si es cancelado lo pone de color verde
    else if DataSet.FieldByName('SIT_SEGUIMIENTO').AsString = CSIT_CA then
       sgcDATOS.SetFontColor(CGREEN)
    //Si es cancelado identificado lo pone de color Teal
    else if DataSet.FieldByName('SIT_SEGUIMIENTO').AsString = CSIT_CI then
       sgcDATOS.SetFontColor(CTEAL);

end;

procedure TWCrSeCoPr.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   if IsNewData then
   Begin
      Realizado := True;
         if not(Objeto.ObtenRangoHora) then
            Realizado := False
         else
         Begin
            Objeto.F_COBRANZA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
            Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
            Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
            Objeto.ID_COD_RESP.AsInteger := 0;
            Objeto.SIT_SEGUIMIENTO.AsString := CSIT_NI;
            Objeto.ID_SEGUIMIENTO.AsInteger := ObtenFolio(CCRIDSEG,'ID SEGUIMIENTO: ', Objeto.Apli);
            Objeto.ID_GRUPO_PAGO.AsInteger := ObtenFolio(CCRGPSEG,'GRUPO PAGO: ', Objeto.Apli);
         end;
   end;
end;

procedure TWCrSeCoPr.btMODO_PAGOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRSECOPR_MEDIO',True,True) then
   begin
       Objeto.Seguimiento.ShowAll := True;
       if Objeto.Seguimiento.Busca  then
          InterForma1.NextTab(edMODO_PAGO);
       //end if
   end;
end;

procedure TWCrSeCoPr.ilMODO_PAGOEjecuta(Sender: TObject);
begin
   if Objeto.Seguimiento.FindKey([ilMODO_PAGO.Buffer]) then
      InterForma1.NextTab(edMODO_PAGO);
   //end if
end;

Procedure TWCrSeCoPr.ActualizaGP(pRow: Integer; pCveGP : String; pGrupo : String; pIndica : String);
var vlsql : String;
    vlFCobranza : String;
    vlIdSeguimi : String;
Begin
   vlFCobranza :=sgcDATOS.CellStr['F_COBRANZA',pRow];
   vlIdSeguimi :=sgcDATOS.CellStr['ID_SEGUIMIENTO',pRow];
//Actualiza el grupo
   vlsql := ' UPDATE CR_BIT_SEGUIMIENTO ' +
            ' SET ID_GRUPO_PAGO = ' + pCveGP +
            ' WHERE F_COBRANZA = TO_DATE(' + #39 + vlFCobranza + #39 + ',' + #39 + 'DD/MM/YYYY'+ #39 + ')' +
            ' AND ID_SEGUIMIENTO = ' + vlIdSeguimi;

   if pIndica = CTODO then
      vlsql := vlsql + ' AND ID_GRUPO_PAGO = ' + pGrupo;

   RunSQL(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
End;

procedure TWCrSeCoPr.Agrupar1Click(Sender: TObject);
var nRow       : Integer;
    vlGpoPag   : Integer;
    vlChequera : String;
    vlMedio    : String;
    vlCliente  : String;
    vlAfecto   : Boolean;
    vlCount    : Integer;
begin
   vlAfecto   := False;
   nRow       := sgcDATOS.SG.Row;
   vlChequera := '';
   vlMedio    := '';
   vlCliente  := '';
   vlCount    := 0;
   if CountSelec( sgcDatos, 'SEL' ) > 1 then
   Begin
     if MessageDlg('¿Está seguro de agrupar ' +IntToStr(CountSelec(sgcDatos,'SEL')) + ' registros',
                     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     Begin    //Obtiene el Folio del Grupo de pago (CCRGPSEG : constante en IntGenCre)
      vlGpoPag   := ObtenFolio(CCRGPSEG,'GRUPO PAGO: ', Objeto.Apli);
      For nRow := 1 To sgcDATOS.SG.RowCount - 1 Do
      Begin
        if  (sgcDATOS.CellStr['SEL',nRow] = 'SI' + #30 + '>C') then
        Begin
           if ( StrToDateTime(sgcDATOS.CellStr['F_COBRANZA', nRow]) = Objeto.Apli.DameFechaEmpresa ) then
           Begin
            vlMedio    := sgcDATOS.CellStr['CVE_SEGUIMIENTO',nRow];
            vlCliente  := sgcDATOS.CellStr['ID_TITULAR',nRow];
            vlChequera := sgcDATOS.CellStr['CHEQUERA',nRow];
            ShowMessage('Se agruparan solo los registros con medio de pago : <' + vlMedio +
                        '> , Id. Cliente : <' + vlCliente + '> y chequera : <' + vlChequera + '> del mismo día.' );

            break;
           end
           else Begin
                  ShowMessage('No se pueden agrupar registros que no sean del mismo día. Favor de reactivarlos');
                  break;
                end;
        end;
      end;
      For nRow := 1 To sgcDATOS.SG.RowCount - 1 Do
      Begin
           if (sgcDATOS.CellStr['SEL',nRow] = 'SI' + #30 + '>C') then
           Begin

             if ( ( sgcDATOS.CellStr['CVE_SEGUIMIENTO',nRow] =  vlMedio   ) and
                  ( sgcDATOS.CellStr['ID_TITULAR'     ,nRow] =  vlCliente ) and
                  ( sgcDATOS.CellStr['CHEQUERA'       ,nRow] =  vlChequera) and
                  ( sgcDATOS.CellStr['SIT_SEGUIMIENTO',nRow] <> CSIT_ID   ) and
                  ( sgcDATOS.CellStr['SIT_SEGUIMIENTO',nRow] <> CSIT_CA   ) and
                  ( sgcDATOS.CellStr['SIT_SEGUIMIENTO',nRow] <> CSIT_CI   ) and
                  ( StrToDateTime(sgcDATOS.CellStr['F_COBRANZA', nRow]) = Objeto.Apli.DameFechaEmpresa ) )then
             Begin
               sgcDATOS.CellStr['SEL',nRow] := 'SI' + #30 + '>C'
             end
             else
             Begin
                sgcDATOS.CellStr['SEL',nRow]:= '';
             end;
             if (sgcDATOS.CellStr['SEL',nRow] = 'SI' + #30 + '>C') then
             Begin
                ActualizaGP(nRow,IntToStr(vlGpoPag),'','');//Actualiza la clave grupo pago
                vlAfecto := True;
                vlCount := vlCount + 1;
             end;
           end;
      end;
      if vlAfecto then
         ShowMessage('Se han agrupado ' + IntToStr(vlCount) + ' registros. ' );
      //end if
      MuestraDatos;
      //end for
     end;
   end
   else
      ShowMessage('No existen registros para Agrupar');
end;

procedure TWCrSeCoPr.SumaImpTotal;
{
var vlTotal     : String;
    vlSql       : String;
    }
begin
{
   if rgTIPO_PAGO.ItemIndex <> 1 then
   Begin
      vlSql := CadSQLTotal;
      GetSQLStr(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'IMP_TOTAL',vlTotal,False);
      if vlTotal <> '' then
         Objeto.IMP_TOTAL.AsFloat := StrToFloat(vlTotal)
      else Objeto.IMP_TOTAL.AsFloat := 0;
   end
   else
      Objeto.IMP_TOTAL.AsFloat := 0;
      } //LOLS -->> 09-01-2004
end;

procedure TWCrSeCoPr.edID_CREDITOExit(Sender: TObject);
Var     vlSalida        : Boolean;
        vlMsg           : String;
begin
   vlSalida := True;
   vlMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      Objeto.ID_CREDITO.GetFromControl;
      if Objeto.ID_CREDITO.AsString = '' then
      Begin
          vlSalida := False;
          vlMsg := 'Favor de Indicar la disposición';
      end;
      Objeto.Seguimiento.BuscaWhereString := 'CR_SEGUIMIENTO.CVE_MONEDA = ' + Objeto.Credito.ContratoCre.CVE_MONEDA.AsString;
      Objeto.Seguimiento.FilterString := Objeto.Seguimiento.BuscaWhereString;
      InterForma1.ValidaExit(edID_CREDITO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrSeCoPr.edMODO_PAGOExit(Sender: TObject);
Var     vlSalida        : Boolean;
        vlMsg           : String;
begin
   vlSalida := True;
   vlMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      Objeto.CVE_SEGUIMIENTO.GetFromControl;
      if Objeto.CVE_SEGUIMIENTO.AsString = '' then
      Begin
          vlSalida := False;
          vlMsg := 'Favor de Indicar el Medio de Pago';
      end;
      IF InterForma1.IsNewData THEN
         SumaImpTotal;
      //END IF
      InterForma1.ValidaExit(edMODO_PAGO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrSeCoPr.rgTIPO_PAGOExit(Sender: TObject);
begin
   SumaImpTotal;
   InterForma1.ValidaExit(rgTIPO_PAGO,True,'',True);
end;

procedure TWCrSeCoPr.edIMPORTEExit(Sender: TObject);
Var     vlSalida        : Boolean;
        vlMsg           : String;
begin
   vlSalida := True;
   vlMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      Objeto.IMP_TOTAL.GetFromControl;
      if Objeto.IMP_TOTAL.AsString = '' then
      Begin
          vlSalida := False;
          vlMsg := 'Favor de Indicar el importe';
      end
      else if Objeto.IMP_TOTAL.AsInteger < 0 then
      Begin
          vlSalida := False;
          vlMsg := 'El importe debe ser mayor a 0';
      end;
      InterForma1.ValidaExit(edIMPORTE,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrSeCoPr.edCOMENTARIOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCOMENTARIO,True,'',True);
end;

procedure TWCrSeCoPr.InterForma1DespuesAceptar(Sender: TObject);
begin
   rgSITUACION.ItemIndex := 3;
   Objeto.F_INICIAL.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.F_FINAL.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   edID_PROM_ADMIN.SetFocus;

   edID_CREDITO.Text := '';
   edTIT_CREDITO.Text := '';
   edMODO_PAGO.Text  := '';
   edDESC_MODO_PAGO.Text  := '';
   edCOMENTARIO.Text := '';
//   edIMPORTE.Text := '';
//   rgTIPO_PAGO.ItemIndex :=0;
   MuestraDatos;
end;

procedure TWCrSeCoPr.InterForma1DespuesCancelar(Sender: TObject);
begin
   rgSITUACION.ItemIndex := 3;
   Objeto.F_INICIAL.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.F_FINAL.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   edID_PROM_ADMIN.SetFocus;

   edID_CREDITO.Text := '';
   edMODO_PAGO.Text  := '';
   Objeto.Credito.Active := False;
   Objeto.Seguimiento.Active := False;
   edCOMENTARIO.Text := '';
   edIMPORTE.Text := '';
   rgTIPO_PAGO.ItemIndex :=0;
   
   MuestraDatos;
end;


procedure TWCrSeCoPr.Desagrupar1Click(Sender: TObject);
var nRow       : Integer;
    vlGpoPag   : Integer;
    vlChequera : String;
    vlMedio    : String;
    vlCliente  : String;
    vlAfecto   : Boolean;
    vlCount    : Integer;
begin
   vlAfecto   := False;
   vlChequera := '';
   vlMedio    := '';
   vlCliente  := '';
   vlCount    := 0;
   nRow       := sgcDATOS.SG.Row;
   if CountSelec(sgcDatos,'SEL') > 0 then
   Begin
     if MessageDlg('¿Está seguro de desagrupar ' +IntToStr(CountSelec(sgcDatos,'SEL')) + ' registros',
                     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     Begin
        vlGpoPag   := ObtenFolio(CCRGPSEG,'GRUPO PAGO: ', Objeto.Apli);
      For nRow := 1 To sgcDATOS.SG.RowCount - 1 Do
      Begin
        if  (sgcDATOS.CellStr['SEL',nRow] = 'SI' + #30 + '>C') then
        Begin
        vlMedio    := sgcDATOS.CellStr['CVE_SEGUIMIENTO',nRow];
        vlCliente  := sgcDATOS.CellStr['ID_TITULAR',nRow];
        vlChequera := sgcDATOS.CellStr['CHEQUERA',nRow];
        ShowMessage('Se desagruparan solo los registros con medio de pago : <' + vlMedio +
                    '> , Id. Cliente : <' + vlCliente + '> y chequera : <' + vlChequera + '> del mismo día' );

        break;
        end;
      end;

        For nRow := 1 To sgcDATOS.SG.RowCount - 1 Do
        Begin
           if (sgcDATOS.CellStr['SEL',nRow] = 'SI' + #30 + '>C') then
           Begin
             if ( ( sgcDATOS.CellStr['CVE_SEGUIMIENTO',nRow] =  vlMedio   ) and
                  ( sgcDATOS.CellStr['ID_TITULAR'     ,nRow] =  vlCliente ) and
                  ( sgcDATOS.CellStr['CHEQUERA'       ,nRow] =  vlChequera) and
                  ( sgcDATOS.CellStr['SIT_SEGUIMIENTO',nRow] <> CSIT_ID   ) and
                  ( sgcDATOS.CellStr['SIT_SEGUIMIENTO',nRow] <> CSIT_CA   ) and
                  ( sgcDATOS.CellStr['SIT_SEGUIMIENTO',nRow] <> CSIT_CI   ) and
                  ( StrToDateTime(sgcDATOS.CellStr['F_COBRANZA', nRow]) = Objeto.Apli.DameFechaEmpresa ) )then
             Begin
                sgcDATOS.CellStr['SEL',nRow] := 'SI' + #30 + '>C'
             end
             else
             Begin
                sgcDATOS.CellStr['SEL',nRow]:= '';
             end;
             if ( sgcDATOS.CellStr['SEL',nRow] = 'SI' + #30 + '>C' ) then
             Begin
                ActualizaGP( nRow, IntToStr(vlGpoPag), '', '' );//Actualiza la clave grupo pago
                vlCount := vlCount + 1;
                vlAfecto := True;
             end;
           end;
        end;
        //end for
        if vlAfecto then
         ShowMessage('Se han desagrupado ' + IntToStr(vlCount) + ' registros. ' );
        //end if
        MuestraDatos;
     end;
   end
   else
      ShowMessage('No existen registros para desagrupar');
end;

procedure TWCrSeCoPr.DesagruparTodo1Click(Sender: TObject);
var nRow       : Integer;
    vlGpoPag   : Integer;
    vlGrupo    : String;
    nReg       : Integer;
begin
   nRow := sgcDATOS.SG.Row;
   nReg := sgcDATOS.SG.Row;
   if CountSelec(sgcDatos,'SEL') > 0 then
   Begin
      For nRow := 0 To sgcDATOS.SG.RowCount - 1 Do
      Begin
         if  (sgcDATOS.CellStr['SEL',nRow] = 'SI' + #30 + '>C') then
         Begin
           vlGrupo := sgcDATOS.CellStr['ID_GRUPO_PAGO',nRow];
           if MessageDlg('¿Se van a desagrupar todos los registros del grupo <' + vlGrupo + '> ?',
                           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
           Begin
              For nReg := 0 To sgcDATOS.SG.RowCount - 1 Do
                 if (sgcDATOS.CellStr['ID_GRUPO_PAGO',nReg] = vlGrupo) then
                 Begin
                    vlGpoPag := ObtenFolio(CCRGPSEG,'GRUPO PAGO: ', Objeto.Apli);
                    ActualizaGP(nRow,IntToStr(vlGpoPag),vlGRupo,CTODO);//Actualiza la clave grupo pago
                 end;
              //end for
              ShowMessage('Se han desagrupado registros del grupo <' + vlGrupo + '>' );
           end;
         end;
      end;
      MuestraDatos;
   end
   else
      ShowMessage('No existen registros para desagrupar');
end;



procedure TWCrSeCoPr.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado := True;
   if not(Objeto.ObtenRangoHora) then
      Realizado := False;
end;

procedure TWCrSeCoPr.cbSELECCIONAClick(Sender: TObject);
begin
   MuestraDatos;
end;

procedure TWCrSeCoPr.btDISPOSICIONClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRSECOPR_DISP1',True,True) then
   begin
       Objeto.Disposicion.ShowAll := True;
       if Objeto.Disposicion.Busca then
       Begin
          cbB_DISPOSICION.Checked := True;
          cbB_DISPOSICION.Enabled := True;
          InterForma1.NextTab(edDISPOSICION);
          MuestraDatos;
       end;
   end;
end;

procedure TWCrSeCoPr.ilDISPOSICIONEjecuta(Sender: TObject);
begin
   if Objeto.Disposicion.FindKey([ilDISPOSICION.Buffer]) then
   Begin
      cbB_DISPOSICION.Checked := True;
      cbB_DISPOSICION.Enabled := True;
      InterForma1.NextTab(edDISPOSICION);
      MuestraDatos;
   end;
end;

procedure TWCrSeCoPr.cbB_DISPOSICIONClick(Sender: TObject);
begin
   if not(cbB_DISPOSICION.Checked) then
   Begin
      Objeto.Disposicion.Active := False;
   end;

   if not(Objeto.Disposicion.Active) then
      cbB_DISPOSICION.Checked := False;
end;

procedure TWCrSeCoPr.ReactivarGrupo1Click(Sender: TObject);
var vlStrDate     : String;
    vlIdSegto     : String;
    nRow          : Integer;
    nCount        : Integer;
    vlSegto       : Integer;
    vlNumRec      : Integer;
    vlWCrSeCoPrRe : TWCrSeCoPrRe;
    //
    vlMedio       : String;
    vlTxNota      : String;
    {}
    procedure ValidaReactivacion;
    var vlRow     : Integer;
        vlSit     : String;
        vlSelect  : Boolean;
        vlFEmpre  :TDateTime;
    begin
      vlFEmpre := Objeto.Apli.DameFechaEmpresa;
      for vlRow := 1 to sgcDATOS.SG.RowCount - 1 do
      begin
        vlSit    := sgcDATOS.CellStr[ 'SIT_SEGUIMIENTO', vlRow ]; //Obtien la situacion del movimiento
        vlSelect := ( sgcDATOS.CellStr[ 'SEL', vlRow ] = 'SI' + #30 + '>C' );    // Valida si esta seleccionado
        //
        if ( vlSit = CSIT_ID ) and ( vlSelect = True ) then  // Valida si esta identificado y seleccionado
          sgcDATOS.CellStr['SEL', vlRow ] := '';            // lo desmarca  ya que no puede reactivar identificados
        //ends_if

        if ( vlSit = CSIT_NI ) and ( StrToDateTime( sgcDATOS.CellStr['F_COBRANZA', vlRow ] ) = vlFEmpre ) then
          sgcDATOS.CellStr[ 'SEL', vlRow ] := '';           // No puede reactivar un movimiento del dia
        //ends_if                                           // que se encuentra no identificado
      end;
    end;
begin
  //BEGIN_VALIDA_MOVIMIENTOS
  // En esta parte del código valida cuantos movimientos seleccionó el usuario
  // y cuantos de esos movimientos se van a reactivar
  vlNumRec := CountSelec(sgcDatos,'SEL');          // Número de movimientos originales
  ValidaReactivacion;                              // Validación
  if vlNumRec <> CountSelec(sgcDatos,'SEL') then   // Número de movimientos despues de la validación
  begin
    ShowMessageFmt( coAvisoRe, [ vlNumRec -  CountSelec(sgcDatos,'SEL'), vlNumRec ] );
    vlNumRec := CountSelec(sgcDatos,'SEL');
  end;//ends_if
  //ENDS_VALIDA_MOVIMIENTOS

  //INICIA PROCESO
  if vlNumRec >= 1 then
  begin
    if ( MessageDlg( coConfirRe, mtConfirmation, mbYesNoCancel, 0 ) = mrYes ) then
    begin
      vlWCrSeCoPrRe := TWCrSeCoPrRe.Create(Self);
      try
        vlWCrSeCoPrRe.CreaObjeto(Self, Objeto.Apli );
        vlWCrSeCoPrRe.BCambiarDatos;
        nCount := 0;
        for nRow := 1 to sgcDATOS.SG.RowCount - 1 do
        begin
          if ( sgcDATOS.CellStr['SEL',nRow] = 'SI' + #30 + '>C') then
          begin
            vlStrDate := sgcDATOS.CellStr[ 'F_COBRANZA',     nRow ];
            vlIdSegto := sgcDATOS.CellStr[ 'ID_SEGUIMIENTO', nRow ];
            //
            vlWCrSeCoPrRe.ObtenDatosReactivacion( vlStrDate, vlIdSegto, vlMedio, vlTxNota );
            //
            StpReactivaSegui( vlIdSegto, '', vlMedio, vlTxNota, StrToDateTime( vlStrDate ), 
                              Objeto.Apli, vlSegto );
            inc( nCount );
          end;
        end;//end for
        ShowMessage('Han sido reactivadas ' + IntToStr(nCount) + ', transacciones');
        MuestraDatos;
      finally
        if Assigned(vlWCrSeCoPrRe) then
        begin
          vlWCrSeCoPrRe.LiberaObjeto;
          vlWCrSeCoPrRe.Free;
        end;
      end;
    end;//ends_if_(_MessageDlg(_coConfirRe, mtConfirmation, mbYesNoCancel, 0 ) = mrYes ) then
  end else begin
    ShowMessage('No existen registros seleccionados para reactivar');
  end;//ends_if vlNumRec >= 1 then
end;


procedure TWCrSeCoPr.ReactivarGrupo2Click(Sender: TObject);
var vlFechaCob    : TDate;
    Y             : Integer;
    vlSegto       : Integer;
    //
    vlWCrSeCoPrRe : TWCrSeCoPrRe;
    vlStrDate     : String;
    vlIdSegto     : String;
    vlMedio       : String;
    vlTxNota      : String;
begin
  with sgcDatos do
  Begin
     Y := SG.Row;
     if CellStr['SEL',Y] <> CellStr['ID_SEGUIMIENTO',Y] THEN
     Begin
        vlFechaCob    := StrToDateTime(CellStr['F_COBRANZA',Y]);
        if ( MessageDlg( '¿Desea reactivar transacciones de este grupo?', mtConfirmation, mbYesNoCancel, 0 ) = mrYes ) then
        Begin
              if (sgcDATOS.CellStr['SEL',Y] = 'SI' + #30 + '>C') then
              Begin
                if ( ( sgcDATOS.CellStr['SIT_SEGUIMIENTO',Y] = CSIT_NI ) and
                     ( StrToDateTime(sgcDATOS.CellStr['F_COBRANZA', y]) = Objeto.Apli.DameFechaEmpresa) ) then
                   ShowMessage('No se puede reactivar transacciones No identificadas del día de hoy')
                else if ( sgcDATOS.CellStr['SIT_SEGUIMIENTO',y] = CSIT_ID ) then
                   ShowMessage('No se puede reactivar transacciones Identificadas')
                else
                begin
                  vlWCrSeCoPrRe := TWCrSeCoPrRe.Create(Self);
                  try
                     vlWCrSeCoPrRe.CreaObjeto(Self, Objeto.Apli );
                     vlWCrSeCoPrRe.BCambiarDatos;
                     vlStrDate := sgcDATOS.CellStr[ 'F_COBRANZA',     Y ];
                     vlIdSegto := sgcDATOS.CellStr[ 'ID_SEGUIMIENTO', Y ];
                     //
                     vlWCrSeCoPrRe.ObtenDatosReactivacion( vlStrDate, vlIdSegto, vlMedio, vlTxNota );
                   finally
                     if Assigned(vlWCrSeCoPrRe) then
                     begin
                       vlWCrSeCoPrRe.LiberaObjeto;
                       vlWCrSeCoPrRe.Free;
                     end;
                   end;
                   StpReactivaSegui('',CellStr['ID_GRUPO_PAGO',Y], vlMedio, vlTxNota,
                                    vlFEchaCob, Objeto.Apli, vlSegto);
                   ShowMessage('El grupo de transacciones ha sido reactivado');
                   MuestraDatos;
                end;
              end;
        end;
     end;
  end;
end;

procedure TWCrSeCoPr.btPROM_ASOCIADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRSECOPR_PRMASC',True,True) then
   begin
     Objeto.PromAsoc.ShowAll := True;
     if (Objeto.PromAsoc.Busca) then
     Begin
        cbB_PROM_ASOC.Checked := True;
        cbB_PROM_ASOC.Enabled := True;
        InterForma1.NextTab(edPROM_ASOCIADO);
     end;
        cbB_PROM_ASOC.Checked := True;
        cbB_PROM_ASOC.Enabled := True;
     MuestraDatos;
   end;
end;

procedure TWCrSeCoPr.ilPROM_ASOCIADOEjecuta(Sender: TObject);
begin
   if Objeto.PromAsoc.FindKey([ilPROM_ADMIN.Buffer]) then
   Begin
      cbB_PROM_ASOC.Checked := True;
      cbB_PROM_ASOC.Enabled := True;
      InterForma1.NextTab(edPROM_ASOCIADO);
      MuestraDatos;
   end;
end;

procedure TWCrSeCoPr.InterForma1AntesModificar(Sender: TObject;
  var Realizado: Boolean);
var vlIdSeg : Integer;
    vlFCOb  : String;
    vlSit   : String;
begin
  Realizado := False;
  vlIdSeg := StrToIntDef( sgcDATOS.CellStr[ 'ID_SEGUIMIENTO', sgcDATOS.SG.Row ], 0 );
  vlSit := sgcDATOS.CellStr[ 'SIT_SEGUIMIENTO', sgcDATOS.SG.Row ];
//  vlEnterSit := False;
  if vlIdSeg > 0 then
  begin
    vlFCOb  :=  sgcDATOS.CellStr[ 'F_COBRANZA', sgcDATOS.SG.Row ];
    if StrToDate( vlFCOb ) = Objeto.Apli.DameFechaEmpresa then
    begin
      if vlSit = CSIT_NI then
      Begin
        if Objeto.FindKey( [ vlFCOb, IntToStr( vlIdSeg ) ] ) then
        begin
          Realizado := True;
          edID_CREDITO.SetFocus;
          edIMPORTE.Text := sgcDATOS.CellStr[ 'IMP_TOTAL', sgcDATOS.SG.Row ];
//          Objeto.IMP_TOTAL.AsFloat := StrToFloat(sgcDATOS.CellStr[ 'IMP_TOTAL', sgcDATOS.SG.Row ]);
        end;
      end
      else MessageDlg( 'Solo se pueden modificar movimientos no identificados.',
                  mtInformation, [ mbYes ], 0 );
    end
    else
      MessageDlg( 'Solo se pueden modificar movimientos del día de hoy.',
                  mtInformation, [ mbYes ], 0 );
    //ends_if
  end;
end;

function TWCrSeCoPr.CadSQLTotal: String;
var vlsql     : String;
    vlCondCap : String;
    vlCondInt : String;
    vlCondCon : String;
    vlFecha   : TDate;
    vlIdCred  : String;
begin
  vlFecha := Objeto.Apli.DameFechaEmpresa;
  Objeto.ID_CREDITO.GetFromControl;
  vlIdCred := Objeto.ID_CREDITO.AsString;


  vlCondCap := ' WHERE C.ID_CREDITO   = ' + vlIdCred;
  vlCondInt := ' WHERE I.ID_CREDITO   = ' + vlIdCred;
  vlCondCon := ' WHERE CO.ID_CREDITO  = ' + vlIdCred;
  //IMPAGADO
  if rgTIPO_PAGO.ItemIndex = 2 then
  begin
    vlCondCap := vlCondCap + coCRLF +
                 '   AND C.SIT_CAPITAL  = ''IM'' ';
    vlCondInt := vlCondInt + coCRLF +
                 '   AND I.SIT_INTERES  = ''IM'' ';
    vlCondCon := vlCondCon + coCRLF +
                 '   AND CO.SIT_COMISION= ''IM'' ';
  end
   //PROGRAMADO
  else if rgTIPO_PAGO.ItemIndex = 0 then
  begin
    vlCondCap := vlCondCap + coCRLF +
                 '   AND C.F_PROG_PAGO = ' + SQLFecha( vlFecha ) + coCRLF  +
                 '   AND C.SIT_CAPITAL = ''AC'' ';
    vlCondInt := vlCondInt + coCRLF +
                 '   AND I.F_PROG_PAGO = ' + SQLFecha( vlFecha ) + coCRLF  +
                 '   AND I.SIT_INTERES  = ''AC'' ';
    vlCondCon := vlCondCon + coCRLF +
                 '   AND CO.F_PROG_PAGO =' + SQLFecha( vlFecha ) + coCRLF  +
                 '   AND CO.SIT_COMISION= ''AC'' ';
  end;
    vlsql :=         '        SELECT SUM(IMP_CAPITAL) + '   + coCRLF +
                     '               SUM(IMP_INTERES) + '   + coCRLF +
                     '               SUM(IMP_COMISION) IMP_TOTAL' + coCRLF +
                     '        FROM   ( ' +
                     '                 SELECT PKGCRPERIODO.ObtenImpCob( C.ID_CREDITO,C.NUM_PERIODO, NULL, 1  ) IMP_CAPITAL,   ' + coCRLF +
                     '                        0 IMP_INTERES, 0 IMP_COMISION  '   + coCRLF +
                     '                 FROM   CR_CAPITAL C  '   + coCRLF +
                                       vlCondCap  + coCRLF  +
                     '                 UNION '    + coCRLF  +
                     '                 SELECT 0 IMP_CAPITAL, ' + coCRLF  +
                     '                        PKGCRPERIODO.ObtenImpCob( I.ID_CREDITO,I.NUM_PERIODO, NULL, 2  ) IMP_INTERES, ' + coCRLF  +
                     '                        0 IMP_COMISION ' + coCRLF  +
                     '                 FROM   CR_INTERES I   ' + coCRLF  +
                                       vlCondInt + coCRLF  +
                     '                 UNION '   + coCRLF  +
                     '                 SELECT 0 IMP_CAPITAL,  0 IMP_INTERES, ' + coCRLF  +
                     '                        SUM( PKGCRPERIODO.ObtenImpCob( CO.ID_CREDITO, CO.NUM_PERIODO, CO.CVE_COMISION, 3 ) ) IMP_COMISION ' + coCRLF  +
                     '                 FROM   CR_COMISION CO ' + coCRLF  +
                                       vlCondCon + coCRLF  +
                     '               ) CRE ';
   Result := vlsql;
end;

procedure TWCrSeCoPr.CancelaMovimientos1Click(Sender: TObject);
var SegTeso : TCrSeCoTo;
    vlError : STring;
    nRow    : Integer;
    ncount  : Integer;
    vlGrupo : String;
    vlReg   : String;
    vlCountCanc :Integer;
begin
   nRow := sgcDATOS.SG.Row;
   nCount := CountSelec(sgcDatos,'SEL');
   SegTeso := TCrSeCoTo.Create(nil);
   vlCountCanc := 0;
   Try
   Begin
     if nCount > 0 then
     Begin
       if MessageDlg('¿Está seguro de cancelar  ' + IntToStr(nCount) + ', registros?',
                       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       Begin
          SegTeso.Apli := Objeto.Apli;
          For nRow := 0 To sgcDATOS.SG.RowCount - 1 Do
          Begin
            if (sgcDATOS.CellStr['SEL',nRow] = 'SI' + #30 + '>C') then
            Begin
               vlGrupo := sgcDATOS.CellStr['ID_GRUPO_PAGO',nRow];
               vlReg := IntToStr(nRow + 1) + ': < ' +
                        (sgcDATOS.CellStr['DESC_SEGUIMIENTO',nRow]) +
                         ' > : ' + '< ' + (sgcDATOS.CellStr['ACREDITADO',nRow]) + ' > ';
               SegTeso.CancelaSegCob(vlGrupo,vlReg,1,vlError);
               vlCountCanc := vlCountCanc + 1;
            end;
          end;
          ShowMessage('Se reversaron ' + IntToStr(vlCountCanc) + ' registros.');
          MuestraDatos;
       end;
     end
     else
        ShowMessage('No existen registros para cancelar');
   end;
   Finally
      SegTeso.Free;
   end;

end;



{
     if CBAutorizacion.Checked then
     begin
          Objeto.GetFromControl;
          Case RoWCaso of
          rcQueryBegin : begin
                              VGIDCto     := 0;
                              VGCveMedio  := '';
                              VGCveRefExt := '';
                         end;
          rcRowBegin : begin
                            if ((VGIDCto <> DataSet.FieldByName('ID_CONTRATO').AsInteger) or
                                (VGCveMedio <> DataSet.FieldByName('CVE_MEDIO').AsString) or
                                (VGCveRefExt <> DataSet.FieldByName('REF_EXTERNA').AsString)) then
                            begin
                                 if Objeto.VGComVenAut then
                                    SGClBusMovNoAut.AddTexto('Operación con Compra//Venta Automática',tcLeft,clRed,15);
                                 //end if;
                                 //APLICA SOC INV
                                 //SGClBusMovNoAut.AddTitle(' ', [vlhola]) ,tcLeft);
                                 SGClBusMovNoAut.AddTitle( DataSet.FieldByName('DESC_ENTIDAD').AsString, TcCenter);
                            end;
                            Objeto.VGComVenAut :=((CurrRow >= 2) and (DataSet.FieldByName('B_OPERA_SI').AsString ='V'));
                            VGIDCto     := DataSet.FieldByName('ID_CONTRATO').AsInteger;
                            VGCveMedio  := DataSet.FieldByName('CVE_MEDIO').AsString;
                            VGCveRefExt := DataSet.FieldByName('REF_EXTERNA').AsString;
                       end;
          rcQueryEnd: begin
                           if Objeto.VGComVenAut then
                              SGClBusMovNoAut.AddTexto('Operación con Compra//Venta Automática',tcLeft,clRed,15);
                           //end if;
                      end;
          end; // Case
     end;




}


procedure TWCrSeCoPr.cbB_PROM_ASOCClick(Sender: TObject);
begin
   if not(cbB_PROM_ASOC.Checked) then
   Begin
      Objeto.PromAsoc.Active := False;
   end;

   if not(Objeto.PromAsoc.Active) then
      cbB_PROM_ASOC.Checked := False;
end;

procedure TWCrSeCoPr.rgSITUACIONClick(Sender: TObject);
begin
   MuestraDatos;
end;



{
                 if (sgcDATOS.CellStr['SEL',nRow] = 'SI' + #30 + '>C') then
                 Begin

                    if ( sgcDATOS.CellStr['SIT_SEGUIMIENTO',nRow] <> CSIT_ID ) then
                    Begin
                       if ( ( sgcDATOS.CellStr['SIT_SEGUIMIENTO',nRow] = CSIT_NI ) and
                            ( StrToDateTime(sgcDATOS.CellStr['F_COBRANZA', nRow]) = Objeto.Apli.DameFechaEmpresa) ) then
                            sgcDATOS.CellStr['SEL',nRow] := ''
                       else sgcDATOS.CellStr['SEL',nRow] := 'SI' + #30 + '>C'
                    end
                    else
                    Begin
                       sgcDATOS.CellStr['SEL',nRow]:= '';
                    end;



                    if (sgcDATOS.CellStr['SEL',nRow] = 'SI' + #30 + '>C') then
                    Begin
           end;
}



end.
