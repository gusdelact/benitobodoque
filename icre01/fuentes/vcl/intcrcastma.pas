// Sistema         : Clase de NINGUNO
// Fecha de Inicio : 10/01/2005
// Función forma   : Clase de NINGUNO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrCaStMa;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntParamCre,
IntGenCre,
IntCrCredito,
IntCrStValid, IntLinkit;
Type
 TCrCaStMa= class;

  TWCrCaStMa=Class(TForm)
    InterForma1             : TInterForma;
    lbFiltro: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    lbSIT_ACTUAL: TLabel;
    MErrores: TMemo;
    btCREDITO: TBitBtn;
    edID_CREDITO: TEdit;
    edSIT_ASIGNA: TEdit;
    btSIT_ASIGNA: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    btACTUALIZA_SIT: TBitBtn;
    edDESC_SIT_ASIGNA: TEdit;
    ilDISP: TInterLinkit;
    ilSIT_ASIGNA: TInterLinkit;
    edDESC_PRODUCTO: TEdit;
    edCVE_PRODUCTO: TEdit;
    edCVE_AMORTIZACION: TEdit;
    edDESC_TIPO_AMORT: TEdit;
    edCVE_PAG_INTERES: TEdit;
    edDESC_PAGO_INT: TEdit;
    Bevel1: TBevel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btCREDITOClick(Sender: TObject);
    procedure ilDISPEjecuta(Sender: TObject);
    procedure btSIT_ASIGNAClick(Sender: TObject);
    procedure ilSIT_ASIGNAEjecuta(Sender: TObject);
    procedure btACTUALIZA_SITClick(Sender: TObject);
    private
    { Private declarations }
       Procedure ObtDescSitActual;
    public
    { Public declarations }
    Objeto : TCrCaStMa;
end;
 TCrCaStMa= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre                 : TParamCre;
        Disp                     : TCrCredito;
        Situacion                : TCrStValid;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    StpActSitCred(pIdCredito, pSitAsigna: String; var  vlError : String ): Boolean;
      published
      end;



implementation

{$R *.DFM}


constructor TCrCaStMa.Create( AOwner : TComponent );
begin Inherited;
      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrCaStMa.Hlp';
      ShowMenuReporte:=True;

      Disp := TCrCredito.Create(Self);
      Disp.MasterSource:=Self;
      Disp.BuscaWhereString := 'CR_CREDITO.SIT_CREDITO NOT IN ( ' + SQLStr('LQ') + ',' + SQLStr('CA') + ')';
      Disp.FilterString := Disp.BuscaWhereString;

      Situacion := TCrStValid.Create(Self);
      Situacion.MasterSource:=Self;
end;

Destructor TCrCaStMa.Destroy;
begin
   If Disp <> nil then
      Disp.free;
   //end if;
   If Situacion <> nil then
      Situacion.free;
   //end if;

   inherited;
end;


function TCrCaStMa.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCaStMa;
begin
   W:=TWCrCaStMa.Create(Self);
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

function TCrCaStMa.StpActSitCred(pIdCredito, pSitAsigna: String; var  vlError : String ): Boolean;
var     vlSalida     : Boolean;
        StpActSit    : TStoredProc;
Begin
     //Inicia el SPT
     vlSalida := True;
     StpActSit := TStoredProc.Create(Self);
     try
        with StpActSit do
        begin
          StpActSit.DatabaseName:= Apli.DatabaseName;
          StpActSit.SessionName:= Apli.SessionName;
          StpActSit.StoredProcName:='PKGCRCREDITO.STPMODSITMAN';
          Params.Clear;
          Params.CreateParam(ftString,'peIdCredito',ptInput);
          Params.CreateParam(ftString,'peSitAsignar',ptInput);
          Params.CreateParam(ftString,'peCveUsuMod',ptInput);
          Params.CreateParam(ftString,'peBCommit',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          //
          ParamByName('peIdCredito').AsString := pIdCredito;
          ParamByName('peSitAsignar').AsString := pSitAsigna;
          ParamByName('peCveUsuMod').AsString:= Apli.Usuario;
          ParamByName('peBCommit').AsString := 'V';
          ExecProc;

          //SI CARGA MANDA LA CESION Y Y LA SITUACION DEL MISMO
          if (ParamByName('PSResultado').AsInteger <> 0) then
          Begin
             vlError := IntToStr(ParamByName('psRESULTADO').AsInteger) + ': '+ParamByName('psTxResultado').AsString;
             ShowMessage(vlError);
             vlSalida := False;
          end;
        end;
     finally
          StpActSit.Free;
     end;
     StpActSitCred := vlSalida;
end;

(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)

procedure TWCrCaStMa.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.Disp.ID_CREDITO.Control:=edID_CREDITO;
      Objeto.Disp.ContratoCre.Contrato.TITNombre.Control := edNOM_ACREDITADO;

      Objeto.Situacion.SitAsigna.CVE_SITUACION.Control:=edSIT_ASIGNA;
      Objeto.Situacion.SitAsigna.DESC_C_SITUACION.Control := edDESC_SIT_ASIGNA;
end;

procedure TWCrCaStMa.FormDestroy(Sender: TObject);
begin
      Objeto.Disp.ID_CREDITO.Control:= nil;
      Objeto.Disp.ContratoCre.Contrato.TITNombre.Control := nil;
      Objeto.Situacion.SitAsigna.CVE_SITUACION.Control:=nil;
      Objeto.Situacion.SitAsigna.DESC_C_SITUACION.Control := nil;
end;

procedure TWCrCaStMa.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCaStMa.ObtDescSitActual;
var vlSitActual      : String;
    vlsql, vlDescSit : String;
begin
   if ( Objeto.Disp.F_TRASPASO_VENC.AsString <> CNULL )  and ( Objeto.Disp.SIT_CREDITO.AsString = 'AC' ) and
      ( Objeto.Disp.SIT_CREDITO_DET.AsString = CNULL )  then
      vlSitActual := 'VE'
   else if Objeto.Disp.SIT_CREDITO_DET.AsString <> CNULL then
        vlSitActual := Objeto.Disp.SIT_CREDITO_DET.AsString
   else vlSitActual := Objeto.Disp.SIT_CREDITO.AsString;

   vlsql :=' SELECT DESC_C_SITUACION FROM CR_SITUACION ' +
           ' WHERE CVE_SITUACION = ' + SQLStr( vlSitActual );
   GetSQLStr(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'DESC_C_SITUACION',vlDescSit,False);
   lbSIT_ACTUAL.Visible := True;
   lbSIT_ACTUAL.Caption := vlDescSit;

   Objeto.Situacion.BuscaWhereString := '     CR_SIT_VALIDA.CVE_PRODUCTO_CRE = ' + SQLStr( Objeto.Disp.ContratoCre.CVE_PRODUCTO_CRE.AsString ) +
                                        ' AND CR_SIT_VALIDA.CVE_AMORTIZACION = ' + Objeto.Disp.CVE_AMORTIZACION.AsString +
                                        ' AND CR_SIT_VALIDA.CVE_PAG_INTERES  = ' + Objeto.Disp.CVE_PAG_INTERES.AsString +
                                        ' AND CR_SIT_VALIDA.CVE_SIT_ACTUAL   = ' + SQLStr( Objeto.Disp.SIT_CREDITO.AsString );
   Objeto.Situacion.FilterString := Objeto.Situacion.BuscaWhereString;

   edCVE_PRODUCTO.Text := Objeto.Disp.ContratoCre.CVE_PRODUCTO_CRE.AsString;
   edDESC_PRODUCTO.Text := Objeto.Disp.ContratoCre.Producto.DESC_L_PRODUCTO.AsString;
   edCVE_AMORTIZACION.Text := Objeto.Disp.CVE_AMORTIZACION.AsString;
   edDESC_TIPO_AMORT.Text := Objeto.Disp.TipoAmort.DESC_AMORTIZA.AsString;
   edCVE_PAG_INTERES.Text := Objeto.Disp.CVE_PAG_INTERES.AsString;
   edDESC_PAGO_INT.Text := Objeto.Disp.PagoInt.DESC_PAG_INTERES.AsString;
   edSIT_ASIGNA.Enabled := True;
   edSIT_ASIGNA.Color := clWindow;
   btSIT_ASIGNA.Enabled := True;
end;

procedure TWCrCaStMa.btCREDITOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCASTMA_DISPO',True,True) then
   begin
       Objeto.Situacion.Active := False;
       Objeto.Disp.ShowAll := True;
       if Objeto.Disp.Busca then
       Begin
          ObtDescSitActual;
          InterForma1.NextTab(edID_CREDITO);
       end;
   end;
end;

procedure TWCrCaStMa.ilDISPEjecuta(Sender: TObject);
begin
   Objeto.Situacion.Active := False;
   if Objeto.Disp.FindKey([ilDISP.Buffer]) then
   Begin
      ObtDescSitActual;
      InterForma1.NextTab(edID_CREDITO);
   end;
end;

procedure TWCrCaStMa.btSIT_ASIGNAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCASTMA_SIT',True,True) then
   begin
     Objeto.Situacion.ShowAll := True;
     if Objeto.Situacion.Busca then
        InterForma1.NextTab(edSIT_ASIGNA);
   end;
end;

procedure TWCrCaStMa.ilSIT_ASIGNAEjecuta(Sender: TObject);
begin
   if Objeto.Situacion.FindKey([ilSIT_ASIGNA.Buffer]) then
      InterForma1.NextTab(edSIT_ASIGNA);
end;

procedure TWCrCaStMa.btACTUALIZA_SITClick(Sender: TObject);
var vlError: STring;
begin
   if Objeto.ValidaAccesoEsp('TCRCASTMA_ACTL',True,True) then
   begin
     if edID_CREDITO.Text <> CNULL then
     Begin
        MessageIniFinProceso( MErrores, cInicio );
        if not Objeto.StpActSitCred(Objeto.Disp.ID_CREDITO.AsString, edSIT_ASIGNA.Text,vlError) then
           AddLine(MErrores, ' *** ' + vlError )
        else ShowMessage('Proceso Terminado');
        MessageIniFinProceso( MErrores, cFinal );
     end;
   end;
end;

end.
