// Sistema         : Clase de CR_EMISOR
// Fecha de Inicio : 30/06/2003
// Función forma   : Clase de CR_EMISOR
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrEmisor;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit,IntCtto,

//Unidades Adicionales
IntParamCre, IntCrAcredit,
IntChCte, IntLinkit, IntGenCre, Grids, Aligrid, Menus, IntCrSeguimi,
IntMInstDesc;

const
   C_LONGTYPE_ENTDESC = 10;
   C_LONGTYPE_EMISOR  = 8;
   C_LONGTYPE_EXTERNO = 6;

   C_ColEntDesc   = 1;
   C_ColEmisor    = 2;
   C_ColExterno   = 3;
   C_ColNomEmisor = 4;
   C_ColComis     = 5;
   C_ColSobretasa = 6;

Type
 TCrEmisor= class;

  TWCrEmisor=Class(TForm)
    InterForma1             : TInterForma;
    lbNOMBRE_EMISOR : TLabel;
    ilACREDITADO: TInterLinkit;
    pgAltaDatos: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Lbtotal: TLabel;
    lbTotalReg: TLabel;
    Label7: TLabel;
    Bevel3: TBevel;
    Bevel1: TBevel;
    Label3: TLabel;
    Bevel2: TBevel;
    Label4: TLabel;
    Bevel5: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    btCarga: TBitBtn;
    pbRegistros: TProgressBar;
    MErrores: TMemo;
    SAGta: TStringAlignGrid;
    Panel1: TPanel;
    lbDempresa: TLabel;
    lbDUsuario: TLabel;
    lbDFecha: TLabel;
    lbDPerfil: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    lbID_ACREDITADO: TLabel;
    edID_ACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACREDITADO: TEdit;
    lbCVE_EMISOR_EXT: TLabel;
    edCVE_EMISOR_EXT: TEdit;
    edNOMBRE_EMISOR: TEdit;
    edTASA_COMISION: TInterEdit;
    Label1: TLabel;
    edSOBRETASA: TInterEdit;
    Label2: TLabel;
    rgSIT_EMISOR: TRadioGroup;
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    edF_MODIFICA: TEdit;
    edF_ALTA: TEdit;
    LBCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    edCVE_USU_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    MsgPanel: TPanel;
    PopupMenu1: TPopupMenu;
    Pegar1: TMenuItem;
    chB_VAL_SECTOR: TCheckBox;
    edDESC_ENT_DES: TEdit;
    btnCVE_FND_ENT_DES: TBitBtn;
    edCVE_FND_ENT_DES: TEdit;
    Label8: TLabel;
    ilCVE_FND_ENT_DES: TInterLinkit;
    Bevel4: TBevel;
    Label9: TLabel;
    rbCVE_DIA_PAGO: TRadioGroup;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure edID_ACREDITADOExit(Sender: TObject);
    procedure edCVE_EMISOR_EXTExit(Sender: TObject);
    procedure edNOMBRE_EMISORExit(Sender: TObject);
    procedure rgSIT_EMISORExit(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edTASA_COMISIONExit(Sender: TObject);
    procedure edSOBRETASAExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);
    procedure Pegar1Click(Sender: TObject);
    procedure SAGtaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btCargaClick(Sender: TObject);
    procedure chB_VAL_SECTORExit(Sender: TObject);
    procedure btnCVE_FND_ENT_DESClick(Sender: TObject);
    procedure btnCVE_FND_ENT_DESExit(Sender: TObject);
    procedure ilCVE_FND_ENT_DESCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
    procedure edCVE_FND_ENT_DESExit(Sender: TObject);
    procedure rbCVE_DIA_PAGOExit(Sender: TObject);
    private
    { Private declarations }
    ModIdExterno : Boolean;
    function  ModificoIdExterno : Boolean;
    Procedure PegaInformacion(pLongEntDesc, pLongEmisor, pLongExterno : Integer);
    Function  CargaDatos( var pCveEntDesc, pIdAcreditado,pCveEmiExterno,pNomEmisor,
                              pTasaComis,pSobreTasa : string ) : boolean;
    {ROIM 13032007 AGREGA FUNCIÓN PARA DETERMINAR ENTIDAD DESCONTADORA BINTER}
    Function    DameEntDescBinter : Integer;
    {/ROIM}
    public
    { Public declarations }
    Objeto : TCrEmisor;
end;
 TCrEmisor= class(TInterFrame)
      private
         vgCveExterna    : String;
      protected

      public
        { Public declarations }
        //ID_ACREDITADO            : TInterCampo;
        CVE_FND_ENT_DES          : TInterCampo;
        ID_ACREDITADO            : TInterCampo;
        CVE_EMISOR_EXT           : TInterCampo;
        NOMBRE_EMISOR            : TInterCampo;
        SIT_EMISOR               : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        TASA_COMISION            : TInterCampo;
        SOBRETASA                : TInterCampo;
        B_VAL_SECTOR             : TInterCampo;
        CVE_DIA_PAGO             : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Acreditado               : TCrAcredit;
        MInstDesc                : TMInstDesc;

        strCve_Emisor_Ext        : String;
        strNombre_Emisor         : String;
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
        m_sCVE_FND_ENT_DES       : String;
{/ROIM}

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        PROCEDURE   STPACTUALIDNAFIN;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrEmisor.Create( AOwner : TComponent );
begin Inherited;
      CVE_FND_ENT_DES :=CreaCampo('CVE_FND_ENT_DES',ftString,tsNinguno,tsNinguno,True);
                CVE_FND_ENT_DES.Caption:='Clave de Fnd Ent Des';
      ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,True);
                ID_ACREDITADO.Caption:='Acreditado';
      CVE_EMISOR_EXT :=CreaCampo('CVE_EMISOR_EXT',ftString,tsNinguno,tsNinguno,True);
                CVE_EMISOR_EXT.Caption:='Identificador Externo';
      NOMBRE_EMISOR :=CreaCampo('NOMBRE_EMISOR',ftString,tsNinguno,tsNinguno,True);
                NOMBRE_EMISOR.Caption:='';
      SIT_EMISOR :=CreaCampo('SIT_EMISOR',ftString,tsNinguno,tsNinguno,True);
      With SIT_EMISOR do
      begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('0'); ComboDatos.Add('AC');
            ComboLista.Add('1'); ComboDatos.Add('CA');
      end;
            SIT_EMISOR.Caption:='Situación Emisor';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      TASA_COMISION :=CreaCampo('TASA_COMISION',ftFloat,tsNinguno,tsNinguno,True);
                TASA_COMISION.Caption:='Tasa Comisión';
      SOBRETASA :=CreaCampo('SOBRETASA',ftFloat,tsNinguno,tsNinguno,True);
                SOBRETASA.Caption:='Sobretasa';
      B_VAL_SECTOR :=CreaCampo('B_VAL_SECTOR',ftString,tsNinguno,tsNinguno,True);
                B_VAL_SECTOR.Caption:='Valida Sector';
      CVE_DIA_PAGO :=CreaCampo('CVE_DIA_PAGO',ftInteger,tsNinguno,tsNinguno,True);
      With CVE_DIA_PAGO do
      begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('0'); ComboDatos.Add('0');
            ComboLista.Add('1'); ComboDatos.Add('1');
            ComboLista.Add('2'); ComboDatos.Add('2');
            ComboLista.Add('3'); ComboDatos.Add('3');
            ComboLista.Add('4'); ComboDatos.Add('4');
            ComboLista.Add('5'); ComboDatos.Add('5');
      end;
            CVE_DIA_PAGO.Caption:='CVE_DIA_PAGO';


      FKeyFields.Add('CVE_FND_ENT_DES');
      FKeyFields.Add('ID_ACREDITADO');
      FKeyFields.Add('CVE_EMISOR_EXT');

      TableName := 'CR_EMISOR';
      UseQuery := True;
      HelpFile := 'IntCrEmisor.Hlp';
      ShowMenuReporte:=True;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource:=Self;
      Acreditado.FieldByName('ID_ACREDITADO').MasterField:= 'ID_ACREDITADO';
      Acreditado.Persona.BuscaWhereString := ' PERSONA.ID_PERSONA IN (SELECT ID_ACREDITADO FROM CR_ACREDITADO  ' +
                                             ' WHERE CR_ACREDITADO.SIT_ACREDITADO = ' + #39 + CSIT_AC + #39 + ')';
      Acreditado.Persona.FilterString := Acreditado.Persona.BuscaWhereString;

      MInstDesc := TMInstDesc.Create(Self);
      MInstDesc.MasterSource:= Self;
      MInstDesc.FieldByName('CVE_FND_ENT_DES').MasterField:= 'CVE_FND_ENT_DES';
end;

Destructor TCrEmisor.Destroy;
begin
   if Acreditado <> nil then
      Acreditado.Free;
   If MInstDesc <> nil Then
      MInstDesc.Free;
   inherited;
end;


function TCrEmisor.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrEmisor;
begin
   W:=TWCrEmisor.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

Function TCrEmisor.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrEmiso.it','S,F,S');
      Try
         if Active then begin
            T.Param(0,CVE_FND_ENT_DES.AsString);
            T.Param(1,ID_ACREDITADO.AsString);
            T.Param(2,CVE_EMISOR_EXT.AsString);
         end;
         if T.Execute then
            InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1), T.DameCampo(2)]);
      finally  T.Free;
      end;
end;

{--------------------------------------------------------------------------------------------------------------------
                ACTUALIZACION DE TABLAS QUE CONTIENEN LA CVE NAFIN, CUANDO ESTA SE LLEGA A MODIFICAR
---------------------------------------------------------------------------------------------------------------------}
PROCEDURE TCrEmisor.STPACTUALIDNAFIN;
var   sptActualizaIdNafin       : TStoredProc;
Begin
   try
     sptActualizaIdNafin := TStoredProc.Create(Self);
     with sptActualizaIdNafin do
     begin
        //Inicia el SPT
        sptActualizaIdNafin.DatabaseName:= Apli.DatabaseName;
        sptActualizaIdNafin.SessionName:= Apli.SessionName;
        sptActualizaIdNafin.StoredProcName:= 'PKGCRCREDITO.STPACTUALIDNAFIN';

        // Se crean los parametros del StoreProcedure
        Params.Clear;
//        Params.CreateParam(ftString,'PEENTDESC',ptInput);
        Params.CreateParam(ftInteger,'PEIDEMISOR',ptInput);
        Params.CreateParam(ftString,'PECVEEMISORNAFIN',ptInput);
        Params.CreateParam(ftString,'PECVENAFINNUEVA',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
//        ParamByName('peEntDesc').AsString := CVE_FND_ENT_DES.AsString;
        ParamByName('peIdEmisor').AsInteger := ID_ACREDITADO.AsInteger;
        ParamByName('peCveEmisorNafin').AsString := vgCveExterna;
        ParamByName('peCveNafinNueva').AsString := CVE_EMISOR_EXT.AsString;
        ParamByName('peBCommit').AsString := CVERDAD;
        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           ShowMessage('PROBLEMAS AL ACTUALIZAR LA CLAVE NAFIN : ' +
                      IntToStr(ParamByName('psRESULTADO').AsInteger));
           ShowMessage(ParamByName('psTxResultado').AsString);
        end
        else ShowMessage(ParamByName('psTxResultado').AsString);

     end;
   finally
      sptActualizaIdNafin.Free;
   end;
END;

(***********************************************FORMA CR_EMISOR********************)
(*                                                                                *)
(*  FORMA DE CR_EMISOR                                                            *)
(*                                                                                *)
(***********************************************FORMA CR_EMISOR********************)

{ROIM 13032007 AGREGA FUNCIÓN PARA DETERMINAR ENTIDAD DESCONTADORA BINTER}
Function  TWCrEmisor.DameEntDescBinter : Integer;
var Q : TQuery;
    VLSalida : Integer;
begin
     VLSalida := 0;
     Q :=  GetSQLQuery('SELECT CVE_ENT_DES_BIN FROM CR_PARAM_DD WHERE CVE_PARAM_DD = ' + #39 + 'CREDD' + #39,Objeto.DataBaseName,Objeto.SessionName,True);
     try
        if Q <> nil then
           VLSalida := Q.FieldByName('CVE_ENT_DES_BIN').AsInteger
        else
            VLSalida := 0;
        //end if
     finally
          if Q <> nil then Q.free;
     end;
     DameEntDescBinter := VLSalida;
end;
{/ROIM}

procedure TWCrEmisor.FormShow(Sender: TObject);
begin
      // Pinta datos del panel
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_FND_ENT_DES.Control:=edCVE_FND_ENT_DES;
      Objeto.ID_ACREDITADO.Control:=edID_ACREDITADO;
      Objeto.CVE_EMISOR_EXT.Control:=edCVE_EMISOR_EXT;
      Objeto.NOMBRE_EMISOR.Control:=edNOMBRE_EMISOR;
      Objeto.SIT_EMISOR.Control:=rgSIT_EMISOR;
      Objeto.F_ALTA.Control := edF_ALTA;
      Objeto.CVE_USU_ALTA.Control := edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control := edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control := edCVE_USU_MODIFICA;
      Objeto.TASA_COMISION.Control := edTASA_COMISION;
      Objeto.SOBRETASA.Control := edSOBRETASA;
      Objeto.B_VAL_SECTOR.Control := chB_VAL_SECTOR;
      Objeto.CVE_DIA_PAGO.Control := rbCVE_DIA_PAGO;

      Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACREDITADO;
      Objeto.Acreditado.GetParams(Objeto);

      Objeto.MInstDesc.CVE_FND_ENT_DES.Control := edCVE_FND_ENT_DES;
      Objeto.MInstDesc.DESC_ENT_DES.Control := edDESC_ENT_DES;
      Objeto.MInstDesc.GetParams(Objeto);

      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrEmisor.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_FND_ENT_DES.Control:=nil;
      Objeto.ID_ACREDITADO.Control:=nil;
      Objeto.CVE_EMISOR_EXT.Control:=nil;
      Objeto.NOMBRE_EMISOR.Control:=nil;
      Objeto.SIT_EMISOR.Control:=nil;
      Objeto.F_ALTA.Control := nil;
      Objeto.CVE_USU_ALTA.Control := nil;
      Objeto.F_MODIFICA.Control := nil;
      Objeto.CVE_USU_MODIFICA.Control := nil;
      Objeto.TASA_COMISION.Control := nil;
      Objeto.SOBRETASA.Control := nil;
      Objeto.B_VAL_SECTOR.Control := nil;
      Objeto.CVE_DIA_PAGO.Control := nil;

      Objeto.Acreditado.Persona.Nombre.Control := nil;
      Objeto.MInstDesc.CVE_FND_ENT_DES.Control := nil;
      Objeto.MInstDesc.DESC_ENT_DES.Control := nil;
end;

procedure TWCrEmisor.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrEmisor.InterForma1DespuesNuevo(Sender: TObject);
begin
{ROIM 13/03/2007 CAMBIO FACTORAJE ELECTRONICO}
   if (Trim(Objeto.m_sCVE_FND_ENT_DES) <> '') then
      Objeto.MInstDesc.FindKey([Objeto.m_sCVE_FND_ENT_DES]);
   //end if;
{/ROIM}
   Objeto.NOMBRE_EMISOR.AsString := Objeto.strNombre_Emisor;
   Objeto.CVE_EMISOR_EXT.AsString := Objeto.strCve_Emisor_Ext;
   Objeto.SIT_EMISOR.AsString := 'AC';
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   Objeto.B_VAL_SECTOR.AsString := CVERDAD;
   MuestraHints;
   edCVE_FND_ENT_DES.SetFocus;
end;

procedure TWCrEmisor.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   edCVE_EMISOR_EXT.SetFocus;
end;

procedure TWCrEmisor.btACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCREMISOR_ACRED',True,True) then
   begin
     Objeto.Acreditado.ShowAll := True;
     if Objeto.Acreditado.Busca then
        InterForma1.NextTab(edID_ACREDITADO);
   end;
end;

procedure TWCrEmisor.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrEmisor.ilACREDITADOEjecuta(Sender: TObject);
begin
   if Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) then
       InterForma1.NextTab(edID_ACREDITADO);
   //end if
end;

procedure TWCrEmisor.edID_ACREDITADOExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMesg     := '';
      VLSalida := True;
      Objeto.ID_ACREDITADO.GetFromControl;
      if Objeto.ID_ACREDITADO.AsString = '' then
      Begin
         VLSalida  := False;
         VLMesg     := 'Favor de Indicar el Acreditado';
      end
      else if Objeto.Acreditado.SIT_ACREDITADO.AsString <> 'AC' then
      Begin
         VLSalida  := False;
         VLMesg     := 'Acreditado no Activo';
      end; //end if
      {ROIM 13032007 ASIGNA ENTIDAD DESCONTADORA PARA BINTER}
      if ((VLSalida) and (Objeto.CVE_FND_ENT_DES.AsInteger = DameEntDescBinter)) then
      begin
           Objeto.CVE_EMISOR_EXT.AsInteger := Objeto.ID_ACREDITADO.AsInteger;
           Objeto.NOMBRE_EMISOR.AsString := Objeto.Acreditado.Persona.Nom_Razon_Social.AsString;
      end;
      {/ROIM}
      InterForma1.ValidaExit(edID_ACREDITADO,VLSalida,VLMesg,True);
   end;
end;

procedure TWCrEmisor.edCVE_EMISOR_EXTExit(Sender: TObject);
var vlsql       : String;
    vlSalida    : Boolean;
    vlCveExterna  : Integer;
    vlMsg       : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      ModIdExterno := False;
      vlSalida := True;
      vlMsg:= '';
      Objeto.CVE_EMISOR_EXT.GetFromControl;
      vlSql := 'SELECT COUNT(*) FROM CR_EMISOR ' +
               ' WHERE CVE_FND_ENT_DES = '+ #39 + Objeto.CVE_FND_ENT_DES.AsString + #39 +
               '   AND CVE_EMISOR_EXT  = '+ Objeto.CVE_EMISOR_EXT.AsString +
               '   AND CVE_EMISOR_EXT <> '+#39 + '0'+#39 ;

      if Objeto.CVE_EMISOR_EXT.AsString = '' then
      Begin
         VLSalida := True;
         Objeto.CVE_EMISOR_EXT.AsString := '0';
         Objeto.NOMBRE_EMISOR.AsString := Objeto.Acreditado.Persona.Nombre.AsString;
      end
      else
      Begin
         if InterForma1.IsNewData then
         Begin
            GetSQLInt(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, 'COUNT(*)',vlCveExterna,False);
            if vlCveExterna >= 1 then
            Begin
               vlSalida := False;
               vlMsg   := 'La clave Externa ya Existe';
            end;
         end
         else
         Begin
            vlsql := vlsql + ' AND ID_ACREDITADO <> ' + Objeto.ID_ACREDITADO.AsString;
            GetSQLInt(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, 'COUNT(*)',vlCveExterna,False);
            if vlCveExterna >= 1 then
            Begin
               vlSalida := False;
               vlMsg   := 'La clave Externa ya Existe';
            end
            else
            begin
               if Objeto.vgCveExterna <> Objeto.CVE_EMISOR_EXT.AsString then
               Begin
                  ModIdExterno := True;
               end;
            end;
         end;
      end;
      InterForma1.ValidaExit(edCVE_EMISOR_EXT,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrEmisor.edNOMBRE_EMISORExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edNOMBRE_EMISOR,True,'',True);
end;

procedure TWCrEmisor.rgSIT_EMISORExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_EMISOR,True,'',True);
end;

procedure TWCrEmisor.InterForma1Buscar(Sender: TObject);
begin
   if Objeto.Busca then
   Begin
      Objeto.Acreditado.FindKey([Objeto.ID_ACREDITADO.AsString]);
      MuestraHints;
   end;
end;

procedure TWCrEmisor.edTASA_COMISIONExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      //Verifica que el dato no sea negativo
      Objeto.TASA_COMISION.GetFromControl;
      if Objeto.TASA_COMISION.AsFloat < 0  then
      Begin
         VLSalida := False;
         VLMsg    := 'La tasa comisión no puede ser negativa';
      end;
      InterForma1.ValidaExit(edTASA_COMISION,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrEmisor.edSOBRETASAExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      //Verifica que el dato no sea negativo
      Objeto.SOBRETASA.GetFromControl;
      if Objeto.SOBRETASA.AsFloat < 0 then
      Begin
         VLSalida := False;
         VLMsg    := 'La sobretasa no puede ser negativa';
      end;
      InterForma1.ValidaExit(edSOBRETASA,VLSalida,VLMsg,True);
   end;
end;

Procedure TWCrEmisor.MuestraHints;
Begin
      edNOMBRE_ACREDITADO.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
      edNOMBRE_ACREDITADO.ShowHint := True;
      edNOMBRE_EMISOR.Hint := Objeto.NOMBRE_EMISOR.AsString;
      edNOMBRE_EMISOR.ShowHint := True;
End;

procedure TWCrEmisor.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraHints;
end;

procedure TWCrEmisor.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Realizado := True
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
         if ModIdExterno then
         Begin
            if MessageDlg('Al modificar la Clave del Emisor se actualizarán las cesiones y documentos del emisor ' +
                           Objeto.ID_ACREDITADO.AsString,mtConfirmation,[mbYes, mbNo], 0) = mrYes then
            Begin
               Realizado := True;
               Objeto.STPACTUALIDNAFIN;
            end
            else
            Begin
               Realizado := False;
            end;
         end
         else Realizado := True;
      end
      else Realizado := False;
   end
end;

function TWCrEmisor.ModificoIdExterno : Boolean;
var vlResultado : Boolean;
begin
   vlResultado := True;
   if Objeto.ID_ACREDITADO.AsString = Objeto.vgCveExterna then
      vlResultado := False;
   //end if
   ModificoIdExterno := vlResultado;
end;

procedure TWCrEmisor.InterForma1AntesModificar(Sender: TObject;
  var Realizado: Boolean);
begin
   Objeto.vgCveExterna := Objeto.CVE_EMISOR_EXT.AsString;
end;


{---------------------------- CARGA EN BLOQUE ---------------------------}
Procedure TWCrEmisor.PegaInformacion(pLongEntDesc, pLongEmisor, pLongExterno : Integer);
var l_Tempo, l_Ciclo :Integer;

   procedure limpiaRow(pRow : Integer);
   Begin
      AddLine(MErrores,'Error en Ent.Desc.:'+  SAGta.Cells[C_ColEntDesc,pRow] +
                       ' Id.Acred: '+ SAGta.Cells[C_ColEmisor,pRow] +
                       ' Id. Externo : '+ SAGta.Cells[C_ColExterno,pRow]);
      SAGta.RemoveRow(pRow);
   end;

   Procedure DepuraLineas;  //Depura lineas del grid
   var
      l_Ciclo   : Integer;
      vlLongEntDesc :Integer;
      vlLongEmi : Integer;
      vlLongNaf : Integer;
      vlComis   : String;
      vlSTasa   : String;
   Begin
      l_Ciclo := 0;
      while l_Ciclo <= SAGta.RowCount -1 do begin
         vlLongEntDesc:= Length(SAGta.Cells[C_ColEntDesc,l_Ciclo]);;
         vlLongEmi := Length(SAGta.Cells[C_ColEmisor,l_Ciclo]);
         vlLongNaf := Length(SAGta.Cells[C_ColExterno,l_Ciclo]);
         vlComis   := Trim(SAGta.Cells[C_ColComis,l_Ciclo]);
         vlSTasa   := Trim(SAGta.Cells[C_ColSobretasa,l_Ciclo]);
         //columna en blanco
         SAGta.Cells[0,l_Ciclo] := IntToStr(l_Ciclo + 1);

         if ((trim('>'+trim(SAGta.Cells[0,l_Ciclo])+'<')  = trim('><'))  and
             (trim('>'+trim(SAGta.Cells[1,l_Ciclo])+'<')  = trim('><'))  and
             (trim('>'+trim(SAGta.Cells[2,l_Ciclo])+'<')  = trim('><'))  and
             (trim('>'+trim(SAGta.Cells[3,l_Ciclo])+'<')  = trim('><'))  and
             (trim('>'+trim(SAGta.Cells[4,l_Ciclo])+'<')  = trim('><'))  and
             (trim('>'+trim(SAGta.Cells[5,l_Ciclo])+'<')  = trim('><'))  and
             (trim('>'+trim(SAGta.Cells[6,l_Ciclo])+'<')  = trim('><'))) then Begin
            limpiaRow(l_Ciclo);
            SAGta.RemoveRow(l_Ciclo);
            if (l_Ciclo = 0)and (SAGta.RowCount = 1) then  exit
         end
         else if ((trim('>'+trim(SAGta.Cells[0,l_Ciclo])+'<')  = trim('><'))  and
                  (trim('>'+trim(SAGta.Cells[1,l_Ciclo])+'<')  = trim('><'))  and
                  (trim('>'+trim(SAGta.Cells[2,l_Ciclo])+'<')  = trim('><'))  and
                  (trim('>'+trim(SAGta.Cells[3,l_Ciclo])+'<')  = trim('><'))) then Begin
            limpiaRow(l_Ciclo);
            SAGta.RemoveRow(l_Ciclo);
            if (l_Ciclo = 0)and (SAGta.RowCount = 1) then  exit
         end// valida que exista la llave
         else if ((trim('>'+trim(SAGta.Cells[1,l_Ciclo])+'<')  = trim('><'))  and
                  (trim('>'+trim(SAGta.Cells[2,l_Ciclo])+'<')  = trim('><'))  and
                  (trim('>'+trim(SAGta.Cells[3,l_Ciclo])+'<')  = trim('><'))) then Begin
            limpiaRow(l_Ciclo);
            SAGta.RemoveRow(l_Ciclo);
            if (l_Ciclo = 0)and (SAGta.RowCount = 1) then  exit
         end
         else if ((trim('>'+trim(SAGta.Cells[1,l_Ciclo])+'<')  = trim('><')) or
                  (trim('>'+trim(SAGta.Cells[2,l_Ciclo])+'<')  = trim('><')) or
                  (trim('>'+trim(SAGta.Cells[3,l_Ciclo])+'<')  = trim('><'))) then Begin
            limpiaRow(l_Ciclo);
            SAGta.RemoveRow(l_Ciclo);
            if (l_Ciclo = 0)and (SAGta.RowCount = 1) then  exit
         end
         else if (trim('>'+trim(SAGta.Cells[0,l_Ciclo])+'<')  = trim('><')) then Begin
            SAGta.RemoveRow(l_Ciclo);
            if (l_Ciclo = 0)and (SAGta.RowCount = 1) then  exit
         end
         else if ((( vlLongEmi = 0)or(vlLongNaf = 0)or(vlLongEntDesc = 0)) OR
                  (( vlLongEmi > pLongEmisor)or(vlLongNaf > pLongExterno)or(vlLongEntDesc > pLongEntDesc)))then Begin
            limpiaRow(l_Ciclo);
            SAGta.RemoveRow(l_Ciclo);
            if (l_Ciclo = 0)and (SAGta.RowCount = 1) then  exit
         end
         else if not IsFloat(vlComis) then Begin
            limpiaRow(l_Ciclo);
            AddLine(MErrores,' en el importe de comisión : '+ vlComis);
            SAGta.RemoveRow(l_Ciclo);
            if (l_Ciclo = 0)and (SAGta.RowCount = 1) then  exit
         end
         else if not IsFloat(vlSTasa) then Begin
            limpiaRow(l_Ciclo);
            AddLine(MErrores,' en el importe de la sobreatasa : '+ vlSTasa);
            SAGta.RemoveRow(l_Ciclo);
            if (l_Ciclo = 0)and (SAGta.RowCount = 1) then  exit
         end else begin
            l_Ciclo := l_Ciclo + 1;
         end;
      end;
   end;
//inicio
Begin
   lbTotalReg.Caption := '';
   pbRegistros.Max := 0;
   Try
      For l_Ciclo:= 1 to (SAGta.RowCount-1) do
         For l_Tempo:= 0 to (SAGta.ColCount-1) do
             SAGta.Cells[l_Tempo,l_Ciclo] := '';

      //Pega el archivo desde la memoria
      if SAGta.ColCount = 7 then
         SAGta.RemoveCol(0);
      //end if
      SAGta.CopyFromClipboard;
   except
      ShowMessage('Problemas con la carga en BLOQUE!!!!');
      EXIT;
   end;//end try
   if SAGta.ColCount < 7 then
      SAGta.InsertCol(0)
   else if SAGta.ColCount > 7 then
      SAGta.ColCount := 7;

   SAGta.ColWidths[0] := 25;
   SAGta.ColWidths[1] := 80;
   SAGta.ColWidths[2] := 180;
   SAGta.ColWidths[3] := 70;
   SAGta.ColWidths[4] := 180;
   SAGta.ColWidths[5] := 80;
   SAGta.ColWidths[6] := 60;

   //Pega Datos
   depuralineas;
   if (SAGta.Cells[0,0] <> '') and ( SAGta.RowCount >= 1 ) then
   Begin
     lbTotalReg.Caption := IntToStr(SAGta.RowCount);
     pbRegistros.Max := SAGta.RowCount - 1;
   end;
end;

Function TWCrEmisor.CargaDatos( var pCveEntDesc, pIdAcreditado,pCveEmiExterno,pNomEmisor,
                                   pTasaComis,pSobreTasa : string ) : boolean;
var VLSalida : Boolean;
    vlsql    : String;
    vlUsuario: String;
    vlNombre : String;
Begin
   if pNomEmisor = '' then vlNombre := 'NULL' ELSE vlNombre := #39 + pNomEmisor + #39;
   if pTasaComis = '' then pTasaComis := '0';
   if pSobreTasa = '' then pSobreTasa := '0';

   vlUsuario := Objeto.Apli.Usuario;
   vlsql := 'INSERT INTO CR_EMISOR ( CVE_FND_ENT_DES    , ID_ACREDITADO      , CVE_EMISOR_EXT      ,' +
                                   ' NOMBRE_EMISOR      , SIT_EMISOR            ,' +
                                   ' F_ALTA             , CVE_USU_ALTA          ,' +
                                   ' F_MODIFICA         , CVE_USU_MODIFICA      ,' +
                                   ' TASA_COMISION      , SOBRETASA             ,' +
                                   ' B_VAL_SECTOR          )' +

            ' VALUES   ('+ SQLStr(pCveEntDesc)+ ',' + pIdAcreditado    + ',' + SQLStr( pCveEmiExterno ) + ',' +
                           vlNombre         + ',' + SQLStr( CSIT_AC      ) + ',' +
      SQLFecha(Objeto.Apli.DameFechaEmpresa)+ ',' + SQLStr( vlUsuario    ) + ',' +
                         ' NULL                ,          NULL                   ,' +
                           pTasaComis       + ',' +       pSobreTasa          + ',' +
                           SQLStr( CFALSO ) + ' )' ;
   VLSalida := RunSQL(vlsql,objeto.Apli.DataBaseName,objeto.Apli.SessionName,False);
   CargaDatos := VLSalida;
end;

procedure TWCrEmisor.Pegar1Click(Sender: TObject);
begin
    MErrores.Clear;
    PegaInformacion(C_LONGTYPE_ENTDESC, C_LONGTYPE_EMISOR,C_LONGTYPE_EXTERNO);
end;

procedure TWCrEmisor.SAGtaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   MErrores.Clear;
   if ((Shift = [ssCtrl] ) and (Key = 86)) then
      PegaInformacion(C_LONGTYPE_ENTDESC, C_LONGTYPE_EMISOR,C_LONGTYPE_EXTERNO);
   // if end;
end;

procedure TWCrEmisor.btCargaClick(Sender: TObject);
var
   vlCtdorLine       : Integer;
   vlEntDesc         : String;
   vlEmisor          : String;
   vlNafin           : String;
   vlNomEmisor       : String;
   vlComis           : String;
   vlSobretasa       : String;
   vlTermina         : Boolean;
   vlMsg             : String;
begin
   if Objeto.ValidaAccesoEsp('TCREMISOR_CARGA',True,True) then
   begin
       If Trim(SAGta.Cells[0,0]) <> CNULL Then
          If Trim(SAGta.Cells[1,0]) <> CNULL Then
             If Trim(SAGta.Cells[2,0]) <> CNULL Then
                If Trim(SAGta.Cells[3,0]) <> CNULL Then Begin
                   vlTermina := False;
                   Begin
                      MErrores.Clear;
                      messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicio proceso
                      For VLCtdorLine := 0 to (SAGta.RowCount-1) do Begin//INICIALIZA INDICADOR DE PROGRESO
                         vlEntDesc  := UpperCase(SAGta.Cells[C_ColEntDesc,VLCtdorLine]);
                         vlEmisor   := UpperCase(SAGta.Cells[C_ColEmisor,VLCtdorLine]);
                         vlNafin    := UpperCase(SAGta.Cells[C_ColExterno,VLCtdorLine]);
                         vlNomEmisor:= UpperCase(SAGta.Cells[C_ColNomEmisor,VLCtdorLine]);
                         vlComis    := UpperCase(SAGta.Cells[C_ColComis,VLCtdorLine]);
                         vlSobretasa:= UpperCase(SAGta.Cells[C_ColSobretasa,VLCtdorLine]);
                         If not(CargaDatos(vlEntDesc, vlEmisor,vlNafin,vlNomEmisor,vlComis,vlSobreTasa)) Then Begin
                            AddLine(MErrores,'Error Id. Emisor : '+ vlEmisor +
                                               ' Cve. Externo. : '+ vlNafin + ' Nom. Emisor : '+ vlNomEmisor);
                            If MessageDlg('¿Error en carga. del Emisor:' + vlEmisor + ', Id. Externo :' + vlNafin +
                               MSG_PREG_CONTINUA_PROCES, mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Begin
                               vlTermina := False;
                               messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
                               exit;
                            End;
                         End;
                         pbRegistros.Position :=VLCtdorLine;
                         vlTermina := True;
                      End;
                      If vlTermina then
                        ShowMessage(MSG_PROCESO_CARGA_OK);
                      messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
                   End;
                End;
   end;
end;

procedure TWCrEmisor.chB_VAL_SECTORExit(Sender: TObject);
begin
      InterForma1.ValidaExit(chB_VAL_SECTOR,True,'',True);
end;

procedure TWCrEmisor.btnCVE_FND_ENT_DESClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCREMISOR_ENTDS',True,True) then
   begin
     Objeto.MInstDesc.ShowAll := True;
     If Objeto.MInstDesc.Busca Then
        InterForma1.NextTab(edCVE_FND_ENT_DES);
   end;
end;

procedure TWCrEmisor.btnCVE_FND_ENT_DESExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      VLMesg   := '';
      VLSalida := True;
      Objeto.CVE_FND_ENT_DES.GetFromControl;
      If Objeto.CVE_FND_ENT_DES.AsString = '' Then Begin
         VLSalida  := False;
         VLMesg    := 'Favor de Indicar la Entidad Descontadora';
      End;
      InterForma1.ValidaExit(edCVE_FND_ENT_DES,VLSalida,VLMesg,True);
   End;
end;

procedure TWCrEmisor.ilCVE_FND_ENT_DESCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrEmisor.ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
begin
   If Objeto.MInstDesc.FindKey([ilCVE_FND_ENT_DES.Buffer]) then
       InterForma1.NextTab(edCVE_FND_ENT_DES);
   //end if
end;

procedure TWCrEmisor.edCVE_FND_ENT_DESExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMesg     := '';
      VLSalida := True;
      Objeto.CVE_FND_ENT_DES.GetFromControl;
      if Objeto.CVE_FND_ENT_DES.AsString = '' then
      Begin
         VLSalida  := False;
         VLMesg     := 'Favor de Indicar la Entidad Descontadora';
      end; //end if
      InterForma1.ValidaExit(edCVE_FND_ENT_DES,VLSalida,VLMesg,True);
   end;
end;

procedure TWCrEmisor.rbCVE_DIA_PAGOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rbCVE_DIA_PAGO,True,'',True);
end;

end.
