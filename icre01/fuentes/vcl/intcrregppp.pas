// Sistema         :
// Fecha de Inicio : 05/03/2012
// Función forma   :
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Fernando Jimenez Rivera
// Fecha           : MARZO 2012
// Comentarios     :
Unit IntCrRegPPP;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,                                           
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, Grids,

IntParamCre, IntGenCre,
IntCrMovPPP, IntCrOperaci, IntCrCredito, IntCrCto,
IntSGCtrl, IntCrGruCla, InterEdit, Wwdatsrc, Wwkeycb, DBCtrls, IntCtoPanel;

Const
  CoAUTORIZADO = 'AU';
  CoCANCELADO = 'CA';
  CoNOAUTORIZADO = 'NA';
  CoVERDAD ='V';
  coFALSO = 'F' ;
  CoPREDETERMINADO=CoVERDAD ;


Type
 TCrRegPPP= class;

  TWCrRegPPP=Class(TForm)
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
    lbUSUA_ALTA: TLabel;
    edCVE_USUA_ALTA: TEdit;
    lbUSUA_MODIF: TLabel;
    lbF_ALTA: TLabel;
    edF_ALTA: TEdit;
    lbF_MODIF: TLabel;
    edF_CANCELA: TEdit;
    edCVE_USUA_CANCELA: TEdit;
    Label2: TLabel;
    edCVE_PPO_MOV: TEdit;
    bbCveMovPPP: TBitBtn;
    ilCVE_PPO_MOV: TInterLinkit;
    edDESC_MOV_PPP: TEdit;
    icpCONTRATO: TInterCtoPanel;
    Label3: TLabel;
    edID_CESION: TEdit;
    btID_CESION: TBitBtn;
    edCESION: TEdit;
    ilCesion: TInterLinkit;
    gbCantidades: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btAUTORIZA: TBitBtn;
    btCANCELA: TBitBtn;
    Label6: TLabel;
    edF_AUTORIZA: TEdit;
    Label7: TLabel;
    edCVE_USUA_AUTORIZA: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    edSituacion: TEdit;
    edIMP_IVA: TInterEdit;
    edIMP_NETO: TInterEdit;
    edIMP_BRU: TInterEdit;
    Label10: TLabel;
    Label11: TLabel;
    edImportePremio: TInterEdit;
    edImporteIVAPremio: TInterEdit;
    edImporteTotalPremio: TInterEdit;
    edImpProvisionado: TInterEdit;
    Label12: TLabel;
    MsgPanel: TPanel;
    lbChequera: TLabel;
    edChequera: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edCVE_PPO_MOVExit(Sender: TObject);
    procedure bbCveMovPPPClick(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure edIMP_BRUExit(Sender: TObject);
    procedure btAUTORIZAClick(Sender: TObject);
    procedure btCANCELAClick(Sender: TObject);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure ilCVE_PPO_MOVEjecuta(Sender: TObject);
    procedure ImprimeReporte(bPreview: Boolean; vlidcredito, vlidtrans : String);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure edID_CESIONExit(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    private
      vgActualiza : Boolean;
      vgAdvierteCambio: Boolean;
      Function ValidaCantidades : Boolean;
      procedure MensajeAdvierte ;
      procedure CalculaTotal ;
      procedure Situacion ;
      function InsTransPPP(Cred: Integer; Mov: String; Imp, Iva: Currency): Boolean ;
      function CancMovPPP(Cred, TransGpo: Integer; Mov: String; Imp, Iva: Currency; Accion: Integer): Boolean ;
      function ImportePPP(Cred: Integer): Currency;
      function ImporteProvis(Cred: Integer): Currency;
      function RevisaFacturasElectronicas:Integer;
      function TasaIva: Double ;
      function ExisteRegistro :Boolean;
      procedure DatosPremio;
      function EmiteTraspCheq :Boolean;
      Procedure DatosChequera;
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrRegPPP;
end;
 TCrRegPPP= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_CREDITO        :TInterCampo;
        CVE_PPO_MOV       :TInterCampo;
        ID_GRUPO_TRANSAC  :TInterCampo;
        IMP_BRUTO         :TInterCampo;
        IMP_IVA           :TInterCampo;
        IMP_NETO          :TInterCampo;
        ID_CONTRATO_DV    :TInterCampo;
        SIT_PPO_MOV_PREMIO:TInterCampo;
        F_ALTA            :TInterCampo;
        CVE_USU_ALTA      :TInterCampo;
        F_AUTORIZA        :TInterCampo;
        CVE_USU_AUTORIZA  :TInterCampo;
        F_CANCELA         :TInterCampo;
        CVE_USU_CANCELA   :TInterCampo;

        ParamCre     : TParamCre;
        ContratoCre  : TCrCto;
        Credito      : TCrCredito;
        Operacion    : TCrOperaci;
        MovPPP       : TCrMovPPP ;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

      var
      vlgIdGpoTrans : String; // VARIABLE PARA ASIGNAR ID_GPO_TRANSAC JFOF 01/03/2013 

implementation
Uses IntMTrasCheq; // INSTRUCCION PARA TRASPASO ENTRE CHEQUERAS JFOF 28/FEB/2013

{$R *.DFM}


constructor TCrRegPPP.Create( AOwner : TComponent );
begin Inherited;

  ID_CREDITO := CreaCampo( 'ID_CREDITO', ftInteger, tsNinguno, tsNinguno, True );
  CVE_PPO_MOV := CreaCampo( 'CVE_PPO_MOV', ftString, tsNinguno, tsNinguno, True );
  ID_GRUPO_TRANSAC := CreaCampo( 'ID_GRUPO_TRANSAC', ftInteger, tsNinguno, tsNinguno, True );
  IMP_BRUTO := CreaCampo( 'IMP_BRUTO', ftFloat, tsNinguno, tsNinguno, True );
  IMP_IVA := CreaCampo( 'IMP_IVA', ftFloat, tsNinguno, tsNinguno, True );
  IMP_NETO:= CreaCampo('IMP_NETO', ftFloat, tsNinguno, tsNinguno, True);
  ID_CONTRATO_DV:= CreaCampo('ID_CONTRATO_DV', ftString, tsNinguno, tsNinguno, True) ;
  SIT_PPO_MOV_PREMIO := CreaCampo('SIT_PPO_MOV_PREMIO', ftString, tsNinguno, tsNinguno, True);
  With SIT_PPO_MOV_PREMIO do
  Begin
     Size := 2;
     UseCombo := True;
     ComboLista.Add('0'); ComboDatos.Add(CoNOAUTORIZADO);
     ComboLista.Add('1'); ComboDatos.Add(CoAUTORIZADO);
     ComboLista.Add('2'); ComboDatos.Add(CoCANCELADO);
  end;

  F_ALTA:= CreaCampo('F_ALTA', ftDate, tsNinguno, tsNinguno, True);
  CVE_USU_ALTA:= CreaCampo('CVE_USU_ALTA', ftString, tsNinguno, tsNinguno, True);
  F_AUTORIZA:= CreaCampo('F_AUTORIZA', ftDate, tsNinguno, tsNinguno, True);
  CVE_USU_AUTORIZA:= CreaCampo('CVE_USU_AUTORIZA', ftString, tsNinguno, tsNinguno, True);
  F_CANCELA:= CreaCampo('F_CANCELA', ftDateTime, tsNinguno, tsNinguno, True);
  CVE_USU_CANCELA:= CreaCampo('CVE_USU_CANCELA', ftString, tsNinguno, tsNinguno, True);


  {$WARNINGS OFF}
  Credito := TCrCredito.Create(Self);
  {$WARNINGS ON}
  Credito.MasterSource:=Self;
  Credito.FilterString:= ' SIT_CREDITO IN (''AC'', ''LQ'' )' ;
  Credito.BuscaWhereString := Credito.FilterString ;

  {$WARNINGS OFF}
  ContratoCre := TCrCto.Create(Self);
  {$WARNINGS ON}
  ContratoCre.MasterSource:=Self;

  {$WARNINGS OFF}
  Operacion := TCrOperaci.Create(Self);
  {$WARNINGS ON}
  Operacion.MasterSource:=Self;

  {$WARNINGS OFF}
  MovPPP := TCrMovPPP.Create(Self);
  {$WARNINGS ON}
  MovPPP.MasterSource:=Self;

  FKeyFields.Add('ID_CREDITO');
  FKeyFields.Add('CVE_PPO_MOV');
  FKeyFields.Add('ID_GRUPO_TRANSAC');

  TableName:= 'CR_PPO_MOV_PREMIO';
  UseQuery  := True;
  HelpFile  := 'IntCrRegPPP.Hlp';
  ShowMenuReporte:=False;

end;

Destructor TCrRegPPP.Destroy;
begin
  If Credito <> Nil then
     Credito.Free ;
  If ContratoCre<>Nil then
     ContratoCre.Free ;
  If Operacion <> Nil then
     Operacion.Free ;

  inherited;
end;


function TCrRegPPP.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrRegPPP;
begin
   W:=TWCrRegPPP.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.ShowBtnEliminar:= False ;
      W.InterForma1.ShowBtnModificar := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrRegPPP.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrRegPPP.it','F,S,F');
      Try if Active then begin
             T.Param(0,ID_CREDITO.AsString);
             T.Param(1,CVE_PPO_MOV.AsString);
             T.Param(2,ID_GRUPO_TRANSAC.AsString);
          end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1), T.DameCampo(2)]);
      finally  T.Free;
      end;
end;

function TCrRegPPP.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA de NINGUNO**************************)
(*                                                                                       *)
(*  FORMA DE NINGUNO                                                                     *)
(*                                                                                       *)
(***********************************************FORMA de NINGUNO**************************)

function TWCrRegPPP.TasaIVA: Double;
const coSQL = 'SELECT PKGCRCOMUN.STPOBTPCTIVA( %d, NULL, %s ) PCT_IVA FROM DUAL';
var vlPctIVA   : Real;
    IdContrato : Integer;
begin
  Result := 0;
  IdContrato := Objeto.Credito.ID_CONTRATO.AsInteger;
  GetSQLFloat(Format( coSQL, [ IdContrato, '0' ] ),
              Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'PCT_IVA',
              vlPctIVA,   False );
  Result :=  vlPctIVA / 100 ;
end;

function TWCrRegPPP.ImportePPP(Cred: Integer): Currency;
var sSql: String;
    Imp : Real ;
begin
   sSQL:= 'SELECT NVL((IMP_PREMIO + IMP_IVA_PREMIO), 0) AS IMP FROM CR_PPO_PREMIO WHERE ID_CREDITO = '+IntToStr(Cred)+' ' ;
   If GetSQLFloat(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'IMP', Imp, True) then
      ImportePPP:= Imp
   else
      ImportePPP:= 0;
end;

Function TWCrRegPPP.RevisaFacturasElectronicas:Integer;
var vlsql :  String;
    vlQry : TQuery;
    vlIdTransac : Integer;
begin
   RevisaFacturasElectronicas:=0;
   // Se busca primero el id_transaccion en donde quedó la transaccion de pago
   vlsql := 'SELECT CT.ID_TRANSACCION '+coCRLF+
            'FROM CR_PPO_MOV_PREMIO MOV, CR_PPO_REL_MOV_OPE REL, CR_TRANSACCION CT '+coCRLF+
            'WHERE MOV.CVE_PPO_MOV = REL.CVE_PPO_MOV '+coCRLF+
            '  AND MOV.ID_CREDITO = CT.ID_CREDITO '+coCRLF+
            '  AND MOV.ID_GRUPO_TRANSAC = CT.ID_GRUPO_TRANSAC '+coCRLF+
            '  AND REL.CVE_OPERACION = CT.CVE_OPERACION '+coCRLF+
            '  AND REL.B_AFECTA_CHEQ = ''V'' '+coCRLF+
            '  AND MOV.ID_CREDITO = ' +  Objeto.ID_CREDITO.AsString +coCRLF+
            '  AND MOV.ID_GRUPO_TRANSAC = ' + Objeto.ID_GRUPO_TRANSAC.AsString;

   GetSQLInt(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'ID_TRANSACCION', vlIdTransac, False) ;

   // Con el id_transaccion se valida si el comprobante esta cancelado. 
   vlsql:=' SELECT SERIE_RECIBO, SIT_COMPROBANTE, SIT_PROCESO, F_OPERACION '+coCRLF+
          '   FROM SFE_COMPROBANTE '+coCRLF+
          '  WHERE ID_CESION = '+Objeto.ID_CREDITO.AsString +coCRLF+
          '   AND ID_TRANSACCION = ' + IntToStr(vlIdTransac) ;

   vlQry := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   try
      if vlQry <> nil then
      begin
         if vlQry.FieldByName('SIT_COMPROBANTE').AsString = '1' then
         begin
            if vlQry.FieldByName('SIT_PROCESO').AsString = '1' then RevisaFacturasElectronicas:=1;
            if vlQry.FieldByName('SIT_PROCESO').AsString = '0' then RevisaFacturasElectronicas:=2;
         end;
         if vlQry.FieldByName('SIT_COMPROBANTE').AsString = '0' then
         begin
            if vlQry.FieldByName('SIT_PROCESO').AsString = '1' then RevisaFacturasElectronicas:=0;
            if vlQry.FieldByName('SIT_PROCESO').AsString = '0' then RevisaFacturasElectronicas:=2;
         end;
      end;
   finally
      if vlQry <> nil then vlQry.free;
   end;
end;

Function TWCrRegPPP.InsTransPPP(Cred: Integer; Mov: String; Imp, Iva: Currency): Boolean;
var STPTransPPP: TStoredProc ;
begin
   try
     StpTransPPP := TStoredProc.Create(Self);
     vlgIdGpoTrans := '0';     
     with StpTransPPP do
     begin
        //Inicia el SPT
        StpTransPPP.DatabaseName:= Objeto.Apli.DatabaseName;
        StpTransPPP.SessionName:= Objeto.Apli.SessionName;
        StpTransPPP.StoredProcName:= 'PKGCRPPO.STPTRANSPPP';
        Params.Clear;
        Params.CreateParam(ftInteger,    'peIdCredito', ptInput);
        Params.CreateParam(ftString,    'peCveMovPPO', ptInput);
        Params.CreateParam(ftFloat,    'peImporteP', ptInput);
        Params.CreateParam(ftFloat,    'peImporteI', ptInput);
        Params.CreateParam(ftString,    'peBCommit', ptInput);
        Params.CreateParam(ftString,    'peCveUsuAlta', ptInput);
        Params.CreateParam(ftFloat,  'psTotalComis', ptOutput);
        Params.CreateParam(ftInteger,  'psIdGrupoTrans', ptOutput);
        Params.CreateParam(ftFloat,   'PSResultado',  ptOutput);
        Params.CreateParam(ftString,  'PSTxResultado',ptOutput);
        Prepare;
        ParamByName('peIdCredito').AsInteger := Cred;
        ParamByName('peCveMovPPO').AsString := Mov;
        ParamByName('peImporteP').AsFloat := Imp;
        ParamByName('peImporteI').AsFloat := Iva;
        ParamByName('peBCommit').AsString := 'V';
        ParamByName('peCveUsuAlta').AsString := Objeto.Apli.Usuario;
        ExecProc;

        if (ParamByName('psResultado').AsInteger <> 0) then
        Begin
           InsTransPPP:=false;

           ShowMessage( IntToStr(ParamByName('psResultado').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
        end
        else
           InsTransPPP:=true;
        vlgIdGpoTrans := ParamByName('psIdGrupoTrans').AsString
     end;
   finally
      StpTransPPP.Free;
   end;
end ;

Function TWCrRegPPP.CancMovPPP(Cred, TransGpo: Integer; Mov: String; Imp, Iva: Currency; Accion: Integer): Boolean ;
var StpCancelMovPPP: TStoredProc ;
begin
   Case Accion of
       1: begin
             try
               StpCancelMovPPP := TStoredProc.Create(Self);
               with StpCancelMovPPP do
               begin
                  //Inicia el SPT
                  StpCancelMovPPP.DatabaseName:= Objeto.Apli.DatabaseName;
                  StpCancelMovPPP.SessionName:= Objeto.Apli.SessionName;
                  StpCancelMovPPP.StoredProcName:= 'PKGCRPPO.STPCANCELAMOVPPP';
                  Params.Clear;
                  Params.CreateParam(ftInteger,    'peIdCredito', ptInput);
                  Params.CreateParam(ftString,    'peCveMovPPO', ptInput);
                  Params.CreateParam(ftInteger,    'peIdTransaccion', ptInput);
                  Params.CreateParam(ftFloat,    'peImporteP', ptInput);
                  Params.CreateParam(ftFloat,    'peImporteI', ptInput);
                  Params.CreateParam(ftString,    'peBCommit', ptInput);
                  Params.CreateParam(ftString,    'peCveUsuCancel', ptInput);
                  Params.CreateParam(ftFloat,  'psTotalComis', ptOutput);
                  Params.CreateParam(ftFloat,   'PSResultado',  ptOutput);
                  Params.CreateParam(ftString,  'PSTxResultado',ptOutput);
                  Prepare;
                  ParamByName('peIdCredito').AsInteger := Cred;
                  ParamByName('peCveMovPPO').AsString := Mov;
                  ParamByName('peIdTransaccion').AsInteger:= TransGpo ;
                  ParamByName('peImporteP').AsFloat := Imp;
                  ParamByName('peImporteI').AsFloat := Iva;
                  ParamByName('peBCommit').AsString := 'V';
                  ParamByName('peCveUsuCancel').AsString := Objeto.Apli.Usuario;
                  ExecProc;

                  if (ParamByName('psResultado').AsInteger <> 0) then
                  Begin
                     CancMovPPP:=false;

                     ShowMessage( IntToStr(ParamByName('psResultado').AsInteger)  + ' : ' +
                                  ParamByName('psTxResultado').AsString );
                  end
                  else
                     CancMovPPP:=true;
               end;
             finally
                StpCancelMovPPP.Free;
             end;
          end ; /// 1

       2: begin
             try
               StpCancelMovPPP := TStoredProc.Create(Self);
               with StpCancelMovPPP do
               begin
                  //Inicia el SPT
                  StpCancelMovPPP.DatabaseName:= Objeto.Apli.DatabaseName;
                  StpCancelMovPPP.SessionName:= Objeto.Apli.SessionName;
                  StpCancelMovPPP.StoredProcName:= 'PKGCRPPO.STPDETPPP';
                  Params.Clear;
                  Params.CreateParam(ftInteger,    'peIdCredito', ptInput);
                  Params.CreateParam(ftString,     'peCveMovPPO', ptInput);
                  Params.CreateParam(ftInteger,    'peIdTransaccion', ptInput);
                  Params.CreateParam(ftFloat,      'peImporteP', ptInput);
                  Params.CreateParam(ftFloat,      'peImporteI', ptInput);
                  Params.CreateParam(ftFloat,      'peImporteN', ptInput);
                  Params.CreateParam(ftString,     'peSitDetPPO', ptInput);
                  Params.CreateParam(ftString,     'peIdCheqCte', ptInput);
                  Params.CreateParam(ftDate,       'peFAlta', ptInput);
                  Params.CreateParam(ftString,     'peCveUsuAlta', ptInput);
                  Params.CreateParam(ftDate,       'peFAut', ptInput);
                  Params.CreateParam(ftString,     'peCveUsuAut', ptInput);
                  Params.CreateParam(ftDate,       'peFCancel', ptInput);
                  Params.CreateParam(ftString,     'peCveUsuCancel', ptInput);
                  Params.CreateParam(ftString,     'peBCommit', ptInput);
                  Params.CreateParam(ftFloat,   'PSResultado',  ptOutput);
                  Params.CreateParam(ftString,  'PSTxResultado',ptOutput);
                  Prepare;
                  ParamByName('peIdCredito').AsInteger := Cred;
                  ParamByName('peCveMovPPO').AsString := Mov;
                  ParamByName('peIdTransaccion').AsInteger:= TransGpo ;
                  ParamByName('peImporteP').AsFloat := Imp;
                  ParamByName('peImporteI').AsFloat := Iva;
                  ParamByName('peImporteN').AsFloat := Imp + Iva;
                  ParamByName('peSitDetPPO').AsString := coCANCELADO;
                  ParamByName('peIdCheqCte').AsString := '';
                  ParamByName('peFAlta').AsDate := Date ;
                  ParamByName('peCveUsuAlta').AsString := Objeto.Apli.Usuario;
                  ParamByName('peFAut').AsDate := Date ;
                  ParamByName('peCveUsuAut').AsString := Objeto.Apli.Usuario;
                  ParamByName('peFCancel').AsDate := Date ;
                  ParamByName('peCveUsuCancel').AsString := Objeto.Apli.Usuario;
                  ParamByName('peBCommit').AsString := 'V';
                  ExecProc;

                  if (ParamByName('psResultado').AsInteger <> 0) then
                  Begin
                     CancMovPPP:=false;

                     ShowMessage( IntToStr(ParamByName('psResultado').AsInteger)  + ' : ' +
                                  ParamByName('psTxResultado').AsString );
                  end
                  else
                     CancMovPPP:=true;
               end;
             finally
                StpCancelMovPPP.Free;
             end;
          end ; /// 2

   End ; //case
end ;

Function TWCrRegPPP.ValidaCantidades: Boolean ;
var sSQL: String ;
    Importe: Real ;
Begin
   Objeto.IMP_BRUTO.GetFromControl;
   Objeto.IMP_NETO.GetFromControl ;
   Objeto.ID_CREDITO.GetFromControl ;

   Importe:= ImporteProvis(Objeto.ID_CREDITO.AsInteger);
   Importe:= Importe - Objeto.IMP_BRUTO.AsFloat ;
   ValidaCantidades:= not((Objeto.MovPPP.CVE_AFECTA_PREMIO.AsString = 'D') and (Importe < 0)) ;
end;

procedure TWCrRegPPP.FormShow(Sender: TObject);
begin
    lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
    lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

    Objeto.ID_CREDITO.Control:=edID_CESION;
    Objeto.CVE_PPO_MOV.Control:= edCVE_PPO_MOV;
    Objeto.Credito.ID_CREDITO.Control:= edID_CESION ;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
    Objeto.Credito.GetParams(Objeto);
    edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
    edCESION.ShowHint := True;

    Objeto.MovPPP.CVE_PPO_MOV.Control:= edCVE_PPO_MOV ;
    Objeto.MovPPP.DESC_PPO_MOV.Control := edDESC_MOV_PPP ;

    Objeto.IMP_BRUTO.Control := edIMP_BRU;
    Objeto.IMP_IVA.Control := edIMP_IVA;
    Objeto.IMP_NETO.Control := edIMP_NETO;
    Objeto.F_ALTA.Control:= edF_ALTA;
    Objeto.CVE_USU_ALTA.Control:= edCVE_USUA_ALTA;
    Objeto.F_AUTORIZA.Control:= edF_AUTORIZA;
    Objeto.CVE_USU_AUTORIZA.Control:= edCVE_USUA_AUTORIZA;
    Objeto.F_CANCELA.Control:= edF_CANCELA;
    Objeto.CVE_USU_CANCELA.Control:= edCVE_USUA_CANCELA;

    icpCONTRATO.Frame := Objeto.Credito.ContratoCre.Contrato;
    InterForma1.MsgPanel := MsgPanel;
end;

procedure TWCrRegPPP.FormDestroy(Sender: TObject);
begin
    Objeto.ID_CREDITO.Control:=nil;
    Objeto.CVE_PPO_MOV.Control:= nil;

    Objeto.IMP_BRUTO.Control := nil;
    Objeto.IMP_IVA.Control := nil;
    Objeto.IMP_NETO.Control := nil;
    Objeto.F_ALTA.Control:= nil;
    Objeto.CVE_USU_ALTA.Control:= nil ;
    Objeto.F_AUTORIZA.Control:= nil ;
    Objeto.CVE_USU_AUTORIZA.Control:= nil ;
    Objeto.F_CANCELA.Control:= nil ;
    Objeto.CVE_USU_CANCELA.Control:= nil ;

    Objeto.Credito.ID_CREDITO.Control:=nil ;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control:=nil;

    Objeto.MoVPPP.CVE_PPO_MOV.Control:=nil;
    Objeto.MovPPP.DESC_PPO_MOV.Control:= nil;
end;

procedure TWCrRegPPP.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrRegPPP.InterForma1DespuesNuevo(Sender: TObject);
var SQLText : String ;
          id: Integer ;
begin //<<Control>>.SetFocus;
   vgActualiza := true ;
   Objeto.SIT_PPO_MOV_PREMIO.AsString:= CoNOAUTORIZADO ;
   Objeto.ID_GRUPO_TRANSAC.AsInteger:= 0 ;
   Objeto.F_ALTA.AsDateTime:= Date;
   Objeto.CVE_USU_ALTA.AsString:= Objeto.Apli.Usuario;
   Objeto.Credito.Active := False;
   lbChequera.Visible := False;
   edChequera.Visible := False;
   edChequera.Text := '';
   DatosPremio;
   Situacion;
   btAUTORIZA.Enabled := False;
   btCANCELA.Enabled := False;
   edID_CESION.SetFocus;
end;

procedure TWCrRegPPP.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
   vgActualiza := true ;
   btAUTORIZA.Enabled := False;
   btCANCELA.Enabled := False;
end;

procedure TWCrRegPPP.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   Objeto.ID_CREDITO.GetFromControl;
   Objeto.CVE_PPO_MOV.GetFromControl;
   Objeto.IMP_BRUTO.GetFromControl;
   Objeto.IMP_IVA.GetFromControl;

   If  (Objeto.ID_CREDITO.AsString='') or (Objeto.CVE_PPO_MOV.AsString='')
     or (Objeto.IMP_BRUTO.AsString='') or (Objeto.IMP_IVA.AsString='')
     or (Objeto.IMP_BRUTO.AsFloat=0) or (Objeto.IMP_IVA.AsFloat=0) then
   begin
      MessageDlg('Falta capturar datos. Por favor revise la captura.', mtError, [mbOK], 0);
      Realizado:= False ;
      vgActualiza := False ;
      Exit ;
   end ;

   If IsNewData then    //nuevo
   Begin
      Objeto.IMP_BRUTO.AsFloat:= StrToFloat(TrimChar(Objeto.IMP_BRUTO.AsString,'$,-()><"#&%') ) ;
      Objeto.IMP_IVA.AsFloat:= StrToFloat(TrimChar(Objeto.IMP_IVA.AsString,'$,-()><"#&%') ) ;
      Objeto.IMP_NETO.AsFloat:= StrToFloat(TrimChar(Objeto.IMP_NETO.AsString,'$,-()><"#&%') ) ;
      if MessageDlg('¿Desea almacenar los datos capturados?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
            Realizado:= True //;
         else
            Realizado:= False ;
   End ; //cambio situacion
end;

procedure TWCrRegPPP.Situacion;
var s: String ;
begin
   s:= '' ;
   btAUTORIZA.Enabled:= False;
   btCANCELA.Enabled:= False;
   edSituacion.Font.Color:= clBlack ;

   if Objeto.SIT_PPO_MOV_PREMIO.AsString = CoNOAUTORIZADO then
      begin
        s:= 'NO AUTORIZADO' ;
        edSituacion.Font.Color:= clBlack ;  //otro color?
        btAUTORIZA.Enabled:= True ;
        btCANCELA.Enabled:= True ;
      end ;
   if Objeto.SIT_PPO_MOV_PREMIO.AsString = CoAUTORIZADO then
      begin
        s:= 'AUTORIZADO' ;
        edSituacion.Font.Color:= clLime;
        btAUTORIZA.Enabled:= False ;
        btCANCELA.Enabled:= True;
      end ;
   if Objeto.SIT_PPO_MOV_PREMIO.AsString = CoCANCELADO then
      begin
        s:= 'CANCELADO';
        edSituacion.Font.Color:= clRed ;
        btAUTORIZA.Enabled:= False ;
        btCANCELA.Enabled:= False ;
      end ;

   edSituacion.Text := s;
end ;

procedure TWCrRegPPP.InterForma1Buscar(Sender: TObject);
var TotPPP: Currency ;
begin
   Objeto.FilterString:= Objeto.BuscaWhereString;
   If Objeto.InternalBusca then
      begin
         Objeto.Credito.FindKey([Objeto.ID_CREDITO.AsString]) ;
         edCESION.Text:= Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString ;
         icpCONTRATO.RefrescaInfo; //REFRESCA LA INFORMACIÓN DEL CREDITO
         Objeto.MovPPP.FindKey([Objeto.CVE_PPO_MOV.AsString]) ;
         edDESC_MOV_PPP.Text:= Objeto.MovPPP.DESC_PPO_MOV.AsString;
         Situacion;
         DatosPremio;
         DatosChequera;
         if (Objeto.SIT_PPO_MOV_PREMIO.AsString = CoAUTORIZADO) and (EmiteTraspCheq) then   // INSTRUCCION PARA TRASPASO A CHEQUERAS JFOF 28/FEB/2013
         begin
           InterForma1.ShowBtnImprimir := True;
         end
         else
         begin
           InterForma1.ShowBtnImprimir := False;
         end;
      end
   else
     begin
       edImportePremio.Text := '0';
       edImporteIVAPremio.Text := '0';
       edImporteTotalPremio.Text := '0';
       edImpProvisionado.Text := '0';
     end;
end;

procedure TWCrRegPPP.MensajeAdvierte ;
begin
   ShowMessage('.');
end ;

procedure TWCrRegPPP.edCVE_PPO_MOVExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edCVE_PPO_MOV,True,'',True);
end;

procedure TWCrRegPPP.bbCveMovPPPClick(Sender: TObject);
var
  bOK:Boolean;
  sql : String;
  vlCheqCte: String;
begin
   Objeto.MovPPP.ShowAll := True;
   If Objeto.MovPPP.Busca Then
   begin
      bOK := not ExisteRegistro;
      if not bOK then
      begin
         Objeto.MovPPP.Active := False;
         edCVE_PPO_MOV.SetFocus;
      end
      else
      begin
        if Objeto.MovPPP.CVE_PPO_MOV.AsString = 'PAGTOT' then
        begin
          edIMP_BRU.Text := edImpProvisionado.Text;
          CalculaTotal;
        end
        else
        begin
          edIMP_BRU.Text := '0';
          edIMP_IVA.Text := '0';
          edIMP_NETO.Text := '0';
        end;

        DatosChequera;

        InterForma1.NextTab(bbCveMovPPP);
      end;
   End;
end;

procedure TWCrRegPPP.btID_CESIONClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
      icpCONTRATO.RefrescaInfo; //REFRESCA LA INFORMACIÓN DEL CREDITO
      DatosPremio;
      InterForma1.NextTab(btID_CESION);
   End;
end;

procedure TWCrRegPPP.edIMP_BRUExit(Sender: TObject);
var    vlMsg: String;
    vlSalida: Boolean ;
begin
   vlMsg:= '' ;
   vlSalida:= True ;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      begin
         Objeto.CVE_PPO_MOV.GetFromControl;
         if Objeto.CVE_PPO_MOV.AsString = 'PAGTOT' then
         begin
           if StrToFloat(edIMP_BRU.Text) = StrToFloat(edImpProvisionado.Text) then
              vlSalida := True
           else
           begin
             vlSalida := False;
             vlMsg:='En un movimiento de pago total el importe debe ser el provisionado.' ;
             edIMP_BRU.Text := edImpProvisionado.Text;
             CalculaTotal;
           end;
         end
         Else
         begin
           CalculaTotal ;
           vlSalida:= ValidaCantidades;
           if not (vlSalida) then
              vlMsg:='El importe del movimiento es mayor que el importe provisionado.' ;
         end;
         InterForma1.ValidaExit(edIMP_BRU,vlSalida,vlMsg,True);
      end ;
end;

procedure TWCrRegPPP.CalculaTotal ;
begin
   Objeto.IMP_BRUTO.GetFromControl ;
   Objeto.IMP_IVA.AsFloat:= Objeto.IMP_BRUTO.AsFloat*TasaIva;
   Objeto.IMP_NETO.AsFloat:= Objeto.IMP_BRUTO.AsFloat+Objeto.IMP_IVA.AsFloat;
   Objeto.IMP_BRUTO.AsFloat:= Objeto.IMP_BRUTO.AsFloat;
end ;

procedure TWCrRegPPP.btAUTORIZAClick(Sender: TObject);
var vlidcredit : String;
begin
if Objeto.ValidaAccesoEsp('TCRREGPPP_AUTOR',True,True) then  // JFOF 13/03/2013 FUNCION DE SEGURIDADES
  begin
     If (Objeto.SIT_PPO_MOV_PREMIO.AsString = CoNOAUTORIZADO) then
     begin
       if MessageDlg('¿Desea autorizar el movimiento de esta disposición?'+#13+
                      'Seran colocadas las transacciones que dicho movimiento genera.', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
        begin
           If InsTransPPP( Objeto.ID_CREDITO.AsInteger, Objeto.CVE_PPO_MOV.AsString, Objeto.IMP_BRUTO.AsFloat, Objeto.IMP_IVA.AsFloat) then
           begin
              vlidcredit := Objeto.ID_CREDITO.AsString;
              Objeto.FindKey([Objeto.ID_CREDITO.AsString, Objeto.CVE_PPO_MOV.AsString, vlgIdGpoTrans]);
              DatosPremio;
              Situacion;
              MessageDlg('Las transacciones de afectación de este movimiento'+#13+'han sido colocadas exitosamente. ', mtConfirmation, [mbOK], 0);
              if (Objeto.SIT_PPO_MOV_PREMIO.AsString = CoAUTORIZADO) and (EmiteTraspCheq) then
                  ImprimeReporte(True, vlidcredit, vlgIdGpoTrans); //IMPRIME ACUSE DE TRASPASO A CHEQUERAS JFOF 01/03/2013
           end ;
        end ;
     end
     else
        ShowMessage('No es posible autorizar el movimiento.') ;
  end;
end;

procedure TWCrRegPPP.btCANCELAClick(Sender: TObject);
var vlRevFacElec : Integer;
    vlErrFacElec : String;
begin
if Objeto.ValidaAccesoEsp('TCRREGPPP_CANC',True,True) then  // JFOF 13/03/2013 FUNCION DE SEGURIDADES
  begin
     IF (Objeto.SIT_PPO_MOV_PREMIO.AsString) <> CoCANCELADO THEN
        BEGIN
           If (Objeto.SIT_PPO_MOV_PREMIO.AsString = CoAUTORIZADO) then  //CoAUTORIZADO
           begin
             if MessageDlg('¿Desea cancelar el movimiento y transacciones relacionadas?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
              begin

                  vlRevFacElec:= RevisaFacturasElectronicas;
                  if vlRevFacElec = 0 then
                  begin
                    if CancMovPPP( Objeto.ID_CREDITO.AsInteger, Objeto.ID_GRUPO_TRANSAC.AsInteger, Objeto.CVE_PPO_MOV.AsString, Objeto.IMP_BRUTO.AsFloat, Objeto.IMP_IVA.AsFloat, 1) then
                       begin
                         Objeto.FindKey([Objeto.ID_CREDITO.AsString, Objeto.CVE_PPO_MOV.AsString, Objeto.ID_GRUPO_TRANSAC.AsString]);
                         DatosPremio;
                         Situacion;
                         MessageDlg('Las transacciones de afectación de este movimiento'+#13+'han sido canceladas exitosamente. ', mtConfirmation, [mbOK], 0) ;
                       end
                    else
                        MessageDlg('Se ha producido un error en la cancelación. ', mtError, [mbOK], 0);
                  end
                  else
                  begin
                    if vlRevFacElec = 1 then
                       vlErrFacElec:= 'Existen Facturas Electronicas asociadas, es necesario CANCELARLAS';
                    if vlRevFacElec = 2 then
                       vlErrFacElec:= 'Existen Facturas Electronicas asociadas por procesar, es necesario PROCESARLAS y CANCELARLAS';
                    ShowMessage(vlErrFacElec);
                  end;

              end ;
           end  //CoAUTORIZADO
           else // CoNOAUTORIZADO
           begin
             if MessageDlg('¿Desea cancelar el movimiento?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
              begin
                  if CancMovPPP( Objeto.ID_CREDITO.AsInteger, Objeto.ID_GRUPO_TRANSAC.AsInteger, Objeto.CVE_PPO_MOV.AsString, Objeto.IMP_BRUTO.AsFloat, Objeto.IMP_IVA.AsFloat, 2) then
                     begin
                       Objeto.FindKey([Objeto.ID_CREDITO.AsString, Objeto.CVE_PPO_MOV.AsString, Objeto.ID_GRUPO_TRANSAC.AsString]);
                       MessageDlg('El movimiento ha sido cancelado exitosamente. ', mtConfirmation, [mbOK], 0) ;
                       DatosPremio;
                     end
                  else
                      MessageDlg('Se ha producido un error en la cancelacion. ', mtError, [mbOK], 0);
              end ;
           end ; // CoNOAUTORIZADO
        END
     ELSE
        ShowMessage('No es posible cancelar el movimiento.') ;
  end;
end;

procedure TWCrRegPPP.ilCesionEjecuta(Sender: TObject);
begin
   if Objeto.Credito.FindKey([ilCesion.Buffer]) then
   begin
      icpCONTRATO.RefrescaInfo; //REFRESCA LA INFORMACIÓN DEL CREDITO
      DatosPremio;
      InterForma1.NextTab(edID_CESION);
   end;
end;

procedure TWCrRegPPP.ilCVE_PPO_MOVEjecuta(Sender: TObject);
var
  bOK :Boolean;
begin
   if Objeto.MovPPP.FindKey([ilCVE_PPO_MOV.Buffer]) then
   begin
      bOK := not ExisteRegistro;
      if not bOK then
      begin
         Objeto.MovPPP.Active := False;
         edCVE_PPO_MOV.SetFocus;
      end
      else
      begin
        if Objeto.MovPPP.CVE_PPO_MOV.AsString = 'PAGTOT' then
        begin
          edIMP_BRU.Text := edImpProvisionado.Text;
          CalculaTotal;
        end
        else
        begin
          edIMP_BRU.Text := '0';
          edIMP_IVA.Text := '0';
          edIMP_NETO.Text := '0';
        end;
        InterForma1.NextTab(edCVE_PPO_MOV);
      end;
   End;

end;

Function TWCrRegPPP.ExisteRegistro:Boolean;
var
  vlMsg, sSQL: String ;
  qy: TQuery ;
begin
  ExisteRegistro := False;
  vlMsg     := '';
  sSQL:= 'SELECT ID_CREDITO, CVE_PPO_MOV, ID_GRUPO_TRANSAC FROM CR_PPO_MOV_PREMIO '+
         ' WHERE ID_CREDITO = '  + Objeto.Credito.ID_CREDITO.AsString +
         ' AND CVE_PPO_MOV = '   + SQLStr(Objeto.MovPPP.CVE_PPO_MOV.AsString) +
         ' AND SIT_PPO_MOV_PREMIO = ' + SQLStr(CoNOAUTORIZADO) +
         ' AND ID_GRUPO_TRANSAC = 0 ';
   qy:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
   If qy <> Nil Then Begin
      If qy.RecordCount > 0 Then Begin
         vlMsg := 'YA Existe un movimiento con clave '+Objeto.MovPPP.CVE_PPO_MOV.AsString+' para la disposicion '+Objeto.Credito.ID_CREDITO.AsString+#13+
                  'en espera de ser autorizado o cancelado. ';
         ExisteRegistro := True;
         ShowMessage(vlMsg);
      End;
      qy.Free;
   End;
end;

procedure TWCrRegPPP.DatosPremio;
var
  sSql : String;
  qry  : TQuery;
  vlIdCredito :Integer;
begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  begin
    Objeto.ID_CREDITO.GetFromControl;
    vlIdCredito := Objeto.ID_CREDITO.AsInteger;
  end
  Else
  if not(Objeto.Credito.ID_CREDITO.IsNull)or not(Objeto.ID_CREDITO.IsNull) then
     vlIdCredito := Objeto.Credito.ID_CREDITO.AsInteger
  else
     vlIdCredito := 0;

  IF vlIdCredito <> 0 THEN
  BEGIN
    sSql := 'SELECT IMP_PREMIO, IMP_IVA_PREMIO FROM CR_PPO_PREMIO WHERE ID_CREDITO = '+ InttoStr(vlIdCredito);

    qry := GetSQLQuery(sSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
    If qry <> Nil Then
    begin
      edImportePremio.Text := FloatToStr(qry.FieldByName('IMP_PREMIO').AsFloat);
      edImporteIVAPremio.Text := FloatToStr(qry.FieldByName('IMP_IVA_PREMIO').AsFloat);
      edImporteTotalPremio.Text := FloatToStr(qry.FieldByName('IMP_PREMIO').AsFloat + qry.FieldByName('IMP_IVA_PREMIO').AsFloat);
      qry.Free;
    end
    else
    begin
      edImportePremio.Text := '0';
      edImporteIVAPremio.Text := '0';
      edImporteTotalPremio.Text := '0';
    end;

    // IMPORTE PROVISIONADO
    sSql := 'SELECT PKGCRPPO.FUNOBTPROVPPO('+InttoStr(vlIdCredito)+', '+SQLFecha(Objeto.Apli.DameFechaEmpresa)+') IMP_PROVISION '+
            ' FROM DUAL ';

    qry := GetSQLQuery(sSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
    If qry <> Nil Then
    begin
      edImpProvisionado.Text := FloatToStr(qry.FieldByName('IMP_PROVISION').AsFloat);
    end
    else
    begin
      edImpProvisionado.Text := '0';
    end;
  END
  ELSE
  BEGIN
    edImportePremio.Text := '0';
    edImporteIVAPremio.Text := '0';
    edImporteTotalPremio.Text := '0';
    edImpProvisionado.Text := '0';
  END;
end;

procedure TWCrRegPPP.ImprimeReporte(bPreview: Boolean; vlidcredito, vlidtrans : String);
begin
TrasCheqe( vlidcredito, vlidtrans, bPreview,
           Objeto.Apli);
end;

procedure TWCrRegPPP.InterForma1BtnImprimirClick(Sender: TObject);
begin
  ImprimeReporte(True, objeto.ID_CREDITO.AsString, objeto.ID_GRUPO_TRANSAC.AsString);
end;


function TWCrRegPPP.EmiteTraspCheq: Boolean;
var
  sSQL: String ;
  vlHay:Integer;
begin
  EmiteTraspCheq := False;

  sSQL := 'SELECT COUNT(*) HAY '+
          'FROM CR_PPO_MOV MOV, CR_PPO_REL_MOV_OPE REL '+
          'WHERE MOV.CVE_PPO_MOV = REL.CVE_PPO_MOV ' +
          '  AND REL.B_AFECTA_CHEQ = ''V'' '+
          '  AND MOV.CVE_PPO_MOV = ''' + Objeto.CVE_PPO_MOV.AsString + '''';

   GetSQLInt(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'HAY', vlHay, False) ;
   if vlHay <> 0 then
      EmiteTraspCheq := True;
end;

function TWCrRegPPP.ImporteProvis(Cred: Integer): Currency;
var
    sSql : String;
    qry  : TQuery;
begin
  // IMPORTE PROVISIONADO
  sSql := 'SELECT PKGCRPPO.FUNOBTPROVPPO('+IntToStr(Cred)+', '+SQLFecha(Objeto.Apli.DameFechaEmpresa)+') IMP_PROVISION '+
          ' FROM DUAL ';

  qry := GetSQLQuery(sSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
  If qry <> Nil Then
    ImporteProvis := qry.FieldByName('IMP_PROVISION').AsFloat
  else
    ImporteProvis := 0;
end;

procedure TWCrRegPPP.edID_CESIONExit(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
     InterForma1.ValidaExit(edID_CESION,True,'',True);
end;

procedure TWCrRegPPP.InterForma1DespuesAceptar(Sender: TObject);
begin
  Situacion;
end;

procedure TWCrRegPPP.DatosChequera;
var
  sql, vlCheqCte :String;
begin
  If (Objeto.MovPPP.Active) and (Objeto.MovPPP.B_GENERA_FACTURA.AsString = 'V') then
  begin
    lbChequera.Visible := True;
    edChequera.Visible := True;
    sql := 'SELECT PKGCRPERIODO.STPObtChqCte('+Objeto.Credito.ContratoCre.Contrato.ID_Titular.AsString+
           ', ''0'', '+Objeto.Credito.ID_CREDITO.AsString+ ', ''AC'', ''AD'', ''AB'') AS CheqCte FROM DUAL ';
    GetSQLStr(sql,Objeto.apli.DataBaseName, Objeto.Apli.SessionName, 'CHEQCTE', vlCheqCte, True);
    edChequera.Text := vlCheqCte;
  end
  else
  begin
    lbChequera.Visible := False;
    edChequera.Visible := False;
    edChequera.Text := '';
  end;
end;

procedure TWCrRegPPP.InterForma1DespuesCancelar(Sender: TObject);
begin
  Situacion;
  DatosChequera;

  If Objeto.ID_CREDITO.IsNull then
  begin
    edImportePremio.Text := '0';
    edImporteIVAPremio.Text := '0';
    edImporteTotalPremio.Text := '0';
    edImpProvisionado.Text := '0';
    edIMP_BRU.Text := '0';
    edIMP_IVA.Text := '0';
    edIMP_NETO.Text := '0';
  end
  else
  begin
    If Objeto.FindKey([Objeto.ID_CREDITO.AsString, Objeto.CVE_PPO_MOV.AsString, Objeto.ID_GRUPO_TRANSAC.AsString]) then
    begin
      Objeto.Credito.Findkey([Objeto.ID_CREDITO.AsInteger]);
      Objeto.MovPPP.FindKey([Objeto.CVE_PPO_MOV.AsString]);
      DatosChequera;
    end;
    DatosPremio;
  end;

end;

end.
