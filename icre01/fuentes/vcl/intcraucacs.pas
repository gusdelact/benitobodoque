// Sistema         : Clase de CRAUCACS
// Fecha de Inicio : 23/09/2003
// Función forma   : Clase de CRAUCACS
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :   
Unit IntCrAuCaCs;    
                  
interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, IntLinkit,

//Unidades Adicionales
IntParamCre,
IntCrCesion,
IntCrEmisor,
IntCrProveed,
IntCrEmiPro,
IntCrCarNaf,
IntGenCre,
IntMQrEmiPro//Reporte
,IntMQrEmiProVPN //reporte para vpn
,IntCrGenVto     // generacion de vencimientos, para vpn
;

Const
C_VPN = 'VPN';//CVE_CAL_CAPITAL

Type
 TCraucacs= class;

  TWCraucacs=Class(TForm)
    InterForma1             : TInterForma;
    lbID_CESION : TLabel; 
    edID_CESION : TEdit;
    lbID_EMISOR : TLabel; 
    edID_EMISOR : TEdit;
    lbID_PROVEEDOR : TLabel; 
    edID_PROVEEDOR : TEdit;
    lbID_ACUSE : TLabel; 
    edID_ACUSE : TEdit; 
    rgSITUACION : TRadioGroup;
    Label8: TLabel;
    Label10: TLabel;
    btEMISOR: TBitBtn;
    edNOMEMISOR: TEdit;
    edNOM_EMISOR: TEdit;
    cbB_APLI_EMISOR: TCheckBox;
    btPROVEEDOR: TBitBtn;
    edNOM_PROVEED: TEdit;
    cbB_APLI_PROV: TCheckBox;
    btCESION: TBitBtn;
    edTITULAR: TEdit;
    cbB_APLI_CESION: TCheckBox;
    btACUSE: TBitBtn;
    edNOM_ARCHIVO: TEdit;
    cbB_APLI_ACUSE: TCheckBox;
    btBUSCA: TBitBtn;
    Label5: TLabel;
    edCVE_NAFIN: TEdit;
    Label12: TLabel;
    edTIT_DOCUMENTO: TEdit;
    edTIT_TIPO: TEdit;
    edTIT_FPAGO: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    sgcDATOS: TSGCtrl;
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
    ilCESION: TInterLinkit;
    ilEMISOR: TInterLinkit;
    ilACUSE: TInterLinkit;
    Edit1: TEdit;
    Edit2: TEdit;
    btCANCELA: TBitBtn;
    btEMIS_PROV: TBitBtn;
    btCLAS_PROV: TBitBtn;
    btCLAS_EMISOR: TBitBtn;
    cbIMPRIMIR_CES: TCheckBox;
    btAUTORIZA: TBitBtn;
    btIMPRIMIR: TBitBtn;
    lbF_PAG_INICIAL: TLabel;
    edF_INICIAL: TEdit;
    dtpF_INICIAL: TInterDateTimePicker;
    lbF_PAG_FINAL: TLabel;
    edF_FINAL: TEdit;
    dtpF_FINAL: TInterDateTimePicker;
    Edit3: TEdit;
    MErrores: TMemo;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btCESIONClick(Sender: TObject);
    procedure ilCESIONEjecuta(Sender: TObject);
    procedure btEMISORClick(Sender: TObject);
    procedure ilEMISOREjecuta(Sender: TObject);
    procedure btPROVEEDORClick(Sender: TObject);
    procedure ilPROVEEDOREjecuta(Sender: TObject);
    procedure btACUSEClick(Sender: TObject);
    procedure cbB_APLI_CESIONClick(Sender: TObject);
    procedure cbB_APLI_EMISORClick(Sender: TObject);
    procedure cbB_APLI_PROVClick(Sender: TObject);
    procedure cbB_APLI_ACUSEClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure btBUSCAClick(Sender: TObject);
    procedure rgSITUACIONClick(Sender: TObject);
    procedure sgcDATOSDblClick(Sender: TObject);
    procedure ilACUSEEjecuta(Sender: TObject);
    procedure btAUTORIZAClick(Sender: TObject);
    procedure btCANCELAClick(Sender: TObject);
    procedure btCLAS_EMISORClick(Sender: TObject);
    procedure btCLAS_PROVClick(Sender: TObject);
    procedure btEMIS_PROVClick(Sender: TObject);
    procedure btIMPRIMIRClick(Sender: TObject);
    procedure edF_FINALExit(Sender: TObject);
    procedure dtpF_INICIALExit(Sender: TObject);
    private
    { Private declarations }
      // FJR 25.07.2012 Agregar funcion de envio de correo al momento de autorizar la cesion
      Function EnviaMail(IDCESION: String): Boolean ;
    public
    { Public declarations }
    Objeto : TCraucacs;
    Function    CadenaSql : String;
    Procedure   MuestraDatos;

    Function RevisaFacturasElectronicas(peidcesion:string):integer;  //HERJA 20.12.2010

end;
 TCraucacs= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        validaPerfil             : Boolean;
        validaImpCes             : Boolean;
        validaCanPer             : Boolean;
        ID_CESION                : TInterCampo;
        ID_EMISOR                : TInterCampo;
        ID_PROVEEDOR             : TInterCampo;
        ID_ACUSE                 : TInterCampo;
        SITUACION                : TInterCampo;

        ParamCre                 : TParamCre;
        Cesion                   : TCrCesion;
        Emisor                   : TCrEmisor;
        Proveedor                : TCrProveed;
        CargaNafin               : TCrCarNaf;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

        function  ValidaPlazosVPN(pid_credito:string):boolean;
      published
      end;



implementation
//Uses RepMon;
Uses  IntCrNotific ;    // FJR 25.07.2012 para funcionalidad de envio de correo.

Const
   coPosSel = 16;
{$R *.DFM}

function TCraucacs.ValidaPlazosVPN(pid_credito:string):boolean;
var vlsql, vlfinicio: String;
    vlCount: Integer;
begin
   ValidaPlazosVPN:=true;

   vlsql:= ' SELECT COUNT(*) AS NCOUNT FROM CR_CESION WHERE ID_CESION= '+pid_credito;
   GetSQLInt(vlsql,Apli.DataBaseName,Apli.SessionName,'NCOUNT', vlCount, False);

   if vlCount > 0 then
   begin
      vlsql:= ' SELECT F_INICIO FROM CR_CESION WHERE ID_CESION= '+pid_credito;
      GetSQLStr(vlsql,Apli.DataBaseName,Apli.SessionName,'F_INICIO', vlfinicio, False);

      vlsql:= ' SELECT COUNT(*) COUNT FROM CR_CAPITAL WHERE ID_CREDITO = ' + pid_credito +
              '    AND (F_VENCIMIENTO - PLAZO) <> TO_DATE('''+vlfinicio+''',''DD/MM/YYYY'')';
      GetSQLInt(vlsql, Apli.DataBaseName, Apli.SessionName,'COUNT',vlCount,False);
      if vlCount > 0 then
      begin
         ShowMessage('Las Fechas de Inicio de Capital de la Cesion '+pid_credito+' deben de ser las mismas que la Fecha de Inicio del credito');
         ValidaPlazosVPN := False;
      end;

      vlsql:= ' SELECT COUNT(*) COUNT FROM CR_INTERES WHERE ID_CREDITO = ' + pid_credito +
              '    AND (F_VENCIMIENTO - PLAZO) <> TO_DATE('''+vlfinicio+''',''DD/MM/YYYY'')';
      GetSQLInt(vlsql, Apli.DataBaseName, Apli.SessionName,'COUNT',vlCount,False);
      if vlCount > 0 then
      begin
         ShowMessage('Las Fechas de Inicio de Interes de la Cesion '+pid_credito+' deben de ser las mismas que la Fecha de Inicio del credito');
         ValidaPlazosVPN := False;
      end;
   end;
end;


constructor TCraucacs.Create( AOwner : TComponent );
begin Inherited;
      ID_CESION :=CreaCampo('ID_CESION',ftString,tsNinguno,tsNinguno,False);
                ID_CESION.Caption:='Disposición / Cesión';
                ID_CESION.Parametro:='ID_CESION';
      ID_EMISOR :=CreaCampo('ID_EMISOR',ftString,tsNinguno,tsNinguno,False);
                ID_EMISOR.Caption:='Emisor';
                ID_EMISOR.Parametro:='ID_EMISOR';
      ID_PROVEEDOR :=CreaCampo('ID_PROVEEDOR',ftString,tsNinguno,tsNinguno,False);
                ID_PROVEEDOR.Caption:='Proveedor';
                ID_PROVEEDOR.Parametro:='ID_PROVEEDOR';
      ID_ACUSE :=CreaCampo('ID_ACUSE',ftString,tsNinguno,tsNinguno,False);
                ID_ACUSE.Caption:='Acuse Nafin';
                ID_ACUSE.Parametro:='ID_ACUSE';
      SITUACION :=CreaCampo('SITUACION',ftString,tsNinguno,tsNinguno,False);
         With SITUACION do
          begin Size:= 2;
                UseCombo:=True;
                ComboLista.Add('0');   ComboDatos.Add(CSIT_NA);
                ComboLista.Add('1');   ComboDatos.Add(CSIT_AU);
                ComboLista.Add('2');   ComboDatos.Add(CSIT_CA);
                ComboLista.Add('3');   ComboDatos.Add(CSIT_TO);
          end;
                SITUACION.Caption:='Situación';
                SITUACION.Parametro:='SITUACION';

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrAuCaCs.Hlp';
      ShowMenuReporte:=True;

      Cesion := TCrCesion.Create(Self);
      Cesion.MasterSource:=Self;
      Cesion.FieldByName('ID_CESION').MasterField:='ID_CESION';

      Emisor:= TCrEmisor.Create(Self);
      Emisor.MasterSource:=Self;
      Emisor.FieldByName('ID_ACREDITADO').MasterField:='ID_EMISOR';

      Proveedor := TCrProveed.Create(Self);
      Proveedor.MasterSource:=Self;
      Proveedor.FieldByName('ID_ACREDITADO').MasterField:='ID_PROVEEDOR';

      CargaNafin := TCrCarNaf.Create(Self);
      CargaNafin.MasterSource:=Self;
      CargaNafin.FieldByName('ID_ACUSE').MasterField:='ID_ACUSE';

end;

Destructor TCraucacs.Destroy;
begin
   if Emisor<> nil then
      Emisor.free;
   //end if

   if Proveedor <> nil then
      Proveedor.free;
   //end if

   if CargaNafin <> nil then
      CargaNafin.free;
   //end if

      inherited;
end;


function TCraucacs.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCraucacs;
begin
   W:=TWCraucacs.Create(Self);
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


Function TCraucacs.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICraucac.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CRAUCACS********************)
(*                                                                              *)
(*  FORMA DE CRAUCACS                                                            *)
(*                                                                              *)
(***********************************************FORMA CRAUCACS********************)

Function TWCraucacs.RevisaFacturasElectronicas(peidcesion:string):integer;
var vlsql :  String;
    vlQry : TQuery;
    vlBencfact:boolean;
begin
   vlBencfact:=false;
   vlsql:=' SELECT SERIE_RECIBO, SIT_COMPROBANTE, SIT_PROCESO, F_OPERACION '+coCRLF+
          '   FROM SFE_COMPROBANTE '+coCRLF+
          '  WHERE ID_CESION = '+peidcesion+' ';
//          '   AND SIT_COMPROBANTE = 1 '+coCRLF+
//          '   AND SIT_PROCESO IN (1,0) ';

   vlQry := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   try
      if vlQry <> nil then
      begin
        {
         if vlQry.FieldByName('SIT_COMPROBANTE').AsString = '1' then RevisaFacturasElectronicas:=1;
         begin
            if vlQry.FieldByName('SIT_PROCESO').AsString = '1' then RevisaFacturasElectronicas:=1;
            if vlQry.FieldByName('SIT_PROCESO').AsString = '0' then RevisaFacturasElectronicas:=2;
         end;
         }
         while NOT vlQry.Eof do
         begin
             //if vlQry.FieldByName('SIT_COMPROBANTE').AsString <> '0' then
             if vlQry.FieldByName('SIT_PROCESO').AsString = '0' then  //HERJA AGOSTO 2013
                vlBencfact:=true;
            vlQry.Next;
         end;
      end
      else
         vlBencfact:=false;
   finally
      if vlQry <> nil then vlQry.free;
   end;

   if vlBencfact=false then RevisaFacturasElectronicas:=0    //NO HAY FACTURAS ELECTRONICAS
   else  RevisaFacturasElectronicas:=3;
end;   


{---------------------------------------------------------------------------------
       Cadena Sql
---------------------------------------------------------------------------------}
function TWCraucacs.CadenaSql: String;
var vlsql : String;
begin

   Objeto.ID_CESION.GetFromControl;
   Objeto.ID_EMISOR.GetFromControl;
   Objeto.ID_PROVEEDOR.GetFromControl;
   Objeto.ID_ACUSE.GetFromControl;
   Objeto.SITUACION.GetFromControl;

   vlsql := ' SELECT CS.ID_CESION, ' +
            '        CS.ID_EMISOR , ' +
            '        CS.CVE_EMISOR_NAFIN , ' +
            '        CS.ID_PROVEEDOR , ' +
            '        PE.NOMBRE EMISOR, ' +
            '        PP.NOMBRE PROVEEDOR, ' +
            '        CS.CVE_FND_ENT_DES , ' +
//            '        NPKGCRPERIODO.ObtImpAforo(CS.ID_CESION) AS ObtImpAforo, ' + EASA4011
//'        NVL(PKGCRPERIODO.ObtImpAforo(CS.ID_CESION), NVL(PKGCRPERIODO.ObtImpAforoVPN(CS.ID_CESION),0)) AS ObtImpAforo, ' +   -ELIMINATE
            '        NVL(PKGCRPERIODO.ObtImpAforoVPN(CS.ID_CESION), NVL(PKGCRPERIODO.ObtImpAforo(CS.ID_CESION),0)) AS ObtImpAforo, ' +
            '        NVL(PKGCRPERIODO.ObtImpCompra(CS.ID_CESION), NVL(PKGCRPERIODO.ObtImpAforoVPN(CS.ID_CESION),0)) AS ObtImpCompra, ' +
            '        DECODE(PKGCRPERIODO.ObtImpNeto(CS.ID_CESION), 0,NVL(PKGCRPERIODO.ObtImpNetoVPN(CS.ID_CESION),0), NVL(PKGCRPERIODO.ObtImpNeto(CS.ID_CESION),0)) AS ObtImpNeto, ' +
            '        CS.SIT_CESION, ' +
            #39 +  ' ' + #39 + ' AUT, ' +
            '        CS.F_ALTA, ' ;

//ROIM  05012009   BUSCA EL TIPO DE CAPITAL DEL PRODUCTO

   vlsql :=     vlsql +
            '       CPR.CVE_CAL_CAPITAL  ' +
            ' FROM CR_CESION CS, ' +
            '      PERSONA PE, ' +
            '      PERSONA PP, ' +
            '      CR_CREDITO CC, ' +
            '      CR_CONTRATO CTO, ' +
            '      CR_PRODUCTO CPR ' ;
////ROIM

   vlsql :=     vlsql +
            ' WHERE 1 = 1 '+
            '    AND CS.ID_EMISOR = PE.ID_PERSONA ' +
            '    AND CS.ID_PROVEEDOR = PP.ID_PERSONA ' +
            '    AND PKGCRACTUALIZA.STPOBTEMPRESA(CS.ID_CESION) =' + IntToStr(Objeto.Apli.IdEmpresa) + // LOLS 07 SEP 2005
            '    AND CS.F_ALTA BETWEEN ' + SQLFecha(StrToDateTime(edF_INICIAL.Text)) +
            '                      AND ' + SQLFecha(StrToDateTime(edF_FINAL.Text));

//ROIM  05012009   BUSCA EL TIPO DE CAPITAL DEL PRODUCTO

   vlsql :=     vlsql +
            '    AND      CC.ID_CREDITO = CS.ID_CESION ' +
            '    AND      CTO.ID_CONTRATO = CC.ID_CONTRATO ' +
            '    AND      CTO.FOL_CONTRATO = CC.FOL_CONTRATO ' +
            '    AND      CPR.CVE_PRODUCTO_CRE =  CTO.CVE_PRODUCTO_CRE ';
////ROIM


     if cbB_APLI_CESION.Checked then
        vlsql := vlsql + ' AND CS.ID_CESION = ' + Objeto.ID_CESION.AsString;
     //end if

     if cbB_APLI_EMISOR.Checked then
        vlsql := vlsql + ' AND CS.ID_EMISOR = ' + Objeto.ID_EMISOR.AsString;

     //end if

     if cbB_APLI_PROV.Checked then
        vlsql := vlsql + ' AND CS.ID_PROVEEDOR = ' + Objeto.ID_PROVEEDOR.AsString;
     //end if

     if cbB_APLI_ACUSE.Checked then
        vlsql := vlsql + ' AND CN.ID_ACUSE = ' + #39 + Objeto.ID_ACUSE.AsString + #39;
     //end if

     if Objeto.SITUACION.AsString = CSIT_NA then
        vlsql := vlsql + ' AND CS.SIT_CESION = ' + #39 + CSIT_NA + #39
     else if Objeto.SITUACION.AsString = CSIT_AU then
        vlsql := vlsql + ' AND CS.SIT_CESION = ' + #39 + CSIT_AU + #39
     else if Objeto.SITUACION.AsString = CSIT_CA then
        vlsql := vlsql + ' AND CS.SIT_CESION = ' + #39 + CSIT_CA + #39;

   CadenaSql := vlsql;
end;

Procedure TWCraucacs.MuestraDatos;
var vlQry : TQuery;
begin
  vlQry := GetSQLQuery(CadenaSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     try
        if vlQry <> nil then
        Begin
            vlQry.FieldByName('ID_EMISOR').Visible := False;
            vlQry.FieldByName('CVE_EMISOR_NAFIN').Visible := False;
            vlQry.FieldByName('ID_PROVEEDOR').Visible := False;
            vlQry.FieldByName('F_ALTA').Visible := False;
            vlQry.FieldByName('CVE_CAL_CAPITAL').Visible := False;

            vlQry.FieldByName('ID_CESION').DisplayLabel := 'ID CESION' + #30 +'>C';
            vlQry.FieldByName('EMISOR').DisplayLabel := 'EMISOR' + #30 +'>C';
            vlQry.FieldByName('PROVEEDOR').DisplayLabel := 'PROVEEDOR' + #30 +'>C';
            vlQry.FieldByName('CVE_FND_ENT_DES').DisplayLabel := 'ENT DESC.' + #30 +'>C';
            vlQry.FieldByName('ObtImpAforo').DisplayLabel := 'IMPAFORO' + #30 +'>C';
            vlQry.FieldByName('ObtImpCompra').DisplayLabel := 'IMPCOMPRA' + #30 +'>C';
            vlQry.FieldByName('ObtImpNeto').DisplayLabel := 'IMPNETO' + #30 +'>C';
            vlQry.FieldByName('SIT_CESION').DisplayLabel := 'SIT' + #30 +'>C';
            vlQry.FieldByName('AUT').DisplayLabel := 'AUT' + #30 +'>C';

            vlQry.FieldByName('ID_CESION').DisplayWidth := 8;
            vlQry.FieldByName('EMISOR').DisplayWidth := 23;
            vlQry.FieldByName('PROVEEDOR').DisplayWidth := 23;
            vlQry.FieldByName('CVE_FND_ENT_DES').DisplayWidth := 8;
            vlQry.FieldByName('ObtImpAforo').DisplayWidth := 14;
            vlQry.FieldByName('ObtImpCompra').DisplayWidth := 15;
            vlQry.FieldByName('ObtImpNeto').DisplayWidth := 14;
            vlQry.FieldByName('SIT_CESION').DisplayWidth := 4;
            vlQry.FieldByName('AUT').DisplayWidth := 4;

            sgcDATOS.SG.Canvas.Font.Size := 5;

            TNumericField(vlQry.FieldByName('ObtImpAforo')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('ObtImpCompra')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('ObtImpNeto')).DisplayFormat := '###,###,###,###,###,###,##0.00';

            sgcDATOS.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY
            sgcDATOS.ColumnByName('AUT').IsCheck := True;//DEFINIR EL CAMPO AUT DEL QUERY COMO CHECKBOX
        end
        else

           sgcDATOS.Clear('NO EXISTEN DATOS'#30'>C');

        finally
        if vlQry <> nil then
           vlQry.free;
        //end if
        end;
end;

procedure TWCraucacs.FormShow(Sender: TObject);
begin
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

     dtpF_INICIAL.DateTime:= Objeto.Apli.DameFechaEmpresa;
     dtpF_FINAL.DateTime:= Objeto.Apli.DameFechaEmpresa;

     edF_INICIAL.text:=FormatDateTime('dd/mm/yyyy',dtpF_INICIAL.DateTime);
     edF_FINAL.text:=FormatDateTime('dd/mm/yyyy',dtpF_FINAL.DateTime);

     Objeto.ID_CESION.Control:=edID_CESION;
     Objeto.ID_EMISOR.Control:=edID_EMISOR;
     Objeto.ID_PROVEEDOR.Control:=edID_PROVEEDOR;
     Objeto.ID_ACUSE.Control:=edID_ACUSE;
     Objeto.SITUACION.Control:=rgSITUACION;

     Objeto.Cesion.ID_CESION.Control:=edID_CESION;
     Objeto.Cesion.CreCto.Contrato.TITNombre.Control := edTITULAR;
     Objeto.Cesion.GetParams(Objeto);

     Objeto.Emisor.ID_ACREDITADO.Control:=edID_EMISOR;
     Objeto.Emisor.Acreditado.Persona.Nombre.Control := edNOM_EMISOR;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//     Objeto.Emisor.CVE_EMISOR_NAFIN.Control := edCVE_NAFIN;
     Objeto.Emisor.CVE_EMISOR_EXT.Control := edCVE_NAFIN;
{/ROIM}
     Objeto.Emisor.NOMBRE_EMISOR.Control := edNOMEMISOR;
     Objeto.Emisor.GetParams(Objeto);

     Objeto.Proveedor.ID_ACREDITADO.Control:=edID_PROVEEDOR;
     Objeto.Proveedor.Persona.Nombre.Control := edNOM_PROVEED;
     Objeto.Proveedor.GetParams(Objeto);

     Objeto.CargaNafin.ID_ACUSE.Control:=edID_ACUSE;
     Objeto.CargaNafin.NOM_ARCHIVO.Control := edNOM_ARCHIVO;
     Objeto.CargaNafin.GetParams(Objeto);
end;

procedure TWCraucacs.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CESION.Control:=nil;
      Objeto.ID_EMISOR.Control:=nil;
      Objeto.ID_PROVEEDOR.Control:=nil;
      Objeto.ID_ACUSE.Control:=nil;
      Objeto.SITUACION.Control:=nil;

     Objeto.Cesion.ID_CESION.Control:=nil;
     Objeto.Cesion.CreCto.Contrato.TITNombre.Control := nil;

     Objeto.Emisor.ID_ACREDITADO.Control:=nil;
     Objeto.Emisor.Acreditado.Persona.Nombre.Control := nil;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//     Objeto.Emisor.CVE_EMISOR_NAFIN.Control := nil;
     Objeto.Emisor.CVE_EMISOR_EXT.Control := nil;
{/ROIM}
     Objeto.Emisor.NOMBRE_EMISOR.Control := nil;

     Objeto.Proveedor.ID_ACREDITADO.Control:=nil;
     Objeto.Proveedor.Persona.Nombre.Control := nil;

     Objeto.CargaNafin.ID_ACUSE.Control:=nil;
     Objeto.CargaNafin.NOM_ARCHIVO.Control := nil;
   //Objeto
end;

procedure TWCraucacs.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCraucacs.btCESIONClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRAUCACS_DISPO',True,True) then
   begin
       Objeto.Cesion.ShowAll := True;
       if Objeto.Cesion.Busca then
       Begin
          cbB_APLI_CESION.Checked := True;
          cbB_APLI_CESION.Enabled := True;
          MuestraDatos;
          InterForma1.NextTab(edID_CESION);
       end
   end;
end;

procedure TWCraucacs.ilCESIONEjecuta(Sender: TObject);
begin
   if Objeto.Cesion.FindKey([ilCESION.Buffer]) then
   Begin
      cbB_APLI_CESION.Checked := True;
      cbB_APLI_CESION.Enabled := True;
      MuestraDatos;
      InterForma1.NextTab(edID_CESION);
   end
end;

procedure TWCraucacs.btEMISORClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRAUCACS_EMIS',True,True) then
   begin
       Objeto.Emisor.ShowAll := True;
       if Objeto.Emisor.Busca then
       Begin
          cbB_APLI_EMISOR.Checked := True;
          cbB_APLI_EMISOR.Enabled := True;
          MuestraDatos;
          InterForma1.NextTab(edID_EMISOR);
       end
   end;
end;

procedure TWCraucacs.ilEMISOREjecuta(Sender: TObject);
begin
   if Objeto.Emisor.FindKeyNear([ilEMISOR.Buffer],['ID_ACREDITADO']) then
   Begin
      cbB_APLI_EMISOR.Checked := True;
      cbB_APLI_EMISOR.Enabled := True;
      MuestraDatos;
      InterForma1.NextTab(edID_EMISOR);
   end
end;

procedure TWCraucacs.btPROVEEDORClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRAUCACS_PROVE',True,True) then
   begin
       Objeto.Proveedor.ShowAll := True;
       if Objeto.Proveedor.Busca then
       Begin
          cbB_APLI_PROV.Checked := True;
          cbB_APLI_PROV.Enabled := True;
          MuestraDatos;
          InterForma1.NextTab(edID_PROVEEDOR);
       end
   end;
end;

procedure TWCraucacs.ilPROVEEDOREjecuta(Sender: TObject);
begin
   if Objeto.Proveedor.FindKey([ilPROVEEDOR.Buffer]) then
   Begin
      cbB_APLI_PROV.Checked := True;
      cbB_APLI_PROV.Enabled := True;
      MuestraDatos;
      InterForma1.NextTab(edID_PROVEEDOR);
   end
end;

procedure TWCraucacs.btACUSEClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRAUCACS_ACUSE',True,True) then
   begin
       Objeto.CargaNafin.ShowAll := True;
       if Objeto.CargaNafin.Busca then
       Begin
          cbB_APLI_ACUSE.Checked := True;
          cbB_APLI_ACUSE.Enabled := True;
          MuestraDatos;
          InterForma1.NextTab(edID_ACUSE);
       end
   end;
end;

procedure TWCraucacs.cbB_APLI_CESIONClick(Sender: TObject);
begin
   if not cbB_APLI_CESION.Checked then
   Begin
      Objeto.Cesion.Active := False;
      cbB_APLI_CESION.Checked := False;
      cbB_APLI_CESION.Enabled := False;
      MuestraDatos;
   end;
end;

procedure TWCraucacs.cbB_APLI_EMISORClick(Sender: TObject);
begin
   if not cbB_APLI_EMISOR.Checked then
   Begin
      Objeto.Emisor.Active := False;
      cbB_APLI_EMISOR.Checked := False;
      cbB_APLI_EMISOR.Enabled := False;
      MuestraDatos;
   end;
end;

procedure TWCraucacs.cbB_APLI_PROVClick(Sender: TObject);
begin
   if not cbB_APLI_PROV.Checked then
   Begin
      Objeto.Proveedor.Active := False;
      cbB_APLI_PROV.Checked := False;
      cbB_APLI_PROV.Enabled := False;
      MuestraDatos;
   end;
end;

procedure TWCraucacs.cbB_APLI_ACUSEClick(Sender: TObject);
begin
   if not cbB_APLI_ACUSE.Checked then
   Begin
      Objeto.CargaNafin.Active := False;
      cbB_APLI_ACUSE.Checked := False;
      cbB_APLI_ACUSE.Enabled := False;
      MuestraDatos;
   end;
end;

procedure TWCraucacs.InterForma1DespuesShow(Sender: TObject);
begin
   edID_CESION.SetFocus;
   if Objeto.Cesion.ID_CESION.AsString <> '' then
   Begin
      Objeto.ID_CESION.AsString := Objeto.Cesion.ID_CESION.AsString;
      cbB_APLI_CESION.Checked := True;
      cbB_APLI_CESION.Enabled := True;
{      Objeto.validaPerfil := Objeto.Cesion.ValidaPerfilUsuario;
      if not Objeto.validaPerfil then
         btAUTORIZA.Enabled := False
      else btAUTORIZA.Enabled := True;}
   end;
{      Objeto.validaCanPer := Objeto.Cesion.ValCanPerfilUsu;
      if not Objeto.validaCanPer then
         btCANCELA.Enabled := False
      else btCANCELA.Enabled := True;
      //end if}
   Objeto.SITUACION.AsString := CSIT_NA;
   MuestraDatos;
end;

procedure TWCraucacs.btBUSCAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRAUCACS_BUSCAR',True,True) then
      MuestraDatos;
end;

procedure TWCraucacs.rgSITUACIONClick(Sender: TObject);
begin
   MuestraDatos;
end;

procedure TWCraucacs.sgcDATOSDblClick(Sender: TObject);
var Y          : integer;
    vlIdCesion : String;
    vlCesion   : String;
    vlMarcaReg : Boolean;

   procedure MarcaRegistro;
   Begin
     if sgcDATOS.CellStr['AUT',Y] = 'SI' + #30 + '>C' then
        sgcDATOS.CellStr['AUT',Y]:= ''
     else
        sgcDATOS.CellStr['AUT',Y]:= 'SI' + #30 + '>C';
  //end if
   end;

begin
  Y := sgcDATOS.SG.Row;
  vlCesion := '';
  vlIdCesion := sgcDATOS.CellStr['ID_CESION',Y];
  if vlCesion <> vlIdCesion then
  Begin
     vlCesion := vlIdCesion;
     Objeto.validaImpCes := Objeto.Cesion.ValidaImpMaxCes(StrToInt(vlCesion));
     Objeto.validaCanPer := Objeto.Cesion.ValCanPerfilUsu;
  end;
  if sgcDATOS.SG.Selection.Left = coPosSel then
  Begin
     vlMarcaReg := False;
     if ( ( Objeto.validaPerfil ) or ( Objeto.validaImpCes ) ) and ( sgcDATOS.CellStr['SIT_CESION',Y] = CSIT_NA ) then
     Begin
        MarcaRegistro;
        vlMarcaReg := True;
     end;
     if ( Objeto.validaCanPer ) and ( ( sgcDATOS.CellStr['SIT_CESION',Y] = CSIT_NA ) OR
                                      ( sgcDATOS.CellStr['SIT_CESION',Y] = CSIT_AU ) OR
                                      ( sgcDATOS.CellStr['SIT_CESION',Y] = CSIT_AC ) OR
                                      ( sgcDATOS.CellStr['SIT_CESION',Y] = CSIT_IM )) then
     Begin
        if not vlMarcaReg then
           MarcaRegistro;
     end;
  end
  else
  Begin
     Objeto.Cesion.FindKey([vlIdCesion]);
     Objeto.Cesion.PromotorAdm.FindKey([Objeto.Cesion.Credito.ID_PROM_ADM.AsString]);
     Objeto.Cesion.CreCto.FindKey([Objeto.Cesion.Credito.ContratoCre.ID_CONTRATO.AsString,'1']);
     Objeto.Cesion.CreCto.Producto.FindKey([Objeto.Cesion.CreCto.CVE_PRODUCTO_CRE.AsString]);
     Objeto.Cesion.credito.FindKey([Objeto.Cesion.ID_CESION.AsString]);
     Objeto.cesion.TasaRefer.FindKey([Objeto.cesion.CVE_TASA_REFER.asString]);
     InterForma1.BtnSalirClick(self);
  end;
end;

procedure TWCraucacs.ilACUSEEjecuta(Sender: TObject);
begin
   if Objeto.CargaNafin.FindKeyNear([ilACUSE.Buffer],['ID_ACUSE']) then
   Begin
      cbB_APLI_ACUSE.Checked := True;
      cbB_APLI_ACUSE.Enabled := True;
      MuestraDatos;
      InterForma1.NextTab(edID_ACUSE);
   end
end;

procedure TWCraucacs.btAUTORIZAClick(Sender: TObject);
var vlIdCesion : String;
    nRow, i    : Integer;
    countAut   : Integer;
    vlFAlta    : TDate;
    vlContinua : Boolean;
    vlMsg : String;
    vlErr, vlErrMail : String;
    temporal: TCrGenVto;
    vlsql: String;    vlCount, vlCountElec: Integer;

    BerrorPLD:boolean;
    vlError  :string;
    vlQry : TQuery;
begin
   if Objeto.ValidaAccesoEsp('TCRAUCACS_AUTOR',True,True) then
   begin
       nRow := 0;
       countAut:= 0;
       vlErr := '';
       MErrores.Lines.Clear; //<EASA 25.ABR.2007     Req. Dolares
       if not Objeto.Cesion.ValidaPerfilUsuario then
       Begin
          btAUTORIZA.Enabled := False;
       end
       else
       Begin
         if CountSelec(sgcDatos,'AUT') > 0 then
         Begin
           if MessageDlg('¿Está seguro de autorizar ' +IntToStr(CountSelec(sgcDatos,'AUT')) + ' cesión (es)',
                           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
           Begin
              MessageIniFinProceso( MErrores, cInicio ); //<EASA 25.ABR.2007     Req. Dolares
              For i := 0 To sgcDATOS.SG.RowCount - 1 Do
              Begin
                 if (sgcDATOS.CellStr['AUT',nRow] = 'SI' + #30 + '>C') then
                 Begin
                    // <EASA 07 DIC 2005  SE INCORPORA RUTIRNA PAR VERIFICAR DISP IMPAGADAS DEL ACREDITADO>
                    vlContinua := True;
                    vlIdCesion := (sgcDATOS.CellStr['ID_CESION',nRow]);
    //                if not FindDispIM(strtoInt(sgcDATOS.CellStr['ID_EMISOR',nRow]),Objeto.Apli, vlMsg) then Begin
                    if not FindDispIMPProv(strtoInt(sgcDATOS.CellStr['ID_PROVEEDOR',nRow]),Objeto.Apli, vlMsg) then Begin
                       if MessageDlg( vlMsg + ' ¿ Desea Continuar ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                          vlContinua := True
                       else vlContinua := False;
                    end;
                    //</EAS4A011    22.AGO.2007     Valida Tasa a una fecha determinada
                    if not ValidaExisTasaFnd(sgcDATOS.CellStr['ID_CESION',nRow],Objeto.Apli.DameFechaEmpresa,Objeto.Apli) then Begin
                       if MessageDlg( ' La el valor de la tasa de fondeo es nula. ¿ Desea Continuar ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                          vlContinua := True
                       else vlContinua := False;
                    end;
                    //end_EASA>/

                    //HERJA - VALIDA QUE LOS PLAZOS DE CAPITAL E INTERES INICIEN AL MISMO TIEMPO EN CASO DE SER UN VPN
                    if vlContinua then
                       vlContinua:=Objeto.ValidaPlazosVPN(sgcDATOS.CellStr['ID_CESION',nRow]);

                   //VALIDA PLD HERJA FEBRERO 2013
                   if vlContinua then
                   Begin
                      vlsql := ' SELECT CS.ID_CESION, CS.IMP_CESION,' +
                               '        CS.B_OPERADO_NAFIN ' +
                               '   FROM CR_CESION CS ' +
                               '  WHERE CS.ID_CESION = ' + sgcDATOS.CellStr['ID_CESION',nRow];
                      vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
                      try
                         if vlQry <> nil then
                         Begin
                            if vlQry.FieldByName('B_OPERADO_NAFIN').AsString = 'V' then
                            begin
                               BerrorPLD := ValidaPLD(sgcDATOS.CellStr['ID_CESION',nRow], vlQry.FieldByName('IMP_CESION').AsFloat, 'COLO',
                                                      Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, Objeto.Apli.Usuario, 'V',
                                                      vlError);
                            end;                          
                         end;
                      finally
                         if vlQry <> nil then
                            vlQry.free;
                         end;
                   end;


                    if vlContinua then Begin
                      // </EASA>
                      vlFAlta := StrToDateTime(sgcDATOS.CellStr['F_ALTA',nRow]);
                      if vlFAlta = Objeto.Apli.DameFechaEmpresa THEN Begin
                         if Objeto.Cesion.STPAUTORIZACESION(StrToInt(vlIdCesion),Objeto.Cesion.IMP_COMPRA.AsFloat, sgcDATOS.CellStr['CVE_CAL_CAPITAL',nRow], vlErr) then
                         Begin
                          // FJR 25.07.2012 solo manda correo de documentos 'ELEC'
                            GetSQLInt('SELECT COUNT(*) AS TOT_ELEC FROM CR_DOCUMENTO '+
                           'WHERE ID_CESION = '+sgcDATOS.CellStr['ID_CESION',nRow]+' AND CVE_DOCUMENTO = ''ELEC'' ', Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,
                           'TOT_ELEC', vlCountElec, False ) ;
                           If (vlCountElec > 0) then
                               begin
                                   //ShowMessage('ELEC') ;
                                   if EnviaMail(sgcDATOS.CellStr['ID_CESION',nRow]) then
                                      vlErrMail:= 'Envio de correo confirmatorio hecho correctamente.'
                                   Else
                                      vlErrMail:= 'No se concreto el envio de correo confirmatorio.' ;
                                   AddLine(MErrores, vlErrMail);
                               end ;
                          // FJR 25.07.2012 fin
                            countAut := countAut + 1;
                         end
                         else AddLine( MErrores, vlErr ); //<EASA 25.ABR.2007     Req. Dolares

                      end
                      else Begin
                         if MessageDlg('¿Desea continuar con el proceso de autorización, debido a que la cesion ' + vlIdCesion +
                                       ', no es una cesión del día y se realizaran los ajustes correspondientes a la cesión y sus documentos?',
                            mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
                            IF Objeto.Cesion.STPACTUALIZACES(StrToInt(vlIdCesion), vlErr) THEN
                            BEGIN
                               //##  BEGIN    DEINTEC.DF  21.MAYO.2008      DESCUENTOS MERCANTILES
                               IF Objeto.Cesion.CreCto.Producto.CVE_CAL_CAPITAL.AsString = C_VPN THEN
                               BEGIN
                                   ShowMessage('Debera actualizar nuevamente la tabla de vencimientos');
                                   temporal := TCrGenVto.Create(self);
                                   try
                                       temporal.Apli:=Objeto.Apli;
                                       temporal.ParamCre:=Objeto.ParamCre;
                                       temporal.vgCesion := vlIdCesion;
                                       temporal.VGCredito:= StrToInt(vlIdCesion);
                                       temporal.FindKey([Objeto.ID_CESION.AsString]);
                                       Objeto.Cesion.ObjectForm.LimpiaTabla;
                                       temporal.Catalogo;
                                   finally
                                       temporal.Free;
                                   end;
                               END;
                               //##  END    DEINTEC.DF  21.MAYO.2008      DESCUENTOS MERCANTILES
                               if Objeto.Cesion.STPAUTORIZACESION(StrToInt(vlIdCesion),
                                            Objeto.Cesion.IMP_COMPRA.AsFloat,
                                            sgcDATOS.CellStr['CVE_CAL_CAPITAL',nRow],
                                            vlErr) then
                               Begin
                                // FJR 24.07.2012 solo manda correo de documentos 'ELEC'
                                  GetSQLInt('SELECT COUNT(*) AS TOT_ELEC FROM CR_DOCUMENTO '+
                                 'WHERE ID_CESION = '+sgcDATOS.CellStr['ID_CESION',nRow]+' AND CVE_DOCUMENTO = ''ELEC'' ', Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,
                                 'TOT_ELEC', vlCountElec, False ) ;
                                 If (vlCountElec > 0) then
                                     begin
                                         if EnviaMail(sgcDATOS.CellStr['ID_CESION',nRow]) then
                                            vlErrMail:= 'Envio de correo confirmatorio hecho correctamente.'
                                         Else
                                            vlErrMail:= 'No se concreto el envio de correo confirmatorio.' ;
                                         AddLine(MErrores, vlErrMail);
                                     end ;
                                // FJR 25.07.2012 fin
                                  countAut := countAut + 1;
                               end
                               else AddLine( MErrores, vlErr );//<EASA 25.ABR.2007     Req. Dolares
                            END
                            ELSE AddLine( MErrores, vlErr );//<EASA 25.ABR.2007     Req. Dolares
                         end;
                      END;
                    end;// </EASA>
                 end;
                 nRow := nRow + 1;
              end;
              ShowMessage('Se autorizó ' + IntToStr(CountAut) + ' cesión (es).');
              AddLine( MErrores, 'Se autorizó ' + IntToStr(CountAut) + ' cesión (es).'); //<EASA 25.ABR.2007     Req. Dolares
              MuestraDatos;
              MessageIniFinProceso( MErrores, cFinal ); //<EASA 25.ABR.2007     Req. Dolares
           end;
         end
         else
            ShowMessage('No hay registros seleccionados para autorizar');
       end;
   end;
end;

// FJR Funcion de envio de correo para cesiones "ELEC"
Function TWCraucacs.EnviaMail(IDCESION: String): Boolean ;
var CrNotific: TCrNotific;
    Enviado: Boolean;
begin
   CrNotific:= TCrNotific.Create(nil) ;
   try
      CrNotific.Apli :=Objeto.Apli;
      CrNotific.ParamCre:=Objeto.ParamCre;
      Objeto.Cesion.FindKey([IDCESION]);
      CrNotific.Cesion:= Objeto.Cesion;
      Enviado:= CrNotific.Envio(1) ;  // SIEMPRE SER'A TOMADO EL FORMATO RECIENTE
      CrNotific:= nil;
   except
      Enviado:= False ;
      CrNotific:= nil ;
   end;

   Result:= Enviado;
end ;

procedure TWCraucacs.btCANCELAClick(Sender: TObject);
var vlIdCesion : String;
    nRow, i    : Integer;
    countAut   : Integer;
    vlErr      : String;
    vlRevFacElec:Integer;    //HERJA 20.12.2010
    vlErrFacElec:string;     //HERJA 20.12.2010
begin
   if Objeto.ValidaAccesoEsp('TCRAUCACS_CANC',True,True) then
   begin
       MErrores.Lines.Clear; //<EASA 25.ABR.2007     Req. Dolares
       nRow := 0;
       countAut:= 0;
       vlErr := '';
       if not Objeto.Cesion.ValCanPerfilUsu   then
       Begin
          btCANCELA.Enabled := False;
       end
       else
       Begin
         if CountSelec(sgcDatos,'AUT') > 0 then
         Begin
           showMessage('Al cancelar la cesión se cancelarán todos sus documentos respectivos.');
           if MessageDlg('¿Está seguro de cancelar ' +IntToStr(CountSelec(sgcDatos,'AUT')) + ' cesión (es)',
                           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
           Begin
              MessageIniFinProceso( MErrores, cInicio ); //<EASA 25.ABR.2007     Req. Dolares
              For i := 0 To sgcDATOS.SG.RowCount - 1 Do
              Begin
                 if (sgcDATOS.CellStr['AUT',nRow] = 'SI' + #30 + '>C') then
                 Begin
                    vlIdCesion := (sgcDATOS.CellStr['ID_CESION',nRow]);

                    //HERJA 20.12.2010 VALIDACION PARA DETECTAR FACTURAS ELECTRONICAS ACTIVAS
                    vlRevFacElec:= RevisaFacturasElectronicas(vlIdCesion);
                    if vlRevFacElec = 0 then
                    begin

                       if Objeto.Cesion.STPCANCELACESION(StrToInt(vlIdCesion), vlErr) then Begin
                          countAut := countAut + 1;
                       end
                       else AddLine( MErrores, vlErr ); //<EASA 25.ABR.2007     Req. Dolares

                   end
                   else
                   begin
                      //if vlRevFacElec = 1 then vlErrFacElec:= 'Existen Facturas Electronicas asociadas a la Cesion '+vlIdCesion+', es necesario CANCELARLAS';
                      //if vlRevFacElec = 2 then vlErrFacElec:= 'Existen Facturas Electronicas por procesar asociadas a la Cesion '+vlIdCesion+', es necesario PROCESARLAS y CANCELARLAS';

                      //vlErrFacElec:= 'Existen Facturas Electronicas asociadas a la Cesion '+vlIdCesion+', es necesario CANCELARLAS';
                      vlErrFacElec:= 'Existen Facturas Electronicas '+vlIdCesion+' SIN PROCESAR, revise el Servicio de Factura Electronica'; //AGOSTO 2013
                      ShowMessage(vlErrFacElec);
                      if vlRevFacElec = 1 then AddLine( MErrores, vlErrFacElec);
                   end;
                    //FIN HERJA 20.12.2010 VALIDACION PARA DETECTAR FACTURAS ELECTRONICAS ACTIVAS

                 end;
                 nRow := nRow + 1;
              end;
              ShowMessage('Se canceló ' + IntToStr(CountAut) + ' cesión (es).');
              AddLine( MErrores, 'Se canceló ' + IntToStr(CountAut) + ' cesión (es).' ); //<EASA 25.ABR.2007     Req. Dolares
              MessageIniFinProceso( MErrores, cFinal ); //<EASA 25.ABR.2007     Req. Dolares
              MuestraDatos;
           end;
         end
         else
            ShowMessage('No hay registros seleccionados para cancelar');
       end;
   end;
end;

procedure TWCraucacs.btCLAS_EMISORClick(Sender: TObject);
var clEmisor : TCrEmisor;
begin
   clEmisor := TCrEmisor.Create(self);
   Try
      clEmisor.Apli:=Objeto.Apli;
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//      clEmisor.FindKey([sgcDATOS.CellStr['ID_EMISOR', sgcDATOS.SG.Row],
      clEmisor.FindKey([sgcDATOS.CellStr['CVE_FND_ENT_DES', sgcDATOS.SG.Row],
                        sgcDATOS.CellStr['ID_EMISOR', sgcDATOS.SG.Row],
{/ROIM}
                        sgcDATOS.CellStr['CVE_EMISOR_NAFIN', sgcDATOS.SG.Row]]);
      clEmisor.ParamCre := Objeto.ParamCre;
      clEmisor.Catalogo;
   finally
      clEmisor.Free;
   end;
end;

procedure TWCraucacs.btCLAS_PROVClick(Sender: TObject);
begin
      Objeto.Proveedor.GetParams(Objeto);
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//      Objeto.Proveedor.FindKey([sgcDATOS.CellStr['ID_PROVEEDOR', sgcDATOS.SG.Row]]);
      Objeto.Proveedor.FindKey([sgcDATOS.CellStr['CVE_FND_ENT_DES', sgcDATOS.SG.Row],
                                sgcDATOS.CellStr['ID_PROVEEDOR', sgcDATOS.SG.Row]]);
{/ROIM}
      Objeto.Proveedor.ParamCre := Objeto.ParamCre;
      Objeto.Proveedor.Catalogo;
end;

procedure TWCraucacs.btEMIS_PROVClick(Sender: TObject);
var EmiProv : TCrEmiPro;
begin
   EmiProv := TCrEmiPro.Create(self);
   Try
      EmiProv.Apli:=Objeto.Apli;
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//      EmiProv.FindKey([sgcDATOS.CellStr['ID_EMISOR', sgcDATOS.SG.Row],
      EmiProv.FindKey([sgcDATOS.CellStr['CVE_FND_ENT_DES', sgcDATOS.SG.Row],
                       sgcDATOS.CellStr['ID_EMISOR', sgcDATOS.SG.Row],
{/ROIM}
                       sgcDATOS.CellStr['ID_PROVEEDOR', sgcDATOS.SG.Row]]);
      EmiProv.ParamCre := Objeto.ParamCre;
      EmiProv.Catalogo;
   finally
      EmiProv.Free;
   end;
end;

procedure TWCraucacs.btIMPRIMIRClick(Sender: TObject);
var vlIdCesion : String;
begin
   if Objeto.ValidaAccesoEsp('TCRAUCACS_IMPRI',True,True) then
   begin
      vlIdCesion := sgcDATOS.CellStr['ID_CESION', sgcDATOS.SG.Row];
      if ((vlIdCesion <> CNULL) AND (sgcDATOS.CellStr['CVE_CAL_CAPITAL',sgcDATOS.SG.Row] <> CNULL)) then
      Begin
  //      IF ( Objeto.Cesion.CreCto.Producto.CVE_CAL_CAPITAL.AsString = C_VPN ) and
  //ROIM 06012008       SE CAMBIA PARA IMPRESIÓN DE REPORTE
        IF (sgcDATOS.CellStr['CVE_CAL_CAPITAL',sgcDATOS.SG.Row]  = C_VPN ) and
           ( Objeto.Cesion.SIT_CESION.AsString = 'NA') then
           RepRelDocEmiProVPN(     '' ,               '' ,             '' ,
                                    '' ,               '' ,             '' ,
                                    '' ,               '' ,             '' ,
                            vlIdCesion ,               '' , IntToStr(Objeto.Apli.IdEmpresa),
                                     '',            FALSE ,          FALSE ,
                                 FALSE ,               '' ,            'C' ,
  {ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
  //                                  '' ,      Objeto.Apli ,         FALSE );
                                     '' ,              '',               '',
                             Objeto.Apli,           TRUE)
        else
        RepRelDocEmiPro(            '' ,               '' ,             '' ,
                                    '' ,               '' ,             '' ,
                                    '' ,               '' ,             '' ,
                            vlIdCesion ,               '' , IntToStr(Objeto.Apli.IdEmpresa),
                                     '',            FALSE ,          FALSE ,
                                 FALSE ,               '' ,            'C' ,
  {ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
  //                                  '' ,      Objeto.Apli ,         FALSE );
                                     '' ,              '',               '',
                             Objeto.Apli,           TRUE);
  {/ROIM}
      end
      else ShowMessage('No existe una cesión a imprimir');
   end;
end;

procedure TWCraucacs.edF_FINALExit(Sender: TObject);
begin
   if StrToDateTime(edF_INICIAL.Text) > StrToDateTime(edF_FINAL.Text) then
   Begin
      ShowMessage('La fecha inicial no puede ser mayor a la final');
      edF_INICIAL.SetFocus;
   end
   else
   if StrToDateTime(edF_FINAL.Text) < StrToDateTime(edF_INICIAL.Text) then
   Begin
      ShowMessage('La fecha final no puede ser menor a la inicial');
      edF_FINAL.SetFocus;
   end;
end;

procedure TWCraucacs.dtpF_INICIALExit(Sender: TObject);
begin
   if StrToDateTime(edF_INICIAL.Text) > StrToDateTime(edF_FINAL.Text) then
   Begin
      ShowMessage('La fecha inicial no puede ser mayor a la final');
      edF_INICIAL.SetFocus;
   end
   else
   if StrToDateTime(edF_FINAL.Text) < StrToDateTime(edF_INICIAL.Text) then
   Begin
      ShowMessage('La fecha final no puede ser menor a la inicial');
      edF_FINAL.SetFocus;
   end;
end;

end.
