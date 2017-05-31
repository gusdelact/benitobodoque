// Sistema         : Clase de CRCAMOCOM
// Fecha de Inicio : 21/01/2005
// Función forma   : Clase de CRCAMOCOM
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrCaMoCom;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntSGCtrl, Grids,
Aligrid, Menus,
//unidades adicionales
IntParamCre,IntCrCredito, IntCrComPro, IntLinkit, IntBasicCred, IntGenCre,  IntCrCatComi;
Const
   C_PER = 0;
   C_COM = 1;
Type
 TCrCaMoCom= class; 

  TWCrCaMoCom=Class(TForm)
    InterForma1             : TInterForma;
    btAGREGA_CUOTA: TBitBtn;
    btCANCELA: TBitBtn;
    edIMP_COMISION: TInterEdit;
    lbIMP_COMISION: TLabel;
    dtpF_VENCIMIENTO: TInterDateTimePicker;
    edF_VENCIMIENTO: TEdit;
    lbF_VENCIMIENTO: TLabel;
    Label2: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label30: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    MErrores: TMemo;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lbID_CREDITO: TLabel;
    edID_CREDITO: TEdit;
    btCREDITO: TBitBtn;
    edDESC_CREDITO: TEdit;
    sgcDATOS: TSGCtrl;
    ilCREDITO: TInterLinkit;
    lbIVA: TLabel;
    edIMP_IVA: TInterEdit;
    PopupMenu1: TPopupMenu;
    AgregarPerComis: TMenuItem;
    N1: TMenuItem;
    ModificaFecha: TMenuItem;
    ModificaImporte: TMenuItem;
    N2: TMenuItem;
    CancelaPeriodo: TMenuItem;
    CancelaComision: TMenuItem;
    CancelaProgComis: TMenuItem;
    N3: TMenuItem;
    ActivarPeriodo1: TMenuItem;
    ActivarComisin1: TMenuItem;
    lbCVE_COMISION: TLabel;
    edCVE_COMISION: TEdit;
    btCOMISION: TBitBtn;
    ilCOMISION: TInterLinkit;
    edDESC_COMISION: TEdit;
    lbPremio: TLabel; // RABA FEB 2012 PPP
    edIMP_COMIS_PREM: TInterEdit; // RABA FEB 2012 PPP
    Label8: TLabel; // RABA FEB 2012 PPP
    cbBloqSdoCh: TCheckBox; // RABA FEB 2012 PPP
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btCREDITOClick(Sender: TObject);
    procedure ilCREDITOEjecuta(Sender: TObject);
    procedure ModificaFechaClick(Sender: TObject);
    procedure ModificaImporteClick(Sender: TObject);
    procedure btCANCELAClick(Sender: TObject);
    procedure btAGREGA_CUOTAClick(Sender: TObject);
    procedure CancelaPeriodoClick(Sender: TObject);
    procedure CancelaComisionClick(Sender: TObject);
    procedure AgregarPerComisClick(Sender: TObject);
    procedure edIMP_COMISIONExit(Sender: TObject);
    procedure CancelaProgComisClick(Sender: TObject);
    procedure ActivarPeriodo1Click(Sender: TObject);
    procedure ActivarComisin1Click(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure btCOMISIONClick(Sender: TObject);
    procedure ilCOMISIONEjecuta(Sender: TObject);
    procedure sgcDATOSCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure edIMP_COMIS_PREMExit(Sender: TObject); // RABA FEB 2012 PPP
    procedure edF_VENCIMIENTOExit(Sender: TObject); // RABA FEB 2012 PPP
    procedure dtpF_VENCIMIENTOExit(Sender: TObject); // RABA FEB 2012 PPP
    private
    { Private declarations }
           vgMovto   : Integer;
           Procedure LlenaGrid;
           Function  AgregaPerComis(pIdCredito: Integer ): Boolean;
           Function  EliminaPerComis(pIdCredito, pNumPeriodo: Integer): Boolean;
           Function  ModifPerComis( pIdCredito, pNumPeriodo: Integer): Boolean;
           Function  CancelaPerComis(pMetodo, pIdCredito, pNumPeriodo: Integer): Boolean;
           Function  ActivaPerComis(pMetodo, pIdCredito, pNumPeriodo: Integer; pCveComis: String): Boolean;
           Procedure ValidaUsuario;
    public
    { Public declarations }
    Objeto : TCrCaMoCom;
end;

 TCrCaMoCom= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_COMISION             : TInterCampo;
        F_VENCIMIENTO            : TInterCampo;
        IMP_COMISION             : TInterCampo;
        IMP_IVA_COMISION         : TInterCampo;
        IMP_COMIS_PREM           : TInterCampo; // RABA FEB 2012 PPP

        ParamCre                 : TParamCre;
        Credito                  : TCrCredito;
        Comisiones               : TCrCatComi;
        BasicCred                : TBasicCred;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrCaMoCom.Create( AOwner : TComponent );
begin Inherited;
      CVE_COMISION:=CreaCampo('CVE_COMISION',ftString,tsNinguno,tsNinguno,False);
      F_VENCIMIENTO:=CreaCampo('F_VENCIMIENTO',ftDate,tsNinguno,tsNinguno,False);
      IMP_COMISION :=CreaCampo('IMP_COMISION',ftFloat,tsNinguno,tsNinguno,False);
      IMP_IVA_COMISION:=CreaCampo('IMP_IVA_COMISION',ftFloat,tsNinguno,tsNinguno,False);
      IMP_COMIS_PREM:=CreaCampo('IMP_COMIS_PREM', ftFloat,tsNinguno,tsNinguno,False); // RABA FEB 2012 PPP

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrCaMoCom.Hlp';
      ShowMenuReporte:=True;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.BuscaWhereString := 'CR_CREDITO.SIT_CREDITO NOT IN ( ''LQ'',''CA'')';
      Credito.FilterString := Credito.BuscaWhereString;

      Comisiones := TCrCatComi.Create(Self);
      Comisiones.MasterSource := self;
      Comisiones.BuscaWhereString := 'CR_CAT_COMISION.CVE_TIPO_COM = ''PE''';
      Comisiones.FilterString := Comisiones.BuscaWhereString;

      BasicCred := TBasicCred.Create(Self);
      BasicCred.MasterSource := Self;
end;

Destructor TCrCaMoCom.Destroy;
begin
    If Credito <> nil then
       Credito.free;
    //end if;
    if Comisiones <> nil then
       Comisiones.Free;
    //end if
   If BasicCred <> Nil Then
      BasicCred.Free;
   //end if
    inherited;
end;


function TCrCaMoCom.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCaMoCom;
begin
   W:=TWCrCaMoCom.Create(Self);
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


(***********************************************FORMA CRCAMOCOM********************)
(*                                                                              *)
(*  FORMA DE CRCAMOCOM                                                            *)
(*                                                                              *)
(***********************************************FORMA CRCAMOCOM********************)
function TWCrCaMoCom.AgregaPerComis(pIdCredito: Integer ): Boolean;
var StpAddPerCom :  TStoredProc;
    vlResult : Boolean;
begin
    Objeto.CVE_COMISION.GetFromControl;
    Objeto.F_VENCIMIENTO.GetFromControl;
    Objeto.IMP_COMISION.GetFromControl;
    Objeto.IMP_IVA_COMISION.GetFromControl;
    Objeto.IMP_COMIS_PREM.GetFromControl; // RABA FEB 2012 PPP
    vlResult := True;
    // LOLS 30 ENE 2007. Valida que la comision exista en cr_comis_prog
    valComisProg( pIdCredito, Objeto.CVE_COMISION.AsString, Objeto.Apli );
    //
    StpAddPerCom := TStoredProc.Create(Self);
    try
       with StpAddPerCom do
       begin
          StpAddPerCom.DatabaseName:= Objeto.Apli.DatabaseName;
          StpAddPerCom.SessionName:= Objeto.Apli.SessionName;
          StpAddPerCom.StoredProcName:='PKGCRCOMISIONES.STPAGREGAPERCOMIS';

          Params.Clear;
          Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
          Params.CreateParam(ftString,'PECVECOMISION',ptInput);
          Params.CreateParam(ftDateTime,'PEFVENCIMIENTO',ptInput);
          Params.CreateParam(ftFloat,'PEIMPCOMISION',ptInput);
          Params.CreateParam(ftFloat,'PEIMPIVA',ptInput);
          Params.CreateParam(ftString,'PECVEUSUALTA',ptInput);
          // RABA FEB 2012 PPP
          Params.CreateParam(ftFloat,'PEIMPCOMISPREM',ptInput);
          Params.CreateParam(ftString,'PEBBLOQSALDO',ptInput);
          // FIN RABA
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('peIdCredito').AsInteger := pIdcredito;
          ParamByName('peCveComision').AsString := Objeto.CVE_COMISION.AsString;
          ParamByName('peFVencimiento').AsDateTime := objeto.F_VENCIMIENTO.AsDateTime;
          ParamByName('peImpComision').AsFloat := objeto.IMP_COMISION.AsFloat;
          ParamByName('peImpIVA').AsFloat := Objeto.IMP_IVA_COMISION.AsFloat;
          ParamByName('peCveUsuAlta').AsString := Objeto.Apli.Usuario;
          // RABA FEB 2012 PPP
          ParamByName('peImpComisPrem').AsFloat := Objeto.IMP_COMIS_PREM.AsFloat;
          if cbBloqSdoCh.Checked then
             ParamByName('peBBloqSaldo').AsString := 'V'
          else
             ParamByName('peBBloqSaldo').AsString := 'F';
          // FIN RABA
          ParamByName('peBCommit').AsString := CVERDAD;
          ExecProc;

          if ParamByName('psResultado').AsInteger <> 0 then
          Begin
             AddLine( MErrores, ParamByName('psRESULTADO'  ).AsString +
                                ParamByName('psTxResultado').AsString);
             vlResult := False;
          end;
       end;
    finally
       StpAddPerCom.Free;
    end;
    AgregaPerComis := vlResult;
end;

function TWCrCaMoCom.CancelaPerComis(pMetodo, pIdCredito, pNumPeriodo: Integer): Boolean;
var StpCanPerCom :  TStoredProc;
    vlResult : Boolean;
begin
    Objeto.CVE_COMISION.GetFromControl;
    vlResult := True;
    StpCanPerCom := TStoredProc.Create(Self);
    try
       with StpCanPerCom do
       begin
          StpCanPerCom.DatabaseName:= Objeto.Apli.DatabaseName;
          StpCanPerCom.SessionName:= Objeto.Apli.SessionName;
          StpCanPerCom.StoredProcName:='PKGCRCOMISIONES.STPCANCELACOMIS';

          Params.Clear;
          Params.CreateParam(ftFloat,'PEMETODO',ptInput);
          Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
          Params.CreateParam(ftString,'PECVECOMISION',ptInput);
          Params.CreateParam(ftFloat,'PENUMPERIODO',ptInput);
          Params.CreateParam(ftString,'PECVEUSUMOD',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('peMetodo').AsInteger := pMetodo;
          ParamByName('peIdCredito').AsInteger := pIdcredito;
          ParamByName('peCveComision').AsString := sgcDATOS.CellStr['CVE_COMISION',sgcDATOS.SG.Row];//Objeto.CVE_COMISION.AsString;
          ParamByName('peNumPeriodo').AsFloat := pNumPeriodo;
          ParamByName('peCveUsuMod').AsString := Objeto.Apli.Usuario;
          ParamByName('peBCommit').AsString := CVERDAD;

          ExecProc;

          if ParamByName('psResultado').AsInteger <> 0 then
          Begin
             AddLine( MErrores, ParamByName('psRESULTADO'  ).AsString +
                                ParamByName('psTxResultado').AsString);
             vlResult := False;
          end;
       end;
    finally
       StpCanPerCom.Free;
    end;
    CancelaPerComis := vlResult;
end;

function TWCrCaMoCom.EliminaPerComis(pIdCredito, pNumPeriodo: Integer): Boolean;
var StpDelPerCom :  TStoredProc;
    vlResult : Boolean;
begin
    vlResult := True;
    Objeto.CVE_COMISION.GetFromControl;
    StpDelPerCom := TStoredProc.Create(Self);
    try
       with StpDelPerCom do
       begin
          StpDelPerCom.DatabaseName:= Objeto.Apli.DatabaseName;
          StpDelPerCom.SessionName:= Objeto.Apli.SessionName;
          StpDelPerCom.StoredProcName:='PKGCRCOMISIONES.STPCANCELACOMIS';

          Params.Clear;
          Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
          Params.CreateParam(ftString,'PECVECOMISION',ptInput);
          Params.CreateParam(ftFloat,'PENUMPERIODO',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('peIdCredito').AsInteger := pIdcredito;
          ParamByName('peCveComision').AsString := Objeto.CVE_COMISION.AsString;
          ParamByName('peNumPeriodo').AsInteger := pNumPeriodo;
          ParamByName('peBCommit').AsString := CVERDAD;

          ExecProc;

          if ParamByName('psResultado').AsInteger <> 0 then
          Begin
             AddLine( MErrores, ParamByName('psRESULTADO'  ).AsString +
                                ParamByName('psTxResultado').AsString);
             vlResult := False;
          end;
       end;
    finally
       StpDelPerCom.Free;
    end;
    EliminaPerComis := vlResult;
end;

function TWCrCaMoCom.ModifPerComis(pIdCredito, pNumPeriodo: Integer): Boolean;
var StpUpdPerCom :  TStoredProc;
    vlResult : Boolean;
begin
    vlResult := True;
    Objeto.CVE_COMISION.GetFromControl;
    Objeto.F_VENCIMIENTO.GetFromControl;
    Objeto.IMP_COMISION.GetFromControl;
    Objeto.IMP_IVA_COMISION.GetFromControl;
    Objeto.IMP_COMIS_PREM.GetFromControl; // RABA FEB 2012 PPP

    StpUpdPerCom := TStoredProc.Create(Self);
    try
       with StpUpdPerCom do
       begin
          StpUpdPerCom.DatabaseName:= Objeto.Apli.DatabaseName;
          StpUpdPerCom.SessionName:= Objeto.Apli.SessionName;
          StpUpdPerCom.StoredProcName:='PKGCRCOMISIONES.STPMODIFICACOMIS';

          Params.Clear;
          Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
          Params.CreateParam(ftString,'PECVECOMISION',ptInput);
          Params.CreateParam(ftFloat,'PENUMPERIODO',ptInput);
          Params.CreateParam(ftDateTime,'PEFVENCIMIENTO',ptInput);
          Params.CreateParam(ftFloat,'PEIMPCOMISION',ptInput);
          Params.CreateParam(ftFloat,'PEIMPIVA',ptInput);
          Params.CreateParam(ftString,'PECVEUSUMOD',ptInput);
          // RABA FEB 2012 PPP
          Params.CreateParam(ftFloat,'PEIMPCOMISPREM',ptInput);
          Params.CreateParam(ftString,'PEBBLOQSALDO',ptInput);
          // FIN RABA
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('peIdCredito').AsInteger := pIdcredito;
          ParamByName('peCveComision').AsString := Objeto.CVE_COMISION.AsString;
          ParamByName('peNumPeriodo').AsInteger := pNumPeriodo;
          ParamByName('peFVencimiento').AsString := Objeto.F_VENCIMIENTO.AsString;
          ParamByName('peImpComision').AsFloat := Objeto.IMP_COMISION.AsFloat;
          ParamByName('peImpIVA').AsFloat := Objeto.IMP_IVA_COMISION.AsFloat;
          ParamByName('peCveUsuMod').AsString := Objeto.Apli.Usuario;
          // RABA FEB 2012 PPP
          ParamByName('peImpComisPrem').AsFloat := Objeto.IMP_COMIS_PREM.AsFloat;
          if cbBloqSdoCh.Checked then
             ParamByName('peBBloqSaldo').AsString := 'V'
          else
             ParamByName('peBBloqSaldo').AsString := 'F';
          // FIN RABA
          ParamByName('peBCommit').AsString := CVERDAD;
          ExecProc;

          if ParamByName('psResultado').AsInteger <> 0 then
          Begin
             AddLine( MErrores, ParamByName('psRESULTADO'  ).AsString +
                                ParamByName('psTxResultado').AsString);
             vlResult := False;
          end;
       end;
    finally
       StpUpdPerCom.Free;
    end;
    ModifPerComis := vlResult;
end;

procedure TWCrCaMoCom.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_COMISION.Control := edCVE_COMISION;
      Objeto.F_VENCIMIENTO.Control := edF_VENCIMIENTO;
      Objeto.IMP_COMISION.Control := edIMP_COMISION;
      Objeto.IMP_IVA_COMISION.Control := edIMP_IVA;
      Objeto.IMP_COMIS_PREM.Control := edIMP_COMIS_PREM; // RABA FEB 2012 PPP

      Objeto.Credito.ID_CREDITO.Control := edID_CREDITO;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edDESC_CREDITO;
      Objeto.Credito.GetParams(Objeto);

      Objeto.Comisiones.CVE_COMISION.Control := edCVE_COMISION;
      Objeto.Comisiones.DESC_COMISION.Control := edDESC_COMISION;
      Objeto.Comisiones.GetParams(Objeto);

      edF_VENCIMIENTO.Visible := False;
      lbF_VENCIMIENTO.Visible := False;
      dtpF_VENCIMIENTO.Visible := False;
      edIMP_COMISION.Visible := False;
      lbIMP_COMISION.Visible := False;
      edIMP_IVA.Visible := False;
      lbIVA.Visible := False;

      AgregarPerComis.Enabled := False;
      ModificaFecha.Enabled := False;
      ModificaImporte.Enabled := False;
      CancelaPeriodo.Enabled := False;
      CancelaComision.Enabled := False;
      CancelaProgComis.Enabled := False;
      edCVE_COMISION.Color := clBtnFace;
      edCVE_COMISION.Enabled := False;
      btCOMISION.Enabled := False;
end;

procedure TWCrCaMoCom.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_COMISION.Control := nil;
      Objeto.F_VENCIMIENTO.Control := nil;
      Objeto.IMP_COMISION.Control := nil;
      Objeto.IMP_IVA_COMISION.Control := nil;
      Objeto.IMP_COMIS_PREM.Control := nil; // RABA FEB 2012 PPP
      
      Objeto.Credito.ID_CREDITO.Control := nil;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
      Objeto.Comisiones.CVE_COMISION.Control := nil;
      Objeto.Comisiones.DESC_COMISION.Control := nil;
end;

procedure TWCrCaMoCom.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCaMoCom.btCREDITOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCAMOCOM_DISP',True,True) then
   begin
     Objeto.Credito.ShowAll := True;
     if Objeto.Credito.Busca then
     Begin
        LlenaGrid;
        InterForma1.NextTab(edID_CREDITO);
     end;
   end;
end;

procedure TWCrCaMoCom.ilCREDITOEjecuta(Sender: TObject);
begin
   if Objeto.Credito.FindKey([ilCREDITO.Buffer]) then
   Begin
      LlenaGrid;
      InterForma1.NextTab(edID_CREDITO);
   end;
end;

procedure TWCrCaMoCom.LlenaGrid;
var vlQry : TQuery;
    vlsql : String;
begin
  vlSql :=  ' SELECT  CC.NUM_PERIODO,      ' + coCRLF +
            '         CC.CVE_COMISION,    ' + coCRLF +
            '         CCC.DESC_COMISION,    ' + coCRLF +
            '         CC.F_VENCIMIENTO, ' + coCRLF +
            '         CC.F_PROG_PAGO,    ' + coCRLF +
            '         CC.PLAZO,    ' + coCRLF +
            '         CC.IMP_COMISION,    ' + coCRLF +
            '         CC.IMP_IVA,    ' + coCRLF +
            '         CC.IMP_BASE_CALCULO,    ' + coCRLF +
            '         CC.IMP_COMIS_PREM,   ' + coCRLF +        // RABA FEB 2012 PPP
            '         CC.PCT_COMISION,    ' + coCRLF +
            '         CC.SIT_COMISION,    ' + coCRLF +
            '         CCC.B_COMIS_PREM,   ' + coCRLF +        // RABA FEB 2012 PPP
            '         CCC.B_BLOQ_SALDO    ' + coCRLF +        // RABA FEB 2012 PPP
            ' FROM CR_COMISION CC,     ' + coCRLF +
            '      CR_CAT_COMISION CCC      ' + coCRLF +
            ' WHERE CC.ID_CREDITO    = ' + Objeto.Credito.ID_CREDITO.AsString + //Objeto.ID_CREDITO.AsString + coCRLF +
            '   AND CCC.CVE_COMISION  = CC.CVE_COMISION ' + coCRLF;

     vlQry := GetSQLQuery(vlSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

     try
        if vlQry <> nil then
        Begin
        //Datos que no se muestran
            vlQry.FieldByName('CVE_COMISION').Visible := False;
            vlQry.FieldByName('B_COMIS_PREM').Visible := False;   // RABA FEB 2012 PPP
            vlQry.FieldByName('B_BLOQ_SALDO').Visible := False;   // RABA FEB 2012 PPP

            vlQry.FieldByName('NUM_PERIODO').DisplayWidth := 4;
            vlQry.FieldByName('DESC_COMISION').DisplayWidth := 30;
            vlQry.FieldByName('F_VENCIMIENTO').DisplayWidth := 11;
            vlQry.FieldByName('F_PROG_PAGO').DisplayWidth := 11;
            vlQry.FieldByName('PLAZO').DisplayWidth := 5;
            vlQry.FieldByName('IMP_COMISION').DisplayWidth := 12;
            vlQry.FieldByName('IMP_IVA').DisplayWidth := 10;
            vlQry.FieldByName('IMP_BASE_CALCULO').DisplayWidth := 13;
            vlQry.FieldByName('IMP_COMIS_PREM').DisplayWidth := 12;    // RABA FEB 2012 PPP
            vlQry.FieldByName('PCT_COMISION').DisplayWidth := 7;
            vlQry.FieldByName('SIT_COMISION').DisplayWidth := 3;

            TNumericField(vlQry.FieldByName('IMP_COMISION')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('IMP_IVA')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('IMP_BASE_CALCULO')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('IMP_COMIS_PREM')).DisplayFormat := '###,###,###,###,###,###,##0.00';            
            TNumericField(vlQry.FieldByName('PCT_COMISION')).DisplayFormat := '##0.0000';

            sgcDATOS.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY

        end
        else  sgcDATOS.Clear('NO EXISTEN DATOS'#30'>C');

        ValidaUsuario;

        edF_VENCIMIENTO.Visible := False;
        lbF_VENCIMIENTO.Visible := False;
        dtpF_VENCIMIENTO.Visible := False;
        edIMP_COMISION.Visible := False;
        lbIMP_COMISION.Visible := False;
        edIMP_IVA.Visible := False;
        lbIVA.Visible := False;

        btCANCELA.Enabled := False;
        btAGREGA_CUOTA.Enabled :=False;
        vgMovto   := 0;
     finally
       if vlQry <> nil then
          vlQry.free;
       //end if
     end;
end;

procedure TWCrCaMoCom.ModificaFechaClick(Sender: TObject);
begin
  if sgcDATOS.CellStr['SIT_COMISION',sgcDATOS.SG.Row] <> CSIT_LQ then  // RABA FEB 2012 PPP
  begin                                                                // RABA FEB 2012 PPP
     edF_VENCIMIENTO.Visible := True;
     lbF_VENCIMIENTO.Visible := True;
     dtpF_VENCIMIENTO.Visible := True;
     edIMP_COMISION.Visible := False;
     lbIMP_COMISION.Visible := False;
     edIMP_IVA.Visible := False;
     lbIVA.Visible := False;
     ShowMessage('Favor de Indicar la nueva fecha de Vencimiento');
     edF_VENCIMIENTO.Enabled := True;
     dtpF_VENCIMIENTO.Enabled := True;
     btAGREGA_CUOTA.Caption := 'Modificar';
     btAGREGA_CUOTA.Enabled := True;
     btCANCELA.Enabled := True;
     edF_VENCIMIENTO.Text := sgcDATOS.CellStr['F_VENCIMIENTO',sgcDATOS.SG.Row];
     Objeto.F_VENCIMIENTO.AsDateTime:= Objeto.Apli.DameFechaEmpresa;
     edF_VENCIMIENTO.SetFocus;
     Objeto.CVE_COMISION.AsString := sgcDATOS.CellStr['CVE_COMISION',sgcDATOS.SG.Row];
     Objeto.IMP_COMISION.AsFloat := 0;
     Objeto.IMP_IVA_COMISION.AsFloat := 0;
     vgMovto   := 2;
  end                                                                               // RABA FEB 2012 PPP
  else                                                                              // RABA FEB 2012 PPP
    ShowMessage('No se puede modificar el periodo ya que se encuentra liquidado.'); // RABA FEB 2012 PPP
end;

procedure TWCrCaMoCom.ModificaImporteClick(Sender: TObject);
begin
  if sgcDATOS.CellStr['SIT_COMISION',sgcDATOS.SG.Row] <> CSIT_LQ then
  begin
     edF_VENCIMIENTO.Visible := False;
     lbF_VENCIMIENTO.Visible := False;
     dtpF_VENCIMIENTO.Visible := False;
     edIMP_COMISION.Visible := True;
     lbIMP_COMISION.Visible := True;
     edIMP_IVA.Visible := True;
     lbIVA.Visible := True;
     // RABA FEB 2012
     If sgcDATOS.CellStr['B_COMIS_PREM',sgcDATOS.SG.Row] = 'V' then
     begin
       lbPremio.Visible := True;
       edIMP_COMIS_PREM.Visible := True;
       if sgcDATOS.CellStr['B_BLOQ_SALDO',sgcDATOS.SG.Row] = 'V' then
       begin
          cbBloqSdoCh.Visible := True;
          cbBloqSdoCh.Checked := True;
       end
       else
       begin
          cbBloqSdoCh.Visible := False;
          cbBloqSdoCh.Checked := False;
       end
     end
     else
     begin
       lbPremio.Visible := False;
       edIMP_COMIS_PREM.Visible := False;
     end;
     // FIN RABA
     edF_VENCIMIENTO.Text := '';
     edIMP_COMISION.Text := sgcDATOS.CellStr['IMP_COMISION',sgcDATOS.SG.Row];
     edIMP_IVA.Text := sgcDATOS.CellStr['IMP_IVA',sgcDATOS.SG.Row];
     edIMP_COMIS_PREM.Text := sgcDATOS.CellStr['IMP_COMIS_PREM',sgcDATOS.SG.Row]; // RABA FEB 2012 PPP
     Objeto.CVE_COMISION.AsString := sgcDATOS.CellStr['CVE_COMISION',sgcDATOS.SG.Row];
     btAGREGA_CUOTA.Enabled := True;
     btCANCELA.Enabled := True;
     btAGREGA_CUOTA.Caption := 'Modificar';
     ShowMessage('Favor de Indicar el nuevo importe de comisión sin IVA');
     edIMP_COMISION.SetFocus;
     vgMovto   := 2;
  end
  else
    ShowMessage('No se puede modificar el periodo ya que se encuentra liquidado.');  
end;

procedure TWCrCaMoCom.btCANCELAClick(Sender: TObject);
begin
      edF_VENCIMIENTO.Visible := False;
      lbF_VENCIMIENTO.Visible := False;
      dtpF_VENCIMIENTO.Visible := False;
      edIMP_COMISION.Visible := False;
      lbIMP_COMISION.Visible := False;
      edIMP_IVA.Visible := False;
      lbIVA.Visible := False;
      btAGREGA_CUOTA.Enabled := False;
      btCANCELA.Enabled := False;
      // RABA FEB 2012
      lbPremio.Visible := False;
      edIMP_COMIS_PREM.Visible := False;
      cbBloqSdoCh.Visible := False;
      Objeto.Comisiones.Active := False;
      btCOMISION.Enabled := False;
      Objeto.Comisiones.Active := False;
      Objeto.IMP_COMISION.AsFloat := 0;
      Objeto.IMP_IVA_COMISION.AsFloat := 0;
      objeto.IMP_COMIS_PREM.AsFloat := 0;
      cbBloqSdoCh.Checked := False;
end;

procedure TWCrCaMoCom.btAGREGA_CUOTAClick(Sender: TObject);
begin
   Objeto.CVE_COMISION.GetFromControl;
   objeto.F_VENCIMIENTO.GetFromControl;
   objeto.IMP_COMISION.GetFromControl;
   Objeto.IMP_IVA_COMISION.GetFromControl;
   Objeto.IMP_COMIS_PREM.GetFromControl; // RABA FEB 2012 PPP
   MErrores.Lines.Clear;

   if ( edID_CREDITO.Text <> CNULL ) then
   Begin
      IF vgMovto = 1 THEN Begin
         IF ( Objeto.CVE_COMISION.AsString <> CNULL ) then BEGIN
           if MessageDlg('¿Desea Generar la comisión ?. ', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Begin
              MessageIniFinProceso( MErrores, cInicio );
              IF AgregaPerComis(Objeto.Credito.ID_CREDITO.AsInteger) THEN
                 BEGIN
                    MessageIniFinProceso( MErrores, cFinal );
                    edCVE_COMISION.Color := clBtnFace;
                    edCVE_COMISION.Enabled := False;
                    btCOMISION.Enabled := False;
                    Objeto.Comisiones.Active := False;
                 END
              ELSE
                 ShowMessage('Err. al adicionar el periodo');
           end;
           LlenaGrid;
           edF_VENCIMIENTO.Visible := False;
           lbF_VENCIMIENTO.Visible := False;
           dtpF_VENCIMIENTO.Visible := False;
           edIMP_COMISION.Visible := False;
           lbIMP_COMISION.Visible := False;
           edIMP_IVA.Visible := False;
           lbIVA.Visible := False;
           btAGREGA_CUOTA.Enabled := False;
           btCANCELA.Enabled := False;
           edCVE_COMISION.Color := clBtnFace;
           edCVE_COMISION.Enabled := False;
           btCOMISION.Enabled := False;
           Objeto.Comisiones.Active := False;
           // RABA FEB 2012 PPP
           lbPremio.Visible := False;
           edIMP_COMIS_PREM.Visible := False;
           cbBloqSdoCh.Visible := False;
           Objeto.IMP_COMISION.AsFloat := 0;
           Objeto.IMP_IVA_COMISION.AsFloat := 0;
           objeto.IMP_COMIS_PREM.AsFloat := 0;
           cbBloqSdoCh.Checked := False;
         END
         ELSE BEGIN
            ShowMessage('Favor de indicar la Comisión a Generar');
            edCVE_COMISION.SetFocus;
         END;
      end
      ELSE IF vgMovto = 2 THEN
      Begin
         if MessageDlg('¿Desea efectuar la modificación?. ', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
         Begin
            MessageIniFinProceso( MErrores, cInicio );
            IF ModifPerComis( Objeto.Credito.ID_CREDITO.AsInteger,
                              StrToInt(sgcDATOS.CellStr['NUM_PERIODO',sgcDATOS.SG.Row])) THEN
            BEGIN
               MessageIniFinProceso( MErrores, cFinal );
               // RABA FEB 2012
               //  validar si se bloquea saldo en chequera de acuerdo al catálogo de comisiones
               // FIN 
            END
            ELSE
               ShowMessage('Err. al Modificar el periodo');
         END;
         LlenaGrid;
         edF_VENCIMIENTO.Visible := False;
         lbF_VENCIMIENTO.Visible := False;
         dtpF_VENCIMIENTO.Visible := False;
         edIMP_COMISION.Visible := False;
         lbIMP_COMISION.Visible := False;
         edIMP_IVA.Visible := False;
         lbIVA.Visible := False;
         btAGREGA_CUOTA.Enabled := False;
         btCANCELA.Enabled := False;
         edCVE_COMISION.Color := clBtnFace;
         edCVE_COMISION.Enabled := False;
         btCOMISION.Enabled := False;
         Objeto.Comisiones.Active := False;
         // RABA FEB 2012 PPP
         lbPremio.Visible := False;
         edIMP_COMIS_PREM.Visible := False;
         cbBloqSdoCh.Visible := False;
         Objeto.IMP_COMISION.AsFloat := 0;
         Objeto.IMP_IVA_COMISION.AsFloat := 0;
         Objeto.IMP_COMIS_PREM.AsFloat := 0;
         cbBloqSdoCh.Checked := False;
      end;
   end;
end;

procedure TWCrCaMoCom.CancelaPeriodoClick(Sender: TObject);
begin
   if MessageDlg('¿Está seguro de cancelar el periodo <<' + sgcDATOS.CellStr['NUM_PERIODO',sgcDATOS.SG.Row] + '>>',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   Begin
      MessageIniFinProceso( MErrores, cInicio );
      IF CancelaPerComis( C_PER, Objeto.Credito.ID_CREDITO.AsInteger,
                          StrToInt(sgcDATOS.CellStr['NUM_PERIODO',sgcDATOS.SG.Row]) ) THEN
               MessageIniFinProceso( MErrores, cFinal )
            ELSE
               ShowMessage('Err. al Cancelar el periodo');
   end;
   LlenaGrid;
end;

procedure TWCrCaMoCom.CancelaComisionClick(Sender: TObject);
begin
   if MessageDlg('¿Está seguro de cancelar la comisión <<' + sgcDATOS.CellStr['CVE_COMISION',sgcDATOS.SG.Row] + '>>',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   Begin
      MessageIniFinProceso( MErrores, cInicio );
      IF CancelaPerComis( C_COM, Objeto.Credito.ID_CREDITO.AsInteger,
                          StrToInt( sgcDATOS.CellStr['NUM_PERIODO',sgcDATOS.SG.Row]) ) THEN
               MessageIniFinProceso( MErrores, cFinal )
            ELSE
               ShowMessage('Err. al Cancelar la comisión');
   end;
   LlenaGrid;
end;

procedure TWCrCaMoCom.AgregarPerComisClick(Sender: TObject);
begin
     edF_VENCIMIENTO.Visible := True;
     lbF_VENCIMIENTO.Visible := True;
     dtpF_VENCIMIENTO.Visible := True;
     edIMP_COMISION.Visible := True;
     lbIMP_COMISION.Visible := True;
     edIMP_IVA.Visible := True;
     lbIVA.Visible := True;

     ShowMessage('Favor de Indicar la Clave de Comsión, fecha de Vencimiento e importe ');
     edF_VENCIMIENTO.Enabled := True;
     dtpF_VENCIMIENTO.Enabled := True;
     btAGREGA_CUOTA.Caption := 'Agrega Periodo';
     btAGREGA_CUOTA.Enabled := True;
     btCANCELA.Enabled := True;
     Objeto.F_VENCIMIENTO.AsDateTime:= Objeto.Apli.DameFechaEmpresa;
     Objeto.IMP_COMISION.AsFloat := 0;
     Objeto.IMP_IVA_COMISION.AsFloat := 0;
     vgMovto   := 1;
     edCVE_COMISION.Color := clWindow;
     edCVE_COMISION.Enabled := True;
     btCOMISION.Enabled := True;
     edCVE_COMISION.SetFocus;
     Objeto.Comisiones.Active := True;     
end;

procedure TWCrCaMoCom.edIMP_COMISIONExit(Sender: TObject);
var vlPctIVA : Double;
begin
   Objeto.IMP_COMISION.GetFromControl;
   vlPctIVA:= StpPctIVA( Objeto.Credito.ID_CONTRATO.AsInteger,
                         Objeto.Credito.ID_CREDITO.AsInteger,
                         Objeto.IMP_COMISION.AsFloat,
                         Objeto.Apli)/ 100;
   Objeto.IMP_IVA_COMISION.AsFloat := Objeto.IMP_COMISION.AsFloat * vlPctIVA;
   InterForma1.ValidaExit(edIMP_COMISION,True,'',True);  // RABA FEB 2012 PPP
end;

procedure TWCrCaMoCom.CancelaProgComisClick(Sender: TObject);
var Compro : TCrComPro;
begin
   if ( edID_CREDITO.Text <> CNULL ) then
   Begin
       Compro := TCrComPro.Create(self);
       try
          Compro.Apli:=Objeto.Apli;     Compro.ParamCre:=Objeto.ParamCre;
          Objeto.BasicCred.LlenaDatos(Objeto.Credito.ID_CREDITO.AsInteger);
          Compro.BasicCred := Objeto.BasicCred;
          Compro.Catalogo;
       finally
              Compro.Free;
       end;
   end
   else
       ShowMessage('Seleccione una Disposición');
   ///end if;
end;

function TWCrCaMoCom.ActivaPerComis(pMetodo, pIdCredito, pNumPeriodo: Integer; pCveComis: String): Boolean;
var StpActivaCom :  TStoredProc;
    vlResult : Boolean;
begin
    vlResult := True;
    Objeto.CVE_COMISION.GetFromControl;
    StpActivaCom := TStoredProc.Create(Self);
    try
       with StpActivaCom do
       begin
          StpActivaCom.DatabaseName:= Objeto.Apli.DatabaseName;
          StpActivaCom.SessionName:= Objeto.Apli.SessionName;
          StpActivaCom.StoredProcName:='PKGCRCOMISIONES.STPACTIVACOMIS';

          Params.Clear;
          Params.CreateParam(ftInteger,'PEMETODO',ptInput);
          Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
          Params.CreateParam(ftString,'PECVECOMISION',ptInput);
          Params.CreateParam(ftFloat,'PENUMPERIODO',ptInput);
          Params.CreateParam(ftString,'PECVEUSUMOD',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('peMetodo').AsInteger := pMetodo;
          ParamByName('peIdCredito').AsInteger := pIdcredito;
          ParamByName('peCveComision').AsString := pCveComis;
          ParamByName('peNumPeriodo').AsInteger := pNumPeriodo;
          ParamByName('peCveUsuMod').AsString := Objeto.Apli.Usuario;
          ParamByName('peBCommit').AsString := CVERDAD;
          ExecProc;

          if ParamByName('psResultado').AsInteger <> 0 then
          Begin
             AddLine( MErrores, ParamByName('psRESULTADO'  ).AsString +
                                ParamByName('psTxResultado').AsString);
             vlResult := False;
          end;
       end;
    finally
       StpActivaCom.Free;
    end;
    ActivaPerComis := vlResult;
end;


procedure TWCrCaMoCom.ActivarPeriodo1Click(Sender: TObject);
begin
   if MessageDlg('¿Está seguro de Activar el periodo <<' + sgcDATOS.CellStr['NUM_PERIODO',sgcDATOS.SG.Row] + '>>',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   Begin
      MessageIniFinProceso( MErrores, cInicio );
      IF ActivaPerComis( C_PER, Objeto.Credito.ID_CREDITO.AsInteger,
                         StrToInt(sgcDATOS.CellStr['NUM_PERIODO',sgcDATOS.SG.Row]),
                         sgcDATOS.CellStr['CVE_COMISION',sgcDATOS.SG.Row] ) THEN
               MessageIniFinProceso( MErrores, cFinal )
            ELSE
               ShowMessage('Err. al Activar el periodo');
   end;
   LlenaGrid;
end;


procedure TWCrCaMoCom.ActivarComisin1Click(Sender: TObject);
begin
   if MessageDlg('¿Está seguro de Activar la comisión <<' + sgcDATOS.CellStr['CVE_COMISION',sgcDATOS.SG.Row] + '>>',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   Begin
      MessageIniFinProceso( MErrores, cInicio );
      IF ActivaPerComis( C_COM, Objeto.Credito.ID_CREDITO.AsInteger,
                         StrToInt(sgcDATOS.CellStr['NUM_PERIODO',sgcDATOS.SG.Row]),
                         sgcDATOS.CellStr['CVE_COMISION',sgcDATOS.SG.Row] ) THEN
               MessageIniFinProceso( MErrores, cFinal )
            ELSE
               ShowMessage('Err. al Activar la comisión');
   end;
   LlenaGrid;
end;

procedure TWCrCaMoCom.ValidaUsuario;
Var   qyQuery   : TQuery;
      vlSQL     : String;
      vlAutCom  : Boolean;
begin
   vlAutCom  := False;
   vlSQL := ' SELECT B_MOD_COMISION ' + coCRLF +
            ' FROM  CR_PERF_PROD_USU  ' + coCRLF +
            ' WHERE CVE_PRODUCTO   =  ' + SQLStr( Objeto.Credito.ContratoCre.CVE_PRODUCTO_CRE.AsString )+ coCRLF +
            ' AND   CVE_GPO_ACCESO =  ' + IntToStr( Objeto.Apli.CvePerfil ) + coCRLF ;

   qyQuery := GetSQLQuery(vlSQL,Objeto.DataBaseName,Objeto.SessionName,True);
   If (qyQuery <> nil) Then Begin
      if qyQuery.FieldbyName('B_MOD_COMISION').AsString = CVERDAD then
         vlAutCom := True;
   End;

   if ( Objeto.Credito.SIT_CREDITO.AsString = CSIT_AC ) OR
      ( Objeto.Credito.SIT_CREDITO.AsString = CSIT_CA ) OR
      ( Objeto.Credito.SIT_CREDITO.AsString = CSIT_LQ ) then
   Begin
        AgregarPerComis.Enabled := vlAutCom;
        ModificaFecha.Enabled := vlAutCom;
        ModificaImporte.Enabled := vlAutCom;
        CancelaPeriodo.Enabled := vlAutCom;
        CancelaComision.Enabled := vlAutCom;
        CancelaProgComis.Enabled := vlAutCom;
        ActivarPeriodo1.Enabled := vlAutCom;
        ActivarComisin1.Enabled := vlAutCom;
   end
   else
   begin
        AgregarPerComis.Enabled := True;
        ModificaFecha.Enabled := True;
        ModificaImporte.Enabled := True;
        CancelaPeriodo.Enabled := True;
        CancelaComision.Enabled := True;
        CancelaProgComis.Enabled := True;
        ActivarPeriodo1.Enabled := True;
        ActivarComisin1.Enabled := True;
   end;
end;

procedure TWCrCaMoCom.edID_CREDITOExit(Sender: TObject);
begin
      Objeto.Comisiones.BuscaWhereString := ' CR_CAT_COMISION.CVE_COMISION IN ' +
                                            ' (SELECT CVE_COMISION FROM CR_PRODUCTO_COM WHERE CVE_PRODUCTO_CRE = ' +
                                            SQLStr( Objeto.Credito.ContratoCre.CVE_PRODUCTO_CRE.AsString ) + ')';// +
//                                            ' AND CR_CAT_COMISION.CVE_TIPO_COM = ''PE''';
      Objeto.Comisiones.FilterString := Objeto.Comisiones.BuscaWhereString;
  InterForma1.ValidaExit(edID_CREDITO,True,'',True);  // RABA FEB 2012 PPP
end;

procedure TWCrCaMoCom.btCOMISIONClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCAMOCOM_COMIS',True,True) then
   begin
     Objeto.Comisiones.ShowAll := True;
     if Objeto.Comisiones.Busca then
     begin
        If Objeto.Comisiones.B_COMIS_PREM.AsString = 'V' Then
        begin
          lbPremio.Visible := True;
          edIMP_COMIS_PREM.Visible := True;
          if Objeto.Comisiones.B_BLOQ_SALDO.AsString = 'V' then
          begin
             cbBloqSdoCh.Visible := True;
             cbBloqSdoCh.Checked := True;
          end
          else
          begin
             cbBloqSdoCh.Visible := False;
             cbBloqSdoCh.Checked := False;
          end;
        end
        else
        begin
          lbPremio.Visible := False;
          edIMP_COMIS_PREM.Visible := False;
          cbBloqSdoCh.Visible := False;
          cbBloqSdoCh.Checked := False;
        end;
        InterForma1.NextTab(edCVE_COMISION);
     end;
   end;
   //end if
end;

procedure TWCrCaMoCom.ilCOMISIONEjecuta(Sender: TObject);
begin
   if Objeto.Comisiones.FindKey([ilCOMISION.Buffer]) then
   // RABA FEB 2012 PPP
   begin
      If Objeto.Comisiones.B_COMIS_PREM.AsString = 'V' Then
      begin
        lbPremio.Visible := True;
        edIMP_COMIS_PREM.Visible := True;
        if Objeto.Comisiones.B_BLOQ_SALDO.AsString = 'V' then
        begin
           cbBloqSdoCh.Visible := True;
           cbBloqSdoCh.Checked := True;
        end
        else
        begin
           cbBloqSdoCh.Visible := False;
           cbBloqSdoCh.Checked := False;
        end
      end
      else
      begin
        lbPremio.Visible := False;
        edIMP_COMIS_PREM.Visible := False;
        cbBloqSdoCh.Visible := False;
        cbBloqSdoCh.Checked := False;
      end;
      InterForma1.NextTab(edCVE_COMISION);
   end;
   //end if
end;

procedure TWCrCaMoCom.sgcDATOSCalcRow(Sendet: TObject; DataSet: TDataSet;
  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
begin
    {COLOR A LAS SITUACIONES}
    //Si es CANCELADO lo pone de color GRIS
    if DataSet.FieldByName('SIT_COMISION').AsString = CSIT_CA then
       sgcDATOS.SetFontColor(clGray)
    //Si es IMPAGADO lo pone de color ROJO
    else if DataSet.FieldByName('SIT_COMISION').AsString = CSIT_IM then
       sgcDATOS.SetFontColor(clRed)
    //Si es AUTORIZADO lo pone de color verde
    else if DataSet.FieldByName('SIT_COMISION').AsString = CSIT_AC then
       sgcDATOS.SetFontColor(clGreen)
        //Si es NO AUTORIZADO LO PONE COLOR NEGRO
    else if DataSet.FieldByName('SIT_COMISION').AsString = CSIT_PA then
       sgcDATOS.SetFontColor(clBlack)
        //Si es LIQUIDADO LO PONE COLOR AZUL
    else if DataSet.FieldByName('SIT_COMISION').AsString = CSIT_LQ then
       sgcDATOS.SetFontColor(clBlue);

end;

procedure TWCrCaMoCom.edIMP_COMIS_PREMExit(Sender: TObject);
begin
  Objeto.IMP_COMISION.GetFromControl;
  Objeto.IMP_COMIS_PREM.GetFromControl;
  IF Objeto.IMP_COMISION.AsFloat < Objeto.IMP_COMIS_PREM.AsFloat THEN
  Begin
    ShowMessage('El importe de PPP no puede ser mayor al importe de Comisión. Verifique por favor.');
    edIMP_COMIS_PREM.SetFocus;
  end;
end;

procedure TWCrCaMoCom.edF_VENCIMIENTOExit(Sender: TObject);
begin
  Objeto.F_VENCIMIENTO.GetFromControl;
  If edF_VENCIMIENTO.Text <> '' then
     If objeto.F_VENCIMIENTO.AsDateTime < objeto.Credito.F_INICIO.AsDateTime THEN
     begin
       showmessage('La fecha de vencimiento no puede ser menor a la fecha de incio del crédito');
       dtpF_VENCIMIENTO.SetFocus;
     end;
end;

procedure TWCrCaMoCom.dtpF_VENCIMIENTOExit(Sender: TObject);
begin
  Objeto.F_VENCIMIENTO.GetFromControl;
  If edF_VENCIMIENTO.Text <> '' then
     If objeto.F_VENCIMIENTO.AsDateTime < objeto.Credito.F_INICIO.AsDateTime THEN
     begin
       showmessage('La fecha de vencimiento no puede ser menor a la fecha de incio del crédito');
       dtpF_VENCIMIENTO.SetFocus;
     end;
end;

end.
