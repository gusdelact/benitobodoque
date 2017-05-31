// Sistema         : Clase de CR_TRANSACCION
// Fecha de Inicio : 03/06/2003
// Función forma   : Clase de CR_TRANSACCION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrTransac;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

//Unidades Adicionales
IntParamCre, IntCrOperaci, IntCtto, IntCrCatComi, IntCrAplSal, IntCrCredito;

Type
 TCrTransac= class;

  TWCrTransaccion=Class(TForm)
    InterForma1             : TInterForma;
    lbID_TRANSACCION : TLabel;
    edID_TRANSACCION : TEdit;
    lbID_GRUPO_TRANSAC : TLabel;
    edID_GRUPO_TRANSAC : TEdit;
    lbCVE_OPERACION : TLabel;
    edCVE_OPERACION : TEdit;
    lbID_CONTRATO : TLabel;
    edID_CONTRATO : TEdit;
    lbID_CREDITO : TLabel;
    edID_CREDITO : TEdit;
    lbID_PERIODO : TLabel;
    edID_PERIODO : TEdit;
    lbID_CESION : TLabel;
    edID_CESION : TEdit;
    lbID_DOCUMENTO : TLabel;
    edID_DOCUMENTO : TEdit;
    lbCVE_COMISION : TLabel;
    edCVE_COMISION : TEdit;
    lbIMP_NETO : TLabel;
    edIMP_NETO : TEdit;
    lbID_CTO_LIQ : TLabel;
    edID_CTO_LIQ : TEdit;
    lbID_COD_RESP : TLabel;
    edID_COD_RESP : TEdit;
    lbTX_NOTA : TLabel;
    edTX_NOTA : TEdit;
    lbTIPO_CAMBIO : TLabel;
    edTIPO_CAMBIO : TEdit;
    lbCVE_TIPO_MOVTO : TLabel;
    edCVE_TIPO_MOVTO : TEdit;
    lbCVE_APLIC_SALDO : TLabel;
    edCVE_APLIC_SALDO : TEdit;
    lbCVE_USU_ALTA : TLabel;
    edCVE_USU_ALTA : TEdit;
    lbFH_ALTA : TLabel;
    edFH_ALTA : TEdit;
    lbCVE_USU_CANC : TLabel;
    edCVE_USU_CANC : TEdit;
    lbFH_CANCELA : TLabel;
    edFH_CANCELA : TEdit;
    edDESC_OPERACION: TEdit;
    edDESC_CREDITO: TEdit;
    gbFechas: TGroupBox;
    lbF_VALOR: TLabel;
    edF_VALOR: TEdit;
    lbF_PROG_PAGO: TLabel;
    edF_PROG_PAGO: TEdit;
    lbF_OPERACION: TLabel;
    edF_OPERACION: TEdit;
    edDESC_COMISION: TEdit;
    edDESC_CONTRATO: TEdit;
    edDESC_APLIC_SALDO: TEdit;
    edDESC_CTO_LIQ: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lbSIT_TRANSACCION: TLabel;
    edSIT_TRANSACCION: TComboBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrTransac;
end;
 TCrTransac= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_TRANSACCION           : TInterCampo;
        ID_GRUPO_TRANSAC         : TInterCampo;
        CVE_OPERACION            : TInterCampo;
        ID_CONTRATO              : TInterCampo;
        ID_CREDITO               : TInterCampo;
        ID_PERIODO               : TInterCampo;
        ID_CESION                : TInterCampo;
        ID_DOCUMENTO             : TInterCampo;
        CVE_COMISION             : TInterCampo;
        IMP_NETO                 : TInterCampo;
        ID_CTO_LIQ               : TInterCampo;
        F_OPERACION              : TInterCampo;
        F_VALOR                  : TInterCampo;
        F_PROG_PAGO            : TInterCampo;
        ID_COD_RESP              : TInterCampo;
        TX_NOTA                  : TInterCampo;
        TIPO_CAMBIO              : TInterCampo;
        CVE_TIPO_MOVTO           : TInterCampo;
        CVE_APLIC_SALDO          : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        FH_ALTA                  : TInterCampo;
        CVE_USU_CANC             : TInterCampo;
        FH_CANCELA               : TInterCampo;
        SIT_TRANSACCION          : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Operacion                : TCrOperaci;
        Contrato                 : TContrato;
        Credito                  : TCrCredito;
        Comision                 : TCrCatComi;
        Cto_Liq                  : TContrato;
        AplicaSaldo              : TCrAplSal;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation

{$R *.DFM}


constructor TCrTransac.Create( AOwner : TComponent );
begin Inherited;
      ID_TRANSACCION :=CreaCampo('ID_TRANSACCION',ftFloat,tsNinguno,tsNinguno,True);
                ID_TRANSACCION.Caption:='No. Transaccion';
      ID_GRUPO_TRANSAC :=CreaCampo('ID_GRUPO_TRANSAC',ftFloat,tsNinguno,tsNinguno,True);
                ID_GRUPO_TRANSAC.Caption:='Grupo Transaccion';
      CVE_OPERACION :=CreaCampo('CVE_OPERACION',ftString,tsNinguno,tsNinguno,True);
                CVE_OPERACION.Caption:='Clave Operación';
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO.Caption:='Contrato';
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Disposición';
      ID_PERIODO :=CreaCampo('ID_PERIODO',ftFloat,tsNinguno,tsNinguno,True);
                ID_PERIODO.Caption:='Periodo';
      ID_CESION :=CreaCampo('ID_CESION',ftFloat,tsNinguno,tsNinguno,True);
                ID_CESION.Caption:='Cesión';
      ID_DOCUMENTO :=CreaCampo('ID_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
                ID_DOCUMENTO.Caption:='Documento';
      CVE_COMISION :=CreaCampo('CVE_COMISION',ftString,tsNinguno,tsNinguno,True);
                CVE_COMISION.Caption:='Comisión';
      IMP_NETO :=CreaCampo('IMP_NETO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_NETO.Caption:='Importe Neto';
      ID_CTO_LIQ :=CreaCampo('ID_CTO_LIQ',ftFloat,tsNinguno,tsNinguno,True);
                ID_CTO_LIQ.Caption:='Número de Cto Liq';
      F_OPERACION :=CreaCampo('F_OPERACION',ftDate,tsNinguno,tsNinguno,True);
                F_OPERACION.Caption:='Fecha Operacion';
      F_VALOR :=CreaCampo('F_VALOR',ftDate,tsNinguno,tsNinguno,True);
                F_VALOR.Caption:='Fecha Valor';
      F_PROG_PAGO :=CreaCampo('F_PROG_PAGO',ftDate,tsNinguno,tsNinguno,True);
                F_PROG_PAGO.Caption:='Fecha Programada de pago';
      ID_COD_RESP :=CreaCampo('ID_COD_RESP',ftFloat,tsNinguno,tsNinguno,True);
                ID_COD_RESP.Caption:='Codigo Resp';
      TX_NOTA :=CreaCampo('TX_NOTA',ftString,tsNinguno,tsNinguno,True);
                TX_NOTA.Caption:='Nota';
      TIPO_CAMBIO :=CreaCampo('TIPO_CAMBIO',ftFloat,tsNinguno,tsNinguno,True);
                TIPO_CAMBIO.Caption:='Tipo Cambio';
      CVE_TIPO_MOVTO :=CreaCampo('CVE_TIPO_MOVTO',ftString,tsNinguno,tsNinguno,True);
                CVE_TIPO_MOVTO.Caption:='Clave Tipo Movimiento';
      CVE_APLIC_SALDO :=CreaCampo('CVE_APLIC_SALDO',ftString,tsNinguno,tsNinguno,True);
                CVE_APLIC_SALDO.Caption:='Clave Aplica Saldo';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Usuario Alta';
      FH_ALTA :=CreaCampo('FH_ALTA',ftDate,tsNinguno,tsNinguno,True);
                FH_ALTA.Caption:='Fecha Alta';
      CVE_USU_CANC :=CreaCampo('CVE_USU_CANC',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_CANC.Caption:='Usuario Cancela';
      FH_CANCELA :=CreaCampo('FH_CANCELA',ftDate,tsNinguno,tsNinguno,True);
                FH_CANCELA.Caption:='Fecha Cancela';
      SIT_TRANSACCION :=CreaCampo('SIT_TRANSACCION',ftString,tsNinguno,tsNinguno,True);
         With   SIT_TRANSACCION do
         Begin  size := 2;
                UseCombo := True;
                ComboLista.Add('NO PROCESADO'); ComboDatos.Add('NP');
                ComboLista.Add('ACTIVO');       ComboDatos.Add('AC');
                ComboLista.Add('CANCELADO');    ComboDatos.Add('CA');
                ComboLista.Add('NO VALIDO');    ComboDatos.Add('NV');
         end;
                SIT_TRANSACCION.Caption:='Situación Transaccion';
      FKeyFields.Add('ID_TRANSACCION');

      TableName := 'CR_TRANSACCION';
      UseQuery := True;
      HelpFile := 'IntCrTransac.Hlp';
      ShowMenuReporte:=True;

      Operacion := TCrOperaci.Create(self);
      Operacion.MasterSource := self;
      Operacion.FieldByName('CVE_OPERACION').MasterField := 'CVE_OPERACION';

      Contrato := TContrato.Create(self);
      Contrato.MasterSource := self;
      Contrato.FieldByName('ID_CONTRATO').MasterField := 'ID_CONTRATO';

      Credito := TCrCredito.Create(self);
      Credito.MasterSource := self;
      Credito.FieldByName('ID_CREDITO').MasterField := 'ID_CREDITO';

      Comision := TCrCatComi.Create(self);
      Comision.MasterSource := self;
      Comision.FieldByName('CVE_COMISION').MasterField := 'CVE_COMISION';

      Cto_Liq := TContrato.Create(self);
      Cto_Liq.MasterSource := self;
      Cto_Liq.FieldByName('ID_CONTRATO').MasterField := 'ID_CONTRATO';

      AplicaSaldo := TCrAplSal.Create(self);
      AplicaSaldo.MasterSource := self;
      AplicaSaldo.FieldByName('CVE_APLIC_SALDO').MasterField := 'CVE_APLIC_SALDO';

end;

Destructor TCrTransac.Destroy;
begin
      if Operacion <> nil then
         Operacion.Free;
      // end if

      if Contrato <> nil then
         Contrato.Free;
      // end if

      if Comision <> nil then
         Comision.Free;
      // end if

      if Cto_Liq <> nil then
         Cto_Liq.Free;
      // end if

      if AplicaSaldo <> nil then
         AplicaSaldo.Free;
      // end if

      IF Credito <> nil then
         Credito.Free;
      //end if
     inherited;
end;


function TCrTransac.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrTransaccion;
begin
   W:=TWCrTransaccion.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta;// FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrTransac.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrTrans.it','F');
      Try if Active then begin T.Param(0,ID_TRANSACCION.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_TRANSACCION********************)
(*                                                                              *)
(*  FORMA DE CR_TRANSACCION                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_TRANSACCION********************)

procedure TWCrTransaccion.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_TRANSACCION.Control:=edID_TRANSACCION;
      Objeto.ID_GRUPO_TRANSAC.Control:=edID_GRUPO_TRANSAC;
      Objeto.CVE_OPERACION.Control:=edCVE_OPERACION;
      Objeto.ID_CONTRATO.Control:=edID_CONTRATO;
      Objeto.ID_CREDITO.Control:=edID_CREDITO;
      Objeto.ID_PERIODO.Control:=edID_PERIODO;
      Objeto.ID_CESION.Control:=edID_CESION;
      Objeto.ID_DOCUMENTO.Control:=edID_DOCUMENTO;
      Objeto.CVE_COMISION.Control:=edCVE_COMISION;
      Objeto.IMP_NETO.Control:=edIMP_NETO;
      Objeto.ID_CTO_LIQ.Control:=edID_CTO_LIQ;
      Objeto.F_OPERACION.Control:=edF_OPERACION;
      Objeto.F_VALOR.Control:=edF_VALOR;
      Objeto.F_PROG_PAGO.Control:=edF_PROG_PAGO;
      Objeto.ID_COD_RESP.Control:=edID_COD_RESP;
      Objeto.TX_NOTA.Control:=edTX_NOTA;
      Objeto.TIPO_CAMBIO.Control:=edTIPO_CAMBIO;
      Objeto.CVE_TIPO_MOVTO.Control:=edCVE_TIPO_MOVTO;
      Objeto.CVE_APLIC_SALDO.Control:=edCVE_APLIC_SALDO;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.FH_ALTA.Control:=edFH_ALTA;
      Objeto.CVE_USU_CANC.Control:=edCVE_USU_CANC;
      Objeto.FH_CANCELA.Control:=edFH_CANCELA;
      Objeto.SIT_TRANSACCION.Control:=edSIT_TRANSACCION;

      Objeto.Operacion.DESC_C_OPERACION.Control := edDESC_OPERACION;
      Objeto.Operacion.GetParams(Objeto);

      Objeto.Contrato.Titular.Nombre.Control := edDESC_CONTRATO;
      Objeto.Contrato.GetParams(Objeto);

      Objeto.Comision.DESC_COMISION.Control := edDESC_COMISION;
      Objeto.Comision.GetParams(Objeto);

      Objeto.Cto_Liq.Titular.Nombre.Control := edDESC_CTO_LIQ;
      Objeto.Cto_Liq.GetParams(Objeto);

      Objeto.AplicaSaldo.DESC_L_APLIC_SDO.Control := edDESC_APLIC_SALDO;
      Objeto.AplicaSaldo.GetParams(Objeto);

      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edDESC_CREDITO;
      Objeto.Credito.GetParams(Objeto);

end;

procedure TWCrTransaccion.FormDestroy(Sender: TObject);
begin
      Objeto.ID_TRANSACCION.Control:=nil;
      Objeto.ID_GRUPO_TRANSAC.Control:=nil;
      Objeto.CVE_OPERACION.Control:=nil;
      Objeto.ID_CONTRATO.Control:=nil;
      Objeto.ID_CREDITO.Control:=nil;
      Objeto.ID_PERIODO.Control:=nil;
      Objeto.ID_CESION.Control:=nil;
      Objeto.ID_DOCUMENTO.Control:=nil;
      Objeto.CVE_COMISION.Control:=nil;
      Objeto.IMP_NETO.Control:=nil;
      Objeto.ID_CTO_LIQ.Control:=nil;
      Objeto.F_OPERACION.Control:=nil;
      Objeto.F_VALOR.Control:=nil;
      Objeto.F_PROG_PAGO.Control:=nil;
      Objeto.ID_COD_RESP.Control:=nil;
      Objeto.TX_NOTA.Control:=nil;
      Objeto.TIPO_CAMBIO.Control:=nil;
      Objeto.CVE_TIPO_MOVTO.Control:=nil;
      Objeto.CVE_APLIC_SALDO.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.FH_ALTA.Control:=nil;
      Objeto.CVE_USU_CANC.Control:=nil;
      Objeto.FH_CANCELA.Control:=nil;
      Objeto.SIT_TRANSACCION.Control:=nil;

      Objeto.Operacion.DESC_C_OPERACION.Control := nil;
      Objeto.Contrato.Titular.Nombre.Control := nil;
      Objeto.Comision.DESC_COMISION.Control := nil;
      Objeto.Cto_Liq.Titular.Nombre.Control := nil;
      Objeto.AplicaSaldo.DESC_L_APLIC_SDO.Control := nil;

   //Objeto
end;

procedure TWCrTransaccion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrTransaccion.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrTransaccion.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;


Procedure TWCrTransaccion.MuestraHints;
Begin
      edDESC_OPERACION.Hint := Objeto.Operacion.DESC_C_OPERACION.AsString;
      edDESC_OPERACION.ShowHint := True;
      edDESC_CONTRATO.Hint := Objeto.Contrato.Titular.Nombre.AsString;
      edDESC_CONTRATO.ShowHint := True;
      edDESC_CREDITO.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
      edDESC_CREDITO.ShowHint := True;
      edDESC_CTO_LIQ.Hint := Objeto.Cto_Liq.Titular.Nombre.AsString;
      edDESC_CTO_LIQ.ShowHint := True;
      edDESC_COMISION.Hint := Objeto.Comision.DESC_COMISION.AsString;
      edDESC_COMISION.ShowHint := True;
      edDESC_APLIC_SALDO.Hint := Objeto.AplicaSaldo.DESC_L_APLIC_SDO.AsString;
      edDESC_APLIC_SALDO.ShowHint := True;
      edTX_NOTA.Hint := Objeto.TX_NOTA.AsString;
      edTX_NOTA.ShowHint := True;
End;
procedure TWCrTransaccion.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrTransaccion.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraHints;
end;

end.
