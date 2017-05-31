// Sistema         : Clase de ConSaldo
// Fecha de Inicio : 3/04/1998
// Función forma   : Clase de ConSaldo
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Martinez Castro
// Comentarios     : MARA4356 DIC 2006 SE AGREGA CAMPO DE SALDO BLOQUEADO POR AUTORIDAD IMP_COM_VIRT_AUD
Unit IntConsaldo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm, StdCtrls, Buttons, ExtCtrls, InterFor, Db, IntFind,
UnSQL2, InterFun, ComCtrls, InterEdit, DBTABLES;

Type
 TConSaldo= class;

  TWConsaldo=Class(TForm)
    InterForma1             : TInterForma;
    lbV_CONTRATO : TLabel;
    edV_CONTRATO : TEdit;
    lbV_ID_TITULAR : TLabel; 
    edV_ID_TITULAR : TEdit;
    lbV_NOM_TITULAR : TLabel; 
    edV_NOM_TITULAR : TEdit;
    lbV_SDO_BLOQ_DV : TLabel;
    lbV_SDO_COMP_DV : TLabel;
    lbV_SDO_DEUD_DV : TLabel;
    lbV_SDO_DNC_DV : TLabel;
    lbV_SDO_EFE_DV : TLabel;
    lbV_SDO_SBC_DV : TLabel;
    lbV_SDO_SOBGIR_DV : TLabel;
    lbRESP : TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    edLinSobregiro: TEdit;
    Bevel3: TBevel;
    Bevel5: TBevel;
    edV_SDO_SOBGIR_DV: TInterEdit;
    edV_SDO_EFE_DV: TInterEdit;
    edV_SDO_DNC_DV: TInterEdit;
    edV_SDO_SBC_DV: TInterEdit;
    edV_SDO_BLOQ_DV: TInterEdit;
    edV_SDO_COMP_DV: TInterEdit;
    edV_SDO_DEUD_DV: TInterEdit;
    edDisponible: TInterEdit;
    edContable: TInterEdit;
    Label3: TLabel;
    edSdoPendTarj: TInterEdit;
    edV_IMP_COM_VIRT_AUD: TInterEdit;
    Label4: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    private 
    { Private declarations }
    public 
    { Public declarations } 
    Objeto : TConSaldo;
end;
 TConSaldo= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        V_CONTRATO               : TInterCampo;
        V_B_OBT_DESC             : TInterCampo;
        V_B_OBT_SALDOS           : TInterCampo;
        V_B_VAL_PESOS            : TInterCampo;
        V_B_OBT_VAL_DIA          : TInterCampo;
        V_CVE_TIP_CTO            : TInterCampo;
        V_NOM_EMPRESA            : TInterCampo;
        V_ID_TITULAR             : TInterCampo;
        V_NOM_TITULAR            : TInterCampo;
        V_ID_PROMOTOR            : TInterCampo;
        V_NOM_PROMOTOR           : TInterCampo;
        V_NOM_CTO_REF            : TInterCampo;
        V_DESC_ENTIDAD           : TInterCampo;
        V_DESC_SEGMENTO          : TInterCampo;
        V_DESC_TIP_CTO           : TInterCampo;
        V_DESC_PRODUCTO          : TInterCampo;
        V_CAPITAL_INV            : TInterCampo;
        V_INTERES_INV            : TInterCampo;
        V_INTERES_HOY            : TInterCampo;
        V_DESC_MONEDA            : TInterCampo;
        V_DESC_GRUPO             : TInterCampo;
        V_TIPO_CAMBIO            : TInterCampo;
        V_CONTRATO_LIQ           : TInterCampo;
        V_CONTRATO_REF           : TInterCampo;
        V_SDO_BLOQ_DV            : TInterCampo;
        V_SDO_COMP_DV            : TInterCampo;
        V_SDO_DEUD_DV            : TInterCampo;
        V_SDO_DNC_DV             : TInterCampo;
        V_SDO_EFE_DV             : TInterCampo;
        V_SDO_REM_DV             : TInterCampo;
        V_SDO_SBC_DV             : TInterCampo;
        V_SDO_SOBGIR_DV          : TInterCampo;
        V_LIN_SOBGIRO            : TInterCampo;
        V_TIP_SOBGIRO            : TInterCampo;
        V_SIT_CONTRATO           : TInterCampo;
        V_IMP_COM_VIRT_AUD       : TInterCampo;//MARA4356 DIC 2006 SALDOS BLOQUEADOS POR AUTORIDAD
        RESP                     : TInterCampo;

        Disponible               : TInterCampo;
        Contable                 : TInterCampo;
        LinSobregiro             : TInterCampo;
        PendTarj                 : TInterCampo;//qutl4600 241004

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
        function    InternalLocaliza:Boolean; override;
        function    ObtSdoPendTarj(pe_idcontrato: string): double; // qutl4600
        function    ObtSdoBlqAut(pe_idcontrato: string): double; //MARA4356 DIC 2006 SALDOS BLOQUEADOS POR AUTORIDAD
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TConSaldo.Create( AOwner : TComponent );
begin Inherited;
      FPrefijo:='';
      V_CONTRATO :=CreaCampo('V_CONTRATO',ftInteger,tsConsulta,tsNinguno,False);
                  V_CONTRATO.Caption:='V Contrato ';
      V_B_OBT_DESC :=CreaCampo('V_B_OBT_DESC',ftString,tsConsulta,tsNinguno,False);
        V_B_OBT_DESC .Size:=0;
                V_B_OBT_DESC.Caption:='V  Obt Descripción ';
      V_B_OBT_SALDOS :=CreaCampo('V_B_OBT_SALDOS',ftString,tsConsulta,tsNinguno,False);
        V_B_OBT_SALDOS .Size:=0;
                V_B_OBT_SALDOS.Caption:='V  Obt Saldos ';
      V_B_VAL_PESOS :=CreaCampo('V_B_VAL_PESOS',ftString,tsConsulta,tsNinguno,False);
        V_B_VAL_PESOS .Size:=0;
                V_B_VAL_PESOS.Caption:='V  Val Pesos ';
      V_B_OBT_VAL_DIA :=CreaCampo('V_B_OBT_VAL_DIA',ftString,tsConsulta,tsNinguno,False);
        V_B_OBT_VAL_DIA .Size:=0;
                V_B_OBT_VAL_DIA.Caption:='V  Obt Val Dia ';
      V_CVE_TIP_CTO :=CreaCampo('V_CVE_TIP_CTO',ftString,tsNinguno,tsConsulta,False);
        V_CVE_TIP_CTO .Size:=4;
                V_CVE_TIP_CTO.Caption:='V Clave de Tip Cto ';
      V_NOM_EMPRESA :=CreaCampo('V_NOM_EMPRESA',ftString,tsNinguno,tsConsulta,False);
                V_NOM_EMPRESA.Caption:='V Nombre Empresa ';
      V_ID_TITULAR :=CreaCampo('V_ID_TITULAR',ftString,tsNinguno,tsConsulta,False);
                V_ID_TITULAR.Caption:='V Número de Titular ';
      V_NOM_TITULAR :=CreaCampo('V_NOM_TITULAR',ftString,tsNinguno,tsConsulta,False);
                V_NOM_TITULAR.Caption:='V Nombre Titular ';
      V_ID_PROMOTOR :=CreaCampo('V_ID_PROMOTOR',ftString,tsNinguno,tsConsulta,False);
                V_ID_PROMOTOR.Caption:='V Número de Promotor ';
      V_NOM_PROMOTOR :=CreaCampo('V_NOM_PROMOTOR',ftString,tsNinguno,tsConsulta,False);
                V_NOM_PROMOTOR.Caption:='V Nombre Promotor ';
      V_NOM_CTO_REF :=CreaCampo('V_NOM_CTO_REF',ftString,tsNinguno,tsConsulta,False);
                V_NOM_CTO_REF.Caption:='V Nombre Cto Ref ';
      V_DESC_ENTIDAD :=CreaCampo('V_DESC_ENTIDAD',ftString,tsNinguno,tsConsulta,False);
                V_DESC_ENTIDAD.Caption:='V Descripción Entidad ';
      V_DESC_SEGMENTO :=CreaCampo('V_DESC_SEGMENTO',ftString,tsNinguno,tsConsulta,False);
                V_DESC_SEGMENTO.Caption:='V Descripción Segmento ';
      V_DESC_TIP_CTO :=CreaCampo('V_DESC_TIP_CTO',ftString,tsNinguno,tsConsulta,False);
                V_DESC_TIP_CTO.Caption:='V Descripción Tip Cto ';
      V_DESC_PRODUCTO :=CreaCampo('V_DESC_PRODUCTO',ftString,tsNinguno,tsConsulta,False);
                V_DESC_PRODUCTO.Caption:='V Descripción Producto ';
      V_CAPITAL_INV :=CreaCampo('V_CAPITAL_INV',ftFloat,tsNinguno,tsConsulta,False);
                V_CAPITAL_INV.Caption:='V Capital Inv ';
      V_INTERES_INV :=CreaCampo('V_INTERES_INV',ftFloat,tsNinguno,tsConsulta,False);
                V_INTERES_INV.Caption:='V Interes Inv ';
      V_INTERES_HOY :=CreaCampo('V_INTERES_HOY',ftFloat,tsNinguno,tsConsulta,False);
                V_INTERES_HOY.Caption:='V Interes Hoy ';
      V_DESC_MONEDA :=CreaCampo('V_DESC_MONEDA',ftString,tsNinguno,tsConsulta,False);
                V_DESC_MONEDA.Caption:='V Descripción Moneda ';
      V_DESC_GRUPO :=CreaCampo('V_DESC_GRUPO',ftString,tsNinguno,tsConsulta,False);
                V_DESC_GRUPO.Caption:='V Descripción Grupo ';
      V_TIPO_CAMBIO :=CreaCampo('V_TIPO_CAMBIO',ftFloat,tsNinguno,tsConsulta,False);
                V_TIPO_CAMBIO.Caption:='V Tipo Cambio ';
      V_CONTRATO_LIQ :=CreaCampo('V_CONTRATO_LIQ',ftFloat,tsNinguno,tsConsulta,False);
                V_CONTRATO_LIQ.Caption:='V Contrato Liq ';
      V_CONTRATO_REF :=CreaCampo('V_CONTRATO_REF',ftFloat,tsNinguno,tsConsulta,False);
                V_CONTRATO_REF.Caption:='V Contrato Ref ';
      V_SDO_BLOQ_DV :=CreaCampo('V_SDO_BLOQ_DV',ftFloat,tsNinguno,tsConsulta,False);
                V_SDO_BLOQ_DV.Caption:='Bloqueado';
      V_SDO_COMP_DV :=CreaCampo('V_SDO_COMP_DV',ftFloat,tsNinguno,tsConsulta,False);
                V_SDO_COMP_DV.Caption:='Comprometido';
      V_SDO_DEUD_DV :=CreaCampo('V_SDO_DEUD_DV',ftFloat,tsNinguno,tsConsulta,False);
                V_SDO_DEUD_DV.Caption:='Deudor';
      V_SDO_DNC_DV :=CreaCampo('V_SDO_DNC_DV',ftFloat,tsNinguno,tsConsulta,False);
                V_SDO_DNC_DV.Caption:='Doctos. a N. Cargo';
      V_SDO_EFE_DV :=CreaCampo('V_SDO_EFE_DV',ftFloat,tsNinguno,tsConsulta,False);
                V_SDO_EFE_DV.Caption:='Efectivo Disponible';
      V_SDO_REM_DV :=CreaCampo('V_SDO_REM_DV',ftFloat,tsNinguno,tsConsulta,False);
                V_SDO_REM_DV.Caption:='V Sdo Rem Dv ';
      V_SDO_SBC_DV :=CreaCampo('V_SDO_SBC_DV',ftFloat,tsNinguno,tsConsulta,False);
                V_SDO_SBC_DV.Caption:='Salvo Buen Cobro';
      V_SDO_SOBGIR_DV :=CreaCampo('V_SDO_SOBGIR_DV',ftFloat,tsNinguno,tsConsulta,False);
                V_SDO_SOBGIR_DV.Caption:='Sobregirado';
      V_LIN_SOBGIRO :=CreaCampo('V_LIN_SOBGIRO',ftFloat,tsNinguno,tsConsulta,False);
                V_LIN_SOBGIRO.Caption:='V Lin Sobgiro ';
      V_TIP_SOBGIRO :=CreaCampo('V_TIP_SOBGIRO',ftString,tsNinguno,tsConsulta,False);
        V_TIP_SOBGIRO .Size:=2;
                V_TIP_SOBGIRO.Caption:='V Tip Sobgiro ';
      V_SIT_CONTRATO :=CreaCampo('V_SIT_CONTRATO',ftString,tsNinguno,tsConsulta,False);
        V_SIT_CONTRATO .Size:=2;
                V_SIT_CONTRATO.Caption:='V Situación Contrato ';
      RESP :=CreaCampo('RESP',ftInteger,tsNinguno,tsConsulta,False);
                RESP.Caption:='Resp ';

      Disponible:=CreaCampo('DISPONIBLE',ftFloat,tsNinguno,tsNinguno,False);
      Contable:=CreaCampo('CONTABLE',ftFloat,tsNinguno,tsNinguno,False);
      LinSobregiro:=CreaCampo('LIN_SOBREGIRO',ftString,tsNinguno,tsNinguno,False);
      PendTarj:=CreaCampo('PendTarj',ftFloat,tsNinguno,tsNinguno,False); //qutl4600 241004
      V_IMP_COM_VIRT_AUD :=CreaCampo('V_IMP_COM_VIRT_AUD',ftFloat,tsNinguno,tsNinguno,False);// MARA4356 DIC 2006 SE AGREGA CAMPO DE SALDO BLOQUEADO POR AUTORIDAD IMP_COM_VIRT_AUD
      FKeyFields.ADD('V_CONTRATO');
      FKeyFields.ADD('V_B_OBT_SALDOS');
      FKeyFields.ADD('V_B_OBT_DESC');
      FKeyFields.ADD('V_B_VAL_PESOS');
      FKeyFields.ADD('V_B_OBT_VAL_DIA');
      StpName:='STPTOCN2';
      FStpRespuesta:='RESP';
      HelpFile := 'IntConsaldo.Hlp';
      UseQuery := False;
      ShowMenuReporte:=True;
end;

Destructor TConSaldo.Destroy;
begin inherited;
end;


function TConSaldo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWConsaldo;
begin
   W:=TWConsaldo.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TConSaldo.InternalLocaliza:Boolean;
var
  vlSdoContable,
  vlSdoDisponible : Currency; // RUCJ4248
begin InternalLocaliza:=True;
      if Active then
      begin State:=0;

      if V_SDO_SOBGIR_DV.IsNull then V_SDO_SOBGIR_DV.AsFloat:=0;

{            Contable.AsFloat:=V_SDO_EFE_DV.AsFloat-V_SDO_DEUD_DV.AsFloat-V_SDO_BLOQ_DV.AsFloat-V_SDO_COMP_DV.AsFloat
                             +V_SDO_SBC_DV.AsFloat+V_LIN_SOBGIRO.AsFloat;}

{          Disponible.AsFloat:=V_SDO_EFE_DV.AsFloat-V_SDO_DEUD_DV.AsFloat-V_SDO_BLOQ_DV.AsFloat-V_SDO_COMP_DV.AsFloat
                             +V_SDO_SBC_DV.AsFloat+V_SDO_DNC_DV.AsFloat;}

{          Disponible.AsFloat:=V_SDO_EFE_DV.AsFloat - V_SDO_DEUD_DV.AsFloat;}

          // RUCJ4248
          vlSdoContable := V_SDO_EFE_DV.AsFloat-V_SDO_DEUD_DV.AsFloat-V_SDO_BLOQ_DV.AsFloat-V_SDO_COMP_DV.AsFloat
                             +V_SDO_SBC_DV.AsFloat+V_LIN_SOBGIRO.AsFloat;
          Contable.AsFloat := vlSdoContable;

          vlSdoDisponible := V_SDO_EFE_DV.AsFloat - V_SDO_DEUD_DV.AsFloat;
          Disponible.AsFloat := vlSdoDisponible;

          PendTarj.AsFloat:= ObtSdoPendTarj(V_CONTRATO.AsString);

          V_IMP_COM_VIRT_AUD.AsFloat:=ObtSdoBlqAut(V_CONTRATO.AsString); //MARA4356 DIC 2006 SALDOS BLOQUEADOS POR AUTORIDAD
        if Trim(V_TIP_SOBGIRO.AsString)='SL' then LinSobregiro.AsString:='Sin Limite'
   else if Trim(V_TIP_SOBGIRO.AsString)='LM' then LinSobregiro.AsString:='Limitado a '+ V_LIN_SOBGIRO.AsString
   else if Trim(V_TIP_SOBGIRO.AsString)='BL' then LinSobregiro.AsString:='Bloqueado'
   else LinSobregiro.AsString:='No Permitido';
      end
      else
      begin State:=0;
            Contable.IsNull:=True;
            Disponible.IsNull:=True;
            LinSobregiro.IsNull:=True;
            PendTarj.IsNull:=True; //qutl4600 241004
            V_IMP_COM_VIRT_AUD.IsNull:=True; //MARA4356 DIC 2006 SALDOS BLOQUEADOS POR AUTORIDAD
      end;
end;



Function TConSaldo.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      Exit;
      (*

      T := CreaBuscador('IConsald.it','');
      Try if Active then begin end;
          //if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
      *)
end;

function TConSaldo.Reporte:Boolean;
begin //Execute_Reporte();
end;

function TConSaldo.ObtSdoPendTarj(pe_idcontrato: string): double; // qutl4600
var STPObtenDatos: TStoredProc;
begin
    try
      STPObtenDatos:=TStoredProc.Create(Nil);
      STPObtenDatos.DatabaseName:=DataBaseName;
      STPObtenDatos.SessionName:=SessionName;
      STPObtenDatos.StoredProcName:='PKGSICIERRE.OBTSALDOMAESTRO';
      STPObtenDatos.Params.CreateParam(ftfloat,'pIdContrato', ptinput);
      STPObtenDatos.Params.CreateParam(ftFloat,'Result', ptResult);
      STPObtenDatos.Prepare;
      STPObtenDatos.ParamByName('pIdContrato').AsString  := pe_idcontrato;
      try
        STPObtenDatos.ExecProc;
        result:= STPObtenDatos.ParamByName('Result').AsFloat;
      except
        result:=0;
      end;
    finally STPObtenDatos.Free;
    end;
end;

function TConSaldo.ObtSdoBlqAut(pe_idcontrato: string): double; //MARA4356 DIC 2006 SALDOS BLOQUEADOS POR AUTORIDAD
var vlImporte:Real;
begin
  GetSQLFloat(' SELECT NVL(IMP_COM_VIRT_AUD,0) AS IMPORTE FROM DV_CONTRATO '+
              ' WHERE ID_CONTRATO = '+ pe_idcontrato,
              Apli.DataBaseName,Apli.SessionName, 'IMPORTE', vlImporte,False);
  Result:=vlImporte;
end;


(***********************************************FORMA ConSaldo********************)
(*                                                                              *)
(*  FORMA DE ConSaldo                                                            *)
(*                                                                              *)
(***********************************************FORMA ConSaldo********************)

procedure TWConsaldo.FormShow(Sender: TObject);
begin
      Objeto.V_CONTRATO.Control:=edV_CONTRATO;
      Objeto.V_ID_TITULAR.Control:=edV_ID_TITULAR;
      Objeto.V_NOM_TITULAR.Control:=edV_NOM_TITULAR;
      Objeto.V_SDO_BLOQ_DV.Control:=edV_SDO_BLOQ_DV;
      Objeto.V_SDO_COMP_DV.Control:=edV_SDO_COMP_DV;
      Objeto.V_SDO_DEUD_DV.Control:=edV_SDO_DEUD_DV;
      Objeto.V_SDO_DNC_DV.Control:=edV_SDO_DNC_DV;
      Objeto.V_SDO_EFE_DV.Control:=edV_SDO_EFE_DV;
      Objeto.V_SDO_SBC_DV.Control:=edV_SDO_SBC_DV;
      Objeto.V_SDO_SOBGIR_DV.Control:=edV_SDO_SOBGIR_DV;

      Objeto.Disponible.Control:=edDisponible;
      Objeto.Contable.Control:=edContable;
      Objeto.PendTarj.Control:=edSdoPendTarj; //qutl4600 241004
      Objeto.LinSobregiro.Control:=edLinSobregiro;

      Objeto.V_IMP_COM_VIRT_AUD.Control :=edV_IMP_COM_VIRT_AUD;// MARA4356 DIC 2006 SE AGREGA CAMPO DE SALDO BLOQUEADO POR AUTORIDAD IMP_COM_VIRT_AUD
end;

procedure TWConsaldo.FormDestroy(Sender: TObject);
begin
      Objeto.Disponible.Control:=nil;
      Objeto.Contable.Control:=nil;
      Objeto.LinSobregiro.Control:=nil;
      Objeto.PendTarj.Control:=nil; //qutl4600 241004

      Objeto.V_CONTRATO.Control:=nil;
      Objeto.V_ID_TITULAR.Control:=nil;
      Objeto.V_NOM_TITULAR.Control:=nil;
      Objeto.V_SDO_BLOQ_DV.Control:=nil;
      Objeto.V_SDO_COMP_DV.Control:=nil;
      Objeto.V_SDO_DEUD_DV.Control:=nil;
      Objeto.V_SDO_DNC_DV.Control:=nil;
      Objeto.V_SDO_EFE_DV.Control:=nil;
      Objeto.V_SDO_SBC_DV.Control:=nil;
      Objeto.V_SDO_SOBGIR_DV.Control:=nil;
      Objeto.V_IMP_COM_VIRT_AUD.Control :=nil;// MARA4356 DIC 2006 SE AGREGA CAMPO DE SALDO BLOQUEADO POR AUTORIDAD IMP_COM_VIRT_AUD

   //Objeto
end;

procedure TWConsaldo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWConsaldo.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWConsaldo.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWConsaldo.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


end.
