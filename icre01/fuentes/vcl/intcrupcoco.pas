// Sistema         : Clase de NINGUNO
// Fecha de Inicio : 17/03/2006
// Función forma   : Clase de NINGUNO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrUpCoCo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, DBGrids, DBCtrls,

//Unidades Adicionales
  IntParamCre, IntLinkit, Wwdbigrd, Wwdbgrid, IntGenCre, IntQrCoCo, IntMQrCoCo,
  InterEdit;

Type
 TCrUpCoCo= class;

  TWCrUpCoCo=Class(TForm)
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
    MsgPanel: TPanel;
    Label6: TLabel;
    edID_CREDITO: TEdit;
    btDisposicion: TBitBtn;
    edAcreditado: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    cbMes: TComboBox;
    cbAnio: TComboBox;
    btBUSCA: TBitBtn;
    Database1: TDatabase;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    dbgDATOS: TDBGrid;
    Label12: TLabel;
    lbTIpoCambio: TLabel;
    MErrores: TMemo;
    tbDM_CR_FAC_CREDITO: TTable;
    DBNavigator1: TDBNavigator;
    DataSource1: TDataSource;
    tbDM_CR_FAC_CREDITOIMP_SPM_K_VIG: TFloatField;
    tbDM_CR_FAC_CREDITOIMP_SDO_K_VIG: TFloatField;
    tbDM_CR_FAC_CREDITOIMP_SDO_IO_IMP: TFloatField;
    tbDM_CR_FAC_CREDITOIMP_SDO_IO_VEN: TFloatField;
    tbDM_CR_FAC_CREDITOIMP_SPM_K_IMP: TFloatField;
    tbDM_CR_FAC_CREDITOIMP_SDO_K_IMP: TFloatField;
    tbDM_CR_FAC_CREDITOIMP_SDO_K_VEN: TFloatField;
    tbDM_CR_FAC_CREDITOIMP_INT_CORTE: TFloatField;
    tbDM_CR_FAC_CREDITOIMP_INT_DEV_VDO: TFloatField;
    tbDM_CR_FAC_CREDITOID_CREDITO: TFloatField;
    tbDM_CR_FAC_CREDITOID_ANIO_MES: TFloatField;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btDisposicionClick(Sender: TObject);
    procedure btBUSCAClick(Sender: TObject);
    procedure btAPLICAClick(Sender: TObject);
    private
    { Private declarations }
        Function    ActualizaSdos: Boolean;
        Function    DameIdCredito(peIdCredito : String): Boolean;
    public
    { Public declarations }
    Objeto : TCrUpCoCo;
end;
 TCrUpCoCo= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_CREDITO                  : TInterCampo;
        ID_CR_COINCRE               : TInterCampo;
        ACREDITADO                  : TInterCampo;
        NUM_CREDITO                 : TInterCampo;
        ID_ANIO_MES                 : TInterCampo;
        CVE_MONEDA                  : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        MRepCoIncre              : TMQrCoCo;
        RepCoIncre               : TQrCompCOINCRE;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;


      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrUpCoCo.Create( AOwner : TComponent );
begin Inherited;
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
      ID_CR_COINCRE :=CreaCampo('ID_CR_COINCRE',ftInteger,tsNinguno,tsNinguno,False);
      ACREDITADO :=CreaCampo('ACREDITADO',ftString,tsNinguno,tsNinguno,False);
      NUM_CREDITO :=CreaCampo('NUM_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
      ID_ANIO_MES :=CreaCampo('ID_ANIO_MES',ftString,tsNinguno,tsNinguno,False);
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftInteger,tsNinguno,tsNinguno,False);

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrUpCoCo.Hlp';
      ShowMenuReporte:=True;

      MRepCoIncre := TMQrCoCo.Create(Self);
      MRepCoIncre.MasterSource := Self;

      RepCoIncre := TQrCompCOINCRE.Create(Self);


end;

Destructor TCrUpCoCo.Destroy;
begin
   if MRepCoIncre <> Nil Then
      MRepCoIncre.Free;
   //end if;
   if RepCoIncre <> Nil Then
      RepCoIncre.Free;
   //end if;
   inherited;
end;

function TCrUpCoCo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrUpCoCo;
begin
   W:=TWCrUpCoCo.Create(Self);
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


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)

procedure TWCrUpCoCo.FormShow(Sender: TObject);
begin
   // Pinta datos del panel
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.ID_CREDITO.Control := edID_CREDITO;
   Objeto.ACREDITADO.Control := edAcreditado;
end;

procedure TWCrUpCoCo.FormDestroy(Sender: TObject);
begin
   Objeto.ID_CREDITO.Control := nil;
   Objeto.ACREDITADO.Control := nil;
   Database1.Connected := False;
   tbDM_CR_FAC_CREDITO.Active := False;
end;

procedure TWCrUpCoCo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrUpCoCo.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrUpCoCo.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrUpCoCo.btDisposicionClick(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('ICRDIMCR.IT','I');
      Try
        If T.Execute Then
           Begin
             ID_CREDITO.AsString := T.DameCampo(0);
             ACREDITADO.AsString := T.DameCampo(1);
           End;
      Finally
        T.Free;
      End;
    End;

End;


function TWCrUpCoCo.DameIdCredito(peIdCredito: String): Boolean;
Var  SQL : string;
     vlResult: Boolean;
     vlQry : TQuery;
begin
     //busca idcredito coincre
  vlResult := False;
  SQL := 'SELECT FAC.ID_ANIO_MES,FAC.ID_CREDITO, DIM.ID_OLTP_MONEDA' + coCRLF +
         'FROM DM_CR_FAC_CREDITO@DWHC FAC,' + coCRLF +
         '     DM_CR_DIM_MES@DWHC     MES,' + coCRLF +
         '     DM_CR_DIM_CREDITO@DWHC DIM' + coCRLF +
         'WHERE DIM.CREDITO     = ' + Objeto.ID_CREDITO.AsString +coCRLF +
         '  AND MES.NUM_MES     = ' + IntToStr(Objeto.MRepCoIncre.DameNoMes(cbMes.Text)) + coCRLF +
         '  AND MES.ANIO        = ' + cbAnio.Text + coCRLF +
         '  AND DIM.ID_CREDITO  = FAC.ID_CREDITO' + coCRLF +
         '  AND MES.ID_ANIO_MES = FAC.ID_ANIO_MES' + coCRLF;


     vlQry := GetSQLQuery(SQL,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     try
        if vlQry <> nil then
        Begin
             Objeto.ID_CR_COINCRE.AsString := vlQry.FieldByName('ID_CREDITO').AsString;
             Objeto.CVE_MONEDA.AsString := vlQry.FieldByName('ID_OLTP_MONEDA').AsString;
             Objeto.ID_ANIO_MES.AsString := vlQry.FieldByName('ID_ANIO_MES').AsString;
             vlResult := True;
        end
        else
        Begin
             vlResult := False;
        end;
     finally
       if vlQry <> nil then
          vlQry.free;
       //end if
     end;
     DameIdCredito := vlResult;
end;


procedure TWCrUpCoCo.btBUSCAClick(Sender: TObject);
var  vlIdCredito, vlIdAnioMes : string;
begin
   if edID_CREDITO.Text <> '' then Begin
    //busca idcredito coincre
    if DameIdCredito(Objeto.ID_CREDITO.AsString) then Begin

      Database1.Connected := False;
      tbDM_CR_FAC_CREDITO.Active := False;
      tbDM_CR_FAC_CREDITO.TableName := 'DM_CR_FAC_CREDITO';
      tbDM_CR_FAC_CREDITO.Filter := 'ID_CREDITO = ' + Objeto.ID_CR_COINCRE.AsString +
                                    ' AND ID_ANIO_MES = ' + Objeto.ID_ANIO_MES.AsString;
      tbDM_CR_FAC_CREDITO.Filtered := True;
      Database1.Connected := True;
      tbDM_CR_FAC_CREDITO.Active := True;
      lbTIpoCambio.Caption := FormatFloat('###,##0.0000',ObtTipCambConta( Objeto.CVE_MONEDA.AsString,
                                                            StrToDateTime('01/' + IntToStr(Objeto.MRepCoIncre.DameNoMes(cbMes.Text))+'/'+ cbAnio.Text),
                                                            Objeto.Apli));

     end
     else ShowMessage('No se encontró el crédito');
   end;
end;

procedure TWCrUpCoCo.btAPLICAClick(Sender: TObject);
begin
   if MessageDlg('¿Está seguro de actualizar los saldos',
                 mtConfirmation, [mbYes, mbNo], 0) = mrYes then
//      if not ActualizaSdos then
//         ShowMessage('Se han actualizado los saldos.');
      //end if;
   //end if
   btBUSCA.Click;
   AddLine( MErrores, 'Se han actualizado los saldos.');
end;

function TWCrUpCoCo.ActualizaSdos: Boolean;
var StpUpdSdos :  TStoredProc;
    vlResult : Boolean;
begin
    vlResult := True;
    StpUpdSdos := TStoredProc.Create(Self);
    try
       with StpUpdSdos do
       begin
          StpUpdSdos.DatabaseName:= Objeto.Apli.DatabaseName;
          StpUpdSdos.SessionName:= Objeto.Apli.SessionName;
          StpUpdSdos.StoredProcName:='PKGCOINCRE.STPUPSDOSCOINCRE';

          Params.Clear;
          Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
          Params.CreateParam(ftInteger,'PEIDANIOMES',ptInput);
          Params.CreateParam(ftFloat,'PESDOCAPVIG',ptInput);
          Params.CreateParam(ftFloat,'PESDOCAPIMP',ptInput);
          Params.CreateParam(ftFloat,'PESDOCAPVDO',ptInput);
          Params.CreateParam(ftFloat,'PESDOCAPPROMVIG',ptInput);
          Params.CreateParam(ftFloat,'PESDOCAPPROMIMP',ptInput);
          Params.CreateParam(ftFloat,'PESDOINTVIG',ptInput);
          Params.CreateParam(ftFloat,'PESDOINTIMP',ptInput);
          Params.CreateParam(ftFloat,'PESDOINTVDO',ptInput);
          Params.CreateParam(ftFloat,'PETIPOCAMBIO',ptInput);
          Params.CreateParam(ftString,'PECVECOMISION',ptInput);
          Params.CreateParam(ftDateTime,'PEFVENCIMIENTO',ptInput);
          Params.CreateParam(ftFloat,'PEIMPCOMISION',ptInput);
          Params.CreateParam(ftFloat,'PEIMPIVA',ptInput);
          Params.CreateParam(ftString,'PECVEUSUALTA',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('peIdCredito').AsInteger   := Objeto.NUM_CREDITO.AsInteger;
          ParamByName('peIdAnioMes').AsInteger   := Objeto.ID_ANIO_MES.AsInteger;
{          ParamByName('peSdoCapVig').AsFloat     := StrToFloat( edK_VIG.Text );
          ParamByName('peSdoCapImp').AsFloat     := StrToFloat(edK_IMP.Text);
          ParamByName('peSdoCapVdo').AsFloat     := StrToFloat(edK_VDO.Text);
          ParamByName('peSdoCapPromVig').AsFloat := StrToFloat(edK_PRO_VIG.Text);
          ParamByName('peSdoCapPromImp').AsFloat := StrToFloat(edK_PRO_IMP.Text);
          ParamByName('peSdoIntVig').AsFloat     := StrToFloat(edI_VIG.Text);
          ParamByName('peSdoIntImp').AsFloat     := StrToFloat(edI_IMP.Text);
          ParamByName('peSdoIntVdo').AsFloat     := StrToFloat(edI_VDO.Text);
          }
          ParamByName('peTipoCambio').AsFloat    := StrToFloat(lbTIpoCambio.Caption);
          ParamByName('peCveUsuAlta').AsString   := Objeto.Apli.Usuario;
          ParamByName('peBCommit').AsString      := CVERDAD;
          ExecProc;

          if ParamByName('psResultado').AsInteger <> 0 then
          Begin
             AddLine( MErrores, ParamByName('psRESULTADO'  ).AsString +
                                ParamByName('psTxResultado').AsString);
             vlResult := False;
          end;
       end;
    finally
       StpUpdSdos.Free;
    end;
    ActualizaSdos := vlResult;
end;


end.
