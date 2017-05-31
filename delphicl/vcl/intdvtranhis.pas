// Sistema         : Clase de DV_TRANSACCION
// Fecha de Inicio : 14/05/1998
// Función forma   : Clase de DV_TRANSACCION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Raul Antonio Paredes Solis
// Comentarios     : Format Catalogo de DV_TRANSACCION ADAPTADO A HDV_TRANSACCION {CAPM}// VDVT0711 
Unit IntDvTranHis;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,IntDvOperaci,
UnValDvTrans, {CAPM}// VDVT0711
IntCtrlInt; //new;

Type
 TDvTranHis= class;

  TWDvTransHist=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_TRANSACCION : TLabel; 
    edID_TRANSACCION : TEdit;
    lbCVE_CONTABLE : TLabel; 
    edCVE_CONTABLE : TEdit;
    lbCVE_DOCTO : TLabel; 
    edCVE_DOCTO : TEdit;
    lbCVE_MEDIO : TLabel; 
    edCVE_MEDIO : TEdit;
    lbCVE_OPERACION : TLabel; 
    edCVE_OPERACION : TEdit;
    lbCVE_OPE_ORIGEN : TLabel; 
    edCVE_OPE_ORIGEN : TEdit;
    lbCVE_USUARIO : TLabel; 
    edCVE_USUARIO : TEdit;
    lbFH_OPERACION : TLabel; 
    dtpFH_OPERACION : TInterDateTimePicker; 
    edFH_OPERACION : TEdit;
    lbFH_REGISTRO : TLabel; 
    dtpFH_REGISTRO : TInterDateTimePicker; 
    edFH_REGISTRO : TEdit;
    lbF_LIQUIDACION : TLabel; 
    dtpF_LIQUIDACION : TInterDateTimePicker; 
    edF_LIQUIDACION : TEdit;
    lbF_LOTE : TLabel; 
    dtpF_LOTE : TInterDateTimePicker; 
    edF_LOTE : TEdit;
    lbID_COD_RESP : TLabel; 
    edID_COD_RESP : TEdit;
    lbID_CONTRATO : TLabel; 
    edID_CONTRATO : TEdit;
    lbID_GPO_TRANS : TLabel; 
    edID_GPO_TRANS : TEdit;
    lbID_TRANS_ORIGEN : TLabel; 
    edID_TRANS_ORIGEN : TEdit;
    lbIMP_TRANS : TLabel; 
    edIMP_TRANS : TEdit;
    lbNUM_CHEQUE : TLabel; 
    edNUM_CHEQUE : TEdit;
    lbNUM_LOTE : TLabel; 
    edNUM_LOTE : TEdit;
    lbNUM_TRANS_DET : TLabel; 
    edNUM_TRANS_DET : TEdit;
    lbSDO_DISPONIBLE : TLabel; 
    edSDO_DISPONIBLE : TEdit;
    lbSDO_BLOQ_VIRT : TLabel; 
    edSDO_BLOQ_VIRT : TEdit;
    lbSDO_COMP_VIRT : TLabel; 
    edSDO_COMP_VIRT : TEdit;
    lbSDO_DEUD_VIRT : TLabel; 
    edSDO_DEUD_VIRT : TEdit;
    lbSDO_DNC_VIRT : TLabel; 
    edSDO_DNC_VIRT : TEdit;
    lbSDO_EFE_VIRT : TLabel; 
    edSDO_EFE_VIRT : TEdit;
    lbSDO_PROM_VIRT : TLabel; 
    edSDO_PROM_VIRT : TEdit;
    lbSDO_REM_VIRT : TLabel; 
    edSDO_REM_VIRT : TEdit;
    lbSDO_SBC_VIRT : TLabel; 
    edSDO_SBC_VIRT : TEdit;
    lbSIT_TRANS : TLabel; 
    edSIT_TRANS : TEdit;
    lbTX_COMENTARIO : TLabel; 
    lbTX_REFERENCIA : TLabel; 
    lbID_ENTIDAD : TLabel; 
    edID_ENTIDAD : TEdit;
    lbSIT_CONCILIA : TLabel; 
    edSIT_CONCILIA : TEdit;
    lbF_PAGADO : TLabel; 
    dtpF_PAGADO : TInterDateTimePicker; 
    edF_PAGADO : TEdit;
    lbTX_INF_FISCAL : TLabel;
    lbSIT_SBC : TLabel; 
    edSIT_SBC : TEdit;
    lbCVE_CONC_LIDE : TLabel; 
    edCVE_CONC_LIDE : TEdit;
    lbID_CONCILIA_LIDE : TLabel; 
    edID_CONCILIA_LIDE : TEdit;
    lbTIPO_CAMBIO : TLabel; 
    edTIPO_CAMBIO : TEdit;
    lbCVE_MONEDA : TLabel; 
    edCVE_MONEDA : TEdit;
    Button1: TSpeedButton;
    edTX_REFERENCIA: TMemo;
    edTX_INF_FISCAL: TMemo;
    edTX_COMENTARIO: TMemo;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);  
    procedure Button1Click(Sender: TObject);
    function fUsrInfDpVista : Boolean;
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TDvTranHis;
end; 
 TDvTranHis= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ID_TRANSACCION           : TInterCampo;
        CVE_CONTABLE             : TInterCampo;
        CVE_DOCTO                : TInterCampo;
        CVE_MEDIO                : TInterCampo;
        CVE_OPERACION            : TInterCampo;
        CVE_OPE_ORIGEN           : TInterCampo;
        CVE_USUARIO              : TInterCampo;
        FH_OPERACION             : TInterCampo;
        FH_REGISTRO              : TInterCampo;
        F_LIQUIDACION            : TInterCampo;
        F_LOTE                   : TInterCampo;
        ID_COD_RESP              : TInterCampo;
        ID_CONTRATO              : TInterCampo;
        ID_GPO_TRANS             : TInterCampo;
        ID_TRANS_ORIGEN          : TInterCampo;
        IMP_TRANS                : TInterCampo;
        NUM_CHEQUE               : TInterCampo;
        NUM_LOTE                 : TInterCampo;
        NUM_TRANS_DET            : TInterCampo;
        SDO_DISPONIBLE           : TInterCampo;
        SDO_BLOQ_VIRT            : TInterCampo;
        SDO_COMP_VIRT            : TInterCampo;
        SDO_DEUD_VIRT            : TInterCampo;
        SDO_DNC_VIRT             : TInterCampo;
        SDO_EFE_VIRT             : TInterCampo;
        SDO_PROM_VIRT            : TInterCampo;
        SDO_REM_VIRT             : TInterCampo;
        SDO_SBC_VIRT             : TInterCampo;
        SIT_TRANS                : TInterCampo;
        TX_COMENTARIO            : TInterCampo;
        TX_REFERENCIA            : TInterCampo;
        ID_ENTIDAD               : TInterCampo;
        SIT_CONCILIA             : TInterCampo;
        F_PAGADO                 : TInterCampo;
        TX_INF_FISCAL            : TInterCampo;
        SIT_SBC                  : TInterCampo;
        CVE_CONC_LIDE            : TInterCampo;
        ID_CONCILIA_LIDE         : TInterCampo;
        TIPO_CAMBIO              : TInterCampo;
        CVE_MONEDA               : TInterCampo;

        DVOper                   : TDvOperaci;

        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override; 
      published 
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TDvTranHis.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_TRANSACCION :=CreaCampo('ID_TRANSACCION',ftFloat,tsNinguno,tsNinguno,True);
                ID_TRANSACCION.Caption:='Número de Transaccion';
      CVE_CONTABLE :=CreaCampo('CVE_CONTABLE',ftString,tsNinguno,tsNinguno,True);
        CVE_CONTABLE .Size:=10;
                CVE_CONTABLE.Caption:='Clave de Contable';
      CVE_DOCTO :=CreaCampo('CVE_DOCTO',ftString,tsNinguno,tsNinguno,True);
                CVE_DOCTO.Caption:='Clave de Docto';
      CVE_MEDIO :=CreaCampo('CVE_MEDIO',ftString,tsNinguno,tsNinguno,True);
                CVE_MEDIO.Caption:='Clave de Medio';
      CVE_OPERACION :=CreaCampo('CVE_OPERACION',ftString,tsNinguno,tsNinguno,True);
        CVE_OPERACION .Size:=6;
                CVE_OPERACION.Caption:='Clave de Operacion';
      CVE_OPE_ORIGEN :=CreaCampo('CVE_OPE_ORIGEN',ftString,tsNinguno,tsNinguno,True);
                CVE_OPE_ORIGEN.Caption:='Clave de Ope Origen';
      CVE_USUARIO :=CreaCampo('CVE_USUARIO',ftString,tsNinguno,tsNinguno,True);
        CVE_USUARIO .Size:=8;
                CVE_USUARIO.Caption:='Clave de Usuario';
      FH_OPERACION :=CreaCampo('FH_OPERACION',ftDate,tsNinguno,tsNinguno,True);
                FH_OPERACION.Caption:='Fecha y Hora Operacion';
      FH_REGISTRO :=CreaCampo('FH_REGISTRO',ftDate,tsNinguno,tsNinguno,True);
                FH_REGISTRO.Caption:='Fecha y Hora Registro';
      F_LIQUIDACION :=CreaCampo('F_LIQUIDACION',ftDate,tsNinguno,tsNinguno,True);
                F_LIQUIDACION.Caption:='Fecha Liquidacion';
      F_LOTE :=CreaCampo('F_LOTE',ftDate,tsNinguno,tsNinguno,True);
                F_LOTE.Caption:='Fecha Lote';
      ID_COD_RESP :=CreaCampo('ID_COD_RESP',ftFloat,tsNinguno,tsNinguno,True);
                ID_COD_RESP.Caption:='Número de Cod Resp';
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO.Caption:='Número de Contrato';
      ID_GPO_TRANS :=CreaCampo('ID_GPO_TRANS',ftFloat,tsNinguno,tsNinguno,True);
                ID_GPO_TRANS.Caption:='Número de Grupo Trans';
      ID_TRANS_ORIGEN :=CreaCampo('ID_TRANS_ORIGEN',ftFloat,tsNinguno,tsNinguno,True);
                ID_TRANS_ORIGEN.Caption:='Número de Trans Origen';
      IMP_TRANS :=CreaCampo('IMP_TRANS',ftFloat,tsNinguno,tsNinguno,True);
                IMP_TRANS.Caption:='Imp Trans';
      NUM_CHEQUE :=CreaCampo('NUM_CHEQUE',ftFloat,tsNinguno,tsNinguno,True);
                NUM_CHEQUE.Caption:='Número Cheque';
      NUM_LOTE :=CreaCampo('NUM_LOTE',ftFloat,tsNinguno,tsNinguno,True);
                NUM_LOTE.Caption:='Número Lote';
      NUM_TRANS_DET :=CreaCampo('NUM_TRANS_DET',ftFloat,tsNinguno,tsNinguno,True);
                NUM_TRANS_DET.Caption:='Número Trans Det';
      SDO_DISPONIBLE :=CreaCampo('SDO_DISPONIBLE',ftFloat,tsNinguno,tsNinguno,True);
                SDO_DISPONIBLE.Caption:='Sdo Disponible';
      SDO_BLOQ_VIRT :=CreaCampo('SDO_BLOQ_VIRT',ftFloat,tsNinguno,tsNinguno,True);
                SDO_BLOQ_VIRT.Caption:='Sdo Bloq Virt';
      SDO_COMP_VIRT :=CreaCampo('SDO_COMP_VIRT',ftFloat,tsNinguno,tsNinguno,True);
                SDO_COMP_VIRT.Caption:='Sdo Comp Virt';
      SDO_DEUD_VIRT :=CreaCampo('SDO_DEUD_VIRT',ftFloat,tsNinguno,tsNinguno,True);
                SDO_DEUD_VIRT.Caption:='Sdo Deud Virt';
      SDO_DNC_VIRT :=CreaCampo('SDO_DNC_VIRT',ftFloat,tsNinguno,tsNinguno,True);
                SDO_DNC_VIRT.Caption:='Sdo Dnc Virt';
      SDO_EFE_VIRT :=CreaCampo('SDO_EFE_VIRT',ftFloat,tsNinguno,tsNinguno,True);
                SDO_EFE_VIRT.Caption:='Sdo Efe Virt';
      SDO_PROM_VIRT :=CreaCampo('SDO_PROM_VIRT',ftFloat,tsNinguno,tsNinguno,True);
                SDO_PROM_VIRT.Caption:='Sdo Prom Virt';
      SDO_REM_VIRT :=CreaCampo('SDO_REM_VIRT',ftFloat,tsNinguno,tsNinguno,True);
                SDO_REM_VIRT.Caption:='Sdo Rem Virt';
      SDO_SBC_VIRT :=CreaCampo('SDO_SBC_VIRT',ftFloat,tsNinguno,tsNinguno,True);
                SDO_SBC_VIRT.Caption:='Sdo Sbc Virt';
      SIT_TRANS :=CreaCampo('SIT_TRANS',ftString,tsNinguno,tsNinguno,True);
        SIT_TRANS .Size:=2;
                SIT_TRANS.Caption:='Situación Trans';
      TX_COMENTARIO :=CreaCampo('TX_COMENTARIO',ftString,tsNinguno,tsNinguno,True);
                TX_COMENTARIO.Caption:='Comentario';
      TX_REFERENCIA :=CreaCampo('TX_REFERENCIA',ftString,tsNinguno,tsNinguno,True);
                TX_REFERENCIA.Caption:='Referencia';
      ID_ENTIDAD :=CreaCampo('ID_ENTIDAD',ftFloat,tsNinguno,tsNinguno,True);
                ID_ENTIDAD.Caption:='Número de Entidad';
      SIT_CONCILIA :=CreaCampo('SIT_CONCILIA',ftString,tsNinguno,tsNinguno,True);
                SIT_CONCILIA.Caption:='Situación Concilia';
      F_PAGADO :=CreaCampo('F_PAGADO',ftDate,tsNinguno,tsNinguno,True);
                F_PAGADO.Caption:='Fecha Pagado';
      TX_INF_FISCAL :=CreaCampo('TX_INF_FISCAL',ftString,tsNinguno,tsNinguno,True);
                TX_INF_FISCAL.Caption:='Inf Fiscal';
      SIT_SBC :=CreaCampo('SIT_SBC',ftString,tsNinguno,tsNinguno,True);
                SIT_SBC.Caption:='Situación Sbc';
      CVE_CONC_LIDE :=CreaCampo('CVE_CONC_LIDE',ftString,tsNinguno,tsNinguno,True);
                CVE_CONC_LIDE.Caption:='Clave de Conc Lide';
      ID_CONCILIA_LIDE :=CreaCampo('ID_CONCILIA_LIDE',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONCILIA_LIDE.Caption:='Número de Concilia Lide';
      TIPO_CAMBIO :=CreaCampo('TIPO_CAMBIO',ftFloat,tsNinguno,tsNinguno,True);
                TIPO_CAMBIO.Caption:='Tipo Cambio';
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftFloat,tsNinguno,tsNinguno,True);
                CVE_MONEDA.Caption:='Clave de Moneda';
      FKeyFields.Add('ID_TRANSACCION');

      TableName := fValTableDvTans(1,2); //'HDV_TRANSACCION@+dbLink
      UseQuery := True; 
      HelpFile := 'InTDvTranHis.Hlp';
      ShowMenuReporte:=True;

      DvOper   := TDvOperaci.Create(Self);
      DVOper.MASTERSOURCE:=SELF;
      DVOper.FieldByName('CVE_OPERACION').MasterField := 'CVE_OPERACION';
end;

Destructor TDvTranHis.Destroy;
begin
      IF DvOper <> Nil THEN
      Begin
         DvOper.Free;
         DvOper  := Nil;
      End;

inherited;
end;


function TDvTranHis.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWDvTransHist;
begin
   W:=TWDvTransHist.Create(Self);
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


Function TDvTranHis.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IDvTrans.it','F');
      Try if Active then begin T.Param(0,ID_TRANSACCION.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TDvTranHis.Reporte:Boolean;
begin //Execute_Reporte(); 
end;


(***********************************************FORMA DV_TRANSACCION********************)
(*                                                                              *)
(*  FORMA DE DV_TRANSACCION                                                            *)
(*                                                                              *)
(***********************************************FORMA DV_TRANSACCION********************)

procedure TWDvTransHist.FormShow(Sender: TObject);
begin
      Objeto.ID_TRANSACCION.Control:=edID_TRANSACCION;
      Objeto.CVE_CONTABLE.Control:=edCVE_CONTABLE;
      Objeto.CVE_DOCTO.Control:=edCVE_DOCTO;
      Objeto.CVE_MEDIO.Control:=edCVE_MEDIO;
      Objeto.CVE_OPERACION.Control:=edCVE_OPERACION;
      Objeto.CVE_OPE_ORIGEN.Control:=edCVE_OPE_ORIGEN;
      Objeto.CVE_USUARIO.Control:=edCVE_USUARIO;
      Objeto.FH_OPERACION.Control:=edFH_OPERACION;
      Objeto.FH_REGISTRO.Control:=edFH_REGISTRO;
      Objeto.F_LIQUIDACION.Control:=edF_LIQUIDACION;
      Objeto.F_LOTE.Control:=edF_LOTE;
      Objeto.ID_COD_RESP.Control:=edID_COD_RESP;
      Objeto.ID_CONTRATO.Control:=edID_CONTRATO;
      Objeto.ID_GPO_TRANS.Control:=edID_GPO_TRANS;
      Objeto.ID_TRANS_ORIGEN.Control:=edID_TRANS_ORIGEN;
      Objeto.IMP_TRANS.Control:=edIMP_TRANS;
      Objeto.NUM_CHEQUE.Control:=edNUM_CHEQUE;
      Objeto.NUM_LOTE.Control:=edNUM_LOTE;
      Objeto.NUM_TRANS_DET.Control:=edNUM_TRANS_DET;
      Objeto.SDO_DISPONIBLE.Control:=edSDO_DISPONIBLE;
      Objeto.SDO_BLOQ_VIRT.Control:=edSDO_BLOQ_VIRT;
      Objeto.SDO_COMP_VIRT.Control:=edSDO_COMP_VIRT;
      Objeto.SDO_DEUD_VIRT.Control:=edSDO_DEUD_VIRT;
      Objeto.SDO_DNC_VIRT.Control:=edSDO_DNC_VIRT;
      Objeto.SDO_EFE_VIRT.Control:=edSDO_EFE_VIRT;
      Objeto.SDO_PROM_VIRT.Control:=edSDO_PROM_VIRT;
      Objeto.SDO_REM_VIRT.Control:=edSDO_REM_VIRT;
      Objeto.SDO_SBC_VIRT.Control:=edSDO_SBC_VIRT;
      Objeto.SIT_TRANS.Control:=edSIT_TRANS;
      Objeto.TX_COMENTARIO.Control:=edTX_COMENTARIO;
      Objeto.TX_REFERENCIA.Control:=edTX_REFERENCIA;
      Objeto.ID_ENTIDAD.Control:=edID_ENTIDAD;
      Objeto.SIT_CONCILIA.Control:=edSIT_CONCILIA;
      Objeto.F_PAGADO.Control:=edF_PAGADO;
      Objeto.TX_INF_FISCAL.Control:=edTX_INF_FISCAL;
      Objeto.SIT_SBC.Control:=edSIT_SBC;
      Objeto.CVE_CONC_LIDE.Control:=edCVE_CONC_LIDE;
      Objeto.ID_CONCILIA_LIDE.Control:=edID_CONCILIA_LIDE;
      Objeto.TIPO_CAMBIO.Control:=edTIPO_CAMBIO;
      Objeto.CVE_MONEDA.Control:=edCVE_MONEDA;

      if fUsrInfDpVista then
        Button1.Visible  := True
      else
        Button1.Visible := False;
end;

procedure TWDvTransHist.FormDestroy(Sender: TObject);
begin
      Objeto.ID_TRANSACCION.Control:=nil;
      Objeto.CVE_CONTABLE.Control:=nil;
      Objeto.CVE_DOCTO.Control:=nil;
      Objeto.CVE_MEDIO.Control:=nil;
      Objeto.CVE_OPERACION.Control:=nil;
      Objeto.CVE_OPE_ORIGEN.Control:=nil;
      Objeto.CVE_USUARIO.Control:=nil;
      Objeto.FH_OPERACION.Control:=nil;
      Objeto.FH_REGISTRO.Control:=nil;
      Objeto.F_LIQUIDACION.Control:=nil;
      Objeto.F_LOTE.Control:=nil;
      Objeto.ID_COD_RESP.Control:=nil;
      Objeto.ID_CONTRATO.Control:=nil;
      Objeto.ID_GPO_TRANS.Control:=nil;
      Objeto.ID_TRANS_ORIGEN.Control:=nil;
      Objeto.IMP_TRANS.Control:=nil;
      Objeto.NUM_CHEQUE.Control:=nil;
      Objeto.NUM_LOTE.Control:=nil;
      Objeto.NUM_TRANS_DET.Control:=nil;
      Objeto.SDO_DISPONIBLE.Control:=nil;
      Objeto.SDO_BLOQ_VIRT.Control:=nil;
      Objeto.SDO_COMP_VIRT.Control:=nil;
      Objeto.SDO_DEUD_VIRT.Control:=nil;
      Objeto.SDO_DNC_VIRT.Control:=nil;
      Objeto.SDO_EFE_VIRT.Control:=nil;
      Objeto.SDO_PROM_VIRT.Control:=nil;
      Objeto.SDO_REM_VIRT.Control:=nil;
      Objeto.SDO_SBC_VIRT.Control:=nil;
      Objeto.SIT_TRANS.Control:=nil;
      Objeto.TX_COMENTARIO.Control:=nil;
      Objeto.TX_REFERENCIA.Control:=nil;
      Objeto.ID_ENTIDAD.Control:=nil;
      Objeto.SIT_CONCILIA.Control:=nil;
      Objeto.F_PAGADO.Control:=nil;
      Objeto.TX_INF_FISCAL.Control:=nil;
      Objeto.SIT_SBC.Control:=nil;
      Objeto.CVE_CONC_LIDE.Control:=nil;
      Objeto.ID_CONCILIA_LIDE.Control:=nil;
      Objeto.TIPO_CAMBIO.Control:=nil;
      Objeto.CVE_MONEDA.Control:=nil;
   //Objeto
end;

procedure TWDvTransHist.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWDvTransHist.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWDvTransHist.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWDvTransHist.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte; 
//end;


procedure TWDvTransHist.Button1Click(Sender: TObject);
var  WCtrlInt: TWCtrlInt;
begin
   WCtrlInt:= TWCtrlInt.create(nil);
   try
       WCtrlInt.PTRANSAC      :=Objeto.ID_TRANSACCION.AsInteger;
       WCtrlInt.pDatabaseName :=Objeto.Apli.DataBaseName;
       WCtrlInt.pSessionName  :=Objeto.Apli.SessionName;
       WCtrlInt.ShowModal;
   finally
     WCtrlInt.free;
   end;
end;

function TWDvTransHist.fUsrInfDpVista: Boolean;
Var
  Q : TQuery;
begin
  Q := TQuery.Create(nil);
  Q.DatabaseName :=Objeto.Apli.DataBaseName;
  Q.SessionName  :=Objeto.Apli.SessionName;
  Q.SQL.TEXT     := ' SELECT CVE_PARAM FROM DV_PARAM ' +
                    ' WHERE CVE_GRUPO = ''INFDPV'' ' +
                    '   AND CVE_PARAM =  ''' + Objeto.DameUsuario + '''  ' +
	            ' AND VALOR =  ''USUARIO'' ';
  Q.OPEN;

  Result := (Objeto.DameUsuario = Q.FieldByName('CVE_PARAM').AsString);
//   Result := (UpperCase(Q.FieldByName('VALOR').AsString) = 'V');

end;
end.
