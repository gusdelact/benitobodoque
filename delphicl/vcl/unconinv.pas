unit UnConInv;
//------------------------------------------------------------------------------
//* Sistema     : Sistema de Inversiones
//* Descripción : Constantes y funciones comunes en el sistema.
//* Fecha       : Junio de 1999
//* Desarrollo  : Marcos Zárate Castro.
//------------------------------------------------------------------------------

interface
Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterApl, UnSQL2, Printers,
  IntFrm, IntSucuBloq, UnGene,  NMSMTP;

Const
    cVerdad     =         'V';      //Verdadero
    cFalso      =         'F';      //Falso
    cRenTotal   =         'TO';     //Renovación Total
    cInactivo   =         'IN';     //Situación Inactivo
    cActivo     =         'AC';     //Situación Activo
    cCancelado  =         'CA';     //Situación Cancelado
    cRenovado   =         'RE';     //Situación Renovado
    cVencido    =         'VE';     //Situación Vencido
    cRenCancel  =         'RC';     //Situación Renovación Cancelada
    cPorActivar =         'PA';     //Situación Por Activar
    cPorAutoriz =         'PU';     //Situación Por Autorizar
    cNoAutorizado =       'NA';     //Situación No Autorizado (Maker-Chequer)
    cNoRenovar  =         'NA';     //No Renovar
    cPRLVPF     =         'PRLVPF'; //PRLV Persona física
    cPRLVPM     =         'PRLVPM'; //PRLV Persona moral
    cPRLVUDI    =         'PRLVUDI';//PRLV Persona Udis
    cPRLVIFPF   =         'PRLVIF'; //PRLV Persona Inter Financial Dólares
    cPRLVIFPM   =         'PRLVIF'; //PRLV Persona Moral Inter Financial Dólares
    cPRLVIFMXPF =         'PRLVIFMX'; //PRLV Persona Física Inter Financial Pesos
    cPRLVIFMXPM =         'PRLVIFMX'; //PRLV Persona Moral Inter Financial Pesos
    cPBCODLLSPF =         'PRLVBDLS'; //PRLV Persona Física Banco Dólares
    cPBCODLLSPM =         'PRLVBDLS'; //PRLV Persona Moral Banco Dólares
    cAltaPagare =         'AP';     //Alta de Pagaré
    cCancPagare =         'CP';     //Cancelando pagaré
    cModPagare  =         'MP';     //Modificando pagaré
    cAltPagPAu  =         'AA';     //Alta de pagaré por autorizar
    cInterFin   =         5;        //Empresa de InterFinancial
    cBanco      =         2;        //Empresa Banco
    cBancoDls   =         11;       //Empresa Banco Dólares
    cBancoNM    =         297002;   //Empresa Banco Dólares Buevos Negocios
    CeNTIDnm    =         165;      //Entidad de Nuevos negocios
    cPersFisica =         'PF';     //Personalidad Jurídica Persona Física
    cPersMoral  =         'PM';     //Personalidad Jurídica Persona Moral
    cPesos      =         484;      //Moneda Pesos
    cUdis       =         800;      //Moneda Udis
    cDolares    =         840;      //Moneda dólares
    cDiaL24h    =         'D001';   //Día de liquidación 24 Horas
    cDiaL48H    =         'D002';
    cDVINVE     =         'DVINVE';
    cRAINVE     =         'RAINVE';
    cCMPSDO     =         'CMPSDO';
    cDCPSDO     =         'DCPSDO';
    cDSDCCO     =         'DSDCCO';
    cCSDCCO     =         'CSDCCO';
    cEdoCtaIFS  =         'EIFC';    //CLAVE
    cRHostECIF  =         '/internet/ftp/digdoc/doc05';   // Ruta dentro del Host para estados de cuenta de Interfinancial
    cEdoCtaBD   =         'EBDL';    //CLAVE
    cRHostECBD  =         '/internet/ftp/digdoc/doc05';   // Ruta dentro del Host para estados de cuenta de Bco. Dlls.
    cEdoCtaPRLV =         'EPRL';    // Clave
    cRHostECPRLV=         '/internet/ftp/digdoc/doc06';   // Ruta dentro del Host para estados de cuenta de INVERSIONES EN PESOS
    cMexico     =         'PAMEXI';  //México
    cUSA        =         'PAEUA';   //USA
    cExtDig     =         '.pdf';

    
function BuscaFApertura(pId_Contrato : TInterCampo;
                        pB_SalvoSBC  : TInterCampo;
                        pF_Alta      : TInterCampo;
                        pF_Apertura  : TInterCampo;
                        Var pDescProc:String;
                        pApli        : TInterApli):Boolean;

function CalculaImportes(pImp_Capital  : TInterCampo;
                         pTasa_Neta    : TInterCampo;
                         pPct_Isr      : TInterCampo;
                         pDias_Plazo   : TInterCampo;
                         pTasa_Bruta   : TInterCampo;
                         pImp_Isr      : TInterCampo;
                         pImp_Int_Bruto: TInterCampo;
                         pImp_Int_Neto : TInterCampo;
                         pImp_Neto_Vto : TInterCampo;
                         pF_VENCTO     : TInterCampo; //MARA4356 ENE 2008 PARA PARAMETRIZAR EL FACTOR DE ISR
                         Var pDescProc : String;
                         pApli         : TInterApli):Boolean;

function BuscaTasa(pID_CONTRATO : TInterCampo;
                   pIMP_CAPITAL : TInterCampo;
                   pDIAS_PLAZO  : TInterCampo;
                   pTASA_ASIG   : TInterCampo;
                   pTASA_COSTO  : TInterCampo;
                   Var pDescProc: String;
                   pApli        : TInterapli):Boolean;


function BuscaPctISR(pID_CONTRATO : TInterCampo;
                     pIMP_CAPITAL : TInterCampo;
                     pDIAS_PLAZO  : TInterCampo;
                     //pTASA_NETA   : TInterCampo; // MARA4356 FEB 2008 CAPTURA DE TASAS BRUTAS
                     pTASA_BRUTA  : TInterCampo; // MARA4356 FEB 2008 CAPTURA DE TASAS BRUTAS
                     pPCT_ISR     : TInterCampo;
                     pF_VENCTO    : TInterCampo; //MARA4356 DIC 2007 PARA PARAMETRIZAR EL % ISR
                     pApli        : TInterapli):Boolean;

function ObtenTCambio(pContrato:TInterFrame;
                      pF_Apertura : TInterCampo):Double;

function Renovacion(pId_Contrato   : TInterCampo;
                    pId_Pagare     : TInterCampo;
                    pCve_Tip_Renov : String;
                    pF_Apertura    : TInterCampo;
                    pF_Vencimiento : TInterCampo;
                    pF_OperaCto    : TDateTime;
                    pInstr_Caj     : String;
                    pId_Empresa    : TInterCampo;
                    pId_Sucursal   : TInterCampo;
                    pCveAsigTasa   : String;
                    pCveTasBtaAsig : Double;
                    Var pDescProc  : String;
                    pApli          : TInterApli):Boolean;

function PuedeModifTasa(pObjeto:TInterFrame):Boolean;

function EsAdministrador(pObjeto:TInterFrame):Boolean;

function AfectaFestivo(pContrato      : TInterFrame;
                       pPais          : String;
                       pFECHA         : TInterCampo):Boolean;

function ObtenPersJur(pContrato:TInterFrame):String;

function ObtenFecOper(pContrato:TInterFrame):TDateTime;

function ObtenEntidad(pContrato:TInterFrame):Double;

procedure MensajePanel(pMsg :String; pDlgType : TMsgDlgType; pButtons : TMsgDlgButtons; pHelpCtx : Integer; pMemo : TMemo);

function BuscaTasaCurva(pApli          : TInterApli;
                        pDiasPlazo     : Integer;
                        pTasaLarga     :Double;
                        pNuevoPlazo    : Integer;
                        Var pNuevaTasa : Double):Boolean;

function PuedeVencerAnt(pObjeto:TInterFrame):Boolean;

function SucuBloqueada(pObjeto:TInterFrame;pIdSucursal:String;pEmpresa:String): Boolean;

function ObtTCamb(pMoneda:Integer;pApli:TInterApli;pFecha:TDateTime):Double;

function BuscaFLiq(pDiaLiq   :String;
                   pApli     : TInterApli;
                   pFechaRef : TDateTime;
                   Var pFech24Hrs: TDateTime):Boolean;

function PuedeOperarIFSPesos(pObjeto:TInterFrame):Boolean;

function EsUnBanco(pApli:TInterApli; pIdCotrato:Integer):Boolean;

function SaldoDisp(pContrato:TInterFrame) : Double;

function Buscames(pMes:Integer) : String;

function DlookUP(pDatabasename:String;pSessionName:String;pColumna:String;pTabla:String;pWhere:String):String;

function EnviaMail(pHost: String; pMailOrigen:String; pAsunto:String; pMailDestino:String; pMensaje:String;pNomArchivo : String):Boolean;

//Verif.ImpMinProd.M.Zarate. 14-mar-2005
procedure VerImpMinProd(pApli : TInterApli; peCveProd:String; pImporte : Double; Var pCodResp  :Integer; Var pDescProc :String);

//MARA4356 ENE 2008 Busca el año comercial o el año natural para el calculo de isr y de la tasa bruta
function BuscaAno(pApli : TInterApli; pFecha,pTipoAno,pOperador : String):Integer;

//MARA4356 ENE 2008 CALCULA LA TASA NETA A PARTIR DE LA TASA BRUTA Y EL ISR
function BuscaTasaNeta(pApli       : TInterApli; 
                       pPct_Isr    : TInterCampo;
                       pTasa_Bruta : TInterCampo;
                       pF_VENCTO   : TInterCampo;
                       pTasa_Neta  : TInterCampo):Boolean;

function BuscaTasaLimit(pDIAS_PLAZO  : TInterCampo;
                   	Var pTasa    : Double;
                   	pApli        : TInterapli):Boolean;

implementation

function BuscaFApertura(pId_Contrato : TInterCampo;
                        pB_SalvoSBC  : TInterCampo;
                        pF_Alta      : TInterCampo;
                        pF_Apertura  : TInterCampo;
                        Var pDescProc:String;
                        pApli        : TInterApli):Boolean;
Var sp       : TStoredProc;
    CodResp  : Double;
    Descproc : String;
begin //Busca la fecha de liquidación para una Fecha de Valor específica
    BuscaFApertura:=False;
    sp:=TStoredProc.Create(Nil);
    try
       sp.DatabaseName:=pApli.DataBaseName;
       sp.SessionName :=pApli.SessionName;
       sp.StoredProcName:='PKGINVERS.STPCALCULAAPERTURA';
       sp.Params.CreateParam(ftFloat,   'VContrato',   ptInput);
       sp.Params.CreateParam(ftString,  'VBSBC',       ptInput);
       sp.Params.CreateParam(ftDateTime,'VFAlta',      ptOutput);
       sp.Params.CreateParam(ftDateTime,'VFApertura',  ptOutput);
       sp.Params.CreateParam(ftString,  'desc_proceso',ptOutput);
       sp.Params.CreateParam(ftInteger, 'PCodResp',    ptOutput);

       //Asigna los valores de entrada
       sp.Params.ParamByName('VContrato').AsFloat:=pId_Contrato.AsFloat;
       sp.Params.ParamByName('VBSBC').AsString   :=pB_SalvoSBC.AsString;

       //Prepara y ejecuta el stored procedure
       sp.ExecProc;

       //Obtiene el resultado de la ejecución del stored procedure
       CodResp  :=sp.parambyname('PCodResp').AsFloat;
       Descproc :=sp.parambyname('desc_proceso').AsString;
       pDescProc:=DescProc;
       BuscaFApertura:=(CodResp=0);
       if CodResp <> 0
       then MessageDlg(Descproc,mtError,[mbOK],0)
       else begin
              pF_Alta.AsDateTime    :=sp.parambyname('VFAlta').AsDateTime;
              pF_Apertura.AsDateTime:=sp.parambyname('VFApertura').AsDateTime;
            end;
    finally sp.free;
    end;
end;

function CalculaImportes(pImp_Capital  : TInterCampo;
                         pTasa_Neta    : TInterCampo;
                         pPct_Isr      : TInterCampo;
                         pDias_Plazo   : TInterCampo;
                         pTasa_Bruta   : TInterCampo;
                         pImp_Isr      : TInterCampo;
                         pImp_Int_Bruto: TInterCampo;
                         pImp_Int_Neto : TInterCampo;
                         pImp_Neto_Vto : TInterCampo;
                         pF_VENCTO     : TInterCampo; //MARA4356 ENE 2008 PARA PARAMETRIZAR EL FACTOR DE ISR
                         Var pDescProc : String;
                         pApli         : TInterApli):Boolean;
Var sp       : TStoredProc;
    CodResp  : Double;
    Descproc : String;
Begin
    CalculaImportes:=False;
    sp:=TStoredProc.Create(Nil);
    try
       sp.DatabaseName:=pApli.DataBaseName;
       sp.SessionName :=pApli.SessionName;
       sp.StoredProcName:='PKGINVERS.STPCALCULAIMPORTES';
       sp.Params.CreateParam(ftFloat,   'VCapital',    ptInput);
       sp.Params.CreateParam(ftFloat,   'VTasaNeta',   ptInput);
       sp.Params.CreateParam(ftFloat,   'VTasaBruta',  ptInput);//MARA4356 FEB 2008 AJUSTE PARA CAPTURA DE TASAS BRUTAS
       sp.Params.CreateParam(ftFloat,   'VPctIsr',     ptInput);
       sp.Params.CreateParam(ftFloat,   'VPlazo',      ptInput);
       sp.Params.CreateParam(ftDate,    'VFVenc',      ptInput); //MARA4356 ENE 2008 PARA PARAMETRIZAR EL FACTOR DE ISR
       //sp.Params.CreateParam(ftFloat,   'VTasaBruta',  ptOutput);
       sp.Params.CreateParam(ftFloat,   'VImpISR',     ptOutput);
       sp.Params.CreateParam(ftFloat,   'VImpIntbruto',ptOutput);
       sp.Params.CreateParam(ftFloat,   'VImpIntNeto', ptOutput);
       sp.Params.CreateParam(ftFloat,   'VImpTotNeto', ptOutput);
       sp.Params.CreateParam(ftString,  'desc_proceso',ptOutput);
       sp.Params.CreateParam(ftFloat,   'pCodResp',    ptOutput);

       //Asigna los valores de entrada
       sp.Params.ParamByName('VCapital').AsFloat  :=pImp_Capital.AsFloat;
       sp.Params.ParamByName('VTasaNeta').AsFloat :=pTasa_Neta.AsFloat;
       sp.Params.ParamByName('VTasaBruta').AsFloat:=pTasa_Bruta.AsFloat;//MARA4356 FEB 2008 AJUSTE PARA CAPTURA DE TASAS BRUTAS
       sp.Params.ParamByName('VPctIsr').AsFloat   :=pPct_Isr.AsFloat;
       sp.Params.ParamByName('VPlazo').AsFloat    :=pDias_Plazo.AsFloat;
       sp.Params.ParamByName('VFVenc').asstring   :=pF_VENCTO.asstring; //MARA4356 ENE 2008 PARA PARAMETRIZAR EL FACTOR DE ISR
       
       //Prepara y ejecuta el stored procedure
       sp.ExecProc;

       //Obtiene el resultado de la ejecución del stored procedure
       CodResp  :=sp.parambyname('PCodResp').AsFloat;
       Descproc :=sp.parambyname('desc_proceso').AsString;
       CalculaImportes:=(CodResp=0);
       if CodResp <> 0
       then MessageDlg(Descproc,mtError,[mbOK],0)
       else begin
              pTasa_Bruta.AsFloat   :=sp.parambyname('VTasaBruta').AsFloat;
              pImp_Isr.AsFloat      :=sp.parambyname('VImpISR').AsFloat;
              pImp_Int_Bruto.AsFloat:=sp.parambyname('VImpIntbruto').AsFloat;
              pImp_Int_Neto.AsFloat :=sp.parambyname('VImpIntNeto').AsFloat;
              pImp_Neto_Vto.AsFloat :=sp.parambyname('VImpTotNeto').AsFloat;
            end;
    finally sp.free;
    end;
end;

function BuscaTasa(pID_CONTRATO : TInterCampo;
                   pIMP_CAPITAL : TInterCampo;
                   pDIAS_PLAZO  : TInterCampo;
                   pTASA_ASIG   : TInterCampo;
                   pTASA_COSTO  : TInterCampo;
                   Var pDescProc: String;
                   pApli        : TInterapli):Boolean;
Var Sp      : tStoredProc;
    CodResp : Double;
    Descproc: String;
begin
    BuscaTasa:=False;
    sp:=TStoredProc.Create(Nil);
    try
       sp.DatabaseName:=pApli.DataBaseName;
       sp.SessionName :=pApli.SessionName;
       sp.StoredProcName:='PKGINVERS.STPCATAS';
       sp.Params.CreateParam(ftFloat, 'V_CONTRATO',   ptInput);
       sp.Params.CreateParam(ftFloat, 'V_IMP_CAPITAL',ptInput);
       sp.Params.CreateParam(ftFloat, 'V_PLAZO',      ptInput);
       sp.Params.CreateParam(ftFloat, 'V_TASA_ASIG',  ptOutput);
       sp.Params.CreateParam(ftFloat, 'V_TASA_COSTO', ptOutput);
       sp.Params.CreateParam(ftString,'V_DESC_TASA',  ptOutput);
       sp.Params.CreateParam(ftFloat, 'RESP',         ptOutput);

       //Asigna s valores de entrada
       sp.Params.ParamByName('V_CONTRATO').AsFloat   :=pID_CONTRATO.AsFloat;
       sp.Params.ParamByName('V_IMP_CAPITAL').AsFloat:=pIMP_CAPITAL.AsFloat;
       sp.Params.ParamByName('V_PLAZO').AsFloat      :=pDIAS_PLAZO.AsFloat;

       //Prepara y ejecuta el stored procedure
       sp.ExecProc;

       //Obtiene el resultado de la ejecución del stored procedure
       CodResp  :=sp.parambyname('RESP').AsFloat;
       Descproc :=sp.parambyname('V_DESC_TASA').AsString;
       BuscaTasa:=(CodResp=0);
       pDescProc:=Descproc;
       if CodResp <> 0
       then begin
              MessageDlg(Descproc,mtError,[mbOK],0);
            end
       else begin
              pTASA_ASIG.AsFloat :=sp.parambyname('V_TASA_ASIG').AsFloat;
              pTASA_COSTO.AsFloat:=sp.parambyname('V_TASA_COSTO').AsFloat;
            end;
    finally sp.free;
    end;
end;

function BuscaPctISR(pID_CONTRATO : TInterCampo;
                     pIMP_CAPITAL : TInterCampo;
                     pDIAS_PLAZO  : TInterCampo;
                     //pTASA_NETA   : TInterCampo; // MARA4356 FEB 2008 CAPTURA DE TASAS BRUTAS
                     pTASA_BRUTA  : TInterCampo; // MARA4356 FEB 2008 CAPTURA DE TASAS BRUTAS
                     pPCT_ISR     : TInterCampo;
                     pF_VENCTO    : TInterCampo; //MARA4356 DIC 2007 PARA PARAMETRIZAR EL % ISR
                     pApli        : TInterapli):Boolean;
Var Sp      : tStoredProc;
    CodResp : Double;
begin
    BuscaPctISR:=False;
    sp:=TStoredProc.Create(Nil);
    try
       sp.DatabaseName:=pApli.DataBaseName;
       sp.SessionName :=pApli.SessionName;
       sp.StoredProcName:='PKGINVERS.STPCALCISRINV';
       sp.Params.CreateParam(ftFloat, 'VCONTRATO',  ptInput);
       sp.Params.CreateParam(ftFloat, 'VCAPITAL',   ptInput);
       sp.Params.CreateParam(ftFloat, 'VPLAZO',     ptInput);
       //sp.Params.CreateParam(ftFloat, 'VTASANETA',  ptInput);
       sp.Params.CreateParam(ftFloat, 'VTASABRUTA', ptInput); //MARA4356 FEB 2008 CAPTURA DE TASAS BRUTAS
       sp.Params.CreateParam(ftDate , 'VFVENC',     ptInput);
       sp.Params.CreateParam(ftFloat, 'RESP',       ptOutput);
       sp.Params.CreateParam(ftFloat, 'VPCTISR',    ptOutput);

       //Asigna los valores de entrada
       sp.Params.ParamByName('VCONTRATO').AsFloat:=pID_CONTRATO.AsFloat;
       sp.Params.ParamByName('VCAPITAL').AsFloat :=pIMP_CAPITAL.AsFloat;
       sp.Params.ParamByName('VPLAZO').AsFloat   :=pDIAS_PLAZO.AsFloat;
       sp.Params.ParamByName('VTASABRUTA').AsFloat:=pTASA_BRUTA.AsFloat;//MARA4356 FEB 2008 CAPTURA DE TASAS BRUTAS
       sp.Params.ParamByName('VFVENC').AsDate    :=pF_VENCTO.AsFloat;//MARA4356 DIC 2007 PARA PARAMETRIZAR EL % ISR

       //Prepara y ejecuta el stored procedure
       sp.ExecProc;

       //Obtiene el resultado de la ejecución del stored procedure
       CodResp    :=sp.parambyname('RESP').AsFloat;
       BuscaPctIsr:=(CodResp=0);
       if CodResp = 0
       then pPCT_ISR.AsFloat :=sp.parambyname('VPCTISR').AsFloat;
    finally sp.free;
    end;
end;

function ObtenTCambio(pContrato:TInterFrame;
                      pF_Apertura : TInterCampo):Double;
Var vlTipoCambio : Real;
begin
  if pContrato.FieldByName('CVE_MONEDA').AsInteger <> 484
  then begin
         GetSqlFloat('Select TIPO_CAMBIO from TIPO_CAMBIO_MON where CVE_MONEDA_REFER = ' +
                      pContrato.FieldByName('CVE_MONEDA').AsString + ' and ' +
                     'F_LIQUIDACION = ' + SQLFECHA(pF_Apertura.AsDateTime),pContrato.DataBaseName,
                     pContrato.SessionName,'TIPO_CAMBIO',vlTipoCambio,True);
         ObtenTCambio:=vlTipoCambio;
       end
  else ObtenTCambio:=1;
end;

function Renovacion(pId_Contrato   : TInterCampo;
                    pId_Pagare     : TInterCampo;
                    pCve_Tip_Renov : String;
                    pF_Apertura    : TInterCampo;
                    pF_Vencimiento : TInterCampo;
                    pF_OperaCto    : TDateTime;
                    pInstr_Caj     : String;
                    pId_Empresa    : TInterCampo;
                    pId_Sucursal   : TInterCampo;
                    pCveAsigTasa   : String;
                    pCveTasBtaAsig : Double;
                    Var pDescProc  : String;
                    pApli          : TInterApli):Boolean;
var Sp  : tStoredProc;
    CodResp : Double;
    Descripc,
    DescProc: String;
    Anticipado : Boolean;

begin
    Renovacion:=False;
    Anticipado:=False;
    if pF_OperaCto > pF_Vencimiento.AsDateTime
    then begin
           pDescProc:='La fecha de vencimiento no puede ser menor que hoy';
           Exit;
         end;

    Anticipado:=(pF_Vencimiento.AsDateTime <> pF_OperaCto) and
                (pF_APERTURA.AsDateTime    <> pF_OperaCto);

    sp:=TStoredProc.Create(Nil);
    try
       sp.DatabaseName:=pApli.DataBaseName;
       sp.SessionName :=pApli.SessionName;
       if pCve_Tip_Renov = cVencido then   //Es un Vencimiento
       begin
          if ((pId_Empresa.AsInteger = cInterFin) or
              (pId_Empresa.AsInteger = cBancoDls)
             ) and Anticipado
          then sp.StoredProcName:='PKGINVERS.STPVENCANT'  //Vencimiento Anticipado
          else sp.StoredProcName:='PKGINVERS.STPREINV';     //Vencimiento Normal
       end
       else  sp.StoredProcName:='PKGINVERS.STPREINV'; //Es una Renovación Normal

       if Not( ((pId_Empresa.AsInteger = cInterFin) or
                (pId_Empresa.AsInteger = cBancoDls)) and Anticipado )
       then begin
              sp.Params.CreateParam(ftString,   'V_TIP_RENOV', ptInput);
              sp.Params.ParamByName('V_TIP_RENOV').AsString:=pCve_Tip_Renov;
            end
       else begin
              //sp.Params.CreateParam(ftString, 'V_TASA_NETA_ASIG', ptInput);//mara4356 feb 2008 antes tasa_neta
              //sp.Params.ParamByName('V_TASA_NETA_ASIG').AsFloat:=pCveTasBtaAsig;//mara4356 feb 2008 antes tasa_neta
              sp.Params.CreateParam(ftString, 'V_TASA_BRUTA_ASIG', ptInput);//mara4356 feb 2008 antes tasa_neta
              sp.Params.ParamByName('V_TASA_BRUTA_ASIG').AsFloat:=pCveTasBtaAsig;//mara4356 feb 2008 antes tasa_neta
              sp.Params.CreateParam(ftString, 'V_CVE_ASIG_TASA', ptInput);
              sp.Params.ParamByName('V_CVE_ASIG_TASA').AsString:=pCveAsigTasa;
            end;

       sp.Params.CreateParam(ftDateTime, 'V_FVENCTO',   ptInput);
       sp.Params.CreateParam(ftFloat,    'V_CONTRATO',  ptInput);
       sp.Params.CreateParam(ftFloat,    'V_PAGARE',    ptInput);
       sp.Params.CreateParam(ftDateTime, 'V_USUARIO',   ptInput);
       sp.Params.CreateParam(ftString,   'V_INST_CAJ',  ptInput);
       sp.Params.CreateParam(ftFloat,    'V_EMPRESA',   ptInput);
       sp.Params.CreateParam(ftFloat,    'V_SUCURSAL',  ptInput);
       sp.Params.CreateParam(ftString,   'desc_proceso',ptOutput);
       sp.Params.CreateParam(ftFloat,    'pCodResp',    ptOutput);

       //Asigna los valores de entrada
       sp.Params.ParamByName('V_FVENCTO').AsDateTime:=pF_Vencimiento.AsDateTime;
       sp.Params.ParamByName('V_CONTRATO').AsFloat  :=pId_Contrato.AsFloat;
       sp.Params.ParamByName('V_PAGARE').AsFloat    :=pId_Pagare.AsFloat;
       sp.Params.ParamByName('V_USUARIO').AsString  :=pApli.Usuario;
       sp.Params.ParamByName('V_INST_CAJ').AsString :=pInstr_Caj;
       sp.Params.ParamByName('V_EMPRESA').AsFloat   :=pId_Empresa.AsFloat;
       sp.Params.ParamByName('V_SUCURSAL').AsFloat  :=pId_Sucursal.AsFloat;

       //Prepara y ejecuta el stored procedure
       sp.ExecProc;

       if pCve_Tip_Renov = cRenovado
       then Descripc:='renovación'
       else begin
              Descripc:='vencimiento';
              if Anticipado
              then Descripc:=Descripc + ' anticipado';
            end;

       //Obtiene el resultado de la ejecución del stored procedure
       CodResp   :=sp.parambyname('pCodResp').AsFloat;
       Renovacion:=(CodResp=0);
       if CodResp = 0
       then DescProc:='Proceso de ' + Descripc + ' realizado'
       else DescProc:='No se pudo efectuar el proceso de ' + Descripc + ', Código ' +
                      sp.parambyname('pCodResp').AsString + ', ' +
                      sp.parambyname('DESC_PROCESO').AsString;
       pDescProc:=DescProc;
    finally sp.free;
    end;

end;

function EsAdministrador(pObjeto:TInterFrame):Boolean;
Var vlEsAdmin: Boolean;
    vlSQl    : String;
begin
    vlSQl:='SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_'+UpperCase(pObjeto.ClassName)+''') AND (CVE_USUARIO=''' + pObjeto.Apli.Usuario + ''') and (CVE_OPER_ACC=''AD'')';
    // busca si el usuario puede modificar la tasa
    vlEsAdmin:=GetSQL(vlSQL,pObjeto.Apli.SeguDataBaseName,pObjeto.Apli.SeguSessionName,True);
    EsAdministrador:=vlEsAdmin;
end;

function PuedeModifTasa(pObjeto:TInterFrame):Boolean;
Var vlPuede : Boolean;
    vlSQl   : String;
begin
     PuedeModifTasa:=True;
     // AUTOR :   Marcos Zárate Castro.  29 de Noviembre del 2001
     // Nota :  A raíz de la apertura de todas las empresas para poder modificar la tasa y que se quedaran en estatus de
     //         PU : Pendiente de AUTORIZAR, se elimina la validación de SECU_OPER_ACC y se regresa verdadero siempre.

{    vlSQl:='SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_'+UpperCase(pObjeto.ClassName)+''') AND (CVE_USUARIO=''' + pObjeto.Apli.Usuario + ''') and (CVE_OPER_ACC=''TA'')';
    // busca si el usuario puede modificar la tasa
    vlPuede:=GetSQL(vlSQL,pObjeto.Apli.SeguDataBaseName,pObjeto.Apli.SeguSessionName,True);
    PuedeModifTasa:=vlPuede; }
end;

function AfectaFestivo(pContrato : TInterFrame;
                       pPais     : String;
                       pFECHA    : TInterCampo):Boolean;
Var vlfestivo : Boolean;
    vlSQl   : String;
begin
    AfectaFestivo:=False;
    vlSQl:='SELECT F_FESTIVA FROM DIA_FESTIVO ' +
           ' WHERE CVE_PAIS = ''' + pPais + ''' AND F_FESTIVA = TO_DATE(''' +
           FormatDatetime('DD/MM/YYYY',pFECHA.AsDateTime) + ''',''DD/MM/YYYY'')';
    vlfestivo:=GetSQL(vlSQL,pContrato.Apli.SeguDataBaseName,pContrato.Apli.SeguSessionName,True);
    AfectaFestivo:=vlfestivo;
end;

function ObtenPersJur(pContrato:TInterFrame):String;
Var vlCvePersJur : String;
begin GetSqlStr('SELECT CVE_PER_JURIDICA FROM PERSONA where ID_PERSONA = ' + pContrato.FieldbyName('ID_TITULAR').AsString,
                  pContrato.DataBaseName,pContrato.SessionName,'CVE_PER_JURIDICA',vlCvePersJur,True);
      ObtenPersJur:=vlCvePersJur;
end;

function ObtenEntidad(pContrato:TInterFrame):Double;
Var vlIdEntidad : Real;
begin GetSqlFloat('SELECT ID_ENTIDAD FROM CONTRATO WHERE ID_CONTRATO = ' + pContrato.FieldbyName('ID_CONTRATO').AsString,
                  pContrato.DataBaseName,pContrato.SessionName,'ID_ENTIDAD',vlIdEntidad,True);
      ObtenEntidad:=vlIdEntidad;
end;

function ObtenFecOper(pContrato:TInterFrame):TDateTime;
Var qConsulta : TQuery;
    vlIdEntidad : Double;
begin  //Este llamado es porque el contrato ligero no tiene ID_ENTIDAD y el llamar a Contrato es muy costoso
       vlIdEntidad:=ObtenEntidad(pContrato);
       qConsulta  := TQuery.Create(Nil);
       try qConsulta.Databasename:=pContrato.Databasename;
           qConsulta.SessionName :=pContrato.SessionName;
           qConsulta.SQL.Text:='SELECT  F_INFORMACION FROM INV_SUCURSAL where ID_EMPRESA  = ' + pContrato.FieldbyName('ID_EMPRESA').AsString +
                               ' AND ID_SUCURSAL = ' + FloatToStr(vlIdEntidad);
           qConsulta.Open;
           if qConsulta.RecordCount > 0
           then ObtenFecOper:=qConsulta.FieldByName('F_INFORMACION').AsdateTime;
       finally qConsulta.free;
       end;
end;

procedure MensajePanel(pMsg :String; pDlgType : TMsgDlgType; pButtons : TMsgDlgButtons; pHelpCtx : Integer; pMemo : TMemo);
begin MessageDlg(pMsg,pDlgType,pButtons,pHelpCtx);
      if pMemo <> Nil
      then pMemo.Lines.Add('[' + FormatDateTime('hh:mm:ss',Now) + '] ' +pMsg);
end;

function BuscaTasaCurva(pApli          : TInterApli;
                        pDiasPlazo     : Integer;
                        pTasaLarga     :Double;
                        pNuevoPlazo    : Integer;
                        Var pNuevaTasa : Double):Boolean;
Var sp        : TStoredProc;
    CodResp   : Double;
    Descproc  : String;
begin //Busca la tasa en curva que le corresponde para un Vencimiento Anticipado
    BuscaTasaCurva:=False;
    sp:=TStoredProc.Create(Nil);
    try
       sp.DatabaseName:=pApli.DataBaseName;
       sp.SessionName :=pApli.SessionName;
       sp.StoredProcName:='STPCALCFINAN';
       sp.Params.CreateParam(ftFloat,  'pMetodo',     ptInput);
       sp.Params.CreateParam(ftFloat,  'pPlazoCorto', ptInput);
       sp.Params.CreateParam(ftFloat,  'pTasaCorto',  ptInput);
       sp.Params.CreateParam(ftFloat,  'pPlazoLargo', ptInput);
       sp.Params.CreateParam(ftFloat,  'pTasaLargo',  ptInput);
       sp.Params.CreateParam(ftFloat,  'pPlazoAlam',  ptInput);
       sp.Params.CreateParam(ftFloat,  'pTasaAlam',   ptOutput);
       sp.Params.CreateParam(ftFloat,  'pResp',       ptOutput);

       //Asigna los valores de entrada
       sp.Params.ParamByName('pMetodo').AsFloat    :=1;
       sp.Params.ParamByName('pPlazoCorto').AsFloat:=0;
       sp.Params.ParamByName('pTasaCorto').AsFloat :=0;
       sp.Params.ParamByName('pPlazoLargo').AsFloat:=pDiasPlazo;
       sp.Params.ParamByName('pTasaLargo').AsFloat :=pTasaLarga;
       sp.Params.ParamByName('pPlazoAlam').AsFloat :=pNuevoPlazo;

       //Prepara y ejecuta el stored procedure
       sp.ExecProc;

       //Obtiene el resultado de la ejecución del stored procedure
       CodResp  :=sp.parambyname('pResp').AsFloat;
       BuscaTasaCurva:=(CodResp=0);
       if CodResp <> 0
       then MessageDlg('Error al obtener tasa en curva : ' + sp.parambyname('pResp').AsString,mtError,[mbOK],0)
       else pNuevaTasa:=sp.parambyname('pTasaAlam').AsFloat;
    finally sp.free;
    end;
end;

function PuedeVencerAnt(pObjeto:TInterFrame):Boolean;
Var vlPuede : Boolean;
    vlSQl   : String;
begin
    PuedeVencerAnt:=False;
    vlSQl:='SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_'+UpperCase(pObjeto.ClassName)+''') AND (CVE_USUARIO=''' + pObjeto.Apli.Usuario + ''') and (CVE_OPER_ACC=''VA'')';
    // busca si el usuario puede modificar la tasa
    vlPuede:=GetSQL(vlSQL,pObjeto.Apli.SeguDataBaseName,pObjeto.Apli.SeguSessionName,True);
    PuedeVencerAnt:=vlPuede;
end;

function SucuBloqueada(pObjeto:TInterFrame;pIdSucursal:String;pEmpresa:String): Boolean;
Var qConsulta : TQuery;
    vlSQL     : String;
begin //Si el usuario tiene una excepción, se salta la validación de No Bloqueo
      vlSQL:='SELECT Cve_Oper_acc From Secu_Oper_Acc ' +
             ' WHERE Cve_Funcion = ''' + pObjeto.Apli.LastFuncion + '''' +
             '   and Cve_Usuario = ''' + pObjeto.Apli.Usuario + '''' +
             '   and Cve_Oper_Acc = ''NB''';
      if GetSql(vlSQL,pObjeto.Apli.DataBaseName, pObjeto.Apli.SessionName, False) then
      begin
        SucuBloqueada:=False;
        Exit;
      end;

      SucuBloqueada:=False;
      qConsulta := TQuery.Create(Nil);
      try  qConsulta.Databasename:=pObjeto.databasename;
           qConsulta.SessionName :=pObjeto.SessionName;
           qConsulta.SQL.Text:='SELECT Count(*) as Cuenta FROM INV_SUCURSAL WHERE ' +
                               ' ID_EMPRESA = ' + pEmpresa + ' AND ID_SUCURSAL = ' + pIdSucursal +
                               ' AND B_BLOQ_CAPTURA=''V'' ';
           qConsulta.Open;
           if qConsulta.FieldByName('CUENTA').AsInteger > 0
           then begin
                  MuestraSucuBloq;
                  SucuBloqueada:=True;
                end
           else begin
                  SucuBloqueada:=False;
                end;
      finally
         if qConsulta <> nil then qConsulta.free;
      end;
end;

function ObtTCamb(pMoneda:Integer;pApli:TInterApli;pFecha:TDateTime):Double;
Var vlTCambio : Real;
    vlSQL     : String;
    Realizado : Boolean;
begin vlSQL:=' SELECT TIPO_CAMBIO ' +
             '   FROM TIPO_CAMBIO_MON ' +
             '  WHERE CVE_MONEDA_BASE  = 484 AND ' +
             '        CVE_MONEDA_REFER = ' + IntToStr(pMoneda) + ' AND ' +
             '        F_LIQUIDACION    = TO_DATE(''' +  FormatDateTime('DD/MM/YYYY',pFecha) + ''',''DD/MM/YYYY'')  AND ' +
             '        CVE_MEDIO        = ''MK'' ';

      Realizado:=False;
      try
        GetSqlFloat(vlSQL,pApli.DataBaseName,pApli.SessionName,'TIPO_CAMBIO',vlTCambio,True);
        Realizado:=True;
      except
      end;
      if Not Realizado
      then begin
             ObtTCamb:=0;
             MessageDlg('No se pudo obtener el tipo de cambio para el día ' + FormatDateTime('DD/MMM/YYYY',pApli.DameFechaEmpresa) ,mtError,[mbOK],0);
           end
      else ObtTCamb:=vlTCambio;
end;


function BuscaFLiq(pDiaLiq   :String;
                   pApli     : TInterApli;
                   pFechaRef : TDateTime;
                   Var pFech24Hrs: TDateTime):Boolean;
Var sp         : TStoredProc;
    CodResp    : Double;
    Descproc   : String;
    vlsalir    : Boolean;
    VLFechaRef : TDateTime;
    vlEmpOri   : Double;
begin //Busca la fecha 24 Horas
    BuscaFLiq:=False;
    sp:=TStoredProc.Create(Nil);
    try

       //Verifica si la fecha indicada es festiva o fin de semana en México. Para esto, se valida con la empresa del Banco (2)
       vlEmpOri:=pApli.Fecha.IdEmpresa;
//       pApli.Fecha.IdEmpresa:=cBancoDls;// qutl4600 06092004
       pApli.Fecha.FechaReferencia := pFechaRef;

       if Not pApli.Fecha.FechaValida then
       begin
         vlsalir:=False;
         //Hace un ciclo restando fechas de uno en uno hasta que encuentre una fecha hábil
         while not vlsalir do
         begin
            pApli.Fecha.IdEmpresa:=cBanco;
            pApli.Fecha.FechaReferencia:=pApli.Fecha.FechaReferencia - 1;
            vlsalir:=pApli.Fecha.FechaValida;
         end;
         VLFechaRef:=pApli.Fecha.FechaReferencia;
       end
       else VLFechaRef:=pFechaRef;

       sp.DatabaseName:=pApli.DataBaseName;
       sp.SessionName :=pApli.SessionName;
       sp.StoredProcName:='SPE_FECHAMET6';
       sp.Params.CreateParam(ftInteger, 'p_IdEmpresa', ptInput);
       sp.Params.CreateParam(ftString,  'p_CveLiq',    ptInput);
       sp.Params.CreateParam(ftDateTime,'p_Fecha',     ptInputOutput);
       sp.Params.CreateParam(ftFloat,   'ps_Resp',     ptOutput);

       //Asigna los valores de entrada
       sp.Params.ParamByName('p_IdEmpresa').AsFloat  :=pApli.Fecha.IdEmpresa;
       sp.Params.ParamByName('p_CveLiq').AsString    :=pDiaLiq;
       sp.Params.ParamByName('p_Fecha').AsDateTime   :=VLFechaRef;

       //Prepara y ejecuta el stored procedure
       sp.ExecProc;

       //Obtiene el resultado de la ejecución del stored procedure
       CodResp  :=sp.parambyname('ps_Resp').AsFloat;
       BuscaFLiq:=(CodResp=0);
       if CodResp <> 0
       then MessageDlg('Error al obtener la fecha : ' + sp.parambyname('ps_Resp').AsString,mtError,[mbOK],0)
       else pFech24Hrs:=sp.parambyname('p_Fecha').AsDateTime;

       pApli.Fecha.IdEmpresa:=vlEmpOri;

    finally sp.free;
    end;
end;

function PuedeOperarIFSPesos(pObjeto:TInterFrame):Boolean;
Var vlPuede : Boolean;
    vlSQl   : String;
begin
    PuedeOperarIFSPesos:=False;
    vlSQl:='SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_'+UpperCase(pObjeto.ClassName)+''') AND (CVE_USUARIO=''' + pObjeto.Apli.Usuario + ''') and (CVE_OPER_ACC=''CP'')';
    // busca si el usuario puede modificar la tasa
    vlPuede:=GetSQL(vlSQL,pObjeto.Apli.SeguDataBaseName,pObjeto.Apli.SeguSessionName,True);
    PuedeOperarIFSPesos:=vlPuede;
end;

function EsUnBanco(pApli:TInterApli; pIdCotrato:Integer):Boolean;
Var qConsulta : TQuery;
    vlSQL     : String;
    Realizado : Boolean;
begin //Si el contrato pertenece a un banco
      Realizado:=False;
      vlSQL:='SELECT COUNT(*) As Cuenta ' +
             '  FROM INTERMEDIARIO INT, ' +
             '       CONTRATO CTO ' +
             ' WHERE CTO.ID_CONTRATO   = ' + IntToStr(pIdCotrato)   + ' AND ' +
             '       CTO.ID_TITULAR    = INT.ID_INTERMEDIARIO AND ' +
             '       INT.CVE_TIPO_INTERM = ''BA'' ';
      qConsulta := TQuery.Create(Nil);
      try qConsulta.Databasename:=pApli.DatabaseName;
          qConsulta.SessionName :=pApli.SessionName;
          qConsulta.SQL.Text:=vlSQL;
          qConsulta.Open;
          Realizado:=(qConsulta.FieldByName('Cuenta').AsInteger > 0);
      finally qConsulta.free;
      end;
      EsUnBanco:=Realizado;
end;


function SaldoDisp(pContrato:TInterFrame) : Double;
Var qConsulta : TQuery;
    vlSQL     : String;
begin //Si el contrato pertenece a un banco
      SaldoDisp:=0;
      vlSQL:='SELECT SDO_EFE_VIRT - SDO_DEUD_VIRT AS DISPONIBLE' +
             '  FROM DV_CONTRATO ' +
             ' WHERE ID_CONTRATO  = ' + pContrato.FieldByName('ID_CTO_LIQ').AsString;
      qConsulta := TQuery.Create(Nil);
      try qConsulta.Databasename:=pContrato.DatabaseName;
          qConsulta.SessionName :=pContrato.SessionName;
          qConsulta.SQL.Text:=vlSQL;
          qConsulta.Open;
          if qConsulta.FieldbyName('DISPONIBLE').AsFloat < 0
          then SaldoDisp:=0
          else SaldoDisp:=qConsulta.FieldbyName('DISPONIBLE').AsFloat;
      finally qConsulta.free;
      end;
end;

function Buscames(pMes:Integer) : String;
var   meses  : Array[1..12] of string;
begin
      Meses[1]:='Enero';
      Meses[2]:='Febrero';
      Meses[3]:='Marzo';
      Meses[4]:='Abril';
      Meses[5]:='Mayo';
      Meses[6]:='Junio';
      Meses[7]:='Julio';
      Meses[8]:='Agosto';
      Meses[9]:='Septiembre';
      Meses[10]:='Octubre';
      Meses[11]:='Noviembre';
      Meses[12]:='Diciembre';
      Buscames:=Meses[pMes];
end;

function DlookUP(pDatabasename:String;pSessionName:String;pColumna:String;pTabla:String;pWhere:String):String;
Var vlSQL:String;
    qConsulta:TQuery;
begin DlookUP:='Error';
      qConsulta:=TQuery.Create(Nil);
      try
        qConsulta.DatabaseName:=pDatabasename;
        qConsulta.SessionName:=pSessionName;
        vlsql:=' SELECT ' + pColumna + ' FROM ' + pTabla + ' WHERE ' + pWhere;
        qConsulta.SQL.Text:=vlsql;
        qConsulta.Open;
        if qConsulta.IsEmpty
        then DlookUP:=''
        else DlookUP:=qConsulta.FieldByName(pColumna).AsString;
        qConsulta.Close;
      finally qConsulta.free;
      end;
end;

//octubre 2002. envia mail.
function EnviaMail(pHost: String; pMailOrigen:String; pAsunto:String; pMailDestino:String; pMensaje:String;pNomArchivo : String):Boolean;
Var NMSMTP1 : TNMSMTP;
BEGIN
  EnviaMail:=False;
  NMSMTP1 := TNMSMTP.Create(Nil);
  try
     NMSMTP1.Host := pHost;
     NMSMTP1.Connect;
     if NMSMTP1.Connected then
     begin
       NMSMTP1.ClearParams := TRUE;
       NMSMTP1.SubType := mtPlain;
       NMSMTP1.PostMessage.FromAddress:=pMailOrigen;
       NMSMTP1.EncodeType := uuMime;
       NMSMTP1.PostMessage.ToAddress.Text := pMailDestino;
       NMSMTP1.PostMessage.Body.Text :=pMensaje;
       NMSMTP1.PostMessage.Subject := pAsunto;
       NMSMTP1.PostMessage.Date := DateTimeToStr(date());
       NMSMTP1.PostMessage.Attachments.Add(pNomArchivo);
       NMSMTP1.SendMail;
     end;
     NMSMTP1.Disconnect;
  finally
    if NMSMTP1 <> nil then NMSMTP1.free;
  end;
  EnviaMail:=True;
end;


//Verif.ImpMinProd.M.Zarate. 14-mar-2005
procedure VerImpMinProd(pApli : TInterApli; peCveProd:String; pImporte : Double; Var pCodResp  :Integer; Var pDescProc :String);
Var qcorpo   : TQuery;
    CodResp  : Double;
    Descproc : String;
begin //Busca la fecha de liquidación para una Fecha de Valor específica
    pCodResp:=99;
    qcorpo := TQuery.Create(nil);
    try
       qcorpo.DatabaseName:=pApli.DataBaseName;
       qcorpo.SessionName :=pApli.SessionName;
       qcorpo.sql.text:='select * from PROD_CTO_DEF WHERE CVE_PRODUCTO = ''' + peCveProd + '''';
       qcorpo.open;
       //Si no encuentra registro, no valida importe mínimo
       if qcorpo.recordcount = 0
       then begin
              pCodResp:=0;
              pDescProc:='';
            end
       else begin
              if qcorpo.FieldByName('IMP_MIN_PRODUCTO').AsFloat <= pImporte then
              begin
                 pCodResp:=0;
                 pDescProc:='Aprobado';
              end
              else
              begin
                 pCodResp:=1;
                 pDescProc:='No cumple con el importe mínimo de operación : ' + qcorpo.FieldByName('IMP_MIN_PRODUCTO').AsString;
              end;

            end;
       qcorpo.close;
    finally
      if qcorpo <> nil then qcorpo.free;
    end;

end;

//MARA4356 ENE 2008 Busca el año comercial o el año natural para el calculo de isr y de la tasa bruta
function BuscaAno(pApli : TInterApli; pFecha,pTipoAno,pOperador : String):Integer;
var vlAno:Integer;
Begin
   GetSQLInt('select pkginvers.funObtenAno('''+pFecha+''','+pTipoAno+','+pOperador+') as Valor from dual',
          pApli.DataBaseName, pApli.SessionName,'Valor',vlAno,True);
   BuscaAno:=vlAno;
end;

//MARA4356 ENE 2008 CALCULA LA TASA NETA A PARTIR DE LA TASA BRUTA Y EL ISR
function BuscaTasaNeta(pApli       : TInterApli; 
                       pPct_Isr    : TInterCampo;
                       pTasa_Bruta : TInterCampo;
                       pF_VENCTO   : TInterCampo;
                       pTasa_Neta  : TInterCampo):Boolean;
var vlTasa : Real;
    vlSQL  : String;
Begin
   if pPCT_ISR.ASString = '' 
   then vlSQL:='select pkginvers.funObtenNeta('''+pF_VENCTO.AsString+''','+pTasa_Bruta.AsString+',0 ) as Valor from dual'
   else vlSQL:='select pkginvers.funObtenNeta('''+pF_VENCTO.AsString+''','+pTasa_Bruta.AsString+','+pPct_Isr.AsString+' ) as Valor from dual';
   
   GetSQLFloat(vlSQL, pApli.DataBaseName, pApli.SessionName,'Valor',vlTasa,True);
   pTasa_Neta.AsFloat:=vlTasa;          
   BuscaTasaNeta:=(vlTasa<>-50);
end;


function BuscaTasaLimit(pDIAS_PLAZO  : TInterCampo;
                   	Var pTasa    : Double;
                   	pApli        : TInterapli):Boolean;
Var Sp      : tStoredProc;
    Tasa: Double;
begin
    BuscaTasaLimit:=False;
    sp:=TStoredProc.Create(Nil);
    try
       sp.DatabaseName:=pApli.DataBaseName;
       sp.SessionName :=pApli.SessionName;
       sp.StoredProcName:='PKGINVERS.STPCALCULATASALIMIT';
       sp.Params.CreateParam(ftInteger, 'pPlazo',   ptInput);
       sp.Params.CreateParam(ftFloat, 'sTasa',  ptOutput);

       //Asigna s valores de entrada
       sp.Params.ParamByName('pPlazo').AsInteger   :=pDIAS_PLAZO.AsInteger;

       //Prepara y ejecuta el stored procedure
       sp.ExecProc;

       //Obtiene el resultado de la ejecución del stored procedure
       //De acuerdo a la solicitud de Elías durante el periodo de pruebas el valor
       //de la tasa se debe redondear a 2 decimales
       Tasa := round( sp.parambyname('sTasa').AsFloat*100)/100;

       pTasa:=Tasa;
       BuscaTasaLimit := not( pTasa = -1 );
    finally sp.free;
    end;
end;

end.



