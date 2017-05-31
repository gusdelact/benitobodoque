// Sistema         : Clase de CRLIQUIDA
// Fecha de Inicio : 15/01/2004
// Función forma   : Clase de CRLIQUIDA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrBlqDblq;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, IntLinkit, Ungene, Menus,
  //Unidades Adicionales
  IntParamCre,
  IntGenCre,
  IntCrCredito,
  IntCrAcredit,
  IntCtoHeader,
  IntConTransa,
  IntCrBlqRece,
  IntCrCreChe,
  IntCrReCrCh,
  IntBasicCred
  ;
const
   CRED  = clRed;
   CBLUE = clBlue;
   CGREEN= clGreen;

Type
 TCrBlqDblq= class;

  TWCrBlqDblq=Class(TForm)
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
    edTIT_SITUACION: TEdit;
    edTIT_IMPORTE: TEdit;
    edTIT_DISP: TEdit;
    ilACREDITADO: TInterLinkit;
    ilDISPOSICION: TInterLinkit;
    Edit1: TEdit;
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
    ConsultaDisposicin1: TMenuItem;
    Edit3: TEdit;
    ConsultaDepsitosalaVista1: TMenuItem;
    N2: TMenuItem;
    InsertarNuevaOrdenLiquidacin1: TMenuItem;
    rgTIPO_OPERAC: TRadioGroup;
    BitBtn1: TBitBtn;
    Edit2: TEdit;
    Label3: TLabel;
    edCUENTA_BANCO: TEdit;
    btCUENTA: TBitBtn;
    edTITULAR: TEdit;
    ilCUENTA_BANCO: TInterLinkit;
    cbCUENTA_BANCO: TCheckBox;
    Edit5: TEdit;
    ConsultaDisposicinChequera1: TMenuItem;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btDISPOCISIONClick(Sender: TObject);
    procedure cbDISPOSICIONClick(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilDISPOSICIONEjecuta(Sender: TObject);
    procedure cbACREDITADOClick(Sender: TObject);
    procedure rgSITUACIONClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure sgcDATOSCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure btAUTORIZAClick(Sender: TObject);
    procedure btCANCELAClick(Sender: TObject);
    procedure ConsultaDisposicin1Click(Sender: TObject);
    procedure ConsultaDepsitosalaVista1Click(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure InsertarNuevaOrdenLiquidacin1Click(Sender: TObject);
    procedure btCUENTAClick(Sender: TObject);
    procedure ilCUENTA_BANCOEjecuta(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure sgcDATOSDblClick(Sender: TObject);
    procedure btBUSCAClick(Sender: TObject);
    procedure cbCUENTA_BANCOClick(Sender: TObject);
    procedure ConsultaDisposicinChequera1Click(Sender: TObject);
    private
    { Private declarations }
    vlFinicio   : Boolean;
    vlEnterSit  : Boolean;
       procedure   MuestraDatos;
       Function    CadenaSql : String;
       Procedure   Botones;
       procedure   selecciona(sColum: string; nColum : Integer);
       Procedure   CapturaOrden;
    public
    { Public declarations }
    Objeto : TCrBlqDblq;
        function    AutorizaOrden( pIdTransac: String ): Boolean;
        function    CancelaOrden( pIdTransac : String ): Boolean;
end;
 TCrBlqDblq= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        vgAutoriza       : String;
        vgCancela        : String;

        { Public declarations }
        B_APL_AUTO              : TInterCampo;
        B_APL_DISP              : TInterCampo;
        B_APL_ACRE              : TInterCampo;
        SITUACION               : TInterCampo;
        F_OPER_INI              : TInterCampo;
        F_OPER_FIN              : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Disposicion              : TcrCredito;
        Acreditado               : TCrAcredit;
        Chequera                 : TCrCreChe;
        ConTransa                : TConTransa;
        Contrato                 : TCtrlCto;
        BasicCred                : TBasicCred;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrBlqDblq.Create( AOwner : TComponent );
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
      HelpFile := 'IntCrBlqDblq.Hlp';
      ShowMenuReporte:=True;

      Disposicion := TcrCredito.Create(Self);
      Disposicion.MasterSource:=Self;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource:=Self;
      Acreditado.BuscaWhereString := 'CR_ACREDITADO.SIT_ACREDITADO =' + #39 + CSIT_AC + #39;
      Acreditado.FilterString := Acreditado.BuscaWhereString;

      Chequera := TCrCreChe.Create(Self);
      Chequera.MasterSource:=Self;

      ConTransa := TConTransa.Create( Self );
      ConTransa.MasterSource  := Self;

      Contrato  := TCtrlCto.Create( Self );
      Contrato.MasterSource   := Self;

      BasicCred := TBasicCred.Create(Self);
      BasicCred.MasterSource := Self;
end;

Destructor TCrBlqDblq.Destroy;
begin
   if Disposicion  <> nil then
      Disposicion.Free;
   //end if

   if Acreditado <> nil then
      Acreditado.Free;
   //end if

   if Chequera   <> nil then
      Chequera.Free;
   //end if

   if ConTransa <> nil then
      ConTransa.free;
   //end if

   if Contrato <> nil then
      Contrato.Free;
   //end if
   
   If BasicCred <> Nil Then
      BasicCred.Free;
   //end if
   inherited;
end;


function TCrBlqDblq.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrBlqDblq;
begin
   W:=TWCrBlqDblq.Create(Self);
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
                                Autoriza Orden de Bloqueo
----------------------------------------------------------------------------------------}
function TWCrBlqDblq.AutorizaOrden( pIdTransac: String ): Boolean; //easa40111 gym07062005
var vlResult         : Boolean;
    StpAutorizaOrden : TStoredProc;
    vlMsgErr         : String;
begin
    vlResult := True;
    StpAutorizaOrden := TStoredProc.Create(Nil);
    try
       with StpAutorizaOrden do
       begin
          StpAutorizaOrden.DatabaseName:= Objeto.Apli.DatabaseName;
          StpAutorizaOrden.SessionName:= Objeto.Apli.SessionName;
          StpAutorizaOrden.StoredProcName:='PKGCRSALDOS.STPAUTOORDEN';
          Params.Clear;
          Params.CreateParam(ftInteger,'PEIDTRNBLQ',ptInput);
          Params.CreateParam(ftString,'PECVEUSUAUTO',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('PEIDTRNBLQ').AsString := pIdTransac;
          ParamByName('PECVEUSUAUTO').AsString := Objeto.Apli.Usuario;
          ParamByName('PEBCOMMIT').AsString := CVERDAD;
          ExecProc;

          if ParamByName('PSResultado').AsInteger <> 0 then
          Begin
             vlMsgErr := 'Error [ ' + ParamByName('psRESULTADO').AsString + '] ' +
                         ParamByName('psTxResultado').AsString;
             ShowMessage(vlMsgErr);
             AddLine(MErrores,vlMsgErr);
             vlResult := False;
          end;
          UnPrepare;
       end;
    finally
       StpAutorizaOrden.Free;
    end;
    AutorizaOrden := vlResult;
end;

{---------------------------------------------------------------------------------------
                        Cancela Orden de Liquidación
----------------------------------------------------------------------------------------}
function TWCrBlqDblq.CancelaOrden( pIdTransac : String ): Boolean;
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
          StpCancelaOrden.StoredProcName:='PKGCRSALDOS.STPCANCORDEN';

          Params.Clear;
          Params.CreateParam(ftInteger,'PEIDTRNBLQ',ptInput);
          Params.CreateParam(ftString,'PECVEUSUCANC',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('PEIDTRNBLQ').AsString := pIdTransac;
          ParamByName('PECVEUSUCANC').AsString := Objeto.Apli.Usuario;
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
----------------------------------------------------------------------------------------}
function TWCrBlqDblq.CadenaSql: String;
var vlSql     : String;
begin
   Objeto.F_OPER_INI.GetFromControl;
   Objeto.F_OPER_FIN.GetFromControl;

   vlSql  := ' SELECT  '' '' AUT_CAN,' + coCRLF +
             '         CB.ID_TRN_BLOQUEO,' + coCRLF +
             '         CB.ID_CREDITO,' + coCRLF +
             '         CB.CVE_TIP_OPERACION,' + coCRLF +
             '         CB.F_OPERACION,' + coCRLF +
             '         CB.CUENTA_BANCO,' + coCRLF +
             '         CTO.ID_EMPRESA,' + coCRLF +
             '         P.NOMBRE,' + coCRLF +
             '         CB.F_PROG_DESBLQ,' + coCRLF +
             '         CB.IMP_A_BLOQUEAR IMPORTE,' + coCRLF +
             '         PKGCRSALDOS.StpObtTipSdoCtaDV(CB.CUENTA_BANCO,1) SDO_TOTAL,' + coCRLF +
             '         DECODE(CB.CVE_TIP_OPERACION,''BL'',CB.IMP_A_BLOQUEAR,' + coCRLF +
             '                                     ''DB'',DECODE(CB.SIT_BLQ_RECEP,''AU'',0,'+ coCRLF +
             '                                                                    ''CA'',0,CB.IMP_A_BLOQUEAR)) SDO_COMP,' + coCRLF +
             '         PKGCRSALDOS.StpObtTipSdoCtaDV(CB.CUENTA_BANCO,1) -  '+ coCRLF +
             '         DECODE(CB.CVE_TIP_OPERACION,''BL'',CB.IMP_A_BLOQUEAR,' + coCRLF +
             '                                     ''DB'',DECODE(CB.SIT_BLQ_RECEP,''AU'',0,'+ coCRLF +
             '                                                                    ''CA'',0,CB.IMP_A_BLOQUEAR)) SDO_DISP,' + coCRLF +
             '         CB.SIT_BLQ_RECEP,' + coCRLF +
             '         CTO.ID_TITULAR  ID_TITULAR,' + coCRLF +
             '         '' ''           SIT_EXT' + coCRLF +
             ' FROM CR_BLQ_RECEP CB, CONTRATO CTO, PERSONA P ' + coCRLF +
             ' WHERE P.ID_PERSONA = CTO.ID_TITULAR AND CB.F_OPERACION BETWEEN ' + SQLFecha(Objeto.F_OPER_INI.AsDateTime) + coCRLF +
             '                      AND ' + SQLFecha(Objeto.F_OPER_FIN.AsDateTime) + coCRLF ;

             if cbDISPOSICION.Checked then
                vlSql := vlSql + ' AND CB.ID_CREDITO = ' + Objeto.Disposicion.ID_CREDITO.AsString + coCRLF;
             //end if;
             if cbACREDITADO.Checked then
                vlSql := vlSql + ' AND CTO.ID_TITULAR = ' + Objeto.Acreditado.ID_ACREDITADO.AsString + coCRLF;
             //end if;
             if cbCUENTA_BANCO.Checked then
                vlSql := vlSql + ' AND CB.CUENTA_BANCO = ' + Objeto.Contrato.ID_CONTRATO.AsString + coCRLF;
             //end if;

             if rgSITUACION.ItemIndex <> 3 then Begin
                if rgSITUACION.ItemIndex = 0 then
                   vlSql := vlSql + ' AND CB.SIT_BLQ_RECEP = ' + SQLStr(CSIT_NA) + coCRLF
                else if rgSITUACION.ItemIndex = 1 then
                   vlSql := vlSql + ' AND CB.SIT_BLQ_RECEP IN ( ' + SQLStr(CSIT_AU) + ',' + SQLStr(CSIT_RA) + ' )' + coCRLF
                else if rgSITUACION.ItemIndex = 2 then
                   vlSql := vlSql + ' AND CB.SIT_BLQ_RECEP = ' + SQLStr(CSIT_CA) + coCRLF;
             end;

             if rgTIPO_OPERAC.ItemIndex = 0 then
                vlSql := vlSql + ' AND CB.CVE_TIP_OPERACION = ' + SQLStr('BL') + coCRLF
             else if rgTIPO_OPERAC.ItemIndex = 1 then
                vlSql := vlSql + ' AND CB.CVE_TIP_OPERACION = ' + SQLStr('DB') + coCRLF;

             vlSql := vlSql + '    AND CB.CUENTA_BANCO = CTO.ID_CONTRATO ' + coCRLF;

             vlSql := vlSql + ' ORDER BY CB.F_OPERACION ' + coCRLF;

   CadenaSql := vlSql;
end;

procedure TWCrBlqDblq.MuestraDatos;
var vlQry : TQuery;
    vlsql : String;
begin
     vlQry := GetSQLQuery(CadenaSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

     try
        if vlQry <> nil then
        Begin
        //Datos que no se muestran
            vlQry.FieldByName('ID_TRN_BLOQUEO').Visible := False;
            vlQry.FieldByName('ID_TITULAR').Visible := False;
            vlQry.FieldByName('ID_EMPRESA').Visible := False;
            vlQry.FieldByName('NOMBRE').Visible := False;

            vlQry.FieldByName('AUT_CAN').DisplayWidth := 3;
            vlQry.FieldByName('ID_CREDITO').DisplayWidth := 9;
            vlQry.FieldByName('CVE_TIP_OPERACION').DisplayWidth := 10;
            vlQry.FieldByName('F_OPERACION').DisplayWidth := 12;
            vlQry.FieldByName('CUENTA_BANCO').DisplayWidth := 12;
            vlQry.FieldByName('F_PROG_DESBLQ').DisplayWidth := 12;
            vlQry.FieldByName('IMPORTE').DisplayWidth := 14;
            vlQry.FieldByName('SDO_DISP').DisplayWidth := 14;
            vlQry.FieldByName('SDO_COMP').DisplayWidth := 14;
            vlQry.FieldByName('SDO_TOTAL').DisplayWidth := 14;
            vlQry.FieldByName('SIT_BLQ_RECEP').DisplayWidth := 3;
            vlQry.FieldByName('SIT_EXT').DisplayWidth := 3;

            TNumericField(vlQry.FieldByName('IMPORTE')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('SDO_DISP')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('SDO_COMP')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('SDO_TOTAL')).DisplayFormat := '###,###,###,###,###,###,##0.00';

            sgcDATOS.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY
            sgcDATOS.ColumnByName('AUT_CAN').IsCheck := True;//DEFINIR EL CAMPO AUT DEL QUERY COMO CHECKBOX

            Botones; //Habilita o deshabilita botones segun la situación
        end
        else
        Begin
            btAUTORIZA.Enabled := False;
            btCANCELA.Enabled := False;
            pmMODIFICA.Items.Enabled := False;
            sgcDATOS.Clear('NO EXISTEN DATOS'#30'>C');
        end;
     finally
       if vlQry <> nil then
          vlQry.free;
       //end if
     end;
end;

procedure TWCrBlqDblq.FormShow(Sender: TObject);
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
       SITUACION.Control := rgSITUACION;
       F_OPER_INI.Control := edF_OPER_INIC;
       F_OPER_FIN.Control := edF_OPER_FIN;

       Disposicion.ID_CREDITO.Control := edDISPOSICION;
       Disposicion.ContratoCre.Acreditado.Persona.Nombre.Control := edNOM_CREDITO;
       Disposicion.GetParams(Objeto);
       edNOM_CREDITO.Hint := Disposicion.ContratoCre.Acreditado.Persona.Nombre.AsString;
       edNOM_CREDITO.ShowHint := True;

       Acreditado.ID_ACREDITADO.Control := edACREDITADO;
       Acreditado.Persona.Nombre.Control := edNOM_ACREDITADO;
       Acreditado.GetParams(Objeto);
       edNOM_ACREDITADO.Hint := Acreditado.Persona.Nombre.AsString;
       edNOM_ACREDITADO.ShowHint := True;

       Contrato.ID_CONTRATO.Control := edCUENTA_BANCO;
       Contrato.TITNombre.Control := edTITULAR;
       Contrato.GetParams(Objeto);
       edTITULAR.Hint := Contrato.TITNombre.AsString;
       edTITULAR.ShowHint := True;
    end;
end;

procedure TWCrBlqDblq.FormDestroy(Sender: TObject);
begin
    with Objeto do
    Begin
       Disposicion.ID_CREDITO.Control := nil;
       Disposicion.ContratoCre.Acreditado.Persona.Nombre.Control := nil;
       Acreditado.ID_ACREDITADO.Control := nil;
       Acreditado.Persona.Nombre.Control := nil;
       Contrato.ID_CONTRATO.Control := nil;
       Contrato.TITNombre.Control := nil;

       B_APL_DISP.Control := nil;
       B_APL_ACRE.Control := nil;
       SITUACION.Control := nil;
       F_OPER_INI.Control := nil;
       F_OPER_FIN.Control := nil;

    end;
end;

procedure TWCrBlqDblq.Botones;
begin
   if rgSITUACION.ItemIndex = 0 then
   Begin
      btAUTORIZA.Enabled := True;
      btCANCELA.Enabled := True;
      pmMODIFICA.Items.Enabled := True;
   end
   else if rgSITUACION.ItemIndex = 1 then
   Begin
      btAUTORIZA.Enabled := False;
      btCANCELA.Enabled := True;
      pmMODIFICA.Items.Enabled := False;
   end
   else if rgSITUACION.ItemIndex = 2 then
   Begin
      btAUTORIZA.Enabled := False;
      btCANCELA.Enabled := False;
      pmMODIFICA.Items.Enabled := False;
   end;
end;

procedure TWCrBlqDblq.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrBlqDblq.btDISPOCISIONClick(Sender: TObject);
begin
   Objeto.Disposicion.ShowAll := True;
   if Objeto.Disposicion.Busca then
   Begin
      cbDISPOSICION.Enabled := True;
      cbDISPOSICION.Checked := True;
      InterForma1.NextTab(edDISPOSICION);
      MuestraDatos;
   end;
end;

procedure TWCrBlqDblq.ilDISPOSICIONEjecuta(Sender: TObject);
begin
   if Objeto.Disposicion.FindKey([ilDISPOSICION.Buffer]) then
   Begin
      cbDISPOSICION.Enabled := True;
      cbDISPOSICION.Checked := True;
      InterForma1.NextTab(edDISPOSICION);
      MuestraDatos;
   end;
end;

procedure TWCrBlqDblq.cbDISPOSICIONClick(Sender: TObject);
begin
    if not(cbDISPOSICION.Checked) then
       Objeto.Disposicion.Active := False;
    //end if

    if not(Objeto.Disposicion.Active) then
       cbDISPOSICION.Checked := False;
    //end if
    MuestraDatos;
end;

procedure TWCrBlqDblq.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   if Objeto.Acreditado.Busca then
   Begin
      cbACREDITADO.Enabled := True;
      cbACREDITADO.Checked := True;
      InterForma1.NextTab(edACREDITADO);
      MuestraDatos;
   end;
end;

procedure TWCrBlqDblq.cbACREDITADOClick(Sender: TObject);
begin
    if not(cbACREDITADO.Checked) then
       Objeto.Acreditado.Active := False;
    //end if

   if not(Objeto.Acreditado.Active) then
       cbACREDITADO.Checked := False;
    //end if
    MuestraDatos;
end;

procedure TWCrBlqDblq.rgSITUACIONClick(Sender: TObject);
begin
   MuestraDatos;
end;

procedure TWCrBlqDblq.InterForma1DespuesShow(Sender: TObject);
begin
   dtF_OPER_INIC.DateTime:= Objeto.Apli.DameFechaEmpresa;
   edF_OPER_INIC.text:=FormatDateTime('dd/mm/yyyy',dtF_OPER_INIC.DateTime);
   dtF_OPER_FIN.DateTime:= Objeto.Apli.DameFechaEmpresa;
   edF_OPER_FIN.text:=FormatDateTime('dd/mm/yyyy',dtF_OPER_FIN.DateTime);
   if Objeto.Disposicion.ID_CREDITO.AsString <> '' then
   Begin
      cbDISPOSICION.Enabled := True;
      cbDISPOSICION.Checked := True;
   end;
     rgSITUACION.ItemIndex := 0;
end;

procedure TWCrBlqDblq.selecciona(sColum: string; nColum : Integer);
Begin
   if sgcDATOS.CellStr[sColum,nColum] = 'SI' + #30 + '>C' then
      sgcDATOS.CellStr[sColum,nColum]:= ''
   else
      sgcDATOS.CellStr[sColum,nColum]:= 'SI' + #30 + '>C';
end;

procedure TWCrBlqDblq.sgcDATOSCalcRow(Sendet: TObject; DataSet: TDataSet;
  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
var vlGpoPago : String;
    vlCompara : Boolean;
    vlCadTotGpo : String;
begin
  {Inicializa las variable de total }
   {COLOR A LAS SITUACIONES}
    //Si es CANCELADO lo pone de color rojo
    if ((DataSet.FieldByName('SIT_BLQ_RECEP').AsString = CSIT_CA) OR (DataSet.FieldByName('SIT_EXT').AsString = CSIT_CA)) then
       sgcDATOS.SetFontColor(CRED)
    //Si es AUTORIZADO lo pone de color verde
    else if DataSet.FieldByName('SIT_BLQ_RECEP').AsString = CSIT_AU then
       sgcDATOS.SetFontColor(CGREEN)
        //Si es NO AUTORIZADO LO PONE COLOR NEGRO
    else if DataSet.FieldByName('SIT_BLQ_RECEP').AsString = CSIT_NA then
       sgcDATOS.SetFontColor(clBlack);

    //PARA SPEUA
    if (DataSet.FieldByName('SIT_EXT').AsString = 'RE') then
       sgcDATOS.SetFontColor(CRED);
    //END IF;
end;

procedure TWCrBlqDblq.btAUTORIZAClick(Sender: TObject);
var nCount      : Integer;
    nRow        : Integer;
begin
   nCount := CountSelec(sgcDatos,'AUT_CAN');
   nRow := sgcDATOS.SG.Row;
   MErrores.Clear;
   if (  sgcDATOS.CellStr['SIT_BLQ_RECEP',nRow] = CSIT_NA  )then
   Begin
     if nCount > 0 then
     Begin
        if MessageDlg('¿Está seguro de Autorizar  ' + IntToStr(nCount) + ', registro (s) ?',
                       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Begin
            messageIniFinProceso(MErrores,CINICIO);
            For nRow := 0 To sgcDATOS.SG.RowCount - 1 Do
            Begin
               if (sgcDATOS.CellStr['AUT_CAN',nRow] = 'SI' + #30 + '>C') then
                  Begin
                     if AutorizaOrden(sgcDATOS.CellStr['ID_TRN_BLOQUEO',nRow] ) then Begin
                        ShowMessage('Se autorizado la operación ' + sgcDATOS.CellStr['ID_TRN_BLOQUEO',nRow]);
                        AddLine(MErrores,'Se autorizado la operación ' + sgcDATOS.CellStr['ID_TRN_BLOQUEO',nRow]);
                     end;
                  end;
            end;
            messageIniFinProceso(MErrores,CFINAL);
        end;
     end
     else ShowMessage('Favor de seleccionar el o los registros a autorizar');
   end
   else ShowMessage('No puede seleccionar registros para autorizar');
   MuestraDatos;
end;

procedure TWCrBlqDblq.btCANCELAClick(Sender: TObject);
var nCount      : Integer;
    nRow        : Integer;
begin
   nCount := CountSelec(sgcDatos,'AUT_CAN');
   nRow := sgcDATOS.SG.Row;
   MErrores.Clear;
//   if ( sgcDATOS.CellStr['SIT_BLQ_RECEP',nRow] = CSIT_NA ) then
//   Begin
     if nCount > 0 then
     Begin
        if MessageDlg('¿Está seguro de cancelar  ' + IntToStr(nCount) + ', registro (s) ?',
                       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Begin
            messageIniFinProceso(MErrores,CINICIO);
            For nRow := 0 To sgcDATOS.SG.RowCount - 1 Do
            Begin
                 if (sgcDATOS.CellStr['AUT_CAN',nRow] = 'SI' + #30 + '>C') then
                 Begin
                    if CancelaOrden(sgcDATOS.CellStr['ID_TRN_BLOQUEO',nRow]) then Begin
                       ShowMessage('Se cancelado la operación ' + sgcDATOS.CellStr['ID_TRN_BLOQUEO',nRow]);
                       AddLine(MErrores,'Se cancelado la operación ' + sgcDATOS.CellStr['ID_TRN_BLOQUEO',nRow]);
                    end
                    else
                       ShowMessage(' No se ha podido cancelar la operación ');
                    //end if
                 end;
            end;
            messageIniFinProceso(MErrores,CFINAL);
        end;
     end
     else ShowMessage('Favor de seleccionar el o los registros a cancelar');
     MuestraDatos;
//   end
//   else ShowMessage('No puede seleccionar registros para cancelar');
end;



procedure TWCrBlqDblq.ConsultaDisposicin1Click(Sender: TObject);
var  Credito : TCrCredito;
     vlIdCredito : String;
begin
   vlIdCredito := sgcDATOS.CellStr['ID_CREDITO',sgcDATOS.SG.Row];
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

//Llama a la clase de Depositos a la vista
procedure TWCrBlqDblq.ConsultaDepsitosalaVista1Click(Sender: TObject);
var   vlCheqra         : String;
begin
     vlCheqra := trim(sgcDATOS.CellStr['CUENTA_BANCO',sgcDATOS.SG.Row]);
     if ( vlCheqra <> '' ) and ( Objeto.Contrato.FindKey( [ vlCheqra ] )  ) then
     begin
        Objeto.ConTransa.Contrato := Objeto.Contrato;
        Objeto.ConTransa.Catalogo;
     end;
end;

procedure TWCrBlqDblq.ilACREDITADOEjecuta(Sender: TObject);
begin
   if Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) then
   Begin
      cbACREDITADO.Enabled := True;
      cbACREDITADO.Checked := True;
      InterForma1.NextTab(edACREDITADO);
      MuestraDatos;
   end;
end;

procedure TWCrBlqDblq.CapturaOrden;
var  Captura : TCrBlqRece;
     vlIdCredito : String;
begin
   vlIdCredito := sgcDATOS.CellStr['DISPOSICION',sgcDATOS.SG.Row];
   Captura := TCrBlqRece.Create(self);
   Try
      Captura.Apli:=Objeto.Apli;
      Captura.ParamCre:=Objeto.ParamCre;
      Captura.Catalogo;
   finally
      Captura.Free;
   end;
end;

procedure TWCrBlqDblq.InsertarNuevaOrdenLiquidacin1Click(Sender: TObject);
begin
   CapturaOrden;
end;

procedure TWCrBlqDblq.btCUENTAClick(Sender: TObject);
begin
   Objeto.Contrato.ShowAll := True;
   if Objeto.Contrato.Busca then
   Begin
      cbCUENTA_BANCO.Enabled := True;
      cbCUENTA_BANCO.Checked := True;
      InterForma1.NextTab(edCUENTA_BANCO);
      MuestraDatos;
   end;
end;

procedure TWCrBlqDblq.ilCUENTA_BANCOEjecuta(Sender: TObject);
begin
   if Objeto.Contrato.FindKey([ilCUENTA_BANCO.Buffer]) then
   Begin
      cbCUENTA_BANCO.Enabled := True;
      cbCUENTA_BANCO.Checked := True;
      InterForma1.NextTab(edCUENTA_BANCO);
      MuestraDatos;
   end;
end;

procedure TWCrBlqDblq.BitBtn1Click(Sender: TObject);
begin
   CapturaOrden;
   MuestraDatos;
end;

procedure TWCrBlqDblq.sgcDATOSDblClick(Sender: TObject);
var y : Integer;
begin
  with Objeto, sgcDATOS do
  Begin
      Y := SG.Row;
      selecciona('AUT_CAN',Y);
  end;
end;

procedure TWCrBlqDblq.btBUSCAClick(Sender: TObject);
begin
   MuestraDatos;
end;

procedure TWCrBlqDblq.cbCUENTA_BANCOClick(Sender: TObject);
begin
    if not(cbCUENTA_BANCO.Checked) then
       Objeto.Contrato.Active := False;
    //end if

    if not(Objeto.Contrato.Active) then
       cbCUENTA_BANCO.Checked := False;
    //end if
    MuestraDatos;
end;

procedure TWCrBlqDblq.ConsultaDisposicinChequera1Click(Sender: TObject);
var   RelDisChqra : TCrReCrCh;
begin
   RelDisChqra := TCrReCrCh.Create(self);
   Try
      RelDisChqra.Apli:=Objeto.Apli;
      RelDisChqra.ParamCre:=Objeto.ParamCre;
      RelDisChqra.vgIdCredito:= sgcDATOS.CellStr['ID_CREDITO',sgcDATOS.SG.Row];
      RelDisChqra.vgBanco := sgcDATOS.CellStr['ID_EMPRESA',sgcDATOS.SG.Row];
      RelDisChqra.vgCtaBanco:= sgcDATOS.CellStr['CUENTA_BANCO',sgcDATOS.SG.Row];
      RelDisChqra.vgNomTitular := sgcDATOS.CellStr['NOMBRE',sgcDATOS.SG.Row];
      Objeto.BasicCred.LlenaDatos(StrToInt(sgcDATOS.CellStr['ID_CREDITO',sgcDATOS.SG.Row]));
      RelDisChqra.BasicCred := Objeto.BasicCred;
      RelDisChqra.BuscaWhereString := ' CR_REL_CRED_CHEQ.ID_CREDITO = ' + sgcDATOS.CellStr['ID_CREDITO',sgcDATOS.SG.Row];
      RelDisChqra.FilterString := RelDisChqra.BuscaWhereString;
      RelDisChqra.Catalogo;
   finally
      RelDisChqra.Free;
      MuestraDatos;
   end;
end;

end.

{
SELECT * FROM MIFAS_REL_CC_SC_ASEG 
WHERE CVE_MONEDA = 484

SELECT ID_CEN_COSTO_SC,
       CVE_MONEDA, 
	   ID_CENT_COSTO,
	   ID_CEN_COST_H
 FROM MIFAS_REL_CC_SC_ASEG 
WHERE CVE_MONEDA = 840 
ORDER BY 1,3

select * from cg_plaza_centro
where id_empresa = 8
and cve_moneda = 484 
and id_cen_cost_h = '13110141'

select * from cg_plaza
where id_empresa = 8
and cve_moneda = 484 
and id_cent_costo = '13100110'

select * from cg_centro_costo 
where id_empresa = 8
and cve_moneda = 484
and cve_ejer_cont = 2008   
and id_cent_costo in ( 
'13100113',
'13120761',
'13140141',
'13210612',
'13210711',
'13220111',
'13500113',-- ???? 
'13500471',
'13500472',
'13500521',
'13500531',
'13510112',
'13990211')
order by 4
  
select distinct (id_cent_costo_a) 
from cg_centro_costo 
where id_empresa = 8
and cve_moneda = 484
and cve_ejer_cont = 2008   
and id_cent_costo in ( 
'13100113',
'13120761',
'13140141',
'13210612',
'13210711',
'13220111',
'13500113',-- ???? 
'13500471',
'13500472',
'13500521',
'13500531',
'13510112',
'13990211')




select * from cg_plaza
where id_empresa = 8
and cve_moneda = 484 
and id_cent_costo in (
select distinct (id_cent_costo_a) 
from cg_centro_costo 
where id_empresa = 8
and cve_moneda = 484
and cve_ejer_cont = 2008   
and id_cent_costo in ( 
'13100113',
'13120761',
'13140141',
'13210612',
'13210711',
'13220111',
'13500113',-- ???? 
'13500471',
'13500472',
'13500521',
'13500531',
'13510112',
'13990211')
)


lllllllllllllllllllllllllllllll


select id_cent_costo_a,id_cent_costo 
from cg_centro_costo 
where id_empresa = 8
and cve_moneda = 484
and cve_ejer_cont = 2008   
and id_cent_costo in ( 
'13030111',
'13100111',
'13100112',
--'.',
'13100121',
'13110111',
'13110112',
'13110121',
'13110131',
'13110141',
'13110151',
'13110181',
'13110211',
'13120111',
'13120121',
'13120131',
'13120141',
'13120151',
'13120152',
'13120153',
'13120154',
'13120161',
'13120171',
'13120172',
'13120181',
'13120182',
'13120183',
'13120184',
'13120185',
'13120191',
'13120211',
'13120221',
'13120231',
'13120241',
'13120251',
'13120252',
'13120253',
'13120261',
'13120271',
'13120272',
'13120273',
'13120274',
'13120275',
'13120281',
'13120291',
'13120311',
'13120321',
'13120331',
'13120341',
'13120391',
'13120411',
'13120421',
'13120431',
'13120441',
'13120491',
'13120511',
'13120521',
'13120531',
'13120541',
'13120591',
'13120611',
'13120621',
'13120631',
'13120641',
'13120651',
'13120652',
'13120653',
'13120654',
'13120655',
'13120691',
'13120711',
'13120721',
'13120731',
'13120741',
'13120751',
--'.',
'13120791',
'13120792',
'13120831',
'13120891',
'13130111',
'13130112',
'13130211',
'13130212',
'13130221',
'13130231',
'13130232',
'13130241',
'13130242',
'13130251',
'13130261',
'13130271',
'13130281',
'13130291',
'13130292',
'13130311',
'13130312',
'13130321',
'13130331',
'13130341',
'13130342',
'13130343',
'13130351',
'13130361',
'13130371',
'13130411',
'13130421',
'13130431',
'13140111',
'13140112',
'13140121',
'13140131',
--'.',
'13140211',
'13140221',
'13140231',
'13140241',
'13140311',
'13140321',
'13140331',
'13140341',
'13160111',
'13160112',
'13160131',
'13200111',
'13210111',
'13210121',
'13210122',
'13210123',
'13210124',
'13210125',
'13210211',
'13210221',
'13210231',
'13210241',
'13210301',
'13210311',
'13210321',
'13210411',
'13210511',
'13210512',
'13210611',
--'.',
--'.',
--'.',
'13500111',
--'.',
'13500121',
'13500131',
'13500141',
'13500151',
'13500161',
'13500211',
'13500221',
'13500222',
'13500223',
'13500224',
'13500225',
'13500231',
'13500232',
'13500233',
'13500411',
'13500421',
'13500431',
'13500441',
'13500451',
'13500461',
--'.',
--'.',
'13500511',
--'.',
--'.',
'13500611',
'13500621',
'13500811',
'13500821',
'13500831',
'13500911',
'13510111',
--'.',
'13510121',
'13510131',
'13510141',
'13510151',
'13510161',
'13510171',
'13510181',
'13520111',
'13530111',
'13990111')
order by 2
}


