// Sistema         : Clase de BC_LAYOUT_VC
// Fecha de Inicio : 25/09/2013
// Función forma   : Clase de BC_LAYOUT_VC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : FJR 
// Comentarios     : Cambios de venta de cartera de Nov. 2013
Unit IntBcLayVC; 

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Excel97, OleServer, IntParamCre, ComObj,
  IntSGCtrl, Grids, DBGrids;

Type
 TBcLayVC= class; 

  TWBcLayVC=Class(TForm)
    InterForma1             : TInterForma; 
    lbTIPO_CARGA : TLabel;
    edTIPO_CARGA : TEdit;
    lbNUMERO_CUENTA : TLabel; 
    edNUMERO_CUENTA : TEdit;
    lbUID_CUS : TLabel;
    edUID_CUS : TEdit;
    lbRFC : TLabel; 
    edRFC : TEdit;
    lbPRIMER_NOMBRE : TLabel; 
    edPRIMER_NOMBRE : TEdit;
    lbSEGUNDO_NOMBRE : TLabel; 
    edSEGUNDO_NOMBRE : TEdit;
    lbAPELLIDO_PATERNO : TLabel; 
    edAPELLIDO_PATERNO : TEdit;
    lbAPELLIDO_MATERNO : TLabel; 
    edAPELLIDO_MATERNO : TEdit;
    lbAPELLIDO_ADICIONAL : TLabel; 
    edAPELLIDO_ADICIONAL : TEdit;
    lbFECHA_NACIMIENTO : TLabel; 
    dtpFECHA_NACIMIENTO : TInterDateTimePicker; 
    edFECHA_NACIMIENTO : TEdit;
    lbSEXO : TLabel;
    edSEXO : TEdit;
    lbESTADO_CIVIL : TLabel; 
    edESTADO_CIVIL : TEdit;
    lbNAT : TLabel; 
    edNAT : TEdit;
    lbECON_ACT : TLabel; 
    edECON_ACT : TEdit;
    lbTIPO_CLIENTE : TLabel; 
    edTIPO_CLIENTE : TEdit;
    lbINDICADOR_DEFUNCION : TLabel; 
    edINDICADOR_DEFUNCION : TEdit;
    lbFECHA_DEFUNCION : TLabel; 
    dtpFECHA_DEFUNCION : TInterDateTimePicker; 
    edFECHA_DEFUNCION : TEdit;
    lbPAIS : TLabel; 
    edPAIS : TEdit;
    lbESTADO : TLabel; 
    edESTADO : TEdit;
    lbNOM_CIT : TLabel; 
    edNOM_CIT : TEdit;
    lbDELEGACION_MUNICIPIO : TLabel; 
    edDELEGACION_MUNICIPIO : TEdit;
    lbCOLONIA_POBLACION : TLabel; 
    edCOLONIA_POBLACION : TEdit;
    lbNUMERO_EXTERIOR : TLabel; 
    edNUMERO_EXTERIOR : TEdit;
    lbCODIGO_POSTAL : TLabel; 
    edCODIGO_POSTAL : TEdit;
    lbNUMERO_TELEFONO : TLabel; 
    edNUMERO_TELEFONO : TEdit;
    lbEXTENSION_TELEFONICA : TLabel; 
    edEXTENSION_TELEFONICA : TEdit;
    lbTIPO_DOMICILIO : TLabel; 
    edTIPO_DOMICILIO : TEdit;
    lbTIPO_RESPONSABILIDAD : TLabel; 
    edTIPO_RESPONSABILIDAD : TEdit; 
    odArchivoCarga: TOpenDialog;
    Excel_Application: TExcelApplication;
    Excel_Worksheet: TExcelWorksheet;
    btCargaVC: TBitBtn;
    sgcDatos: TSGCtrl;
    Panel1: TPanel;
    Excel_Workbook: TExcelWorkbook;
    DBGrid1: TDBGrid;
    QryHistoVC: TQuery;
    DSQryHistoVC: TDataSource;
    function CargaDatos(Accion: Integer): Boolean;
    function ValidaArchivo: Boolean;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCargaVCClick(Sender: TObject);
    procedure MuestraDatos;
    procedure InterForma1Buscar(Sender: TObject);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);

    private
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TBcLayVC;
end; 
 TBcLayVC= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        TIPO_CARGA               : TInterCampo;
        NUMERO_CUENTA            : TInterCampo;
        UID_CUS                  : TInterCampo;
        RFC                      : TInterCampo;
        PRIMER_NOMBRE            : TInterCampo;
        SEGUNDO_NOMBRE           : TInterCampo;
        APELLIDO_PATERNO         : TInterCampo;
        APELLIDO_MATERNO         : TInterCampo;
        APELLIDO_ADICIONAL       : TInterCampo;
        FECHA_NACIMIENTO         : TInterCampo;
        SEXO                     : TInterCampo;
        ESTADO_CIVIL             : TInterCampo;
        NAT                      : TInterCampo;
        ECON_ACT                 : TInterCampo;
        TIPO_CLIENTE             : TInterCampo;
        INDICADOR_DEFUNCION      : TInterCampo;
        FECHA_DEFUNCION          : TInterCampo;
        PAIS                     : TInterCampo;
        ESTADO                   : TInterCampo;
        NOM_CIT                  : TInterCampo;
        DELEGACION_MUNICIPIO     : TInterCampo;
        COLONIA_POBLACION        : TInterCampo;
        NUMERO_EXTERIOR          : TInterCampo;
        CODIGO_POSTAL            : TInterCampo;
        NUMERO_TELEFONO          : TInterCampo;
        EXTENSION_TELEFONICA     : TInterCampo;
        TIPO_DOMICILIO           : TInterCampo;
        TIPO_RESPONSABILIDAD     : TInterCampo;
        TIPO_CONTRATO            : TInterCampo;
        TIPO_CREDITO             : TInterCampo;
        CLAVE_MONEDA             : TInterCampo;
        FECHA_APERTURA           : TInterCampo;
        FECHA_REESTRUCTURA       : TInterCampo;
        NUMERO_PAGOS             : TInterCampo;
        EXPERIENCIAS_CREDITICIAS : TInterCampo;
        CLAVE_FRECUENCIA_PAGOS   : TInterCampo;
        CLAVE_FRECUENCIA_PAGOS_NUM : TInterCampo;
        LIMITE_CREDITO           : TInterCampo;
        CREDITO_MAXIMO           : TInterCampo;
        SALDO_INICIAL            : TInterCampo;
        SALDO_ACTUAL             : TInterCampo;
        SALDO_VENCIDO            : TInterCampo;
        PAGOS_VENCIDOS           : TInterCampo;
        DIAS_VENCIDO             : TInterCampo;
        MONTO_A_PAGAR            : TInterCampo;
        PLAZO                    : TInterCampo;
        IMPORTE_AVALUO           : TInterCampo;
        GARANTIA                 : TInterCampo;
        IMPORTE_PAGO             : TInterCampo;
        PAGO_EFECTIVO            : TInterCampo;
        SALDO_QUITA              : TInterCampo;
        SALDO_DACION             : TInterCampo;
        QUEBRANTO                : TInterCampo;
        FECHA_ULTIMO_PAGO        : TInterCampo;
        FECHA_ULTIMA_COMPRA      : TInterCampo;
        FECHA_QUEBRANTO          : TInterCampo;
        FECHA_LIQUIDACION        : TInterCampo;
        FECHA_CIERRE             : TInterCampo;
        CLAVE_OBSERVACION        : TInterCampo;
        CALIFICACION_CARTERA     : TInterCampo;
        CUENTA_CONTABLE          : TInterCampo;
        NUMERO_CONTRATO_ANTERIOR : TInterCampo;
        NOMBRE_OTORGANTE_ANTERIOR : TInterCampo;
        CLAVE_OTORGANTE_ANTERIOR : TInterCampo;
        NUMERO_CUENTA_ANTERIOR   : TInterCampo;
        BLOQUEO                  : TInterCampo;
        FECHA_PRIMER_INCUM       : TInterCampo;
        CLAVE_CONSOLIDA_EM       : TInterCampo;
        SALDO_INSOLUTO           : TInterCampo;
        MONTO_ULTIMO_PAGO        : TInterCampo; //FJR 13.06.2013
        TIPO_CARTERA             : TInterCampo; //FJR 27.08.2013
        SIT_VC_HISTO             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_PROCESO                : TInterCampo;

        ParamCre                 : TParamCre ;

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
var Csc : Integer;

constructor TBcLayVC.Create( AOwner : TComponent ); 
begin Inherited;
      TIPO_CARGA :=CreaCampo('TIPO_CARGA',ftString,tsNinguno,tsNinguno,True);
                TIPO_CARGA.Caption:='Tipo Carga';
      NUMERO_CUENTA :=CreaCampo('NUMERO_CUENTA',ftString,tsNinguno,tsNinguno,True);
        NUMERO_CUENTA .Size:=25;
                NUMERO_CUENTA.Caption:='Numero Cuenta';
      UID_CUS :=CreaCampo('UID_CUS',ftString,tsNinguno,tsNinguno,True);
        UID_CUS .Size:=16;
                UID_CUS.Caption:='Uid Cus';
      RFC :=CreaCampo('RFC',ftString,tsNinguno,tsNinguno,True);
        RFC .Size:=13;
                RFC.Caption:='Rfc';
      PRIMER_NOMBRE :=CreaCampo('PRIMER_NOMBRE',ftString,tsNinguno,tsNinguno,True);
                PRIMER_NOMBRE.Caption:='Primer Nombre';
      SEGUNDO_NOMBRE :=CreaCampo('SEGUNDO_NOMBRE',ftString,tsNinguno,tsNinguno,True);
                SEGUNDO_NOMBRE.Caption:='Segundo Nombre';
      APELLIDO_PATERNO :=CreaCampo('APELLIDO_PATERNO',ftString,tsNinguno,tsNinguno,True);
                APELLIDO_PATERNO.Caption:='Apellido Paterno';
      APELLIDO_MATERNO :=CreaCampo('APELLIDO_MATERNO',ftString,tsNinguno,tsNinguno,True);
                APELLIDO_MATERNO.Caption:='Apellido Materno';
      APELLIDO_ADICIONAL :=CreaCampo('APELLIDO_ADICIONAL',ftString,tsNinguno,tsNinguno,True);
                APELLIDO_ADICIONAL.Caption:='Apellido Adicional';
      FECHA_NACIMIENTO :=CreaCampo('FECHA_NACIMIENTO',ftDate,tsNinguno,tsNinguno,True);
                FECHA_NACIMIENTO.Caption:='Fecha Nacimiento';
      SEXO :=CreaCampo('SEXO',ftString,tsNinguno,tsNinguno,True);
        SEXO .Size:=1;
                SEXO.Caption:='Sexo';
      ESTADO_CIVIL :=CreaCampo('ESTADO_CIVIL',ftString,tsNinguno,tsNinguno,True);
        ESTADO_CIVIL .Size:=1;
                ESTADO_CIVIL.Caption:='Estado Civil';
      NAT :=CreaCampo('NAT',ftString,tsNinguno,tsNinguno,True);
        NAT .Size:=2;
                NAT.Caption:='Nat';
      ECON_ACT :=CreaCampo('ECON_ACT',ftString,tsNinguno,tsNinguno,True);
                ECON_ACT.Caption:='Econ Act';
      TIPO_CLIENTE :=CreaCampo('TIPO_CLIENTE',ftFloat,tsNinguno,tsNinguno,True);
                TIPO_CLIENTE.Caption:='Tipo Cliente';
      INDICADOR_DEFUNCION :=CreaCampo('INDICADOR_DEFUNCION',ftString,tsNinguno,tsNinguno,True);
        INDICADOR_DEFUNCION .Size:=1;
                INDICADOR_DEFUNCION.Caption:='Indicador Defuncion';
      FECHA_DEFUNCION :=CreaCampo('FECHA_DEFUNCION',ftDate,tsNinguno,tsNinguno,True);
                FECHA_DEFUNCION.Caption:='Fecha Defuncion';
      PAIS :=CreaCampo('PAIS',ftString,tsNinguno,tsNinguno,True);
                PAIS.Caption:='Pais';
      ESTADO :=CreaCampo('ESTADO',ftString,tsNinguno,tsNinguno,True);
                ESTADO.Caption:='Estado';
      NOM_CIT :=CreaCampo('NOM_CIT',ftString,tsNinguno,tsNinguno,True);
                NOM_CIT.Caption:='Nombre Cit';
      DELEGACION_MUNICIPIO :=CreaCampo('DELEGACION_MUNICIPIO',ftString,tsNinguno,tsNinguno,True);
                DELEGACION_MUNICIPIO.Caption:='Delegacion Municipio';
      COLONIA_POBLACION :=CreaCampo('COLONIA_POBLACION',ftString,tsNinguno,tsNinguno,True);
                COLONIA_POBLACION.Caption:='Colonia Poblacion';
      NUMERO_EXTERIOR :=CreaCampo('NUMERO_EXTERIOR',ftString,tsNinguno,tsNinguno,True);
                NUMERO_EXTERIOR.Caption:='Numero Exterior';
      CODIGO_POSTAL :=CreaCampo('CODIGO_POSTAL',ftString,tsNinguno,tsNinguno,True);
                CODIGO_POSTAL.Caption:='Codigo Postal';
      NUMERO_TELEFONO :=CreaCampo('NUMERO_TELEFONO',ftFloat,tsNinguno,tsNinguno,True);
                NUMERO_TELEFONO.Caption:='Numero Telefono';
      EXTENSION_TELEFONICA :=CreaCampo('EXTENSION_TELEFONICA',ftFloat,tsNinguno,tsNinguno,True);
                EXTENSION_TELEFONICA.Caption:='Extension Telefonica';
      TIPO_DOMICILIO :=CreaCampo('TIPO_DOMICILIO',ftString,tsNinguno,tsNinguno,True);
        TIPO_DOMICILIO .Size:=1;
                TIPO_DOMICILIO.Caption:='Tipo Domicilio';
      TIPO_RESPONSABILIDAD :=CreaCampo('TIPO_RESPONSABILIDAD',ftString,tsNinguno,tsNinguno,True);
        TIPO_RESPONSABILIDAD .Size:=1;
                TIPO_RESPONSABILIDAD.Caption:='Tipo Responsabilidad';
      TIPO_CONTRATO :=CreaCampo('TIPO_CONTRATO',ftString,tsNinguno,tsNinguno,False);
        TIPO_CONTRATO .Size:=2;
                TIPO_CONTRATO.Caption:='Tipo Contrato';
      TIPO_CREDITO :=CreaCampo('TIPO_CREDITO',ftString,tsNinguno,tsNinguno,False);
        TIPO_CREDITO .Size:=4;
                TIPO_CREDITO.Caption:='Tipo Credito';
      CLAVE_MONEDA :=CreaCampo('CLAVE_MONEDA',ftString,tsNinguno,tsNinguno,False);
        CLAVE_MONEDA .Size:=4;
                CLAVE_MONEDA.Caption:='Clave Moneda';
      FECHA_APERTURA :=CreaCampo('FECHA_APERTURA',ftDate,tsNinguno,tsNinguno,False);
                FECHA_APERTURA.Caption:='Fecha Apertura';
      FECHA_REESTRUCTURA :=CreaCampo('FECHA_REESTRUCTURA',ftDate,tsNinguno,tsNinguno,False);
                FECHA_REESTRUCTURA.Caption:='Fecha Reestructura';
      NUMERO_PAGOS :=CreaCampo('NUMERO_PAGOS',ftFloat,tsNinguno,tsNinguno,False);
                NUMERO_PAGOS.Caption:='Numero Pagos';
      EXPERIENCIAS_CREDITICIAS :=CreaCampo('EXPERIENCIAS_CREDITICIAS',ftFloat,tsNinguno,tsNinguno,False);
                EXPERIENCIAS_CREDITICIAS.Caption:='Experiencias Crediticias';
      CLAVE_FRECUENCIA_PAGOS :=CreaCampo('CLAVE_FRECUENCIA_PAGOS',ftString,tsNinguno,tsNinguno,False);
        CLAVE_FRECUENCIA_PAGOS .Size:=1;
                CLAVE_FRECUENCIA_PAGOS.Caption:='Clave Frecuencia Pagos';
      CLAVE_FRECUENCIA_PAGOS_NUM :=CreaCampo('CLAVE_FRECUENCIA_PAGOS_NUM',ftFloat,tsNinguno,tsNinguno,False);
                CLAVE_FRECUENCIA_PAGOS_NUM.Caption:='Clave Frecuencia Pagos Número';
      LIMITE_CREDITO :=CreaCampo('LIMITE_CREDITO',ftFloat,tsNinguno,tsNinguno,False);
                LIMITE_CREDITO.Caption:='Limite Credito';
      CREDITO_MAXIMO :=CreaCampo('CREDITO_MAXIMO',ftFloat,tsNinguno,tsNinguno,False);
                CREDITO_MAXIMO.Caption:='Credito Maximo';
      SALDO_INICIAL :=CreaCampo('SALDO_INICIAL',ftFloat,tsNinguno,tsNinguno,False);
                SALDO_INICIAL.Caption:='Saldo Inicial';
      SALDO_ACTUAL :=CreaCampo('SALDO_ACTUAL',ftFloat,tsNinguno,tsNinguno,False);
                SALDO_ACTUAL.Caption:='Saldo Actual';
      SALDO_VENCIDO :=CreaCampo('SALDO_VENCIDO',ftFloat,tsNinguno,tsNinguno,False);
                SALDO_VENCIDO.Caption:='Saldo Vencido';
      PAGOS_VENCIDOS :=CreaCampo('PAGOS_VENCIDOS',ftFloat,tsNinguno,tsNinguno,False);
                PAGOS_VENCIDOS.Caption:='Pagos Vencidos';
      DIAS_VENCIDO :=CreaCampo('DIAS_VENCIDO',ftFloat,tsNinguno,tsNinguno,False);
                DIAS_VENCIDO.Caption:='Dias Vencido';
      MONTO_A_PAGAR :=CreaCampo('MONTO_A_PAGAR',ftFloat,tsNinguno,tsNinguno,False);
                MONTO_A_PAGAR.Caption:='Monto A Pagar';
      PLAZO :=CreaCampo('PLAZO',ftFloat,tsNinguno,tsNinguno,False);
                PLAZO.Caption:='Plazo';
      IMPORTE_AVALUO :=CreaCampo('IMPORTE_AVALUO',ftFloat,tsNinguno,tsNinguno,False);
                IMPORTE_AVALUO.Caption:='Importe Avaluo';
      GARANTIA :=CreaCampo('GARANTIA',ftFloat,tsNinguno,tsNinguno,False);
                GARANTIA.Caption:='Garantia';
      IMPORTE_PAGO :=CreaCampo('IMPORTE_PAGO',ftFloat,tsNinguno,tsNinguno,False);
                IMPORTE_PAGO.Caption:='Importe Pago';
      PAGO_EFECTIVO :=CreaCampo('PAGO_EFECTIVO',ftFloat,tsNinguno,tsNinguno,False);
                PAGO_EFECTIVO.Caption:='Pago Efectivo';
      SALDO_QUITA :=CreaCampo('SALDO_QUITA',ftFloat,tsNinguno,tsNinguno,False);
                SALDO_QUITA.Caption:='Saldo Quita';
      SALDO_DACION :=CreaCampo('SALDO_DACION',ftFloat,tsNinguno,tsNinguno,False);
                SALDO_DACION.Caption:='Saldo Dacion';
      QUEBRANTO :=CreaCampo('QUEBRANTO',ftFloat,tsNinguno,tsNinguno,False);
                QUEBRANTO.Caption:='Quebranto';
      FECHA_ULTIMO_PAGO :=CreaCampo('FECHA_ULTIMO_PAGO',ftDate,tsNinguno,tsNinguno,False);
                FECHA_ULTIMO_PAGO.Caption:='Fecha Ultimo Pago';
      FECHA_ULTIMA_COMPRA :=CreaCampo('FECHA_ULTIMA_COMPRA',ftDate,tsNinguno,tsNinguno,False);
                FECHA_ULTIMA_COMPRA.Caption:='Fecha Ultima Compra';
      FECHA_QUEBRANTO :=CreaCampo('FECHA_QUEBRANTO',ftDate,tsNinguno,tsNinguno,False);
                FECHA_QUEBRANTO.Caption:='Fecha Quebranto';
      FECHA_LIQUIDACION :=CreaCampo('FECHA_LIQUIDACION',ftDate,tsNinguno,tsNinguno,False);
                FECHA_LIQUIDACION.Caption:='Fecha Liquidacion';
      FECHA_CIERRE :=CreaCampo('FECHA_CIERRE',ftDate,tsNinguno,tsNinguno,False);
                FECHA_CIERRE.Caption:='Fecha Cierre';
      CLAVE_OBSERVACION :=CreaCampo('CLAVE_OBSERVACION',ftString,tsNinguno,tsNinguno,False);
        CLAVE_OBSERVACION .Size:=2;
                CLAVE_OBSERVACION.Caption:='Clave Observacion';
      CALIFICACION_CARTERA :=CreaCampo('CALIFICACION_CARTERA',ftString,tsNinguno,tsNinguno,False);
        CALIFICACION_CARTERA .Size:=4;
                CALIFICACION_CARTERA.Caption:='Calificacion Cartera';
      CUENTA_CONTABLE :=CreaCampo('CUENTA_CONTABLE',ftString,tsNinguno,tsNinguno,False);
                CUENTA_CONTABLE.Caption:='Cuenta Contable';
      NUMERO_CONTRATO_ANTERIOR :=CreaCampo('NUMERO_CONTRATO_ANTERIOR',ftString,tsNinguno,tsNinguno,False);
                NUMERO_CONTRATO_ANTERIOR.Caption:='Numero Contrato Anterior';
      NOMBRE_OTORGANTE_ANTERIOR :=CreaCampo('NOMBRE_OTORGANTE_ANTERIOR',ftString,tsNinguno,tsNinguno,False);
                NOMBRE_OTORGANTE_ANTERIOR.Caption:='Nombre Otorgante Anterior';
      CLAVE_OTORGANTE_ANTERIOR :=CreaCampo('CLAVE_OTORGANTE_ANTERIOR',ftString,tsNinguno,tsNinguno,False);
                CLAVE_OTORGANTE_ANTERIOR.Caption:='Clave Otorgante Anterior';
      NUMERO_CUENTA_ANTERIOR :=CreaCampo('NUMERO_CUENTA_ANTERIOR',ftString,tsNinguno,tsNinguno,False);
                NUMERO_CUENTA_ANTERIOR.Caption:='Numero Cuenta Anterior';
      BLOQUEO :=CreaCampo('BLOQUEO',ftString,tsNinguno,tsNinguno,False);
                BLOQUEO.Caption:='Bloqueo';
      FECHA_PRIMER_INCUM :=CreaCampo('FECHA_PRIMER_INCUM',ftDate,tsNinguno,tsNinguno,False);
                FECHA_PRIMER_INCUM.Caption:='Fecha Primer Incum';
      CLAVE_CONSOLIDA_EM :=CreaCampo('CLAVE_CONSOLIDA_EM',ftString,tsNinguno,tsNinguno,False);
                CLAVE_CONSOLIDA_EM.Caption:='Clave Consolida Em';
      SALDO_INSOLUTO :=CreaCampo('SALDO_INSOLUTO',ftFloat,tsNinguno,tsNinguno,False);
                SALDO_INSOLUTO.Caption:='Saldo Insoluto';
      //FJR 13.06.2013
      MONTO_ULTIMO_PAGO :=CreaCampo('MONTO_ULTIMO_PAGO',ftFloat,tsNinguno,tsNinguno,False);
                MONTO_ULTIMO_PAGO.Caption:='Monto Ultimo Pago';
      //FJR 27.08.2013
      TIPO_CARTERA :=CreaCampo('TIPO_CARTERA',ftString,tsNinguno,tsNinguno,True);
                TIPO_CARTERA.Caption:='Tipo Cartera';
      SIT_VC_HISTO :=CreaCampo('SIT_VC_HISTO',ftString,tsNinguno,tsNinguno,False);
      {With SIT_VC_HISTO do
       begin Size:=2;
             UseCombo:=True;
             ComboLista.Add('CA'); ComboDatos.Add('CA');
             ComboLista.Add('IN'); ComboDatos.Add('IN');
             ComboLista.Add('AC'); ComboDatos.Add('AC');
       end;  }
                SIT_VC_HISTO.Caption:='Situación Venta Cartera';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,False);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,False);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,False);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,False);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';

      F_PROCESO :=CreaCampo('F_PROCESO',ftDate,tsNinguno,tsNinguno,False);
                  F_PROCESO.Caption:='Fecha Proceso';

      FKeyFields.Add('TIPO_CARGA');
      FKeyFields.Add('NUMERO_CUENTA');
      FKeyFields.Add('TIPO_CARTERA');

      TableName := 'BC_LAYOUT_VC';
      UseQuery := True; 
      HelpFile := 'IntBcLayVC.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TBcLayVC.Destroy;
begin inherited;
end;


function TBcLayVC.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWBcLayVC;
begin
   W:=TWBcLayVC.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.ShowBtnNuevo:= false;
      W.InterForma1.ShowBtnModificar:= false;
      W.Interforma1.ShowBtnCancelar:= false;
      W.InterForma1.ShowBtnAceptar:= false;
      W.InterForma1.ShowBtnEliminar:= false;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TBcLayVC.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IBcLaVc.it','S,S,S');
      Try if Active then begin T.Param(0,TIPO_CARGA.AsString); 
                               T.Param(1,NUMERO_CUENTA.AsString);
                               T.Param(2,TIPO_CARTERA.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end; 
end;

function TBcLayVC.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************FORMA BC_LAYOUT_VC ********************)
(*                                                            *)
(*  FORMA DE BC_LAYOUT_VC                                     *)
(*                                                            *)
(***********************FORMA BC_LAYOUT_VC ********************)

procedure TWBcLayVC.FormShow(Sender: TObject);
begin
      Objeto.TIPO_CARGA.Control:=edTIPO_CARGA;
      Objeto.NUMERO_CUENTA.Control:=edNUMERO_CUENTA;
      Objeto.UID_CUS.Control:=edUID_CUS;
      Objeto.RFC.Control:=edRFC;
      Objeto.PRIMER_NOMBRE.Control:=edPRIMER_NOMBRE;
      Objeto.SEGUNDO_NOMBRE.Control:=edSEGUNDO_NOMBRE;
      Objeto.APELLIDO_PATERNO.Control:=edAPELLIDO_PATERNO;
      Objeto.APELLIDO_MATERNO.Control:=edAPELLIDO_MATERNO;
      Objeto.APELLIDO_ADICIONAL.Control:=edAPELLIDO_ADICIONAL;
      Objeto.FECHA_NACIMIENTO.Control:=edFECHA_NACIMIENTO;
      Objeto.SEXO.Control:=edSEXO;
      Objeto.ESTADO_CIVIL.Control:=edESTADO_CIVIL;
      Objeto.NAT.Control:=edNAT;
      Objeto.ECON_ACT.Control:=edECON_ACT;
      Objeto.TIPO_CLIENTE.Control:=edTIPO_CLIENTE;
      Objeto.INDICADOR_DEFUNCION.Control:=edINDICADOR_DEFUNCION;
      Objeto.FECHA_DEFUNCION.Control:=edFECHA_DEFUNCION;
      Objeto.PAIS.Control:=edPAIS;
      Objeto.ESTADO.Control:=edESTADO;
      Objeto.NOM_CIT.Control:=edNOM_CIT;
      Objeto.DELEGACION_MUNICIPIO.Control:=edDELEGACION_MUNICIPIO;
      Objeto.COLONIA_POBLACION.Control:=edCOLONIA_POBLACION;
      Objeto.NUMERO_EXTERIOR.Control:=edNUMERO_EXTERIOR;
      Objeto.CODIGO_POSTAL.Control:=edCODIGO_POSTAL;
      Objeto.NUMERO_TELEFONO.Control:=edNUMERO_TELEFONO;
      Objeto.EXTENSION_TELEFONICA.Control:=edEXTENSION_TELEFONICA;
      Objeto.TIPO_DOMICILIO.Control:=edTIPO_DOMICILIO;
      Objeto.TIPO_RESPONSABILIDAD.Control:=edTIPO_RESPONSABILIDAD;
      {Objeto.TIPO_CONTRATO.Control:=edTIPO_CONTRATO;
      Objeto.TIPO_CREDITO.Control:=edTIPO_CREDITO;
      Objeto.CLAVE_MONEDA.Control:=edCLAVE_MONEDA;
      Objeto.FECHA_APERTURA.Control:=edFECHA_APERTURA;
      Objeto.FECHA_REESTRUCTURA.Control:=edFECHA_REESTRUCTURA;
      Objeto.NUMERO_PAGOS.Control:=edNUMERO_PAGOS;
      Objeto.EXPERIENCIAS_CREDITICIAS.Control:=edEXPERIENCIAS_CREDITICIAS;
      Objeto.CLAVE_FRECUENCIA_PAGOS.Control:=edCLAVE_FRECUENCIA_PAGOS;
      Objeto.CLAVE_FRECUENCIA_PAGOS_NUM.Control:=edCLAVE_FRECUENCIA_PAGOS_NUM;
      Objeto.LIMITE_CREDITO.Control:=edLIMITE_CREDITO;
      Objeto.CREDITO_MAXIMO.Control:=edCREDITO_MAXIMO;
      Objeto.SALDO_INICIAL.Control:=edSALDO_INICIAL;
      Objeto.SALDO_ACTUAL.Control:=edSALDO_ACTUAL;
      Objeto.SALDO_VENCIDO.Control:=edSALDO_VENCIDO;
      Objeto.PAGOS_VENCIDOS.Control:=edPAGOS_VENCIDOS;
      Objeto.DIAS_VENCIDO.Control:=edDIAS_VENCIDO;
      Objeto.MONTO_A_PAGAR.Control:=edMONTO_A_PAGAR;
      Objeto.PLAZO.Control:=edPLAZO;
      Objeto.IMPORTE_AVALUO.Control:=edIMPORTE_AVALUO;
      Objeto.GARANTIA.Control:=edGARANTIA;
      Objeto.IMPORTE_PAGO.Control:=edIMPORTE_PAGO;
      Objeto.PAGO_EFECTIVO.Control:=edPAGO_EFECTIVO;
      Objeto.SALDO_QUITA.Control:=edSALDO_QUITA;
      Objeto.SALDO_DACION.Control:=edSALDO_DACION;
      Objeto.QUEBRANTO.Control:=edQUEBRANTO;
      Objeto.FECHA_ULTIMO_PAGO.Control:=edFECHA_ULTIMO_PAGO;
      Objeto.FECHA_ULTIMA_COMPRA.Control:=edFECHA_ULTIMA_COMPRA;
      Objeto.FECHA_QUEBRANTO.Control:=edFECHA_QUEBRANTO;
      Objeto.FECHA_LIQUIDACION.Control:=edFECHA_LIQUIDACION;
      Objeto.FECHA_CIERRE.Control:=edFECHA_CIERRE;
      Objeto.CLAVE_OBSERVACION.Control:=edCLAVE_OBSERVACION;
      Objeto.CALIFICACION_CARTERA.Control:=edCALIFICACION_CARTERA;
      Objeto.CUENTA_CONTABLE.Control:=edCUENTA_CONTABLE;
      Objeto.NUMERO_CONTRATO_ANTERIOR.Control:=edNUMERO_CONTRATO_ANTERIOR;
      Objeto.NOMBRE_OTORGANTE_ANTERIOR.Control:=edNOMBRE_OTORGANTE_ANTERIOR;
      Objeto.CLAVE_OTORGANTE_ANTERIOR.Control:=edCLAVE_OTORGANTE_ANTERIOR;
      Objeto.NUMERO_CUENTA_ANTERIOR.Control:=edNUMERO_CUENTA_ANTERIOR;
      Objeto.BLOQUEO.Control:=edBLOQUEO;
      Objeto.FECHA_PRIMER_INCUM.Control:=edFECHA_PRIMER_INCUM;
      Objeto.CLAVE_CONSOLIDA_EM.Control:=edCLAVE_CONSOLIDA_EM;
      Objeto.SALDO_INSOLUTO.Control:=edSALDO_INSOLUTO;
      Objeto.MONTO_ULTIMO_PAGO.Control:= edMONTO_ULTIMO_PAGO; // FJR 13.06.2013
      Objeto.TIPO_CARTERA.Control:= edTIPO_CARTERA; // FJR 27.08.2013
      Objeto.SIT_VC_NO_USU.Control:=cbSIT_VC_NO_USU;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control:=edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;

      cbSIT_VC_NO_USU.Items.Clear ;
      cbSIT_VC_NO_USU.Items.Append('CA') ;
      cbSIT_VC_NO_USU.Items.Append('IN') ;
      cbSIT_VC_NO_USU.Items.Append('AC') ;  }
end;

procedure TWBcLayVC.FormDestroy(Sender: TObject);
begin
      Objeto.TIPO_CARGA.Control:=nil;
      Objeto.NUMERO_CUENTA.Control:=nil;
      Objeto.UID_CUS.Control:=nil;
      Objeto.RFC.Control:=nil;
      Objeto.PRIMER_NOMBRE.Control:=nil;
      Objeto.SEGUNDO_NOMBRE.Control:=nil;
      Objeto.APELLIDO_PATERNO.Control:=nil;
      Objeto.APELLIDO_MATERNO.Control:=nil;
      Objeto.APELLIDO_ADICIONAL.Control:=nil;
      Objeto.FECHA_NACIMIENTO.Control:=nil;
      Objeto.SEXO.Control:=nil;
      Objeto.ESTADO_CIVIL.Control:=nil;
      Objeto.NAT.Control:=nil;
      Objeto.ECON_ACT.Control:=nil;
      Objeto.TIPO_CLIENTE.Control:=nil;
      Objeto.INDICADOR_DEFUNCION.Control:=nil;
      Objeto.FECHA_DEFUNCION.Control:=nil;
      Objeto.PAIS.Control:=nil;
      Objeto.ESTADO.Control:=nil;
      Objeto.NOM_CIT.Control:=nil;
      Objeto.DELEGACION_MUNICIPIO.Control:=nil;
      Objeto.COLONIA_POBLACION.Control:=nil;
      Objeto.NUMERO_EXTERIOR.Control:=nil;
      Objeto.CODIGO_POSTAL.Control:=nil;
      Objeto.NUMERO_TELEFONO.Control:=nil;
      Objeto.EXTENSION_TELEFONICA.Control:=nil;
      Objeto.TIPO_DOMICILIO.Control:=nil;
      Objeto.TIPO_RESPONSABILIDAD.Control:=nil;
      {Objeto.TIPO_CONTRATO.Control:=nil;
      Objeto.TIPO_CREDITO.Control:=nil;
      Objeto.CLAVE_MONEDA.Control:=nil;
      Objeto.FECHA_APERTURA.Control:=nil;
      Objeto.FECHA_REESTRUCTURA.Control:=nil;
      Objeto.NUMERO_PAGOS.Control:=nil;
      Objeto.EXPERIENCIAS_CREDITICIAS.Control:=nil;
      Objeto.CLAVE_FRECUENCIA_PAGOS.Control:=nil;
      Objeto.CLAVE_FRECUENCIA_PAGOS_NUM.Control:=nil;
      Objeto.LIMITE_CREDITO.Control:=nil;
      Objeto.CREDITO_MAXIMO.Control:=nil;
      Objeto.SALDO_INICIAL.Control:=nil;
      Objeto.SALDO_ACTUAL.Control:=nil;
      Objeto.SALDO_VENCIDO.Control:=nil;
      Objeto.PAGOS_VENCIDOS.Control:=nil;
      Objeto.DIAS_VENCIDO.Control:=nil;
      Objeto.MONTO_A_PAGAR.Control:=nil;
      Objeto.PLAZO.Control:=nil;
      Objeto.IMPORTE_AVALUO.Control:=nil;
      Objeto.GARANTIA.Control:=nil;
      Objeto.IMPORTE_PAGO.Control:=nil;
      Objeto.PAGO_EFECTIVO.Control:=nil;
      Objeto.SALDO_QUITA.Control:=nil;
      Objeto.SALDO_DACION.Control:=nil;
      Objeto.QUEBRANTO.Control:=nil;
      Objeto.FECHA_ULTIMO_PAGO.Control:=nil;
      Objeto.FECHA_ULTIMA_COMPRA.Control:=nil;
      Objeto.FECHA_QUEBRANTO.Control:=nil;
      Objeto.FECHA_LIQUIDACION.Control:=nil;
      Objeto.FECHA_CIERRE.Control:=nil;
      Objeto.CLAVE_OBSERVACION.Control:=nil;
      Objeto.CALIFICACION_CARTERA.Control:=nil;
      Objeto.CUENTA_CONTABLE.Control:=nil;
      Objeto.NUMERO_CONTRATO_ANTERIOR.Control:=nil;
      Objeto.NOMBRE_OTORGANTE_ANTERIOR.Control:=nil;
      Objeto.CLAVE_OTORGANTE_ANTERIOR.Control:=nil;
      Objeto.NUMERO_CUENTA_ANTERIOR.Control:=nil;
      Objeto.BLOQUEO.Control:=nil;
      Objeto.FECHA_PRIMER_INCUM.Control:=nil;
      Objeto.CLAVE_CONSOLIDA_EM.Control:=nil;
      Objeto.SALDO_INSOLUTO.Control:=nil;
      Objeto.MONTO_ULTIMO_PAGO.Control:=nil; //FJR 13.06.2013
      Objeto.TIPO_CARTERA.Control:= nil; // FJR 27.08.2013
      Objeto.SIT_VC_NO_USU.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
   //Objeto }
end;

procedure TWBcLayVC.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWBcLayVC.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWBcLayVC.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWBcLayVC.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;

function TWBcLayVC.ValidaArchivo: Boolean;  // FJR 12.09.2013
begin
  Result:= True;
end;

(******************** CARGA DE DATOS EN BLOQUE *********************************)
function TWBcLayVC.CargaDatos(Accion: Integer): Boolean;
var
  STPVC: TStoredProc;
begin
  STPVC:= TStoredProc.Create(Self);
  try
     With STPVC do begin
        StoredProcName := 'PKGBURO.STP_VENTA_CARTERA';
        DatabaseName   := Objeto.Apli.DatabaseName;
        SessionName    := Objeto.Apli.SessionName;

        Params.Clear;

        Params.CreateParam(ftFloat, 'pe_Accion',  ptInput);
        Params.CreateParam(ftFloat, 'pe_ID_CSC',  ptInput);
        Params.CreateParam(ftDate, 'pe_F_PROCESO',  ptInput);
        Params.CreateParam(ftString, 'pe_TIPO_CARGA',  ptInput);
        Params.CreatePAram(ftString, 'pe_TIPO_CARTERA',  ptInput);
        Params.CreateParam(ftString, 'pe_NUMERO_CUENTA',  ptInput);
        Params.CreateParam(ftString, 'pe_UID_CUS',  ptInput);
        Params.CreateParam(ftString, 'pe_RFC',  ptInput);
        Params.CreateParam(ftString, 'pe_PRIMER_NOMBRE',  ptInput);
        Params.CreateParam(ftString, 'pe_SEGUNDO_NOMBRE',  ptInput);
        Params.CreateParam(ftString, 'pe_APELLIDO_PATERNO',  ptInput);
        Params.CreateParam(ftString, 'pe_APELLIDO_MATERNO',  ptInput);
        Params.CreateParam(ftString, 'pe_APELLIDO_ADICIONAL',  ptInput);
        Params.CreateParam(ftDate, 'pe_FECHA_NACIMIENTO',  ptInput);
        Params.CreateParam(ftString, 'pe_SEXO',  ptInput);
        Params.CreateParam(ftString, 'pe_ESTADO_CIVIL',  ptInput);
        Params.CreateParam(ftString, 'pe_NAT',  ptInput);
        Params.CreateParam(ftString, 'pe_ECON_ACT',  ptInput);
        Params.CreateParam(ftFloat, 'pe_TIPO_CLIENTE',  ptInput);
        Params.CreateParam(ftString, 'pe_INDICADOR_DEFUNCION',  ptInput);
        Params.CreateParam(ftDate, 'pe_FECHA_DEFUNCION',  ptInput);
        Params.CreateParam(ftString, 'pe_PAIS',  ptInput);
        Params.CreateParam(ftString, 'pe_ESTADO',  ptInput);
        Params.CreateParam(ftString, 'pe_NOM_CIT',  ptInput);
        Params.CreateParam(ftString, 'pe_DELEGACION_MUNICIPIO',  ptInput);
        Params.CreateParam(ftString, 'pe_COLONIA_POBLACION',  ptInput);
        Params.CreateParam(ftString, 'pe_NUMERO_EXTERIOR',  ptInput);
        Params.CreateParam(ftString, 'pe_CODIGO_POSTAL',  ptInput);
        Params.CreateParam(ftFloat, 'pe_NUMERO_TELEFONO',  ptInput);
        Params.CreateParam(ftFloat, 'pe_EXTENSION_TELEFONICA',  ptInput);
        Params.CreateParam(ftString, 'pe_TIPO_DOMICILIO',  ptInput);
        Params.CreateParam(ftString, 'pe_TIPO_RESPONSABILIDAD',  ptInput);
        Params.CreateParam(ftString, 'pe_TIPO_CONTRATO',  ptInput);
        Params.CreateParam(ftString, 'pe_TIPO_CREDITO',  ptInput);
        Params.CreateParam(ftString, 'pe_CLAVE_MONEDA',  ptInput);
        Params.CreateParam(ftDate, 'pe_FECHA_APERTURA',  ptInput);
        Params.CreateParam(ftDate, 'pe_FECHA_REESTRUCTURA',  ptInput);
        Params.CreateParam(ftFloat, 'pe_NUMERO_PAGOS',  ptInput);
        Params.CreateParam(ftFloat, 'pe_EXPERIENCIAS_CREDITICIAS',  ptInput);
        Params.CreateParam(ftString, 'pe_CLAVE_FRECUENCIA_PAGOS',  ptInput);
        Params.CreateParam(ftFloat, 'pe_CLAVE_FRECUENCIA_PAGOS_NUM',  ptInput);
        Params.CreateParam(ftFloat, 'pe_LIMITE_CREDITO',  ptInput);
        Params.CreateParam(ftFloat, 'pe_CREDITO_MAXIMO',  ptInput);
        Params.CreateParam(ftFloat, 'pe_SALDO_INICIAL',  ptInput);
        Params.CreateParam(ftFloat, 'pe_SALDO_ACTUAL',  ptInput);
        Params.CreateParam(ftFloat, 'pe_SALDO_VENCIDO',  ptInput);
        Params.CreateParam(ftFloat, 'pe_PAGOS_VENCIDOS',  ptInput);
        Params.CreateParam(ftFloat, 'pe_DIAS_VENCIDO',  ptInput);
        Params.CreateParam(ftFloat, 'pe_MONTO_A_PAGAR',  ptInput);
        Params.CreateParam(ftFloat, 'pe_PLAZO',  ptInput);
        Params.CreateParam(ftFloat, 'pe_IMPORTE_AVALUO',  ptInput);
        Params.CreateParam(ftFloat, 'pe_GARANTIA',  ptInput);
        Params.CreateParam(ftFloat, 'pe_IMPORTE_PAGO',  ptInput);
        Params.CreateParam(ftFloat, 'pe_PAGO_EFECTIVO',  ptInput);
        Params.CreateParam(ftFloat, 'pe_SALDO_QUITA',  ptInput);
        Params.CreateParam(ftFloat, 'pe_SALDO_DACION',  ptInput);
        Params.CreateParam(ftFloat, 'pe_QUEBRANTO',  ptInput);
        Params.CreateParam(ftDate, 'pe_FECHA_ULTIMO_PAGO',  ptInput);
        Params.CreateParam(ftDate, 'pe_FECHA_ULTIMA_COMPRA',  ptInput);
        Params.CreateParam(ftDate, 'pe_FECHA_QUEBRANTO',  ptInput);
        Params.CreateParam(ftDate, 'pe_FECHA_LIQUIDACION',  ptInput);
        Params.CreateParam(ftDate, 'pe_FECHA_CIERRE',  ptInput);
        Params.CreateParam(ftString, 'pe_CLAVE_OBSERVACION',  ptInput);
        Params.CreateParam(ftString, 'pe_CALIFICACION_CARTERA',  ptInput);
        Params.CreateParam(ftString, 'pe_CUENTA_CONTABLE',  ptInput);
        Params.CreateParam(ftString, 'pe_NUMERO_CONTRATO_ANTERIOR',  ptInput);
        Params.CreateParam(ftString, 'pe_NOMBRE_OTORGANTE_ANTERIOR',  ptInput);
        Params.CreateParam(ftString, 'pe_CLAVE_OTORGANTE_ANTERIOR',  ptInput);
        Params.CreateParam(ftString, 'pe_NUMERO_CUENTA_ANTERIOR',  ptInput);
        Params.CreateParam(ftString, 'pe_BLOQUEO',  ptInput);
        Params.CreateParam(ftDate, 'pe_FECHA_PRIMER_INCUM',  ptInput);
        Params.CreateParam(ftString, 'pe_CLAVE_CONSOLIDA_EM',  ptInput);
        Params.CreateParam(ftString, 'pe_SIT_VC_HISTO',  ptInput);
        Params.CreateParam(ftDate, 'pe_F_ALTA',  ptInput);
        Params.CreateParam(ftString, 'pe_CVE_USU_ALTA',  ptInput);
        Params.CreateParam(ftDate, 'pe_F_MODIFICA',  ptInput);
        Params.CreateParam(ftString, 'pe_CVE_USU_MODIFICA',  ptInput);
        Params.CreateParam(ftFloat, 'pe_SALDO_INSOLUTO',  ptInput);
        Params.CreateParam(ftFloat, 'pe_MONTO_ULTIMO_PAGO',  ptInput); // FJR 13.06.2013
        Params.CreateParam(ftString, 'pe_BCommit',  ptInput);
        Params.CreateParam(ftFloat,'ps_Resultado',ptOutput);
        Params.CreateParam(ftString,'ps_Tx_Resultado',ptOutput);

        ParamByName('pe_Accion').AsFloat := Accion;
        ParamByName('pe_ID_CSC').AsFloat := Csc;
        ParamByName('pe_F_PROCESO').AsDate := Objeto.F_PROCESO.AsDateTime;  // FJR PROBANDO
        ParamByName('pe_TIPO_CARGA').AsString := Objeto.TIPO_CARGA.AsString;
        ParamByName('pe_TIPO_CARTERA').AsString:= Objeto.TIPO_CARTERA.AsString;
        ParamByName('pe_NUMERO_CUENTA').AsString := Objeto.NUMERO_CUENTA.AsString;
        ParamByName('pe_UID_CUS').AsString := Trim(Objeto.UID_CUS.AsString);
        ParamByName('pe_RFC').AsString := Objeto.RFC.AsString;
        ParamByName('pe_PRIMER_NOMBRE').AsString := Objeto.PRIMER_NOMBRE.AsString;
        ParamByName('pe_SEGUNDO_NOMBRE').AsString := Objeto.SEGUNDO_NOMBRE.AsString;
        ParamByName('pe_APELLIDO_PATERNO').AsString := Objeto.APELLIDO_PATERNO.AsString;
        ParamByName('pe_APELLIDO_MATERNO').AsString := Objeto.APELLIDO_MATERNO.AsString;
        ParamByName('pe_APELLIDO_ADICIONAL').AsString := Objeto.APELLIDO_ADICIONAL.AsString;
        ParamByName('pe_FECHA_NACIMIENTO').AsDate := Objeto.FECHA_NACIMIENTO.AsDateTime;
        ParamByName('pe_SEXO').AsString := Objeto.SEXO.AsString;
        ParamByName('pe_ESTADO_CIVIL').AsString := Objeto.ESTADO_CIVIL.AsString;
        ParamByName('pe_NAT').AsString := Objeto.NAT.AsString;
        ParamByName('pe_ECON_ACT').AsString := Objeto.ECON_ACT.AsString;
        ParamByName('pe_TIPO_CLIENTE').AsFloat := Objeto.TIPO_CLIENTE.AsFloat;
        ParamByName('pe_INDICADOR_DEFUNCION').AsString := Objeto.INDICADOR_DEFUNCION.AsString;
        ParamByName('pe_FECHA_DEFUNCION').AsDate := Objeto.FECHA_DEFUNCION.AsDateTime;
        ParamByName('pe_PAIS').AsString := Objeto.PAIS.AsString;
        ParamByName('pe_ESTADO').AsString := Objeto.ESTADO.AsString;
        ParamByName('pe_NOM_CIT').AsString := Objeto.NOM_CIT.AsString;
        ParamByName('pe_DELEGACION_MUNICIPIO').AsString := Objeto.DELEGACION_MUNICIPIO.AsString;
        ParamByName('pe_COLONIA_POBLACION').AsString := Objeto.COLONIA_POBLACION.AsString;
        ParamByName('pe_NUMERO_EXTERIOR').AsString := Objeto.NUMERO_EXTERIOR.AsString;
        ParamByName('pe_CODIGO_POSTAL').AsString := Objeto.CODIGO_POSTAL.AsString;
        ParamByName('pe_NUMERO_TELEFONO').AsFloat := Objeto.NUMERO_TELEFONO.AsFloat;
        ParamByName('pe_EXTENSION_TELEFONICA').AsFloat := Objeto.EXTENSION_TELEFONICA.AsFloat;
        ParamByName('pe_TIPO_DOMICILIO').AsString := Objeto.TIPO_DOMICILIO.AsString;
        ParamByName('pe_TIPO_RESPONSABILIDAD').AsString := Objeto.TIPO_RESPONSABILIDAD.AsString;
        ParamByName('pe_TIPO_CONTRATO').AsString := Objeto.TIPO_CONTRATO.AsString;
        ParamByName('pe_TIPO_CREDITO').AsString := Objeto.TIPO_CREDITO.AsString;
        ParamByName('pe_CLAVE_MONEDA').AsString := Objeto.CLAVE_MONEDA.AsString;
        ParamByName('pe_FECHA_APERTURA').AsDate := Objeto.FECHA_APERTURA.AsDateTime;
        ParamByName('pe_FECHA_REESTRUCTURA').AsDate := Objeto.FECHA_REESTRUCTURA.AsDateTime;
        ParamByName('pe_NUMERO_PAGOS').AsFloat := Objeto.NUMERO_PAGOS.AsFloat;
        ParamByName('pe_EXPERIENCIAS_CREDITICIAS').AsFloat := Objeto.EXPERIENCIAS_CREDITICIAS.AsFloat;
        ParamByName('pe_CLAVE_FRECUENCIA_PAGOS').AsString := Objeto.CLAVE_FRECUENCIA_PAGOS.AsString;
        ParamByName('pe_CLAVE_FRECUENCIA_PAGOS_NUM').AsFloat := Objeto.CLAVE_FRECUENCIA_PAGOS_NUM.AsFloat;
        ParamByName('pe_LIMITE_CREDITO').AsFloat := Objeto.LIMITE_CREDITO.AsFloat;
        ParamByName('pe_CREDITO_MAXIMO').AsFloat := Objeto.CREDITO_MAXIMO.AsFloat;
        ParamByName('pe_SALDO_INICIAL').AsFloat := Objeto.SALDO_INICIAL.AsFloat;
        ParamByName('pe_SALDO_ACTUAL').AsFloat := Objeto.SALDO_ACTUAL.AsFloat;
        ParamByName('pe_SALDO_VENCIDO').AsFloat := Objeto.SALDO_VENCIDO.AsFloat;
        ParamByName('pe_PAGOS_VENCIDOS').AsFloat := Objeto.PAGOS_VENCIDOS.AsFloat;
        ParamByName('pe_DIAS_VENCIDO').AsFloat := Objeto.DIAS_VENCIDO.AsFloat;
        ParamByName('pe_MONTO_A_PAGAR').AsFloat := Objeto.MONTO_A_PAGAR.AsFloat;
        ParamByName('pe_PLAZO').AsFloat := Objeto.PLAZO.AsFloat;
        ParamByName('pe_IMPORTE_AVALUO').AsFloat := Objeto.IMPORTE_AVALUO.AsFloat;
        ParamByName('pe_GARANTIA').AsFloat := Objeto.GARANTIA.AsFloat;
        ParamByName('pe_IMPORTE_PAGO').AsFloat := Objeto.IMPORTE_PAGO.AsFloat;
        ParamByName('pe_PAGO_EFECTIVO').AsFloat := Objeto.PAGO_EFECTIVO.AsFloat;
        ParamByName('pe_SALDO_QUITA').AsFloat := Objeto.SALDO_QUITA.AsFloat;
        ParamByName('pe_SALDO_DACION').AsFloat := Objeto.SALDO_DACION.AsFloat;
        ParamByName('pe_QUEBRANTO').AsFloat := Objeto.QUEBRANTO.AsFloat;
        ParamByName('pe_FECHA_ULTIMO_PAGO').AsDate := Objeto.FECHA_ULTIMO_PAGO.AsDateTime;
        ParamByName('pe_FECHA_ULTIMA_COMPRA').AsDate := Objeto.FECHA_ULTIMA_COMPRA.AsDateTime;
        ParamByName('pe_FECHA_QUEBRANTO').AsDate := Objeto.FECHA_QUEBRANTO.AsDateTime;
        ParamByName('pe_FECHA_LIQUIDACION').AsDate := Objeto.FECHA_LIQUIDACION.AsDateTime;
        ParamByName('pe_FECHA_CIERRE').AsDate := Objeto.FECHA_CIERRE.AsDateTime;
        ParamByName('pe_CLAVE_OBSERVACION').AsString := Objeto.CLAVE_OBSERVACION.AsString;
        ParamByName('pe_CALIFICACION_CARTERA').AsString := Objeto.CALIFICACION_CARTERA.AsString;
        ParamByName('pe_CUENTA_CONTABLE').AsString := Objeto.CUENTA_CONTABLE.AsString;
        ParamByName('pe_NUMERO_CONTRATO_ANTERIOR').AsString := Objeto.NUMERO_CONTRATO_ANTERIOR.AsString;
        ParamByName('pe_NOMBRE_OTORGANTE_ANTERIOR').AsString := Objeto.NOMBRE_OTORGANTE_ANTERIOR.AsString;
        ParamByName('pe_CLAVE_OTORGANTE_ANTERIOR').AsString := Objeto.CLAVE_OTORGANTE_ANTERIOR.AsString;
        ParamByName('pe_NUMERO_CUENTA_ANTERIOR').AsString := Objeto.NUMERO_CUENTA_ANTERIOR.AsString;
        ParamByName('pe_BLOQUEO').AsString := Objeto.BLOQUEO.AsString;
        ParamByName('pe_FECHA_PRIMER_INCUM').AsDate := Objeto.FECHA_PRIMER_INCUM.AsDateTime;
        ParamByName('pe_CLAVE_CONSOLIDA_EM').AsString := Objeto.CLAVE_CONSOLIDA_EM.AsString;
        ParamByName('pe_SALDO_INSOLUTO').AsFloat := Objeto.SALDO_INSOLUTO.AsFloat;
        ParamByName('pe_MONTO_ULTIMO_PAGO').AsFloat := Objeto.MONTO_ULTIMO_PAGO.AsFloat;  // FJR 13.06.2013
        ParamByName('pe_SIT_VC_HISTO').AsString := Objeto.SIT_VC_HISTO.AsString;
        ParamByName('pe_F_ALTA').AsDate := Objeto.F_ALTA.AsDateTime;
        ParamByName('pe_CVE_USU_ALTA').AsString := Objeto.CVE_USU_ALTA.AsString;
        ParamByName('pe_F_MODIFICA').AsDate := Objeto.F_MODIFICA.AsDateTime;
        ParamByName('pe_CVE_USU_MODIFICA').AsString := Objeto.CVE_USU_MODIFICA.AsString;
        ParamByName('pe_BCommit').AsString := 'V';
        ExecProc;
     end ;

     if (STPVC.ParamByName('ps_Resultado').AsInteger = 0) then
         Result:= True
     else
         Result:= False;
  finally
     STPVC.Free ;
  end ;

end;

procedure TWBcLayVC.MuestraDatos ;
var
   vlQry : TQuery;
   sSQL :String;
begin
   QryHistoVC.Close;
   QryHistoVC.SQL.Clear;
   QryHistoVC.DataBaseName:= Objeto.Apli.DataBaseName;
   QryHistoVC.SessionName:= Objeto.Apli.SessionName;

   sSQL:='SELECT F_PROCESO, ID_CSC, TIPO_CARGA, TIPO_CARTERA, NUMERO_CUENTA, UID_CUS, '+
               ' TIPO_CONTRATO, TIPO_CREDITO, CLAVE_MONEDA, FECHA_APERTURA, FECHA_REESTRUCTURA, NUMERO_PAGOS,'+
               ' EXPERIENCIAS_CREDITICIAS, CLAVE_FRECUENCIA_PAGOS, CLAVE_FRECUENCIA_PAGOS_NUM, LIMITE_CREDITO, CREDITO_MAXIMO,'+
               ' SALDO_INICIAL, SALDO_ACTUAL, SALDO_VENCIDO, PAGOS_VENCIDOS, DIAS_VENCIDO, MONTO_A_PAGAR,'+
               ' PLAZO, IMPORTE_AVALUO, GARANTIA, IMPORTE_PAGO, PAGO_EFECTIVO, SALDO_QUITA, SALDO_DACION, QUEBRANTO,'+
               ' FECHA_ULTIMO_PAGO, FECHA_ULTIMA_COMPRA, FECHA_QUEBRANTO, FECHA_LIQUIDACION, FECHA_CIERRE, CLAVE_OBSERVACION,'+
               ' CALIFICACION_CARTERA, CUENTA_CONTABLE, NUMERO_CONTRATO_ANTERIOR, NOMBRE_OTORGANTE_ANTERIOR,'+
               ' CLAVE_OTORGANTE_ANTERIOR, NUMERO_CUENTA_ANTERIOR, BLOQUEO, FECHA_PRIMER_INCUM, CLAVE_CONSOLIDA_EM,'+
               ' SALDO_INSOLUTO, MONTO_ULTIMO_PAGO, SIT_VC_HISTO, F_ALTA, CVE_USU_ALTA, F_MODIFICA, CVE_USU_MODIFICA '+
         '  FROM  BC_LAYOUT_VC_HISTO '+
         ' WHERE  TIPO_CARTERA = '''+Objeto.TIPO_CARTERA.AsString+''' '+
         '   AND  NUMERO_CUENTA = '''+Objeto.NUMERO_CUENTA.AsString+''' '+
         '   AND  UID_CUS = '''+Objeto.UID_CUS.AsString+''' '+
         ' ORDER BY F_PROCESO DESC, ID_CSC DESC';
   QryHistoVC.SQL.Add(sSQL);
   QryHistoVC.Open;

   If QryHistoVC.RecordCount = 0 then begin
      ShowMessage('Sin información');
      Exit;
   end
   else begin
            QryHistoVC.FieldByName('F_PROCESO').DisplayLabel := 'Fch Proceso';
            QryHistoVC.FieldByName('ID_CSC').DisplayLabel := 'Csc';
            QryHistoVC.FieldByName('TIPO_CARGA').DisplayLabel := 'T Carga';
            QryHistoVC.FieldByName('TIPO_CARTERA').DisplayLabel := 'T Cart';
            QryHistoVC.FieldByName('NUMERO_CUENTA').DisplayLabel := 'Crédito';
            QryHistoVC.FieldByName('UID_CUS').DisplayLabel := 'Uid Cus';
            QryHistoVC.FieldByName('TIPO_CONTRATO').DisplayLabel := 'T Contr';
            QryHistoVC.FieldByName('TIPO_CREDITO').DisplayLabel := 'T Cred';
            QryHistoVC.FieldByName('CLAVE_MONEDA').DisplayLabel := 'Moneda';
            QryHistoVC.FieldByName('FECHA_APERTURA').DisplayLabel := 'Fch Apertura';
            QryHistoVC.FieldByName('FECHA_REESTRUCTURA').DisplayLabel := 'Fch Restruct';
            QryHistoVC.FieldByName('NUMERO_PAGOS').DisplayLabel := 'Pagos';
            QryHistoVC.FieldByName('EXPERIENCIAS_CREDITICIAS').DisplayLabel := 'Exp Cred';
            QryHistoVC.FieldByName('CLAVE_FRECUENCIA_PAGOS').DisplayLabel := 'Cve Frec P';
            QryHistoVC.FieldByName('CLAVE_FRECUENCIA_PAGOS_NUM').DisplayLabel := 'Frec Pagos';
            QryHistoVC.FieldByName('LIMITE_CREDITO').DisplayLabel := 'Limite Crédito';
            QryHistoVC.FieldByName('CREDITO_MAXIMO').DisplayLabel := 'Cred Max';
            QryHistoVC.FieldByName('SALDO_INICIAL').DisplayLabel := 'Sdo Ini';
            QryHistoVC.FieldByName('SALDO_ACTUAL').DisplayLabel := 'Sdo Act';
            QryHistoVC.FieldByName('SALDO_VENCIDO').DisplayLabel := 'Sdo Venc';
            QryHistoVC.FieldByName('PAGOS_VENCIDOS').DisplayLabel := 'Pagos Venc';
            QryHistoVC.FieldByName('DIAS_VENCIDO').DisplayLabel := 'Dias Venc';
            QryHistoVC.FieldByName('MONTO_A_PAGAR').DisplayLabel := 'Monto Pagar';
            QryHistoVC.FieldByName('PLAZO').DisplayLabel := 'Plazo';
            QryHistoVC.FieldByName('IMPORTE_AVALUO').DisplayLabel := 'Imp Avalúo';
            QryHistoVC.FieldByName('GARANTIA').DisplayLabel := 'Garantía';
            QryHistoVC.FieldByName('IMPORTE_PAGO').DisplayLabel := 'Imp Pago';
            QryHistoVC.FieldByName('PAGO_EFECTIVO').DisplayLabel := 'Pago Efect';
            QryHistoVC.FieldByName('SALDO_QUITA').DisplayLabel := 'Sdo Quita';
            QryHistoVC.FieldByName('SALDO_DACION').DisplayLabel := 'Sdo Dación';
            QryHistoVC.FieldByName('QUEBRANTO').DisplayLabel := 'Quebranto';
            QryHistoVC.FieldByName('FECHA_ULTIMO_PAGO').DisplayLabel := 'Fch Ult Pago';
            QryHistoVC.FieldByName('FECHA_ULTIMA_COMPRA').DisplayLabel := 'Fch Ult Compra';
            QryHistoVC.FieldByName('FECHA_QUEBRANTO').DisplayLabel := 'Fch Quebr';
            QryHistoVC.FieldByName('FECHA_LIQUIDACION').DisplayLabel := 'Fch Liqu';
            QryHistoVC.FieldByName('FECHA_CIERRE').DisplayLabel := 'Fch Cierre';
            QryHistoVC.FieldByName('CLAVE_OBSERVACION').DisplayLabel := 'Cve Obs';
            QryHistoVC.FieldByName('CALIFICACION_CARTERA').DisplayLabel := 'Calif Cart';
            QryHistoVC.FieldByName('CUENTA_CONTABLE').DisplayLabel := 'Cta Cont';
            QryHistoVC.FieldByName('NUMERO_CONTRATO_ANTERIOR').DisplayLabel := 'Num Contr Ant';
            QryHistoVC.FieldByName('NOMBRE_OTORGANTE_ANTERIOR').DisplayLabel := 'Nom Otorg Ant';
            QryHistoVC.FieldByName('CLAVE_OTORGANTE_ANTERIOR').DisplayLabel := 'Cve Otorg Ant';
            QryHistoVC.FieldByName('NUMERO_CUENTA_ANTERIOR').DisplayLabel := 'Num Cta Ant';
            QryHistoVC.FieldByName('BLOQUEO').DisplayLabel := 'Bloqueo';
            QryHistoVC.FieldByName('FECHA_PRIMER_INCUM').DisplayLabel := 'Fch Prim Incumpl';
            QryHistoVC.FieldByName('CLAVE_CONSOLIDA_EM').DisplayLabel := 'Cve Consol EM';
            QryHistoVC.FieldByName('SALDO_INSOLUTO').DisplayLabel := 'Sdo Ins';
            QryHistoVC.FieldByName('MONTO_ULTIMO_PAGO').DisplayLabel := 'Monto Ult Pago';
            QryHistoVC.FieldByName('SIT_VC_HISTO').DisplayLabel := 'Sit VC Hist';
            QryHistoVC.FieldByName('F_ALTA').DisplayLabel := 'Fch Alta';
            QryHistoVC.FieldByName('CVE_USU_ALTA').DisplayLabel := 'Cve Usu Alta';
            QryHistoVC.FieldByName('F_MODIFICA').DisplayLabel := 'Fch Modif';
            QryHistoVC.FieldByName('CVE_USU_MODIFICA').DisplayLabel := 'Fch Usu Modif';

            QryHistoVC.FieldByName('F_PROCESO').DisplayWidth := 12;
            QryHistoVC.FieldByName('ID_CSC').DisplayWidth := 4;
            QryHistoVC.FieldByName('TIPO_CARGA').DisplayWidth := 4;
            QryHistoVC.FieldByName('TIPO_CARTERA').DisplayWidth := 4;
            QryHistoVC.FieldByName('NUMERO_CUENTA').DisplayWidth := 12;
            QryHistoVC.FieldByName('UID_CUS').DisplayWidth := 20;
            QryHistoVC.FieldByName('TIPO_CONTRATO').DisplayWidth := 12;
            QryHistoVC.FieldByName('TIPO_CREDITO').DisplayWidth := 2;
            QryHistoVC.FieldByName('CLAVE_MONEDA').DisplayWidth := 3;
            QryHistoVC.FieldByName('FECHA_APERTURA').DisplayWidth := 12;
            QryHistoVC.FieldByName('FECHA_REESTRUCTURA').DisplayWidth := 12;
            QryHistoVC.FieldByName('NUMERO_PAGOS').DisplayWidth := 4;
            QryHistoVC.FieldByName('EXPERIENCIAS_CREDITICIAS').DisplayWidth := 4;
            QryHistoVC.FieldByName('CLAVE_FRECUENCIA_PAGOS').DisplayWidth := 4;
            QryHistoVC.FieldByName('CLAVE_FRECUENCIA_PAGOS_NUM').DisplayWidth := 4;
            QryHistoVC.FieldByName('LIMITE_CREDITO').DisplayWidth := 12;
            QryHistoVC.FieldByName('CREDITO_MAXIMO').DisplayWidth := 12;
            QryHistoVC.FieldByName('SALDO_INICIAL').DisplayWidth := 12;
            QryHistoVC.FieldByName('SALDO_ACTUAL').DisplayWidth := 12;
            QryHistoVC.FieldByName('SALDO_VENCIDO').DisplayWidth := 12;
            QryHistoVC.FieldByName('PAGOS_VENCIDOS').DisplayWidth := 4;
            QryHistoVC.FieldByName('DIAS_VENCIDO').DisplayWidth := 4;
            QryHistoVC.FieldByName('MONTO_A_PAGAR').DisplayWidth := 12;
            QryHistoVC.FieldByName('PLAZO').DisplayWidth := 4;
            QryHistoVC.FieldByName('IMPORTE_AVALUO').DisplayWidth := 12;
            QryHistoVC.FieldByName('GARANTIA').DisplayWidth := 12;
            QryHistoVC.FieldByName('IMPORTE_PAGO').DisplayWidth := 12;
            QryHistoVC.FieldByName('PAGO_EFECTIVO').DisplayWidth := 12;
            QryHistoVC.FieldByName('SALDO_QUITA').DisplayWidth := 12;
            QryHistoVC.FieldByName('SALDO_DACION').DisplayWidth := 12;
            QryHistoVC.FieldByName('QUEBRANTO').DisplayWidth := 12;
            QryHistoVC.FieldByName('FECHA_ULTIMO_PAGO').DisplayWidth := 12;
            QryHistoVC.FieldByName('FECHA_ULTIMA_COMPRA').DisplayWidth := 12;
            QryHistoVC.FieldByName('FECHA_QUEBRANTO').DisplayWidth := 12;
            QryHistoVC.FieldByName('FECHA_LIQUIDACION').DisplayWidth := 12;
            QryHistoVC.FieldByName('FECHA_CIERRE').DisplayWidth := 12;
            QryHistoVC.FieldByName('CLAVE_OBSERVACION').DisplayWidth := 12;
            QryHistoVC.FieldByName('CALIFICACION_CARTERA').DisplayWidth := 4;
            QryHistoVC.FieldByName('CUENTA_CONTABLE').DisplayWidth := 4;
            QryHistoVC.FieldByName('NUMERO_CONTRATO_ANTERIOR').DisplayWidth := 12;
            QryHistoVC.FieldByName('NOMBRE_OTORGANTE_ANTERIOR').DisplayWidth := 12;
            QryHistoVC.FieldByName('CLAVE_OTORGANTE_ANTERIOR').DisplayWidth := 12;
            QryHistoVC.FieldByName('NUMERO_CUENTA_ANTERIOR').DisplayWidth := 12;
            QryHistoVC.FieldByName('BLOQUEO').DisplayWidth := 4;
            QryHistoVC.FieldByName('FECHA_PRIMER_INCUM').DisplayWidth := 12;
            QryHistoVC.FieldByName('CLAVE_CONSOLIDA_EM').DisplayWidth := 12;
            QryHistoVC.FieldByName('SALDO_INSOLUTO').DisplayWidth := 12;
            QryHistoVC.FieldByName('MONTO_ULTIMO_PAGO').DisplayWidth := 12;
            QryHistoVC.FieldByName('SIT_VC_HISTO').DisplayWidth := 4;
            QryHistoVC.FieldByName('F_ALTA').DisplayWidth := 12;
            QryHistoVC.FieldByName('CVE_USU_ALTA').DisplayWidth := 12;
            QryHistoVC.FieldByName('F_MODIFICA').DisplayWidth := 12;
            QryHistoVC.FieldByName('CVE_USU_MODIFICA').DisplayWidth := 12;
   end;


   {If Trim(sSQL) <> '' Then Begin
      vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Try
         If vlQry <> Nil Then Begin
            vlQry.FieldByName('F_PROCESO').DisplayLabel := 'Fch Proceso' + #30 +'>C';
            vlQry.FieldByName('ID_CSC').DisplayLabel := 'Csc' + #30 +'>C';
            vlQry.FieldByName('TIPO_CARGA').DisplayLabel := 'T Carga' + #30 +'>C';
            vlQry.FieldByName('TIPO_CARTERA').DisplayLabel := 'T Cart' + #30 +'>C';
            vlQry.FieldByName('NUMERO_CUENTA').DisplayLabel := 'Crédito' + #30 +'>C';
            vlQry.FieldByName('UID_CUS').DisplayLabel := 'Uid Cus' + #30 +'>C';
            vlQry.FieldByName('TIPO_CONTRATO').DisplayLabel := 'T Contr' + #30 +'>C';
            vlQry.FieldByName('TIPO_CREDITO').DisplayLabel := 'T Cred' + #30 +'>C';
            vlQry.FieldByName('CLAVE_MONEDA').DisplayLabel := 'Moneda' + #30 +'>C';
            vlQry.FieldByName('FECHA_APERTURA').DisplayLabel := 'Fch Apertura' + #30 +'>C';
            vlQry.FieldByName('FECHA_REESTRUCTURA').DisplayLabel := 'Fch Restruct' + #30 +'>C';
            vlQry.FieldByName('NUMERO_PAGOS').DisplayLabel := 'Pagos' + #30 +'>C';
            vlQry.FieldByName('EXPERIENCIAS_CREDITICIAS').DisplayLabel := 'Exp Cred' + #30 +'>C';
            vlQry.FieldByName('CLAVE_FRECUENCIA_PAGOS').DisplayLabel := 'Cve Frec P' + #30 +'>C';
            vlQry.FieldByName('CLAVE_FRECUENCIA_PAGOS_NUM').DisplayLabel := 'Frec Pagos' + #30 +'>C';
            vlQry.FieldByName('LIMITE_CREDITO').DisplayLabel := 'Limite Crédito' + #30 +'>C';
            vlQry.FieldByName('CREDITO_MAXIMO').DisplayLabel := 'Cred Max' + #30 +'>C';
            vlQry.FieldByName('SALDO_INICIAL').DisplayLabel := 'Sdo Ini' + #30 +'>C';
            vlQry.FieldByName('SALDO_ACTUAL').DisplayLabel := 'Sdo Act' + #30 +'>C';
            vlQry.FieldByName('SALDO_VENCIDO').DisplayLabel := 'Sdo Venc' + #30 +'>C';
            vlQry.FieldByName('PAGOS_VENCIDOS').DisplayLabel := 'Pagos Venc' + #30 +'>C';
            vlQry.FieldByName('DIAS_VENCIDO').DisplayLabel := 'Dias Venc' + #30 +'>C';
            vlQry.FieldByName('MONTO_A_PAGAR').DisplayLabel := 'Monto Pagar' + #30 +'>C';
            vlQry.FieldByName('PLAZO').DisplayLabel := 'Plazo' + #30 +'>C';
            vlQry.FieldByName('IMPORTE_AVALUO').DisplayLabel := 'Imp Avalúo' + #30 +'>C';
            vlQry.FieldByName('GARANTIA').DisplayLabel := 'Garantía' + #30 +'>C';
            vlQry.FieldByName('IMPORTE_PAGO').DisplayLabel := 'Imp Pago' + #30 +'>C';
            vlQry.FieldByName('PAGO_EFECTIVO').DisplayLabel := 'Pago Efect' + #30 +'>C';
            vlQry.FieldByName('SALDO_QUITA').DisplayLabel := 'Sdo Quita' + #30 +'>C';
            vlQry.FieldByName('SALDO_DACION').DisplayLabel := 'Sdo Dación' + #30 +'>C';
            vlQry.FieldByName('QUEBRANTO').DisplayLabel := 'Quebranto' + #30 +'>C';
            vlQry.FieldByName('FECHA_ULTIMO_PAGO').DisplayLabel := 'Fch Ult Pago' + #30 +'>C';
            vlQry.FieldByName('FECHA_ULTIMA_COMPRA').DisplayLabel := 'Fch Ult Compra' + #30 +'>C';
            vlQry.FieldByName('FECHA_QUEBRANTO').DisplayLabel := 'Fch Quebr' + #30 +'>C';
            vlQry.FieldByName('FECHA_LIQUIDACION').DisplayLabel := 'Fch Liqu' + #30 +'>C';
            vlQry.FieldByName('FECHA_CIERRE').DisplayLabel := 'Fch Cierre' + #30 +'>C';
            vlQry.FieldByName('CLAVE_OBSERVACION').DisplayLabel := 'Cve Obs' + #30 +'>C';
            vlQry.FieldByName('CALIFICACION_CARTERA').DisplayLabel := 'Calif Cart' + #30 +'>C';
            vlQry.FieldByName('CUENTA_CONTABLE').DisplayLabel := 'Cta Cont' + #30 +'>C';
            vlQry.FieldByName('NUMERO_CONTRATO_ANTERIOR').DisplayLabel := 'Num Contr Ant' + #30 +'>C';
            vlQry.FieldByName('NOMBRE_OTORGANTE_ANTERIOR').DisplayLabel := 'Nom Otorg Ant' + #30 +'>C';
            vlQry.FieldByName('CLAVE_OTORGANTE_ANTERIOR').DisplayLabel := 'Cve Otorg Ant' + #30 +'>C';
            vlQry.FieldByName('NUMERO_CUENTA_ANTERIOR').DisplayLabel := 'Num Cta Ant' + #30 +'>C';
            vlQry.FieldByName('BLOQUEO').DisplayLabel := 'Bloqueo' + #30 +'>C';
            vlQry.FieldByName('FECHA_PRIMER_INCUM').DisplayLabel := 'Fch Prim Incumpl' + #30 +'>C';
            vlQry.FieldByName('CLAVE_CONSOLIDA_EM').DisplayLabel := 'Cve Consol EM' + #30 +'>C';
            vlQry.FieldByName('SALDO_INSOLUTO').DisplayLabel := 'Sdo Ins' + #30 +'>C';
            vlQry.FieldByName('MONTO_ULTIMO_PAGO').DisplayLabel := 'Monto Ult Pago' + #30 +'>C';
            vlQry.FieldByName('SIT_VC_HISTO').DisplayLabel := 'Sit VC Hist' + #30 +'>C';
            vlQry.FieldByName('F_ALTA').DisplayLabel := 'Fch Alta' + #30 +'>C';
            vlQry.FieldByName('CVE_USU_ALTA').DisplayLabel := 'Cve Usu Alta' + #30 +'>C';
            vlQry.FieldByName('F_MODIFICA').DisplayLabel := 'Fch Modif' + #30 +'>C';
            vlQry.FieldByName('CVE_USU_MODIFICA').DisplayLabel := 'Fch Usu Modif' + #30 +'>C';

            vlQry.FieldByName('F_PROCESO').DisplayWidth := 10;
            vlQry.FieldByName('ID_CSC').DisplayWidth := 4;
            vlQry.FieldByName('TIPO_CARGA').DisplayWidth := 4;
            vlQry.FieldByName('TIPO_CARTERA').DisplayWidth := 4;
            vlQry.FieldByName('NUMERO_CUENTA').DisplayWidth := 10;
            vlQry.FieldByName('UID_CUS').DisplayWidth := 20;
            vlQry.FieldByName('TIPO_CONTRATO').DisplayWidth := 10;
            vlQry.FieldByName('TIPO_CREDITO').DisplayWidth := 2;
            vlQry.FieldByName('CLAVE_MONEDA').DisplayWidth := 3;
            vlQry.FieldByName('FECHA_APERTURA').DisplayWidth := 10;
            vlQry.FieldByName('FECHA_REESTRUCTURA').DisplayWidth := 10;
            vlQry.FieldByName('NUMERO_PAGOS').DisplayWidth := 4;
            vlQry.FieldByName('EXPERIENCIAS_CREDITICIAS').DisplayWidth := 4;
            vlQry.FieldByName('CLAVE_FRECUENCIA_PAGOS').DisplayWidth := 4;
            vlQry.FieldByName('CLAVE_FRECUENCIA_PAGOS_NUM').DisplayWidth := 4;
            vlQry.FieldByName('LIMITE_CREDITO').DisplayWidth := 10;
            vlQry.FieldByName('CREDITO_MAXIMO').DisplayWidth := 10;
            vlQry.FieldByName('SALDO_INICIAL').DisplayWidth := 10;
            vlQry.FieldByName('SALDO_ACTUAL').DisplayWidth := 10;
            vlQry.FieldByName('SALDO_VENCIDO').DisplayWidth := 10;
            vlQry.FieldByName('PAGOS_VENCIDOS').DisplayWidth := 4;
            vlQry.FieldByName('DIAS_VENCIDO').DisplayWidth := 4;
            vlQry.FieldByName('MONTO_A_PAGAR').DisplayWidth := 10;
            vlQry.FieldByName('PLAZO').DisplayWidth := 4;
            vlQry.FieldByName('IMPORTE_AVALUO').DisplayWidth := 10;
            vlQry.FieldByName('GARANTIA').DisplayWidth := 10;
            vlQry.FieldByName('IMPORTE_PAGO').DisplayWidth := 10;
            vlQry.FieldByName('PAGO_EFECTIVO').DisplayWidth := 10;
            vlQry.FieldByName('SALDO_QUITA').DisplayWidth := 10;
            vlQry.FieldByName('SALDO_DACION').DisplayWidth := 10;
            vlQry.FieldByName('QUEBRANTO').DisplayWidth := 10;
            vlQry.FieldByName('FECHA_ULTIMO_PAGO').DisplayWidth := 10;
            vlQry.FieldByName('FECHA_ULTIMA_COMPRA').DisplayWidth := 10;
            vlQry.FieldByName('FECHA_QUEBRANTO').DisplayWidth := 10;
            vlQry.FieldByName('FECHA_LIQUIDACION').DisplayWidth := 10;
            vlQry.FieldByName('FECHA_CIERRE').DisplayWidth := 10;
            vlQry.FieldByName('CLAVE_OBSERVACION').DisplayWidth := 10;
            vlQry.FieldByName('CALIFICACION_CARTERA').DisplayWidth := 4;
            vlQry.FieldByName('CUENTA_CONTABLE').DisplayWidth := 4;
            vlQry.FieldByName('NUMERO_CONTRATO_ANTERIOR').DisplayWidth := 10;
            vlQry.FieldByName('NOMBRE_OTORGANTE_ANTERIOR').DisplayWidth := 10;
            vlQry.FieldByName('CLAVE_OTORGANTE_ANTERIOR').DisplayWidth := 10;
            vlQry.FieldByName('NUMERO_CUENTA_ANTERIOR').DisplayWidth := 10;
            vlQry.FieldByName('BLOQUEO').DisplayWidth := 4;
            vlQry.FieldByName('FECHA_PRIMER_INCUM').DisplayWidth := 10;
            vlQry.FieldByName('CLAVE_CONSOLIDA_EM').DisplayWidth := 10;
            vlQry.FieldByName('SALDO_INSOLUTO').DisplayWidth := 10;
            vlQry.FieldByName('MONTO_ULTIMO_PAGO').DisplayWidth := 10;
            vlQry.FieldByName('SIT_VC_HISTO').DisplayWidth := 4;
            vlQry.FieldByName('F_ALTA').DisplayWidth := 10;
            vlQry.FieldByName('CVE_USU_ALTA').DisplayWidth := 10;
            vlQry.FieldByName('F_MODIFICA').DisplayWidth := 10;
            vlQry.FieldByName('CVE_USU_MODIFICA').DisplayWidth := 10;

            sgcDatos.AddQry( vlQry, True,True,-1,-1,-1,False);
         End Else Begin
            sgcDatos.Clear('NO SE ENCONTRARON DATOS'#30'>C');
         End;
      Finally
         If vlQry <> Nil Then
            vlQry.free;
      End;
   End; }
end;

procedure TWBcLayVC.btCargaVCClick(Sender: TObject);
var
  Excel           : Variant;
  correcto, paso  : boolean;
  valida          : string;
  fila            : integer;
  SAGta_Row       : integer;
  LCID            : integer;
  PI_Str          : string;
  PI_Float        : double;
  error, BotonSel : integer;
  Cve_Edo_Mpio    : string;
  Desc_Edo_Mpio   : string;
  vlQry           : TQuery;
  vlQry_F         : TQuery;
  n, vlCont       : integer;
  vlConsulta      : string;
  banErrPI        : boolean;
  ban_Datos       : boolean;
  vlNumResult     : Integer;
  vlDescNumResul  : String;
  vlMsgRep        : String;
  Cadena          : String;
begin
//****************
//  if Objeto.ValidaAccesoEsp('TBCLAYVC_IMPVC',True,True) then begin  // FJR seguridad botón temporalmente sin funcionar
      //INICIA BLOQUE IMPORTA ARCHIVO EXCEL
      correcto  := False;
      ban_Datos := False;
      Paso      := True;

      If MessageDlg('IMPORTANTE: '+#13+
                    'La información de venta de cartera para el día referido'+#13+
                    'será importada.'+#13+#13+
                    '¿Desea continuar con la carga?... ', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
         Exit;

      while not correcto and odArchivoCarga.Execute do
      begin
        if FileExists (odArchivoCarga.FileName) then
          if ValidaArchivo then   // FJR 12.09.2013
             correcto := True
          else begin
             correcto:= False;
             ShowMessage ('Archivo inconsistente. '+#13#13+
                          'Revise que rótulos y valores de las columnas '+#13+
                          'del documento Excel seleccionado sean los indicados.');
             Exit;
          end
        else
          ShowMessage ('Archivo inexistente. Por favor seleccione un archivo.');
      end;

      if correcto then
      begin
        LCID := GetUserDefaultLCID;

        Excel_Application.Connect;
        //Hace a excel invisible
        Excel_Application.Visible [LCID]       := False;
        Excel_Application.DisplayAlerts [LCID] := False;

        // Abre el archivo
        Excel_Application.Workbooks.Open (odArchivoCarga.FileName,
                                          EmptyParam, //UpdateLinks: OleVariant
                                          EmptyParam, //ReadOnly: OleVariant
                                          EmptyParam, //Format: OleVariant
                                          EmptyParam, //PASSWORD: OleVariant
                                          EmptyParam, //WriteResPassword: OleVariant
                                          EmptyParam, //IgnoreReadOnlyRecommended: OleVariant
                                          EmptyParam, //Orign: OleVariant
                                          EmptyParam, //Delimiter: OleVariant
                                          EmptyParam, //Editable: OleVariant
                                          EmptyParam, //Notify: OleVariant
                                          EmptyParam, //Converter: OleVariant
                                          EmptyParam, //AddToMru: OleVariant
                                          LCID
                                          );
        Excel_Workbook.ConnectTo  (Excel_Application.ActiveWorkbook);
        Excel_Worksheet.ConnectTo (Excel_Application.ActiveSheet AS _Worksheet);

        GetSQLInt('SELECT NVL(MAX(ID_CARGA), 0) + 1 AS ID_CSC FROM BC_LAYOUT_VC ', Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'ID_CSC', Csc, False);

        fila   := 2;

        valida := Excel_Worksheet.Cells.Item [fila, 'B']; //Tipo de Carga, nunca nulo.

        While valida <> '' Do Begin
            ban_Datos := True;

            //
            Objeto.TIPO_CARGA.AsString:= '';
            Objeto.NUMERO_CUENTA.AsString:= '';
            Objeto.UID_CUS.AsString:= '';
            Objeto.RFC.AsString:= '';
            Objeto.PRIMER_NOMBRE.AsString:= '';
            Objeto.SEGUNDO_NOMBRE.AsString:= '';
            Objeto.APELLIDO_PATERNO.AsString:= '';
            Objeto.APELLIDO_MATERNO.AsString:= '';
            Objeto.APELLIDO_ADICIONAL.AsString:= '';
            Objeto.FECHA_NACIMIENTO.AsString:= '';
            Objeto.SEXO.AsString:= '';
            Objeto.ESTADO_CIVIL.AsString:= '';
            Objeto.NAT.AsString:= '';
            Objeto.ECON_ACT.AsString:= '';
            Objeto.TIPO_CLIENTE.AsString:= '';
            Objeto.INDICADOR_DEFUNCION.AsString:= '';
            Objeto.FECHA_DEFUNCION.AsString:= '';
            Objeto.PAIS.AsString:= '';
            Objeto.ESTADO.AsString:= '';
            Objeto.NOM_CIT.AsString:= '';
            Objeto.DELEGACION_MUNICIPIO.AsString:= '';
            Objeto.COLONIA_POBLACION.AsString:= '';
            Objeto.NUMERO_EXTERIOR.AsString:= '';
            Objeto.CODIGO_POSTAL.AsString:= '';
            Objeto.NUMERO_TELEFONO.AsString:= '';
            Objeto.EXTENSION_TELEFONICA.AsString:= '';
            Objeto.TIPO_DOMICILIO.AsString:= '';
            Objeto.TIPO_RESPONSABILIDAD.AsString:= '';
            Objeto.TIPO_CONTRATO.AsString:= '';
            Objeto.TIPO_CREDITO.AsString:= '';
            Objeto.CLAVE_MONEDA.AsString:= '';
            Objeto.FECHA_APERTURA.AsString:= '';
            Objeto.FECHA_REESTRUCTURA.AsString:= '';
            Objeto.NUMERO_PAGOS.AsString:= '';
            Objeto.EXPERIENCIAS_CREDITICIAS.AsString:= '';
            Objeto.CLAVE_FRECUENCIA_PAGOS.AsString:= '';
            Objeto.CLAVE_FRECUENCIA_PAGOS_NUM.AsString:= '';
            Objeto.LIMITE_CREDITO.AsString:= '';
            Objeto.CREDITO_MAXIMO.AsString:= '';
            Objeto.SALDO_INICIAL.AsString:= '';
            Objeto.SALDO_ACTUAL.AsString:= '';
            Objeto.SALDO_VENCIDO.AsString:= '';
            Objeto.PAGOS_VENCIDOS.AsString:= '';
            Objeto.DIAS_VENCIDO.AsString:= '';
            Objeto.MONTO_A_PAGAR.AsString:= '';
            Objeto.PLAZO.AsString:= '';
            Objeto.IMPORTE_AVALUO.AsString:= '';
            Objeto.GARANTIA.AsString:= '';
            Objeto.IMPORTE_PAGO.AsString:= '';
            Objeto.PAGO_EFECTIVO.AsString:= '';
            Objeto.SALDO_QUITA.AsString:= '';
            Objeto.SALDO_DACION.AsString:= '';
            Objeto.QUEBRANTO.AsString:= '';
            Objeto.FECHA_ULTIMO_PAGO.AsString:= '';
            Objeto.FECHA_ULTIMA_COMPRA.AsString:= '';
            Objeto.FECHA_QUEBRANTO.AsString:= '';
            Objeto.FECHA_LIQUIDACION.AsString:= '';
            Objeto.FECHA_CIERRE.AsString:= '';
            Objeto.CLAVE_OBSERVACION.AsString:= '';
            Objeto.CALIFICACION_CARTERA.AsString:= '';
            Objeto.CUENTA_CONTABLE.AsString:= '';
            Objeto.NUMERO_CONTRATO_ANTERIOR.AsString:= '';
            Objeto.NOMBRE_OTORGANTE_ANTERIOR.AsString:= '';
            Objeto.CLAVE_OTORGANTE_ANTERIOR.AsString:= '';
            Objeto.NUMERO_CUENTA_ANTERIOR.AsString:= '';
            Objeto.BLOQUEO.AsString:= '';
            Objeto.FECHA_PRIMER_INCUM.AsString:= '';
            Objeto.CLAVE_CONSOLIDA_EM.AsString:= '' ;
            Objeto.SALDO_INSOLUTO.AsString:= '' ;
            Objeto.MONTO_ULTIMO_PAGO.AsString:= '';  //FJR 13.06.2013 En principio es BW
            Objeto.TIPO_CARTERA.AsString:= '';  //FJR 27.08.2013 Columna final de excepciones
            Objeto.SIT_VC_HISTO.AsString:= '';
            Objeto.F_ALTA.AsString:= '';
            Objeto.CVE_USU_ALTA.AsString:= '';
            Objeto.F_MODIFICA.AsString:= '';
            Objeto.CVE_USU_MODIFICA.AsString:= '';
            Objeto.F_PROCESO.AsString:= '';
            //

            // nota 11.09.2013: verificar que en el archivo se integre las columnas necesarias, evaluando los encabezados... futuro cambio

            //If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'A'] )) then
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'A'] )) then
              Objeto.TIPO_CARGA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'A'] );
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'B'] )) then
              Objeto.NUMERO_CUENTA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'B'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'C'] )) then
              Objeto.UID_CUS.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'C'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'D'] )) then
              Objeto.RFC.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'D'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'E'] )) then
              Objeto.PRIMER_NOMBRE.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'E'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'F'] )) then
              Objeto.SEGUNDO_NOMBRE.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'F'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'G'] )) then
              Objeto.APELLIDO_PATERNO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'G'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'H'] )) then
              Objeto.APELLIDO_MATERNO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'H'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'I'] )) then
              Objeto.APELLIDO_ADICIONAL.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'I'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'J'] )) then
              Objeto.FECHA_NACIMIENTO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'J'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'K'] )) then
              Objeto.SEXO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'K'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'L'] )) then
              Objeto.ESTADO_CIVIL.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'L'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'M'] )) then
              Objeto.NAT.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'M'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'N'] )) then
              Objeto.ECON_ACT.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'N'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'O'] )) then
              Objeto.TIPO_CLIENTE.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'O'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'P'] )) then
              Objeto.INDICADOR_DEFUNCION.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'P'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'Q'] )) then
              Objeto.FECHA_DEFUNCION.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'Q'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'R'] )) then
              Objeto.PAIS.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'R'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'S'] )) then
              Objeto.ESTADO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'S'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'T'] )) then
              Objeto.NOM_CIT.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'T'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'U'] )) then
              Objeto.DELEGACION_MUNICIPIO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'U'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'V'] )) then
              Objeto.COLONIA_POBLACION.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'V'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'W'] )) then
              Objeto.NUMERO_EXTERIOR.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'W'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'X'] )) then
              Objeto.CODIGO_POSTAL.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'X'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'Y'] )) then
              Objeto.NUMERO_TELEFONO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'Y'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'Z'] )) then
              Objeto.EXTENSION_TELEFONICA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'Z'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AA'] )) then
              Objeto.TIPO_DOMICILIO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AA'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AB'] )) then
              Objeto.TIPO_RESPONSABILIDAD.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AB'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AC'] )) then
              Objeto.TIPO_CONTRATO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AC'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AD'] )) then
              Objeto.TIPO_CREDITO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AD'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AE'] )) then
              Objeto.CLAVE_MONEDA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AE'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AF'] )) then
              Objeto.FECHA_APERTURA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AF'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AG'] )) then
              Objeto.FECHA_REESTRUCTURA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AG'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AH'] )) then
              Objeto.NUMERO_PAGOS.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AH'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AI'] )) then
              Objeto.EXPERIENCIAS_CREDITICIAS.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AI'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AJ'] )) then
              Objeto.CLAVE_FRECUENCIA_PAGOS.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AJ'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AK'] )) then
              Objeto.CLAVE_FRECUENCIA_PAGOS_NUM.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AK'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AL'] )) then
              Objeto.LIMITE_CREDITO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AL'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AM'] )) then
              Objeto.CREDITO_MAXIMO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AM'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AN'] )) then
              Objeto.SALDO_INICIAL.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AN'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AO'] )) then
              Objeto.SALDO_ACTUAL.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AO'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AP'] )) then
              Objeto.SALDO_VENCIDO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AP'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AQ'] )) then
              Objeto.PAGOS_VENCIDOS.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AQ'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AR'] )) then
              Objeto.DIAS_VENCIDO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AR'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AS'] )) then
              Objeto.MONTO_A_PAGAR.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AS'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AT'] )) then
              Objeto.PLAZO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AT'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AU'] )) then
              Objeto.IMPORTE_AVALUO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AU'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AV'] )) then
              Objeto.GARANTIA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AV'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AW'] )) then
              Objeto.IMPORTE_PAGO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AW'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AX'] )) then
              Objeto.PAGO_EFECTIVO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AX'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AY'] )) then
              Objeto.SALDO_QUITA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AY'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'AZ'] )) then
              Objeto.SALDO_DACION.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AZ'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'BA'] )) then
              Objeto.QUEBRANTO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BA'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'BB'] )) then
              Objeto.FECHA_ULTIMO_PAGO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BB'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'BC'] )) then
              Objeto.FECHA_ULTIMA_COMPRA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BC'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'BD'] )) then
              Objeto.FECHA_QUEBRANTO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BD'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'BE'] )) then
              Objeto.FECHA_LIQUIDACION.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BE'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'BF'] )) then
              Objeto.FECHA_CIERRE.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BF'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'BG'] )) then
              Objeto.CLAVE_OBSERVACION.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BG'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'BH'] )) then
              Objeto.CALIFICACION_CARTERA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BH'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'BI'] )) then
              Objeto.CUENTA_CONTABLE.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BI'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'BJ'] )) then
              Objeto.NUMERO_CONTRATO_ANTERIOR.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BJ'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'BK'] )) then
              Objeto.NOMBRE_OTORGANTE_ANTERIOR.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BK'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'BL'] )) then
              Objeto.CLAVE_OTORGANTE_ANTERIOR.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BL'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'BM'] )) then
              Objeto.NUMERO_CUENTA_ANTERIOR.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BM'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'BN'] )) then
              Objeto.BLOQUEO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BN'] ) ;
            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'BO'] )) then
              Objeto.FECHA_PRIMER_INCUM.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BO'] ) ;

            Objeto.CLAVE_CONSOLIDA_EM.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BU'] ) ;
            Objeto.SALDO_INSOLUTO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BV'] ) ;
            Objeto.MONTO_ULTIMO_PAGO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BW'] ) ;  //FJR 13.06.2013 En principio es BW
            Objeto.TIPO_CARTERA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BX'] );  //FJR 27.08.2013 Columna final de excepciones

            If not VarIsEmpty(Trim(Excel_Worksheet.Cells.Item [fila, 'BP'] )) then
              Objeto.SIT_VC_HISTO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BP'] ) ;

            If Trim(Excel_Worksheet.Cells.Item [fila, 'BQ'] ) = '' then
               Objeto.F_ALTA.AsDateTime:= Date
            Else
               Objeto.F_ALTA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BQ'] ) ;//Date; //Objeto.ParamCre.FECHA.AsDateTime;

            If Trim(Excel_Worksheet.Cells.Item [fila, 'BR'] ) = '' then
               Objeto.CVE_USU_ALTA.AsString:= Objeto.Apli.Usuario
            Else
               Objeto.CVE_USU_ALTA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BR'] ) ;//Objeto.Apli.Usuario ;  //Objeto.ParamCre.CVE_USUARIO.AsString;

            If Trim(Excel_Worksheet.Cells.Item [fila, 'BS'] ) = '' then
               Objeto.F_MODIFICA.AsDateTime:= Date
            Else
               Objeto.F_MODIFICA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BS'] ) ;//Date;//Objeto.Apli.Fecha;//Objeto.ParamCre.FECHA.AsDateTime;

            If Trim(Excel_Worksheet.Cells.Item [fila, 'BT'] ) = '' then
               Objeto.CVE_USU_MODIFICA.AsString:= Objeto.Apli.Usuario
            Else
               Objeto.CVE_USU_MODIFICA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BT'] ) ;//Objeto.Apli.Usuario;

            If Trim(Excel_Worksheet.Cells.Item [fila, 'BY'] ) = '' then
               Objeto.F_PROCESO.AsDateTime:= Date
            Else
               Objeto.F_PROCESO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BY'] ) ;//Date;

            /////
            If not CargaDatos(1) then
               ShowMessage('Importación No Exitosa'+#13+#13+'Crédito : '+Objeto.NUMERO_CUENTA.AsString) ; // FJR Avisa de error pero continúa ejecución...
            ////

            fila   := fila + 1;
            valida := Excel_Worksheet.Cells.Item [fila, 'B']; //Tipo de Carga, nunca nulo.

          End;

          Excel_Application.Quit;
          Excel_Worksheet  .DISCONNECT;
          Excel_Workbook   .DISCONNECT;
          Excel_Application.DISCONNECT;
      end;

      ShowMessage('Terminó la importación de créditos reportados como '+#13+
                      'venta de cartera (VC) desde el Archivo de Excel.') ;
//      end ;  // FJR seguridad botón temporalmente sin funcionar
//****************
end;

procedure TWBcLayVC.InterForma1Buscar(Sender: TObject);
begin
  if Objeto.InternalBusca then
     MuestraDatos ;
end;

procedure TWBcLayVC.DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  If QryHistoVc.FieldByName('SIT_VC_HISTO').AsString = 'AC' then
  begin
    DBGrid1.Canvas.Brush.Color:= clYellow;
    DBGrid1.Canvas.Font.Color:= clBlue;
    DBGrid1.Canvas.Font.Size:= 10;
    DBGrid1.Canvas.Font.Style:= [fsBold];
  end
  Else
  begin
    DBGrid1.Canvas.Brush.Color:= clWhite;
    DBGrid1.Canvas.Font.Color:= clGray;
    DBGrid1.Canvas.Font.Size:= 8;
  end;

  DBGrid1.DefaultDrawDataCell(Rect, Field, State);
end;

end.
