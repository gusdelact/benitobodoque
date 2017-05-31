// Sistema         : Clase de SFE_COMPROBANTE
// Fecha de Inicio : 27/11/2009
// Función forma   : Clase de SFE_COMPROBANTE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntSfeCompro;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,IntParamCre,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit;

Type
 TSfeCompro= class; 

  TWSfeComprobante=Class(TForm)
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
    lbSERIE_RECIBO: TLabel;
    edSERIE_RECIBO: TEdit;
    GroupBox1: TGroupBox;
    lbID_CESION: TLabel;
    lbID_DOCUMENTO: TLabel;
    edID_CESION: TEdit;
    edID_DOCUMENTO: TEdit;
    lbID_TRANSACCION: TLabel;
    edID_TRANSACCION: TEdit;
    lbSIT_COMPROBANTE: TLabel;
    edSIT_COMPROBANTE: TEdit;
    GroupBox2: TGroupBox;
    lbDESC_T_COMPROB: TLabel;
    edDESC_T_COMPROB: TEdit;
    lbDESC_PRODUCTO: TLabel;
    edDESC_PRODUCTO: TEdit;
    lbIMP_NETO: TLabel;
    lbTX_PRIMA_TOTAL: TLabel;
    edTX_PRIMA_TOTAL: TEdit;
    lbCUENTA_BANCO: TLabel;
    edCUENTA_BANCO: TEdit;
    lbDESC_MONEDA: TLabel;
    edDESC_MONEDA: TEdit;
    lbF_OPERACION: TLabel;
    dtpF_OPERACION: TInterDateTimePicker;
    edF_OPERACION: TEdit;
    lbF_VALOR: TLabel;
    dtpF_VALOR: TInterDateTimePicker;
    edF_VALOR: TEdit;
    lbF_REMISION: TLabel;
    dtpF_REMISION: TInterDateTimePicker;
    edF_REMISION: TEdit;
    GroupBox3: TGroupBox;
    lbSIT_PROCESO: TLabel;
    edSIT_PROCESO: TEdit;
    lbDESC_ERROR: TLabel;
    edDESC_ERROR: TEdit;
    GBConceptos: TGroupBox;
    EdTXT_LEYENDA_1: TEdit;
    EdTXT_LEYENDA_2: TEdit;
    EdTXT_LEYENDA_3: TEdit;
    EdTXT_LEYENDA_4: TEdit;
    EdTXT_DATO_3: TEdit;
    edTXT_DATO_4: TEdit;
    lbTASA_IMPTO: TLabel;
    lbIMP_IVA: TLabel;
    IeIMP_IVA: TInterEdit;
    IeTASA_IMPTO: TInterEdit;
    EDescSitComprob: TEdit;
    EDescSitProc: TEdit;
    edIMP_NETO: TInterEdit;
    IETotal: TInterEdit;
    LTotal: TLabel;
    GBTimbre: TGroupBox;
    IEFecha_Timbre: TInterEdit;
    IEUuid: TInterEdit;
    LFechaTimbre: TLabel;
    LUuid: TLabel;
    Label1: TLabel;
    IETipo_comprobante: TInterEdit;
    EdTXT_DATO_1: TInterEdit;
    edTXT_DATO_2: TInterEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure ObtieneDescComprobante ();//23Ene2014 HCF

    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TSfeCompro;
end;
 TSfeCompro= class(TInterFrame)
      private 
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public
        ParamCre                 : TParamCre;
        
        { Public declarations } 
        SERIE_RECIBO             : TInterCampo;
        ID_CESION                : TInterCampo;
        ID_DOCUMENTO             : TInterCampo;
        ID_TRANSACCION           : TInterCampo;
        SIT_COMPROBANTE          : TInterCampo;
        DESC_T_COMPROB           : TInterCampo;
        DESC_PRODUCTO            : TInterCampo;
        IMP_NETO                 : TInterCampo;
        TX_PRIMA_TOTAL           : TInterCampo;
        CUENTA_BANCO             : TInterCampo;
        DESC_MONEDA              : TInterCampo;
        F_OPERACION              : TInterCampo;
        F_VALOR                  : TInterCampo;
        F_REMISION               : TInterCampo;
        SIT_PROCESO              : TInterCampo;
        DESC_ERROR               : TInterCampo;
        //02Ene20142 HCF Inicio Campos nuevos
        TXT_LEYENDA_1            : TInterCampo;
        TXT_LEYENDA_2            : TInterCampo;
        TXT_LEYENDA_3            : TInterCampo;
        TXT_LEYENDA_4            : TInterCampo;
        TXT_DATO_1               : TInterCampo;
        TXT_DATO_2               : TInterCampo;
        TXT_DATO_3               : TInterCampo;
        TXT_DATO_4               : TInterCampo;
        TASA_IMPTO               : TInterCampo;
        IMP_IVA                  : TInterCampo;
        TOTAL                    : TInterCampo;
        FECHA_TIMBRE             : TInterCampo;
        UUID                     : TInterCampo;
        TIPO_COMPROBANTE         : TInterCampo;
        DESC_SIT_COMPROBANTE     : TInterCampo;
        DESC_SIT_PROCESO         : TInterCampo;
        //02Ene2014 HCF fin Campos nuevos

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

const coENPROCESO = 'EN PROCESO';
      coPROCESADO = 'PROCESADO';
      coCNERROR   = 'CON ERROR';
      coCANCELADO = 'CANCELADO';
      coENVIADO   = 'ENVIADO';

implementation
//Uses RepMon;

{$R *.DFM}

constructor TSfeCompro.Create( AOwner : TComponent );
begin Inherited;
      SERIE_RECIBO :=CreaCampo('SERIE_RECIBO',ftString,tsNinguno,tsNinguno,True);
                SERIE_RECIBO.Caption:='Serie Recibo';
      ID_CESION :=CreaCampo('ID_CESION',ftFloat,tsNinguno,tsNinguno,True);
                ID_CESION.Caption:='Número de Cesion';
      ID_DOCUMENTO :=CreaCampo('ID_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
                ID_DOCUMENTO.Caption:='Número de Documento';
      ID_TRANSACCION :=CreaCampo('ID_TRANSACCION',ftFloat,tsNinguno,tsNinguno,True);
                ID_TRANSACCION.Caption:='Número de Transaccion';
      SIT_COMPROBANTE :=CreaCampo('SIT_COMPROBANTE',ftFloat,tsNinguno,tsNinguno,True);
                SIT_COMPROBANTE.Caption:='Situación Comprobante';
      DESC_T_COMPROB :=CreaCampo('DESC_T_COMPROB',ftString,tsNinguno,tsNinguno,True);
                DESC_T_COMPROB.Caption:='Descripción T Comprob';
      DESC_PRODUCTO :=CreaCampo('DESC_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
                DESC_PRODUCTO.Caption:='Descripción Producto';
      IMP_NETO :=CreaCampo('IMP_NETO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_NETO.Caption:='Imp Neto';
      TX_PRIMA_TOTAL :=CreaCampo('TX_PRIMA_TOTAL',ftString,tsNinguno,tsNinguno,True);
                TX_PRIMA_TOTAL.Caption:='Prima Total';
      CUENTA_BANCO :=CreaCampo('CUENTA_BANCO',ftString,tsNinguno,tsNinguno,True);
                CUENTA_BANCO.Caption:='Cuenta Banco';
      DESC_MONEDA :=CreaCampo('DESC_MONEDA',ftString,tsNinguno,tsNinguno,True);
                DESC_MONEDA.Caption:='Descripción Moneda';
      F_OPERACION :=CreaCampo('F_OPERACION',ftDate,tsNinguno,tsNinguno,True);
                F_OPERACION.Caption:='Fecha Operacion';
      F_VALOR :=CreaCampo('F_VALOR',ftDate,tsNinguno,tsNinguno,True);
                F_VALOR.Caption:='Fecha Valor';
      F_REMISION :=CreaCampo('F_REMISION',ftDate,tsNinguno,tsNinguno,True);
                F_REMISION.Caption:='Fecha Remision';
      SIT_PROCESO :=CreaCampo('SIT_PROCESO',ftFloat,tsNinguno,tsNinguno,True);
                SIT_PROCESO.Caption:='Situación Proceso';
      DESC_ERROR :=CreaCampo('DESC_ERROR',ftString,tsNinguno,tsNinguno,True);
                DESC_ERROR.Caption:='Descripción Error';

      //02Ene2014 HCF Inicio Campos nuevos
      TXT_LEYENDA_1 :=CreaCampo('TXT_LEYENDA_1',ftString,tsNinguno,tsNinguno,True);
                TXT_LEYENDA_1.Caption:='Leyenda 1';
      TXT_LEYENDA_2 :=CreaCampo('TXT_LEYENDA_2',ftString,tsNinguno,tsNinguno,True);
                TXT_LEYENDA_2.Caption:='Leyenda 2';
      TXT_LEYENDA_3 :=CreaCampo('TXT_LEYENDA_3',ftString,tsNinguno,tsNinguno,True);
                TXT_LEYENDA_3.Caption:='Leyenda 3';
      TXT_LEYENDA_4 :=CreaCampo('TXT_LEYENDA_4',ftString,tsNinguno,tsNinguno,True);
                TXT_LEYENDA_4.Caption:='Leyenda 4';
      TXT_DATO_1 :=CreaCampo('TXT_DATO_1',ftString,tsNinguno,tsNinguno,True);
                TXT_DATO_1.Caption:='Dato 1';
      TXT_DATO_2 :=CreaCampo('TXT_DATO_2',ftString,tsNinguno,tsNinguno,True);
                TXT_DATO_2.Caption:='Dato 2';
      TXT_DATO_3 :=CreaCampo('TXT_DATO_3',ftString,tsNinguno,tsNinguno,True);
                TXT_DATO_3.Caption:='Dato 3';
      TXT_DATO_4 :=CreaCampo('TXT_DATO_4',ftString,tsNinguno,tsNinguno,True);
                TXT_DATO_4.Caption:='Dato 4';
      TASA_IMPTO :=CreaCampo('TASA_IMPTO',ftFloat,tsNinguno,tsNinguno,True);
                TASA_IMPTO.Caption:='TASA IMPTO';
      IMP_IVA    :=CreaCampo('IMP_IVA',ftFloat,tsNinguno,tsNinguno,True);
                IMP_IVA.Caption:='IMP IVA';
      TOTAL      :=CreaCampo('TOTAL',ftFloat,tsNinguno,tsNinguno,True);
                TOTAL.Caption:='TOTAL';
      FECHA_TIMBRE :=CreaCampo('FECHA_TIMBRE',ftDate,tsNinguno,tsNinguno,True);
                FECHA_TIMBRE.Caption:='FECHA TIMBRE';
      UUID       :=CreaCampo('UUID',ftString,tsNinguno,tsNinguno,True);
                UUID.Caption:='UUID';
      TIPO_COMPROBANTE:=CreaCampo('TIPO_COMPROBANTE',ftString,tsNinguno,tsNinguno,True);
                TIPO_COMPROBANTE.Caption:='TIPO COMPROBANTE';
      DESC_SIT_COMPROBANTE :=CreaCampo('DESC_SIT_COMPROBANTE',ftString,tsNinguno,tsNinguno,False);
                DESC_SIT_COMPROBANTE.Caption:='Situación Comprobante';
      DESC_SIT_PROCESO :=CreaCampo('DESC_SIT_PROCESO',ftString,tsNinguno,tsNinguno,False);
                DESC_SIT_PROCESO.Caption:='Situación Proceso';
      //02Ene2014 HCF fin Campos nuevos

      FKeyFields.Add('SERIE_RECIBO');
      FKeyFields.Add('ID_CESION');
      FKeyFields.Add('ID_DOCUMENTO');

      TableName := 'ADMIPROD.SFE_COMPROBANTE';
      UseQuery := True;
      HelpFile := 'IntSfeCompro.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TSfeCompro.Destroy;
begin inherited;
end;


function TSfeCompro.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWSfeComprobante;
begin
   W:=TWSfeComprobante.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowBtnNuevo := False;
      W.InterForma1.ShowBtnAceptar := False;
      W.InterForma1.ShowBtnModificar := False;
      W.InterForma1.ShowBtnEliminar := False;
      W.InterForma1.ShowBtnCancelar := False;       
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TSfeCompro.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ISfeComp.it','S,F,S');
      Try if Active then begin T.Param(0,SERIE_RECIBO.AsString); 
                               T.Param(1,ID_CESION.AsString); 
                               T.Param(2,ID_DOCUMENTO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end; 
end;

function TSfeCompro.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA SFE_COMPROBANTE********************)
(*                                                                              *)
(*  FORMA DE SFE_COMPROBANTE                                                            *)
(*                                                                              *)
(***********************************************FORMA SFE_COMPROBANTE********************)

procedure TWSfeComprobante.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.SERIE_RECIBO.Control:=edSERIE_RECIBO;
      Objeto.ID_CESION.Control:=edID_CESION;
      Objeto.ID_DOCUMENTO.Control:=edID_DOCUMENTO;
      Objeto.ID_TRANSACCION.Control:=edID_TRANSACCION;
      Objeto.SIT_COMPROBANTE.Control:=edSIT_COMPROBANTE;
      Objeto.DESC_T_COMPROB.Control:=edDESC_T_COMPROB;
      Objeto.DESC_PRODUCTO.Control:=edDESC_PRODUCTO;
      Objeto.IMP_NETO.Control:=edIMP_NETO;
      Objeto.TX_PRIMA_TOTAL.Control:=edTX_PRIMA_TOTAL;
      Objeto.CUENTA_BANCO.Control:=edCUENTA_BANCO;
      Objeto.DESC_MONEDA.Control:=edDESC_MONEDA;
      Objeto.F_OPERACION.Control:=edF_OPERACION;
      Objeto.F_VALOR.Control:=edF_VALOR;
      Objeto.F_REMISION.Control:=edF_REMISION;
      Objeto.SIT_PROCESO.Control:=edSIT_PROCESO;
      Objeto.DESC_ERROR.Control:=edDESC_ERROR;
      //02Ene2014 HCF Inicio Campos nuevos
      Objeto.TXT_LEYENDA_1.Control       :=EdTXT_LEYENDA_1;
      Objeto.TXT_LEYENDA_2.Control       :=EdTXT_LEYENDA_2;
      Objeto.TXT_LEYENDA_3.Control       :=EdTXT_LEYENDA_3;
      Objeto.TXT_LEYENDA_4.Control       :=EdTXT_LEYENDA_4;
      Objeto.TXT_DATO_1.Control          :=EdTXT_DATO_1;
      Objeto.TXT_DATO_2.Control          :=EdTXT_DATO_2;
      Objeto.TXT_DATO_3.Control          :=EdTXT_DATO_3;
      Objeto.TXT_DATO_4.Control          :=EdTXT_DATO_4;
      Objeto.TASA_IMPTO.Control          :=IeTASA_IMPTO;
      Objeto.IMP_IVA.Control             :=IeIMP_IVA;
      Objeto.Total.Control               :=IETotal;
      Objeto.FECHA_TIMBRE.Control        :=IEFECHA_TIMBRE;
      Objeto.UUID.Control                :=IEUUID;
      Objeto.TIPO_COMPROBANTE.Control    :=IETIPO_COMPROBANTE;
      Objeto.DESC_SIT_COMPROBANTE.Control:=EDescSitComprob;
      Objeto.DESC_SIT_PROCESO.Control:=EDescSitProc;
      //02Ene2014 HCF fin Campos nuevos
      ObtieneDescComprobante();
end;

procedure TWSfeComprobante.FormDestroy(Sender: TObject);
begin
      Objeto.SERIE_RECIBO.Control:=nil;
      Objeto.ID_CESION.Control:=nil;
      Objeto.ID_DOCUMENTO.Control:=nil;
      Objeto.ID_TRANSACCION.Control:=nil;
      Objeto.SIT_COMPROBANTE.Control:=nil;
      Objeto.DESC_T_COMPROB.Control:=nil;
      Objeto.DESC_PRODUCTO.Control:=nil;
      Objeto.IMP_NETO.Control:=nil;
      Objeto.TX_PRIMA_TOTAL.Control:=nil;
      Objeto.CUENTA_BANCO.Control:=nil;
      Objeto.DESC_MONEDA.Control:=nil;
      Objeto.F_OPERACION.Control:=nil;
      Objeto.F_VALOR.Control:=nil;
      Objeto.F_REMISION.Control:=nil;
      Objeto.SIT_PROCESO.Control:=nil;
      Objeto.DESC_ERROR.Control:=nil;
      //02Ene2014 HCF Inicio Campos nuevos
      Objeto.TXT_LEYENDA_1.Control       :=nil;
      Objeto.TXT_LEYENDA_2.Control       :=nil;
      Objeto.TXT_LEYENDA_3.Control       :=nil;
      Objeto.TXT_LEYENDA_4.Control       :=nil;
      Objeto.TXT_DATO_1.Control          :=nil;
      Objeto.TXT_DATO_2.Control          :=nil;
      Objeto.TXT_DATO_3.Control          :=nil;
      Objeto.TXT_DATO_4.Control          :=nil;
      Objeto.TASA_IMPTO.Control          :=nil;
      Objeto.IMP_IVA.Control             :=nil;
      Objeto.TOTAL.Control               :=nil;
      Objeto.FECHA_TIMBRE.Control        :=nil;
      Objeto.UUID.Control                :=nil;
      Objeto.TIPO_COMPROBANTE.Control    :=nil;
      Objeto.DESC_SIT_COMPROBANTE.Control:=nil;
      Objeto.DESC_SIT_PROCESO.Control    :=nil;
      //02Ene2014 HCF fin Campos nuevos
   //Objeto
end;

procedure TWSfeComprobante.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWSfeComprobante.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWSfeComprobante.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWSfeComprobante.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;
procedure TWSfeComprobante.ObtieneDescComprobante ();
var vlSql:String;
    vlQry :TQuery;
begin
   vlSql:= ' SELECT  ID_TRANSACCION, SIT_PROCESO, SIT_COMPROBANTE '+
           '    FROM ADMIPROD.SFE_COMPROBANTE'+
           '   WHERE SERIE_RECIBO = ''' + OBJETO.SERIE_RECIBO.AsString+ '''' +
           '     AND ID_CESION = ' + OBJETO.ID_CESION.AsString +
           '     AND ID_DOCUMENTO = ''' + OBJETO.ID_DOCUMENTO.AsString + '''';

   vlQry := GetSQLQuery(vlsql,objeto.Apli.DataBaseName, objeto.Apli.SessionName, True );
   try
   if vlQry <> nil then
   Begin

     if vlQry.FieldByName('SIT_PROCESO').AsInteger = 0 then
        OBJETO.DESC_SIT_PROCESO.asString:=coENPROCESO;
     if vlQry.FieldByName('SIT_PROCESO').AsInteger = 1 then
        OBJETO.DESC_SIT_PROCESO.asString:=coPROCESADO;
     if vlQry.FieldByName('SIT_PROCESO').AsInteger = 2 then
        OBJETO.DESC_SIT_PROCESO.asString:=coCNERROR;

     if vlQry.FieldByName('SIT_COMPROBANTE').AsInteger = 0 then
        OBJETO.DESC_SIT_COMPROBANTE.asString:=coCANCELADO;
     if vlQry.FieldByName('SIT_COMPROBANTE').AsInteger = 1 then
        OBJETO.DESC_SIT_COMPROBANTE.asString:=coENVIADO;
   end;
   finally
     if vlQry <> nil then vlQry.free;
   end;

end;


end.
