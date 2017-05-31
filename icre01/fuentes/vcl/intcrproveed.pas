// Sistema         : Clase de CR_PROVEEDOR
// Fecha de Inicio : 30/06/2003
// Función forma   : Clase de CR_PROVEEDOR
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
// Modificaciones  : (1) LOLS 18NOV2005 SE INCORPORAN CAMPOS ID_PROM_ADM_PYME,
//                          IMP_VENTA_ANUAL, NUM_PER_OCUPADO, PCT_PROD_MER_EXT Y
//                          PCT_PROD_MER_INT
Unit IntCrProveed;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntCtto,

//Unidades Adicionales

 IntCrFeUsIn,   {ROIM 19/09/2007         AGREGA INDICADOR DE FACTORAJE ELECTRÓNICO}

IntParamCre, IntPers,
IntChCte, IntLinkit, IntCrProSec, IntMPers, InterEdit, IntMInstDesc;

Type
 TCrProveed= class;

  TWCrProveedor=Class(TForm)
    InterForma1             : TInterForma;
    lbID_ACREDITADO : TLabel;
    edID_ACREDITADO : TEdit;
    lbID_PROV_EXTERNO: TLabel;
    edID_PROV_EXTERNO: TEdit;
    rgSIT_PROVEEDOR: TRadioGroup;
    btACREDITADO: TBitBtn;
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
    lbF_ALTA: TLabel;
    edF_ALTA: TEdit;
    lbF_MODIFICA: TLabel;
    edF_MODIFICA: TEdit;
    lbCVE_USU_MODIFICA: TLabel;
    LBCVE_USU_ALTA: TLabel;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    edNOMBRE_ACREDITADO: TEdit;
    ilACREDITADO: TInterLinkit;
    chELIMINAR: TCheckBox;
    bvDatosPYME: TBevel;
    lbDatosPYME: TLabel;
    lbID_PROM_ADM_PYME: TLabel;
    edID_PROM_ADM_PYME: TEdit;
    lbIMP_VENTA_ANUAL: TLabel;
    lbNUM_PER_OCUPADO: TLabel;
    edNUM_PER_OCUPADO: TEdit;
    lbPCT_PROD_MER_EXT: TLabel;
    lbPCT_PROD_MER_INT: TLabel;
    edNOMBRE_PROM_ADM: TEdit;
    btPROM_ADM: TBitBtn;
    ilPROMADM: TInterLinkit;
    edIMP_VENTA_ANUAL: TInterEdit;
    edPCT_PROD_MER_EXT: TInterEdit;
    edPCT_PROD_MER_INT: TInterEdit;
    lbCVE_SECTOR_PRO: TLabel;
    edCVE_SECTOR_PRO: TEdit;
    btCVE_SECTOR_PR: TBitBtn;
    edDESC_SECTOR: TEdit;
    ilSECTOR: TInterLinkit;
    Label1: TLabel;
    edNOM_CONTACTO: TEdit;
    Label8: TLabel;
    edCVE_FND_ENT_DES: TEdit;
    btnCVE_FND_ENT_DES: TBitBtn;
    edDESC_ENT_DES: TEdit;
    ilCVE_FND_ENT_DES: TInterLinkit;
    Label2: TLabel;
    Bevel1: TBevel;
    lbIMP_RIESGO_MAX: TLabel;
    edIMP_DISPUESTO: TInterEdit;
    Label3: TLabel;
    ieIMP_LIM_ASIGNADO: TInterEdit;
    Label4: TLabel;
    edIMP_DISPONIBLE: TInterEdit;
    bbFactoElec: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure edID_ACREDITADOExit(Sender: TObject);
    procedure edID_PROV_EXTERNOExit(Sender: TObject);
    procedure rgSIT_PROVEEDORExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure ilSECTOREjecuta(Sender: TObject);
    procedure ilSECTORCapture(Sender: TObject; var Show: Boolean);
    //LOLS procedure edCVE_SECTOR_PROExit(Sender: TObject);
    procedure chELIMINARClick(Sender: TObject);
    procedure chELIMINARExit(Sender: TObject);
    procedure btPROM_ADMClick(Sender: TObject);
    procedure edIMP_VENTA_ANUALExit(Sender: TObject);
    procedure edNUM_PER_OCUPADOExit(Sender: TObject);
    procedure edPCT_PROD_MER_EXTExit(Sender: TObject);
    procedure edPCT_PROD_MER_INTExit(Sender: TObject);
    procedure btPROM_ADMExit(Sender: TObject);
    procedure ilPROMADMEjecuta(Sender: TObject);
    procedure btCVE_SECTOR_PRExit(Sender: TObject);
    procedure btCVE_SECTOR_PRClick(Sender: TObject);
    procedure edNOM_CONTACTOExit(Sender: TObject);
    procedure edCVE_FND_ENT_DESExit(Sender: TObject);
    procedure btnCVE_FND_ENT_DESClick(Sender: TObject);
    procedure btnCVE_FND_ENT_DESExit(Sender: TObject);
    procedure ilCVE_FND_ENT_DESCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
    procedure ieIMP_LIM_ASIGNADOExit(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure bbFactoElecClick(Sender: TObject);
    //LOLS procedure procedure btCVE_SECTOR_PRClick(Sender: TObject);
    //LOLS procedure procedure btCVE_SECTOR_PRExit(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrProveed;
end;
 TCrProveed= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_FND_ENT_DES          : TInterCampo;
        ID_ACREDITADO            : TInterCampo;
        ID_PROV_EXTERNO          : TInterCampo;
        SIT_PROVEEDOR            : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        CVE_SECTOR_PRO           : TInterCampo;
        {LOLS 23NOV2005  SE INCORPORA CAMPOS (1)}
        ID_PROM_ADM_PYME         : TInterCampo;
        IMP_VENTA_ANUAL          : TInterCampo;
        NUM_PER_OCUPADO          : TInterCampo;
        PCT_PROD_MER_EXT         : TInterCampo;
        PCT_PROD_MER_INT         : TInterCampo;
        {/LOLS}
        {/EASA4011   21/09/2006 SE INCORPORA EL CAMPO }
        NOM_CONTACTO             : TInterCampo;
        {EASA4011/ }

        {ROIM 13/03/2007 IMPORTE LIMITE ASIGNADO POR PROVEEDOR FACTORAJE ELECTRÓNICO}
        IMP_LIM_ASIGNADO        : TInterCampo;
        IMP_DISPUESTO           : TInterCampo;
        IMP_DISPONIBLE          : TInterCampo;
        {/ROIM}

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Persona                  : TPersona;
        ProvSec                  : TCrProSec;

        {LOLS 23NOV2005  SE INCORPORA CAMPOS (1)}
        PromotorAdm              : TMPersona;
        {/LOLS}

        MInstDesc                : TMInstDesc;

        nID_PROV_EXTERNO         : Integer;
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
        m_sCVE_FND_ENT_DES       : String;
{/ROIM}

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Function    DameDispuestoProv(PEIDProveedor : Integer) : Double;

      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrProveed.Create( AOwner : TComponent );
begin Inherited;
      CVE_FND_ENT_DES :=CreaCampo('CVE_FND_ENT_DES',ftString,tsNinguno,tsNinguno,True);
                CVE_FND_ENT_DES.Caption:='Clave de Fnd Ent Des';
      ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,True);
                ID_ACREDITADO.Caption:='Acreditado';
      ID_PROV_EXTERNO :=CreaCampo('ID_PROV_EXTERNO',ftFloat,tsNinguno,tsNinguno,True);
                ID_PROV_EXTERNO.Caption:='Identificador Externo';
      SIT_PROVEEDOR :=CreaCampo('SIT_PROVEEDOR',ftString,tsNinguno,tsNinguno,True);
         With SIT_PROVEEDOR do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0'); ComboDatos.Add('AC');
                ComboLista.Add('1'); ComboDatos.Add('CA');
          end;
                SIT_PROVEEDOR.Caption:='Situación Proveedor';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      CVE_SECTOR_PRO :=CreaCampo('CVE_SECTOR_PRO',ftString,tsNinguno,tsNinguno,True);
                CVE_SECTOR_PRO.Caption:='Clave Sector Pro';

      {LOLS 23NOV2005  SE INCORPORA CAMPOS (1)}
      ID_PROM_ADM_PYME := CreaCampo('ID_PROM_ADM_PYME',  ftFloat, tsNinguno, tsNinguno, True );
      IMP_VENTA_ANUAL  := CreaCampo('IMP_VENTA_ANUAL',   ftFloat, tsNinguno, tsNinguno, True );
      NUM_PER_OCUPADO  := CreaCampo('NUM_PER_OCUPADO',   ftFloat, tsNinguno, tsNinguno, True );
      PCT_PROD_MER_EXT := CreaCampo('PCT_PROD_MER_EXT',  ftFloat, tsNinguno, tsNinguno, True );
      PCT_PROD_MER_INT := CreaCampo('PCT_PROD_MER_INT',  ftFloat, tsNinguno, tsNinguno, True );
      {/EASA4011   21/09/2006 SE INCORPORA EL CAMPO }
      NOM_CONTACTO     := CreaCampo('NOM_CONTACTO',  ftString, tsNinguno, tsNinguno, True );
     {EASA4011/ }

      //
      ID_PROM_ADM_PYME.Caption := 'Número de Prom Adm Pyme';
      IMP_VENTA_ANUAL.Caption  := 'Imp Venta Anual';
      NUM_PER_OCUPADO.Caption  := 'Número Per Ocupado';
      PCT_PROD_MER_EXT.Caption := 'Pct Prod Mer Ext';
      PCT_PROD_MER_INT.Caption := 'Pct Prod Mer Int';
      {/LOLS}

      {ROIM 13/03/2007 IMPORTE LIMITE ASIGNADO POR PROVEEDOR FACTORAJE ELECTRÓNICO}
      IMP_LIM_ASIGNADO     := CreaCampo('IMP_LIM_ASIGNADO',  ftFloat, tsNinguno, tsNinguno, True );
                IMP_LIM_ASIGNADO.Caption:='IMP_LIM_ASIGNADO';
      IMP_DISPUESTO     := CreaCampo('IMP_DISPUESTO',  ftFloat, tsNinguno, tsNinguno, False );
                IMP_DISPUESTO.Caption:='IMP_DISPUESTO';
      IMP_DISPONIBLE     := CreaCampo('IMP_DISPONIBLE',  ftFloat, tsNinguno, tsNinguno, False );
                IMP_DISPONIBLE.Caption:='IMP_DISPONIBLE';
      {/ROIM}


      FKeyFields.Add('CVE_FND_ENT_DES');
      FKeyFields.Add('ID_ACREDITADO');

      TableName := 'CR_PROVEEDOR';
      UseQuery := True;
      HelpFile := 'IntCrProveed.Hlp';
      ShowMenuReporte:=True;

      Persona := TPersona.Create(Self);
      Persona.MasterSource:=Self;
      Persona.FieldByName('ID_PERSONA').MasterField:='ID_ACREDITADO';

      ProvSec := TCrProSec.Create(Self);
      ProvSec.MasterSource:=Self;
      ProvSec.FieldByName('CVE_SECTOR_PRO').MasterField:='CVE_SECTOR_PRO';

      {LOLS 23NOV2005  SE INCORPORA CAMPOS (1)}
      PromotorAdm := TMPersona.Create(Self);
      PromotorAdm.FilterBy := fbTMPersonaEmpleado;
      PromotorAdm.MasterSource := Self;
      PromotorAdm.FieldByName('ID_PERSONA').MasterField := 'ID_PROM_ADM_PYME';
      {/LOLS}
      MInstDesc := TMInstDesc.Create(Self);
      MInstDesc.MasterSource:= Self;
      MInstDesc.FieldByName('CVE_FND_ENT_DES').MasterField:= 'CVE_FND_ENT_DES';
end;

Destructor TCrProveed.Destroy;
begin
   if Persona <> nil then
      Persona.Free;
   //end if
   if ProvSec <> nil then
      ProvSec.Free;
   //end if
   if MInstDesc <> nil then
      MInstDesc.Free;
   {LOLS 23NOV2005  SE INCORPORA CAMPOS (1)}
   if PromotorAdm <> nil then
      PromotorAdm.Free;
   {/LOLS}
   inherited;
end;


function TCrProveed.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrProveedor;
begin
   W:=TWCrProveedor.Create(Self);
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


Function TCrProveed.InternalBusca:Boolean;
Var T:TInterFindit;
    VlSalida : Boolean;
begin InternalBusca := False;
      VlSalida := False;
      T := CreaBuscador('ICrProve.it','S,F');
      Try
         if Active then begin
            T.Param(0,CVE_FND_ENT_DES.AsString);
            T.Param(1,ID_ACREDITADO.AsString);
         end;
          if T.Execute then
          begin
               VlSalida := FindKey([T.DameCampo(0),T.DameCampo(1)]);
               if VlSalida then
               begin
                    IMP_DISPUESTO.AsFloat := DameDispuestoProv(StrToInt(T.DameCampo(1)));
                    IMP_DISPONIBLE.AsFloat := IMP_LIM_ASIGNADO.AsFloat - IMP_DISPUESTO.AsFloat;
               end;
               InternalBusca := VlSalida;
          end;
      finally  T.Free;
      end;
end;

{ROIM 13032007 BUSCA LIMITE ASIGNADO PROVEEDOR}
Function  TCrProveed.DameDispuestoProv(PEIDProveedor : Integer) : Double;
var Q : TQuery;
    VLSalida : Double;
begin
     VLSalida := 0;
     Q :=  GetSQLQuery(' SELECT SUM(PKGCRSALDOS.StpObtSaldosxDisp(ID_CESION))  AS IMP_DISP_PROV '+
                       ' FROM CR_CESION  CS ' +
                       ' WHERE  ID_PROVEEDOR =  ' + IntToStr(PEIDProveedor) +
                       ' AND    SIT_CESION NOT IN (' + #39 + 'CA' + #39 + ',' + #39 + 'LQ' + #39 + ')' +
                       ' GROUP BY ID_PROVEEDOR '
                       ,DataBaseName,SessionName,True);
     try
        if Q <> nil then
           VLSalida := Q.FieldByName('IMP_DISP_PROV').AsFloat
        else
            VLSalida := 0;
        //end if
     finally
          if Q <> nil then Q.free;
     end;
     DameDispuestoProv := VLSalida;
end;
{/ROIM}


(***********************************************FORMA CR_PROVEEDOR********************)
(*                                                                              *)
(*  FORMA DE CR_PROVEEDOR                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_PROVEEDOR********************)

procedure TWCrProveedor.FormShow(Sender: TObject);
begin
      // Pinta datos del panel
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_FND_ENT_DES.Control:=edCVE_FND_ENT_DES;
      Objeto.ID_ACREDITADO.Control:=edID_ACREDITADO;
      Objeto.ID_PROV_EXTERNO.Control:=edID_PROV_EXTERNO;
      Objeto.SIT_PROVEEDOR.Control:=rgSIT_PROVEEDOR;
      Objeto.F_ALTA.Control := edF_ALTA;
      Objeto.CVE_USU_ALTA.Control := edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control := edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control := edCVE_USU_MODIFICA;
      Objeto.CVE_SECTOR_PRO.Control := edCVE_SECTOR_PRO;
      {/EASA4011   21/09/2006 SE INCORPORA EL CAMPO }
      Objeto.NOM_CONTACTO.Control := edNOM_CONTACTO;
     {EASA4011/ }

      Objeto.Persona.Nombre.Control := edNOMBRE_ACREDITADO;
      Objeto.Persona.GetParams(Objeto);

      Objeto.ProvSec.DESC_SECTOR.Control := edDESC_SECTOR;
      Objeto.ProvSec.GetParams(Objeto);

      {LOLS 23NOV2005  SE INCORPORA CAMPOS (1)}
      Objeto.ID_PROM_ADM_PYME.Control   := edID_PROM_ADM_PYME;
      Objeto.IMP_VENTA_ANUAL.Control    := edIMP_VENTA_ANUAL;
      Objeto.NUM_PER_OCUPADO.Control    := edNUM_PER_OCUPADO;
      Objeto.PCT_PROD_MER_EXT.Control   := edPCT_PROD_MER_EXT;
      Objeto.PCT_PROD_MER_INT.Control   := edPCT_PROD_MER_INT;
      Objeto.PromotorAdm.ID_Persona.Control := edID_PROM_ADM_PYME;
      Objeto.PromotorAdm.Nombre.Control     := edNOMBRE_PROM_ADM;
      {/LOLS}

      Objeto.MInstDesc.CVE_FND_ENT_DES.Control:=edCVE_FND_ENT_DES;
      Objeto.MInstDesc.DESC_ENT_DES.Control:=edDESC_ENT_DES;

      {ROIM 13/03/2007 IMPORTE LIMITE ASIGNADO POR PROVEEDOR FACTORAJE ELECTRÓNICO}
      Objeto.IMP_LIM_ASIGNADO.Control := ieIMP_LIM_ASIGNADO;
      Objeto.IMP_DISPUESTO.Control := edIMP_DISPUESTO;
      Objeto.IMP_DISPONIBLE.Control := edIMP_DISPONIBLE;
      {/ROIM}

      Objeto.MInstDesc.GetParams(Objeto);
      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrProveedor.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_FND_ENT_DES.Control:=nil;
      Objeto.ID_ACREDITADO.Control:=nil;
      Objeto.ID_PROV_EXTERNO.Control:=nil;
      Objeto.SIT_PROVEEDOR.Control:=nil;
      Objeto.F_ALTA.Control := nil;
      Objeto.CVE_USU_ALTA.Control := nil;
      Objeto.F_MODIFICA.Control := nil;
      Objeto.CVE_USU_MODIFICA.Control := nil;
      Objeto.CVE_SECTOR_PRO.Control := nil;
      Objeto.NOM_CONTACTO.Control := nil;

      Objeto.Persona.Nombre.Control := nil;
      Objeto.ProvSec.DESC_SECTOR.Control := nil;

      {LOLS 23NOV2005  SE INCORPORA CAMPOS (1)}
      Objeto.ID_PROM_ADM_PYME.Control   := nil;
      Objeto.IMP_VENTA_ANUAL.Control    := nil;
      Objeto.NUM_PER_OCUPADO.Control    := nil;
      Objeto.PCT_PROD_MER_EXT.Control   := nil;
      Objeto.PCT_PROD_MER_INT.Control   := nil;
      Objeto.PromotorAdm.ID_Persona.Control := nil;
      Objeto.PromotorAdm.Nombre.Control     := nil;
      {/LOLS}
      Objeto.MInstDesc.CVE_FND_ENT_DES.Control:=nil;
      Objeto.MInstDesc.DESC_ENT_DES.Control:=nil;

      {ROIM 13/03/2007 IMPORTE LIMITE ASIGNADO POR PROVEEDOR FACTORAJE ELECTRÓNICO}
      Objeto.IMP_LIM_ASIGNADO.Control := nil;
      Objeto.IMP_DISPUESTO.Control := nil;
      Objeto.IMP_DISPONIBLE.Control := nil;
      {/ROIM}

   //Objeto
end;

procedure TWCrProveedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrProveedor.InterForma1DespuesNuevo(Sender: TObject);
begin
{ROIM 13/03/2007 CAMBIO FACTORAJE ELECTRONICO}
   if (Trim(Objeto.m_sCVE_FND_ENT_DES) <> '') then
      Objeto.MInstDesc.FindKey([Objeto.m_sCVE_FND_ENT_DES]);
   //end if;
{/ROIM}
   Objeto.ID_PROV_EXTERNO.AsInteger := Objeto.nID_PROV_EXTERNO;
   Objeto.SIT_PROVEEDOR.AsString := 'AC';
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   Objeto.IMP_DISPUESTO.AsFloat := 0;
   Objeto.IMP_DISPONIBLE.AsFloat := 0;
   MuestraHints;
   edCVE_FND_ENT_DES.SetFocus;
end;

procedure TWCrProveedor.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   edID_PROV_EXTERNO.SetFocus;
end;

procedure TWCrProveedor.btACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRPROVEED_PROV',True,True) then
   begin
     Objeto.Persona.ShowAll := True;
     If Objeto.Persona.Busca Then
        InterForma1.NextTab(edID_ACREDITADO);
   end;
end;

procedure TWCrProveedor.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrProveedor.ilACREDITADOEjecuta(Sender: TObject);
begin
   if Objeto.Persona.FindKey([ilACREDITADO.Buffer]) then
      InterForma1.NextTab(edID_ACREDITADO);
   //end if
end;

procedure TWCrProveedor.edID_ACREDITADOExit(Sender: TObject);
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
      end;
      InterForma1.ValidaExit(edID_ACREDITADO,VLSalida,VLMesg,True);
   end; //end if
end;

procedure TWCrProveedor.edID_PROV_EXTERNOExit(Sender: TObject);
var vlsql       : String;
    vlSalida    : Boolean;
    vlCveExterna  : Integer;
    vlMsg       : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlSalida:= True;
      vlMsg := '';
      Objeto.ID_PROV_EXTERNO.GetFromControl;
      vlSql := 'SELECT COUNT(*) FROM CR_PROVEEDOR ' +
               ' WHERE CVE_FND_ENT_DES = ' + #39 + Objeto.CVE_FND_ENT_DES.AsString + #39 +
               '   AND ID_PROV_EXTERNO <> 0' +
               '   AND ID_PROV_EXTERNO = ' + Objeto.ID_PROV_EXTERNO.AsString;

      if Objeto.ID_PROV_EXTERNO.AsString = '' then
      Begin
         VLSalida := True;
         Objeto.ID_PROV_EXTERNO.AsInteger := 0;
      end;

      if InterForma1.IsNewData then
      Begin
          GetSQLInt(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT(*)',vlCveExterna,False);
          if (vlCveExterna >= 1 ) then
          Begin
             VLSalida := False;
             VLMsg   := 'La clave Externa ya Existe';
          end;
      end
      else
      Begin
          vlsql := vlsql + ' AND ID_ACREDITADO <> ' + Objeto.ID_ACREDITADO.AsString;
          GetSQLInt(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT(*)',vlCveExterna,False);
          if (vlCveExterna >= 1) then
          Begin
             VLSalida := False;
             VLMsg   := 'La clave Externa ya Existe';
          end;
      end;
      InterForma1.ValidaExit(edID_PROV_EXTERNO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrProveedor.rgSIT_PROVEEDORExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_PROVEEDOR,True,'',True);
end;

Procedure TWCrProveedor.MuestraHints;
var Q   : TQuery;
    BFE : Boolean;
Begin
      edNOMBRE_ACREDITADO.Hint := Objeto.Persona.Nombre.AsString;
      edNOMBRE_ACREDITADO.ShowHint := True;
      edDESC_SECTOR.Hint := Objeto.ProvSec.DESC_SECTOR.AsString;
      edDESC_SECTOR.ShowHint := True;

     {ROIM 19/09/2007         AGREGA INDICADOR DE FACTORAJE ELECTRÓNICO}
     if Objeto.ID_ACREDITADO.AsSQL <> '' then Begin
        BFE := False;
        Q :=  GetSQLQuery(' SELECT CFUI.CVE_USUARIO_INET, CFUI.SIT_USUARIO ' +
                          ' FROM   CR_FE_USUARIO CFU, ' +
                          '        CR_FE_USUARIO_INET CFUI ' +
                          ' WHERE  CFUI.CVE_USUARIO_CORP =  CFU.CVE_USUARIO ' +
                          ' AND    CFU.ID_PERSONA_USR = ' + Objeto.ID_ACREDITADO.AsSQL
                          ,Objeto.DataBaseName,Objeto.SessionName,True);
        try
           if Q <> nil then
           begin
                bbFactoElec.Font.Color := clBlack;
                if Q.FieldByName('SIT_USUARIO').AsString = 'AC' Then
                  bbFactoElec.Caption := 'Tiene configuración Fac. Elec.'
                else
                  bbFactoElec.Caption := 'Tiene configuración Fac. Elec. Situación:  -INACTIVO-';
                //end if;
           end
           else
           begin
                bbFactoElec.Font.Color := clRed;
                bbFactoElec.Caption := 'NO está configurado Fac. Elec.';
           end;
        finally
            if Q <> nil then Q.free;
        end;
       {/ROIM}
     End;
End;

procedure TWCrProveedor.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrProveedor.InterForma1DespuesAceptar(Sender: TObject);
begin
    MuestraHints;
end;

procedure TWCrProveedor.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
end;

procedure TWCrProveedor.ilSECTOREjecuta(Sender: TObject);
begin
//   oBJETO.ProvSec.Active := True
   if Objeto.ProvSec.FindKey([ilSECTOR.Buffer]) then
      InterForma1.NextTab(edCVE_SECTOR_PRO);
   //end if
end;

procedure TWCrProveedor.ilSECTORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrProveedor.btCVE_SECTOR_PRClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRPROVEED_SECT',True,True) then
   begin
      Objeto.ProvSec.ShowAll := True;
      if Objeto.ProvSec.Busca then
         InterForma1.NextTab(edCVE_SECTOR_PRO);
      //end if
   end;
end;

procedure TWCrProveedor.btCVE_SECTOR_PRExit(Sender: TObject);
begin
  InterForma1.ValidaExit( btCVE_SECTOR_PR, True, '', True );
end;

procedure TWCrProveedor.chELIMINARClick(Sender: TObject);
begin
   if chELIMINAR.Checked then
   Begin
      Objeto.ProvSec.Active := False;
      edCVE_SECTOR_PRO.Text := '';
   end
   else Objeto.ProvSec.Active := True;
end;

procedure TWCrProveedor.chELIMINARExit(Sender: TObject);
begin
      InterForma1.ValidaExit(chELIMINAR,True,'',True);
end;


{LOLS 23NOV2005  SE INCORPORA CAMPOS (1)}
procedure TWCrProveedor.btPROM_ADMClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRPROVEED_PRAD',True,True) then
   begin
      Objeto.PromotorAdm.ShowAll := True;
      if Objeto.PromotorAdm.Busca then
         InterForma1.NextTab(edID_PROM_ADM_PYME);
      //end if
   end;   
end;

procedure TWCrProveedor.ilPROMADMEjecuta(Sender: TObject);
begin
  if Objeto.PromotorAdm.FindKey([ ilPROMADM.Buffer ]) then
     InterForma1.NextTab(edID_PROM_ADM_PYME);
  //end if
end;

procedure TWCrProveedor.btPROM_ADMExit(Sender: TObject);
begin
  InterForma1.ValidaExit( btPROM_ADM, True, '', True );
end;

procedure TWCrProveedor.edIMP_VENTA_ANUALExit(Sender: TObject);
begin
  InterForma1.ValidaExit( edIMP_VENTA_ANUAL, True, '', True );
end;

procedure TWCrProveedor.edNUM_PER_OCUPADOExit(Sender: TObject);
begin
  InterForma1.ValidaExit( edNUM_PER_OCUPADO, True, '', True );
end;

procedure TWCrProveedor.edPCT_PROD_MER_EXTExit(Sender: TObject);
begin
  InterForma1.ValidaExit( edPCT_PROD_MER_EXT, True, '', True );
end;

procedure TWCrProveedor.edPCT_PROD_MER_INTExit(Sender: TObject);
begin
  InterForma1.ValidaExit( edPCT_PROD_MER_INT, True, '', True );
end;
{/LOLS}



procedure TWCrProveedor.edNOM_CONTACTOExit(Sender: TObject);
begin
  InterForma1.ValidaExit( edNOM_CONTACTO, True, '', True );
end;

procedure TWCrProveedor.edCVE_FND_ENT_DESExit(Sender: TObject);
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
      end;
      InterForma1.ValidaExit(edCVE_FND_ENT_DES,VLSalida,VLMesg,True);
   end; //end if
end;

procedure TWCrProveedor.btnCVE_FND_ENT_DESClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRPROVEED_ENTD',True,True) then
   begin
     Objeto.MInstDesc.ShowAll := True;
     If Objeto.MInstDesc.Busca Then
        InterForma1.NextTab(edCVE_FND_ENT_DES);
   end;
end;

procedure TWCrProveedor.btnCVE_FND_ENT_DESExit(Sender: TObject);
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
      end;
      InterForma1.ValidaExit(edCVE_FND_ENT_DES,VLSalida,VLMesg,True);
   end; //end if
end;

procedure TWCrProveedor.ilCVE_FND_ENT_DESCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrProveedor.ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
begin
   if Objeto.MInstDesc.FindKey([ilCVE_FND_ENT_DES.Buffer]) then
      InterForma1.NextTab(edCVE_FND_ENT_DES);
end;

procedure TWCrProveedor.ieIMP_LIM_ASIGNADOExit(Sender: TObject);
begin
     InterForma1.ValidaExit( ieIMP_LIM_ASIGNADO, True, '', True );
end;

procedure TWCrProveedor.InterForma1DespuesCancelar(Sender: TObject);
begin
    {ROIM 19/09/2007         AGREGA INDICADOR DE FACTORAJE ELECTRÓNICO}
     MuestraHints;
    {/ROIM}
end;

procedure TWCrProveedor.bbFactoElecClick(Sender: TObject);
VAR CrFeUsIn: TCrFeUsIn;
begin
  {ROIM 19/09/2007         AGREGA INDICADOR DE FACTORAJE ELECTRÓNICO}
   if objeto.Active then
   begin
       CrFeUsIn:= TCrFeUsIn.Create(self);
       try
          CrFeUsIn.Apli:=Objeto.Apli;     CrFeUsIn.ParamCre:=Objeto.ParamCre;
          CrFeUsIn.VLUsuarioCorpo := 'P'+Objeto.ID_ACREDITADO.AsString;
          CrFeUsIn.Catalogo;
       finally
              CrFeUsIn.Free;
       end;
       MuestraHints;
   end
   else
   begin
       ShowMessage('Debe seleccionar un Proveedor');
   end;
  {/ROIM}
end;

end.
