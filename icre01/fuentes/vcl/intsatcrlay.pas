// Sistema         : Clase de SAT_CRE_LAYOUT
// Fecha de Inicio : 08/01/2014
// Función forma   : Clase de SAT_CRE_LAYOUT
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :     
// Comentarios     :
Unit IntSatCrLay;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntParamCre,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit

,IntCrbitchip;

Type
 TSatCrLay= class; 

  TWSatCrLayout=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_EMPRESA : TLabel; 
    edID_EMPRESA : TEdit;
    lbEJERCICIO : TLabel; 
    edEJERCICIO : TEdit;
    lbID_CONTRATO : TLabel; 
    edID_CONTRATO : TEdit;
    lbID_CREDITO : TLabel; 
    edID_CREDITO : TEdit;
    lbSDO_PROMEDIO : TLabel;
    lbTIPO_REGISTRO : TLabel; 
    edTIPO_REGISTRO : TEdit;
    lbCONSECUTIVO : TLabel; 
    edCONSECUTIVO : TEdit;
    lbCVE_IDENTIFICADOR : TLabel; 
    edCVE_IDENTIFICADOR : TEdit;
    lbRFC_CURP : TLabel; 
    edRFC_CURP : TEdit;
    lbNOMBRE_TIT : TLabel; 
    edNOMBRE_TIT : TEdit;
    lbDOMICILIO : TLabel;
    lbNUM_REFERENCIA : TLabel; 
    edNUM_REFERENCIA : TEdit;
    lbNUM_REG_FIDE : TLabel; 
    edNUM_REG_FIDE : TEdit;
    lbCVE_DEST_CREDITO : TLabel; 
    edCVE_DEST_CREDITO : TEdit;
    lbIMP_INT_NOM_DEV : TLabel;
    lbIMP_INT_PAG_ORD : TLabel;
    lbIMP_INT_MOR_DEV : TLabel;
    lbIMP_INT_MOR_PAG : TLabel;
    lbIMP_INT_REAL : TLabel;
    lbSDO_CIE_ANIO_ANT : TLabel;
    lbSDO_FEC_CONTR : TLabel;
    lbF_CONTRATACION : TLabel; 
    edF_CONTRATACION : TEdit;
    lbPROP_DEDUCIBLE : TLabel; 
    edPROP_DEDUCIBLE : TEdit;
    lbPCT_COP_SOC_CONY : TLabel; 
    edPCT_COP_SOC_CONY : TEdit;
    lbNUM_COPROPIET : TLabel; 
    edNUM_COPROPIET : TEdit;
    lbRFC_CURP_COPRO : TLabel; 
    edRFC_CURP_COPRO : TEdit;
    lbNOMBRE_COPRO : TLabel; 
    edNOMBRE_COPRO : TEdit;
    lbRFC_CURP_CONYU : TLabel; 
    edRFC_CURP_CONYU : TEdit;
    lbNOMBRE_CONYU : TLabel; 
    edNOMBRE_CONYU : TEdit;
    lbDOMICILIO_INMU : TLabel;
    lbNUM_IMPRESION : TLabel; 
    edNUM_IMPRESION : TEdit;
    lbPCT_PARTICIPACION : TLabel; 
    edPCT_PARTICIPACION : TEdit;
    lbF_IMPRESION : TLabel; 
    edF_IMPRESION : TEdit; 
    chB_REPORTA_SAT : TCheckBox;
    lbF_TIPO_UDI_INI : TLabel; 
    dtpF_TIPO_UDI_INI : TInterDateTimePicker; 
    edF_TIPO_UDI_INI : TEdit;
    lbF_TIPO_UDI_FIN : TLabel; 
    dtpF_TIPO_UDI_FIN : TInterDateTimePicker;
    edF_TIPO_UDI_FIN : TEdit;
    edSDO_PROMEDIO: TInterEdit;
    edSDO_CIE_ANIO_ANT: TInterEdit;
    edIMP_INT_NOM_DEV: TInterEdit;
    edIMP_INT_PAG_ORD: TInterEdit;
    edIMP_INT_MOR_DEV: TInterEdit;
    edIMP_INT_MOR_PAG: TInterEdit;
    edIMP_INT_REAL: TInterEdit;
    edSDO_FEC_CONTR: TInterEdit;
    edDOMICILIO: TMemo;
    edDOMICILIO_INMU: TMemo;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    MsgPanel: TPanel;
    btBITACORA_CRED: TBitBtn;
    btBITACORA_TOT: TBitBtn;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edNUM_REG_FIDEExit(Sender: TObject);
    procedure edPROP_DEDUCIBLEExit(Sender: TObject);
    procedure edPCT_PARTICIPACIONExit(Sender: TObject);
    procedure edPCT_COP_SOC_CONYExit(Sender: TObject);
    procedure edSDO_CIE_ANIO_ANTExit(Sender: TObject);
    procedure edSDO_PROMEDIOExit(Sender: TObject);
    procedure edSDO_FEC_CONTRExit(Sender: TObject);
    procedure edF_TIPO_UDI_INIExit(Sender: TObject);
    procedure edF_TIPO_UDI_FINExit(Sender: TObject);
    procedure edIMP_INT_NOM_DEVExit(Sender: TObject);
    procedure edIMP_INT_PAG_ORDExit(Sender: TObject);
    procedure edIMP_INT_MOR_DEVExit(Sender: TObject);
    procedure edIMP_INT_MOR_PAGExit(Sender: TObject);
    procedure edIMP_INT_REALExit(Sender: TObject);
    procedure edDOMICILIOExit(Sender: TObject);
    procedure edDOMICILIO_INMUExit(Sender: TObject);
    procedure btBITACORA_CREDClick(Sender: TObject);
    procedure btBITACORA_TOTClick(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TSatCrLay;
end; 
 TSatCrLay= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public
        ParamCre                 : TParamCre;

        { Public declarations }
        ID_EMPRESA               : TInterCampo;
        EJERCICIO                : TInterCampo;
        ID_CONTRATO              : TInterCampo;
        ID_CREDITO               : TInterCampo;
        SDO_PROMEDIO             : TInterCampo;
        TIPO_REGISTRO            : TInterCampo;
        CONSECUTIVO              : TInterCampo;
        CVE_IDENTIFICADOR        : TInterCampo;
        RFC_CURP                 : TInterCampo;
        NOMBRE_TIT               : TInterCampo;
        DOMICILIO                : TInterCampo;
        NUM_REFERENCIA           : TInterCampo;
        NUM_REG_FIDE             : TInterCampo;
        CVE_DEST_CREDITO         : TInterCampo;
        IMP_INT_NOM_DEV          : TInterCampo;
        IMP_INT_PAG_ORD          : TInterCampo;
        IMP_INT_MOR_DEV          : TInterCampo;
        IMP_INT_MOR_PAG          : TInterCampo;
        IMP_INT_REAL             : TInterCampo;
        SDO_CIE_ANIO_ANT         : TInterCampo;
        SDO_FEC_CONTR            : TInterCampo;
        F_CONTRATACION           : TInterCampo;
        PROP_DEDUCIBLE           : TInterCampo;
        PCT_COP_SOC_CONY         : TInterCampo;
        NUM_COPROPIET            : TInterCampo;
        RFC_CURP_COPRO           : TInterCampo;
        NOMBRE_COPRO             : TInterCampo;
        RFC_CURP_CONYU           : TInterCampo;
        NOMBRE_CONYU             : TInterCampo;
        DOMICILIO_INMU           : TInterCampo;
        NUM_IMPRESION            : TInterCampo;
        PCT_PARTICIPACION        : TInterCampo;
        F_IMPRESION              : TInterCampo;
        //NOMBRE_TIT_ARCH          : TInterCampo;
        B_REPORTA_SAT            : TInterCampo;
        F_TIPO_UDI_INI           : TInterCampo;
        F_TIPO_UDI_FIN           : TInterCampo;

        Function    InternalPost : Boolean; override;
        Function    InsertaBitacora : Boolean;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

var
   vlID_CREDITO           :String;
   vlEJERCICIO            :String;
   vlEMPRESA              :String;

   vlAntB_REPORTA_SAT     :String;
   //
   vlAntNUM_REG_FIDE      :String;
   vlAntPROP_DEDUCIBLE    :String;
   vlAntPCT_PARTICIPACION :String;
   vlAntPCT_COP_SOC_CONY  :String;
   //
   vlAntSDO_CIE_ANIO_ANT  :String;
   vlAntSDO_PROMEDIO      :String;
   vlAntSDO_FEC_CONTR     :String;
   //
   vlAntF_TIPO_UDI_INI    :String;
   vlAntF_TIPO_UDI_FIN    :String;
   //
   vlAntIMP_INT_NOM_DEV   :String;
   vlAntIMP_INT_PAG_ORD   :String;
   vlAntIMP_INT_MOR_DEV   :String;
   vlAntIMP_INT_MOR_PAG   :String;
   vlAntIMP_INT_REAL      :String;
   //
   vlAntDOMICILIO         :String;
   vlAntDOMICILIO_INMU    :String;

   VLSalida  :  boolean;
   VLMsg     :  String;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TSatCrLay.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,True);
                ID_EMPRESA.Caption:='Número de Empresa';
      EJERCICIO :=CreaCampo('EJERCICIO',ftFloat,tsNinguno,tsNinguno,True);
                EJERCICIO.Caption:='Ejercicio';
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO.Caption:='Número de Contrato';
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Número de Credito';
      SDO_PROMEDIO :=CreaCampo('SDO_PROMEDIO',ftFloat,tsNinguno,tsNinguno,True);
                SDO_PROMEDIO.Caption:='Sdo Promedio';
      TIPO_REGISTRO :=CreaCampo('TIPO_REGISTRO',ftFloat,tsNinguno,tsNinguno,True);
                TIPO_REGISTRO.Caption:='Tipo Registro';
      CONSECUTIVO :=CreaCampo('CONSECUTIVO',ftFloat,tsNinguno,tsNinguno,True);
                CONSECUTIVO.Caption:='Consecutivo';
      CVE_IDENTIFICADOR :=CreaCampo('CVE_IDENTIFICADOR',ftFloat,tsNinguno,tsNinguno,True);
                CVE_IDENTIFICADOR.Caption:='Clave de Identificador';
      RFC_CURP :=CreaCampo('RFC_CURP',ftString,tsNinguno,tsNinguno,True);
                RFC_CURP.Caption:='Rfc Curp';
      NOMBRE_TIT :=CreaCampo('NOMBRE_TIT',ftString,tsNinguno,tsNinguno,True);
                NOMBRE_TIT.Caption:='Nombre Tit';
      DOMICILIO :=CreaCampo('DOMICILIO',ftString,tsNinguno,tsNinguno,True);
                DOMICILIO.Caption:='Domicilio';
      NUM_REFERENCIA :=CreaCampo('NUM_REFERENCIA',ftString,tsNinguno,tsNinguno,True);
                NUM_REFERENCIA.Caption:='Número Referencia';
      NUM_REG_FIDE :=CreaCampo('NUM_REG_FIDE',ftString,tsNinguno,tsNinguno,True);
                NUM_REG_FIDE.Caption:='Número Reg Fide';
      CVE_DEST_CREDITO :=CreaCampo('CVE_DEST_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                CVE_DEST_CREDITO.Caption:='Clave de Dest Credito';
      IMP_INT_NOM_DEV :=CreaCampo('IMP_INT_NOM_DEV',ftFloat,tsNinguno,tsNinguno,True);
                IMP_INT_NOM_DEV.Caption:='Imp Int Nombre Dev';
      IMP_INT_PAG_ORD :=CreaCampo('IMP_INT_PAG_ORD',ftFloat,tsNinguno,tsNinguno,True);
                IMP_INT_PAG_ORD.Caption:='Imp Int Pag Ord';
      IMP_INT_MOR_DEV :=CreaCampo('IMP_INT_MOR_DEV',ftFloat,tsNinguno,tsNinguno,True);
                IMP_INT_MOR_DEV.Caption:='Imp Int Mor Dev';
      IMP_INT_MOR_PAG :=CreaCampo('IMP_INT_MOR_PAG',ftFloat,tsNinguno,tsNinguno,True);
                IMP_INT_MOR_PAG.Caption:='Imp Int Mor Pag';
      IMP_INT_REAL :=CreaCampo('IMP_INT_REAL',ftFloat,tsNinguno,tsNinguno,True);
                IMP_INT_REAL.Caption:='Imp Int Real';
      SDO_CIE_ANIO_ANT :=CreaCampo('SDO_CIE_ANIO_ANT',ftFloat,tsNinguno,tsNinguno,True);
                SDO_CIE_ANIO_ANT.Caption:='Sdo Cie Anio Ant';
      SDO_FEC_CONTR :=CreaCampo('SDO_FEC_CONTR',ftFloat,tsNinguno,tsNinguno,True);
                SDO_FEC_CONTR.Caption:='Sdo Fec Contr';
      F_CONTRATACION :=CreaCampo('F_CONTRATACION',ftFloat,tsNinguno,tsNinguno,True);
                F_CONTRATACION.Caption:='Fecha Contratacion';
      PROP_DEDUCIBLE :=CreaCampo('PROP_DEDUCIBLE',ftFloat,tsNinguno,tsNinguno,True);
                PROP_DEDUCIBLE.Caption:='Prop Deducible';
      PCT_COP_SOC_CONY :=CreaCampo('PCT_COP_SOC_CONY',ftFloat,tsNinguno,tsNinguno,True);
                PCT_COP_SOC_CONY.Caption:='Pct Cop Soc Cony';
      NUM_COPROPIET :=CreaCampo('NUM_COPROPIET',ftFloat,tsNinguno,tsNinguno,True);
                NUM_COPROPIET.Caption:='Número Copropiet';
      RFC_CURP_COPRO :=CreaCampo('RFC_CURP_COPRO',ftString,tsNinguno,tsNinguno,True);
                RFC_CURP_COPRO.Caption:='Rfc Curp Copro';
      NOMBRE_COPRO :=CreaCampo('NOMBRE_COPRO',ftString,tsNinguno,tsNinguno,True);
                NOMBRE_COPRO.Caption:='Nombre Copro';
      RFC_CURP_CONYU :=CreaCampo('RFC_CURP_CONYU',ftString,tsNinguno,tsNinguno,True);
                RFC_CURP_CONYU.Caption:='Rfc Curp Conyu';
      NOMBRE_CONYU :=CreaCampo('NOMBRE_CONYU',ftString,tsNinguno,tsNinguno,True);
                NOMBRE_CONYU.Caption:='Nombre Conyu';
      DOMICILIO_INMU :=CreaCampo('DOMICILIO_INMU',ftString,tsNinguno,tsNinguno,True);
                DOMICILIO_INMU.Caption:='Domicilio Inmu';
      NUM_IMPRESION :=CreaCampo('NUM_IMPRESION',ftFloat,tsNinguno,tsNinguno,True);
                NUM_IMPRESION.Caption:='Número Impresion';
      PCT_PARTICIPACION :=CreaCampo('PCT_PARTICIPACION',ftFloat,tsNinguno,tsNinguno,True);
                PCT_PARTICIPACION.Caption:='Pct Participacion';
      F_IMPRESION :=CreaCampo('F_IMPRESION',ftDate,tsNinguno,tsNinguno,True);
                F_IMPRESION.Caption:='Fecha Impresion';
//      NOMBRE_TIT_ARCH :=CreaCampo('NOMBRE_TIT_ARCH',ftString,tsNinguno,tsNinguno,True);
//                NOMBRE_TIT_ARCH.Caption:='Nombre Tit Arch';
      B_REPORTA_SAT :=CreaCampo('B_REPORTA_SAT',ftString,tsNinguno,tsNinguno,True);
                B_REPORTA_SAT.Caption:='Reporta Sat';
      F_TIPO_UDI_INI :=CreaCampo('F_TIPO_UDI_INI',ftDate,tsNinguno,tsNinguno,True);
                F_TIPO_UDI_INI.Caption:='Fecha Tipo Udi Ini';
      F_TIPO_UDI_FIN :=CreaCampo('F_TIPO_UDI_FIN',ftDate,tsNinguno,tsNinguno,True);
                F_TIPO_UDI_FIN.Caption:='Fecha Tipo Udi Fin';
      FKeyFields.Add('ID_EMPRESA');
      FKeyFields.Add('EJERCICIO');
      FKeyFields.Add('ID_CONTRATO');
      FKeyFields.Add('ID_CREDITO');

      TableName := 'SAT_CRE_LAYOUT'; 
      UseQuery := True; 
      HelpFile := 'IntSatCrLay.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TSatCrLay.Destroy;
begin inherited;
end;


function TSatCrLay.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWSatCrLayout;
begin
   W:=TWSatCrLayout.Create(Self);
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

Function TSatCrLay.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ISaCrLay.it','F,F,F,F');
      Try if Active then begin T.Param(0,ID_EMPRESA.AsString);
                               T.Param(1,EJERCICIO.AsString);
                               T.Param(2,ID_CONTRATO.AsString);
                               T.Param(3,ID_CREDITO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3)]);
      finally  T.Free;
      end;
end;

Function TSatCrLay.InsertaBitacora: Boolean;
var vlResult      : Boolean;
    STPInsBitacora : TStoredProc;
Begin
    vlResult := False;

    STPInsBitacora := TStoredProc.Create(Self);
    try
       with STPInsBitacora do
       begin
          STPInsBitacora.DatabaseName:= Apli.DatabaseName;
          STPInsBitacora.SessionName:= Apli.SessionName;
          STPInsBitacora.StoredProcName:='PKGCRSAT_HIPO.STP_SATBITACORA';

          // Se crean los parametros del StoreProcedure
          Params.Clear;
          Params.CreateParam(ftFloat,  'peID_CREDITO',ptInput);
          Params.CreateParam(ftFloat,  'peEJERCICIO',ptInput);
          Params.CreateParam(ftFloat,  'peEMPRESA',ptInput);
          Params.CreateParam(ftString, 'peB_REPORTA_SAT',ptInput);
          Params.CreateParam(ftString, 'peNUM_REG_FIDE',ptInput);
          Params.CreateParam(ftFloat,  'pePROP_DEDUCIBLE',ptInput);
          Params.CreateParam(ftFloat,  'pePCT_PARTICIPACION',ptInput);
          Params.CreateParam(ftFloat,  'pePCT_COP_SOC_CONY',ptInput);
          Params.CreateParam(ftFloat,  'peSDO_CIE_ANIO_ANT',ptInput);
          Params.CreateParam(ftFloat,  'peSDO_PROMEDIO',ptInput);
          Params.CreateParam(ftFloat,  'peSDO_FEC_CONTR',ptInput);
          Params.CreateParam(ftString, 'peF_TIPO_UDI_INI',ptInput);
          Params.CreateParam(ftString, 'peF_TIPO_UDI_FIN',ptInput);
          Params.CreateParam(ftFloat,  'peIMP_INT_NOM_DEV',ptInput);
          Params.CreateParam(ftFloat,  'peIMP_INT_PAG_ORD',ptInput);
          Params.CreateParam(ftFloat,  'peIMP_INT_MOR_DEV',ptInput);
          Params.CreateParam(ftFloat,  'peIMP_INT_MOR_PAG',ptInput);
          Params.CreateParam(ftFloat,  'peIMP_INT_REAL',ptInput);
          Params.CreateParam(ftString, 'peDOMICILIO',ptInput);
          Params.CreateParam(ftString, 'peDOMICILIO_INMU',ptInput);
          Params.CreateParam(ftString, 'peCVE_USU_ALTA',ptInput);
          Params.CreateParam(ftString, 'peBCommit',ptInput);
          //
          Params.CreateParam(ftFloat,  'psResultado',ptOutput);
          Params.CreateParam(ftString, 'psTxResultado',ptOutput);

    //  Se quita el Prepare;
          ParamByName('peID_CREDITO').AsFloat        := StrToInt(vlID_CREDITO);
          ParamByName('peEJERCICIO').AsFloat         := StrToInt(vlEJERCICIO);
          ParamByName('peEMPRESA').AsFloat           := StrToInt(vlEMPRESA);

          ParamByName('peB_REPORTA_SAT').AsString    := vlAntB_REPORTA_SAT;
          ParamByName('peNUM_REG_FIDE').AsString     := vlAntNUM_REG_FIDE;
          ParamByName('pePROP_DEDUCIBLE').AsFloat    := StrToFloat(vlAntPROP_DEDUCIBLE);
          ParamByName('pePCT_PARTICIPACION').AsFloat := StrToFloat(vlAntPCT_PARTICIPACION);
          ParamByName('pePCT_COP_SOC_CONY').AsFloat  := StrToFloat(vlAntPCT_COP_SOC_CONY);
          ParamByName('peSDO_CIE_ANIO_ANT').AsFloat  := StrToFloat(vlAntSDO_CIE_ANIO_ANT);
          ParamByName('peSDO_PROMEDIO').AsFloat      := StrToFloat(vlAntSDO_PROMEDIO);
          ParamByName('peSDO_FEC_CONTR').AsFloat    := StrToFloat(vlAntSDO_FEC_CONTR);
          ParamByName('peF_TIPO_UDI_INI').AsString   := vlAntF_TIPO_UDI_INI;
          ParamByName('peF_TIPO_UDI_FIN').AsString   := vlAntF_TIPO_UDI_FIN;
          ParamByName('peIMP_INT_NOM_DEV').AsFloat   := StrToFloat(vlAntIMP_INT_NOM_DEV );
          ParamByName('peIMP_INT_PAG_ORD').AsFloat   := StrToFloat(vlAntIMP_INT_PAG_ORD);
          ParamByName('peIMP_INT_MOR_DEV').AsFloat   := StrToFloat(vlAntIMP_INT_MOR_DEV);
          ParamByName('peIMP_INT_MOR_PAG').AsFloat   := StrToFloat(vlAntIMP_INT_MOR_PAG);
          ParamByName('peIMP_INT_REAL').AsFloat      := StrToFloat(vlAntIMP_INT_REAL);
          ParamByName('peDOMICILIO').AsString        := vlAntDOMICILIO;
          ParamByName('peDOMICILIO_INMU').AsString   := vlAntDOMICILIO_INMU;
          ParamByName('peCVE_USU_ALTA').AsString     := Apli.Usuario;
          ParamByName('peBCommit').AsString          := 'V';
          //
          ExecProc;

          if ParamByName('PSResultado').AsInteger = 0 then
          begin
             vlResult := True;
          end
          else // SI NO REALIZA LA CARGA MANDA ERRORES
          Begin
             ShowMessage('Alta de Bitacora, Error [ ' +
                         ParamByName('psRESULTADO').AsString + '] ' +
                         ParamByName('psTxResultado').AsString);
          end;
          UnPrepare;
       end;
    finally
       STPInsBitacora.Free;
    end;  
    InsertaBitacora := vlResult;
End;

//Sobreescribiendo el Internal Post
Function TSatCrLay.InternalPost : Boolean;
Var       VLSalida     : Boolean;
begin
     InternalPost := False;
     VLSalida := False;

     if Modo=moAppend then
     begin
          Result:=Inherited InternalPost;
          VLSalida := True;
     end;

     if Modo= moEdit then
     begin
        VLSalida := Inherited InternalPost;
        if VLSalida then
        begin
          try
             if InsertaBitacora then
             Begin
                VLSalida := True;
             end;
          Except
            on e: exception do
            bEGIN
             Beep;Beep;Beep;Beep;
             ShowMessage('Problemas con el Alta de la Bitacora');
             ShowMessage(e.Message);
            end;
           end;
        end;
     end;
     InternalPost := VLSalida;
End;


function TSatCrLay.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA SAT_CRE_LAYOUT********************)
(*                                                                              *)
(*  FORMA DE SAT_CRE_LAYOUT                                                            *)
(*                                                                              *)
(***********************************************FORMA SAT_CRE_LAYOUT********************)

procedure TWSatCrLayout.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_EMPRESA.Control:=edID_EMPRESA;
      Objeto.EJERCICIO.Control:=edEJERCICIO;
      Objeto.ID_CONTRATO.Control:=edID_CONTRATO;
      Objeto.ID_CREDITO.Control:=edID_CREDITO;
      Objeto.SDO_PROMEDIO.Control:=edSDO_PROMEDIO;
      Objeto.TIPO_REGISTRO.Control:=edTIPO_REGISTRO;
      Objeto.CONSECUTIVO.Control:=edCONSECUTIVO;
      Objeto.CVE_IDENTIFICADOR.Control:=edCVE_IDENTIFICADOR;
      Objeto.RFC_CURP.Control:=edRFC_CURP;
      Objeto.NOMBRE_TIT.Control:=edNOMBRE_TIT;
      Objeto.DOMICILIO.Control:=edDOMICILIO;
      Objeto.NUM_REFERENCIA.Control:=edNUM_REFERENCIA;
      Objeto.NUM_REG_FIDE.Control:=edNUM_REG_FIDE;
      Objeto.CVE_DEST_CREDITO.Control:=edCVE_DEST_CREDITO;
      Objeto.IMP_INT_NOM_DEV.Control:=edIMP_INT_NOM_DEV;
      Objeto.IMP_INT_PAG_ORD.Control:=edIMP_INT_PAG_ORD;
      Objeto.IMP_INT_MOR_DEV.Control:=edIMP_INT_MOR_DEV;
      Objeto.IMP_INT_MOR_PAG.Control:=edIMP_INT_MOR_PAG;
      Objeto.IMP_INT_REAL.Control:=edIMP_INT_REAL;
      Objeto.SDO_CIE_ANIO_ANT.Control:=edSDO_CIE_ANIO_ANT;
      Objeto.SDO_FEC_CONTR.Control:=edSDO_FEC_CONTR;
      Objeto.F_CONTRATACION.Control:=edF_CONTRATACION;
      Objeto.PROP_DEDUCIBLE.Control:=edPROP_DEDUCIBLE;
      Objeto.PCT_COP_SOC_CONY.Control:=edPCT_COP_SOC_CONY;
      Objeto.NUM_COPROPIET.Control:=edNUM_COPROPIET;
      Objeto.RFC_CURP_COPRO.Control:=edRFC_CURP_COPRO;
      Objeto.NOMBRE_COPRO.Control:=edNOMBRE_COPRO;
      Objeto.RFC_CURP_CONYU.Control:=edRFC_CURP_CONYU;
      Objeto.NOMBRE_CONYU.Control:=edNOMBRE_CONYU;
      Objeto.DOMICILIO_INMU.Control:=edDOMICILIO_INMU;
      Objeto.NUM_IMPRESION.Control:=edNUM_IMPRESION;
      Objeto.PCT_PARTICIPACION.Control:=edPCT_PARTICIPACION;
      Objeto.F_IMPRESION.Control:=edF_IMPRESION;
//      Objeto.NOMBRE_TIT_ARCH.Control:=edNOMBRE_TIT_ARCH;
      Objeto.B_REPORTA_SAT.Control:=chB_REPORTA_SAT;
      Objeto.F_TIPO_UDI_INI.Control:=edF_TIPO_UDI_INI;
      Objeto.F_TIPO_UDI_FIN.Control:=edF_TIPO_UDI_FIN;

      InterForma1.BtnNuevo.Visible:=false;
      InterForma1.BtnBuscar.Visible:=false;
      InterForma1.BtnEliminar.Visible:=false;

      vlID_CREDITO           :=edID_CREDITO.Text;
      vlEJERCICIO            :=edEJERCICIO.Text;
      vlEMPRESA              :=edID_EMPRESA.Text;

      if (chB_REPORTA_SAT.Checked = true) then
         vlAntB_REPORTA_SAT:='V'
      else
         vlAntB_REPORTA_SAT:='V';
      //
      vlAntNUM_REG_FIDE      :=edNUM_REG_FIDE.Text;
      vlAntPROP_DEDUCIBLE    :=edPROP_DEDUCIBLE.Text;
      vlAntPCT_PARTICIPACION :=edPCT_PARTICIPACION.Text;
      vlAntPCT_COP_SOC_CONY  :=edPCT_COP_SOC_CONY.Text;
      //
      vlAntSDO_CIE_ANIO_ANT  :=edSDO_CIE_ANIO_ANT.Text;
      vlAntSDO_PROMEDIO      :=edSDO_PROMEDIO.Text;
      vlAntSDO_FEC_CONTR     :=edSDO_FEC_CONTR.Text;
      //
      vlAntF_TIPO_UDI_INI    :=edF_TIPO_UDI_INI.Text;
      vlAntF_TIPO_UDI_FIN    :=edF_TIPO_UDI_FIN.Text;
      //
      vlAntIMP_INT_NOM_DEV   :=edIMP_INT_NOM_DEV.Text;
      vlAntIMP_INT_PAG_ORD   :=edIMP_INT_PAG_ORD.Text;
      vlAntIMP_INT_MOR_DEV   :=edIMP_INT_MOR_DEV.Text;
      vlAntIMP_INT_MOR_PAG   :=edIMP_INT_MOR_PAG.Text;
      vlAntIMP_INT_REAL      :=edIMP_INT_REAL.Text;
      //
      vlAntDOMICILIO         :=edDOMICILIO.Text;
      vlAntDOMICILIO_INMU    :=edDOMICILIO_INMU.Text;
      InterForma1.MsgPanel := MsgPanel;      
end;

procedure TWSatCrLayout.FormDestroy(Sender: TObject);
begin
      Objeto.ID_EMPRESA.Control:=nil;
      Objeto.EJERCICIO.Control:=nil;
      Objeto.ID_CONTRATO.Control:=nil;
      Objeto.ID_CREDITO.Control:=nil;
      Objeto.SDO_PROMEDIO.Control:=nil;
      Objeto.TIPO_REGISTRO.Control:=nil;
      Objeto.CONSECUTIVO.Control:=nil;
      Objeto.CVE_IDENTIFICADOR.Control:=nil;
      Objeto.RFC_CURP.Control:=nil;
      Objeto.NOMBRE_TIT.Control:=nil;
      Objeto.DOMICILIO.Control:=nil;
      Objeto.NUM_REFERENCIA.Control:=nil;
      Objeto.NUM_REG_FIDE.Control:=nil;
      Objeto.CVE_DEST_CREDITO.Control:=nil;
      Objeto.IMP_INT_NOM_DEV.Control:=nil;
      Objeto.IMP_INT_PAG_ORD.Control:=nil;
      Objeto.IMP_INT_MOR_DEV.Control:=nil;
      Objeto.IMP_INT_MOR_PAG.Control:=nil;
      Objeto.IMP_INT_REAL.Control:=nil;
      Objeto.SDO_CIE_ANIO_ANT.Control:=nil;
      Objeto.SDO_FEC_CONTR.Control:=nil;
      Objeto.F_CONTRATACION.Control:=nil;
      Objeto.PROP_DEDUCIBLE.Control:=nil;
      Objeto.PCT_COP_SOC_CONY.Control:=nil;
      Objeto.NUM_COPROPIET.Control:=nil;
      Objeto.RFC_CURP_COPRO.Control:=nil;
      Objeto.NOMBRE_COPRO.Control:=nil;
      Objeto.RFC_CURP_CONYU.Control:=nil;
      Objeto.NOMBRE_CONYU.Control:=nil;
      Objeto.DOMICILIO_INMU.Control:=nil;
      Objeto.NUM_IMPRESION.Control:=nil;
      Objeto.PCT_PARTICIPACION.Control:=nil;
      Objeto.F_IMPRESION.Control:=nil;
//      Objeto.NOMBRE_TIT_ARCH.Control:=nil;
      Objeto.B_REPORTA_SAT.Control:=nil;
      Objeto.F_TIPO_UDI_INI.Control:=nil;
      Objeto.F_TIPO_UDI_FIN.Control:=nil;
   //Objeto
end;

procedure TWSatCrLayout.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWSatCrLayout.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWSatCrLayout.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWSatCrLayout.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWSatCrLayout.edNUM_REG_FIDEExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edNUM_REG_FIDE,True,'',True);
end;

procedure TWSatCrLayout.edPROP_DEDUCIBLEExit(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMsg     := '';
      VlSalida  := True;
      Objeto.PROP_DEDUCIBLE.GetFromControl;
      if Objeto.PROP_DEDUCIBLE.AsFloat > 100 then
      Begin
         VLMsg := 'Favor de Capturar Porcentajes Menores o Iguales a 100';
         VlSalida   := False;
      end;
      InterForma1.ValidaExit(edPROP_DEDUCIBLE,VLSalida,VLMsg,True);
   end;
end;

procedure TWSatCrLayout.edPCT_PARTICIPACIONExit(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMsg     := '';
      VlSalida  := True;
      Objeto.PCT_PARTICIPACION.GetFromControl;
      if Objeto.PCT_PARTICIPACION.AsFloat > 100 then
      Begin
         VLMsg := 'Favor de Capturar Porcentajes Menores o Iguales a 100';
         VlSalida   := False;
      end;
      InterForma1.ValidaExit(edPCT_PARTICIPACION,VLSalida,VLMsg,True);
   end;
end;

procedure TWSatCrLayout.edPCT_COP_SOC_CONYExit(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMsg     := '';
      VlSalida  := True;
      Objeto.PCT_COP_SOC_CONY.GetFromControl;
      if Objeto.PCT_COP_SOC_CONY.AsFloat > 100 then
      Begin
         VLMsg := 'Favor de Capturar Porcentajes Menores o Iguales a 100';
         VlSalida   := False;
      end;
      InterForma1.ValidaExit(edPCT_COP_SOC_CONY,VLSalida,VLMsg,True);
   end;
end;

procedure TWSatCrLayout.edSDO_CIE_ANIO_ANTExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edSDO_CIE_ANIO_ANT,True,'',True);
end;

procedure TWSatCrLayout.edSDO_PROMEDIOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edSDO_PROMEDIO,True,'',True);
end;

procedure TWSatCrLayout.edSDO_FEC_CONTRExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edSDO_FEC_CONTR,True,'',True);
end;

procedure TWSatCrLayout.edF_TIPO_UDI_INIExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edF_TIPO_UDI_INI,True,'',True);
end;

procedure TWSatCrLayout.edF_TIPO_UDI_FINExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edF_TIPO_UDI_FIN,True,'',True);
end;

procedure TWSatCrLayout.edIMP_INT_NOM_DEVExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edIMP_INT_NOM_DEV,True,'',True);
end;

procedure TWSatCrLayout.edIMP_INT_PAG_ORDExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edIMP_INT_PAG_ORD,True,'',True);
end;

procedure TWSatCrLayout.edIMP_INT_MOR_DEVExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edIMP_INT_MOR_DEV,True,'',True);
end;

procedure TWSatCrLayout.edIMP_INT_MOR_PAGExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edIMP_INT_MOR_PAG,True,'',True);
end;

procedure TWSatCrLayout.edIMP_INT_REALExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edIMP_INT_REAL,True,'',True);
end;

procedure TWSatCrLayout.edDOMICILIOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDOMICILIO,True,'',True);
end;

procedure TWSatCrLayout.edDOMICILIO_INMUExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDOMICILIO_INMU,True,'',True);
end;

procedure TWSatCrLayout.btBITACORA_CREDClick(Sender: TObject);
var
    Crbitchip  : TCrbitchip;
begin
   if Objeto.ValidaAccesoEsp('TSATCRLAY_BITCRE',True,True) then
   begin
        Crbitchip := TCrbitchip.Create(self);
        try
           Crbitchip.Apli := objeto.Apli;
           Crbitchip.ParamCre := Objeto.ParamCre;
           Crbitchip.GetParams(Objeto);
           Crbitchip.vConsulta:=' SELECT ID_CREDITO, TX_DESCRIPCION, TX_ORIGINAL, '+
                                '        TX_MODIFICADO, CVE_USU_ALTA, F_ALTA '+
                                '   FROM CR_BIT_SAT_LAYOUT '+
                                '  WHERE ID_EMPRESA = '+edID_EMPRESA.Text+
                                '    AND EJERCICIO  = '+edEJERCICIO.Text+
                                '    AND ID_CREDITO = '+edID_CREDITO.Text+
                                '  ORDER BY ID_CONSEC ';
           Crbitchip.Catalogo;
        finally
           Crbitchip.Free;
        end;
   end;
end;

procedure TWSatCrLayout.btBITACORA_TOTClick(Sender: TObject);
var
    Crbitchip  : TCrbitchip;
begin
   if Objeto.ValidaAccesoEsp('TSATCRLAY_BITGEN',True,True) then
   begin
        Crbitchip := TCrbitchip.Create(self);
        try
           Crbitchip.Apli := objeto.Apli;
           Crbitchip.ParamCre := Objeto.ParamCre;
           Crbitchip.GetParams(Objeto);
           Crbitchip.vConsulta:=' SELECT ID_CREDITO, TX_DESCRIPCION, TX_ORIGINAL, '+
                                '        TX_MODIFICADO, CVE_USU_ALTA, F_ALTA '+
                                '   FROM CR_BIT_SAT_LAYOUT '+
                                '  WHERE ID_EMPRESA = '+edID_EMPRESA.Text+
                                '    AND EJERCICIO  = '+edEJERCICIO.Text+
                                '  ORDER BY ID_CONSEC ';
           Crbitchip.Catalogo;
        finally
           Crbitchip.Free;
        end;
   end;
end;

end.
