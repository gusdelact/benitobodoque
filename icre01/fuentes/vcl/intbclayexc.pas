// Sistema         : Clase de BC_LAYOUT_EXCEPCION
// Fecha de Inicio : 20/12/2012
// Función forma   : Clase de BC_LAYOUT_EXCEPCION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Bzwrizhlurziljfvfiyrmz
// Comentarios     :
Unit IntBcLayExc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Excel97, OleServer, IntParamCre;

Type
 TBcLayExc= class; 

  TWBcLayoutExcepci=Class(TForm)
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
    lbTIPO_CONTRATO : TLabel; 
    edTIPO_CONTRATO : TEdit;
    lbTIPO_CREDITO : TLabel; 
    edTIPO_CREDITO : TEdit;
    lbCLAVE_MONEDA : TLabel; 
    edCLAVE_MONEDA : TEdit;
    lbFECHA_APERTURA : TLabel; 
    dtpFECHA_APERTURA : TInterDateTimePicker; 
    edFECHA_APERTURA : TEdit;
    lbFECHA_REESTRUCTURA : TLabel; 
    dtpFECHA_REESTRUCTURA : TInterDateTimePicker; 
    edFECHA_REESTRUCTURA : TEdit;
    lbNUMERO_PAGOS : TLabel; 
    edNUMERO_PAGOS : TEdit;
    lbEXPERIENCIAS_CREDITICIAS : TLabel; 
    edEXPERIENCIAS_CREDITICIAS : TEdit;
    lbCLAVE_FRECUENCIA_PAGOS : TLabel; 
    edCLAVE_FRECUENCIA_PAGOS : TEdit;
    lbCLAVE_FRECUENCIA_PAGOS_NUM : TLabel; 
    edCLAVE_FRECUENCIA_PAGOS_NUM : TEdit;
    lbLIMITE_CREDITO : TLabel; 
    edLIMITE_CREDITO : TEdit;
    lbCREDITO_MAXIMO : TLabel; 
    edCREDITO_MAXIMO : TEdit;
    lbSALDO_INICIAL : TLabel; 
    edSALDO_INICIAL : TEdit;
    lbSALDO_ACTUAL : TLabel; 
    edSALDO_ACTUAL : TEdit;
    lbSALDO_VENCIDO : TLabel; 
    edSALDO_VENCIDO : TEdit;
    lbPAGOS_VENCIDOS : TLabel; 
    edPAGOS_VENCIDOS : TEdit;
    lbDIAS_VENCIDO : TLabel; 
    edDIAS_VENCIDO : TEdit;
    lbMONTO_A_PAGAR : TLabel; 
    edMONTO_A_PAGAR : TEdit;
    lbPLAZO : TLabel; 
    edPLAZO : TEdit;
    lbIMPORTE_AVALUO : TLabel; 
    edIMPORTE_AVALUO : TEdit;
    lbGARANTIA : TLabel; 
    edGARANTIA : TEdit;
    lbIMPORTE_PAGO : TLabel; 
    edIMPORTE_PAGO : TEdit;
    lbPAGO_EFECTIVO : TLabel; 
    edPAGO_EFECTIVO : TEdit;
    lbSALDO_QUITA : TLabel; 
    edSALDO_QUITA : TEdit;
    lbSALDO_DACION : TLabel; 
    edSALDO_DACION : TEdit;
    lbQUEBRANTO : TLabel; 
    edQUEBRANTO : TEdit;
    lbFECHA_ULTIMO_PAGO : TLabel; 
    dtpFECHA_ULTIMO_PAGO : TInterDateTimePicker; 
    edFECHA_ULTIMO_PAGO : TEdit;
    lbFECHA_ULTIMA_COMPRA : TLabel; 
    dtpFECHA_ULTIMA_COMPRA : TInterDateTimePicker; 
    edFECHA_ULTIMA_COMPRA : TEdit;
    lbFECHA_QUEBRANTO : TLabel; 
    dtpFECHA_QUEBRANTO : TInterDateTimePicker; 
    edFECHA_QUEBRANTO : TEdit;
    lbFECHA_LIQUIDACION : TLabel; 
    dtpFECHA_LIQUIDACION : TInterDateTimePicker; 
    edFECHA_LIQUIDACION : TEdit;
    lbFECHA_CIERRE : TLabel; 
    dtpFECHA_CIERRE : TInterDateTimePicker; 
    edFECHA_CIERRE : TEdit;
    lbCLAVE_OBSERVACION : TLabel; 
    edCLAVE_OBSERVACION : TEdit;
    lbCALIFICACION_CARTERA : TLabel; 
    edCALIFICACION_CARTERA : TEdit;
    lbCUENTA_CONTABLE : TLabel; 
    edCUENTA_CONTABLE : TEdit;
    lbNUMERO_CONTRATO_ANTERIOR : TLabel; 
    edNUMERO_CONTRATO_ANTERIOR : TEdit;
    lbNOMBRE_OTORGANTE_ANTERIOR : TLabel; 
    edNOMBRE_OTORGANTE_ANTERIOR : TEdit;
    lbCLAVE_OTORGANTE_ANTERIOR : TLabel; 
    edCLAVE_OTORGANTE_ANTERIOR : TEdit;
    lbNUMERO_CUENTA_ANTERIOR : TLabel; 
    edNUMERO_CUENTA_ANTERIOR : TEdit;
    lbBLOQUEO : TLabel; 
    edBLOQUEO : TEdit;
    lbFECHA_PRIMER_INCUM : TLabel; 
    dtpFECHA_PRIMER_INCUM : TInterDateTimePicker; 
    edFECHA_PRIMER_INCUM : TEdit;
    lbCLAVE_CONSOLIDA_EM : TLabel; 
    edCLAVE_CONSOLIDA_EM : TEdit;
    lbSIT_EXCEPCION : TLabel;
    lbF_ALTA : TLabel; 
    edF_ALTA : TEdit;
    lbCVE_USU_ALTA : TLabel; 
    edCVE_USU_ALTA : TEdit;
    lbF_MODIFICA : TLabel; 
    edF_MODIFICA : TEdit;
    lbCVE_USU_MODIFICA : TLabel; 
    edCVE_USU_MODIFICA : TEdit;
    btCargaDatosExcel: TBitBtn; 
    odArchivoCarga: TOpenDialog;
    Excel_Application: TExcelApplication;
    Excel_Worksheet: TExcelWorksheet;
    Excel_Workbook: TExcelWorkbook;
    cbSIT_EXCEPCION: TComboBox;
    lbSALDO_INSOLUTO: TLabel;
    edSALDO_INSOLUTO: TEdit;
    lbMONTO_ULTIMO_PAGO: TLabel;
    edMONTO_ULTIMO_PAGO: TEdit;
    LblTIPO_CARTERA: TLabel;
    edTIPO_CARTERA: TEdit;
    function CargaDatos(Accion: Integer): Boolean;
    procedure ActFLiq_CveObsCastigo(peBCommit : String; var peNumResult: Integer; var peDescNumResul : String; var peMsgRep : String);
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCargaDatosExcelClick(Sender: TObject);
    procedure cbSIT_EXCEPCIONExit(Sender: TObject);


    private
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TBcLayExc;
end; 
 TBcLayExc= class(TInterFrame)
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
        SIT_EXCEPCION            : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        SALDO_INSOLUTO           : TInterCampo;
        MONTO_ULTIMO_PAGO        : TInterCampo; //FJR 13.06.2013
        TIPO_CARTERA             : TInterCampo; //FJR 27.08.2013

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


constructor TBcLayExc.Create( AOwner : TComponent ); 
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
      TIPO_CONTRATO :=CreaCampo('TIPO_CONTRATO',ftString,tsNinguno,tsNinguno,True);
        TIPO_CONTRATO .Size:=2;
                TIPO_CONTRATO.Caption:='Tipo Contrato';
      TIPO_CREDITO :=CreaCampo('TIPO_CREDITO',ftString,tsNinguno,tsNinguno,True);
        TIPO_CREDITO .Size:=4;
                TIPO_CREDITO.Caption:='Tipo Credito';
      CLAVE_MONEDA :=CreaCampo('CLAVE_MONEDA',ftString,tsNinguno,tsNinguno,True);
        CLAVE_MONEDA .Size:=4;
                CLAVE_MONEDA.Caption:='Clave Moneda';
      FECHA_APERTURA :=CreaCampo('FECHA_APERTURA',ftDate,tsNinguno,tsNinguno,True);
                FECHA_APERTURA.Caption:='Fecha Apertura';
      FECHA_REESTRUCTURA :=CreaCampo('FECHA_REESTRUCTURA',ftDate,tsNinguno,tsNinguno,True);
                FECHA_REESTRUCTURA.Caption:='Fecha Reestructura';
      NUMERO_PAGOS :=CreaCampo('NUMERO_PAGOS',ftFloat,tsNinguno,tsNinguno,True);
                NUMERO_PAGOS.Caption:='Numero Pagos';
      EXPERIENCIAS_CREDITICIAS :=CreaCampo('EXPERIENCIAS_CREDITICIAS',ftFloat,tsNinguno,tsNinguno,True);
                EXPERIENCIAS_CREDITICIAS.Caption:='Experiencias Crediticias';
      CLAVE_FRECUENCIA_PAGOS :=CreaCampo('CLAVE_FRECUENCIA_PAGOS',ftString,tsNinguno,tsNinguno,True);
        CLAVE_FRECUENCIA_PAGOS .Size:=1;
                CLAVE_FRECUENCIA_PAGOS.Caption:='Clave Frecuencia Pagos';
      CLAVE_FRECUENCIA_PAGOS_NUM :=CreaCampo('CLAVE_FRECUENCIA_PAGOS_NUM',ftFloat,tsNinguno,tsNinguno,True);
                CLAVE_FRECUENCIA_PAGOS_NUM.Caption:='Clave Frecuencia Pagos Número';
      LIMITE_CREDITO :=CreaCampo('LIMITE_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                LIMITE_CREDITO.Caption:='Limite Credito';
      CREDITO_MAXIMO :=CreaCampo('CREDITO_MAXIMO',ftFloat,tsNinguno,tsNinguno,True);
                CREDITO_MAXIMO.Caption:='Credito Maximo';
      SALDO_INICIAL :=CreaCampo('SALDO_INICIAL',ftFloat,tsNinguno,tsNinguno,True);
                SALDO_INICIAL.Caption:='Saldo Inicial';
      SALDO_ACTUAL :=CreaCampo('SALDO_ACTUAL',ftFloat,tsNinguno,tsNinguno,True);
                SALDO_ACTUAL.Caption:='Saldo Actual';
      SALDO_VENCIDO :=CreaCampo('SALDO_VENCIDO',ftFloat,tsNinguno,tsNinguno,True);
                SALDO_VENCIDO.Caption:='Saldo Vencido';
      PAGOS_VENCIDOS :=CreaCampo('PAGOS_VENCIDOS',ftFloat,tsNinguno,tsNinguno,True);
                PAGOS_VENCIDOS.Caption:='Pagos Vencidos';
      DIAS_VENCIDO :=CreaCampo('DIAS_VENCIDO',ftFloat,tsNinguno,tsNinguno,True);
                DIAS_VENCIDO.Caption:='Dias Vencido';
      MONTO_A_PAGAR :=CreaCampo('MONTO_A_PAGAR',ftFloat,tsNinguno,tsNinguno,True);
                MONTO_A_PAGAR.Caption:='Monto A Pagar';
      PLAZO :=CreaCampo('PLAZO',ftFloat,tsNinguno,tsNinguno,True);
                PLAZO.Caption:='Plazo';
      IMPORTE_AVALUO :=CreaCampo('IMPORTE_AVALUO',ftFloat,tsNinguno,tsNinguno,True);
                IMPORTE_AVALUO.Caption:='Importe Avaluo';
      GARANTIA :=CreaCampo('GARANTIA',ftFloat,tsNinguno,tsNinguno,True);
                GARANTIA.Caption:='Garantia';
      IMPORTE_PAGO :=CreaCampo('IMPORTE_PAGO',ftFloat,tsNinguno,tsNinguno,True);
                IMPORTE_PAGO.Caption:='Importe Pago';
      PAGO_EFECTIVO :=CreaCampo('PAGO_EFECTIVO',ftFloat,tsNinguno,tsNinguno,True);
                PAGO_EFECTIVO.Caption:='Pago Efectivo';
      SALDO_QUITA :=CreaCampo('SALDO_QUITA',ftFloat,tsNinguno,tsNinguno,True);
                SALDO_QUITA.Caption:='Saldo Quita';
      SALDO_DACION :=CreaCampo('SALDO_DACION',ftFloat,tsNinguno,tsNinguno,True);
                SALDO_DACION.Caption:='Saldo Dacion';
      QUEBRANTO :=CreaCampo('QUEBRANTO',ftFloat,tsNinguno,tsNinguno,True);
                QUEBRANTO.Caption:='Quebranto';
      FECHA_ULTIMO_PAGO :=CreaCampo('FECHA_ULTIMO_PAGO',ftDate,tsNinguno,tsNinguno,True);
                FECHA_ULTIMO_PAGO.Caption:='Fecha Ultimo Pago';
      FECHA_ULTIMA_COMPRA :=CreaCampo('FECHA_ULTIMA_COMPRA',ftDate,tsNinguno,tsNinguno,True);
                FECHA_ULTIMA_COMPRA.Caption:='Fecha Ultima Compra';
      FECHA_QUEBRANTO :=CreaCampo('FECHA_QUEBRANTO',ftDate,tsNinguno,tsNinguno,True);
                FECHA_QUEBRANTO.Caption:='Fecha Quebranto';
      FECHA_LIQUIDACION :=CreaCampo('FECHA_LIQUIDACION',ftDate,tsNinguno,tsNinguno,True);
                FECHA_LIQUIDACION.Caption:='Fecha Liquidacion';
      FECHA_CIERRE :=CreaCampo('FECHA_CIERRE',ftDate,tsNinguno,tsNinguno,True);
                FECHA_CIERRE.Caption:='Fecha Cierre';
      CLAVE_OBSERVACION :=CreaCampo('CLAVE_OBSERVACION',ftString,tsNinguno,tsNinguno,True);
        CLAVE_OBSERVACION .Size:=2;
                CLAVE_OBSERVACION.Caption:='Clave Observacion';
      CALIFICACION_CARTERA :=CreaCampo('CALIFICACION_CARTERA',ftString,tsNinguno,tsNinguno,True);
        CALIFICACION_CARTERA .Size:=4;
                CALIFICACION_CARTERA.Caption:='Calificacion Cartera';
      CUENTA_CONTABLE :=CreaCampo('CUENTA_CONTABLE',ftString,tsNinguno,tsNinguno,True);
                CUENTA_CONTABLE.Caption:='Cuenta Contable';
      NUMERO_CONTRATO_ANTERIOR :=CreaCampo('NUMERO_CONTRATO_ANTERIOR',ftString,tsNinguno,tsNinguno,True);
                NUMERO_CONTRATO_ANTERIOR.Caption:='Numero Contrato Anterior';
      NOMBRE_OTORGANTE_ANTERIOR :=CreaCampo('NOMBRE_OTORGANTE_ANTERIOR',ftString,tsNinguno,tsNinguno,True);
                NOMBRE_OTORGANTE_ANTERIOR.Caption:='Nombre Otorgante Anterior';
      CLAVE_OTORGANTE_ANTERIOR :=CreaCampo('CLAVE_OTORGANTE_ANTERIOR',ftString,tsNinguno,tsNinguno,True);
                CLAVE_OTORGANTE_ANTERIOR.Caption:='Clave Otorgante Anterior';
      NUMERO_CUENTA_ANTERIOR :=CreaCampo('NUMERO_CUENTA_ANTERIOR',ftString,tsNinguno,tsNinguno,True);
                NUMERO_CUENTA_ANTERIOR.Caption:='Numero Cuenta Anterior';
      BLOQUEO :=CreaCampo('BLOQUEO',ftString,tsNinguno,tsNinguno,True);
                BLOQUEO.Caption:='Bloqueo';
      FECHA_PRIMER_INCUM :=CreaCampo('FECHA_PRIMER_INCUM',ftDate,tsNinguno,tsNinguno,True);
                FECHA_PRIMER_INCUM.Caption:='Fecha Primer Incum';
      CLAVE_CONSOLIDA_EM :=CreaCampo('CLAVE_CONSOLIDA_EM',ftString,tsNinguno,tsNinguno,True);
                CLAVE_CONSOLIDA_EM.Caption:='Clave Consolida Em';
      SIT_EXCEPCION :=CreaCampo('SIT_EXCEPCION',ftString,tsNinguno,tsNinguno,True);
      With SIT_EXCEPCION do
       begin Size:=2;
             UseCombo:=True;
             ComboLista.Add('CA'); ComboDatos.Add('CA');
             ComboLista.Add('IN'); ComboDatos.Add('IN');
             ComboLista.Add('AC'); ComboDatos.Add('AC');
       end;
                SIT_EXCEPCION.Caption:='Situación Excepcion';

      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';

      SALDO_INSOLUTO :=CreaCampo('SALDO_INSOLUTO',ftFloat,tsNinguno,tsNinguno,True);
                SALDO_INSOLUTO.Caption:='Saldo Insoluto';
      //FJR 13.06.2013
      MONTO_ULTIMO_PAGO :=CreaCampo('MONTO_ULTIMO_PAGO',ftFloat,tsNinguno,tsNinguno,True);
                MONTO_ULTIMO_PAGO.Caption:='Monto Ultimo Pago';
      //FJR 27.08.2013
      TIPO_CARTERA :=CreaCampo('TIPO_CARTERA',ftString,tsNinguno,tsNinguno,True);
                TIPO_CARTERA.Caption:='Tipo Cartera';

      FKeyFields.Add('TIPO_CARGA');
      FKeyFields.Add('NUMERO_CUENTA');
      FKeyFields.Add('TIPO_CARTERA');

      TableName := 'BC_LAYOUT_EXCEPCION'; 
      UseQuery := True; 
      HelpFile := 'IntBcLayExc.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TBcLayExc.Destroy;
begin inherited;
end;


function TBcLayExc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWBcLayoutExcepci;
begin
   W:=TWBcLayoutExcepci.Create(Self);
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


Function TBcLayExc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IBcLaEx.it','S,S,S');
      Try if Active then begin T.Param(0,TIPO_CARGA.AsString); 
                               T.Param(1,NUMERO_CUENTA.AsString);
                               T.Param(2,TIPO_CARTERA.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end;
end;

function TBcLayExc.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA BC_LAYOUT_EXCEPCION********************)
(*                                                                              *)
(*  FORMA DE BC_LAYOUT_EXCEPCION                                                            *)
(*                                                                              *)
(***********************************************FORMA BC_LAYOUT_EXCEPCION********************)

procedure TWBcLayoutExcepci.FormShow(Sender: TObject);
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
      Objeto.TIPO_CONTRATO.Control:=edTIPO_CONTRATO;
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
      Objeto.SIT_EXCEPCION.Control:=cbSIT_EXCEPCION;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control:=edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;
      Objeto.SALDO_INSOLUTO.Control:=edSALDO_INSOLUTO;
      Objeto.MONTO_ULTIMO_PAGO.Control:= edMONTO_ULTIMO_PAGO; // FJR 13.06.2013
      Objeto.TIPO_CARTERA.Control:= edTIPO_CARTERA; // FJR 27.08.2013

      cbSIT_EXCEPCION.Items.Clear ;
      cbSIT_EXCEPCION.Items.Append('CA') ;
      cbSIT_EXCEPCION.Items.Append('IN') ;
      cbSIT_EXCEPCION.Items.Append('AC') ;
end;

procedure TWBcLayoutExcepci.FormDestroy(Sender: TObject);
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
      Objeto.TIPO_CONTRATO.Control:=nil;
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
      Objeto.SIT_EXCEPCION.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
      Objeto.SALDO_INSOLUTO.Control:=nil;
      Objeto.MONTO_ULTIMO_PAGO.Control:=nil; //FJR 13.06.2013
      Objeto.TIPO_CARTERA.Control:= nil; // FJR 27.08.2013
   //Objeto
end;

procedure TWBcLayoutExcepci.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWBcLayoutExcepci.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWBcLayoutExcepci.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWBcLayoutExcepci.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;

(******************** CARGA DE DATOS EN BLOQUE *********************************)
function TWBcLayoutExcepci.CargaDatos(Accion: Integer): Boolean;
var
  STPExcepciones: TStoredProc;
begin
  STPExcepciones:= TStoredProc.Create(Self);
  try
     With STPExcepciones do begin
        StoredProcName := 'PKGBURO.STP_LAYOUT_EXCEPCIONES';
        DatabaseName   := Objeto.Apli.DatabaseName;
        SessionName    := Objeto.Apli.SessionName;

        Params.Clear;

        Params.CreateParam(ftFloat, 'pe_Accion',  ptInput);
        Params.CreateParam(ftString, 'pe_TIPO_CARGA',  ptInput);
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
        Params.CreateParam(ftString, 'pe_SIT_EXCEPCION',  ptInput);
        Params.CreateParam(ftDate, 'pe_F_ALTA',  ptInput);
        Params.CreateParam(ftString, 'pe_CVE_USU_ALTA',  ptInput);
        Params.CreateParam(ftDate, 'pe_F_MODIFICA',  ptInput);
        Params.CreateParam(ftString, 'pe_CVE_USU_MODIFICA',  ptInput);
        Params.CreateParam(ftFloat, 'pe_SALDO_INSOLUTO',  ptInput);
        Params.CreateParam(ftFloat, 'pe_MONTO_ULTIMO_PAGO',  ptInput); // FJR 13.06.2013
        Params.CreatePAram(ftString, 'pe_TIPO_CARTERA',  ptInput); //FJR 27.08.2013
        Params.CreateParam(ftString, 'pe_BCommit',  ptInput);
        Params.CreateParam(ftFloat,'ps_Resultado',ptOutput);
        Params.CreateParam(ftString,'ps_Tx_Resultado',ptOutput);

        ParamByName('pe_Accion').AsFloat := Accion;
        ParamByName('pe_TIPO_CARGA').AsString := Objeto.TIPO_CARGA.AsString;
        ParamByName('pe_NUMERO_CUENTA').AsString := Objeto.NUMERO_CUENTA.AsString;
        ParamByName('pe_UID_CUS').AsString := Objeto.UID_CUS.AsString;
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
        ParamByName('pe_SIT_EXCEPCION').AsString := Objeto.SIT_EXCEPCION.AsString;
        ParamByName('pe_F_ALTA').AsDate := Objeto.F_ALTA.AsDateTime;
        ParamByName('pe_CVE_USU_ALTA').AsString := Objeto.CVE_USU_ALTA.AsString;
        ParamByName('pe_F_MODIFICA').AsDate := Objeto.F_MODIFICA.AsDateTime;
        ParamByName('pe_CVE_USU_MODIFICA').AsString := Objeto.CVE_USU_MODIFICA.AsString;
        ParamByName('pe_SALDO_INSOLUTO').AsFloat := Objeto.SALDO_INSOLUTO.AsFloat;
        ParamByName('pe_MONTO_ULTIMO_PAGO').AsFloat := Objeto.MONTO_ULTIMO_PAGO.AsFloat;  // FJR 13.06.2013
        ParamByName('pe_TIPO_CARTERA').AsString:= Objeto.TIPO_CARTERA.AsString; // FJR 27.08.2013
        ParamByName('pe_BCommit').AsString := 'V';

        ExecProc;
     end ;

     if (STPExcepciones.ParamByName('ps_Resultado').AsInteger = 0) then
         Result:= True
     else
         Result:= False;
  finally
     STPExcepciones.Free ;
  end ;

end;

procedure TWBcLayoutExcepci.btCargaDatosExcelClick(Sender: TObject);
var
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
   If Objeto.ValidaAccesoEsp('TBCLAYEXC_IMPEXC',True,True) then
   Begin
      //INICIA BLOQUE IMPORTA ARCHIVO EXCEL
      correcto  := False;
      ban_Datos := False;
      Paso      := True;

      If MessageDlg('IMPORTANTE: La información actual de excepciones será eliminada.'+#13+'Desea continuar con la carga?... ', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
         Exit;

      If not CargaDatos(0) then
         begin
            ShowMessage('Error: No se aplica actualización.' ) ;
            Exit ;
         end ;

      while not correcto and odArchivoCarga.Execute do
      begin
        if FileExists (odArchivoCarga.FileName) then
          correcto := True
        else
          ShowMessage ('Archivo inexistente. Por favor seleccione un archivo existente.');
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

        fila   := 2;

        valida := Excel_Worksheet.Cells.Item [fila, 'A']; //Tipo de Carga, nunca nulo.

        While valida <> '' do begin
          ban_Datos := True;

          Objeto.TIPO_CARGA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'A'] ) ;
          Objeto.NUMERO_CUENTA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'B'] ) ;
          Objeto.UID_CUS.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'C'] ) ;
          Objeto.RFC.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'D'] ) ;
          Objeto.PRIMER_NOMBRE.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'E'] ) ;
          Objeto.SEGUNDO_NOMBRE.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'F'] ) ;
          Objeto.APELLIDO_PATERNO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'G'] ) ;
          Objeto.APELLIDO_MATERNO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'H'] ) ;
          Objeto.APELLIDO_ADICIONAL.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'I'] ) ;
          Objeto.FECHA_NACIMIENTO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'J'] ) ;
          Objeto.SEXO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'K'] ) ;
          Objeto.ESTADO_CIVIL.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'L'] ) ;
          Objeto.NAT.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'M'] ) ;
          Objeto.ECON_ACT.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'N'] ) ;
          Objeto.TIPO_CLIENTE.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'O'] ) ;
          Objeto.INDICADOR_DEFUNCION.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'P'] ) ;
          Objeto.FECHA_DEFUNCION.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'Q'] ) ;
          Objeto.PAIS.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'R'] ) ;
          Objeto.ESTADO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'S'] ) ;
          Objeto.NOM_CIT.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'T'] ) ;
          Objeto.DELEGACION_MUNICIPIO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'U'] ) ;
          Objeto.COLONIA_POBLACION.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'V'] ) ;
          Objeto.NUMERO_EXTERIOR.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'W'] ) ;
          Objeto.CODIGO_POSTAL.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'X'] ) ;
          Objeto.NUMERO_TELEFONO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'Y'] ) ;
          Objeto.EXTENSION_TELEFONICA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'Z'] ) ;
          Objeto.TIPO_DOMICILIO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AA'] ) ;
          Objeto.TIPO_RESPONSABILIDAD.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AB'] ) ;
          Objeto.TIPO_CONTRATO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AC'] ) ;
          Objeto.TIPO_CREDITO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AD'] ) ;
          Objeto.CLAVE_MONEDA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AE'] ) ;
          Objeto.FECHA_APERTURA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AF'] ) ;
          Objeto.FECHA_REESTRUCTURA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AG'] ) ;
          Objeto.NUMERO_PAGOS.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AH'] ) ;
          Objeto.EXPERIENCIAS_CREDITICIAS.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AH'] ) ;
          Objeto.CLAVE_FRECUENCIA_PAGOS.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AJ'] ) ;
          Objeto.CLAVE_FRECUENCIA_PAGOS_NUM.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AK'] ) ;
          Objeto.LIMITE_CREDITO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AL'] ) ;
          Objeto.CREDITO_MAXIMO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AM'] ) ;
          Objeto.SALDO_INICIAL.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AN'] ) ;
          Objeto.SALDO_ACTUAL.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AO'] ) ;
          Objeto.SALDO_VENCIDO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AP'] ) ;
          Objeto.PAGOS_VENCIDOS.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AQ'] ) ;
          Objeto.DIAS_VENCIDO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AR'] ) ;
          Objeto.MONTO_A_PAGAR.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AS'] ) ;
          Objeto.PLAZO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AT'] ) ;
          Objeto.IMPORTE_AVALUO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AU'] ) ;
          Objeto.GARANTIA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AV'] ) ;
          Objeto.IMPORTE_PAGO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AW'] ) ;
          Objeto.PAGO_EFECTIVO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AX'] ) ;
          Objeto.SALDO_QUITA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AY'] ) ;
          Objeto.SALDO_DACION.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'AZ'] ) ;
          Objeto.QUEBRANTO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BA'] ) ;
          Objeto.FECHA_ULTIMO_PAGO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BB'] ) ;
          Objeto.FECHA_ULTIMA_COMPRA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BC'] ) ;
          Objeto.FECHA_QUEBRANTO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BD'] ) ;
          Objeto.FECHA_LIQUIDACION.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BE'] ) ;
          Objeto.FECHA_CIERRE.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BF'] ) ;
          Objeto.CLAVE_OBSERVACION.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BG'] ) ;
          Objeto.CALIFICACION_CARTERA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BH'] ) ;
          Objeto.CUENTA_CONTABLE.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BI'] ) ;
          Objeto.NUMERO_CONTRATO_ANTERIOR.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BJ'] ) ;
          Objeto.NOMBRE_OTORGANTE_ANTERIOR.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BK'] ) ;
          Objeto.CLAVE_OTORGANTE_ANTERIOR.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BL'] ) ;
          Objeto.NUMERO_CUENTA_ANTERIOR.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BM'] ) ;
          Objeto.BLOQUEO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BN'] ) ;
          Objeto.FECHA_PRIMER_INCUM.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BO'] ) ;
          Objeto.SIT_EXCEPCION.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BP'] ) ;

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
          Objeto.CLAVE_CONSOLIDA_EM.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BU'] ) ;

          Objeto.SALDO_INSOLUTO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BV'] ) ;

          Objeto.MONTO_ULTIMO_PAGO.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BW'] ) ;  //FJR 13.06.2013 En principio es BW

          Objeto.TIPO_CARTERA.AsString:= Trim(Excel_Worksheet.Cells.Item [fila, 'BX'] ) ;  //FJR 13.06.2013

          IF Objeto.TIPO_CARTERA.AsString = 'VC' THEN BEGIN
             ShowMessage('Se detectó un registro calificado "venta de cartera".'+#13+'NO SERÁ IMPORTADO'+#13+#13+'Credito : '+Trim(Objeto.NUMERO_CUENTA.AsString)) ;
          END
          ELSE BEGIN
            Cadena := 'SELECT COUNT(*) AS TOTAL FROM BC_LAYOUT_EXCEPCION '+
                      'WHERE (NUMERO_CUENTA ='''+Trim(Objeto.NUMERO_CUENTA.AsString)+''' '+
                      'AND TIPO_CARGA ='''+Trim(Objeto.TIPO_CARGA.AsString)+''' '+
                      'AND TIPO_CARTERA ='''+Trim(Objeto.TIPO_CARTERA.AsString)+''') ';

            GetSQLInt(Cadena, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, 'TOTAL', vlCont, True) ;

            If vlCont =0 then begin
               If not CargaDatos(1) then
                  ShowMessage('Importación no exitosa!. '+#13+#13+'Credito : '+Excel_Worksheet.Cells.Item [fila, 'B']) ;
            end
            else begin
                 If Paso then begin
                    BotonSel:= MessageDlg('Se ha detectado que el crédito '+Trim(Objeto.NUMERO_CUENTA.AsString)+' ya está considerado para el tipo de carga "'+Trim(Objeto.TIPO_CARGA.AsString)+'" '+
                                          ' y el tipo de cartera "'+Trim(Objeto.TIPO_CARTERA.AsString)+'".'+#13+#13+
                                          '¿Desea actualizar la información de este crédito?...'+#13+
                                          '(a excepción del número de crédito, el tipo de carga, el tipo de cartera y la fecha de alta, será actualizada toda la información)', mtConfirmation, [mbYes, mbAll, mbNo], 0); //=mrYes then
                    Case BotonSel of
                         mrYes: begin
                                   If not CargaDatos(2) then
                                      ShowMessage('Actualización no exitosa '+#13+#13+'Credito : '+Excel_Worksheet.Cells.Item [fila, 'B']) ;
                                   Paso:= True;
                                end ;
                         mrNo:  begin
                                   Paso := True;
                                end ;
                    Else begin
                          If not CargaDatos(2) then
                             ShowMessage('Actualización no exitosa '+#13+#13+'Credito : '+Excel_Worksheet.Cells.Item [fila, 'B']) ;
                             Paso:= False;
                          end ;
                    End ; // case
                 end
                 else
                    If not CargaDatos(2) then
                          ShowMessage('Actualización no exitosa '+#13+#13+'Credito : '+Excel_Worksheet.Cells.Item [fila, 'B']) ;
            end ;
          END ;

          fila   := fila + 1;
          valida := Excel_Worksheet.Cells.Item [fila, 'A']; //Tipo de Carga, nunca nulo.
        end;

        Excel_Application.Quit;
        Excel_Worksheet  .DISCONNECT;
        Excel_Workbook   .DISCONNECT;
        Excel_Application.DISCONNECT;
      end;

      ShowMessage('Terminó la importación del Archivo de Excel.' +#13#10+
                  #13#10+
                  'Se continua con la actualización de la Fecha de Liquidación'  +#13#10+
                  'en la Clave de Observación para los Créditos marcados como'   +#13#10+
                  'Castigos Totales en el caso que no la tengan.') ;
      //FINALIZA BLOQUE IMPORTA ARCHIVO EXCEL


      //INICIA BLOQUE ACTUALIZA FECHA LIQ EN CLAVES OBSERVACIÓN CASTIGO/QUEBRANTO
      ActFLiq_CveObsCastigo('V', vlNumResult, vlDescNumResul, vlMsgRep);

      //Notificar si se produjo error general
      if ( vlNumResult <> 0 ) then
      begin
          ShowMessage('Se presentó el siguiente error durante el proceso de actualización de Fecha a Castigos: ' +#13#10+
                       vlDescNumResul  +#13#10+
                       ' .Revise con Sistemas.'  +#13#10);
      end;

      //Notificar si al menos un Crédito de EXCEPCION no está marcado como Castigo o Quebranto en ICRE/INTERCRED
      if ( vlMsgRep <> '' ) then
      begin
          ShowMessage(vlMsgRep);
      end;
      //FINALIZA BLOQUE ACTUALIZA FECHA LIQ UP

      //Fin General
      ShowMessage('Se procesaron todos los registros y finaliza la actualización.') ;
   End ;
end;

procedure TWBcLayoutExcepci.cbSIT_EXCEPCIONExit(Sender: TObject);
var vlMsg: String;
    vlSalida: Boolean;
begin
{   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      Objeto.SIT_EXCEPCION.GetFromControl;
      If ( (Objeto.SIT_EXCEPCION.AsString = 'AC') or (Objeto.SIT_EXCEPCION.AsString = 'IN') or (Objeto.SIT_EXCEPCION.AsString = 'CA') ) then
      Begin
         vlMsg := '';
         vlSalida := True;
      End
      Else Begin
         vlMsg := 'Favor de indicar personalidad del accionista.';
         vlSalida := False;
      End ;

      InterForma1.ValidaExit(cbSIT_EXCEPCION,vlSalida,vlMsg,True);
   End; }
end;

procedure TWBcLayoutExcepci.ActFLiq_CveObsCastigo(peBCommit : String; var peNumResult: Integer; var peDescNumResul : String; var peMsgRep : String);
var
  STPBCExcepcion: TStoredProc;
begin
  STPBCExcepcion:= TStoredProc.Create(Self);
  try
     With STPBCExcepcion do begin
        StoredProcName := 'PKGBURO.STP_ACTFL_CVEOBSCASTIGO';
        DatabaseName   := Objeto.Apli.DatabaseName;
        SessionName    := Objeto.Apli.SessionName;

        Params.Clear;
        Params.CreateParam(ftString, 'PE_BCOMMIT', ptInput);
        Params.CreateParam(ftString, 'P_VLMSGREP', ptOutput);
        Params.CreateParam(ftFloat,  'P_RESULTADO', ptOutput);
        Params.CreateParam(ftString, 'P_TX_RESULTADO', ptOutput);

        ParamByName('PE_BCOMMIT').AsString := peBCommit;

        ExecProc;
     end ;

     peNumResult    := STPBCExcepcion.ParamByName('P_RESULTADO').AsInteger;
     peDescNumResul := STPBCExcepcion.ParamByName('P_TX_RESULTADO').AsString;
     peMsgRep       := STPBCExcepcion.ParamByName('P_VLMSGREP').AsString;
  finally
     STPBCExcepcion.Free;
  end;
end;


end.
