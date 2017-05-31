// Sistema         : Clase de MQrCoin
// Fecha de Inicio : 20/06/2006
// Función forma   : Clase de MQrCoin
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntMQrCoin;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntParamCre,
IntQRCOINCV,
IntQRCOINABC,
IntQRCOINProm,
IntQRCOINRie
;

Type
 TMQrCoin= class;                                                  

  TWMQrCoin=Class(TForm)
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
    Label1: TLabel;
    Label2: TLabel;
    cbMes: TComboBox;
    cbAnio: TComboBox;
    rgTipoReporte: TRadioGroup;
    rgTipoCartera: TRadioGroup;
    rgGrupoMon: TRadioGroup;
    cbDetalle: TCheckBox;
    Label6: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    SaveDialog1: TSaveDialog;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1Preview(Sender: TObject);
    procedure InterForma1Imprimir(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    private
    { Private declarations }
    {ROIM 21/03/2007 GENERA CONSULTAS A EXCEL "INTEGRACIÓN CARTERA"}
    sArchivo:String;
    F: TextFile;
    {//roim}
    public
    { Public declarations }
    Objeto : TMQrCoin;
    {ROIM 21/03/2007 GENERA CONSULTAS A EXCEL "INTEGRACIÓN CARTERA"}
    Function GenArchFondeo : Boolean;
    Function GenArchIntegra : Boolean;
    {/ROIM}
end;
 TMQrCoin= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        ParamCre                 : TParamCre;

        { Public declarations }
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;

        Function    DameNoMes(PEMes : String) : Integer;
        Function    DameMes(PENoMes : Integer) : String;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TMQrCoin.Create( AOwner : TComponent ); 
begin Inherited;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMQrCoin.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMQrCoin.Destroy;
begin inherited;
end;


function TMQrCoin.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMQrCoin;
begin
   W:=TWMQrCoin.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
//      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.FormaTipo := ftImprimir; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TMQrCoin.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IMQrCoin.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TMQrCoin.Reporte:Boolean;
begin //Execute_Reporte(); 
end;

Function    TMQrCoin.DameNoMes(PEMes : String) : Integer;
var   VLNoMes : Integer;
begin
   if PEMes = 'Enero'           then    VLNoMes := 1
   else if PEMes = 'Febrero'    then    VLNoMes := 2
   else if PEMes = 'Marzo'      then    VLNoMes := 3
   else if PEMes = 'Abril'      then    VLNoMes := 4
   else if PEMes = 'Mayo'       then    VLNoMes := 5
   else if PEMes = 'Junio'      then    VLNoMes := 6
   else if PEMes = 'Julio'      then    VLNoMes := 7
   else if PEMes = 'Agosto'     then    VLNoMes := 8
   else if PEMes = 'Septiembre' then    VLNoMes := 9
   else if PEMes = 'Octubre'    then    VLNoMes := 10
   else if PEMes = 'Noviembre'  then    VLNoMes := 11
   else if PEMes = 'Diciembre'  then    VLNoMes := 12;
   //end if;

   DameNoMes := VLNoMes;
end;

Function    TMQrCoin.DameMes(PENoMes : Integer) : String;
var   VLMes : String;
begin
     if PENoMes =  1      then    VLMes := 'Enero'
     else if PENoMes =  2 then    VLMes := 'Febrero'
     else if PENoMes =  3 then    VLMes := 'Marzo'
     else if PENoMes =  4 then    VLMes := 'Abril'
     else if PENoMes =  5 then    VLMes := 'Mayo'
     else if PENoMes =  6 then    VLMes := 'Junio'
     else if PENoMes =  7 then    VLMes := 'Julio'
     else if PENoMes =  8 then    VLMes := 'Agosto'
     else if PENoMes =  9 then    VLMes := 'Septiembre'
     else if PENoMes =  10 then    VLMes := 'Octubre'
     else if PENoMes =  11 then    VLMes := 'Noviembre'
     else if PENoMes =  12 then    VLMes := 'Diciembre';
     //end if;

     DameMes := VLMes;
end;


(***********************************************FORMA MQrCoin********************)
(*                                                                              *)
(*  FORMA DE MQrCoin                                                            *)
(*                                                                              *)
(***********************************************FORMA MQrCoin********************)

{ROIM 21/03/2007 GENERA CONSULTAS A EXCEL "INTEGRACIÓN CARTERA"}
Function TWMQrCoin.GenArchFondeo: Boolean;
var  VLSalida: Boolean;
     VLSQL   : String;
     Q       : TQuery;
begin
    VLSQL := ' SELECT '+#39+'001'+#39+' AS GPO, ' +
             '        DECODE(CCTO.CVE_SUB_TIP_BCO,57,'+#39+'HIPO'+#39+','+#39+'FIRA'+#39+') ACT_FINANC, ' +
             '        CTO.CVE_MONEDA, ' +
             '        TO_CHAR(CC.ID_CREDITO) NO_CREDITO ' +
             ' FROM  (SELECT * FROM CRE_CREDITO) CC, ' +
             '       (SELECT * FROM CRE_CONTRATO) CCTO, ' +
             '       (SELECT * FROM CONTRATO ' +
             '        WHERE  CVE_TIP_CONTRATO = '+#39+'CRED'+#39+') CTO ' +
             ' WHERE  CCTO.ID_CONTRATO = CC.ID_CONTRATO ' +
             ' AND    CTO.ID_CONTRATO = CC.ID_CONTRATO ' +
             ' AND   (CVE_SUB_TIP_BCO IN (57) OR CVE_PRESUPUESTO = '+#39+'PROCAM'+#39+') ' +
             ' AND    CC.ID_CREDITO IN (SELECT ID_CREDITO FROM CRE_RESUMEN ' +
             '                          WHERE F_RESUMEN >= TO_DATE('+#39+'01'+'/'+IntToStr(Objeto.DameNoMes(cbMes.Text))+'/'+cbAnio.Text+#39+','+#39+'DD/MM/YYYY'+#39+')) ' +
             ' UNION ALL ' +
             ' SELECT '+#39+'002'+#39+' AS GPO, ' +
             '        DECODE(CP.CVE_PRODUCTO_GPO,'+#39+'AGRONE'+#39+','+#39+'FIRA'+#39+','+#39+' '+#39+') ACT_FINANC, ' +
             '        CTO.CVE_MONEDA, ' +
             '        TO_CHAR(CC.ID_CREDITO) NO_CREDITO ' +
             ' FROM  (SELECT * FROM CR_CREDITO) CC, ' +
             '       CR_CONTRATO CCTO, ' +
             '       (SELECT * FROM CONTRATO WHERE CVE_TIP_CONTRATO = '+#39+'CRED'+#39+')CTO, ' +
             '       (SELECT * FROM CR_PRODUCTO WHERE CVE_PRODUCTO_GPO = '+#39+'AGRONE'+#39+')CP ' +
             ' WHERE  CCTO.ID_CONTRATO = CC.ID_CONTRATO ' +
             ' AND    CCTO.FOL_CONTRATO = CC.FOL_CONTRATO ' +
             ' AND    CTO.ID_CONTRATO = CC.ID_CONTRATO ' +
             ' AND    CP.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE ' +
             ' AND    CC.ID_CREDITO IN (SELECT ID_CREDITO FROM CR_HISTO_CRED ' +
             '                          WHERE F_CIERRE >= TO_DATE('+#39+'01'+'/'+IntToStr(Objeto.DameNoMes(cbMes.Text))+'/'+cbAnio.Text+#39+','+#39+'DD/MM/YYYY'+#39+')) ' +
             ' UNION  ALL ' +
             ' SELECT '+#39+'003'+#39+' AS GPO, ' +
             '        DECODE(CS.B_OPERADO_NAFIN,'+#39+'V'+#39+','+#39+'NAFI'+#39+','+#39+' '+#39+') ACT_FINANC, ' +
             '        CTO.CVE_MONEDA, ' +
             '        TO_CHAR(CC.ID_CREDITO) NO_CREDITO ' +
             ' FROM  (SELECT * FROM CR_CREDITO) CC, ' +
             '       CR_CONTRATO CCTO, ' +
             '       (SELECT * FROM CONTRATO WHERE  CVE_TIP_CONTRATO = '+#39+'CRED'+#39+')CTO, ' +
             '       (SELECT * FROM CR_PRODUCTO WHERE  CVE_PRODUCTO_GPO = '+#39+'FACTOR'+#39+')CP, ' +
             '       CR_CESION CS ' +
             ' WHERE  CCTO.ID_CONTRATO = CC.ID_CONTRATO ' +
             ' AND    CCTO.FOL_CONTRATO = CC.FOL_CONTRATO ' +
             ' AND    CTO.ID_CONTRATO = CCTO.ID_CONTRATO ' +
             ' AND    CP.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE ' +
             ' AND    CS.ID_CESION = CC.ID_CREDITO ' +
             ' AND    CS.B_OPERADO_NAFIN = '+#39+'V'+#39+' ' +
             ' AND    CC.ID_CREDITO IN (SELECT ID_CREDITO FROM CR_HISTO_CRED ' +
             '                          WHERE F_CIERRE >= TO_DATE('+#39+'01'+'/'+IntToStr(Objeto.DameNoMes(cbMes.Text))+'/'+cbAnio.Text+#39+','+#39+'DD/MM/YYYY'+#39+')) ';

   VLSalida := False;
   Try
      sArchivo := edNbrArch.Text;
      If Trim(sArchivo)<>'' Then
      begin
          AssignFile(F, sArchivo);
          Rewrite(F);

          Q :=  GetSQLQuery(VLSQL,Objeto.DataBaseName,Objeto.SessionName,True);
          try
             if Q <> nil then
             begin
                  while Not(Q.Eof) do
                  begin
                       Writeln(F, Q.FieldByName('GPO').AsString + #09 +
                                  Q.FieldByName('ACT_FINANC').AsString + #09 +
                                  Q.FieldByName('CVE_MONEDA').AsString + #09 +
                                  Q.FieldByName('NO_CREDITO').AsString );
                       Q.Next;
                  end;
             end;
          finally
                if Q <> nil then Q.free;
          end;
      end;
      VLSalida := True;
   Finally
      If Trim(sArchivo)<>'' Then
      begin
           CloseFile(F);
      End;
   end;
   GenArchFondeo := VLSalida;
end;
{/ROIM}

{ROIM 21/03/2007 GENERA CONSULTAS A EXCEL "INTEGRACIÓN CARTERA"}
Function  TWMQrCoin.GenArchIntegra: Boolean;
var  VLSalida: Boolean;
     VLSQL   : String;
     Q       : TQuery;
     VLMes   : Integer;
     VLAnio  : Integer;
     VLFecha : TDateTime;
begin

    VLMes := Objeto.DameNoMes(cbMes.Text);
    VLAnio := StrToInt(cbAnio.Text);

    if VLMes = 12 then
    begin
         VLMes := 1;
         VLAnio := VLAnio + 1;
    end
    else
    begin
         VLMes := VLMes + 1;
    end;

    VLFecha := StrToDateTime('01' + '/' + IntToStr(VLMes) + '/' + IntToStr(VLAnio));

    VLFecha := VLFecha - 1;

//    FormatDateTime('dd/mm/yyyy',VLFecha)


    VLSQL :=' SELECT ' + #39 + 'ICRE_PROVDIARIA' + #39 + '            AS FUENTE, '+
            '        B.ID_PERSONA                 AS ID_PERSONA, '+
            '        B.NOMBRE                     AS NOMBRE, '+
            '        B.DESC_MONEDA                AS DESC_MONEDA, '+
            '        B.CVE_PRODUCTO_CRE           AS CVE_PRODUCTO, '+
            '        B.ID_PERS_ASOCIAD            AS ID_PERS_ASOCIAD, '+
            '        B.ID_PROM_ADM                AS ID_PROM_ADM, '+
            '        B.P_ASOC                     AS NOM_PROM_ASO, '+
            '        B.PROMADM                    AS NOM_PROM_ADM, '+
            '        CONC.DESC_CONCEPTO           AS CONCEPTO, '+
            '        MAX(DECODE(CONC.ORDEN,1,B.CTA_CONTABLE,2,B.CTA_INTERES,0)) AS CUENTA_CONTABLE, '+
            '        SUM(DECODE(CONC.ORDEN,1,B.SDO_INSOLUTO,B.INT_ACUM)) AS IMPORTE '+
            '   FROM (SELECT A.*, '+
            ' 			      DECODE(PARTE,' + #39 + 'A' + #39 + ', '+
            '       	  	   DECODE(CVE_SUB_TIP_BCO,57,IMP_INTERES_DIA*DIAS_PROV, '+
            '                      59,IMP_INTERES_DIA*DIAS_PROV, '+
            '       					60,IMP_INTERES_DIA*DIAS_PROV, '+
            '       					61,IMP_INTERES_DIA*DIAS_PROV, '+
            '       					65,IMP_INTERES_DIA*DIAS_PROV, '+
            '       					140,IMP_INTERES_DIA*DIAS_PROV, '+
            '       					147,IMP_INTERES_DIA*DIAS_PROV, '+
            '       					20,IMP_INTERES_DIA*DIAS_PROV, '+
            '       					DECODE(CVE_CALCULO,' + #39 + 'AN' + #39 + ',0,IMP_INTERES_PER)), '+
            '                            ' + #39 + 'B' + #39 + ', INT_ACUM_OPC1 )INT_ACUM, '+
            '       			DECODE(PARTE,' + #39 + 'A' + #39 + ', '+
            '       	  	   DECODE(CVE_SUB_TIP_BCO,57,IMP_INTERES_DIA, '+
            '                      59,IMP_INTERES_DIA, '+
            '       					60,IMP_INTERES_DIA, '+
            '       					61,IMP_INTERES_DIA, '+
            '       					65,IMP_INTERES_DIA, '+
            '       					140,IMP_INTERES_DIA, '+
            '       					147,IMP_INTERES_DIA, '+
            '       					20,IMP_INTERES_DIA, '+
            '       					DECODE(CVE_CALCULO,' + #39 + 'AN' + #39 + ',0,' + #39 + 'PA' + #39 + ',IMP_INTERES_DIA, '+
            '                            IMP_INTERES_PER-IMP_INTERES_AYER)), '+
            '                            ' + #39 + 'B' + #39 + ', IMP_INTERES_DIA )INT_DIA, '+
            '       			DECODE(PARTE,' + #39 + 'A' + #39 + ', '+
            '       	  	   DECODE(CVE_SUB_TIP_BCO,57,INT_ACUM_OPC1, '+
            '                      59,INT_ACUM_OPC1, '+
            '       					60,INT_ACUM_OPC1, '+
            '       					61,INT_ACUM_OPC1, '+
            '       					65,INT_ACUM_OPC1, '+
            '       					140,INT_ACUM_OPC1, '+
            '       					147,INT_ACUM_OPC1, '+
            '       					20,INT_ACUM_OPC1, '+
            '       					DECODE(CVE_CALCULO,' + #39 + 'AN' + #39 + ',0,IMP_INTERES_PER)), '+
            '                            ' + #39 + 'B' + #39 + ', INT_ACUM_OPC1 )INT_ACUM_ETQ '+
            '           FROM (( '+
            '                  SELECT '+
            '                        ' + #39 + 'A' + #39 + ' PARTE, '+
            '                        ' + #39 + 'CARTERA NO BANCARIA' + #39 + ' CARTERA, '+
            '                        NVL2(CRE_PROV_DIARIA.F_TRASPASO_VEN,' + #39 + '*' + #39 + ',' + #39 + ' ' + #39 + ') VENCIDA, '+
            '                        PERSONA.CVE_PER_JURIDICA, '+
            '                        PERSONA_MORAL.NOM_RAZON_SOCIAL ||PERSONA_FISICA.APELLIDO_PATERNO || ' + #39 + ' ' + #39 + ' || PERSONA_FISICA.APELLIDO_MATERNO || ' + #39 + ' ' + #39 + ' || PERSONA_FISICA.NOMBRE_PERSONA NOMBRE, '+
            '                        CRE_PROV_DIARIA.F_TRASPASO_VEN, '+
            '                        CRE_PROV_DIARIA.F_PROVISION-( CI.F_VENCIMIENTO-CI.PLAZO) + 1 dias_prov, '+
            '                        CR.CVE_CAT_MIN, CRE_CAT_MINIMO.DESC_CAT_MIN, CONTRATO.CVE_MONEDA, '+
            '                        CR.CVE_SUB_CARTERA, '+
            '                        CRE_PROV_DIARIA.F_PROVISION - (CI.F_VENCIMIENTO - CI.PLAZO) + 1 DIAS_FINAL, '+
            '                        CRE_PROV_DIARIA.IMP_INTERES_DIA * (CRE_PROV_DIARIA.F_PROVISION - (CI.F_VENCIMIENTO - CI.PLAZO) + 1) INT_ACUM_OPC1, '+
            '                        CR.F_VALOR_CRED + CR.DIAS_PLAZO FEC_VENC_CRED, '+
            '                        CI.F_VENCIMIENTO - CI.PLAZO FEC_INICIO_INTERES, '+
            '                        MONEDA.DESC_MONEDA, CRE_PARAMETRO.TC_CONT_USD, CRE_PARAMETRO.TC_CONT_UDI, '+
            '                       CR.CVE_SUB_TIP_BCO, CR.DESC_SUB_TIPO DESC_SUB_TIPO, '+
            '                       SUBSTR( CR.DESC_SUB_TIPO1, 1, 200 ) DESC_SUB_TIPO1, '+
            '                       CR.ID_CREDITO, CR.ID_CESION, CR.CVE_CALCULO, CR.CVE_TASA_REFER, '+
            '                       CR.DIAS_PLAZO, CR.F_VALOR_CRED, CR.IMP_CREDITO, CR.SOBRETASA, '+
            '                       CR.TIPO_DISPOSICION, CR.B_PROG_FOPYME, '+
            '                       DECODE(CVE_SUB_TIP_BCO,52,DECODE(CR.B_OPERADO_NAFIN,' + #39 + 'V' + #39 + ',' + #39 + 'N' + #39 + ',' + #39 + ' ' + #39 + '),' + #39 + ' ' + #39 + ')B_OPERADO_NAFIN, '+
            '                       CRE_SUB_TIP_CNBV.CTA_CONTABLE, CRE_SUB_TIP_CNBV.CTA_INTERES, '+
            '                       CRE_PROV_DIARIA.F_PROVISION, CRE_PROV_DIARIA.IMP_INTERES_AYER, '+
            '                       CRE_PROV_DIARIA.IMP_INTERES_DIA, CRE_PROV_DIARIA.IMP_INTERES_PER, '+
            '                       CRE_PROV_DIARIA.SDO_INSOLUTO, CRE_PROV_DIARIA.TASA_APLICADA, '+
            '                       CRE_TIPO_CREDITO.TIPO_CUENTA,CRE_TIPO_CREDITO.DESC_TIPO_CRED, '+
            '                       CI.F_VENCIMIENTO, CI.PLAZO, '+
            '                       CONTRATO.ID_TITULAR ID_PERSONA, CR.ID_PROM_ADM, '+
            '                       ' + #39 + ' ' + #39 + ' PROMADM, CONTRATO.ID_PERS_ASOCIAD, PASOC.NOMBRE P_ASOC, '+
            '                       ' + #39 + ' ' + #39 + ' CVE_PRODUCTO_CRE, ' + #39 + ' ' + #39 + ' DESC_C_PRODUCTO, CONTRATO.ID_EMPRESA '+
            '                  FROM PERSONA, CONTRATO, PERSONA_FISICA, PERSONA_MORAL, '+
            '                       MONEDA, CRE_PARAMETRO, PERSONA PASOC, '+
            '                       (SELECT ' + #39 + 'CRED' + #39 + '           ORIGEN, '+
            '                               ID_CREDITO,      ID_CONTRATO,      ID_CESION, '+
            '                               CVE_CALCULO,     CVE_TASA_REFER,   SOBRETASA, '+
            '                               B_PROG_FOPYME,   TIPO_DISPOSICION, F_VALOR_CRED, '+ 
            '                               IMP_CREDITO,     DIAS_PLAZO, '+
            '                               F_VALOR_CRED +   DIAS_PLAZO FEC_VENC_CRED, '+
            '                               CVE_CAT_MIN,     CVE_SUB_TIP_BCO,  DESC_SUB_TIPO, '+
            '                               CVE_SUB_CARTERA, CVE_SUB_TIP_CNBV, DESC_SUB_TIPO1, '+
            '                               B_OPERADO_NAFIN, ID_PROM_ADM '+
            '                          FROM (SELECT C.ID_CREDITO,      C.ID_CONTRATO,      C.ID_CESION, '+
            '                                       C.CVE_CALCULO,     C.CVE_TASA_REFER,   C.SOBRETASA, '+
            '                                       C.B_PROG_FOPYME,   C.TIPO_DISPOSICION, C.F_VALOR_CRED, '+
            '                                       C.IMP_CREDITO,     C.DIAS_PLAZO, '+
            '                                       C.F_VALOR_CRED + C.DIAS_PLAZO FEC_VENC_CRED, '+
            '                                       C.ID_PROM_ADM, '+
            '                                       A.CVE_CAT_MIN,     A.CVE_SUB_TIP_BCO, A.DESC_SUB_TIPO, '+
            '                                       A.CVE_SUB_CARTERA, A.CVE_SUB_TIP_CNBV, '+
            '                                       PKGCREINGRESO.STPOBTDESCSUBTIP01( C.CVE_CALCULO, C.TIPO_DISPOSICION, '+
            '                                        A.CVE_SUB_TIP_BCO, A.DESC_SUB_TIPO ) DESC_SUB_TIPO1, '+
            '                                        CS.B_OPERADO_NAFIN, A.F_TRASPASO_ICRE, C.SIT_CREDITO '+
            '                                   FROM (SELECT L.ID_CONTRATO,        L.CVE_CAT_MIN, '+
            '                                                CST.CVE_SUB_TIP_BCO,  CST.CVE_SUB_CARTERA, '+
            '                                                CST.CVE_SUB_TIP_CNBV, '+
            '                                                CST.DESC_SUB_TIPO,    CST.F_TRASPASO_ICRE '+
            '                                           FROM CRE_SUB_TIP_BCO CST,  CRE_CONTRATO L '+
            '                                          WHERE L.CVE_SUB_TIP_BCO  =  CST.CVE_SUB_TIP_BCO '+
            '                                        )A , '+
            '                                        CRE_CREDITO C, '+
            '                                        CRE_CESION  CS '+
            '                                  WHERE C.ID_CONTRATO  = A.ID_CONTRATO '+
            '                                    AND  CS.ID_CESION(+)= C.ID_CESION '+
            '                                )B '+
            '                          WHERE ( B.F_TRASPASO_ICRE IS NOT NULL AND B.SIT_CREDITO NOT IN ( ' + #39 + 'TA' + #39 + ' )) '+
            '                             OR B.F_TRASPASO_ICRE IS NULL '+
            '                        )CR, CRE_SUB_TIP_CNBV, CRE_PROV_DIARIA, CRE_CAT_MINIMO, CRE_TIPO_CREDITO, '+
            '                        (SELECT ' + #39 + 'CRED' + #39 + '           ORIGEN, '+
            '                                CI.ID_CREDITO,  CI.NUM_PERIODO,  CI.F_VENCIMIENTO, CI.PLAZO '+
            '                           FROM CRE_INTERES CI, CRE_CREDITO CR '+
            '                          WHERE CR.ID_CREDITO = CI.ID_CREDITO '+
            '                            AND CR.SIT_CREDITO NOT IN ( ' + #39 + 'CA' + #39 + ', ' + #39 + 'TA' + #39 + ' ) '+
            '                        )CI '+
            '                  WHERE CONTRATO.ID_EMPRESA=2 '+
            '                    AND CR.CVE_SUB_TIP_BCO NOT IN (118,119,120,121) '+
            '                    AND CONTRATO.ID_TITULAR = PERSONA.ID_PERSONA '+
            '                    AND CONTRATO.ID_TITULAR = PERSONA_FISICA.ID_PERSONA (+) '+
            '                    AND CONTRATO.ID_TITULAR = PERSONA_MORAL.ID_PERSONA (+) '+
            '                    AND CONTRATO.ID_CONTRATO = CR.ID_CONTRATO '+
            '                    AND CONTRATO.CVE_MONEDA = MONEDA.CVE_MONEDA '+
            '                    AND CONTRATO.CVE_TIP_CONTRATO = CRE_PARAMETRO.CVE_TIP_CONTRATO '+
            '                    AND CR.CVE_CAT_MIN = CRE_CAT_MINIMO.CVE_CAT_MIN(+) '+
            '                    AND CR.ID_CREDITO = CRE_PROV_DIARIA.ID_CREDITO '+
            '                    AND CRE_PROV_DIARIA.F_PROVISION = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ') '+
            '                    AND CR.CVE_SUB_TIP_CNBV = CRE_SUB_TIP_CNBV.CVE_SUB_TIP_CNBV '+
            '                    AND CRE_SUB_TIP_CNBV.CVE_TIPO_CREDITO = CRE_TIPO_CREDITO.CVE_TIPO_CREDITO '+
            '                    AND CR.ORIGEN = CI.ORIGEN '+
            '                    AND CRE_PROV_DIARIA.ID_CREDITO = CI.ID_CREDITO '+
            '                    AND CRE_PROV_DIARIA.NUM_PERIODO = CI.NUM_PERIODO '+
            '                    AND CR.CVE_SUB_TIP_BCO IN(50,59,60,118,119,120,121,51) '+
            '                    AND PASOC.ID_PERSONA(+)= CONTRATO.ID_PERS_ASOCIAD '+
            '                  UNION ALL '+
            '                  SELECT '+
            '                         ' + #39 + 'A' + #39 + ' PARTE, '+
            '                         ' + #39 + 'CARTERA BANCARIA' + #39 + ' CARTERA, '+
            '                         NVL2(CRE_PROV_DIARIA.F_TRASPASO_VEN,' + #39 + '*' + #39 + ',' + #39 + ' ' + #39 + ') VENCIDA, '+
            '                         PERSONA.CVE_PER_JURIDICA, '+
            '                         PERSONA_MORAL.NOM_RAZON_SOCIAL ||PERSONA_FISICA.APELLIDO_PATERNO || ' + #39 + ' ' + #39 + ' || PERSONA_FISICA.APELLIDO_MATERNO || ' + #39 + ' ' + #39 + ' || PERSONA_FISICA.NOMBRE_PERSONA NOMBRE, '+
            '                         CRE_PROV_DIARIA.F_TRASPASO_VEN, '+
            '                         CRE_PROV_DIARIA.F_PROVISION-(CI.F_VENCIMIENTO-CI.PLAZO) + 1 dias_prov, '+
            '                         CR.CVE_CAT_MIN, CRE_CAT_MINIMO.DESC_CAT_MIN, CONTRATO.CVE_MONEDA, '+
            '                         CR.CVE_SUB_CARTERA, '+
            '                         CRE_PROV_DIARIA.F_PROVISION - (CI.F_VENCIMIENTO - CI.PLAZO) + 1 DIAS_FINAL, '+
            '                         CRE_PROV_DIARIA.IMP_INTERES_DIA * (CRE_PROV_DIARIA.F_PROVISION - (CI.F_VENCIMIENTO - CI.PLAZO) + 1) INT_ACUM_OPC1, '+
            '                         CR.F_VALOR_CRED + CR.DIAS_PLAZO FEC_VENC_CRED, '+
            '                         CI.F_VENCIMIENTO - CI.PLAZO FEC_INICIO_INTERES, '+
            '                         MONEDA.DESC_MONEDA, CRE_PARAMETRO.TC_CONT_USD, '+
            '                         CRE_PARAMETRO.TC_CONT_UDI, CR.CVE_SUB_TIP_BCO, '+
            '                         CR.DESC_SUB_TIPO DESC_SUB_TIPO, '+
            '                         SUBSTR( CR.DESC_SUB_TIPO1, 1, 200 ) DESC_SUB_TIPO1, '+
            '                         CR.ID_CREDITO, CR.ID_CESION, CR.CVE_CALCULO, CR.CVE_TASA_REFER, '+
            '                         CR.DIAS_PLAZO,CR.F_VALOR_CRED, CR.IMP_CREDITO, CR.SOBRETASA, '+
            '                         CR.TIPO_DISPOSICION, CR.B_PROG_FOPYME, '+
            '                         DECODE(CVE_SUB_TIP_BCO,52,DECODE(CR.B_OPERADO_NAFIN,' + #39 + 'V' + #39 + ',' + #39 + 'N' + #39 + ',' + #39 + ' ' + #39 + '),' + #39 + ' ' + #39 + ')B_OPERADO_NAFIN, '+
            '                         CRE_SUB_TIP_CNBV.CTA_CONTABLE, CRE_SUB_TIP_CNBV.CTA_INTERES, '+
            '                         CRE_PROV_DIARIA.F_PROVISION, CRE_PROV_DIARIA.IMP_INTERES_AYER, '+
            '                         CRE_PROV_DIARIA.IMP_INTERES_DIA, CRE_PROV_DIARIA.IMP_INTERES_PER, '+
            '                         CRE_PROV_DIARIA.SDO_INSOLUTO, CRE_PROV_DIARIA.TASA_APLICADA, '+
            '                         CRE_TIPO_CREDITO.TIPO_CUENTA,CRE_TIPO_CREDITO.DESC_TIPO_CRED, '+
            '                         CI.F_VENCIMIENTO, CI.PLAZO, '+
            '                         CONTRATO.ID_TITULAR ID_PERSONA, CR.ID_PROM_ADM, '+
            '                         ' + #39 + ' ' + #39 + ' PROMADM, CONTRATO.ID_PERS_ASOCIAD, PASOC.NOMBRE P_ASOC, '+
            '                         ' + #39 + ' ' + #39 + ' CVE_PRODUCTO_CRE, ' + #39 + ' ' + #39 + ' DESC_C_PRODUCTO, CONTRATO.ID_EMPRESA '+
            '                    FROM PERSONA,CONTRATO, PERSONA_FISICA, PERSONA_MORAL, MONEDA, '+
            '                         CRE_PARAMETRO, PERSONA PASOC, '+
            '                         (SELECT ' + #39 + 'CRED' + #39 + '           ORIGEN, '+
            '                                 ID_CREDITO,      ID_CONTRATO,      ID_CESION, '+
            '                                 CVE_CALCULO,     CVE_TASA_REFER,   SOBRETASA, '+
            '                                 B_PROG_FOPYME,   TIPO_DISPOSICION, F_VALOR_CRED, '+
            '                                 IMP_CREDITO,     DIAS_PLAZO, '+
            '                                 F_VALOR_CRED +   DIAS_PLAZO FEC_VENC_CRED, '+
            '                                 CVE_CAT_MIN,     CVE_SUB_TIP_BCO,  DESC_SUB_TIPO, '+
            '                                 CVE_SUB_CARTERA, CVE_SUB_TIP_CNBV, DESC_SUB_TIPO1, '+
            '                                 B_OPERADO_NAFIN, ID_PROM_ADM '+
            '                            FROM (SELECT C.ID_CREDITO,      C.ID_CONTRATO,      C.ID_CESION, '+
            '                                         C.CVE_CALCULO,     C.CVE_TASA_REFER,   C.SOBRETASA, '+
            '                                         C.B_PROG_FOPYME,   C.TIPO_DISPOSICION, C.F_VALOR_CRED, '+
            '                                         C.IMP_CREDITO,     C.DIAS_PLAZO, '+
            '                                         C.F_VALOR_CRED + C.DIAS_PLAZO FEC_VENC_CRED, '+
            '                                         C.ID_PROM_ADM, '+
            '                                         A.CVE_CAT_MIN,     A.CVE_SUB_TIP_BCO, A.DESC_SUB_TIPO, '+
            '                                         A.CVE_SUB_CARTERA, A.CVE_SUB_TIP_CNBV, '+
            '                                         PKGCREINGRESO.STPOBTDESCSUBTIP01( C.CVE_CALCULO, C.TIPO_DISPOSICION, '+
            '                                         A.CVE_SUB_TIP_BCO, A.DESC_SUB_TIPO ) DESC_SUB_TIPO1, '+
            '                                         CS.B_OPERADO_NAFIN, A.F_TRASPASO_ICRE, C.SIT_CREDITO '+
            '                                    FROM (SELECT L.ID_CONTRATO,        L.CVE_CAT_MIN, '+
            '                                                 CST.CVE_SUB_TIP_BCO,  CST.CVE_SUB_CARTERA, '+
            '                                                 CST.CVE_SUB_TIP_CNBV, '+
            '                                                 CST.DESC_SUB_TIPO,    CST.F_TRASPASO_ICRE '+
            '                                            FROM CRE_SUB_TIP_BCO CST,  CRE_CONTRATO L '+
            '                                           WHERE L.CVE_SUB_TIP_BCO  =  CST.CVE_SUB_TIP_BCO '+
            '                                         )A , '+
            '                                         CRE_CREDITO C, '+
            '                                         CRE_CESION  CS '+
            '                                   WHERE C.ID_CONTRATO  = A.ID_CONTRATO '+
            '                                     AND CS.ID_CESION(+)= C.ID_CESION '+
            '                                 )B '+
            '                           WHERE (B.F_TRASPASO_ICRE IS NOT NULL AND B.SIT_CREDITO NOT IN ( ' + #39 + 'TA' + #39 + ' )) '+
            '                              OR  B.F_TRASPASO_ICRE IS NULL '+
            '                         )CR, CRE_SUB_TIP_CNBV, CRE_PROV_DIARIA, '+
            '                         CRE_CAT_MINIMO, CRE_TIPO_CREDITO, '+
            '                         (SELECT ' + #39 + 'CRED' + #39 + ' ORIGEN, '+
            '                                 CI.ID_CREDITO,  CI.NUM_PERIODO,  CI.F_VENCIMIENTO, CI.PLAZO '+
            '                            FROM CRE_INTERES CI, CRE_CREDITO CR '+
            '                           WHERE CR.ID_CREDITO = CI.ID_CREDITO '+
            '                             AND CR.SIT_CREDITO NOT IN ( ' + #39 + 'CA' + #39 + ', ' + #39 + 'TA' + #39 + ' ) '+
            '                         )CI '+
            '                   WHERE CONTRATO.ID_EMPRESA=2 '+
            '                     AND CR.CVE_SUB_TIP_BCO NOT IN (118,119,120,121) '+
            '                     AND CONTRATO.ID_TITULAR = PERSONA.ID_PERSONA '+
            '                     AND CONTRATO.ID_TITULAR = PERSONA_FISICA.ID_PERSONA (+) '+
            '                     AND CONTRATO.ID_TITULAR = PERSONA_MORAL.ID_PERSONA (+) '+
            '                     AND CONTRATO.ID_CONTRATO = CR.ID_CONTRATO '+
            '                     AND CONTRATO.CVE_MONEDA = MONEDA.CVE_MONEDA '+
            '                     AND CONTRATO.CVE_TIP_CONTRATO = CRE_PARAMETRO.CVE_TIP_CONTRATO '+
            '                     AND CR.CVE_CAT_MIN = CRE_CAT_MINIMO.CVE_CAT_MIN(+) '+
            '                     AND CR.ID_CREDITO = CRE_PROV_DIARIA.ID_CREDITO '+
            '                     AND CRE_PROV_DIARIA.F_PROVISION = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ') '+
            '                     AND CR.CVE_SUB_TIP_CNBV = CRE_SUB_TIP_CNBV.CVE_SUB_TIP_CNBV '+
            '                     AND CRE_SUB_TIP_CNBV.CVE_TIPO_CREDITO = CRE_TIPO_CREDITO.CVE_TIPO_CREDITO '+
            '                     AND CR.ORIGEN = CI.ORIGEN '+
            '                     AND CRE_PROV_DIARIA.ID_CREDITO = CI.ID_CREDITO '+
            '                     AND CRE_PROV_DIARIA.NUM_PERIODO = CI.NUM_PERIODO '+
            '                     AND CR.CVE_SUB_TIP_BCO NOT IN(50,59,60,118,119,120,121,51) '+
            '                     AND CONTRATO.ID_PERS_ASOCIAD = PASOC.ID_PERSONA(+) '+
            '                 ) '+
            '                 UNION ALL '+
            '                 (SELECT ' + #39 + 'B' + #39 + ' PARTE, '+
            '                         ' + #39 + 'CARTERA BANCARIA' + #39 + ' CARTERA, '+
            '                         NVL2(CR_CREDITO.F_TRASPASO_VENC,' + #39 + '*' + #39 + ',' + #39 + ' ' + #39 + ') VENCIDA, '+
            '                         P.CVE_PER_JURIDICA, '+
            '                         DECODE(P.CVE_PER_JURIDICA, ' + #39 + 'PF' + #39 + ', '+
            '                         PF.APELLIDO_PATERNO || ' + #39 + ' ' + #39 + ' || PF.APELLIDO_MATERNO || ' + #39 + ' ' + #39 + ' || PF.NOMBRE_PERSONA, '+
            '                         PM.NOM_RAZON_SOCIAL ) AS NOMBRE, '+
            '                         CR_CREDITO.F_TRASPASO_VENC, '+
            '                         (TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')-FECHA_INT.F_INICIO) dias_prov, '+
            '                         CR_CAT_MINIMO.CVE_CAT_MINIMO CVE_CAT_MIN, '+
            '                         CR_CAT_MINIMO.DESC_CAT_MINIMO DESC_CAT_MIN, '+
            '                         CONTRATO.CVE_MONEDA, '+
            '                         ' + #39 + ' ' + #39 + ' CVE_SUB_CARTERA, '+
            '                         ((TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')-FECHA_INT.F_INICIO) +1) DIAS_FINAL, '+
            '                         NVL(CDH.IMP_INTERES,0) AS INT_ACUM_OPC1, '+
            '                			CR_CREDITO.F_VENCIMIENTO FEC_VENC_CRED, '+
            '                         FECHA_INT.F_INICIO FEC_INICIO_INTERES, '+
            '                         MONEDA.DESC_MONEDA, '+
            '                			CRE_PARAMETRO.TC_CONT_USD, '+
            '                         CRE_PARAMETRO.TC_CONT_UDI, '+
            '                         0 CVE_SUB_TIP_BCO, '+
            '                         ' + #39 + ' ' + #39 + ' DESC_SUB_TIPO, '+
            '                         CR_PRODUCTO.DESC_C_PRODUCTO DESC_SUB_TIPO1, '+
            '                			CR_CREDITO.ID_CREDITO, '+
            '                         CR_CESION.ID_CESION, '+
            '                         CR_CREDITO.CVE_CALCULO, '+
            '                         CR_CREDITO.CVE_TASA_REFER || CR_CREDITO.OPERADOR_STASA  CVE_TASA_REFER, '+
            '                         0 DIAS_PLAZO, '+
            '                			CR_CREDITO.F_INICIO	F_VALOR_CRED, '+
            '                         CR_HISTO_CRED.IMP_CREDITO, '+
            '                			CR_CREDITO.SOBRETASA, '+
            '                         ' + #39 + ' ' + #39 + ' TIPO_DISPOSICION, '+
            '                         ' + #39 + ' ' + #39 + ' B_PROG_FOPYME, '+
            '                         DECODE(CR_CESION.B_OPERADO_NAFIN,' + #39 + 'V' + #39 + ',' + #39 + 'N' + #39 + ',' + #39 + ' ' + #39 + ')B_OPERADO_NAFIN, '+
            '                         TABCTA.CUENTA_VIGENTE_K CTA_CONTABLE, '+
            '                         TABCTA.CUENTA_VIGENTE_INT CTA_INTERES, '+
            '                         TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ') F_PROVISION, '+
            '                         0 IMP_INTERES_AYER, '+
            '                         DECODE(CR_CESION.CVE_TIPO_INTERES,' + #39 + 'IN' + #39 + ',0,CR_HISTO_CRED.IMP_INTERES_DIA) IMP_INTERES_DIA, '+
            '                         NVL(CDH.IMP_INTERES,0) AS IMP_INTERES_PER, '+
            '                         CR_HISTO_CRED.SDO_VIG_TOTAL SDO_INSOLUTO, '+
            '                         CR_HISTO_CRED.TASA_APLICADA, '+
            '                         CR_PRODUCTO.CVE_TIPO_CRED_BC TIPO_CUENTA, CR_TIP_CRED_BC.DESC_TIPO_CRED, '+
            '                         FECHA_INT.F_VENCIMIENTO, '+
            '                         (FECHA_INT.F_VENCIMIENTO - FECHA_INT.F_INICIO)PLAZO, '+
            '                         P.ID_PERSONA, '+
            '                         CR_CREDITO.ID_PROM_ADM, '+
            '                         PERSONA.NOMBRE PROMADM, '+
            '                         CONTRATO.ID_PERS_ASOCIAD, '+
            '                         PASOC.NOMBRE P_ASOC, '+
            '                         CR_PRODUCTO.CVE_PRODUCTO_CRE, '+
            '                         CR_PRODUCTO.DESC_C_PRODUCTO, '+
            '                         CR_PRODUCTO.ID_EMPRESA '+
            '                    FROM CR_CREDITO, CR_HISTO_CRED, '+
            '                         (SELECT ID_CREDITO, SUM(IMP_INTERES) AS IMP_INTERES '+
            '                            FROM CR_DET_HIST_CR '+
            '                           WHERE 1 = 1 '+
            '                             AND F_CIERRE >= TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ') '+
            '                             AND F_CIERRE <= TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ') '+
            '                           GROUP BY ID_CREDITO '+
            '                         )CDH, PERSONA, CR_CONTRATO, CR_PRODUCTO, CONTRATO, MONEDA, CR_TIP_CRED_BC, '+
            '                         PERSONA P, PERSONA_FISICA PF, PERSONA_MORAL PM, PERSONA PASOC, CR_CAT_MINIMO, '+
            '                         (SELECT ID_CREDITO, MIN(F_INICIO)F_INICIO, MAX(F_VENCIMIENTO)F_VENCIMIENTO '+
            '                            FROM (SELECT ID_CREDITO, NUM_PERIODO, '+
            '                                         (F_VENCIMIENTO-PLAZO) F_INICIO, F_VENCIMIENTO '+
            '                                    FROM CR_INTERES '+
            '                                   WHERE (F_VENCIMIENTO-PLAZO) <= TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ') '+
            '                                     AND F_VENCIMIENTO >= TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ') '+
            '                                 )TABLA '+
            '                           GROUP BY TABLA.ID_CREDITO '+
            '                         )FECHA_INT, CR_CESION, CRE_PARAMETRO, '+
            '                         (SELECT CP.CVE_PRODUCTO_CRE, CUENTA_VIGENTE_INT, '+
            '                                 NVL(CtaAgrK.CUENTA_VIGENTE,CtaDDK.CUENTA_VIGENTE ) CUENTA_VIGENTE_K '+
            '                            FROM cr_producto CP, '+
            '                                 (SELECT ' + #39 + 'IN' + #39 + ' AS CVE_CONCEPTO, '+
            '                                         CP.CVE_PRODUCTO_CRE, '+
            '                                         SUBSTR(GC.CUENTA_CONTABLE,1,4) || ' + #39 + '-' + #39 + ' || '+
            '                                         SUBSTR(GC.CUENTA_CONTABLE,5,4) || ' + #39 + '-' + #39 + ' || '+
            '                                         SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VIGENTE_INT '+
            '                                    FROM CR_PRODUCTO CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC '+// GUIA_CONTABLE@SICA GC '+ CAMBIO POR BAJA DE BASE SICA JFOF 03/08/2012 JFOF 
            '                                   WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE '+
            '                                     AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO '+
            '                                     AND GC.EMPRESA = ' + #39 + 'BCO2' + #39 + ' '+
            '                                     AND GC.CODIGO_TRANSACCION IN (306000, 306710) '+
            '                                     AND GC.CAMPO_IMPORTE IN (' + #39 + '03' + #39 + ',' + #39 + '06' + #39 + ') '+
            '                                     AND GC.CLAVE_MONEDA = ' + #39 + 'PESOS' + #39 + ' '+
            '                                     AND (GC.CUENTA_CONTABLE LIKE ' + #39 + '13%' + #39 + ' '+
            '                                      OR GC.CUENTA_CONTABLE LIKE ' + #39 + '26%' + #39 + ') '+
            '                                 )CtaInt, '+
            '                                 (SELECT ' + #39 + 'KA' + #39 + ' AS CVE_CONCEPTO, '+
            '                                         CP.CVE_PRODUCTO_CRE, '+
            '                                         SUBSTR(GC.CUENTA_CONTABLE,1,4) || ' + #39 + '-' + #39 + ' || '+
            '                                         SUBSTR(GC.CUENTA_CONTABLE,5,4) || ' + #39 + '-' + #39 + ' || '+
            '                                         SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VIGENTE '+
            '                                    FROM CR_PRODUCTO CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC '+// GUIA_CONTABLE@SICA GC '+ CAMBIO POR BAJA DE BASE SICA JFOF 03/08/2012 JFOF 
            '                                   WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE '+
            '                                     AND CCP.CVE_PRODUCTO_CR NOT LIKE ' + #39 + '%FAC' + #39 + ' '+
            '                                     AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO '+
            '                                     AND GC.EMPRESA = ' + #39 + 'BCO2' + #39 + ' '+
            '                                     AND GC.CODIGO_TRANSACCION IN (300000) '+
            '                                     AND GC.CLAVE_MONEDA = ' + #39 + 'PESOS' + #39 + ' '+
            '                                     AND GC.CAMPO_IMPORTE = ' + #39 + '02' + #39 + ' '+
            '                                     AND (GC.CUENTA_CONTABLE LIKE ' + #39 + '13%' + #39 + ') '+
            '                                 )CtaAgrK, '+
            '                                 (SELECT ' + #39 + 'KA' + #39 + ' AS CVE_CONCEPTO,CCP.CVE_PRODUCTO_CR, '+
            '                                         CTA_CONTABLE || ' + #39 + '-' + #39 + ' ||SUBSTR(SUB_CTA_CONTABLE,1,4) || ' + #39 + '-' + #39 + ' || '+
            '                                         SUBSTR(SUB_CTA_CONTABLE,5,2) AS CUENTA_VIGENTE '+
            '                                    FROM CR_CONT_PRODUCTO  CCP '+
            '                                   WHERE CVE_PRODUCTO_CR LIKE ' + #39 + '%FAC' + #39 + ' '+
            '                                 )CtaDDK '+
            '                           WHERE CtaInt.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE '+
            '                             AND CtaAgrK.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE '+
            '                             AND CtaDDK.CVE_PRODUCTO_CR (+)= cp.CVE_PRODUCTO_CRE '+
            '                         )TABCTA '+
            '                   WHERE CR_CREDITO.SIT_CREDITO <> ' + #39 + 'CA' + #39 + ' '+
            '                     AND CR_CREDITO.ID_CREDITO = CR_HISTO_CRED.ID_CREDITO '+
            '                     AND CR_HISTO_CRED.F_CIERRE >= TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ') '+
            '                     AND CR_HISTO_CRED.F_CIERRE <= TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ') '+
            '                     AND CR_CREDITO.ID_CREDITO = CDH.ID_CREDITO (+) '+
            '                     AND CR_CREDITO.ID_PROM_ADM = PERSONA.ID_PERSONA '+
            '                     AND CR_CREDITO.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+
            '                     AND CR_CREDITO.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '+
            '                     AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE '+
            '                     AND CR_PRODUCTO.SIT_PRODUCTO <> ' + #39 + 'CA' + #39 + ' '+
            '                     AND CR_TIP_CRED_BC.CVE_TIPO_CRED_BC = CR_PRODUCTO.CVE_TIPO_CRED_BC '+
            '                     AND CR_CONTRATO.ID_CONTRATO = CONTRATO.ID_CONTRATO '+
            '                     AND CONTRATO.CVE_MONEDA = MONEDA.CVE_MONEDA '+
            '                     AND CONTRATO.ID_TITULAR = P.ID_PERSONA '+
            '                     AND CONTRATO.ID_TITULAR = PF.ID_PERSONA (+) '+
            '                     AND CONTRATO.ID_TITULAR = PM.ID_PERSONA (+) '+
            '                     AND CONTRATO.ID_PERS_ASOCIAD = PASOC.ID_PERSONA (+) '+
            '                     AND CR_PRODUCTO.CVE_CLAS_CONTAB = CR_CAT_MINIMO.CVE_CAT_MINIMO(+) '+
            '                     AND CR_CREDITO.ID_CREDITO = FECHA_INT.ID_CREDITO '+
            '                     AND CR_CREDITO.ID_CREDITO = CR_CESION.ID_CESION(+) '+
            '                     AND CONTRATO.CVE_TIP_CONTRATO = CRE_PARAMETRO.CVE_TIP_CONTRATO '+
            '                     AND CR_CONTRATO.CVE_PRODUCTO_CRE = TABCTA.CVE_PRODUCTO_CRE(+) '+
            '                     AND (CR_CREDITO.F_AUTORIZA + CR_CREDITO.DIAS_PLAZO) > TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ') '+
            '                     AND CR_PRODUCTO.ID_EMPRESA=2 '+
            '                 ) '+
            '                )A '+
            '          WHERE 1=1 '+
            '            AND A.SDO_INSOLUTO > 0 '+
            '            AND A.VENCIDA = ' + #39 + ' ' + #39 + ' '+
            '            ORDER BY A.CARTERA, A.DESC_MONEDA, A.DESC_SUB_TIPO1, A.CVE_PRODUCTO_CRE, A.NOMBRE, A.ID_CREDITO '+
            '        )B, '+
            '         (SELECT 1 ORDEN, ' + #39 + 'SALDO INSOLUTO' + #39 + ' DESC_CONCEPTO FROM DUAL '+
            '          UNION '+
            '          SELECT 2 ORDEN, ' + #39 + 'INTERESES ACUMULADOS' + #39 + ' DESC_CONCEPTO FROM DUAL '+
            '         )CONC '+
            '   WHERE DECODE(CONC.ORDEN,1,B.SDO_INSOLUTO,B.INT_ACUM)>0 '+
            '   GROUP BY '+
            '        B.ID_PERSONA             , '+
            '        B.NOMBRE                 , '+
            '        B.DESC_MONEDA            , '+
            '        B.CVE_PRODUCTO_CRE       , '+
            '        B.ID_PERS_ASOCIAD        , '+
            '        B.ID_PROM_ADM            , '+
            '        B.P_ASOC                 , '+
            '        B.PROMADM                , '+
            '        CONC.DESC_CONCEPTO       , '+
            '        DECODE(CONC.ORDEN,1,B.CTA_CONTABLE,2,B.CTA_INTERES,0) '+
            ' UNION ALL '+
            ' SELECT '+
            '        ' + #39 + 'ICRE_PROGVEN' + #39 + '            AS FUENTE, '+
            '        CTO.ID_TITULAR            AS ID_PERSONA, '+
            '        DECODE(PCE.CVE_PER_JURIDICA,' + #39 + 'PM' + #39 + ',PCE.NOMBRE,PTIT.APELLIDO_PATERNO||' + #39 + ' ' + #39 + '||PTIT.APELLIDO_MATERNO||' + #39 + ' ' + #39 + '||PTIT.NOMBRE_PERSONA) AS NOMBRE, '+
            '        M.DESC_MONEDA             AS DESC_MONEDA, '+
            '        CPR.CVE_PRODUCTO_CRE      AS CVE_PRODUCTO, '+
            '        CTO.ID_PERS_ASOCIAD       AS ID_PERS_ASOCIAD, '+
            '        CC.ID_PROM_ADM            AS ID_PROM_ADM, '+
            '        PPRC.NOMBRE               AS NOM_PROM_ASO, '+
            '        PPR.NOMBRE                AS NOM_PROM_ADM, '+
            '        ACCESORIO                 AS CONCEPTO, '+
            '        DECODE(ORD_ACC,' + #39 + 'A' + #39 + ', CUENTA_VIGENTE_INT,' + #39 + 'C' + #39 + ' ,CUENTA_VIGENTE_K,CUENTA_VIGENTE_INT) AS CUENTA_CONTABLE, '+
            '        SUM(ACCE.IMP_BINTER)      AS IMPORTE '+
            '   FROM '+
            '        (SELECT ' + #39 + 'A' + #39 + ' ORD_ACC ,CCA.ID_CREDITO,' + #39 + 'CAPITAL' + #39 + ' ACCESORIO,CCA.NUM_PERIODO, '+
            '                (CCA.IMP_CAPITAL - CCA.IMP_PAGADO_HIST - CCA.IMP_CONCEPTO) IMP_BINTER '+
            '           FROM (SELECT CCA.*, NVL(FEGA.IMP_CONCEPTO,0) IMP_CONCEPTO, '+
            '                        NVL(  PKGCRCOMUN.STPOBTIMPPAGADO( ' + #39 + 'CP' + #39 + ', ' + #39 + 'IMPBRU' + #39 + ',CCA.ID_CREDITO, CCA.NUM_PERIODO, '+
            '                        NULL,TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '),' + #39 + 'V' + #39 + ' ), 0 ) AS IMP_PAGADO_HIST '+
            '                  FROM ( '+
            '                        SELECT * FROM CR_CAPITAL CCA '+
            '                         WHERE 1 = 1 '+
            '                           AND  CCA.F_VENCIMIENTO <= TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ') '+
            '                           AND  ((CCA.F_PROG_PAGO < CCA.F_PAGO '+
            '                           AND CCA.SIT_CAPITAL <> ' + #39 + 'CA' + #39 + ' '+
            '                           AND   CCA.F_PAGO > TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')) '+
            '                            OR   CCA.SIT_CAPITAL = ' + #39 + 'IM' + #39 + ') '+
            '                       ) CCA, '+
            '                       (SELECT FG_I.ID_CREDITO, FG_I.ID_PERIODO, '+
            '                               (NVL(FG_I.IMP_CONCEPTO,0) - NVL(FG_D.IMP_CONCEPTO,0)) AS IMP_CONCEPTO '+
            '                          FROM (SELECT CC.ID_CREDITO, CT.ID_PERIODO, '+
            '                                       SUM(CDT.IMP_CONCEPTO) AS IMP_CONCEPTO '+
            '                                  FROM (SELECT * '+
            '                                          FROM CR_TRANSACCION '+
            '                                         WHERE SIT_TRANSACCION = ' + #39 + 'AC' + #39 + ' '+
            '                                           AND ID_TRANS_CANCELA IS NULL '+
            '                                           AND F_VALOR <= TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ') '+
            '                                        ) CT, '+
            '                                        (SELECT * FROM CR_DET_TRANSAC '+
            '                                          WHERE CVE_CONCEPTO = ' + #39 + 'IMPBRU' + #39 + ') CDT, '+
            '                                        CONTRATO CTTO,CR_CONTRATO CTO,CR_CREDITO CC, '+
            '                                        CR_CVE_OPERACION CCO,CR_GA_SOL_FEGA CGSF '+
            '                                  WHERE CC.ID_CREDITO = CGSF.ID_CREDITO '+
            '                                    AND   CTTO.ID_CONTRATO = CC.ID_CONTRATO '+
            '                                    AND   CTO.ID_CONTRATO = CC.ID_CONTRATO '+
            '                                    AND   CTO.FOL_CONTRATO = CC.FOL_CONTRATO '+
            '                                    AND   CCO.CVE_PRODUCTO = CTO.CVE_PRODUCTO_CRE '+
            '                                    AND   CCO.CVE_MONEDA = CTTO.CVE_MONEDA '+
            '                                    AND   CCO.CVE_PARAMETRO = ' + #39 + 'PGCPGF' + #39 + ' '+
            '                                    AND   CT.ID_CREDITO = CGSF.ID_CREDITO '+
            '                                    AND   CT.CVE_OPERACION = CCO.CVE_OPERACION '+
            '                                    AND   CDT.ID_TRANSACCION = CT.ID_TRANSACCION '+
            '                                    AND   CDT.CVE_OPERACION = CT.CVE_OPERACION '+
            '                                  GROUP BY CC.ID_CREDITO, CT.ID_PERIODO) FG_I, '+
            '                                (SELECT CC.ID_CREDITO, CT.ID_PERIODO, '+
            '                                        SUM(CDT.IMP_CONCEPTO) AS IMP_CONCEPTO '+
            '                                   FROM (SELECT * '+
            '                                           FROM CR_TRANSACCION '+
            '                                          WHERE SIT_TRANSACCION = ' + #39 + 'AC' + #39 + ' '+
            '                                            AND ID_TRANS_CANCELA IS NULL '+
            '                                            AND F_VALOR <= TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ') '+
            '                                         ) CT, '+
            '                                         (SELECT * FROM CR_DET_TRANSAC '+
            '                                           WHERE CVE_CONCEPTO = ' + #39 + 'IMPBRU' + #39 + ') CDT, '+
            '                                         CONTRATO CTTO,CR_CONTRATO CTO,CR_CREDITO CC, '+
            '                                         CR_CVE_OPERACION CCO,CR_GA_SOL_FEGA CGSF '+
            '                                   WHERE CC.ID_CREDITO = CGSF.ID_CREDITO '+
            '                                     AND   CTTO.ID_CONTRATO = CC.ID_CONTRATO '+
            '                                     AND   CTO.ID_CONTRATO = CC.ID_CONTRATO '+
            '                                     AND   CTO.FOL_CONTRATO = CC.FOL_CONTRATO '+
            '                                     AND   CCO.CVE_PRODUCTO = CTO.CVE_PRODUCTO_CRE '+
            '                                     AND   CCO.CVE_MONEDA = CTTO.CVE_MONEDA '+
            '                                     AND   CCO.CVE_PARAMETRO = ' + #39 + 'RCGFCP' + #39 + ' '+
            '                                     AND   CT.ID_CREDITO = CGSF.ID_CREDITO '+
            '                                     AND   CT.CVE_OPERACION = CCO.CVE_OPERACION '+
            '                                     AND   CDT.ID_TRANSACCION = CT.ID_TRANSACCION '+
            '                                     AND   CDT.CVE_OPERACION = CT.CVE_OPERACION '+
            '                                   GROUP BY CC.ID_CREDITO, CT.ID_PERIODO '+
            '                                ) FG_D '+
            '                        WHERE FG_D.ID_CREDITO (+)= FG_I.ID_CREDITO '+
            '                          AND FG_D.ID_PERIODO (+)= FG_I.ID_PERIODO '+
            '                       ) FEGA '+
            '                 WHERE FEGA.ID_CREDITO (+)= CCA.ID_CREDITO '+
            '                   AND FEGA.ID_PERIODO (+)= CCA.NUM_PERIODO '+
            '                ) CCA '+
            '        UNION '+
            '         SELECT ' + #39 + 'C' + #39 + ' ORD_ACC ,CCI.ID_CREDITO,' + #39 + 'INTERES' + #39 + ' ACCESORIO,CCI.NUM_PERIODO, '+
            '                (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST - NVL(CCI.IMP_CONCEPTO,0)) IMP_BINTER '+
            '           FROM (SELECT CCI.*, NVL(FEGA.IMP_CONCEPTO,0) IMP_CONCEPTO, '+
            '                        NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ' + #39 + 'IN' + #39 + ', ' + #39 + 'IMPBRU' + #39 + ', '+
            '                        CCI.ID_CREDITO,  CCI.NUM_PERIODO, NULL, TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '), '+
            '                        ' + #39 + 'V' + #39 + ' ), 0 ) AS IMP_PAGADO_HIST '+
            '                   FROM (SELECT * FROM CR_INTERES CCI '+
            '                          WHERE 1 = 1 '+
            '                            AND CCI.F_VENCIMIENTO <= TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ') '+
            '                            AND ((CCI.F_PROG_PAGO < CCI.F_PAGO AND  CCI.SIT_INTERES <> ' + #39 + 'CA' + #39 + ' '+
            '                            AND  CCI.F_PAGO > TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')) '+
            '                             OR  (CCI.SIT_INTERES = ' + #39 + 'IM' + #39 + ' )) '+
            '                        ) CCI , '+
            '                        ( SELECT FG_I.ID_CREDITO, FG_I.ID_PERIODO, '+
            '                                 (NVL(FG_I.IMP_CONCEPTO,0) - NVL(FG_D.IMP_CONCEPTO,0)) AS IMP_CONCEPTO '+
            '                            FROM (SELECT CC.ID_CREDITO, CT.ID_PERIODO, '+
            '                                         SUM(CDT.IMP_CONCEPTO) AS IMP_CONCEPTO '+
            '                                    FROM (SELECT * FROM CR_TRANSACCION '+
            '                                           WHERE SIT_TRANSACCION = ' + #39 + 'AC' + #39 + ' '+
            '                                             AND ID_TRANS_CANCELA IS NULL '+
            '                                             AND F_VALOR <= TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ') '+
            '                                          ) CT, '+
            '                                         (SELECT * FROM CR_DET_TRANSAC '+
            '                                           WHERE CVE_CONCEPTO = ' + #39 + 'IMPBRU' + #39 + ' '+
            '                                         ) CDT, '+
            '                                         CONTRATO CTTO,CR_CONTRATO CTO,CR_CREDITO CC, '+
            '                                         CR_CVE_OPERACION CCO,CR_GA_SOL_FEGA CGSF '+
            '                                   WHERE CC.ID_CREDITO = CGSF.ID_CREDITO '+
            '                                     AND CTTO.ID_CONTRATO = CC.ID_CONTRATO '+
            '                                     AND CTO.ID_CONTRATO = CC.ID_CONTRATO '+
            '                                     AND CTO.FOL_CONTRATO = CC.FOL_CONTRATO '+
            '                                     AND CCO.CVE_PRODUCTO = CTO.CVE_PRODUCTO_CRE '+
            '                                     AND CCO.CVE_MONEDA = CTTO.CVE_MONEDA '+
            '                                     AND CCO.CVE_PARAMETRO = ' + #39 + 'PGINGF' + #39 + ' '+
            '                                     AND CT.ID_CREDITO = CGSF.ID_CREDITO '+
            '                                     AND CT.CVE_OPERACION = CCO.CVE_OPERACION '+
            '                                     AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION '+
            '                                     AND CDT.CVE_OPERACION = CT.CVE_OPERACION '+
            '                                   GROUP BY CC.ID_CREDITO, CT.ID_PERIODO '+
            '                                 ) FG_I, '+
            '                                 (SELECT CC.ID_CREDITO, CT.ID_PERIODO, SUM(CDT.IMP_CONCEPTO) AS IMP_CONCEPTO '+
            '                                    FROM (SELECT * FROM CR_TRANSACCION '+
            '                                           WHERE SIT_TRANSACCION = ' + #39 + 'AC' + #39 + ' '+
            '                                             AND ID_TRANS_CANCELA IS NULL '+
            '                                             AND F_VALOR <= TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')) CT, '+
            '                                         (SELECT * FROM CR_DET_TRANSAC '+
            '                                           WHERE CVE_CONCEPTO = ' + #39 + 'IMPBRU' + #39 + ') CDT, '+
            '                                         CONTRATO CTTO,CR_CONTRATO CTO,CR_CREDITO CC, '+
            '                                         CR_CVE_OPERACION CCO,CR_GA_SOL_FEGA CGSF '+
            '                                   WHERE CC.ID_CREDITO = CGSF.ID_CREDITO '+
            '                                     AND   CTTO.ID_CONTRATO = CC.ID_CONTRATO '+
            '                                     AND   CTO.ID_CONTRATO = CC.ID_CONTRATO '+
            '                                     AND   CTO.FOL_CONTRATO = CC.FOL_CONTRATO '+
            '                                     AND   CCO.CVE_PRODUCTO = CTO.CVE_PRODUCTO_CRE '+
            '                                     AND   CCO.CVE_MONEDA = CTTO.CVE_MONEDA '+
            '                                     AND   CCO.CVE_PARAMETRO = ' + #39 + 'RCGFIN' + #39 + ' '+
            '                                     AND   CT.ID_CREDITO = CGSF.ID_CREDITO '+
            '                                     AND   CT.CVE_OPERACION = CCO.CVE_OPERACION '+
            '                                     AND   CDT.ID_TRANSACCION = CT.ID_TRANSACCION '+
            '                                     AND   CDT.CVE_OPERACION = CT.CVE_OPERACION '+
            '                                   GROUP BY CC.ID_CREDITO, CT.ID_PERIODO '+
            '                                 ) FG_D '+
            '                           WHERE FG_D.ID_CREDITO (+)= FG_I.ID_CREDITO '+
            '                           AND   FG_D.ID_PERIODO (+)= FG_I.ID_PERIODO '+
            '                        )FEGA '+
            '                  WHERE FEGA.ID_CREDITO  (+)= CCI.ID_CREDITO '+
            '                    AND FEGA.ID_PERIODO  (+)= CCI.NUM_PERIODO '+
            '                ) CCI '+
            '        UNION '+
            '        SELECT ' + #39 + 'B' + #39 + ' ORD_ACC ,CFA.ID_CREDITO,' + #39 + 'REFINANCIAMIENTO' + #39 + ' ACCESORIO,CFA.NUM_PERIODO, '+
            '               (CFA.IMP_FINAN_ADIC - CFA.IMP_PAGADO_HIST - NVL(CFA.IMP_CONCEPTO,0)) IMP_BINTER '+
            '          FROM ( SELECT CFA.*, NVL(FEGA.IMP_CONCEPTO,0) IMP_CONCEPTO, '+
            '                        NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ' + #39 + 'FN' + #39 + ', ' + #39 + 'IMPBRU' + #39 + ', '+
            '                        CFA.ID_CREDITO,  CFA.NUM_PERIODO,   NULL,  TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '), '+
            '                        ' + #39 + 'V' + #39 + ' ), 0 ) AS IMP_PAGADO_HIST '+
            '                   FROM (SELECT * FROM CR_FINAN_ADIC  CFA '+
            '                          WHERE 1 = 1 '+
            '                            AND CFA.F_VENCIMIENTO <= TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ') '+
            '                            AND ((CFA.F_PROG_PAGO < CFA.F_PAGO '+
            '                            AND CFA.SIT_FINAN_ADIC <> ' + #39 + 'CA' + #39 + ' '+
            '                            AND  CFA.F_PAGO > TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')) '+
            '                             OR  (CFA.SIT_FINAN_ADIC = ' + #39 + 'IM' + #39 + ' )) '+
            '                        )  CFA, '+
            '                        (SELECT FG_I.ID_CREDITO, FG_I.ID_PERIODO, '+
            '                                (NVL(FG_I.IMP_CONCEPTO,0) - NVL(FG_D.IMP_CONCEPTO,0)) AS IMP_CONCEPTO '+
            '                           FROM (SELECT CC.ID_CREDITO, CT.ID_PERIODO, '+
            '                                        SUM(CDT.IMP_CONCEPTO) AS IMP_CONCEPTO '+
            '                                   FROM (SELECT * FROM CR_TRANSACCION '+
            '                                          WHERE SIT_TRANSACCION = ' + #39 + 'AC' + #39 + ' '+
            '                                            AND ID_TRANS_CANCELA IS NULL '+
            '                                            AND F_VALOR <= TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ') '+
            '                                        ) CT, '+
            '                                        (SELECT * FROM CR_DET_TRANSAC '+
            '                                          WHERE CVE_CONCEPTO = ' + #39 + 'IMPBRU' + #39 + ' '+
            '                                        ) CDT, '+
            '                                        CONTRATO CTTO,CR_CONTRATO CTO,CR_CREDITO CC, '+
            '                                        CR_CVE_OPERACION CCO,CR_GA_SOL_FEGA CGSF '+
            '                                  WHERE CC.ID_CREDITO = CGSF.ID_CREDITO '+
            '                                    AND CTTO.ID_CONTRATO = CC.ID_CONTRATO  '+
            '                                    AND CTO.ID_CONTRATO = CC.ID_CONTRATO '+
            '                                    AND CTO.FOL_CONTRATO = CC.FOL_CONTRATO '+
            '                                    AND CCO.CVE_PRODUCTO = CTO.CVE_PRODUCTO_CRE '+
            '                                    AND CCO.CVE_MONEDA = CTTO.CVE_MONEDA '+
            '                                    AND CCO.CVE_PARAMETRO = ' + #39 + 'PGFNGF' + #39 + ' '+
            '                                    AND CT.ID_CREDITO = CGSF.ID_CREDITO '+
            '                                    AND CT.CVE_OPERACION = CCO.CVE_OPERACION '+
            '                                    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION '+
            '                                    AND CDT.CVE_OPERACION = CT.CVE_OPERACION '+
            '                                  GROUP BY CC.ID_CREDITO, CT.ID_PERIODO '+
            '                                ) FG_I, '+
            '                                (SELECT CC.ID_CREDITO, CT.ID_PERIODO, '+
            '                                        SUM(CDT.IMP_CONCEPTO) AS IMP_CONCEPTO '+
            '                                   FROM (SELECT * FROM CR_TRANSACCION '+
            '                                          WHERE SIT_TRANSACCION = ' + #39 + 'AC' + #39 + ' '+
            '                                            AND ID_TRANS_CANCELA IS NULL '+
            '                                            AND F_VALOR <= TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')) CT, '+
            '                                        (SELECT * FROM CR_DET_TRANSAC '+
            '                                          WHERE CVE_CONCEPTO = ' + #39 + 'IMPBRU' + #39 + ') CDT, '+
            '                                        CONTRATO CTTO,CR_CONTRATO CTO,CR_CREDITO CC, '+
            '                                        CR_CVE_OPERACION CCO,CR_GA_SOL_FEGA CGSF '+
            '                                  WHERE CC.ID_CREDITO = CGSF.ID_CREDITO '+
            '                                    AND   CTTO.ID_CONTRATO = CC.ID_CONTRATO '+
            '                                    AND   CTO.ID_CONTRATO = CC.ID_CONTRATO '+
            '                                    AND   CTO.FOL_CONTRATO = CC.FOL_CONTRATO '+
            '                                    AND   CCO.CVE_PRODUCTO = CTO.CVE_PRODUCTO_CRE '+
            '                                    AND   CCO.CVE_MONEDA = CTTO.CVE_MONEDA '+
            '                                    AND   CCO.CVE_PARAMETRO = ' + #39 + 'RCGFFN' + #39 + ' '+
            '                                    AND   CT.ID_CREDITO = CGSF.ID_CREDITO '+
            '                                    AND   CT.CVE_OPERACION = CCO.CVE_OPERACION '+
            '                                    AND   CDT.ID_TRANSACCION = CT.ID_TRANSACCION '+
            '                                    AND   CDT.CVE_OPERACION = CT.CVE_OPERACION '+
            '                                  GROUP BY CC.ID_CREDITO, CT.ID_PERIODO '+
            '                                ) FG_D '+
            '                          WHERE FG_D.ID_CREDITO (+)= FG_I.ID_CREDITO '+
            '                            AND FG_D.ID_PERIODO (+)= FG_I.ID_PERIODO '+
            '                        ) FEGA '+
            '                  WHERE FEGA.ID_CREDITO  (+)= CFA.ID_CREDITO '+
            '                    AND FEGA.ID_PERIODO (+)= CFA.NUM_PERIODO '+
            '               )CFA '+
            '        UNION '+
            '        SELECT ' + #39 + 'D' + #39 + ' ORD_ACC ,CCC.ID_CREDITO,CCC.DESC_COMISION,CCC.NUM_PERIODO, '+
            '               (CCC.IMP_COMISION - CCC.IMP_PAGADO_HIST - NVL(CCC.IMP_CONCEPTO,0)) IMP_BINTER '+
            '          FROM (SELECT CCC.*, NVL(FEGA.IMP_CONCEPTO,0) IMP_CONCEPTO, '+
            '                       CCCO.DESC_COMISION, '+
            '                       NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ' + #39 + 'CN' + #39 + ', ' + #39 + 'IMPBRU' + #39 + ', '+
            '                       CCC.ID_CREDITO,  CCC.NUM_PERIODO, CCC.CVE_COMISION,TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '), '+
            '                       ' + #39 + 'V' + #39 + ' ), 0 ) AS IMP_PAGADO_HIST '+
            '                  FROM (SELECT * FROM CR_COMISION CCC '+
            '                         WHERE 1 = 1 '+
            '                           AND CCC.F_VENCIMIENTO <= TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ') '+
            '                           AND ((CCC.F_PROG_PAGO < CCC.F_PAGO AND CCC.SIT_COMISION <> ' + #39 + 'CA' + #39 + ' '+
            '                           AND CCC.F_PAGO > TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')) '+
            '                            OR (CCC.SIT_COMISION = ' + #39 + 'IM' + #39 + ' )) '+
            '                       ) CCC, CR_CAT_COMISION CCCO , '+
            '                       ( SELECT FG_I.ID_CREDITO, FG_I.ID_PERIODO, '+
            '                                (NVL(FG_I.IMP_CONCEPTO,0) - NVL(FG_D.IMP_CONCEPTO,0)) AS IMP_CONCEPTO '+
            '                           FROM (SELECT CC.ID_CREDITO, CT.ID_PERIODO, '+
            '                                        SUM(CDT.IMP_CONCEPTO) AS IMP_CONCEPTO '+
            '                                   FROM (SELECT * FROM CR_TRANSACCION '+
            '                                          WHERE SIT_TRANSACCION = ' + #39 + 'AC' + #39 + ' '+
            '                                            AND ID_TRANS_CANCELA IS NULL '+
            '                                            AND F_VALOR <= TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')) CT, '+
            '                                        (SELECT * FROM CR_DET_TRANSAC '+
            '                                          WHERE CVE_CONCEPTO = ' + #39 + 'IMPBRU' + #39 + ') CDT, '+
            '                                        CONTRATO CTTO,CR_CONTRATO CTO,CR_CREDITO CC, '+
            '                                        CR_CVE_OPERACION CCO,CR_GA_SOL_FEGA CGSF '+
            '                                  WHERE CC.ID_CREDITO = CGSF.ID_CREDITO '+
            '                                    AND   CTTO.ID_CONTRATO = CC.ID_CONTRATO '+
            '                                    AND   CTO.ID_CONTRATO = CC.ID_CONTRATO '+
            '                                    AND   CTO.FOL_CONTRATO = CC.FOL_CONTRATO '+
            '                                    AND   CCO.CVE_PRODUCTO = CTO.CVE_PRODUCTO_CRE '+
            '                                    AND   CCO.CVE_MONEDA = CTTO.CVE_MONEDA '+
            '                                    AND   CCO.CVE_PARAMETRO = ' + #39 + 'PGCNGF' + #39 + ' '+
            '                                    AND   CT.ID_CREDITO = CGSF.ID_CREDITO '+
            '                                    AND   CT.CVE_OPERACION = CCO.CVE_OPERACION '+
            '                                    AND   CDT.ID_TRANSACCION = CT.ID_TRANSACCION '+
            '                                    AND   CDT.CVE_OPERACION = CT.CVE_OPERACION '+
            '                                  GROUP BY CC.ID_CREDITO, CT.ID_PERIODO) FG_I, '+
            '                                (SELECT CC.ID_CREDITO, CT.ID_PERIODO, SUM(CDT.IMP_CONCEPTO) AS IMP_CONCEPTO '+
            '                                   FROM (SELECT * FROM CR_TRANSACCION '+
            '                                          WHERE SIT_TRANSACCION = ' + #39 + 'AC' + #39 + ' '+
            '                                            AND ID_TRANS_CANCELA IS NULL '+
            '                                            AND F_VALOR <= TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')) CT, '+
            '                                        (SELECT * FROM CR_DET_TRANSAC '+
            '                                          WHERE CVE_CONCEPTO = ' + #39 + 'IMPBRU' + #39 + ') CDT, '+
            '                                        CONTRATO CTTO,CR_CONTRATO CTO,CR_CREDITO CC, '+
            '                                        CR_CVE_OPERACION CCO,CR_GA_SOL_FEGA CGSF '+
            '                                  WHERE CC.ID_CREDITO = CGSF.ID_CREDITO '+
            '                                    AND   CTTO.ID_CONTRATO = CC.ID_CONTRATO '+
            '                                    AND   CTO.ID_CONTRATO = CC.ID_CONTRATO '+
            '                                    AND   CTO.FOL_CONTRATO = CC.FOL_CONTRATO '+
            '                                    AND   CCO.CVE_PRODUCTO = CTO.CVE_PRODUCTO_CRE '+
            '                                    AND   CCO.CVE_MONEDA = CTTO.CVE_MONEDA '+
            '                                    AND   CCO.CVE_PARAMETRO = ' + #39 + 'RCGFCN' + #39 + ' '+
            '                                    AND   CT.ID_CREDITO = CGSF.ID_CREDITO '+
            '                                    AND   CT.CVE_OPERACION = CCO.CVE_OPERACION '+
            '                                    AND   CDT.ID_TRANSACCION = CT.ID_TRANSACCION '+
            '                                    AND   CDT.CVE_OPERACION = CT.CVE_OPERACION '+
            '                                  GROUP BY CC.ID_CREDITO, CT.ID_PERIODO) FG_D '+
            '                          WHERE FG_D.ID_CREDITO (+)= FG_I.ID_CREDITO '+
            '                            AND   FG_D.ID_PERIODO (+)= FG_I.ID_PERIODO '+
            '                       ) FEGA '+
            '                 WHERE CCCO.CVE_COMISION = CCC.CVE_COMISION '+
            '                   AND FEGA.ID_CREDITO  (+)= CCC.ID_CREDITO '+
            '                   AND FEGA.ID_PERIODO (+)= CCC.NUM_PERIODO '+
            '               ) CCC '+
            '        ) ACCE, '+
            '        CR_CREDITO        CC, '+
            '        (SELECT * FROM CONTRATO '+
            '          WHERE ID_CONTRATO IN (SELECT ID_CONTRATO FROM CR_CREDITO) '+
            '        ) CTO, '+
            '        MONEDA            M, '+
            '        PERSONA           PPR, '+
            '        PERSONA           PPRC, '+
            '        CR_CONTRATO       CCTO, '+
            '        CR_PRODUCTO       CPR, '+
            '        PERSONA_FISICA    PTIT, '+
            '        PERSONA           PCE, '+
            '         (SELECT CP.CVE_PRODUCTO_CRE, CUENTA_VIGENTE_INT, '+
            '                 NVL(CtaAgrK.CUENTA_VIGENTE,CtaDDK.CUENTA_VIGENTE ) CUENTA_VIGENTE_K '+
            '            FROM cr_producto CP, '+
            '                 (SELECT ' + #39 + 'IN' + #39 + ' AS CVE_CONCEPTO, '+
            '                         CP.CVE_PRODUCTO_CRE, '+
            '                         SUBSTR(GC.CUENTA_CONTABLE,1,4) || ' + #39 + '-' + #39 + ' || '+
            '                         SUBSTR(GC.CUENTA_CONTABLE,5,4) || ' + #39 + '-' + #39 + ' || '+
            '                         SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VIGENTE_INT '+
            '                    FROM CR_PRODUCTO CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC '+// GUIA_CONTABLE@SICA GC '+ CAMBIO POR BAJA DE BASE SICA JFOF 03/08/2012 JFOF
            '                   WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE '+
            '                     AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO '+
            '                     AND GC.EMPRESA = ' + #39 + 'BCO2' + #39 + ' '+
            '                     AND GC.CODIGO_TRANSACCION IN (306000, 306710) '+
            '                     AND GC.CAMPO_IMPORTE IN (' + #39 + '03' + #39 + ',' + #39 + '06' + #39 + ') '+
            '                     AND GC.CLAVE_MONEDA = ' + #39 + 'PESOS' + #39 + ' '+
            '                     AND (GC.CUENTA_CONTABLE LIKE ' + #39 + '13%' + #39 + ' '+
            '                      OR GC.CUENTA_CONTABLE LIKE ' + #39 + '26%' + #39 + ') '+
            '                  ) CtaInt, '+
            '                  (SELECT ' + #39 + 'KA' + #39 + ' AS CVE_CONCEPTO, '+
            '                          CP.CVE_PRODUCTO_CRE, '+
            '                          SUBSTR(GC.CUENTA_CONTABLE,1,4) || ' + #39 + '-' + #39 + ' || '+
            '                          SUBSTR(GC.CUENTA_CONTABLE,5,4) || ' + #39 + '-' + #39 + ' || '+
            '                          SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VIGENTE '+
            '                     FROM CR_PRODUCTO CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC '+// GUIA_CONTABLE@SICA GC '+ CAMBIO POR BAJA DE BASE SICA JFOF 03/08/2012 JFOF
            '                    WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE '+
            '                      AND CCP.CVE_PRODUCTO_CR NOT LIKE ' + #39 + '%FAC' + #39 + ' '+
            '                      AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO '+
            '                      AND GC.EMPRESA = ' + #39 + 'BCO2' + #39 + ' '+
            '                      AND GC.CODIGO_TRANSACCION IN (300000) '+
            '                      AND GC.CLAVE_MONEDA = ' + #39 + 'PESOS' + #39 + ' '+
            '                      AND GC.CAMPO_IMPORTE = ' + #39 + '02' + #39 + ' '+
            '                      AND (GC.CUENTA_CONTABLE LIKE ' + #39 + '13%' + #39 + ') '+
            '                  ) CtaAgrK, '+
            '                  (SELECT ' + #39 + 'KA' + #39 + ' AS CVE_CONCEPTO, '+
            '                          CCP.CVE_PRODUCTO_CR, '+
            '                          CTA_CONTABLE || ' + #39 + '-' + #39 + ' || '+
            '                          SUBSTR(SUB_CTA_CONTABLE,1,4) || ' + #39 + '-' + #39 + ' || '+
            '                          SUBSTR(SUB_CTA_CONTABLE,5,2) AS CUENTA_VIGENTE '+
            '                     FROM CR_CONT_PRODUCTO  CCP '+
            '                    WHERE CVE_PRODUCTO_CR LIKE ' + #39 + '%FAC' + #39 + ' '+
            '                  ) CtaDDK '+
            '            WHERE CtaInt.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE '+
            '              AND CtaAgrK.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE '+
            '              AND CtaDDK.CVE_PRODUCTO_CR (+)= cp.CVE_PRODUCTO_CRE '+
            '         )TABCTA '+
            '   WHERE CC.ID_CREDITO         = ACCE.ID_CREDITO '+
            '     AND CCTO.ID_CONTRATO      = CC.ID_CONTRATO '+
            '     AND CCTO.FOL_CONTRATO     = CC.FOL_CONTRATO '+
            '     AND CTO.ID_CONTRATO       = CC.ID_CONTRATO '+
            '     AND M.CVE_MONEDA          = CTO.CVE_MONEDA '+
            '     AND PPR.ID_PERSONA        = CC.ID_PROM_ADM '+
            '     AND PPRC.ID_PERSONA       = CTO.ID_PERS_ASOCIAD '+
            '     AND CPR.CVE_PRODUCTO_CRE  = CCTO.CVE_PRODUCTO_CRE '+
            '     AND PTIT.ID_PERSONA    (+)= CTO.ID_TITULAR '+
            '     AND PCE.ID_PERSONA     (+)= CTO.ID_TITULAR '+
            '     AND TABCTA.CVE_PRODUCTO_CRE (+)= CPR.CVE_PRODUCTO_CRE '+
            '     AND CC.F_TRASPASO_VENC IS NULL '+
            '     AND CPR.ID_EMPRESA =2 '+
            ' GROUP BY '+
            '        CTO.ID_TITULAR            , '+
            '        DECODE(PCE.CVE_PER_JURIDICA,' + #39 + 'PM' + #39 + ',PCE.NOMBRE,PTIT.APELLIDO_PATERNO||' + #39 + ' ' + #39 + '||PTIT.APELLIDO_MATERNO||' + #39 + ' ' + #39 + '||PTIT.NOMBRE_PERSONA), '+
            '        M.DESC_MONEDA             , '+
            '        CPR.CVE_PRODUCTO_CRE      , '+
            '        CTO.ID_PERS_ASOCIAD       , '+
            '        CC.ID_PROM_ADM            , '+
            '        PPRC.NOMBRE               , '+
            '        PPR.NOMBRE                , '+
            '        ACCESORIO                 , '+
            '        DECODE(ORD_ACC,' + #39 + 'A' + #39 + ', CUENTA_VIGENTE_INT,' + #39 + 'C' + #39 + ' ,CUENTA_VIGENTE_K,CUENTA_VIGENTE_INT) '+
            ' UNION ALL '+
            ' SELECT  ' + #39 + 'ICRE_RECPREM' + #39 + '            AS FUENTE, '+
            '         P.ID_PERSONA              AS ID_PERSONA, '+
            '         P.NOMBRE                  AS NOMBRE, '+
            '         M.DESC_MONEDA             AS DESC_MONEDA, '+
            '         CP.CVE_PRODUCTO_CRE       AS CVE_PRODUCTO, '+
            '         CTO.ID_PERS_ASOCIAD       AS ID_PERS_ASOCIAD, '+
            '         CR.ID_PROM_ADM            AS ID_PROM_ADM, '+
            '         P_PROM_ASO.NOMBRE         AS NOM_PROM_ASO, '+
            '         P_PROM_ADM.NOMBRE         AS NOM_PROM_ADM, '+
            '         ' + #39 + 'INTERESES POR DEVENGAR' + #39 + '  AS CONCEPTO, '+
            '         TABCTA.CUENTA_VIGENTE_INT AS CUENTA_CONTABLE, '+
            '         SUM(CPD.IMP_PRE_DEVENGAR) AS IMP_X_DEVENGAR '+
            ' FROM    PERSONA P,              CONTRATO CTO, '+
            '         PERSONA P_PROM_ASO,     PERSONA P_PROM_ADM, '+
            '         PERSONA_FISICA PF,      MONEDA M, '+
            '         CR_CONTRATO CCTO,       CR_PRODUCTO CP, '+
            '         CR_CREDITO CR,          CRE_PROV_DIARIA CPD, '+
            '         CR_CESION CS, '+
            '         (SELECT CP.CVE_PRODUCTO_CRE, CUENTA_VIGENTE_INT,NVL(CtaAgrK.CUENTA_VIGENTE,CtaDDK.CUENTA_VIGENTE ) CUENTA_VIGENTE_K '+
            '          FROM cr_producto CP, '+
            '              (SELECT ' + #39 + 'IN' + #39 + ' AS CVE_CONCEPTO,CP.CVE_PRODUCTO_CRE, '+
            '                      SUBSTR(GC.CUENTA_CONTABLE,1,4) || ' + #39 + '-' + #39 + ' || '+
            '                      SUBSTR(GC.CUENTA_CONTABLE,5,4) || ' + #39 + '-' + #39 + ' || '+
            '                      SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VIGENTE_INT '+
            '               FROM CR_PRODUCTO CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC '+// GUIA_CONTABLE@SICA GC '+ CAMBIO POR BAJA DE BASE SICA JFOF 03/08/2012 JFOF
            '               WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE '+
            '               AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO '+
            '               AND GC.EMPRESA = ' + #39 + 'BCO2' + #39 + ' '+
            '               AND GC.CODIGO_TRANSACCION IN (306000, 306710) '+
            '               AND GC.CAMPO_IMPORTE IN (' + #39 + '03' + #39 + ',' + #39 + '06' + #39 + ') '+
            '               AND GC.CLAVE_MONEDA = ' + #39 + 'PESOS' + #39 + ' '+
            '               AND (GC.CUENTA_CONTABLE LIKE ' + #39 + '13%' + #39 + '  OR GC.CUENTA_CONTABLE LIKE ' + #39 + '26%' + #39 + ')) CtaInt, '+
            '              (SELECT ' + #39 + 'KA' + #39 + ' AS CVE_CONCEPTO,CP.CVE_PRODUCTO_CRE, '+
            '                      SUBSTR(GC.CUENTA_CONTABLE,1,4) || ' + #39 + '-' + #39 + ' || '+
            '                      SUBSTR(GC.CUENTA_CONTABLE,5,4) || ' + #39 + '-' + #39 + ' || '+
            '                      SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VIGENTE '+
            '               FROM CR_PRODUCTO CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC '+// GUIA_CONTABLE@SICA GC '+ CAMBIO POR BAJA DE BASE SICA JFOF 03/08/2012 JFOF
            '               WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE '+
            '               AND CCP.CVE_PRODUCTO_CR NOT LIKE ' + #39 + '%FAC' + #39 + ' '+
            '               AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO '+
            '               AND GC.EMPRESA =' + #39 + 'BCO2' + #39 + ' '+
            '               AND GC.CODIGO_TRANSACCION IN (300000) '+
            '               AND GC.CLAVE_MONEDA = ' + #39 + 'PESOS' + #39 + ' '+
            '               AND GC.CAMPO_IMPORTE = ' + #39 + '02' + #39 + ' '+
            '               AND (GC.CUENTA_CONTABLE LIKE ' + #39 + '13%' + #39 + ')) CtaAgrK, '+
            '              (SELECT ' + #39 + 'KA' + #39 + ' AS CVE_CONCEPTO,CCP.CVE_PRODUCTO_CR, '+
            '                      CTA_CONTABLE || ' + #39 + '-' + #39 + ' || '+
            '                      SUBSTR(SUB_CTA_CONTABLE,1,4) || ' + #39 + '-' + #39 + ' || '+
            '                      SUBSTR(SUB_CTA_CONTABLE,5,2) AS CUENTA_VIGENTE '+
            '               FROM CR_CONT_PRODUCTO  CCP '+
            '               WHERE CVE_PRODUCTO_CR LIKE ' + #39 + '%FAC' + #39 + ') CtaDDK '+
            '          WHERE CtaInt.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE '+
            '          AND CtaAgrK.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE '+
            '          AND CtaDDK.CVE_PRODUCTO_CR (+)= cp.CVE_PRODUCTO_CRE '+
            '         )TABCTA '+
            ' WHERE  P.ID_PERSONA = CTO.ID_TITULAR '+
            '   AND  P.ID_PERSONA = PF.ID_PERSONA (+) '+
            '   AND  CTO.CVE_MONEDA = M.CVE_MONEDA '+
            '   AND  CTO.ID_CONTRATO = CCTO.ID_CONTRATO '+
            '   AND  CP.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE '+
            '   AND  TABCTA.CVE_PRODUCTO_CRE (+)= CCTO.CVE_PRODUCTO_CRE '+
            '   AND  CCTO.ID_CONTRATO = CR.ID_CONTRATO '+
            '   AND  CCTO.FOL_CONTRATO = CR.FOL_CONTRATO '+
            '   AND  CR.ID_CREDITO = CS.ID_CESION '+
            '   AND  CS.CVE_TIPO_INTERES = ' + #39 + 'IN' + #39 + ' '+
            '   AND  CPD.ID_CREDITO = CR.ID_CREDITO '+
            '   AND  CPD.F_PROVISION = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',VLFecha) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ') '+
            '   AND  CP.ID_EMPRESA = 2 '+
            '   AND  P_PROM_ASO.ID_PERSONA = CTO.ID_PERS_ASOCIAD '+
            '   AND  P_PROM_ADM.ID_PERSONA = CR.ID_PROM_ADM '+
            ' GROUP BY '+
            '   P.ID_PERSONA, '+
            '   P.NOMBRE, '+
            '   M.DESC_MONEDA, '+
            '   CP.CVE_PRODUCTO_CRE, '+
            '   CTO.ID_PERS_ASOCIAD, '+
            '   CR.ID_PROM_ADM, '+
            '   P_PROM_ASO.NOMBRE, '+
            '   P_PROM_ADM.NOMBRE, '+
            '   TABCTA.CUENTA_VIGENTE_INT '+
            ' UNION ALL '+
            ' SELECT  ' + #39 + 'INTERCRED_REP_CV' + #39 + '        AS FUENTE, '+
            '         REG.ID_TITULAR            AS ID_PERSONA, '+
            '         REG.NBR                   AS NOMBRE, '+
            '         REG.DESC_MONEDA           AS DESC_MONEDA, '+
            '         TO_CHAR(REG.CVE_SUB_TIP_BCO)       AS CVE_PRODUCTO, '+
            '         REG.ID_PERS_ASOCIAD       AS ID_PERS_ASOCIAD, '+
            '         REG.ID_PROM_ADM           AS ID_PROM_ADM, '+
            '         REG.NOMBRE_PROMOTOR       AS NOM_PROM_ASO, '+
            '         REG.NOM_ADM               AS NOM_PROM_ADM, '+
            '         INTER.CONCEPTO            AS CONCEPTO, '+
            '         MAX(DECODE(INTER.CONCEPTO,' + #39 + 'INTERESES' + #39 + ',REG.cta_interes,' + #39 + 'CAPITAL' + #39 + ',REG.CTA_CONTABLE)) AS CUENTA_CONTABLE, '+
            '         SUM(INTER.MONTO)          AS IMPORTE '+
            '   FROM '+
            ' ( '+
            ' Select ctto.id_titular, '+
            '        LTRIM(pf.apellido_paterno || ' + #39 + ' ' + #39 + ' || pf.apellido_materno || ' + #39 + ' ' + #39 + '|| pf.nombre_persona) ||  pm.nom_razon_social NBR, '+
            '        c.id_credito, c.id_contrato id_linea, l.cve_cat_min, cm.desc_cat_min, '+
            '        ctto.id_cto_liq, m.desc_moneda, s.desc_sub_tipo, p.nombre, prom.nombre nombre_promotor, '+
            '        DECODE(c.f_traspaso_venc, NULL, ' + #39 + 'CARTERA VIGENTE' + #39 + ', ' + #39 + 'CARTERA VENCIDA TRASPASADA' + #39 + ')TIPO_CARTERA, '+
            '        DECODE(c.b_aplica_iva, ' + #39 + 'V' + #39 + ',' + #39 + 'Aplica IVA' + #39 + ',' + #39 + 'No aplica IVA' + #39 + ') b_aplica_iva, '+
            '        l.cve_sub_tip_bco, ctto.id_pers_asociad, c.id_prom_adm, padm.nombre nom_adm, '+
            '        cre_sub_tip_cnbv.cta_contable, cre_sub_tip_cnbv.cta_interes '+
            '   from cre_credito c, contrato ctto, persona p, persona prom, cre_contrato l, '+
            '        cre_sub_tip_bco s, moneda m, cre_cat_minimo cm, persona_fisica pf, '+
            '        persona_moral pm, persona padm, cre_sub_tip_cnbv '+
            '  where c.id_contrato      = ctto.id_contrato '+
            '    and ctto.id_titular    = p.id_persona '+
            '    and prom.id_persona    = ctto.id_pers_asociad '+
            '    and l.cve_cat_min      = cm.cve_cat_min(+) '+
            '    and l.id_contrato      = c.id_contrato '+
            '    and l.cve_sub_tip_bco  = s.cve_sub_tip_bco '+
            '    and ctto.cve_moneda    = m.cve_moneda '+
            '    and c.sit_credito      = ' + #39 + 'AC' + #39 + ' '+
            '    and pf.id_persona (+)  = p.id_persona '+
            '    and c.imp_comision_vdo + c.imp_capital_vdo + '+
            '        c.imp_interes_vdo  + imp_iva_com_vdo   +  c.imp_iva_int_vdo  > 0 '+
            '    and s.cve_sub_cartera in (' + #39 + 'COMERC' + #39 + ',' + #39 + 'BANCO' + #39 + ',' + #39 + 'GFI' + #39 + ',' + #39 + 'CREGEN' + #39 + ',' + #39 + 'EXTERN' + #39 + ') '+
            '    and pm.id_persona (+)  = p.id_persona '+
            '    and padm.id_persona (+)  = c.id_prom_adm '+
            '    and s.CVE_SUB_TIP_CNBV = CRE_SUB_TIP_CNBV.CVE_SUB_TIP_CNBV '+
            '  order by tipo_cartera, m.desc_moneda, s.desc_sub_tipo, nbr, c.id_credito '+
            ' )REG, '+
            ' ( '+
            ' SELECT CRE_CAPITAL.ID_CREDITO ,' + #39 + 'CAPITAL' + #39 + ' CONCEPTO, '+
            '        SUM(CRE_CAPITAL.IMP_VENCIDO - CRE_CAPITAL.IMP_BENEF_GOB) MONTO '+
            '   FROM ADMIPROD.CRE_CAPITAL CRE_CAPITAL, ADMIPROD.CRE_CREDITO CRE_CREDITO, '+
            '        ADMIPROD.CONTRATO CONTRATO '+
            '  WHERE ( CRE_CAPITAL.SIT_CAPITAL = ' + #39 + 'IM' + #39 + ' ) '+
            '    AND ( CRE_CAPITAL.IMP_VENCIDO > 0 ) '+
            '    AND ( CRE_CREDITO.ID_CREDITO = CRE_CAPITAL.ID_CREDITO ) '+
            '    AND ( CRE_CREDITO.ID_CONTRATO = CONTRATO.ID_CONTRATO) '+
            '  GROUP BY CRE_CAPITAL.ID_CREDITO '+
            ' UNION '+
            ' SELECT CRE_INTERES.ID_CREDITO , ' + #39 + 'INTERESES' + #39 + ' CONCEPTO, '+
            '        SUM(CRE_INTERES.IMP_VENCIDO - CRE_INTERES.IMP_BENEF_GOB) MONTO '+
            '   FROM ADMIPROD.CRE_INTERES CRE_INTERES, ADMIPROD.CRE_CREDITO CRE_CREDITO, '+
            '        ADMIPROD.CONTRATO CONTRATO '+
            '  WHERE ( CRE_INTERES.SIT_INTERES = ' + #39 + 'IM' + #39 + ' ) '+
            '    AND ( CRE_INTERES.IMP_VENCIDO > 0 ) '+
            '    AND ( CRE_CREDITO.ID_CREDITO = CRE_INTERES.ID_CREDITO ) '+
            '    AND ( CRE_CREDITO.ID_CONTRATO = CONTRATO.ID_CONTRATO) '+
            '  GROUP BY CRE_INTERES.ID_CREDITO '+
            ' )INTER '+
            '  WHERE INTER.ID_CREDITO = REG.ID_CREDITO '+
            '  GROUP BY REG.ID_TITULAR, REG.NBR, REG.DESC_MONEDA, REG.CVE_SUB_TIP_BCO, '+
            '        REG.ID_PERS_ASOCIAD, REG.ID_PROM_ADM, REG.NOMBRE_PROMOTOR, '+
            '        REG.NOM_ADM, INTER.CONCEPTO, '+
            '        DECODE(INTER.CONCEPTO,' + #39 + 'INTERESES' + #39 + ',REG.cta_interes,' + #39 + 'CAPITAL' + #39 + ',REG.CTA_CONTABLE) ';

   VLSalida := False;
   Try
      sArchivo := edNbrArch.Text;
      If Trim(sArchivo)<>'' Then
      begin
          AssignFile(F, sArchivo);
          Rewrite(F);

          Q :=  GetSQLQuery(VLSQL,Objeto.DataBaseName,Objeto.SessionName,True);
          try
             if Q <> nil then
             begin
                  while Not(Q.Eof) do
                  begin
                       Writeln(F, Q.FieldByName('FUENTE').AsString + #09 +
                                  Q.FieldByName('ID_PERSONA').AsString + #09 +
                                  Q.FieldByName('NOMBRE').AsString + #09 +
                                  Q.FieldByName('DESC_MONEDA').AsString + #09 +
                                  Q.FieldByName('CVE_PRODUCTO').AsString + #09 +
                                  Q.FieldByName('ID_PERS_ASOCIAD').AsString + #09 +
                                  Q.FieldByName('ID_PROM_ADM').AsString + #09 +
                                  Q.FieldByName('NOM_PROM_ASO').AsString + #09 +
                                  Q.FieldByName('NOM_PROM_ADM').AsString + #09 +
                                  Q.FieldByName('CONCEPTO').AsString + #09 +
                                  Q.FieldByName('CUENTA_CONTABLE').AsString + #09 +
                                  Q.FieldByName('IMPORTE').AsString + #09
                                   );
                       Q.Next;
                  end;
             end;
          finally
                if Q <> nil then Q.free;
          end;
      end;
      VLSalida := True;
   Finally
      If Trim(sArchivo)<>'' Then
      begin
           CloseFile(F);
      End;
   end;
   GenArchIntegra := VLSalida;
end;
{/ROIM}


procedure TWMQrCoin.FormShow(Sender: TObject);
begin
    lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
    lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

    cbAnio.Text := FormatDateTime('yyyy',Objeto.Apli.DameFechaEmpresa);
    cbMes.Text := Objeto.DameMes(StrToInt(FormatDateTime('mm',Objeto.Apli.DameFechaEmpresa)));
end;

procedure TWMQrCoin.FormDestroy(Sender: TObject);
begin
     //Objeto
end;

procedure TWMQrCoin.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMQrCoin.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWMQrCoin.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWMQrCoin.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWMQrCoin.InterForma1Preview(Sender: TObject);
var VlTCartera : String;
    VLCorteMon : Boolean;
begin
     if rgTipoCartera.ItemIndex = 0 then
        VlTCartera := 'BA'
     else if rgTipoCartera.ItemIndex = 1 then
        VlTCartera := 'NB'
     else if rgTipoCartera.ItemIndex = 1 then
        VlTCartera := 'XX';
     //end if;

     VLCorteMon := rgGrupoMon.ItemIndex =0;

     if rgTipoReporte.ItemIndex = 0 then
        RepCarteraVigente(Objeto.DameNoMes(cbMes.Text),StrToInt(cbAnio.Text),cbMes.Text,Objeto.Apli,VlTCartera,VLCorteMon,True,cbDetalle.checked)

{ROIM 27/09/2007   Se eliminan estas opciones ya que no se utilizan por promoción
Opciones que se quitarón del ChekList
ABC
Relación Promotor Asociado - Administrador - Acreditado
Relación Promotor Bono - Administrador - Acreditado
Relación Promotor Bono - Administrador
Relación Características de la Cartera
}
//     else if rgTipoReporte.ItemIndex = 1 then
//        RepCarteraVigenteABC(Objeto.DameNoMes(cbMes.Text),StrToInt(cbAnio.Text),cbMes.Text,Objeto.Apli,VlTCartera,VLCorteMon,True)
//     else if rgTipoReporte.ItemIndex = 2 then
//        RepCarteraVigenteProm(Objeto.DameNoMes(cbMes.Text),StrToInt(cbAnio.Text),cbMes.Text,'AS',Objeto.Apli,VlTCartera,VLCorteMon,True)
//     else if rgTipoReporte.ItemIndex = 3 then
//        RepCarteraVigenteProm(Objeto.DameNoMes(cbMes.Text),StrToInt(cbAnio.Text),cbMes.Text,'BO',Objeto.Apli,VlTCartera,VLCorteMon,True)
{/ROIM}
     {ROIM 21/03/2007 GENERA CONSULTAS A EXCEL "FONDEO"}
     else if rgTipoReporte.ItemIndex = 1 then
     begin
          If Trim(edNbrArch.Text)<>'' Then
          begin
             If GenArchFondeo Then
               ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
             Else
               ShowMessage('No se generó el Archivo')
          end
          else
                ShowMessage('Para este tipo de consulta debe indicar el nombre del archivo');
          //end if
     end
     {/ROIM}
     {ROIM 21/03/2007 GENERA CONSULTAS A EXCEL "INTEGRACIÓN CARTERA"}
     else if rgTipoReporte.ItemIndex = 2 then
     begin
          If Trim(edNbrArch.Text)<>'' Then Begin
             If GenArchIntegra Then
               ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
             Else
               ShowMessage('No se generó el Archivo')
          End
          else
                ShowMessage('Para este tipo de consulta debe indicar el nombre del archivo');
          //end if
     end
     {/ROIM}
     {ROIM 23/10/2007 SOLICITA ÁREA USUARIA}
     else if rgTipoReporte.ItemIndex = 3 then
     begin
          RepCarteraRie(Objeto.DameNoMes(cbMes.Text),StrToInt(cbAnio.Text),cbMes.Text,Objeto.Apli,VlTCartera,VLCorteMon,True,cbDetalle.checked);
     end;
     {/ROIM}
end;

procedure TWMQrCoin.InterForma1Imprimir(Sender: TObject);
var VlTCartera : String;
    VLCorteMon : Boolean;
begin
     if rgTipoCartera.ItemIndex = 0 then
        VlTCartera := 'BA'
     else if rgTipoCartera.ItemIndex = 1 then
        VlTCartera := 'NB'
     else if rgTipoCartera.ItemIndex = 1 then
        VlTCartera := 'XX';
     //end if;

     VLCorteMon := rgGrupoMon.ItemIndex =0;

     if rgTipoReporte.ItemIndex = 0 then
        RepCarteraVigente(Objeto.DameNoMes(cbMes.Text),StrToInt(cbAnio.Text),cbMes.Text,Objeto.Apli,VlTCartera,VLCorteMon,False,cbDetalle.checked)
{ROIM 27/09/2007   Se eliminan estas opciones ya que no se utilizan por promoción
Opciones que se quitarón del ChekList
ABC
Relación Promotor Asociado - Administrador - Acreditado
Relación Promotor Bono - Administrador - Acreditado
Relación Promotor Bono - Administrador
Relación Características de la Cartera
}
//    else if rgTipoReporte.ItemIndex = 1 then
//        RepCarteraVigenteABC(Objeto.DameNoMes(cbMes.Text),StrToInt(cbAnio.Text),cbMes.Text,Objeto.Apli,VlTCartera,VLCorteMon,False)
//     else if rgTipoReporte.ItemIndex = 2 then
//        RepCarteraVigenteProm(Objeto.DameNoMes(cbMes.Text),StrToInt(cbAnio.Text),cbMes.Text,'AS',Objeto.Apli,VlTCartera,VLCorteMon,False)
//     else if rgTipoReporte.ItemIndex = 3 then
//        RepCarteraVigenteProm(Objeto.DameNoMes(cbMes.Text),StrToInt(cbAnio.Text),cbMes.Text,'BO',Objeto.Apli,VlTCartera,VLCorteMon,False)
{/ROIM}
     {ROIM 21/03/2007 GENERA CONSULTAS A EXCEL "FONDEO"}
     else if rgTipoReporte.ItemIndex = 1 then
     begin
          If Trim(edNbrArch.Text)<>'' Then
          begin
             If GenArchFondeo Then
               ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
             Else
               ShowMessage('No se generó el Archivo')
          end
          else
                ShowMessage('Para este tipo de consulta debe indicar el nombre del archivo');
          //end if
     end
     {/ROIM}
     {ROIM 21/03/2007 GENERA CONSULTAS A EXCEL "INTEGRACIÓN CARTERA"}
     else if rgTipoReporte.ItemIndex = 2 then
     begin
          If Trim(edNbrArch.Text)<>'' Then Begin
             If GenArchIntegra Then
               ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
             Else
               ShowMessage('No se generó el Archivo')
          End
          else
                ShowMessage('Para este tipo de consulta debe indicar el nombre del archivo');
          //end if
     end
     {/ROIM}
     {ROIM 23/10/2007 SOLICITA ÁREA USUARIA}
     else if rgTipoReporte.ItemIndex = 3 then
     begin
          RepCarteraRie(Objeto.DameNoMes(cbMes.Text),StrToInt(cbAnio.Text),cbMes.Text,Objeto.Apli,VlTCartera,VLCorteMon,True,cbDetalle.checked)
     end;
     {/ROIM}     
end;

procedure TWMQrCoin.sbExcelClick(Sender: TObject);
var sExt:String;
begin
  If SaveDialog1.Execute Then Begin
      sExt:= copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-3,Length(SaveDialog1.FileName));
      If  UpperCase(sExt)= '.PRN' Then
         edNbrArch.Text := SaveDialog1.FileName
      Else
         edNbrArch.Text := SaveDialog1.FileName + '.prn';
  End Else
    edNbrArch.Text := '';
end;






end.

