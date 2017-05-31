// Sistema         : Clase de CR_CRED_CHEQ
// Fecha de Inicio : 23/05/2003
// Función forma   : Clase de CR_CRED_CHEQ
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrCreChe;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
        IntParamCre,
        IntPers,
        IntCrEmisor,
        IntChCte,
        IntCrCredito,//Clase Credito
        IntGenCre,
        IntInter,
        IntCtto,
        IntMon,
        IntCrChqDll,
        IntCrSubPro,
        IntCrReCrCh,
        IntBasicCred,
        IntCrCartrIm,
        // RABA ENE 2012
        IntCrBitCheq  //Llama al reporte de bitácora
        ;

const   CTIPO = 'TIPO';
        CExisteAM       = 'EXISTEAM';
        CDiferenteAM    = 'DIFERAM';
        CESPREDET       = 'ESPREDET';
        C_AM_NO_PRED    = 'AM_NO_PRED';
        CPRED           = 'PRED';

type
  TCrCreChe= class;

  TWCrCredCheq=Class(TForm)
    InterForma1             : TInterForma;
    lbID_CREDITO : TLabel;
    edID_CREDITO : TEdit;
    lbID_ACREDITADO : TLabel;
    edID_ACREDITADO : TEdit;
    lbCUENTA_BANCO : TLabel;
    edCUENTA_BANCO : TEdit;
    rgCVE_TIP_OPE_CHQ : TRadioGroup;
    chB_PREDETERMINADA : TCheckBox;
    rgSIT_CHEQUERA : TRadioGroup;
    btACREDITADO: TBitBtn;
    edNOMBRE: TEdit;
    btCREDITO: TBitBtn;
    edDESC_CREDITO: TEdit;
    btCtaBanco: TBitBtn;
    edBANCO: TEdit;
    btREL_DISP_CHEQ: TBitBtn;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ilCREDITO: TInterLinkit;
    MsgPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    IEfechaAlta: TEdit;
    IEfechaModifica: TEdit;
    IEUsuarioAlta: TEdit;
    IEUsuarioModifica: TEdit;
    ilACREDITADO: TInterLinkit;
    chB_REL_CREDITO: TCheckBox;
    rgCVE_TIP_CHEQ: TRadioGroup;
    rgCVE_TIP_ACRED: TRadioGroup;
    lbSubDivision: TLabel;
    edCVE_EMISOR_NAFIN: TEdit;
    edNOMBRE_EMISOR_NAFIN: TEdit;
    btEmisNafin: TBitBtn;
    ilEmisorNafin: TInterLinkit;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    btMONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    ilMoneda: TInterLinkit;
    chB_CTA_TERCEROS: TCheckBox;
    btREPORTE: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure ilCREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure btACREDITADOClick(Sender: TObject);
    procedure btCtaBancoClick(Sender: TObject);
    procedure edID_ACREDITADOExit(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure btCtaBancoExit(Sender: TObject);
    procedure rgCVE_TIP_OPE_CHQExit(Sender: TObject);
    procedure chB_PREDETERMINADAExit(Sender: TObject);
    procedure rgSIT_CHEQUERAExit(Sender: TObject);
    procedure btREL_DISP_CHEQClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure ilCREDITOEjecuta(Sender: TObject);
    procedure btCREDITOClick(Sender: TObject);
    procedure chB_REL_CREDITOClick(Sender: TObject);
    procedure chB_REL_CREDITOExit(Sender: TObject);
    procedure chB_REL_CREDITOEnter(Sender: TObject);
    function  CountChequera(vlInd : String; vlTipo: String):Integer;
    function  CadenaSql(pTipo : String): String;
    Procedure UpdateCheqDet(vlIndic : Integer; vlCond : String);
    Function  BuscaPredeterminada : Boolean;
    procedure DefinePredeterminada;
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure rgCVE_TIP_ACREDExit(Sender: TObject);
    procedure rgCVE_TIP_CHEQExit(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure edCVE_EMISOR_NAFINExit(Sender: TObject);
    procedure btEmisNafinClick(Sender: TObject);
    procedure ilEmisorNafinCapture(Sender: TObject; var Show: Boolean);
    procedure ilEmisorNafinEjecuta(Sender: TObject);
    procedure rgCVE_TIP_ACREDClick(Sender: TObject);
    procedure chB_PREDETERMINADAClick(Sender: TObject);
    procedure btMONEDAClick(Sender: TObject);
    procedure ilMonedaEjecuta(Sender: TObject);
    procedure ilMonedaCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure chB_CTA_TERCEROSExit(Sender: TObject);
    procedure btREPORTEClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure rgSIT_CHEQUERAClick(Sender: TObject);
  private
    vgActualiza : Boolean;
    vgLiqMoneda : String;
    procedure ColocaTipoAcreditado;
  public
    { Public declarations }
    Objeto : TCrCreChe;

  end;

  { -------  }
  TCrCreChe= class(TInterFrame)
  private
  protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
        { Public declarations }
        VG_ACREDITADO            : String;
        VG_MONEDA                : String;
        VG_DISPOSICION           : String;
        VG_B_DISP_CHQ            : Boolean;
        VG_TIPO_ACRED            : String;
        VG_SUB_DIV               : String;
        VG_TIP_CHEQ              : String;
        VG_CHEQRA                : String;
        VG_BCO_CHQ               : String;

        ID_ACREDITADO            : TInterCampo;
        CVE_EMISOR_NAFIN         : TInterCampo;
        ID_CREDITO               : TInterCampo;
        CVE_TIPO_ACRED           : TInterCampo;
        CVE_TIPO_CHEQ            : TInterCampo;
        ID_BANCO_CHQRA           : TInterCampo;
        CUENTA_BANCO             : TInterCampo;
        CVE_TIP_OPE_CHQ          : TInterCampo;
        B_PREDETERMINADA         : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        SIT_CHEQUERA             : TInterCampo;
        CVE_MONEDA               : TInterCampo;
        B_REL_CREDITO            : TInterCampo;
        B_CTA_TERCEROS           : TInterCampo;
        ID_TITULAR               : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Persona                  : TPersona;
        Emisor                   : TCrEmisor;
        Credito                  : TCrCredito;
        Intermediario        	 : TIntermed;
        Moneda               	 : TMoneda;
        SubdivProcam             : TCrSubPro;
        BasicCred                : TBasicCred;
        RelDispChq               : TCrReCrCh;
        DetImpagado              : TCrCartrIm;
// RABA ENE 2012
        BitUpdCheq               : TCrBitCheq;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Function    ObtTitularCta : String;
  published
  end;



implementation
Uses IntMCtaAcr;    //Llama al reporte de cuentas por Acreditado


{$R *.DFM}

constructor TCrCreChe.Create( AOwner : TComponent );
begin
      Inherited;
      ID_ACREDITADO := CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,True);
      ID_ACREDITADO.Caption:='Acreditado';

      CVE_EMISOR_NAFIN := CreaCampo('CVE_EMISOR_NAFIN',ftString,tsNinguno,tsNinguno,True);
      CVE_EMISOR_NAFIN.Caption:='Cve Emisor Nafin';


      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
      ID_CREDITO.Caption:='Crédito';


      CVE_TIPO_ACRED :=CreaCampo('CVE_TIPO_ACRED',ftString,tsNinguno,tsNinguno,True);
      With CVE_TIPO_ACRED do
      begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(C_ACRED);
        ComboLista.Add('1'); ComboDatos.Add(C_PROCA);
        ComboLista.Add('2'); ComboDatos.Add(C_PROVE);
      end;

      CVE_TIPO_ACRED.Caption:='Tipo Acreditado';
      CVE_TIPO_CHEQ :=CreaCampo('CVE_TIPO_CHEQ',ftString,tsNinguno,tsNinguno,True);
      With CVE_TIPO_CHEQ do
      begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(C_ADMIN);
        ComboLista.Add('1'); ComboDatos.Add(C_LIQUI);
      end;

      CVE_TIPO_CHEQ.Caption:='Tipo Chequera';

      ID_BANCO_CHQRA :=CreaCampo('ID_BANCO_CHQRA',ftFloat,tsNinguno,tsNinguno,True);
      ID_BANCO_CHQRA.Caption:='Número de Banco Chqra';

      CUENTA_BANCO :=CreaCampo('CUENTA_BANCO',ftString,tsNinguno,tsNinguno,True);
      CUENTA_BANCO.Caption:='Cuenta / Banco';

      CVE_TIP_OPE_CHQ :=CreaCampo('CVE_TIP_OPE_CHQ',ftString,tsNinguno,tsNinguno,True);
      With CVE_TIP_OPE_CHQ do
      begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(C_CARGO);
        ComboLista.Add('1'); ComboDatos.Add(C_ABONO);
        ComboLista.Add('2'); ComboDatos.Add(C_AMBOS);
      end;
      CVE_TIP_OPE_CHQ.Caption:='Tipo de operación de la chequera';

      B_PREDETERMINADA :=CreaCampo('B_PREDETERMINADA',ftString,tsNinguno,tsNinguno,True);
      B_PREDETERMINADA.Caption:='Chequera Predeterminada';

      F_ALTA :=CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
      F_ALTA.Caption:='Fecha Alta';

      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA.Caption:='Clave de Usu Alta';

      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
      F_MODIFICA.Caption:='Fecha Modifica';

      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';

      SIT_CHEQUERA :=CreaCampo('SIT_CHEQUERA',ftString,tsNinguno,tsNinguno,True);
      With SIT_CHEQUERA do
      begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
        ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
      end;
      SIT_CHEQUERA.Caption:='Situación de la Chequera';

      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftInteger,tsNinguno,tsNinguno,True);
      CVE_MONEDA.Caption:='Cve. Moneda';

      B_REL_CREDITO :=CreaCampo('B_REL_CREDITO',ftString,tsNinguno,tsNinguno,True);
      B_REL_CREDITO.Caption:='Relaciona un Crédito';

      B_CTA_TERCEROS :=CreaCampo('B_CTA_TERCEROS',ftString,tsNinguno,tsNinguno,True);
      B_CTA_TERCEROS.Caption:='Cta. Terceros';

      ID_TITULAR :=CreaCampo('ID_TITULAR',ftInteger,tsNinguno,tsNinguno,True);
      ID_TITULAR.Caption:='Titular Cta.';

      {$WARNINGS OFF}
      DetImpagado := TCrCartrIm.Create(Self);
      {$WARNINGS ON}
      DetImpagado.MasterSource:=Self;
      DetImpagado.FieldByName('ID_ACREDITADO').MasterField:='ID_TITULAR';

      FKeyFields.Add('ID_ACREDITADO');
      FKeyFields.Add('CVE_TIPO_ACRED');
      FKeyFields.Add('CVE_EMISOR_NAFIN');
      FKeyFields.Add('CVE_TIPO_CHEQ');
      FKeyFields.Add('ID_CREDITO');
      FKeyFields.Add('ID_BANCO_CHQRA');
      FKeyFields.Add('CUENTA_BANCO');


      TableName := 'CR_CRED_CHEQ';
      UseQuery := True;
      HelpFile := 'IntCrCreChe.Hlp';
      ShowMenuReporte:=True;

      {$WARNINGS OFF}
      Persona := TPersona.Create(Self);
      {$WARNINGS ON}
      Persona.MasterSource:=Self;
      Persona.FieldByName('ID_PERSONA').MasterField:='ID_ACREDITADO';
      Persona.BuscaWhereString := ' (PERSONA.ID_PERSONA IN (SELECT ID_ACREDITADO FROM CR_ACREDITADO  ) '+
                                  ' OR PERSONA.ID_PERSONA IN (SELECT ID_ACREDITADO FROM CR_PROVEEDOR ))';
      Persona.FilterString := Persona.BuscaWhereString;

      {$WARNINGS OFF}
      Emisor := TCrEmisor.Create(Self);
      {$WARNINGS ON}
      Emisor.MasterSource:=Self;
      Emisor.FieldByName('ID_ACREDITADO').MasterField:='ID_ACREDITADO';
{ROIM CAMBIO POR FACTORAJE ELECTRONICO}
      Emisor.FieldByName('CVE_EMISOR_EXT').MasterField:='CVE_EMISOR_NAFIN';
{/ROIM}

      {$WARNINGS OFF}
      Credito := TCrCredito.Create(Self);
      {$WARNINGS ON}
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField := 'ID_CREDITO';

      {$WARNINGS OFF}
      Intermediario:= TIntermed.Create(Self);
      {$WARNINGS ON}
      Intermediario.MasterSource := Self;
      Intermediario.Id_Intermediario.MasterField := 'ID_BANCO_CHQRA';
      Intermediario.BuscaWhereString:= 'Sit_Intermed = ''AC''';

      {$WARNINGS OFF}
      Moneda := TMoneda.Create(Self);
      {$WARNINGS ON}
      Moneda.MasterSource := Self;
      Moneda.Cve_Moneda.MasterField := 'CVE_MONEDA';

      SubdivProcam := TCrSubPro.Create(Self);
      {$WARNINGS ON}
      SubdivProcam.MasterSource := Self;

      BasicCred := TBasicCred.Create(Self);
      BasicCred.MasterSource := Self;

end;

Destructor TCrCreChe.Destroy;
begin
   if Persona <> nil then
      Persona.Free;
   //end if

   If Credito <> nil then
      Credito.free;
   //end if;

   if Assigned( Emisor ) then
     Emisor.Free;
   //end if;
   if Intermediario <> nil then
     Intermediario.Free;
   //end if;

   if Moneda <> nil then
     Moneda.Free;
   //end if;

   if SubdivProcam <> nil then
      SubdivProcam.free;
   //end if;
   If BasicCred <> Nil Then
      BasicCred.Free;
   //end if
   inherited;
end;


function TCrCreChe.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCredCheq;
begin
   W:=TWCrCredCheq.Create(Self);
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


Function TCrCreChe.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCrCh.it','F,S,S,S,F,F,S');
      Try if Active then begin T.Param(0,ID_ACREDITADO.AsString);
                               T.Param(1,CVE_TIPO_ACRED.AsString);
                               T.Param(2,CVE_EMISOR_NAFIN.AsString);
                               T.Param(3,CVE_TIPO_CHEQ.AsString);
                               T.Param(4,ID_CREDITO.AsString);
                               T.Param(5,ID_BANCO_CHQRA.AsString);
                               T.Param(6,CUENTA_BANCO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),
                                                      T.DameCampo(3),T.DameCampo(4),T.DameCampo(5),
                                                      T.DameCampo(6)]);
      finally  T.Free;
      end;
end;


function TCrCreChe.ObtTitularCta: String;
var vlsql: String;
    vlTitular: String;
begin
   vlsql:= 'SELECT P.NOMBRE FROM ';
   if CVE_TIPO_CHEQ.AsString = 'AD' then
   Begin
      vlsql:= vlsql + 'CONTRATO C, PERSONA P WHERE C.ID_TITULAR = P.ID_PERSONA ' +
                      ' AND C.ID_CONTRATO = ' + CUENTA_BANCO.AsString +
                      ' AND C.CVE_MONEDA = '+ CVE_MONEDA.AsString +
                      ' AND C.ID_TITULAR = '+ ID_TITULAR.AsString;
   end
   else if CVE_TIPO_CHEQ.AsString = 'LQ' then
   Begin
      if CVE_MONEDA.AsInteger = 484 then
         vlsql:= vlsql + 'CHEQUERA_CTE '
      else vlsql:= vlsql + 'CR_CHQRA_DLLS ';
      vlsql:= vlsql + ' C, PERSONA P WHERE C.ID_PERSONA = P.ID_PERSONA ' +
                   ' AND C.ID_BANCO_CHQRA = ' + ID_BANCO_CHQRA.AsString +
                   ' AND C.CUENTA_BANCO = ' + CUENTA_BANCO.AsString +
                   ' AND C.ID_PERSONA = '+ ID_TITULAR.AsString;
   End;
   GetSQLStr(vlsql,Apli.DataBaseName,Apli.SessionName,'NOMBRE',vlTitular,False);
   ObtTitularCta:= vlTitular;
end;

(***********************************************FORMA CR_CRED_CHEQ********************)
(*                                                                              *)
(*  FORMA DE CR_CRED_CHEQ                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CRED_CHEQ********************)

procedure TWCrCredCheq.FormShow(Sender: TObject);
begin
   // Pinta datos del panel
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.ID_ACREDITADO.Control:=edID_ACREDITADO;
   Objeto.CVE_EMISOR_NAFIN.Control:=edCVE_EMISOR_NAFIN;
   Objeto.ID_CREDITO.Control:=edID_CREDITO;
   Objeto.CVE_TIPO_ACRED.Control := rgCVE_TIP_ACRED;
   Objeto.CVE_TIPO_CHEQ.Control := rgCVE_TIP_CHEQ;
   Objeto.CUENTA_BANCO.Control := edCUENTA_BANCO;
   Objeto.CVE_TIP_OPE_CHQ.Control:=rgCVE_TIP_OPE_CHQ;
   Objeto.B_PREDETERMINADA.Control:=chB_PREDETERMINADA;
   Objeto.SIT_CHEQUERA.Control:=rgSIT_CHEQUERA;
   Objeto.F_ALTA.Control := IEFechaAlta;
   Objeto.CVE_USU_ALTA.Control := IEUsuarioAlta;
   Objeto.F_MODIFICA.Control := IEFechaModifica;
   Objeto.CVE_USU_MODIFICA.Control := IEUsuarioModifica;
   Objeto.CVE_MONEDA.Control := edCVE_MONEDA;
   Objeto.B_REL_CREDITO.Control := chB_REL_CREDITO;
   Objeto.B_CTA_TERCEROS.Control := chB_CTA_TERCEROS;

//   Objeto.Persona.Id_Persona.Control := edID_ACREDITADO;
   Objeto.Persona.Nombre.Control := edNOMBRE;
   Objeto.Persona.GetParams(Objeto);
{ROIM 17/01/2007 SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//   Objeto.Emisor.CVE_EMISOR_NAFIN.Control := edCVE_EMISOR_NAFIN;
   Objeto.Emisor.CVE_EMISOR_EXT.Control := edCVE_EMISOR_NAFIN;
{/ROIM}
   Objeto.Emisor.NOMBRE_EMISOR.Control := edNOMBRE_EMISOR_NAFIN;
   Objeto.SubdivProcam.CVE_SUB_DIVISION.Control := edCVE_EMISOR_NAFIN;
   Objeto.SubdivProcam.NOMBRE_SUB_DIV.Control := edNOMBRE_EMISOR_NAFIN;
   Objeto.Credito.ID_CREDITO.Control := edID_CREDITO;
   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control:= edDESC_CREDITO;
   Objeto.Credito.GetParams(Objeto);
   Objeto.Intermediario.Persona.Nombre.Control := edBANCO;
   Objeto.Intermediario.GetParams(Objeto);
   Objeto.Moneda.CVE_MONEDA.Control := edCVE_MONEDA;
   Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
   Objeto.Moneda.GetParams(Objeto);

   Interforma1.MsgPanel := MsgPanel;

   vgActualiza   := True;
end;

procedure TWCrCredCheq.FormDestroy(Sender: TObject);
begin
   Objeto.ID_ACREDITADO.Control:=nil;
   Objeto.CVE_EMISOR_NAFIN.Control:=nil;
   Objeto.ID_CREDITO.Control:=nil;
   Objeto.CVE_TIPO_ACRED.Control := nil;
   Objeto.CVE_TIPO_CHEQ.Control := nil;
   Objeto.CUENTA_BANCO.Control := nil;
   Objeto.CVE_TIP_OPE_CHQ.Control:=nil;
   Objeto.B_PREDETERMINADA.Control:=nil;
   Objeto.SIT_CHEQUERA.Control:=nil;
   Objeto.F_ALTA.Control := nil;
   Objeto.CVE_USU_ALTA.Control := nil;
   Objeto.F_MODIFICA.Control := nil;
   Objeto.CVE_USU_MODIFICA.Control := nil;
   Objeto.CVE_MONEDA.Control := nil;
   Objeto.B_REL_CREDITO.Control := nil;
   Objeto.B_CTA_TERCEROS.Control := nil;

//   Objeto.Persona.Id_Persona.Control := nil;
   Objeto.Persona.Nombre.Control := nil;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//   Objeto.Emisor.CVE_EMISOR_NAFIN.Control := nil;
   Objeto.Emisor.CVE_EMISOR_EXT.Control := nil;
{/ROIM}
   Objeto.Emisor.NOMBRE_EMISOR.Control := nil;
   Objeto.SubdivProcam.CVE_SUB_DIVISION.Control := nil;
   Objeto.SubdivProcam.NOMBRE_SUB_DIV.Control := nil;
   Objeto.Credito.ID_CREDITO.Control := nil;
   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control:= nil;
   Objeto.Intermediario.Persona.Nombre.Control := nil;
   Objeto.Moneda.CVE_MONEDA.Control := nil;
   Objeto.Moneda.Desc_Moneda.Control := nil;
end;

procedure TWCrCredCheq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrCredCheq.InterForma1DespuesNuevo(Sender: TObject);
begin
   //Inicialización de Campos
   rgCVE_TIP_ACRED.ItemIndex := 0;
   Objeto.SIT_CHEQUERA.AsString := CSIT_AC;
   rgCVE_TIP_CHEQ.ItemIndex := 0;
   Objeto.F_ALTA.AsDateTime := now;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   Objeto.Persona.FindKey([Objeto.VG_ACREDITADO]);
   Objeto.Moneda.FindKey([Objeto.VG_MONEDA]);
   Objeto.ID_CREDITO.AsString := Objeto.VG_DISPOSICION;

   IF Objeto.VG_B_DISP_CHQ THEN BEGIN
      Objeto.Credito.FindKey([Objeto.VG_DISPOSICION]);
      Objeto.Credito.Active := True;
      rgCVE_TIP_OPE_CHQ.ItemIndex := 0;
      chB_REL_CREDITO.Checked := True;
      Objeto.ID_CREDITO.AsString := Objeto.VG_DISPOSICION;
      btCtaBanco.OnClick(Sender);
      Objeto.ID_CREDITO.AsString := Objeto.VG_DISPOSICION;
      rgCVE_TIP_OPE_CHQ.SetFocus
   END
   ELSE BEGIN
      rgCVE_TIP_OPE_CHQ.ItemIndex := 2;
      vgActualiza := True;
      Objeto.Credito.Active := False;
      Objeto.ID_CREDITO.AsFloat:= 0;
      edID_CREDITO.Color := clBtnFace;
      edID_CREDITO.Enabled:= False;
      btCREDITO.Enabled := False;
      edID_ACREDITADO.SetFocus;
   END;
   MuestraHints;
end;

procedure TWCrCredCheq.InterForma1DespuesModificar(Sender: TObject);
begin
      Objeto.F_MODIFICA.AsDateTime := Now;
      Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
      rgCVE_TIP_OPE_CHQ.SetFocus;
      vgActualiza := True;
end;

procedure TWCrCredCheq.ilCREDITOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrCredCheq.btACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCRECHE_CLI',True,True) then
   begin
  {  If Objeto.VG_ACREDITADO <> '' then
       begin
          Objeto.Persona.BuscaWhereString := 'PERSONA.ID_PERSONA = ''' + Objeto.VG_ACREDITADO + '''';
          Objeto.Persona.FilterString     := Objeto.Persona.BuscaWhereString;
          if Objeto.Persona.Busca then
             InterForma1.NextTab(edID_ACREDITADO);
       end
    else
       begin }
          Objeto.Persona.ShowAll := True;
          if Objeto.Persona.Busca then
             InterForma1.NextTab(edID_ACREDITADO);
          //end if
  //     end;
   end;
end;

procedure TWCrCredCheq.btREL_DISP_CHEQClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCRECHE_DTDIS',True,True) then
   begin
     if Objeto.Active then
     Begin
         {$WARNINGS OFF}
         Objeto.RelDispChq := TCrReCrCh.Create(Self);
         {$WARNINGS ON}
         try
            Objeto.RelDispChq.Apli:=Objeto.Apli;
            Objeto.RelDispChq.ParamCre:=Objeto.ParamCre;
            Objeto.RelDispChq.vgIdCredito:= Objeto.ID_CREDITO.AsString;
            Objeto.RelDispChq.vgNomAcreditado := Objeto.Persona.Nombre.AsString;
            Objeto.RelDispChq.vgBanco:= Objeto.ID_BANCO_CHQRA.AsString;
            Objeto.RelDispChq.vgNomBanco := edBANCO.Text;
            Objeto.RelDispChq.vgCtaBanco:= Objeto.CUENTA_BANCO.AsString;
            Objeto.RelDispChq.vgNomTitular := Objeto.ObtTitularCta;
            Objeto.BasicCred.LlenaDatos(Objeto.ID_CREDITO.AsInteger);
            Objeto.RelDispChq.BasicCred := Objeto.BasicCred;
            Objeto.RelDispChq.BuscaWhereString := ' CR_REL_CRED_CHEQ.ID_CREDITO = ' + Objeto.ID_CREDITO.AsString;
            Objeto.RelDispChq.FilterString := Objeto.RelDispChq.BuscaWhereString;
            Objeto.RelDispChq.Catalogo;
         finally
               if Objeto.RelDispChq <> nil then
                  Objeto.RelDispChq.Free;
               //end if
         end;
     end
     else ShowMessage('No esiste resgistro Activo');
   end;
end;

procedure TWCrCredCheq.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrCredCheq.ilACREDITADOEjecuta(Sender: TObject);
begin
   if Objeto.Persona.FindKey([ilACREDITADO.Buffer]) then
       InterForma1.NextTab(edID_ACREDITADO);
   //end if
end;

procedure TWCrCredCheq.ilCREDITOEjecuta(Sender: TObject);
begin
   if Objeto.Credito.FindKey([ilCREDITO.Buffer]) then
   Begin
      InterForma1.NextTab(edID_CREDITO);
   end;
end;

procedure TWCrCredCheq.btCREDITOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCRECHE_DISP',True,True) then
   begin
     Objeto.Credito.ShowAll := True;
     if Objeto.Credito.Busca then
     Begin
        InterForma1.NextTab(edID_CREDITO);
     end
   end;
end;

//REVISA BUSCA CHEQUERA PREDETERMINADA
function TWCrCredCheq.CountChequera(vlInd : String; vlTipo : String):Integer;
var vlCount : Integer;
    vlSql   : String;
Begin
   Objeto.CVE_TIP_OPE_CHQ.GetFromControl;
   Objeto.CVE_TIPO_ACRED.GetFromControl;
   Objeto.CVE_TIPO_CHEQ.GetFromControl;
   Objeto.CVE_MONEDA.GetFromControl;

   vlsql:=' SELECT COUNT(*) FROM CR_CRED_CHEQ ' +
          ' WHERE  ID_ACREDITADO = ' + Objeto.ID_ACREDITADO.AsString +
          ' AND CVE_EMISOR_NAFIN = ' + SQLStr( Objeto.CVE_EMISOR_NAFIN.AsString ) +
          ' AND       ID_CREDITO = ' + Objeto.ID_CREDITO.AsString +
          ' AND   CVE_TIPO_ACRED = ' + SQLStr( Objeto.CVE_TIPO_ACRED.AsString   ) +
          ' AND    CVE_TIPO_CHEQ = ' + SQLStr( Objeto.CVE_TIPO_CHEQ.AsString    ) +
          ' AND       CVE_MONEDA = ' + SQLStr( Objeto.CVE_MONEDA.AsString       ) +
// RABA ENE 2012
          ' AND     SIT_CHEQUERA = ' + SQLStr('AC');
// RABA

   if vlInd = CTIPO then
   Begin
     vlsql:= vlSql + ' AND CVE_TIP_OPE_CHQ = ' +
             #39 + vlTipo + #39;
   end
   else if vlInd = CExisteAM then
      vlsql:= vlSql + 'AND CVE_TIP_OPE_CHQ = ' + #39 + C_AMBOS + #39

   else if vlInd = CDiferenteAM then
   Begin
     vlsql:= vlSql + ' AND B_PREDETERMINADA = '+ #39 + 'V' + #39 +
                     ' AND CVE_TIP_OPE_CHQ <> '+ #39 + C_AMBOS + #39;
   end
   else if vlInd = CESPREDET then
   Begin
     vlsql:= vlSql + ' AND B_PREDETERMINADA = '+ #39 + 'V' + #39 +
                     ' AND CVE_TIP_OPE_CHQ = '+ #39 + vlTipo + #39
   end
   else if vlInd = C_AM_NO_PRED then
   Begin
     vlsql:= vlSql + ' AND B_PREDETERMINADA = '+ #39 + 'F' + #39 +
                     ' AND CVE_TIP_OPE_CHQ  = '+ #39 + C_AMBOS + #39;
   end
   else if vlInd = CPRED then
   Begin
     vlsql:= vlSql + ' AND B_PREDETERMINADA = '+ #39 + 'V' + #39;
   end;
// RABA ENE 2012
   If Objeto.Modo = moEdit then
      vlsql:= vlSql + ' AND CUENTA_BANCO <> '+ #39 + Objeto.CUENTA_BANCO.AsString  + #39;
// RABA

   GetSQLInt(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT(*)',vlCount,False);
   CountChequera := vlCount;
end;


function TWCrCredCheq.CadenaSql(pTipo : String): String;
var   vlSql    : String;
      vlCadena : String;
Begin
   Objeto.CVE_TIP_OPE_CHQ.GetFromControl;
   Objeto.CVE_TIPO_ACRED.GetFromControl;
   Objeto.CVE_TIPO_CHEQ.GetFromControl;
   Objeto.CVE_MONEDA.GetFromControl;

   vlSql := ' SELECT * FROM CR_CRED_CHEQ '+
            ' WHERE  ID_ACREDITADO = ' + Objeto.ID_ACREDITADO.AsString +
            ' AND CVE_EMISOR_NAFIN = ' + SQLStr( Objeto.CVE_EMISOR_NAFIN.AsString ) +
            ' AND       ID_CREDITO = ' + Objeto.ID_CREDITO.AsString+
            ' AND   CVE_TIPO_ACRED = ' + SQLStr( Objeto.CVE_TIPO_ACRED.AsString   ) +
            ' AND    CVE_TIPO_CHEQ = ' + SQLStr( Objeto.CVE_TIPO_CHEQ.AsString    ) +
            ' AND       CVE_MONEDA = ' + SQLStr( Objeto.CVE_MONEDA.AsString       ) ;

   if pTipo = C_CARGO then
      vlCadena := vlSql + ' AND CVE_TIP_OPE_CHQ = ' + #39 + pTipo + #39
   else if pTipo = C_ABONO then
      vlCadena := vlSql + ' AND CVE_TIP_OPE_CHQ = ' + #39 + pTipo + #39
   else if pTipo = C_AMBOS then
      vlCadena := vlSql + ' AND CVE_TIP_OPE_CHQ = ' + #39 + pTipo + #39
   else if pTipo = CNULL then
      vlCadena := vlSql;
// RABA ENE 2012
   If Objeto.Modo = moEdit then
      vlCadena:= vlCadena + ' AND CUENTA_BANCO <> '+ #39 + Objeto.CUENTA_BANCO.AsString  + #39;
// RABA

   CadenaSql := vlCadena;
end;

//ACTUALIZA CHEQUERA PREDERTERMINADA POR LA QUE LE INDIQUE
Procedure TWCrCredCheq.UpdateCheqDet(vlIndic : Integer; vlCond : String);
var vlUpdate : String;
Begin
   Objeto.CVE_TIP_OPE_CHQ.GetFromControl;
   Objeto.CVE_TIPO_ACRED.GetFromControl;
   Objeto.CVE_TIPO_CHEQ.GetFromControl;
   Objeto.CVE_MONEDA.GetFromControl;

     vlUpdate:= ' UPDATE CR_CRED_CHEQ ' +
                ' SET   B_PREDETERMINADA = ' + SQLStr( 'F' ) +
                ' ,           F_MODIFICA = TO_DATE('+ SQLStr( FormatDateTime( 'DD/MM/YYYY HH:NN:SS',now ) ) +
                                          ','+ SQLStr( 'dd/mm/yy hh24:mi:ss' ) + ')' +
                ' ,     CVE_USU_MODIFICA = ' + SQLStr( Objeto.Apli.Usuario   ) +
                ' WHERE    ID_ACREDITADO = ' + Objeto.ID_ACREDITADO.AsString              +
                ' AND   CVE_EMISOR_NAFIN = ' + SQLStr( Objeto.CVE_EMISOR_NAFIN.AsString ) +
                ' AND         ID_CREDITO = ' + Objeto.ID_CREDITO.AsString                 +
                ' AND     CVE_TIPO_ACRED = ' + SQLStr( Objeto.CVE_TIPO_ACRED.AsString   ) +
                ' AND      CVE_TIPO_CHEQ = ' + SQLStr( Objeto.CVE_TIPO_CHEQ.AsString    ) +
                ' AND         CVE_MONEDA = ' + SQLStr( Objeto.CVE_MONEDA.AsString       ) +
                ' AND   B_PREDETERMINADA = ' + SQLStr( 'V' );

     if vlIndic = 0 then
     Begin  // Pone como predeterminada la chquera a Indicar
        vlUpdate:= vlUpdate +
                  ' AND    CUENTA_BANCO = ' + SQLStr(vlCond);
     end
     else if vlIndic = 1 then
     Begin  //Pone a Am como True
        vlUpdate := vlUpdate +
                   ' AND B_PREDETERMINADA = '+ #39 + 'V' + #39 +
                   ' AND CVE_TIP_OPE_CHQ <> '+ #39 + C_AMBOS + #39;
     end
     else if vlIndic = 2 then
     Begin     //pone a AM como False
        vlUpdate := vlUpdate +
                   ' AND B_PREDETERMINADA = '+ #39 + 'V' + #39 +
                   ' AND CVE_TIP_OPE_CHQ = '+ #39 + C_AMBOS + #39;
     end;

     RunSQL(vlUpdate,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
End;

//BUSCA CHEQUERA PREDETERMINADA
Function TWCrCredCheq.BuscaPredeterminada: Boolean;
var vlSql   : String;
    Q       : TQuery;
    vlSalida: Boolean;
begin
   //inicializacion de variables locales
   vlSalida := False;

   vlSql := CadenaSql(Objeto.CVE_TIP_OPE_CHQ.AsString);
   if chB_PREDETERMINADA.Checked then
   Begin
      Q := TQuery.Create(Self);
      Try
        Q.SessionName := Objeto.SessionName;
        Q.DataBaseName := Objeto.DataBaseName;
        Q.SQL.Clear;
        Q.SQL.Add(vlsql);
        Q.Open;
        //verifiac solo en caso de alta
        if InterForma1.IsNewData then
        Begin
           Objeto.ID_ACREDITADO.GetFromControl;
           Objeto.CVE_TIPO_ACRED.GetFromControl;
           Objeto.CVE_EMISOR_NAFIN.GetFromControl;
           Objeto.CVE_TIP_OPE_CHQ.GetFromControl;
           Objeto.ID_CREDITO.GetFromControl;
           Objeto.ID_BANCO_CHQRA.GetFromControl;
           Objeto.CUENTA_BANCO.GetFromControl;
          While Not Q.Eof Do
          Begin
             if ( Q.FieldByName('ID_ACREDITADO').AsString    = Objeto.ID_ACREDITADO.AsString    ) and
                ( Q.FieldByName('CVE_TIPO_ACRED').AsString   = Objeto.CVE_TIPO_ACRED.AsString   ) and
                ( Q.FieldByName('CVE_EMISOR_NAFIN').AsString = Objeto.CVE_EMISOR_NAFIN.AsString ) and
                ( Q.FieldByName('CVE_TIPO_CHEQ').AsString    = Objeto.CVE_TIPO_CHEQ.AsString    ) and
                ( Q.FieldByName('ID_CREDITO').AsString       = Objeto.ID_CREDITO.AsString       ) and
                ( Q.FieldByName('ID_BANCO_CHQRA').AsString   = Objeto.ID_BANCO_CHQRA.AsString   ) and
                ( Q.FieldByName('CUENTA_BANCO').AsString     = Objeto.CUENTA_BANCO.AsString     ) then //modificar
             Begin
                ShowMessage('Registro ya existe');
                EXIT;
                vgactualiza := False;
                Break;
             end;
             Q.Next;
          End; //end while
        end;//end if

        if vgactualiza then
        Begin
            Q.First;
            While Not Q.Eof Do
            Begin
               if (Q.FieldByName('B_PREDETERMINADA').AsString  = 'V') then
               Begin
                     if MessageDlg('¿Existe una chequera Predeterminada,' +
                                   'desea que esta chequera sea la predeterminada?',
                         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                      Begin        // se cambia el registro de chequera predeterminada
                         vlSalida := True;
                         UpdateCheqDet(0,Q.FieldByName('CUENTA_BANCO').AsString);
                         break;
                      end
                      else
                      Begin vlSalida := False;
                            break;
                      end;
               end
               else
               Begin
               if (Q.FieldByName('B_PREDETERMINADA').AsString  = 'F') and
                  (Q.FieldByName('CVE_TIP_OPE_CHQ').AsString  = C_AMBOS)
                  then vlSalida := True
               else vlSalida := False;
               end;
               Q.Next;
            End; //end while
        end;
      Finally
        If Assigned(Q) Then
        Begin
             Q.Close;
             Q.Free;
        End;
      end; //end Try finally
   end; //end if checked
   BuscaPredeterminada:= vlSalida;
END;

//DEFINE SIS VA AHCER O NO CHEQUERA PREDETERMINADA
procedure TWCrCredCheq.DefinePredeterminada;
var
  vlBcoChqra : Integer;
  vlChqra    : String;
  vlMetodo   : String;  // RABA
Begin
   vlBcoChqra := 0;
   vlChqra := '';

   Objeto.CVE_TIP_OPE_CHQ.GetFromControl;
   If rgSIT_CHEQUERA.ItemIndex = 0 then
   begin
     //existen registros con el mismo tipo
     if CountChequera(CTIPO,Objeto.CVE_TIP_OPE_CHQ.AsString) = 0 then
     Begin
       if (Objeto.CVE_TIP_OPE_CHQ.AsString = C_AMBOS) then
       begin
         if CountChequera( CESPREDET,C_AMBOS ) = 0 then
            chB_PREDETERMINADA.Checked :=True
         else
         Begin
           chB_PREDETERMINADA.Checked := Buscapredeterminada;
         end;
       end
       else
       begin
         if CountChequera(CExisteAM,CNULL) <> 0 then //exites AM
         Begin
           if ((CountChequera(CDiferenteAM,CNULL) = 0) and
               (CountChequera(CESPREDET,C_AMBOS) = 1)) then
               chB_PREDETERMINADA.Checked :=True
           else
           Begin
             chB_PREDETERMINADA.Checked := BuscaPredeterminada;
           end;
         end
         else
         begin
           if ( CountChequera(CTIPO,Objeto.CVE_TIP_OPE_CHQ.AsString) <> 0 ) THEN  // existe Objeto.CVE_TIP_OPE_CHQ  (CR o AB)
              if ( CountChequera(CESPREDET,Objeto.CVE_TIP_OPE_CHQ.AsString) <> 0 ) THEN
                 chB_PREDETERMINADA.Checked :=buscapredeterminada
              else
                 chB_PREDETERMINADA.Checked := TRUE
           else
             chB_PREDETERMINADA.Checked := TRUE;
         end;
       end;
     end
     else
       chB_PREDETERMINADA.Checked := Buscapredeterminada;
   end
   Else  // rgSIT_CHEQUERA.ItemIndex =  = 1
   begin
     objeto.B_PREDETERMINADA.AsString := 'CA';
     if Objeto.CVE_TIP_OPE_CHQ.AsString = C_AMBOS then
     begin
       if objeto.CVE_TIPO_CHEQ.AsString = C_ADMIN then
          vlMetodo := C_CARGO
       else
          vlMetodo := C_ABONO;
     end
     else
       vlMetodo := Objeto.CVE_TIP_OPE_CHQ.AsString;

     ObtenChequeras(Objeto.ID_ACREDITADO.AsInteger,
                    Objeto.ID_CREDITO.AsInteger,
                    Objeto.CVE_EMISOR_NAFIN.AsString,
                    Objeto.CVE_TIPO_ACRED.AsString,
                    Objeto.CVE_TIPO_CHEQ.AsString,
                    vlMetodo,
                    Objeto.Apli ,
                    vlBcoChqra,
                    vlChqra);

     // SI NO SE ECUENTRA CHEQUERA CON EL CREDITO DE LA PANTALLA ENTONCES SE BUSCA OTRO
     If (vlChqra = '') or (Objeto.CUENTA_BANCO.AsString = vlChqra) then
     begin
       vlChqra := '';
       if (objeto.B_REL_CREDITO.AsString = 'V') then
          ObtenChequeras(Objeto.ID_ACREDITADO.AsInteger,
                         0,
                         Objeto.CVE_EMISOR_NAFIN.AsString,
                         Objeto.CVE_TIPO_ACRED.AsString,
                         Objeto.CVE_TIPO_CHEQ.AsString,
                         vlMetodo,
                         Objeto.Apli ,
                         vlBcoChqra,
                         vlChqra)
       else
         if objeto.VG_DISPOSICION <> ''  then
          ObtenChequeras(Objeto.ID_ACREDITADO.AsInteger,
                         StrToInt(objeto.VG_DISPOSICION),
                         Objeto.CVE_EMISOR_NAFIN.AsString,
                         Objeto.CVE_TIPO_ACRED.AsString,
                         Objeto.CVE_TIPO_CHEQ.AsString,
                         vlMetodo,
                         Objeto.Apli ,
                         vlBcoChqra,
                         vlChqra);
     end;

//     if CountChequera(CPRED,CNULL) = 0 then
     if (vlChqra = '') or (Objeto.CUENTA_BANCO.AsString = vlChqra) then
     begin
       // en caso de que el tipo de chequera sea de liquidación
       // si se debe permitir que no exista una predeterminada
       if objeto.CVE_TIPO_CHEQ.AsString = C_LIQUI then
       begin
         if MessageDlg('No quedará otra chequera de Liquidación predeterminada. ¿Desea continuar?',
                        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            vgactualiza := True
         else
            vgactualiza := False;
       end
       else
       begin
         MessageDlg('No hay otra chequera Administrativa o Eje predeterminada. Primero defina otra.',
                     mtError, [mbOK], 0);
         vgactualiza := False;
       end;
     end;
   end;


{//Nuevo
   Objeto.CVE_TIP_OPE_CHQ.GetFromControl;
   if InterForma1.IsNewData then
   Begin
     //existen registros con el mismo tipo
     if CountChequera(CTIPO,Objeto.CVE_TIP_OPE_CHQ.AsString) = 0 then
     Begin
        if (Objeto.CVE_TIP_OPE_CHQ.AsString <> C_AMBOS) then
        Begin
           if CountChequera(CNULL,CNULL) > 0 then
           Begin
              if chB_PREDETERMINADA.Checked then
              Begin
                 if CountChequera(CExisteAM,CNULL) <> 0 then //Existe AM    // RABA OJO PERO NO SE ESTA VALIDANDO SI ES LA PREDETERMINADA
                    //chB_PREDETERMINADA.Checked := False
                    chB_PREDETERMINADA.Checked := BuscaPredeterminada   //RABA
                 else chB_PREDETERMINADA.Checked :=BuscaPredeterminada;
              end
              //else chB_PREDETERMINADA.Checked :=True;
              else chB_PREDETERMINADA.Checked :=BuscaPredeterminada;  // RABA
           end
           else chB_PREDETERMINADA.Checked :=True;
        end

        else  //En caso de que sea ambos
        Begin
           if not ( chB_PREDETERMINADA.Checked ) then
           Begin
              if CountChequera( CNULL,CNULL ) = 0 then
              Begin
                 chB_PREDETERMINADA.Checked :=True;
              end
              else
              Begin
                 chB_PREDETERMINADA.Checked := Buscapredeterminada;
              end;
           end
           else
           Begin
              if CountChequera( CNULL,CNULL ) = 0 then
                 chB_PREDETERMINADA.Checked :=True
              else
              Begin
                 chB_PREDETERMINADA.Checked := Buscapredeterminada;
              end;
           end
        end;
     end
     else chB_PREDETERMINADA.Checked := Buscapredeterminada;
   end
   else
   Begin       //MODIFICACION
     If rgSIT_CHEQUERA.ItemIndex = 0 then
     begin
        if CountChequera(CNULL,CNULL) > 0 then //en total cuantos registros hay
        Begin
           if Objeto.CVE_TIP_OPE_CHQ.AsString = C_AMBOS then // Objeto Calve = AM
           Begin
              if chB_PREDETERMINADA.Checked then //AM Check
              Begin
                 chB_PREDETERMINADA.Checked := Buscapredeterminada;
              end
              else // AM no check
              Begin
                if CountChequera( CESPREDET,C_AMBOS ) = 0 then
                   chB_PREDETERMINADA.Checked :=True
                else
                Begin
                   chB_PREDETERMINADA.Checked := Buscapredeterminada;
                end;
              end; //Fin AM no Check
           end // fin cuando clave es AM
           // cuando sea CR o AB
           else
           Begin
     {3}{     if CountChequera(CExisteAM,CNULL) <> 0 then //exites AM
              Begin
                 if ((CountChequera(CDiferenteAM,CNULL) = 0) and
                     (CountChequera(CESPREDET,C_AMBOS) = 1)) then
                       chB_PREDETERMINADA.Checked :=True
                 else if CountChequera(C_AM_NO_PRED,CNULL) >=1 then
                 Begin
                    if not ( BuscaPredeterminada ) then
                       chB_PREDETERMINADA.Checked :=True;
                 end
                 else if CountChequera(CESPREDET,C_AMBOS) = 1 then
                 Begin
                    if CountChequera(CExisteAM,CNULL) >= 2 then //exites AM
                    Begin
                       BuscaPredeterminada;
                    end
                    else chB_PREDETERMINADA.Checked :=True;
                 end
                 else
                 Begin
  //                  if BuscaPredeterminada then
                       chB_PREDETERMINADA.Checked :=BuscaPredeterminada;
                 end;
              end
              else
              Begin
  // </ RABA > ENE 2012
  {               if ( CountChequera(CTIPO,Objeto.CVE_TIP_OPE_CHQ.AsString) <= 1 ) THEN
                 Begin
                        chB_PREDETERMINADA.Checked := TRUE;
                 end
                 ELSE
                 chB_PREDETERMINADA.Checked :=buscapredeterminada;
  }{
                 if ( CountChequera(CTIPO,Objeto.CVE_TIP_OPE_CHQ.AsString) <> 0 ) THEN  // existe Objeto.CVE_TIP_OPE_CHQ  (CR o AB)
                    if ( CountChequera(CESPREDET,Objeto.CVE_TIP_OPE_CHQ.AsString) >= 1 ) THEN
                        chB_PREDETERMINADA.Checked :=buscapredeterminada
                    else
                        chB_PREDETERMINADA.Checked := TRUE
                 else
                    chB_PREDETERMINADA.Checked := TRUE;
  // < RABA />
              end;
           end;
        end;// fin Cuando la clave tipo sea AB o CR
     end
     Else  // rgSIT_CHEQUERA.ItemIndex =  = 1
     begin
       if CountChequera(CPRED,CNULL) = 0 then
       begin
          Showmessage ('No hay chequera predeterminada definida.');
          vgactualiza := False;
       end;
     end
   end
}
end;


procedure TWCrCredCheq.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   if IsNewData then    //nuevo
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           DefinePredeterminada;
           Realizado := True;
      end
      else Realizado := False;
   end
   else
   Begin
//      if chB_PREDETERMINADA.Checked then   // RABA OJO VALIDAR QUE LO PUEDO QUITAR
      if MessageDlg('¿Desea guradar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
         if vgactualiza then
            DefinePredeterminada;
         //end if
         if vgactualiza then
            Realizado := True
         else
            Realizado := False;
      end
      else Realizado := False;
   end
   // end if

end;

Procedure TWCrCredCheq.MuestraHints;
Begin
      edNOMBRE.Hint := Objeto.Persona.Nombre.AsString;
      edNOMBRE.ShowHint := True;
      edBANCO.Hint := Objeto.Intermediario.Persona.Nombre.AsString;
      edBANCO.ShowHint := True;
      edDESC_CREDITO.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
      edDESC_CREDITO.ShowHint := True;
End;

procedure TWCrCredCheq.InterForma1Buscar(Sender: TObject);
VAR vlMesg : STRING;
begin
 if Objeto.Busca then
 Begin
    MuestraHints;
    Objeto.Moneda.FindKey([Objeto.CVE_MONEDA.AsString]);
    if Objeto.CVE_TIPO_ACRED.AsString = 'AP' then //easa 081102004
       Objeto.SubdivProcam.FindKey([Objeto.ID_ACREDITADO.AsString,Objeto.CVE_EMISOR_NAFIN.AsString])
    else Objeto.Emisor.FindKey([Objeto.ID_ACREDITADO.AsString,Objeto.CVE_EMISOR_NAFIN.AsString]);
    //
    if Objeto.B_REL_CREDITO.AsString = 'V' then
      btREL_DISP_CHEQ.Enabled := True
    else btREL_DISP_CHEQ.Enabled := False;

    //EASA  REQ. 20007 - 07 / 018   CARTERA IMPAGADA
    InterForma1.MsgPanel.Caption := '';
    InterForma1.MsgPanel.Color := clBtnFace;
    InterForma1.MsgPanel.Font.Color := clWhite;
    if Objeto.CVE_TIPO_ACRED.AsString = C_PROVE then
    Begin
      if not ( FindDispIMPProv(Objeto.ID_ACREDITADO.AsInteger,Objeto.Apli, vlMesg)) then
      Begin
         if MessageDlg(vlMesg + ', desea ver el detalle?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
         Begin
            Objeto.DetImpagado := TCrCartrIm.Create(self);
            Try
              Objeto.DetImpagado.Apli:= Objeto.Apli;
              Objeto.DetImpagado.ID_ACREDITADO.AsString := Objeto.ID_ACREDITADO.ASstring;
              Objeto.DetImpagado.NOM_ACREDITADO.AsString := Objeto.Persona.Nombre.asstring;
              Objeto.DetImpagado.TIPO_CLIENTE.AsString := C_PROVE;
              Objeto.DetImpagado.ParamCre:=Objeto.ParamCre;
              Objeto.DetImpagado.Catalogo;
            finally
              Objeto.DetImpagado.Free;
            end;
         end;
      end;
    End
    Else
    Begin
        if not ( FindDispIM(Objeto.ID_ACREDITADO.AsInteger,Objeto.Apli, vlMesg )) then
        Begin
           InterForma1.MsgPanel.Caption := vlMesg;
           InterForma1.MsgPanel.Color := clRed;
           InterForma1.MsgPanel.Font.Color := clWhite;
           if MessageDlg(vlMesg + ', desea ver el detalle?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Begin
              Objeto.DetImpagado := TCrCartrIm.Create(self);
              Try
                Objeto.DetImpagado.Apli:= Objeto.Apli;
                Objeto.DetImpagado.ID_ACREDITADO.AsString := Objeto.ID_ACREDITADO.ASstring;
                Objeto.DetImpagado.NOM_ACREDITADO.AsString := Objeto.persona.nombre.asstring;
                Objeto.DetImpagado.ParamCre:=Objeto.ParamCre;
                Objeto.DetImpagado.Catalogo;
              finally
                Objeto.DetImpagado.Free;
              end;
           end;
        end;
        //END EASA
      end;

 end;
end;

procedure TWCrCredCheq.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraHints;
   if Objeto.B_REL_CREDITO.AsString = 'V' then
      btREL_DISP_CHEQ.Enabled := True
   else btREL_DISP_CHEQ.Enabled := False;
   Objeto.Moneda.FindKey([Objeto.CVE_MONEDA.AsString]);
end;



procedure TWCrCredCheq.InterForma1DespuesShow(Sender: TObject);
begin
   IF not Objeto.VG_B_DISP_CHQ THEN BEGIN
     IF NOT Objeto.FindKey([Objeto.VG_ACREDITADO,
                            Objeto.VG_TIPO_ACRED,
                            Objeto.VG_SUB_DIV,
                            Objeto.VG_TIP_CHEQ,
                            Objeto.VG_DISPOSICION,
                            Objeto.VG_BCO_CHQ,
                            Objeto.VG_CHEQRA]) THEN

        Objeto.FindKey([Objeto.VG_ACREDITADO,
                        Objeto.VG_TIPO_ACRED,
                        Objeto.VG_SUB_DIV,
                        Objeto.VG_TIP_CHEQ,
                        0,
                        Objeto.VG_BCO_CHQ,
                        Objeto.VG_CHEQRA]);
   end;
   Objeto.Moneda.FindKey([Objeto.CVE_MONEDA.AsString]);

// RABA ENE 2012
   if Objeto.B_REL_CREDITO.AsString = 'V' then
      btREL_DISP_CHEQ.Enabled := True
   else btREL_DISP_CHEQ.Enabled := False;
// FIN RABA
end;

// EVENTOS DEL CHECKBOX  "Relaciona  Acreditado con Disposición."
procedure TWCrCredCheq.chB_REL_CREDITOEnter(Sender: TObject);
begin
   if not(chB_REL_CREDITO.Checked) Then
   Begin
      Objeto.Credito.Active := False;
      Objeto.ID_CREDITO.AsFloat:= 0;
      edID_CREDITO.Color := clBtnFace;
      edID_CREDITO.Enabled:= False;
      btCREDITO.Enabled := False;
   end
   else
   Begin
      Objeto.Credito.Active := True;
      Objeto.ID_CREDITO.AsString:=CNULL;
      edID_CREDITO.Color := clWindow;
      edID_CREDITO.Enabled:= True;
      btCREDITO.Enabled := True;
   end
end;
// +---------------------------------------------------------------------------+
procedure TWCrCredCheq.chB_REL_CREDITOClick(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
       if not(chB_REL_CREDITO.Checked) Then
       Begin
          Objeto.Credito.Active := False;
          Objeto.ID_CREDITO.AsFloat:= 0;
          edID_CREDITO.Color := clBtnFace;
          edID_CREDITO.Enabled:= False;
          btCREDITO.Enabled := False;
       end
       else
       Begin
          Objeto.Credito.Active := True;
          Objeto.ID_CREDITO.AsString:=CNULL;
          edID_CREDITO.Color := clWindow;
          edID_CREDITO.Enabled:= True;
          btCREDITO.Enabled := True;
       end;
   end;
end;

// BUSCADORES

// BUSCADOR DE CUENTA BANCO
procedure TWCrCredCheq.btCtaBancoClick(Sender: TObject);
var  Cto         : TContrato;
     CtaBco      : TcheqCte;
     CtaDlls     : TCrChqDll;
     vlSql       : String;
begin
   if Objeto.ValidaAccesoEsp('TCRCRECHE_BANCO',True,True) then
   begin
       Objeto.CVE_TIPO_CHEQ.GetFromControl;
       Objeto.CVE_MONEDA.GetFromControl;
       Objeto.ID_ACREDITADO.GetFromControl;

       vlSql := '';
       if Objeto.CVE_TIPO_CHEQ.AsString = C_ADMIN then
       Begin
            {$WARNINGS OFF}
            Cto:=TContrato.Create(objeto);
            {$WARNINGS ON}
            Try
               Cto.GetParams(objeto);
               Cto.BuscaWhereString:='';

               vlSql:= '(( CONTRATO.CVE_TIP_CONTRATO=''CDVI'') or   ' +
                       ' ( CONTRATO.CVE_TIP_CONTRATO=''IDVI'') or   ' +
                       ' ( CONTRATO.CVE_TIP_CONTRATO=''BDVI'')) AND ' +
                       ' ( CONTRATO.SIT_CONTRATO =' + SQLStr('AC') + ') AND '+
                       ' ( CONTRATO.CVE_MONEDA =' + Objeto.CVE_MONEDA.AsString    + ')';
               if not ( chB_CTA_TERCEROS.Checked ) then Begin
                  IF Objeto.CVE_TIPO_ACRED.AsString = 'AP' THEN
                  BEGIN
                     Cto.BuscaWhereString:= vlSql +
                                           ' AND (CONTRATO.ID_TITULAR =' + Objeto.SubdivProcam.ID_PERSONA.AsString + ')';
                  END
                  ELSE
                  BEGIN
                     Cto.BuscaWhereString:= vlSql +
                                       ' AND (CONTRATO.ID_TITULAR =' + Objeto.ID_ACREDITADO.AsString + ')';
                  END;
               end
               ELSE
                 Cto.BuscaWhereString:= vlSql;

               Cto.FilterString := Cto.BuscaWhereString;
               Cto.ShowAll:= True;
               Cto.MasterSourceEnabled:=False;
               Cto.Busca;
               if Cto.Active then
               begin
                    Objeto.CUENTA_BANCO.AsString   := Cto.ID_Contrato.AsString;
                    Objeto.ID_BANCO_CHQRA.AsString := Cto.Id_Empresa.AsString;
                    Objeto.ID_TITULAR.AsString     := Cto.ID_Titular.AsString;
               end;
            Finally
               Cto.Free;
            end;//Try & Finally
            InterForma1.NextTab(btCtaBanco);
       end
       else
       Begin
          if vgLiqMoneda = CLIQ_LP then
          Begin
            {$WARNINGS OFF}
            CtaBco:= TCheqCte.Create(Objeto);
            {$WARNINGS ON}
            Try
               CtaBco.GetParams(objeto);
               CtaBco.BuscaWhereString := '';

               vlSql:= ' CHEQUERA_CTE.B_DEPURADO = ''V'' '; //AND   ' ; +' CHEQUERA_CTE.TIPO_CUENTA = ''CLABE''';
               if not ( chB_CTA_TERCEROS.Checked ) then Begin
                  CtaBco.BuscaWhereString := vlsql + ' AND CHEQUERA_CTE.ID_PERSONA = '+
                                                               Objeto.ID_ACREDITADO.AsString ;
               end
               ELSE
                  CtaBco.BuscaWhereString := vlsql;

               CtaBco.FilterString := CtaBco.BuscaWhereString;
               CtaBco.ShowAll:= True;
               CtaBco.MasterSourceEnabled:=False;
               CtaBco.Busca;
               if CtaBco.Active then
               begin
                    Objeto.CUENTA_BANCO.AsString := CtaBco.Cuenta_Banco.AsString;
                    Objeto.ID_BANCO_CHQRA.AsString := CtaBco.Id_Banco_Chqra.AsString;
                    Objeto.ID_TITULAR.AsString := CtaBco.Id_Persona.AsString;
               end;
            Finally
               CtaBco.Free;
            end;//Try & Finally
            InterForma1.NextTab(btCtaBanco);
          end
          else if vgLiqMoneda = CLIQ_LD then
          Begin
            {$WARNINGS OFF}
            CtaDlls := TCrChqDll.Create(Self);
            {$WARNINGS ON}
            Try
               CtaDlls.GetParams(objeto);
               CtaDlls.BuscaWhereString := '';

               vlSql:= ' CR_CHQRA_DLLS.SIT_CUENTA = ''AC'' ' ;
               if not ( chB_CTA_TERCEROS.Checked ) then Begin
                  CtaDlls.BuscaWhereString := vlsql + ' AND CR_CHQRA_DLLS.ID_PERSONA = '+
                                                               Objeto.ID_ACREDITADO.AsString ;
               end
               ELSE
                  CtaDlls.BuscaWhereString := vlsql;

               CtaDlls.FilterString := CtaDlls.BuscaWhereString;
               CtaDlls.ShowAll:= True;
               CtaDlls.MasterSourceEnabled:=False;
               CtaDlls.Busca;
               if CtaDlls.Active then
               begin
                    Objeto.CUENTA_BANCO.AsString := CtaDlls.Cuenta_Banco.AsString;
                    Objeto.ID_BANCO_CHQRA.AsString := CtaDlls.Id_Banco_Chqra.AsString;
                    Objeto.ID_TITULAR.AsString := CtaDlls.Id_Persona.AsString;
               end;
            Finally
               CtaDlls.Free;
            end;//Try & Finally
            InterForma1.NextTab(btCtaBanco);
          end;
       end;
   end;
end;



procedure TWCrCredCheq.ColocaTipoAcreditado;
const coSqlNaf = 'SELECT COUNT(ID_ACREDITADO) NUM_VECES  FROM CR_EMISOR WHERE ID_ACREDITADO = ';
//  coSqlEmisNaf = 'SELECT CVE_EMISOR_NAFIN FROM CR_EMISOR ' + EASA4011 08.05.2008
  coSqlEmisNaf = 'SELECT CVE_EMISOR_EXT FROM CR_EMISOR ' +
//                     'WHERE ID_ACREDITADO = %s ORDER BY CVE_EMISOR_NAFIN'; EASA4011 08.05.2008
                     'WHERE ID_ACREDITADO = %s ORDER BY CVE_EMISOR_EXT';
       coSqlProcam    = ' SELECT COUNT(ID_ACREDITADO) NUM_VECES  FROM CR_SUBDIV_PROCAM WHERE ID_ACREDITADO = ';
       coSqlAcrProcam = ' SELECT CVE_SUB_DIVISION FROM CR_SUBDIV_PROCAM ' +
                        ' WHERE ID_ACREDITADO = %s ORDER BY CVE_SUB_DIVISION';
var   vlCveSubDiv : String;
      vlCnt       : Integer;
      vlFlage     : Boolean;
      vlSqlEN     : String;
begin
  if InterForma1.IsNewData then  //LOLS 22 06 2004
  begin
    vlCnt := 0;
    Objeto.CVE_TIPO_ACRED.GetFromControl;
    if Objeto.CVE_TIPO_ACRED.AsString = C_ACRED then
      GetSQLInt(  coSqlNaf + Objeto.ID_ACREDITADO.AsString, Objeto.Apli.DataBaseName,
                  Objeto.Apli.SessionName, 'NUM_VECES',  vlCnt, False );
    //ends_if
    vlFlage := ( vlCnt > 0 );
    edCVE_EMISOR_NAFIN.Enabled    := vlFlage;
    btEmisNafin.Enabled           := vlFlage;
    edNOMBRE_EMISOR_NAFIN.Enabled := vlFlage;

    if vlFlage then
    begin
      // CUANDO ES UN REGISTRO NUEVO, SELECCIONA UNA CLAVE DE EMISOR NAFIN POR DEFAULT (LA DE CODIGO ASCII MENOR)
      // YA QUE NO SIEMPRE SE VA A TENER UNA CVE_EMISOR_NAFIN = 0, A NIVEL CR_EMISOR
        vlSqlEN := Format( coSqlEmisNaf, [ Objeto.ID_ACREDITADO.AsString ] );
        GetSQLStr(  vlSqlEN, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,
                    'CVE_EMISOR_NAFIN',  vlCveSubDiv, False );

      {Aplica los filtros correspondientes}
      Objeto.Emisor.FilterString := 'CR_EMISOR.ID_ACREDITADO = ' + Objeto.ID_ACREDITADO.AsString;
      Objeto.Emisor.BuscaWhereString := Objeto.Emisor.FilterString;

      {Activa emisor}
      Objeto.Emisor.FindKey( [ Objeto.ID_ACREDITADO.AsString, vlCveSubDiv ] );

    end else
    begin
       if Objeto.CVE_TIPO_ACRED.AsString = C_PROCA then
          GetSQLInt(  coSqlProcam + Objeto.ID_ACREDITADO.AsString, Objeto.Apli.DataBaseName,
                      Objeto.Apli.SessionName, 'NUM_VECES',  vlCnt, False );
       //end if
       vlFlage := ( vlCnt > 0 );
       edCVE_EMISOR_NAFIN.Enabled    := vlFlage;
       btEmisNafin.Enabled           := vlFlage;
       edNOMBRE_EMISOR_NAFIN.Enabled := vlFlage;

       if vlFlage then
       begin
          // CUANDO ES UN REGISTRO NUEVO, SELECCIONA UNA CLAVE DE SUBDIVISION POR DEFAULT (LA DE CODIGO ASCII MENOR)
          // YA QUE NO SIEMPRE SE VA A TENER UNA CLAVE SUBDIVISION = 0, A NIVEL CR_SUBDIV_PROCAM
          vlSqlEN := Format( coSqlAcrProcam, [ Objeto.ID_ACREDITADO.AsString ] );
          GetSQLStr(  vlSqlEN, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,
                        'CVE_SUB_DIVISION',  vlCveSubDiv, False );

          {Aplica los filtros correspondientes}
          Objeto.SubdivProcam.BuscaWhereString := 'CR_SUBDIV_PROCAM.ID_ACREDITADO = ' + Objeto.Persona.Id_Persona.AsString;
          Objeto.SubdivProcam.FilterString := Objeto.SubdivProcam.BuscaWhereString;

          {Activa emisor}
          Objeto.CVE_EMISOR_NAFIN.AsString := vlCveSubDiv;
          Objeto.SubdivProcam.FindKey( [ Objeto.ID_ACREDITADO.AsString, vlCveSubDiv ] );
        end else
        Begin
            Objeto.Emisor.Active := False;
            Objeto.CVE_EMISOR_NAFIN.AsString := '0';
        end;
    end;
  end;//ends_if_InterForma1.IsNewData
end;



procedure TWCrCredCheq.btEmisNafinClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCRECHE_SUBDV',True,True) then
   begin
     if Objeto.CVE_TIPO_ACRED.AsString = C_ACRED THEN
     BEGIN
        Objeto.Emisor.ShowAll := True;
        if Objeto.Emisor.Busca then
          InterForma1.NextTab(edCVE_EMISOR_NAFIN);
     END
     ELSE if Objeto.CVE_TIPO_ACRED.AsString = C_PROCA THEN
     BEGIN
        Objeto.SubdivProcam.ShowAll := True;
        if Objeto.SubdivProcam.Busca then
          InterForma1.NextTab(edCVE_EMISOR_NAFIN);
     END;
   end;
end;


procedure TWCrCredCheq.ilEmisorNafinEjecuta(Sender: TObject);
begin
   if Objeto.CVE_TIPO_ACRED.AsString = C_ACRED THEN
   BEGIN
      if Objeto.Emisor.FindKey([ Objeto.ID_ACREDITADO.AsString, ilEmisorNafin.Buffer ]) then
        InterForma1.NextTab(edCVE_EMISOR_NAFIN);
   END
   ELSE if Objeto.CVE_TIPO_ACRED.AsString = C_PROCA THEN
   BEGIN
      if Objeto.SubdivProcam.FindKey([ Objeto.ID_ACREDITADO.AsString, ilEmisorNafin.Buffer ]) then
        InterForma1.NextTab(edCVE_EMISOR_NAFIN);
   END;
end;

procedure TWCrCredCheq.ilEmisorNafinCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;


procedure TWCrCredCheq.rgCVE_TIP_ACREDClick(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      ColocaTipoAcreditado;
   //END IF
end;


// +---------------------------------------------------------------------------+
// +          SECUENCIA DE CAPTURA/MODIFICACION DE LAS CHEQUERAS               +
// +---------------------------------------------------------------------------+

//  CAPTURA EL ACREDITADO
Procedure TWCrCredCheq.edID_ACREDITADOExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMesg    :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMesg   := CNULL;
      vlSalida := True;
      Objeto.ID_ACREDITADO.GetFromControl;
      if Objeto.ID_ACREDITADO.AsString = CNULL then
      Begin
         vlSalida  := False;
         vlMesg    := 'Favor de Indicar el Acreditado';
      end;
      { COLOCA DE ACUERDO AL TIPO DE ACREDITADO }
      ColocaTipoAcreditado;

    //EASA  REQ. 20007 - 07 / 018   CARTERA IMPAGADA
    InterForma1.MsgPanel.Caption := '';
    InterForma1.MsgPanel.Color := clBtnFace;
    InterForma1.MsgPanel.Font.Color := clWhite;
    if Objeto.CVE_TIPO_ACRED.AsString = C_PROVE then
    Begin
      if not ( FindDispIMPProv(Objeto.ID_ACREDITADO.AsInteger,Objeto.Apli, vlMesg)) then
      Begin
         if MessageDlg(vlMesg + ', desea ver el detalle?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
         Begin
            Objeto.DetImpagado := TCrCartrIm.Create(self);
            Try
              Objeto.DetImpagado.Apli:= Objeto.Apli;
              Objeto.DetImpagado.ID_ACREDITADO.AsString := Objeto.ID_ACREDITADO.ASstring;
              Objeto.DetImpagado.NOM_ACREDITADO.AsString := Objeto.Persona.Nombre.asstring;
              Objeto.DetImpagado.TIPO_CLIENTE.AsString := C_PROVE;
              Objeto.DetImpagado.ParamCre:=Objeto.ParamCre;
              Objeto.DetImpagado.Catalogo;
            finally
              Objeto.DetImpagado.Free;
            end;
         end;
      end;
    End
    Else
    Begin
        if not ( FindDispIM(Objeto.ID_ACREDITADO.AsInteger,Objeto.Apli, vlMesg )) then
        Begin
           InterForma1.MsgPanel.Caption := vlMesg;
           InterForma1.MsgPanel.Color := clRed;
           InterForma1.MsgPanel.Font.Color := clWhite;
           if MessageDlg(vlMesg + ', desea ver el detalle?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Begin
              Objeto.DetImpagado := TCrCartrIm.Create(self);
              Try
                Objeto.DetImpagado.Apli:= Objeto.Apli;
                Objeto.DetImpagado.ID_ACREDITADO.AsString := Objeto.ID_ACREDITADO.ASstring;
                Objeto.DetImpagado.NOM_ACREDITADO.AsString := Objeto.persona.nombre.asstring;
                Objeto.DetImpagado.ParamCre:=Objeto.ParamCre;
                Objeto.DetImpagado.Catalogo;
              finally
                Objeto.DetImpagado.Free;
              end;
           end;
        end;
        //END EASA
      end;

      InterForma1.ValidaExit(edID_ACREDITADO,VLSalida,VLMesg,True);
   end;
end;

//  INDICA EL TIPO DE PERSONA ( ACREDITADO -- PROVEEDOR )
procedure TWCrCredCheq.rgCVE_TIP_ACREDExit(Sender: TObject);
begin
   { VALIDA EL ON EXIT }
   InterForma1.ValidaExit(rgCVE_TIP_ACRED,True,CNULL,True);
end;

//  INDICA LA SUBDIVISION SI SE TRATA DE DESCUENTO DE DOCUMENTOS.
procedure TWCrCredCheq.edCVE_EMISOR_NAFINExit(Sender: TObject);
var  vlSalida  :  boolean;
     VLMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg := CNULL;
      VLSalida := True;
      Objeto.CVE_EMISOR_NAFIN.GetFromControl;
      if Objeto.CVE_EMISOR_NAFIN.AsString = CNULL then
      Begin
         VLSalida := False;
         VlMsg    := 'Debe indicar la subdivisión del Emisor';
      end;
      InterForma1.ValidaExit( edCVE_EMISOR_NAFIN, VLSalida, VLMsg, True );
   end;
end;

//  INDICA EL TIPO DE CHEQUERA QUE SE VA A REGISTRAR ( ADMINISTRATIVA O DE LIQUIDACION )
procedure TWCrCredCheq.rgCVE_TIP_CHEQExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_TIP_CHEQ,True,CNULL,True);
end;

//  ESPECIFICA SI DESEA RELACIONAR LA CHEQUERA CON UNA DISPOSICION EN PARTICULAR
procedure TWCrCredCheq.chB_REL_CREDITOExit(Sender: TObject);
begin
   //filtra solo sus disposiciones
   Objeto.Credito.BuscaWhereString := 'CR_CREDITO.ID_CONTRATO  IN (SELECT ID_CONTRATO FROM CONTRATO WHERE ID_TITULAR = ' +
                                      Objeto.ID_ACREDITADO.AsString + ')' +
                                      'AND CR_CREDITO.SIT_CREDITO NOT IN (''CA'',''LQ'')' ;
   Objeto.Credito.FilterString := Objeto.Credito.BuscaWhereString;

   InterForma1.ValidaExit(chB_REL_CREDITO,True,CNULL,True);
end;

//  VALIDA LA DISPOSICION ( SI APLICA )
procedure TWCrCredCheq.edID_CREDITOExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VlMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg := CNULL;
      VLSalida := True;
      Objeto.ID_CREDITO.GetFromControl;
      if Objeto.ID_CREDITO.AsString = CNULL then
      Begin
         VLSalida := False;
         VlMsg :='Debe de indicar el Crédito';
      end;
      InterForma1.ValidaExit(edID_CREDITO,VLSalida,VLMsg,True);
   end;
end;
//  VALIDA EL NUMERO DE CUENTA Y BANCO
procedure TWCrCredCheq.btCtaBancoExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VlMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg := CNULL;
      VLSalida := True;
      Objeto.CUENTA_BANCO.GetFromControl;
      if Objeto.CUENTA_BANCO.AsString = CNULL then
      Begin
         VLMsg := 'Favor de Indicar la Cuenta bancaria';
         VLSalida := False;
      end;
      InterForma1.ValidaExit(btCtaBanco,VLSalida,VLMsg,True);
   end;
end;
//  VALIDA EL TIPO DE OPERACION DE LA CHEQUERA.
procedure TWCrCredCheq.rgCVE_TIP_OPE_CHQExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_TIP_OPE_CHQ,True,CNULL,True);
end;
//  VALIDA SI ES CHEQUERA PREDETERMINADA.
procedure TWCrCredCheq.chB_PREDETERMINADAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_PREDETERMINADA,True,CNULL,True);
end;
//  FINALMENTE VALIDA LA SITUACION DE LA CHEQUERA ( ACTIVA O INACTIVA )
procedure TWCrCredCheq.rgSIT_CHEQUERAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(rgSIT_CHEQUERA,True,CNULL,True);
end;

procedure TWCrCredCheq.chB_PREDETERMINADAClick(Sender: TObject);
begin
// RABA ENE 2012
//   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
{   if ( ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) AND (rgSIT_CHEQUERA.ItemIndex <> 1) ) Then
// RABA
   Begin
        Objeto.SIT_CHEQUERA.GetFromControl;
//        if CountChequera( CPRED,CNULL ) <= 1 then
        if CountChequera( CPRED,CNULL ) = 0 then
        BEgin
          if ( Objeto.B_PREDETERMINADA.AsString = CVERDAD ) then
          Begin
             chB_PREDETERMINADA.Checked := True;
             vgactualiza:= False;
          end;
        end
   end;
   }
end;

procedure TWCrCredCheq.btMONEDAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCRECHE_MON',True,True) then
   begin
     Objeto.Moneda.ShowAll := True;
     if Objeto.Moneda.Busca then
        InterForma1.NextTab(edCVE_MONEDA);
     //end if
   end;
end;

procedure TWCrCredCheq.ilMonedaEjecuta(Sender: TObject);
begin
   if Objeto.Moneda.FindKey([ilMoneda.Buffer]) then
      InterForma1.NextTab(edCVE_MONEDA);
   //end if
end;

procedure TWCrCredCheq.ilMonedaCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrCredCheq.edCVE_MONEDAExit(Sender: TObject);
Var    vlSalida        : Boolean;
       vlMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := CNULL;
      vlSalida := True;
      Objeto.CVE_MONEDA.GetFromControl;
      if Objeto.CVE_MONEDA.AsString = CNULL then
      Begin
         vlMsg := 'Favor de Indicar la Moneda';
         vlSalida := False;
      end;
      vgLiqMoneda:= ObtLiqMoneda(Objeto.CVE_MONEDA.AsString , Objeto.Apli);
      InterForma1.ValidaExit(edCVE_MONEDA,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrCredCheq.chB_CTA_TERCEROSExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_CTA_TERCEROS,True,'',True);
end;

procedure TWCrCredCheq.btREPORTEClick(Sender: TObject);
var CtaAcred : TCrMCtaAcr;
begin
   if Objeto.ValidaAccesoEsp('TCRCRECHE_REPOR',True,True) then
   begin
     {$WARNINGS OFF}
     CtaAcred := TCrMCtaAcr.Create(Self);
     {$WARNINGS ON}
     try
        CtaAcred.Apli:=Objeto.Apli;
        CtaAcred.vgAcreditado := Objeto.ID_ACREDITADO.AsString;
        CtaAcred.ParamCre:=Objeto.ParamCre;
        CtaAcred.Catalogo;
     finally
            CtaAcred.Free;
     end;
   end;
end;

procedure TWCrCredCheq.BitBtn1Click(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCRECHE_BITAC',True,True) then
   begin
     if Objeto.Active then
     Begin
         {$WARNINGS OFF}
         Objeto.BitUpdCheq := TCrBitCheq.Create(Self);
         {$WARNINGS ON}
         try
            Objeto.BitUpdCheq.Apli:=Objeto.Apli;
            Objeto.BitUpdCheq.ParamCre:=Objeto.ParamCre;
  {
          VG_MONEDA                : String;
          VG_DISPOSICION           : String;
          VG_B_DISP_CHQ            : Boolean;
          VG_TIPO_ACRED            : String;
          VG_SUB_DIV               : String;
          VG_TIP_CHEQ              : String;
          VG_CHEQRA                : String;
          VG_BCO_CHQ               : String;

          CVE_TIPO_CHEQ
          ID_CREDITO
          ID_BANCO_CHQRA
          CUENTA_BANCO
   }
            Objeto.BitUpdCheq.vg_Acreditado := Objeto.ID_Acreditado.AsString;
            Objeto.BitUpdCheq.vg_Tipo_Acred := Objeto.CVE_TIPO_ACRED.AsString;
            Objeto.BitUpdCheq.VG_SUB_DIV    := Objeto.CVE_EMISOR_NAFIN.AsString;
            Objeto.BitUpdCheq.VG_TIP_CHEQ   := Objeto.CVE_TIPO_CHEQ.AsString;
            Objeto.BitUpdCheq.VG_DISPOSICION := Objeto.ID_CREDITO.AsString;
            Objeto.BitUpdCheq.VG_BCO_CHQ     := Objeto.ID_BANCO_CHQRA.AsString;
            Objeto.BitUpdCheq.VG_CHEQRA      := Objeto.CUENTA_BANCO.AsString;
            Objeto.BitUpdCheq.Catalogo;
         finally
               if Objeto.BitUpdCheq <> nil then
                  Objeto.BitUpdCheq.Free;
               //end if
         end;
     end
     else ShowMessage('No esiste resgistro Activo');
   end;  
end;

procedure TWCrCredCheq.rgSIT_CHEQUERAClick(Sender: TObject);
begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  begin
    If ((rgSIT_CHEQUERA.ItemIndex=1) and (chB_PREDETERMINADA.Checked)) Then
         chB_PREDETERMINADA.Checked := False;
  end;
end;

End.
