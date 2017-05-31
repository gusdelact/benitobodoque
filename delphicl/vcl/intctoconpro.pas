// Sistema         : Clase de CTO_CONFIG_PROD
// Fecha de Inicio : 22/11/2005
// Función forma   : Clase de CTO_CONFIG_PROD
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Jose Alberto Ramirez Pacheco
// Comentarios     : MARA4356 DIC 2006 PARA NUEVO PRODUCTO DE CHEQUES
Unit IntCtoConPro;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TCtoConPro= class; 

  TWCtoConfigProd=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_EMPRESA : TLabel; 
    edID_EMPRESA : TEdit;
    lbCVE_PRODUCTO : TLabel; 
    edCVE_PRODUCTO : TEdit;
    lbID_PERS_ASOCIAD : TLabel; 
    edID_PERS_ASOCIAD : TEdit;
    lbID_GRUPO : TLabel; 
    edID_GRUPO : TEdit;
    lbID_ENTIDAD : TLabel; 
    edID_ENTIDAD : TEdit;
    lbCVE_SEGMENTO : TLabel; 
    edCVE_SEGMENTO : TEdit;
    lbCVE_CONCEPTO : TLabel; 
    edCVE_CONCEPTO : TEdit;
    lbCVE_TIPO_CTA : TLabel; 
    edCVE_TIPO_CTA : TEdit;
    lbCVE_CORRESP : TLabel;
    edCVE_CORRESP : TEdit;
    lbSIT_CONTRATO : TLabel; 
    edSIT_CONTRATO : TEdit;
    lbTIPO_CAPTURA : TLabel;
    edTIPO_CAPTURA : TEdit;
    lbB_PROSPECTO : TLabel; 
    chB_PROSPECTO : TCheckBox;
    lbB_VAL_CTO_LIQ : TLabel; 
    chB_VAL_CTO_LIQ : TCheckBox;
    chB_VAL_EMPRESA : TCheckBox;
    lbB_VAL_REPETIDO : TLabel; 
    chB_VAL_REPETIDO : TCheckBox;
    chkBCtoLiq: TCheckBox;
    Label1: TLabel;
    edTipoProemio: TEdit;
    chkValPerJur: TCheckBox;
    chkBValidaKYC: TCheckBox;
    chB_SOBREGIRO: TCheckBox;
    chB_CTO_PRLV: TCheckBox;
    chB_CTO_FDOS: TCheckBox;
    chB_FANIVERSARIO: TCheckBox;
    chB_COMISION: TCheckBox;
    chB_VAL_PRE: TCheckBox;
    chB_VAL_SITUACION: TCheckBox;
    chB_GEN_INFO_INV: TCheckBox;        // SASG4921 13/07/2015
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCtoConPro;
end; 
 TCtoConPro= class(TInterFrame) 
      private 
      protected    
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        Id_Empresa: TInterCampo;
        Cve_Producto: TInterCampo;
        Id_Pers_Asociad: TInterCampo;
        Id_Grupo: TInterCampo;
        Id_Entidad: TInterCampo;
        Cve_Segmento: TInterCampo;
        Cve_Concepto: TInterCampo;
        Cve_Tipo_Cta: TInterCampo;
        Cve_Corresp: TInterCampo;
        Sit_Contrato: TInterCampo;
        Tipo_Captura: TInterCampo;
        Tipo_Proemio: TInterCampo;
        B_Prospecto: TInterCampo;
        B_Cto_Liq: TInterCampo;
        B_Val_Cto_Liq: TInterCampo;
        B_Val_Empresa: TInterCampo;
        B_Gen_Info_Inv: TInterCampo;    // SASG4921 13/07/2015
        B_Val_Repetido: TInterCampo;
        B_Val_Per_Jur: TInterCampo;
        B_Val_KYC: TInterCampo;
        //MARA4356 DIC 2006 PARA NUEVO PRODUCTO DE CHEQUES SE AGREGAN LOS SIGUIENTES CAMPOS
        B_SOBREGIRO    : TInterCampo;
        B_CTO_PRLV     : TInterCampo;
        B_CTO_FDOS     : TInterCampo;
        B_FANIVERSARIO : TInterCampo;
        B_COMISION     : TInterCampo;
        B_VAL_PRECALIFICA : TInterCampo;   // CZR 24-FEB-09   BANDERA DE PRECALIFICACION PARA EL PROSPECTO
        B_VAL_SITUACION   : TInterCampo;   // CZR 24-FEB-10   BANDERA DE VALIDACION DE SITUACION EN CONTRATO

        //MARA4356 DIC 2006 PARA NUEVO PRODUCTO DE CHEQUES HASTA AQUI SE AGREGARON CAMPOS
        Constructor Create( AOwner : TComponent ); override;
        Destructor  Destroy; override;
        Function    InternalBusca : Boolean; override;
        Function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Function    Reporte:Boolean; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}

Constructor TCtoConPro.Create( AOwner : TComponent );
begin
  Inherited;
  Id_Empresa:= CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,True);
    Id_Empresa.Caption:='Número de Empresa';
  Cve_Producto:= CreaCampo('CVE_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
    Cve_Producto.Caption:='Clave de Producto';
  Id_Pers_Asociad:= CreaCampo('ID_PERS_ASOCIAD',ftFloat,tsNinguno,tsNinguno,True);
    Id_Pers_Asociad.Caption:='Número de Persona Asociad';
  Id_Grupo:= CreaCampo('ID_GRUPO',ftFloat,tsNinguno,tsNinguno,True);
    Id_Grupo.Caption:='Número de Grupo';
  Id_Entidad:= CreaCampo('ID_ENTIDAD',ftFloat,tsNinguno,tsNinguno,True);
    Id_Entidad.Caption:='Número de Entidad';
  Cve_Segmento:= CreaCampo('CVE_SEGMENTO',ftString,tsNinguno,tsNinguno,True);
    Cve_Segmento.Caption:='Clave de Segmento';
  Cve_Concepto:= CreaCampo('CVE_CONCEPTO',ftString,tsNinguno,tsNinguno,True);
    Cve_Concepto.Caption:='Clave de Concepto';
  Cve_Tipo_Cta:= CreaCampo('CVE_TIPO_CTA',ftString,tsNinguno,tsNinguno,True);
    Cve_Tipo_Cta.Caption:='Clave de Tipo Cta';
  Cve_Corresp:= CreaCampo('CVE_CORRESP',ftString,tsNinguno,tsNinguno,True);
    Cve_Corresp.Caption:='Clave de Corresp';
  Sit_Contrato:= CreaCampo('SIT_CONTRATO',ftString,tsNinguno,tsNinguno,True);
    Sit_Contrato.Caption:='Situación Contrato';
  Tipo_Captura:= CreaCampo('TIPO_CAPTURA',ftString,tsNinguno,tsNinguno,True);
    Tipo_Captura.Caption:='Tipo Captura';
  Tipo_Proemio:= CreaCampo('TIPO_PROEMIO',ftString,tsNinguno,tsNinguno,True);
    Tipo_Proemio.Caption:='Tipo Proemio';
  B_Prospecto:= CreaCampo('B_PROSPECTO',ftString,tsNinguno,tsNinguno,True);
    B_Prospecto.Caption:='Prospecto';
  B_Cto_Liq:= CreaCampo('B_CTO_LIQ',ftString,tsNinguno,tsNinguno,True);
    B_Cto_Liq.Caption:='Es Contrato de Liquidacion';
  B_Val_Cto_Liq:= CreaCampo('B_VAL_CTO_LIQ',ftString,tsNinguno,tsNinguno,True);
    B_Val_Cto_Liq.Caption:='Requiere contrato de liquidacion';
  B_Val_Empresa:= CreaCampo('B_VAL_EMPRESA',ftString,tsNinguno,tsNinguno,True);
    B_Val_Empresa.Caption:='Val Empresa';
  B_Gen_Info_Inv:= CreaCampo('B_GEN_INFO_INV',ftString,tsNinguno,tsNinguno,True);       // SASG4921 13/07/2015
    B_Gen_Info_Inv.Caption:='Val Genera Información Invers';
  B_Val_Repetido:= CreaCampo('B_VAL_REPETIDO',ftString,tsNinguno,tsNinguno,True);
    B_Val_Repetido.Caption:='Val Repetido';
  B_Val_Per_Jur:= CreaCampo('B_VAL_PER_JUR',ftString,tsNinguno,tsNinguno,True);
    B_Val_Per_Jur.Caption:='Val Personalidad Juridica del Producto';
  B_Val_KYC:= CreaCampo('B_VAL_KYC', ftString, tsNinguno, tsNinguno, True);
    B_Val_KYC.Caption:='Val Información KYC';

  //MARA4356 DIC 2006 PARA NUEVO PRODUCTO DE CHEQUES SE AGREGAN LOS SIGUIENTES CAMPOS
  B_SOBREGIRO    := CreaCampo('B_SOBREGIRO',   ftString, tsNinguno, tsNinguno, True);
    B_SOBREGIRO.Caption:='Val Permiso de Sobregiro';
  B_CTO_PRLV     := CreaCampo('B_CTO_PRLV',    ftString, tsNinguno, tsNinguno, True);
    B_CTO_PRLV.Caption:='Req Contrato de PRLV';
  B_CTO_FDOS     := CreaCampo('B_CTO_FDOS',    ftString, tsNinguno, tsNinguno, True);
    B_CTO_FDOS.Caption:='Req Contrato de Fondos';
  B_FANIVERSARIO := CreaCampo('B_FANIVERSARIO',ftString, tsNinguno, tsNinguno, True);
    B_FANIVERSARIO.Caption:='Req Fecha de Aniv.';
  B_COMISION     := CreaCampo('B_COMISION',    ftString, tsNinguno, tsNinguno, True);
    B_COMISION.Caption:='Val Comision';

  B_VAL_PRECALIFICA := CreaCampo('B_VAL_PRECALIFICA', ftString, tsNinguno, tsNinguno, True);   // CZR 24-FEB-09
  B_VAL_SITUACION   := CreaCampo('B_VAL_SITUACION',   ftString, tsNinguno, tsNinguno, True);   // CZR 24-FEB-10

  //MARA4356 DIC 2006 PARA NUEVO PRODUCTO DE CHEQUES HASTA AQUI SE AGREGARON CAMPOS
  TableName := 'CTO_CONFIG_PROD';
  FKeyFields.Add('ID_EMPRESA');
  FKeyFields.Add('CVE_PRODUCTO');
  UseQuery := True;
  ShowMenuReporte:=True;
  //HelpFile := 'IntCtoConPro.Hlp';
end;

Destructor TCtoConPro.Destroy;
begin inherited;
end;


function TCtoConPro.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCtoConfigProd;
begin
  W:=TWCtoConfigProd.Create(Self);
  Try
    W.Objeto:= Self;
    W.InterForma1.InterFrame:= Self;
    W.InterForma1.FormaTipo := FormaTipo;
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  Finally
    W.Free;
  end;
end;


Function TCtoConPro.InternalBusca:Boolean;
Var T:TInterFindit;
begin
  InternalBusca := False;
  T:= CreaBuscador('ICtCoPr.it','F,S');
  Try
    if Active then
    begin
      T.Param(0,ID_EMPRESA.AsString);
      T.Param(1,CVE_PRODUCTO.AsString);
    end;

    if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
  Finally  T.Free;
  end;
end;

function TCtoConPro.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CTO_CONFIG_PROD********************)
(*                                                                              *)
(*  FORMA DE CTO_CONFIG_PROD                                                            *)
(*                                                                              *)
(***********************************************FORMA CTO_CONFIG_PROD********************)

procedure TWCtoConfigProd.FormShow(Sender: TObject);
begin
  With Objeto do
  Begin
    Id_Empresa.Control:=edID_EMPRESA;
    Cve_Producto.Control:=edCVE_PRODUCTO;
    Id_Pers_Asociad.Control:=edID_PERS_ASOCIAD;
    Id_Grupo.Control:=edID_GRUPO;
    Id_Entidad.Control:=edID_ENTIDAD;
    Cve_Segmento.Control:=edCVE_SEGMENTO;
    Cve_Concepto.Control:=edCVE_CONCEPTO;
    Cve_Tipo_Cta.Control:=edCVE_TIPO_CTA;
    Cve_Corresp.Control:=edCVE_CORRESP;
    Sit_Contrato.Control:=edSIT_CONTRATO;
    Tipo_Captura.Control:=edTIPO_CAPTURA;
    Tipo_Proemio.Control:= edTipoProemio;
    B_Prospecto.Control:=chB_PROSPECTO;
    B_Cto_Liq.Control:= chkBCtoLiq;
    B_Val_Cto_Liq.Control:=chB_VAL_CTO_LIQ;
    B_Val_Empresa.Control:=chB_VAL_EMPRESA;
    B_Gen_Info_Inv.Control:=chB_GEN_INFO_INV;      // SASG4921 13/07/2015
    B_Val_Repetido.Control:=chB_VAL_REPETIDO;
    B_Val_Per_Jur.Control:= chkValPerJur;
    B_VAL_KYC.Control:= chkBValidaKYC;
    //MARA4356 DIC 2006 PARA NUEVO PRODUCTO DE CHEQUES SE AGREGAN LOS SIGUIENTES CAMPOS
    B_SOBREGIRO.Control    := chB_SOBREGIRO;
    B_CTO_PRLV.Control     := chB_CTO_PRLV;
    B_CTO_FDOS.Control     := chB_CTO_FDOS;
    B_FANIVERSARIO.Control := chB_FANIVERSARIO;
    B_COMISION.Control     := chB_COMISION;
    B_VAL_PRECALIFICA.Control := chB_VAL_PRE;         // CZR 24-FEB-09
    B_VAL_SITUACION.Control   := chB_VAL_SITUACION;   // CZR 24-FEB-10

    //MARA4356 DIC 2006 PARA NUEVO PRODUCTO DE CHEQUES HASTA AQUI SE AGREGARON CAMPOS
  end;
end;

procedure TWCtoConfigProd.FormDestroy(Sender: TObject);
begin
  With Objeto do
  Begin
    Id_Empresa.Control:= nil;
    Cve_Producto.Control:= nil;
    Id_Pers_Asociad.Control:= nil;
    Id_Grupo.Control:= nil;
    Id_Entidad.Control:= nil;
    Cve_Segmento.Control:= nil;
    Cve_Concepto.Control:= nil;
    Cve_Tipo_Cta.Control:= nil;
    Cve_Corresp.Control:= nil;
    Sit_Contrato.Control:= nil;
    Tipo_Captura.Control:= nil;
    Tipo_Proemio.Control:= nil;
    B_Prospecto.Control:= nil;
    B_Cto_Liq.Control:= nil;
    B_Val_Cto_Liq.Control:= nil;
    B_Val_Empresa.Control:= nil;
    B_Gen_Info_Inv.Control:= nil;     // SASG4921 13/07/2015 
    B_Val_Repetido.Control:= nil;
    B_Val_Per_Jur.Control:= nil;
    B_VAL_KYC.Control:= nil;
    //MARA4356 DIC 2006 PARA NUEVO PRODUCTO DE CHEQUES SE AGREGAN LOS SIGUIENTES CAMPOS
    B_SOBREGIRO.Control    := nil;
    B_CTO_PRLV.Control     := nil;
    B_CTO_FDOS.Control     := nil;
    B_FANIVERSARIO.Control := nil;
    B_COMISION.Control     := nil;
    B_VAL_PRECALIFICA.Control := nil;   // CZR 24-FEB-09
    B_VAL_SITUACION.Control   := nil;   // CZR 24-FEB-10
    //MARA4356 DIC 2006 PARA NUEVO PRODUCTO DE CHEQUES HASTA AQUI SE AGREGARON CAMPOS
  end;
end;

procedure TWCtoConfigProd.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

end.
