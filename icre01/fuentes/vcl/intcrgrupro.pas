// Sistema         : Clase de CR_GRUPO_PROV
// Fecha de Inicio : 19/11/2003
// Función forma   : Clase de CR_GRUPO_PROV
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrGruPro;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,Ungene,
//UNIDADES ADICIONALES
IntParamCre, IntSGCtrl,IntGenCre, IntLinkit,IntCrEmGpPr,IntCrProveed,
IntMInstDesc
;

Type
 TCrGruPro= class; 

  TWCrGrupoProv=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_GRUPO_EMIS : TLabel; 
    edCVE_GRUPO_EMIS : TEdit;
    lbID_PROVEEDOR : TLabel; 
    edID_PROVEEDOR : TEdit; 
    rgSIT_GRUPO_PROV : TRadioGroup;
    lbID_EMISOR: TLabel;
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    LBCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    Panel3: TPanel;
    sgcDATA: TSGCtrl;
    btELIMINAR: TBitBtn;
    edGRUPO_PROV: TEdit;
    btPROVEEDOR: TBitBtn;
    BBBcoDeposito: TBitBtn;
    edNOM_PROV: TEdit;
    btADD_PROV: TBitBtn;
    btREG_GPO: TBitBtn;
    edID_EMISOR: TEdit;
    edNOM_EMISOR: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    MsgPanel: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ilPROVEEDOR: TInterLinkit;
    ilGPO_PROV: TInterLinkit;
    Panel5: TPanel;
    Label8: TLabel;
    edCVE_FND_ENT_DES: TEdit;
    btnCVE_FND_ENT_DES: TBitBtn;
    edDESC_ENT_DES: TEdit;
    ilCVE_FND_ENT_DES: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure BBBcoDepositoClick(Sender: TObject);
    procedure ilGPO_PROVEjecuta(Sender: TObject);
    procedure edCVE_GRUPO_EMISExit(Sender: TObject);
    procedure btPROVEEDORClick(Sender: TObject);
    procedure ilPROVEEDOREjecuta(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure btREG_GPOClick(Sender: TObject);
    procedure btADD_PROVClick(Sender: TObject);
    procedure btELIMINARClick(Sender: TObject);
    procedure sgcDATAMoveRow(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure rgSIT_GRUPO_PROVClick(Sender: TObject);
    procedure sgcDATACalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure btnCVE_FND_ENT_DESClick(Sender: TObject);
    procedure btnCVE_FND_ENT_DESExit(Sender: TObject);
    procedure ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
    procedure edCVE_FND_ENT_DESExit(Sender: TObject);
    private
    { Private declarations }
        vlTotalGpo : Double;
    Function  CadenaSql : String;
    Procedure MuestraDatos;
    Function  MontoAcum(pMontoAcumProv : Double): Double;
    Function  ValidaMontoAcum(pMontoAcum : Double): String;
    public
    { Public declarations }
    Objeto : TCrGruPro;
end;
 TCrGruPro= class(TInterFrame)
      private
         Function    AgregaProveedor(peEntDes,peGpo,peProveedor,peSit,peFAlta : String) : Boolean;
         Procedure   CancelaProv(peEntDes,peGpo,peProveedor,peSit : String);
         Procedure   EliminaProv(peEntDes,peGpo,peProveedor : String);
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_FND_ENT_DES          : TInterCampo;
        CVE_GRUPO_EMIS           : TInterCampo;
        ID_PROVEEDOR             : TInterCampo;
        SIT_GRUPO_PROV           : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;

        ParamCre                 : TParamCre;
        EmisGpoPrv               : TCrEmGpPr;
        Proveedor                : TCrProveed;
        MInstDesc                : TMInstDesc;
         
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrGruPro.Create( AOwner : TComponent );
begin Inherited;
      CVE_FND_ENT_DES :=CreaCampo('CVE_FND_ENT_DES',ftString,tsNinguno,tsNinguno,True);
                CVE_FND_ENT_DES.Caption:='Clave de Fnd Ent Des';
      CVE_GRUPO_EMIS :=CreaCampo('CVE_GRUPO_EMIS',ftString,tsNinguno,tsNinguno,True);
                CVE_GRUPO_EMIS.Caption:='Grupo Proveedor';
      ID_PROVEEDOR :=CreaCampo('ID_PROVEEDOR',ftFloat,tsNinguno,tsNinguno,True);
                ID_PROVEEDOR.Caption:='Proveedor';
      SIT_GRUPO_PROV :=CreaCampo('SIT_GRUPO_PROV',ftString,tsNinguno,tsNinguno,True);
         With SIT_GRUPO_PROV do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
                ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
          end;
                SIT_GRUPO_PROV.Caption:='Situación del Proveedor dentro de un Grupo';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';

      FKeyFields.Add('CVE_FND_ENT_DES');
      FKeyFields.Add('CVE_GRUPO_EMIS');
      FKeyFields.Add('ID_PROVEEDOR');

      TableName := 'CR_GRUPO_PROV';
      UseQuery := True;
      HelpFile := 'IntCrGruPro.Hlp';
      ShowMenuReporte:=True;

      EmisGpoPrv := TCrEmGpPr.Create(Self);
      EmisGpoPrv.MasterSource:=Self;
      EmisGpoPrv.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
      EmisGpoPrv.FieldByName('CVE_GRUPO_PROV').MasterField:='CVE_GRUPO_EMIS';

      Proveedor := TCrProveed.Create(Self);
      Proveedor.MasterSource:=Self;
      Proveedor.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
      Proveedor.FieldByName('ID_ACREDITADO').MasterField:='ID_PROVEEDOR';

      MInstDesc := TMInstDesc.Create(Self);
      MInstDesc.MasterSource:= Self;
      MInstDesc.FieldByName('CVE_FND_ENT_DES').MasterField:= 'CVE_FND_ENT_DES';
end;

Destructor TCrGruPro.Destroy;
begin
   if MInstDesc <> nil then
      MInstDesc.Free;
   if Proveedor <> nil then
      Proveedor.Free;
   if EmisGpoPrv <> nil then
      EmisGpoPrv.Free;
   inherited;
end;


function TCrGruPro.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrGrupoProv;
begin
   W:=TWCrGrupoProv.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrGruPro.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrGrPr.it','S,S,F');
      Try
         if Active then begin
            T.Param(0,CVE_FND_ENT_DES.AsString);
            T.Param(1,CVE_GRUPO_EMIS.AsString);
            T.Param(2,ID_PROVEEDOR.AsString);
         end;
         if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end;
end;
{--------------------------------------------------------------------------------------------------------------------
                                AGREGA PROVEEDOR
---------------------------------------------------------------------------------------------------------------------}
Function TCrGruPro.AgregaProveedor(peEntDes,peGpo,peProveedor,peSit,peFAlta : String) : Boolean;
var vlsql       : String;
    vlResultado : Boolean;
Begin
   vlResultado := False;
   vlsql := ' INSERT INTO CR_GRUPO_PROV(CVE_FND_ENT_DES,CVE_GRUPO_EMIS,ID_PROVEEDOR,SIT_GRUPO_PROV, ' +
                                       ' F_ALTA,CVE_USU_ALTA,F_MODIFICA,CVE_USU_MODIFICA ) ' +
            ' VALUES('+ #39 + peEntDes+ #39+ ',' + #39 + peGpo + #39 + ',' + peProveedor + ',' + #39 + peSit + #39 + ','+
                     'TO_DATE( ' + #39 + peFAlta + #39 + ','+ #39 + 'DD/MM/YYYY' + #39 + ')' +
                         ',' + #39 + Apli.Usuario+ #39 + ', NULL, NULL)';
   vlResultado := RunSQL(vlsql,Apli.DataBaseName,Apli.SessionName,False);
   AgregaProveedor := vlResultado;
End;
{--------------------------------------------------------------------------------------------------------------------
                                ELIMINA PROVEEDOR
---------------------------------------------------------------------------------------------------------------------}
procedure TCrGruPro.EliminaProv(peEntDes,peGpo, peProveedor: String);
var vlsql       : String;
Begin
   vlsql := ' DELETE CR_GRUPO_PROV ' +
            ' WHERE CVE_FND_ENT_DES = ' + #39 + peEntDes + #39 +
            ' AND CVE_GRUPO_EMIS = ' + #39 + peGpo + #39 +
            ' AND ID_PROVEEDOR = ' + peProveedor;
   RunSQL(vlsql,Apli.DataBaseName,Apli.SessionName,False);
end;
{--------------------------------------------------------------------------------------------------------------------
                                Actualiza Situacion
---------------------------------------------------------------------------------------------------------------------}
procedure TCrGruPro.CancelaProv(peEntDes,peGpo,peProveedor,peSit : String);
var vlsql       : String;
Begin
   vlsql := ' UPDATE CR_GRUPO_PROV ' +
            ' SET SIT_GRUPO_PROV = ' + #39 + peSit + #39 +
            ' , F_MODIFICA = ' + 'TO_DATE( ' + #39 + F_ALTA.AsString + #39 + ','+ #39 + 'DD/MM/YYYY' + #39 + ')' +
            ' , CVE_USU_MODIFICA = ' + #39 + Apli.Usuario + #39 +
            ' WHERE CVE_FND_ENT_DES = ' + #39 + peEntDes + #39 +
            ' AND CVE_GRUPO_EMIS = ' + #39 + peGpo + #39 +
            ' AND ID_PROVEEDOR = ' + peProveedor;
   RunSQL(vlsql,Apli.DataBaseName,Apli.SessionName,False);
End;
(***********************************************FORMA CR_GRUPO_PROV********************)
(*                                                                              *)
(*  FORMA DE CR_GRUPO_PROV                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GRUPO_PROV********************)
Function TWCrGrupoProv.CadenaSql : String;
var vlsql : String;
Begin
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
   vlsql := ' SELECT GP.CVE_GRUPO_EMIS, ' +
            '        GE.ID_EMISOR, ' +
            '        E.NOMBRE AS EMISOR, ' +
            '        PR.CVE_FND_ENT_DES, '+
            '        PR.ID_ACREDITADO, ' +
            '        P.NOMBRE AS PROVEEDOR, ' +
            '        PR.ID_PROV_EXTERNO, ' +
            '        NVL(PKGCRPERIODO.StpObtRiesgoAcum(GE.CVE_FND_ENT_DES,GE.ID_EMISOR,PR.ID_ACREDITADO),0) AS RIESGOACUM,' +
            '        GP.SIT_GRUPO_PROV ' +
            ' FROM  CR_PROVEEDOR PR, ' +
            '       CR_GRUPO_PROV GP, ' +
            '       PERSONA P, ' +
            '       PERSONA E, ' +
            '       CR_EMIS_GPO_PRO GE ' +
            ' WHERE PR.CVE_FND_ENT_DES = GP.CVE_FND_ENT_DES '+
            '   AND PR.ID_ACREDITADO = GP.ID_PROVEEDOR ' +
            '   AND P.ID_PERSONA = GP.ID_PROVEEDOR ' +
            '   AND GE.CVE_FND_ENT_DES = GP.CVE_FND_ENT_DES ' +
            '   AND GE.CVE_GRUPO_PROV = GP.CVE_GRUPO_EMIS ' +
            '   AND E.ID_PERSONA = GE.ID_EMISOR ';
{/ROIM}
            if Objeto.EmisGpoPrv.ID_EMISOR.AsString <> CNULL then
               vlSql := vlSql + ' AND GE.ID_EMISOR = ' + Objeto.EmisGpoPrv.ID_EMISOR.AsString;
            //end if
            if edCVE_GRUPO_EMIS.Text <> CNULL then
               vlSql := vlSql + ' AND GP.CVE_GRUPO_EMIS = ' + #39 + edCVE_GRUPO_EMIS.Text + #39;
            //end if
            vlSql := vlSql + ' ORDER BY PR.ID_ACREDITADO ';

   CadenaSql := vlSql;
end;

Procedure TWCrGrupoProv.MuestraDatos;
var vlQry : TQuery;
begin
  vlQry := GetSQLQuery(CadenaSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     Try
        If vlQry <> Nil Then Begin
            vlQry.FieldByName('CVE_GRUPO_EMIS').Visible := False;
            vlQry.FieldByName('ID_EMISOR').Visible := False;
            vlQry.FieldByName('EMISOR').Visible := False;
            vlQry.FieldByName('CVE_FND_ENT_DES').Visible := False;
//            vlQry.FieldByName('RIESGOACUM').Visible := False;

            vlQry.FieldByName('ID_ACREDITADO').DisplayLabel := 'PROVEEDOR' + #30 +'>C';
            vlQry.FieldByName('PROVEEDOR').DisplayLabel := 'NOMBRE' + #30 +'>C';
            vlQry.FieldByName('ID_PROV_EXTERNO').DisplayLabel := 'ID EXTERNO' + #30 +'>C';
            vlQry.FieldByName('RIESGOACUM').DisplayLabel := 'RIESGO ACUM.' + #30 +'>C';
            vlQry.FieldByName('SIT_GRUPO_PROV').DisplayLabel := 'SITUACION GRUPO' + #30 +'>C';

            vlQry.FieldByName('ID_ACREDITADO').DisplayWidth :=  15;
            vlQry.FieldByName('PROVEEDOR').DisplayWidth :=  55;
            vlQry.FieldByName('ID_PROV_EXTERNO').DisplayWidth := 20;
            vlQry.FieldByName('RIESGOACUM').DisplayWidth := 20;
            vlQry.FieldByName('SIT_GRUPO_PROV').DisplayWidth := 4;

            TNumericField(vlQry.FieldByName('RIESGOACUM')).DisplayFormat := '###,###,###,###,###,###,##0.00';

            sgcDATA.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY
        End;
        Finally
        If vlQry <> Nil Then
           vlQry.free;
        //end if
        End;
end;

procedure TWCrGrupoProv.FormShow(Sender: TObject);
begin
      // Pinta datos del panel
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_FND_ENT_DES.Control:=edCVE_FND_ENT_DES;
      Objeto.CVE_GRUPO_EMIS.Control:=edCVE_GRUPO_EMIS;
      Objeto.ID_PROVEEDOR.Control:=edID_PROVEEDOR;
      Objeto.SIT_GRUPO_PROV.Control:=rgSIT_GRUPO_PROV;
      Objeto.F_ALTA.Control := edF_ALTA;
      Objeto.CVE_USU_ALTA.Control := edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control := edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control := edCVE_USU_MODIFICA;

      Objeto.EmisGpoPrv.CVE_GRUPO_PROV.Control:= edCVE_GRUPO_EMIS;
      Objeto.EmisGpoPrv.DESC_GRUPO_PROV.Control := edGRUPO_PROV;
      Objeto.EmisGpoPrv.ID_EMISOR.Control := edID_EMISOR;
      Objeto.EmisGpoPrv.Emisor.Acreditado.Persona.Nombre.Control := edNOM_EMISOR;
      Objeto.EmisGpoPrv.GetParams(Objeto);

      Objeto.Proveedor.ID_ACREDITADO.Control:=edID_PROVEEDOR;
      Objeto.Proveedor.Persona.Nombre.Control := edNOM_PROV;
      Objeto.Proveedor.GetParams(Objeto);

      Objeto.MInstDesc.CVE_FND_ENT_DES.Control:=edCVE_FND_ENT_DES;
      Objeto.MInstDesc.DESC_ENT_DES.Control:=edDESC_ENT_DES;
      Objeto.MInstDesc.GetParams(Objeto);
end;

procedure TWCrGrupoProv.FormDestroy(Sender: TObject);
begin Objeto.CVE_FND_ENT_DES.Control:=nil;
      Objeto.CVE_GRUPO_EMIS.Control:=nil;
      Objeto.ID_PROVEEDOR.Control:=nil;
      Objeto.SIT_GRUPO_PROV.Control:=nil;
      Objeto.F_ALTA.Control := nil;
      Objeto.CVE_USU_ALTA.Control := nil;
      Objeto.F_MODIFICA.Control := nil;
      Objeto.CVE_USU_MODIFICA.Control := nil;
      Objeto.EmisGpoPrv.CVE_GRUPO_PROV.Control:=nil;
      Objeto.EmisGpoPrv.DESC_GRUPO_PROV.Control := nil;
      Objeto.EmisGpoPrv.ID_EMISOR.Control := nil;
      Objeto.EmisGpoPrv.Emisor.Acreditado.Persona.Nombre.Control := nil;
      Objeto.Proveedor.ID_ACREDITADO.Control:=nil;
      Objeto.Proveedor.Persona.Nombre.Control := nil;
      Objeto.MInstDesc.CVE_FND_ENT_DES.Control:=nil;
      Objeto.MInstDesc.DESC_ENT_DES.Control:=nil;
end;

procedure TWCrGrupoProv.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrGrupoProv.InterForma1DespuesNuevo(Sender: TObject);
begin
   edCVE_FND_ENT_DES.SetFocus;
end;

procedure TWCrGrupoProv.InterForma1DespuesModificar(Sender: TObject);
begin
   edCVE_GRUPO_EMIS.SetFocus;
end;

procedure TWCrGrupoProv.BBBcoDepositoClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGRUPRO_GPOPRV',True,True) then
   begin
     Objeto.CVE_FND_ENT_DES.GetFromControl;
     If Objeto.CVE_FND_ENT_DES.AsString <> '' Then Begin
        Objeto.EmisGpoPrv.BuscaWhereString := ' CR_EMIS_GPO_PRO.CVE_FND_ENT_DES = ' + #39 + Objeto.CVE_FND_ENT_DES.AsString + #39;
        Objeto.EmisGpoPrv.FilterString := Objeto.EmisGpoPrv.BuscaWhereString;
     End;

     Objeto.EmisGpoPrv.ShowAll := True;
     If Objeto.EmisGpoPrv.Busca Then Begin
        Objeto.EmisGpoPrv.Emisor.FindKeyNear([Objeto.EmisGpoPrv.CVE_FND_ENT_DES.AsString,
                                              Objeto.EmisGpoPrv.ID_EMISOR.AsString],
                                             ['CVE_FND_ENT_DES','ID_ACREDITADO']);
        MuestraDatos;
        Interforma1.NextTab(edCVE_GRUPO_EMIS);
     End;
   end;
end;

procedure TWCrGrupoProv.ilGPO_PROVEjecuta(Sender: TObject);
begin
   Objeto.CVE_FND_ENT_DES.GetFromControl;
   If Objeto.CVE_FND_ENT_DES.AsString <> '' Then Begin
      Objeto.EmisGpoPrv.BuscaWhereString := ' CR_EMIS_GPO_PRO.CVE_FND_ENT_DES = ' + #39 + Objeto.CVE_FND_ENT_DES.AsString + #39;
      Objeto.EmisGpoPrv.FilterString := Objeto.EmisGpoPrv.BuscaWhereString;
   End;

   If Objeto.EmisGpoPrv.FindKeyNear([Objeto.CVE_FND_ENT_DES.AsString, ilGPO_PROV.Buffer],['CVE_FND_ENT_DES','CVE_GRUPO_PROV']) Then Begin
      Objeto.EmisGpoPrv.Emisor.FindKeyNear([Objeto.EmisGpoPrv.CVE_FND_ENT_DES.AsString, Objeto.EmisGpoPrv.ID_EMISOR.AsString],['CVE_FND_ENT_DES','ID_ACREDITADO']);
      MuestraDatos;
      Interforma1.NextTab(edCVE_GRUPO_EMIS);
   end;
end;

procedure TWCrGrupoProv.edCVE_GRUPO_EMISExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMesg     :  String;
begin
   Objeto.Proveedor.BuscaWhereString := ' CR_PROVEEDOR.ID_ACREDITADO IN ( SELECT ID_PROVEEDOR  FROM  CR_EMISOR_PROV ' +
                                                        ' WHERE SIT_EMISOR_PROV = '+ #39+ CSIT_AC + #39;
   If Objeto.EmisGpoPrv.ID_EMISOR.AsString <> CNULL Then Begin
      Objeto.Proveedor.BuscaWhereString := Objeto.Proveedor.BuscaWhereString +
                                           ' AND ID_EMISOR = ' + Objeto.EmisGpoPrv.ID_EMISOR.AsString;
   end;
   Objeto.Proveedor.BuscaWhereString := Objeto.Proveedor.BuscaWhereString + ' ) ';
   If Objeto.MInstDesc.CVE_FND_ENT_DES.AsString <> '' Then Begin
      Objeto.Proveedor.BuscaWhereString:= Objeto.Proveedor.BuscaWhereString +
                                        ' AND CR_PROVEEDOR.CVE_FND_ENT_DES ='+ #39+ Objeto.MInstDesc.CVE_FND_ENT_DES.AsString + #39;
   End;
   Objeto.Proveedor.FilterString := Objeto.Proveedor.BuscaWhereString;
//   if edID_PROVEEDOR.Text <> CNULL then
//      Objeto.Proveedor.Active := False;
end;

procedure TWCrGrupoProv.btPROVEEDORClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGRUPRO_PROV',True,True) then
   begin
     Objeto.CVE_FND_ENT_DES.GetFromControl;
     If Objeto.CVE_FND_ENT_DES.AsString <> '' Then Begin
        Objeto.Proveedor.BuscaWhereString := ' CR_PROVEEDOR.CVE_FND_ENT_DES = ' + #39 + Objeto.CVE_FND_ENT_DES.AsString + #39;
        Objeto.Proveedor.FilterString := Objeto.Proveedor.BuscaWhereString;
     End;

     Objeto.Proveedor.ShowAll := True;
     Objeto.Proveedor.Busca;//then
  //      InterForma1.NextTab(edID_PROVEEDOR);
     //end if
   end;
end;

procedure TWCrGrupoProv.ilPROVEEDOREjecuta(Sender: TObject);
begin
   Objeto.CVE_FND_ENT_DES.GetFromControl;
   If Objeto.CVE_FND_ENT_DES.AsString <> '' Then Begin
      Objeto.Proveedor.BuscaWhereString := ' CR_PROVEEDOR.CVE_FND_ENT_DES = ' + #39 + Objeto.CVE_FND_ENT_DES.AsString + #39;
      Objeto.Proveedor.FilterString := Objeto.Proveedor.BuscaWhereString;
   End;

   Objeto.Proveedor.FindKeyNear([Objeto.CVE_FND_ENT_DES.AsString, ilPROVEEDOR.Buffer],['CVE_FND_ENT_DES','ID_ACREDITADO']);
//      InterForma1.NextTab(edID_PROVEEDOR);
   //end if
end;

procedure TWCrGrupoProv.InterForma1DespuesShow(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   Objeto.EmisGpoPrv.BuscaWhereString := ' SIT_GRUPO_PROV <> ' + #39 + CSIT_CA + #39 ;
   if Objeto.EmisGpoPrv.ID_EMISOR.AsString <> CNULL then
   Begin
      Objeto.EmisGpoPrv.FindKeyNear([Objeto.EmisGpoPrv.CVE_FND_ENT_DES.AsString, Objeto.EmisGpoPrv.ID_EMISOR.AsString],
                                    ['CVE_FND_ENT_DES','ID_EMISOR']);
      Objeto.EmisGpoPrv.Emisor.FindKeyNear([Objeto.EmisGpoPrv.CVE_FND_ENT_DES.AsString, Objeto.EmisGpoPrv.ID_EMISOR.AsString],
                                           ['CVE_FND_ENT_DES','ID_ACREDITADO']);
      Objeto.EmisGpoPrv.BuscaWhereString := Objeto.EmisGpoPrv.BuscaWhereString  +
                                           ' AND CR_EMIS_GPO_PRO.ID_EMISOR = ' + Objeto.EmisGpoPrv.ID_EMISOR.AsString;
      MuestraDatos;
   end;
      Objeto.EmisGpoPrv.FilterString := Objeto.EmisGpoPrv.BuscaWhereString;
      Objeto.Proveedor.FindKey([Objeto.Proveedor.CVE_FND_ENT_DES.AsString, Objeto.Proveedor.ID_ACREDITADO.AsString]);
end;

procedure TWCrGrupoProv.btREG_GPOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGRUPRO_REGGPO',True,True) then
   begin
     with Objeto do
     Begin
        CVE_GRUPO_EMIS.GetFromControl;
        EmisGpoPrv.GetParams(Objeto);
        EmisGpoPrv.FindKey([Objeto.MInstDesc.CVE_FND_ENT_DES.AsString,Objeto.EmisGpoPrv.ID_EMISOR.AsString,Objeto.CVE_GRUPO_EMIS.AsString]);
        EmisGpoPrv.ID_PROVEEDOR.AsString := edID_PROVEEDOR.Text;
        EmisGpoPrv.vlEntDesc := edCVE_FND_ENT_DES.Text;
        EmisGpoPrv.vlEmisor := edID_EMISOR.Text;
        EmisGpoPrv.ParamCre := Objeto.ParamCre;
        EmisGpoPrv.Catalogo;
     end;
   end;
end;

procedure TWCrGrupoProv.btADD_PROVClick(Sender: TObject);
var nRow,i       : Integer;
    vlExiste     : String;
    vlMonAcumProv : Double;
    vlMontoAcum   : Double;
    vlRiesgoAcum  : String;
begin
   if Objeto.ValidaAccesoEsp('TCRGRUPRO_AGRPRO',True,True) then
   begin
     nRow := 0;
     vlExiste := CFALSO;
     vlMonAcumProv := 0;
     if ( edCVE_GRUPO_EMIS.Text <> CNULL ) and ( edID_PROVEEDOR.Text <> CNULL) then
        if MessageDlg('¿Desea agregar el proveedor ' + edID_PROVEEDOR.Text + ' al grupo : ' + edCVE_GRUPO_EMIS.Text + ' ? ',
                       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Begin
           for i:= 0 to sgcDATA.SG.RowCount - 1 Do
           Begin
            if sgcDATA.CellStr['ID_ACREDITADO',nRow] = edID_PROVEEDOR.Text then
               Begin
                  showmessage('El proveedor ya existe');
                  vlExiste := CVERDAD;
                  Break;
               end;
             if sgcDATA.CellStr['SIT_GRUPO_PROV',nRow] <> CSIT_CA then
             Begin
                vlRiesgoAcum := sgcDATA.CellStr['RIESGOACUM',nRow];
                if vlRiesgoAcum = CNULL then
                   vlRiesgoAcum := '0';
                //end if
  //              vlMonAcumProv := vlMonAcumProv + StrToFloat(vlRiesgoAcum);
                vlMonAcumProv := vlMonAcumProv + CurrFromFrmFloat(vlRiesgoAcum);
             end;
             nRow := nRow + 1;
           end;
           vlMontoAcum := MontoAcum(vlMonAcumProv);
           vlExiste := ValidaMontoAcum(vlMontoAcum);

           if vlExiste = CFALSO then
           Begin
              Objeto.AgregaProveedor(edCVE_FND_ENT_DES.Text, edCVE_GRUPO_EMIS.Text,edID_PROVEEDOR.Text,
                                     CSIT_AC,Objeto.F_ALTA.AsString);
           end;
            MuestraDatos;
            Objeto.Proveedor.Active := False;
        end;
     //end if
   end;
end;

procedure TWCrGrupoProv.btELIMINARClick(Sender: TObject);
var vldatos : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRGRUPRO_ELMPRO',True,True) then
   begin
      vldatos := StrToIntDef( sgcDATA.CellStr[ 'ID_ACREDITADO', sgcDATA.SG.Row ], 0 );
      if vldatos > 0 then
      Begin
        if MessageDlg('¿Desea eliminar el proveedor ' +  sgcDATA.CellStr['ID_ACREDITADO',sgcDATA.SG.Row]+ ' ? ',
                       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Begin
           Objeto.EliminaProv(sgcDATA.CellStr['CVE_FND_ENT_DES',sgcDATA.SG.Row],
                              sgcDATA.CellStr['CVE_GRUPO_EMIS',sgcDATA.SG.Row],
                              sgcDATA.CellStr['ID_ACREDITADO',sgcDATA.SG.Row]);
           MuestraDatos;
           Objeto.FindKey([sgcDATA.CellStr['CVE_FND_ENT_DES',sgcDATA.SG.Row],
                           sgcDATA.CellStr['CVE_GRUPO_EMIS',sgcDATA.SG.Row],
                           sgcDATA.CellStr['ID_ACREDITADO',sgcDATA.SG.Row]]);
           Objeto.EmisGpoPrv.FindKey([sgcDATA.CellStr['CVE_FND_ENT_DES',sgcDATA.SG.Row],
                                      edID_EMISOR.Text,
                                      sgcDATA.CellStr['CVE_GRUPO_EMIS',sgcDATA.SG.Row]]);
        end;
      end;
   end;
end;

procedure TWCrGrupoProv.sgcDATAMoveRow(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
{   if sgcDATA.CellStr['ID_EMISOR',ToIndex] <> sgcDATA.CellStr['CVE_GRUPO_EMIS',ToIndex] then
   Begin                                                                   //PROVEEDOR
     Objeto.FindKey([sgcDATA.CellStr['CVE_GRUPO_EMIS',ToIndex],sgcDATA.CellStr['ID_ACREDITADO',ToIndex]]);
     Objeto.Proveedor.FindKey([sgcDATA.CellStr['ID_ACREDITADO',ToIndex]]);
     Objeto.EmisGpoPrv.FindKey([sgcDATA.CellStr['ID_EMISOR',ToIndex], Objeto.CVE_GRUPO_EMIS.AsString]);
   end;}
end;

procedure TWCrGrupoProv.rgSIT_GRUPO_PROVClick(Sender: TObject);
var nRow,i       : Integer;
    vlMonAcumProv: Double;
    vlMontoAcum  : Double;
    vlValida     : String;
    vlSituacion  : String;
begin
   if ( Objeto.CVE_GRUPO_EMIS.AsString <> CNULL ) AND ( Objeto.EmisGpoPrv.ID_EMISOR.AsString <> CNULL ) AND
      ( Objeto.ID_PROVEEDOR.AsString <> CNULL ) THEN
   Begin
     nRow := 0;
     vlValida := CFALSO;
     vlMonAcumProv := 0;
     vlSituacion := sgcDATA.CellStr['SIT_GRUPO_PROV',sgcDATA.SG.Row];

     if Objeto.SIT_GRUPO_PROV.AsString <> '' then
      if ((vlSituacion = CSIT_AC) and ( rgSIT_GRUPO_PROV.ItemIndex = 1)) then
      Begin
        if MessageDlg('¿Desea cambiar la situación del proveedor dentro del grupo  de Activo a Inactivo? ',
                       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Begin
           Objeto.CancelaProv(sgcDATA.CellStr['CVE_FND_ENT_DES',sgcDATA.SG.Row],
                              sgcDATA.CellStr['CVE_GRUPO_EMIS',sgcDATA.SG.Row],
                              sgcDATA.CellStr['ID_ACREDITADO',sgcDATA.SG.Row],CSIT_CA);
        end;
      end
      else if ((vlSituacion = CSIT_CA) and ( rgSIT_GRUPO_PROV.ItemIndex = 0))  then
      Begin
        if MessageDlg('¿Desea cambiar la situación del proveedor dentro del grupo  de Inactivo a Activo? ',
                       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Begin
           for i:= 0 to sgcDATA.SG.RowCount - 1 Do
           Begin
             if sgcDATA.CellStr['SIT_GRUPO_PROV',nRow] <> CSIT_CA then
                vlMonAcumProv := vlMonAcumProv + StrToFloat(sgcDATA.CellStr['RIESGOACUM',nRow]);
             //end if
             nRow := nRow + 1;
           end;
           vlMontoAcum := MontoAcum(vlMonAcumProv);
           vlValida := ValidaMontoAcum(vlMontoAcum);
           if vlValida = CFALSO then
           Begin
             Objeto.CancelaProv(sgcDATA.CellStr['CVE_FND_ENT_DES',sgcDATA.SG.Row],
                                sgcDATA.CellStr['CVE_GRUPO_EMIS',sgcDATA.SG.Row],
                                sgcDATA.CellStr['ID_ACREDITADO',sgcDATA.SG.Row], CSIT_AC);
           end;
        end;
      end;
      MuestraDatos;
      Objeto.FindKey([sgcDATA.CellStr['CVE_GRUPO_EMIS',sgcDATA.SG.Row],sgcDATA.CellStr['ID_ACREDITADO',sgcDATA.SG.Row]]);
   end;
end;

function TWCrGrupoProv.MontoAcum(pMontoAcumProv : Double): Double;
var vlMontoAcum : Double;
begin
   vlMontoAcum := ObtenRiesgoAcumulado(Objeto.EmisGpoPrv.ID_EMISOR.AsString,Objeto.ID_PROVEEDOR.AsString, Objeto.Apli) +
                  pMontoAcumProv;
   MontoAcum := vlMontoAcum;
end;

function TWCrGrupoProv.ValidaMontoAcum(pMontoAcum: Double): String;
var vlSalida : String;
begin
   vlSalida := CFALSO;
   if pMontoAcum >= Objeto.EmisGpoPrv.IMP_RIESGO_MAX.AsFloat then
   Begin
      ShowMessage('El Riesgo Acumulado de los proveedores del grupo ( ' + FORMAT(CFORMAT_DINERO,[pMontoAcum]) +
                  ' ) sobrepasa el Máximo Autorizado por Grupo : ' + FORMAT(CFORMAT_DINERO,[Objeto.EmisGpoPrv.IMP_RIESGO_MAX.AsFloat]));
      vlSalida := CVERDAD;
   end;
   ValidaMontoAcum := vlSalida;
end;

procedure TWCrGrupoProv.sgcDATACalcRow(Sendet: TObject; DataSet: TDataSet;
  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
var vlCompara : Boolean;
    vlCadTotGpo : String;
begin
  {Inicializa las variable de total }
  if ( RowCaso = rcQueryBegin ) then
  begin
      vlTotalGpo  := 0;
      vlCadTotGpo := '';
  end;
  {}
  if ( RowCaso = rcRowBegin ) then
    begin
       vlTotalGpo := vlTotalGpo + DataSet.FieldByName('RIESGOACUM').AsFloat;
    end;
    { Valida fin de Query }
  if ( RowCaso = rcQueryEnd ) then
    begin
        vlCadTotGpo := 'IMP. TOTAL GRUPO:                                                               ' +
              '                                                                                         ' +
              Format(CFORMAT_DINERO,[ vlTotalGpo ] );
        sgcDATA.AddTexto( vlCadTotGpo, tcCenter, clMaroon, 15);
    end;//ends_if
end;

procedure TWCrGrupoProv.btnCVE_FND_ENT_DESClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGRUPRO_ENTDES',True,True) then
   begin
       Objeto.MInstDesc.ShowAll := True;
       If Objeto.MInstDesc.Busca Then
          InterForma1.NextTab(edCVE_FND_ENT_DES);
   end;
end;

procedure TWCrGrupoProv.btnCVE_FND_ENT_DESExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      VLMesg     := '';
      VLSalida := True;
      Objeto.CVE_FND_ENT_DES.GetFromControl;
      If Objeto.CVE_FND_ENT_DES.AsString = '' Then Begin
         VLSalida  := False;
         VLMesg     := 'Favor de Indicar la Entidad Descontadora';
      End;
      InterForma1.ValidaExit(edCVE_FND_ENT_DES,VLSalida,VLMesg,True);
   end;
end;

procedure TWCrGrupoProv.ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
begin
   If Objeto.MInstDesc.FindKey([ilCVE_FND_ENT_DES.Buffer]) Then Begin
      Interforma1.NextTab(edCVE_FND_ENT_DES);
   End;
end;

procedure TWCrGrupoProv.edCVE_FND_ENT_DESExit(Sender: TObject);
begin
   If Objeto.MInstDesc.CVE_FND_ENT_DES.AsString <> '' Then Begin
      Objeto.EmisGpoPrv.BuscaWhereString := ' CR_EMIS_GPO_PRO.CVE_FND_ENT_DES = ' + Objeto.MInstDesc.CVE_FND_ENT_DES.AsString;
   End;
   Objeto.EmisGpoPrv.FilterString := Objeto.EmisGpoPrv.BuscaWhereString;
end;

end.
