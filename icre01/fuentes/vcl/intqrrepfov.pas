unit IntQrRepFov;
                        
interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport;

type
    TQrRepFov = class(TQuickRep)
    qyRepFov: TQuery;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRDBID_CREDITO: TQRDBText;
    qyRepFovID_CREDITO: TFloatField;
    qyRepFovID_TITULAR: TFloatField;
    qyRepFovNOMBRE: TStringField;
    qyRepFovSIT_CREDITO: TStringField;
    qyRepFovDESC_SUB_TIPO: TStringField;
    qyRepFovTIPO: TStringField;
    qyRepFovEVENTO: TStringField;
    qyRepFovIMP_OPERACION: TFloatField;
    qyRepFovB_VENCIDO: TStringField;
    qyRepFovSIT_TRANSACCION: TStringField;
    QRDBID_TITULAR: TQRDBText;
    QRDBNOMBRE: TQRDBText;
    qyRepFovCVE_SUB_TIP_BCO: TFloatField;
    QRDBDESC_SUB_TIPO: TQRDBText;
    QRDBEVENTO: TQRDBText;
    QRDBIMP_OPERACION: TQRDBText;
    QRDBB_VENCIDO: TQRDBText;
    QRDBSIT_TRANSACCION: TQRDBText;
    QRLabelCredito: TQRLabel;
    QRLabelTitular: TQRLabel;
    QRLabelNombre: TQRLabel;
    QRLabelCveProducto: TQRLabel;
    QRLabelEvento: TQRLabel;
    QRLabelFAplicacion: TQRLabel;
    QRLabelImporte: TQRLabel;
    QRLabelVencido: TQRLabel;
    QRLabelSitTransac: TQRLabel;
    qyRepFovF_APLICACION: TDateTimeField;
    QRDBF_APLICACION: TQRDBText;
    QRGroupTipo: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRGroup1: TQRGroup;
    QRGroupFTipo: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    QRDBText3: TQRDBText;
    QREventoBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel2: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRGroup2: TQRGroup;
    QRBand1Vdo: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    qyRepFovPERIODO: TCurrencyField;
    procedure qrDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    Function FormaQuery(sFechas,sTranAC,sTranCA,sTranACCA,sColocacion,
                        sTraspasos,sCobranza,sProvision,sCapitalizacion,sbCesion:Boolean;
                        sCesion,sF_Inicio,sF_Fin,sNbrArch  : String;
                        pAPli     : TInterApli;pPreview  : Boolean): String;
  end;

var
  QrRepFov: TQrRepFov;
  Apli : TInterApli;
  bGenArch: Boolean;
  sArchivo:String;
  vgFechaHoy : TDateTime;
  F: TextFile;

Procedure ReporteFovis( sFechas,sTranAC,sTranCA,sTranACCA,sColocacion,
                        sTraspasos,sCobranza,sProvision,sCapitalizacion,sbCesion:Boolean;
                        sCesion,sF_Inicio,sF_Fin,sNbrArch  : String;
                        pAPli     : TInterApli;pPreview  : Boolean);

implementation

Procedure ReporteFovis( sFechas,sTranAC,sTranCA,sTranACCA,sColocacion,
                        sTraspasos,sCobranza,sProvision,sCapitalizacion,sbCesion:Boolean;
                        sCesion,sF_Inicio,sF_Fin,sNbrArch  : String;
                        pAPli     : TInterApli;pPreview  : Boolean);
Var
    QrRepFov    : TQrRepFov;
    VLTitulo    : String;
    Preview     : TIntQRPreview;
    strConsulta : String;
Begin
    VLTitulo := '';
    QrRepFov:=TQrRepFov.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrRepFov);
    Try
        Apli := pApli;
        vgFechaHoy := pAPli.DameFechaEmpresa;
        bGenArch:= False;
        sArchivo:= sNbrArch;
        QrRepFov.QRInterEncabezado1.Apli:=pApli;
        QrRepFov.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrRepFov.QRInterEncabezado1.NomReporte:='IntQrRepFov';
        QrRepFov.QRInterEncabezado1.Titulo1:='Reporte de Eventos Fovis';

        IF sCobranza THEN
          VLTitulo:=VLTitulo+' Cobranza ';
        IF sCapitalizacion THEN
          VLTitulo:=VLTitulo+' Capitalización ';
        IF sColocacion THEN
          VLTitulo:=VLTitulo+' Colocación ';
        IF sProvision THEN
          VLTitulo:=VLTitulo+' Provisión ';
        IF sTraspasos THEN
          VLTitulo:=VLTitulo+' Traspasos ';
        IF VLTitulo<>'' THEN
          VLTitulo:='Eventos:'+VLTitulo;

        QrRepFov.QRInterEncabezado1.Titulo2 := VLTitulo;

        QrRepFov.qyRepFov.DatabaseName := pApli.DataBaseName;
        QrRepFov.qyRepFov.SessionName := pApli.SessionName;

        QrRepFov.qyRepFov.Active:=False;
        QrRepFov.qyRepFov.SQL.Text:= QrRepFov.FormaQuery( sFechas,sTranAC,sTranCA,sTranACCA,sColocacion,
                                        sTraspasos,sCobranza,sProvision,sCapitalizacion,sbCesion,
                                        sCesion,sF_Inicio,sF_Fin,sNbrArch,
                                        pAPli,pPreview);
        QrRepFov.qyRepFov.SQL.SaveToFile('c:\prueba.txt');
        QrRepFov.qyRepFov.Active:=True;

        If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrRepFov.QRInterEncabezado1.Titulo1 + #09 );
         Writeln(F, QrRepFov.QRInterEncabezado1.Titulo2 + #09 );
         Writeln(F,  #09 );
         Writeln(F,'Crédito' +  #09+
                   'Cliente' +  #09 +
                   'Nombre de Cliente' +  #09 +
                   'Sit. Crédito'+  #09 +
                   'Cve Producto'+  #09 +
                   'Producto'+  #09 +
                   'Tipo'+  #09 +
                   'Periodo' +  #09 +
                   'Evento' +  #09 +
                   'Fecha Aplicación' +  #09 +
                   'Importe' +#09 +
                   'Vencido'+ #09+
                   'Sit. Transacción');
         Writeln(F, '');
        End;
        If pPreview Then
            QrRepFov.Preview
        Else
            QrRepFov.Print;
    Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrRepFov.free;
      If Assigned(Preview) Then Preview.Free;
    End;

end;

{$R *.DFM}

Function TQrRepFov.FormaQuery( sFechas,sTranAC,sTranCA,sTranACCA,sColocacion,
                        sTraspasos,sCobranza,sProvision,sCapitalizacion,sbCesion:Boolean;
                        sCesion,sF_Inicio,sF_Fin,sNbrArch  : String;
                        pAPli     : TInterApli;pPreview  : Boolean): String;
Var
    sSQL:String;
Begin
sSQL:='select RESULT.ID_CREDITO, RESULT.ID_TITULAR, RESULT.NOMBRE, RESULT.SIT_CREDITO,    '+  coCRLF +
'		RESULT.CVE_SUB_TIP_BCO,RESULT.PERIODO,RESULT.DESC_SUB_TIPO, RESULT.TIPO, RESULT.EVENTO, RESULT.F_APLICACION,   '+  coCRLF +
'		RESULT.IMP_OPERACION, RESULT.B_VENCIDO, RESULT.SIT_TRANSACCION   '+  coCRLF +
'   from (   '+ coCRLF ;
//Colocacion   '
if sColocacion then
begin
sSQL:=sSQL+
'	SELECT   CRED.ID_CREDITO, CON.ID_TITULAR, PER.NOMBRE, CRED.SIT_CREDITO,CONT.CVE_SUB_TIP_BCO, 0 AS PERIODO,  '+  coCRLF +
'	         BCO.DESC_SUB_TIPO, ''COLOCACION'' AS TIPO, TRO.DESC_L_ID_PRIM AS EVENTO, TR.F_APLICACION,   '+  coCRLF +
'	         CRED.IMP_CREDITO as IMP_OPERACION,   '+ coCRLF +
'	         DECODE (F_TRASPASO_VENC, NULL, ''NO'', ''SI'') AS B_VENCIDO,   '+ coCRLF +
'	         TR.SIT_TRANSACCION   '+ coCRLF +
'	    FROM CRE_CREDITO CRED,   '+ coCRLF +
'	         CRE_TRANSACCION TR,   '+ coCRLF +
'	         CRE_OPERACION TRO,   '+ coCRLF +
'	         CRE_CONTRATO CONT,   '+ coCRLF +
'	         CRE_SUB_TIP_BCO BCO,   '+ coCRLF +
'	         CONTRATO CON,   '+ coCRLF +
'	         PERSONA PER   '+ coCRLF +
'	   WHERE CONT.ID_CONTRATO = CON.ID_CONTRATO   '+  coCRLF +
'	     AND PER.ID_PERSONA = CON.ID_TITULAR   '+  coCRLF +
'	     AND CRED.ID_CONTRATO = CONT.ID_CONTRATO   '+ coCRLF +
'	     AND TR.ID_CREDITO = CRED.ID_CREDITO   '+  coCRLF +
'	     AND CONT.CVE_SUB_TIP_BCO = BCO.CVE_SUB_TIP_BCO '+ coCRLF +
'	     AND TR.CVE_OPERACION IN (''CALTDI'') '+ coCRLF +
'	     AND tro.cve_operacion = tr.cve_operacion '+  coCRLF;
end;
// Cobranza
if sCobranza then
begin
        if sColocacion then
          sSQL:=sSQL+'       union all'+  coCRLF ;
          sSQL:=sSQL+
'	SELECT   CRED.ID_CREDITO, CON.ID_TITULAR, PER.NOMBRE, CRED.SIT_CREDITO, CONT.CVE_SUB_TIP_BCO, COB.NUM_PERIODO AS PERIODO,'+ coCRLF +
'	         BCO.DESC_SUB_TIPO, ''COBRANZA'' AS TIPO, UPPER (DESC_L_ID_PRIM) AS EVENTO, COB.F_APLICACION, '+ coCRLF +
'	         COB.IMP_OPERACION, DECODE (CPD.F_TRASPASO_VEN, NULL, ''NO'', ''SI'') AS B_VENCIDO, COB.SIT_TRANSACCION '+ coCRLF +
'	    FROM (SELECT TR.FOLIO_TRANS_CRED, TR.ID_CREDITO, TR.F_PROCESO, TR.F_APLICACION, '+ coCRLF +
'	                 O.CVE_OPERACION, O.DESC_L_ID_PRIM, O.OPERADOR, '+ coCRLF +
'	                 TR.IMP_OPERACION, TR.NUM_PERIODO, TR.SDO_GENERA_TRANS, '+ coCRLF +
'	                 TR.TASA_APLICACION, TR.TIPO_CAMBIO, TR.SIT_TRANSACCION '+ coCRLF +
'	            FROM CRE_TRANSACCION TR, CRE_OPERACION O '+ coCRLF +
'	           WHERE 1 = 1 '+ coCRLF +
'	             AND  O.CVE_OPERACION = TR.CVE_OPERACION '+ coCRLF +
'	             AND  O.B_INF_COBRANZA = ''V'' '+ coCRLF +
'	         ) COB, '+ coCRLF +
'	         CRE_CREDITO CRED, '+ coCRLF +
'	         CRE_CONTRATO CONT, '+ coCRLF +
'	         CRE_SUB_TIP_BCO BCO, '+ coCRLF +
'                CRE_PROV_DIARIA CPD, '+ coCRLF +
'	         CONTRATO CON, '+ coCRLF +
'	         PERSONA PER '+ coCRLF +
'	   WHERE COB.ID_CREDITO = CRED.ID_CREDITO '+ coCRLF +
'	     AND CONT.ID_CONTRATO = CON.ID_CONTRATO '+ coCRLF +
'            AND CPD.ID_CREDITO (+)= COB.ID_CREDITO '+ coCRLF +
'            AND CPD.F_PROVISION (+)= COB.F_APLICACION - 1 '+ coCRLF +
'	     AND PER.ID_PERSONA = CON.ID_TITULAR '+ coCRLF +
'	     AND CRED.ID_CONTRATO = CONT.ID_CONTRATO '+ coCRLF +
'	     AND CONT.CVE_SUB_TIP_BCO = BCO.CVE_SUB_TIP_BCO '+ coCRLF +
'            AND cob.cve_operacion not in (''CPINTV'') ' + coCRLF;
          sSQL:=sSQL+'       union all'+  coCRLF ;
          sSQL:=sSQL+
'	SELECT   CRED.ID_CREDITO, CON.ID_TITULAR, PER.NOMBRE, CRED.SIT_CREDITO, CONT.CVE_SUB_TIP_BCO, COB.NUM_PERIODO AS PERIODO,'+ coCRLF +
'	         BCO.DESC_SUB_TIPO, ''COBRANZA'' AS TIPO, UPPER (DESC_L_ID_PRIM) AS EVENTO, COB.F_APLICACION, '+ coCRLF +
'	         COB.IMP_OPERACION, DECODE (CPD.F_TRASPASO_VEN, NULL, ''NO'', ''SI'') AS B_VENCIDO, COB.SIT_TRANSACCION '+ coCRLF +
'	    FROM (SELECT TR_C_B.FOLIO_TRANS_CRED, TR_C_B.ID_CREDITO, TR.F_PROCESO, TR.F_APLICACION, '+ coCRLF +
'	                 O.CVE_OPERACION, O.DESC_L_ID_PRIM, O.OPERADOR, '+ coCRLF +
'	                 TR_C_B.IMP_OPERACION, TR_C_B.NUM_PERIODO, TR_C_B.SDO_GENERA_TRANS, '+ coCRLF +
'	                 TR_C_B.TASA_APLICACION, TR_C_B.TIPO_CAMBIO, TR_C_B.SIT_TRANSACCION '+ coCRLF +
'	            FROM CRE_TRANSACCION TR,  CRE_TRANSACCION TR_C_B,  CRE_OPERACION O '+ coCRLF +
'	           WHERE 1 = 1 '+ coCRLF +
'	             AND  O.CVE_OPERACION = TR_C_B.CVE_OPERACION '+ coCRLF +
'	             AND  TR.CVE_OPERACION IN (''CPINTP'',''CPINTV'') '+ coCRLF +
'		     AND  TR_C_B.ID_CREDITO = TR.ID_CREDITO '+ coCRLF +
'		     AND  TR_C_B.CVE_OPERACION IN (''CCOMBA'') '+ coCRLF +
'		     AND  TR_C_B.NUM_PERIODO = TR.NUM_PERIODO '+ coCRLF +
'	         ) COB, '+ coCRLF +
'	         CRE_CREDITO CRED, '+ coCRLF +
'	         CRE_CONTRATO CONT, '+ coCRLF +
'	         CRE_SUB_TIP_BCO BCO, '+ coCRLF +
'                CRE_PROV_DIARIA CPD, '+ coCRLF +
'	         CONTRATO CON, '+ coCRLF +
'	         PERSONA PER '+ coCRLF +
'	   WHERE COB.ID_CREDITO = CRED.ID_CREDITO '+ coCRLF +
'	     AND CONT.ID_CONTRATO = CON.ID_CONTRATO '+ coCRLF +
'            AND CPD.ID_CREDITO (+)= COB.ID_CREDITO '+ coCRLF +
'            AND CPD.F_PROVISION (+)= COB.F_APLICACION - 1 '+ coCRLF +
'	     AND PER.ID_PERSONA = CON.ID_TITULAR '+ coCRLF +
'	     AND CRED.ID_CONTRATO = CONT.ID_CONTRATO '+ coCRLF +
'	     AND CONT.CVE_SUB_TIP_BCO = BCO.CVE_SUB_TIP_BCO '+ coCRLF;
          sSQL:=sSQL+'       union all'+  coCRLF ;
          sSQL:=sSQL+
'	SELECT   CRED.ID_CREDITO, CON.ID_TITULAR, PER.NOMBRE, CRED.SIT_CREDITO, CONT.CVE_SUB_TIP_BCO, COB.NUM_PERIODO AS PERIODO,'+ coCRLF +
'	         BCO.DESC_SUB_TIPO, ''COBRANZA'' AS TIPO, UPPER (DESC_L_ID_PRIM) AS EVENTO, COB.F_APLICACION, '+ coCRLF +
'	         COB.IMP_OPERACION, DECODE (CPD.F_TRASPASO_VEN, NULL, ''NO'', ''SI'') AS B_VENCIDO, COB.SIT_TRANSACCION '+ coCRLF +
'	    FROM (SELECT TR_C_B.FOLIO_TRANS_CRED, TR_C_B.ID_CREDITO, TR.F_PROCESO, TR.F_APLICACION, '+ coCRLF +
'	                 O.CVE_OPERACION, O.DESC_L_ID_PRIM, O.OPERADOR, '+ coCRLF +
'	                 TR_C_B.IMP_OPERACION, TR_C_B.NUM_PERIODO, TR_C_B.SDO_GENERA_TRANS, '+ coCRLF +
'	                 TR_C_B.TASA_APLICACION, TR_C_B.TIPO_CAMBIO, TR_C_B.SIT_TRANSACCION '+ coCRLF +
'	            FROM CRE_TRANSACCION TR,  CRE_TRANSACCION TR_C_B,  CRE_OPERACION O '+ coCRLF +
'	           WHERE 1 = 1 '+ coCRLF +
'	             AND  O.CVE_OPERACION = TR_C_B.CVE_OPERACION '+ coCRLF +
'	             AND  TR.CVE_OPERACION IN (''CPINTP'',''CPINTV'') '+ coCRLF +
'		     AND  TR_C_B.ID_CREDITO = TR.ID_CREDITO '+ coCRLF +
'		     AND  TR_C_B.CVE_OPERACION IN (''CCOMFO'') '+ coCRLF +
'		     AND  TR_C_B.NUM_PERIODO = TR.NUM_PERIODO '+ coCRLF +
'	         ) COB, '+ coCRLF +
'	         CRE_CREDITO CRED, '+ coCRLF +
'	         CRE_CONTRATO CONT, '+ coCRLF +
'	         CRE_SUB_TIP_BCO BCO, '+ coCRLF +
'                CRE_PROV_DIARIA CPD, '+ coCRLF +
'	         CONTRATO CON, '+ coCRLF +
'	         PERSONA PER '+ coCRLF +
'	   WHERE COB.ID_CREDITO = CRED.ID_CREDITO '+ coCRLF +
'	     AND CONT.ID_CONTRATO = CON.ID_CONTRATO '+ coCRLF +
'            AND CPD.ID_CREDITO (+)= COB.ID_CREDITO '+ coCRLF +
'            AND CPD.F_PROVISION (+)= COB.F_APLICACION - 1 '+ coCRLF +
'	     AND PER.ID_PERSONA = CON.ID_TITULAR '+ coCRLF +
'	     AND CRED.ID_CONTRATO = CONT.ID_CONTRATO '+ coCRLF +
'	     AND CONT.CVE_SUB_TIP_BCO = BCO.CVE_SUB_TIP_BCO '+ coCRLF;

       {   sSQL:=sSQL+'       union all'+  coCRLF ;
          sSQL:=sSQL+
'	SELECT   CRED.ID_CREDITO, CON.ID_TITULAR, PER.NOMBRE, CRED.SIT_CREDITO, CONT.CVE_SUB_TIP_BCO, COB.NUM_PERIODO AS PERIODO,'+ coCRLF +
'	         BCO.DESC_SUB_TIPO, ''COBRANZA'' AS TIPO, UPPER (DESC_L_ID_PRIM) AS EVENTO, COB.F_APLICACION, '+ coCRLF +
'	         COB.IMP_OPERACION, DECODE (CPD.F_TRASPASO_VEN, NULL, ''NO'', ''SI'') AS B_VENCIDO, COB.SIT_TRANSACCION '+ coCRLF +
'	    FROM (SELECT TR.FOLIO_TRANS_CRED, TR.ID_CREDITO, TR.F_PROCESO, TR.F_APLICACION, '+ coCRLF +
'	                 ''INREAL'' AS CVE_OPERACION, ''INTERES REAL'' AS DESC_L_ID_PRIM, NULL AS OPERADOR, '+ coCRLF +
'	                 TR.IMP_OPERACION - (TR_C_B.IMP_OPERACION + TR_C_F.IMP_OPERACION) AS IMP_OPERACION, TR.NUM_PERIODO, TR.SDO_GENERA_TRANS, '+ coCRLF +
'	                 TR.TASA_APLICACION, TR.TIPO_CAMBIO, TR.SIT_TRANSACCION '+ coCRLF +
'	            FROM CRE_TRANSACCION TR,  CRE_TRANSACCION TR_C_B,  CRE_TRANSACCION TR_C_F, CRE_OPERACION O '+ coCRLF +
'	           WHERE 1 = 1 '+ coCRLF +
'	             AND  O.CVE_OPERACION = TR_C_B.CVE_OPERACION '+ coCRLF +
'	             AND  TR.CVE_OPERACION IN (''CPINTP'') '+ coCRLF +
'		     AND  TR_C_B.ID_CREDITO = TR.ID_CREDITO '+ coCRLF +
'		     AND  TR_C_B.CVE_OPERACION IN (''CCOMFO'') '+ coCRLF +
'		     AND  TR_C_B.NUM_PERIODO = TR.NUM_PERIODO '+ coCRLF +
'		     AND  TR_C_F.ID_CREDITO = TR.ID_CREDITO '+ coCRLF +
'		     AND  TR_C_F.CVE_OPERACION IN (''CCOMBA'') '+ coCRLF +
'		     AND  TR_C_F.NUM_PERIODO = TR.NUM_PERIODO '+ coCRLF +
'	         ) COB, '+ coCRLF +
'	         CRE_CREDITO CRED, '+ coCRLF +
'	         CRE_CONTRATO CONT, '+ coCRLF +
'	         CRE_SUB_TIP_BCO BCO, '+ coCRLF +
'                CRE_PROV_DIARIA CPD, '+ coCRLF +
'	         CONTRATO CON, '+ coCRLF +
'	         PERSONA PER '+ coCRLF +
'	   WHERE COB.ID_CREDITO = CRED.ID_CREDITO '+ coCRLF +
'	     AND CONT.ID_CONTRATO = CON.ID_CONTRATO '+ coCRLF +
'            AND CPD.ID_CREDITO (+)= COB.ID_CREDITO '+ coCRLF +
'            AND CPD.F_PROVISION (+)= COB.F_APLICACION - 1 '+ coCRLF +
'	     AND PER.ID_PERSONA = CON.ID_TITULAR '+ coCRLF +
'	     AND CRED.ID_CONTRATO = CONT.ID_CONTRATO '+ coCRLF +
'	     AND CONT.CVE_SUB_TIP_BCO = BCO.CVE_SUB_TIP_BCO '+ coCRLF;
               }
sSQL:=sSQL+'       union all'+  coCRLF ;
sSQL:=sSQL+' SELECT T.ID_CREDITO, C.ID_TITULAR, PER.NOMBRE, CR.SIT_CREDITO, CC.CVE_SUB_TIP_BCO , T.NUM_PERIODO AS PERIODO, '+ coCRLF +
'	   BCO.DESC_SUB_TIPO, ''COBRANZA'' AS TIPO, UPPER (''INTERES REAL'') AS EVENTO, CRED_PER.F_LIQUIDACION, '+ coCRLF +
'	   T.IMP_OPERACION, DECODE (CPD.F_TRASPASO_VEN, NULL, ''NO'', ''SI'') AS B_VENCIDO, T.SIT_TRANSACCION ' + coCRLF +
'        FROM '+ coCRLF +
'	   CRE_TRANSACCION t, CRE_OPERACION o, '+ coCRLF +
'	   PERSONA PER, CONTRATO C, '+ coCRLF +
'	   CRE_CREDITO CR, CRE_CONTRATO CC, '+ coCRLF +
'	   CRE_SUB_TIP_BCO BCO, CRE_PROV_DIARIA CPD, '+ coCRLF +
'                (      '+ coCRLF +
'                             SELECT CT.ID_CREDITO, '+ coCRLF +
'                                    CT.NUM_PERIODO, '+ coCRLF +
'				     CT.F_LIQUIDACION '+ coCRLF +
'                             FROM   CRE_OPERACION CO, CRE_TRANSACCION CT '+ coCRLF +
'                             WHERE  CO.CVE_OPERACION IN ( ''CPINTP'', ''CPINTE'', ''CAMINT'', ''CAREIN'', ''CCAPIT'', '+ coCRLF +
'                                                          ''CPADDI'', ''CPINTV'', ''CAREIV'', ''CPENVI'') '+ coCRLF +
'                               AND  CO.B_INF_COBRANZA = ''V'' '+ coCRLF +
//'                               AND  CT.F_LIQUIDACION = TO_DATE(''02/05/2011'',''DD/MM/YYYY'') '+ coCRLF +
'                               AND  CT.SIT_TRANSACCION = ''AC'' '+ coCRLF +
'                               AND  CO.CVE_OPERACION   = CT.CVE_OPERACION '+ coCRLF +
'                           ) CRED_PER '+ coCRLF +
'       WHERE '+ coCRLF +
'	 PER.ID_PERSONA = C.ID_TITULAR AND '+ coCRLF +
'	 T.ID_CONTRATO = C.ID_CONTRATO AND '+ coCRLF +
'	 t.ID_CREDITO = CRED_PER.id_credito and '+ coCRLF +
'	 t.NUM_PERIODO = CRED_PER.NUM_PERIODO AND '+ coCRLF +
'	 t.CVE_OPERACION = o.CVE_OPERACION AND '+ coCRLF +
'	 T.ID_CREDITO = CR.ID_CREDITO AND '+ coCRLF +
'	 T.ID_CONTRATO = CC.ID_CONTRATO AND '+ coCRLF +
'	 CC.CVE_SUB_TIP_BCO = BCO.CVE_SUB_TIP_BCO AND '+ coCRLF +
'	 CPD.ID_CREDITO = CRED_PER.ID_CREDITO AND '+ coCRLF +
'	 CPD.F_PROVISION = CRED_PER.F_LIQUIDACION - 1 AND '+ coCRLF +
'	 SIT_TRANSACCION = ''AC'' and '+ coCRLF +
'	 o.CVE_OPERACION  IN (''CPEINT'',''REFI'',''CCREFI'')'+ coCRLF;
end;
//capitalizacion
if sCapitalizacion then
begin
        if sColocacion or sCobranza then
          sSQL:=sSQL+'       union all'+  coCRLF ;
sSQL:=sSQL+
'	SELECT   CRED.ID_CREDITO, CON.ID_TITULAR, PER.NOMBRE, CRED.SIT_CREDITO,CONT.CVE_SUB_TIP_BCO,  CAP.NUM_PERIODO AS PERIODO,'+ coCRLF +
'	         BCO.DESC_SUB_TIPO, ''CAPITALIZACION'' AS TIPO, DESC_L_ID_PRIM AS EVENTO, CAP.F_APLICACION,  '+ coCRLF +
'	         CAP.IMP_OPERACION, DECODE (CPD.F_TRASPASO_VEN, NULL, ''NO'', ''SI'') AS B_VENCIDO, CAP.SIT_TRANSACCION  '+ coCRLF +
'	    FROM (SELECT TR.ID_CREDITO, TR.F_APLICACION, TR.F_PROCESO,   '+ coCRLF +
'	                 OP.DESC_L_ID_PRIM, TR.TX_COMENTARIO, TR.SIT_TRANSACCION,  '+ coCRLF +
'	                 TR.IMP_OPERACION, TR.NUM_PERIODO '+  coCRLF +
'	            FROM CRE_TRANSACCION TR, CRE_OPERACION OP  '+ coCRLF +
'	           WHERE TR.CVE_OPERACION IN  '+ coCRLF +
'	                    (''CREFIN'',  '+ coCRLF +
'	                     ''CCAPIT''  '+ coCRLF +
'	                    )  '+ coCRLF +
'	             AND OP.CVE_OPERACION = TR.CVE_OPERACION) CAP,  '+ coCRLF +
'	         CRE_CREDITO CRED,  '+ coCRLF +
'	         CRE_CONTRATO CONT,  '+  coCRLF +
'	         CRE_SUB_TIP_BCO BCO,  '+ coCRLF +
'                CRE_PROV_DIARIA CPD, '+ coCRLF +
'	         CONTRATO CON,  '+ coCRLF +
'	         PERSONA PER  '+ coCRLF +
'	   WHERE CAP.ID_CREDITO = CRED.ID_CREDITO  '+ coCRLF +
'	     AND CONT.ID_CONTRATO = CON.ID_CONTRATO  '+ coCRLF +
'            AND CPD.ID_CREDITO (+)= CAP.ID_CREDITO '+ coCRLF +
'            AND CPD.F_PROVISION (+)= CAP.F_APLICACION - 1 '+ coCRLF +
'	     AND PER.ID_PERSONA = CON.ID_TITULAR  '+ coCRLF +
'	     AND CRED.ID_CONTRATO = CONT.ID_CONTRATO  '+ coCRLF +
'	     AND CONT.CVE_SUB_TIP_BCO = BCO.CVE_SUB_TIP_BCO  '+ coCRLF;
end;
//TRASPASOS
if sTraspasos then
begin
        if sColocacion or sCobranza or sCapitalizacion then
          sSQL:=sSQL+'       union all'+  coCRLF ;
sSQL:=sSQL+
'		SELECT  '+  coCRLF +
'		RESULTTRASPASO.ID_CREDITO, RESULTTRASPASO.ID_TITULAR, RESULTTRASPASO.NOMBRE, RESULTTRASPASO.SIT_CREDITO,  '+  coCRLF +
'		RESULTTRASPASO.CVE_SUB_TIP_BCO,0 AS PERIODO,RESULTTRASPASO.DESC_SUB_TIPO, ''TRASPASO'' AS TIPO, RESULTTRASPASO.EVENTO, RESULTTRASPASO.F_APLICACION, '+  coCRLF +
'		RESULTTRASPASO.IMP_OPERACION, RESULTTRASPASO.B_VENCIDO, RESULTTRASPASO.SIT_TRANSACCION '+  coCRLF +
'		 FROM (	 '+  coCRLF +
'			SELECT CRED.ID_CREDITO, CON.ID_TITULAR, PER.NOMBRE, CRED.SIT_CREDITO,CONT.CVE_SUB_TIP_BCO, '+  coCRLF +
'			         BCO.DESC_SUB_TIPO, ''TRASPASO VIGENTE A IMPAGADO CAP'' AS EVENTO, CAP.F_PROG_PAGO AS F_APLICACION, '+  coCRLF +
'			         (CAP.IMP_CAPITAL-CAP.IMP_PAGADO)AS IMP_OPERACION, ''NO'' AS B_VENCIDO, ''-'' AS SIT_TRANSACCION '+  coCRLF +
'			 	FROM  '+  coCRLF +
'				     CRE_CAPITAL CAP, '+  coCRLF +
'			         CRE_CREDITO CRED, '+  coCRLF +
'			         CRE_CONTRATO CONT, '+  coCRLF +
'			         CRE_SUB_TIP_BCO BCO, '+  coCRLF +
'			         CONTRATO CON, '+  coCRLF +
'			         PERSONA PER, '+  coCRLF +
'					 cre_prov_diaria prov '+  coCRLF +
'			   WHERE CAP.ID_CREDITO=CRED.ID_CREDITO '+  coCRLF +
'			   	 and prov.id_credito=CRED.ID_CREDITO '+  coCRLF +
'			     AND CONT.ID_CONTRATO = CON.ID_CONTRATO '+  coCRLF +
'			     AND PER.ID_PERSONA = CON.ID_TITULAR '+  coCRLF +
'			     AND CRED.ID_CONTRATO = CONT.ID_CONTRATO '+  coCRLF +
'			     AND CONT.CVE_SUB_TIP_BCO = BCO.CVE_SUB_TIP_BCO '+  coCRLF +
'				 and prov.f_provision=CAP.F_PROG_PAGO '+  coCRLF +
'				 and prov.f_traspaso_ven is null '+  coCRLF +
'				 AND CAP.IMP_CAPITAL<>CAP.IMP_PAGADO '+  coCRLF +
'			UNION ALL '+  coCRLF +
// Se modifica Query para sacar los importes de Vencido a Vigento por Roberto Andres Silva Tello 18-Enero-2012
'			SELECT  '+  coCRLF +
'				   CRED.ID_CREDITO, CON.ID_TITULAR, PER.NOMBRE, CRED.SIT_CREDITO,CONT.CVE_SUB_TIP_BCO, '+  coCRLF +
'			       BCO.DESC_SUB_TIPO, ''TRASPASO VIGENTE A VENCIDO CVE'' AS EVENTO, RESULT.F_PROVISIONA AS F_APLICACION, '+  coCRLF +
'			       (select IMP_CAP_VDO_EX from CR_CON_ADEUDO_SDO '+  coCRLF +
'				where id_credito = cred.id_credito AND F_CIERRE = RESULT.f_provisiona ) AS IMP_OPERACION, '+  coCRLF +
'                              ''SI'' AS B_VENCIDO, ''-'' AS SIT_TRANSACCION '+  coCRLF +
'				FROM '+  coCRLF +
'				( '+  coCRLF +
'					SELECT '+  coCRLF +
'					PROV.ID_CREDITO, '+  coCRLF +
//'					--> SI NO ESTA EN CARTERA VENCIDA PON 0, SI SE ESTA EN CARTERA VENCIDA PON 1  
'					DECODE(NVL(TO_CHAR(PROV.F_TRASPASO_VEN),''0''),''0'',''0'',''1'') AS CAMBIOA,    '+  coCRLF +
'					PROV.F_PROVISION AS F_PROVISIONA, '+  coCRLF +
'					PROV.F_TRASPASO_VEN, '+  coCRLF +
'					PROVB.* '+  coCRLF +
'					FROM CRE_PROV_DIARIA PROV, '+  coCRLF +
'						 (SELECT  '+  coCRLF +
'							PROVB.ID_CREDITO AS ID_CREDITOB, '+  coCRLF +
//'							--> SI NO ESTA EN CARTERA VENCIDA PON 0, SI SE ESTA EN CARTERA VENCIDA PON 1
'							DECODE(NVL(TO_CHAR(PROVB.F_TRASPASO_VEN),''0''),''0'',''0'',''1'') AS CAMBIOB,  '+  coCRLF +
'							PROVB.F_PROVISION AS F_PROVISIONB '+  coCRLF +
'							FROM CRE_PROV_DIARIA PROVB '+  coCRLF +
'							) PROVB '+  coCRLF +
'					WHERE  '+  coCRLF +
'					PROV.F_TRASPASO_VEN IS NOT NULL '+  coCRLF +
'					AND PROV.ID_CREDITO=PROVB.ID_CREDITOB '+  coCRLF +
'					AND PROV.F_PROVISION=PROVB.F_PROVISIONB+1 '+  coCRLF +
'				)RESULT, '+  coCRLF +
'				  	 CRE_CREDITO CRED, '+  coCRLF +
'			         CRE_CONTRATO CONT, '+  coCRLF +
'			         CRE_SUB_TIP_BCO BCO, '+  coCRLF +
'			         CONTRATO CON, '+  coCRLF +
'			         PERSONA PER '+  coCRLF +
'			   WHERE RESULT.ID_CREDITO=CRED.ID_CREDITO '+  coCRLF +
'			     AND CONT.ID_CONTRATO = CON.ID_CONTRATO '+  coCRLF +
'			     AND PER.ID_PERSONA = CON.ID_TITULAR '+  coCRLF +
'			     AND CRED.ID_CONTRATO = CONT.ID_CONTRATO '+  coCRLF +
'			     AND CONT.CVE_SUB_TIP_BCO = BCO.CVE_SUB_TIP_BCO '+  coCRLF +
'				 AND RESULT.CAMBIOA-RESULT.CAMBIOB=1 '+  coCRLF +
'			UNION ALL '+  coCRLF +
'                                SELECT  '+  coCRLF +
'				   CRED.ID_CREDITO, CON.ID_TITULAR, PER.NOMBRE, CRED.SIT_CREDITO,CONT.CVE_SUB_TIP_BCO, '+  coCRLF +
'			       BCO.DESC_SUB_TIPO, ''TRASPASO VIGENTE A VENCIDO CVNE'' AS EVENTO, RESULT.F_PROVISIONA AS F_APLICACION, '+  coCRLF +
'			       (select IMP_CAP_VDO_NE from CR_CON_ADEUDO_SDO '+  coCRLF +
'			        where id_credito = cred.id_credito AND F_CIERRE = RESULT.f_provisiona ) AS IMP_OPERACION, '+  coCRLF +
'                                                  ''SI'' AS B_VENCIDO, ''-'' AS SIT_TRANSACCION '+  coCRLF +
'				FROM '+  coCRLF +
'				( '+  coCRLF +
'					SELECT '+  coCRLF +
'					PROV.ID_CREDITO, '+  coCRLF +
//'					--> SI NO ESTA EN CARTERA VENCIDA PON 0, SI SE ESTA EN CARTERA VENCIDA PON 1
'					DECODE(NVL(TO_CHAR(PROV.F_TRASPASO_VEN),''0''),''0'',''0'',''1'') AS CAMBIOA,    '+  coCRLF +
'					PROV.F_PROVISION AS F_PROVISIONA, '+  coCRLF +
'					PROV.F_TRASPASO_VEN, '+  coCRLF +
'					PROVB.* '+  coCRLF +
'					FROM CRE_PROV_DIARIA PROV, '+  coCRLF +
'						 (SELECT  '+  coCRLF +
'							PROVB.ID_CREDITO AS ID_CREDITOB, '+  coCRLF +
//'							--> SI NO ESTA EN CARTERA VENCIDA PON 0, SI SE ESTA EN CARTERA VENCIDA PON 1
'							DECODE(NVL(TO_CHAR(PROVB.F_TRASPASO_VEN),''0''),''0'',''0'',''1'') AS CAMBIOB,  '+  coCRLF +
'							PROVB.F_PROVISION AS F_PROVISIONB '+  coCRLF +
'							FROM CRE_PROV_DIARIA PROVB '+  coCRLF +
'							) PROVB '+  coCRLF +
'					WHERE  '+  coCRLF +
'					PROV.F_TRASPASO_VEN IS NOT NULL '+  coCRLF +
'					AND PROV.ID_CREDITO=PROVB.ID_CREDITOB '+  coCRLF +
'					AND PROV.F_PROVISION=PROVB.F_PROVISIONB+1 '+  coCRLF +
'				)RESULT, '+  coCRLF +
'				  	 CRE_CREDITO CRED, '+  coCRLF +
'			         CRE_CONTRATO CONT, '+  coCRLF +
'			         CRE_SUB_TIP_BCO BCO, '+  coCRLF +
'			         CONTRATO CON, '+  coCRLF +
'			         PERSONA PER '+  coCRLF +
'			   WHERE RESULT.ID_CREDITO=CRED.ID_CREDITO '+  coCRLF +
'			     AND CONT.ID_CONTRATO = CON.ID_CONTRATO '+  coCRLF +
'			     AND PER.ID_PERSONA = CON.ID_TITULAR '+  coCRLF +
'			     AND CRED.ID_CONTRATO = CONT.ID_CONTRATO '+  coCRLF +
'			     AND CONT.CVE_SUB_TIP_BCO = BCO.CVE_SUB_TIP_BCO '+  coCRLF +
'				 AND RESULT.CAMBIOA-RESULT.CAMBIOB=1 '+  coCRLF +
'			UNION ALL '+  coCRLF +
'                                SELECT  '+  coCRLF +
'				   CRED.ID_CREDITO, CON.ID_TITULAR, PER.NOMBRE, CRED.SIT_CREDITO,CONT.CVE_SUB_TIP_BCO, '+  coCRLF +
'			       BCO.DESC_SUB_TIPO, ''TRASPASO VIGENTE A VENCIDO IVE'' AS EVENTO, RESULT.F_PROVISIONA AS F_APLICACION, '+  coCRLF +
'			       (select IMP_INT_VDO_EX from CR_CON_ADEUDO_SDO '+  coCRLF +
'				where id_credito = cred.id_credito AND F_CIERRE = RESULT.f_provisiona ) AS IMP_OPERACION, '+  coCRLF +
'                                                  ''SI'' AS B_VENCIDO, ''-'' AS SIT_TRANSACCION '+  coCRLF +
'				FROM '+  coCRLF +
'				( '+  coCRLF +
'					SELECT '+  coCRLF +
'					PROV.ID_CREDITO, '+  coCRLF +
//'					--> SI NO ESTA EN CARTERA VENCIDA PON 0, SI SE ESTA EN CARTERA VENCIDA PON 1  
'					DECODE(NVL(TO_CHAR(PROV.F_TRASPASO_VEN),''0''),''0'',''0'',''1'') AS CAMBIOA,    '+  coCRLF +
'					PROV.F_PROVISION AS F_PROVISIONA, '+  coCRLF +
'					PROV.F_TRASPASO_VEN, '+  coCRLF +
'					PROVB.* '+  coCRLF +
'					FROM CRE_PROV_DIARIA PROV, '+  coCRLF +
'						 (SELECT  '+  coCRLF +
'							PROVB.ID_CREDITO AS ID_CREDITOB, '+  coCRLF +
//'							--> SI NO ESTA EN CARTERA VENCIDA PON 0, SI SE ESTA EN CARTERA VENCIDA PON 1
'							DECODE(NVL(TO_CHAR(PROVB.F_TRASPASO_VEN),''0''),''0'',''0'',''1'') AS CAMBIOB,  '+  coCRLF +
'							PROVB.F_PROVISION AS F_PROVISIONB '+  coCRLF +
'							FROM CRE_PROV_DIARIA PROVB '+  coCRLF +
'							) PROVB '+  coCRLF +
'					WHERE  '+  coCRLF +
'					PROV.F_TRASPASO_VEN IS NOT NULL '+  coCRLF +
'					AND PROV.ID_CREDITO=PROVB.ID_CREDITOB '+  coCRLF +
'					AND PROV.F_PROVISION=PROVB.F_PROVISIONB+1 '+  coCRLF +
'				)RESULT, '+  coCRLF +
'				  	 CRE_CREDITO CRED, '+  coCRLF +
'			         CRE_CONTRATO CONT, '+  coCRLF +
'			         CRE_SUB_TIP_BCO BCO, '+  coCRLF +
'			         CONTRATO CON, '+  coCRLF +
'			         PERSONA PER '+  coCRLF +
'			   WHERE RESULT.ID_CREDITO=CRED.ID_CREDITO '+  coCRLF +
'			     AND CONT.ID_CONTRATO = CON.ID_CONTRATO '+  coCRLF +
'			     AND PER.ID_PERSONA = CON.ID_TITULAR '+  coCRLF +
'			     AND CRED.ID_CONTRATO = CONT.ID_CONTRATO '+  coCRLF +
'			     AND CONT.CVE_SUB_TIP_BCO = BCO.CVE_SUB_TIP_BCO '+  coCRLF +
'				 AND RESULT.CAMBIOA-RESULT.CAMBIOB=1 '+  coCRLF +
'			UNION ALL '+  coCRLF +
// Se modifica Query para sacar los importes de Vencido a Vigento por Roberto Andres Silva Tello 18-Enero-2012
'			SELECT CRED.ID_CREDITO, CON.ID_TITULAR, PER.NOMBRE, CRED.SIT_CREDITO,CONT.CVE_SUB_TIP_BCO, '+  coCRLF +
'			       BCO.DESC_SUB_TIPO, ''TRASPASO VENCIDO A VIGENTE CV'' AS EVENTO, RESULT.F_PROVISIONA AS F_APLICACION, '+  coCRLF +
'			       (select IMP_CAP_VIG from CR_CON_ADEUDO_SDO '+  coCRLF +
' 				where id_credito = cred.id_credito AND F_CIERRE = RESULT.f_provisiona ) AS IMP_OPERACION, '+  coCRLF +
'                               ''NO'' AS B_VENCIDO, ''-'' AS SIT_TRANSACCION '+  coCRLF +
'				FROM '+  coCRLF +
'				( '+  coCRLF +
'					SELECT '+  coCRLF +
'					PROV.ID_CREDITO, '+  coCRLF +
//'					--> SI ESTA EN CARTERA VENCIDA PON 0, SI NO ESTA EN CARTERA VENCIDA PON 1  
'					DECODE(NVL(TO_CHAR(PROV.F_TRASPASO_VEN),''1''),''1'',''1'',''0'') AS CAMBIOA,    '+  coCRLF +
'					PROV.F_PROVISION AS F_PROVISIONA, '+  coCRLF +
'					PROV.F_TRASPASO_VEN, '+  coCRLF +
'					PROVB.* '+  coCRLF +
'					FROM CRE_PROV_DIARIA PROV, '+  coCRLF +
'						 (SELECT  '+  coCRLF +
'							PROVB.ID_CREDITO AS ID_CREDITOB, '+  coCRLF +
//'							--> SI ESTA EN CARTERA VENCIDA PON 0, SI NO ESTA EN CARTERA VENCIDA PON 1  
'							DECODE(NVL(TO_CHAR(PROVB.F_TRASPASO_VEN),''1''),''1'',''1'',''0'') AS CAMBIOB,  '+  coCRLF +
'							PROVB.F_PROVISION AS F_PROVISIONB '+  coCRLF +
'							FROM CRE_PROV_DIARIA PROVB '+  coCRLF +
'							) PROVB '+  coCRLF +
'					WHERE  '+  coCRLF +
'					PROV.F_TRASPASO_VEN IS NULL '+  coCRLF +
'					AND PROV.ID_CREDITO=PROVB.ID_CREDITOB '+  coCRLF +
'					AND PROV.F_PROVISION=PROVB.F_PROVISIONB+1 '+  coCRLF +
'				)RESULT, '+  coCRLF +
'				  	 CRE_CREDITO CRED, '+  coCRLF +
'			         CRE_CONTRATO CONT, '+  coCRLF +
'			         CRE_SUB_TIP_BCO BCO, '+  coCRLF +
'			         CONTRATO CON, '+  coCRLF +
'			         PERSONA PER '+  coCRLF +
'			   WHERE RESULT.ID_CREDITO=CRED.ID_CREDITO '+  coCRLF +
'			     AND CONT.ID_CONTRATO = CON.ID_CONTRATO '+  coCRLF +
'			     AND PER.ID_PERSONA = CON.ID_TITULAR '+  coCRLF +
'			     AND CRED.ID_CONTRATO = CONT.ID_CONTRATO '+  coCRLF +
'			     AND CONT.CVE_SUB_TIP_BCO = BCO.CVE_SUB_TIP_BCO '+  coCRLF +
'				 AND RESULT.CAMBIOA-RESULT.CAMBIOB=1 '+  coCRLF +
'			UNION ALL '+  coCRLF +
'			SELECT CRED.ID_CREDITO, CON.ID_TITULAR, PER.NOMBRE, CRED.SIT_CREDITO,CONT.CVE_SUB_TIP_BCO, '+  coCRLF +
'			       BCO.DESC_SUB_TIPO, ''TRASPASO VENCIDO A VIGENTE IV'' AS EVENTO, RESULT.F_PROVISIONA AS F_APLICACION, '+  coCRLF +
'			       (select IMP_INT_VIG from CR_CON_ADEUDO_SDO '+  coCRLF +
' 				where id_credito = cred.id_credito AND F_CIERRE = RESULT.f_provisiona ) AS IMP_OPERACION, '+  coCRLF +
'                               ''NO'' AS B_VENCIDO, ''-'' AS SIT_TRANSACCION '+  coCRLF +
'				FROM '+  coCRLF +
'				( '+  coCRLF +
'					SELECT '+  coCRLF +
'					PROV.ID_CREDITO, '+  coCRLF +
//'					--> SI ESTA EN CARTERA VENCIDA PON 0, SI NO ESTA EN CARTERA VENCIDA PON 1  
'					DECODE(NVL(TO_CHAR(PROV.F_TRASPASO_VEN),''1''),''1'',''1'',''0'') AS CAMBIOA,    '+  coCRLF +
'					PROV.F_PROVISION AS F_PROVISIONA, '+  coCRLF +
'					PROV.F_TRASPASO_VEN, '+  coCRLF +
'					PROVB.* '+  coCRLF +
'					FROM CRE_PROV_DIARIA PROV, '+  coCRLF +
'						 (SELECT  '+  coCRLF +
'							PROVB.ID_CREDITO AS ID_CREDITOB, '+  coCRLF +
//'							--> SI ESTA EN CARTERA VENCIDA PON 0, SI NO ESTA EN CARTERA VENCIDA PON 1  
'							DECODE(NVL(TO_CHAR(PROVB.F_TRASPASO_VEN),''1''),''1'',''1'',''0'') AS CAMBIOB,  '+  coCRLF +
'							PROVB.F_PROVISION AS F_PROVISIONB '+  coCRLF +
'							FROM CRE_PROV_DIARIA PROVB '+  coCRLF +
'							) PROVB '+  coCRLF +
'					WHERE  '+  coCRLF +
'					PROV.F_TRASPASO_VEN IS NULL '+  coCRLF +
'					AND PROV.ID_CREDITO=PROVB.ID_CREDITOB '+  coCRLF +
'					AND PROV.F_PROVISION=PROVB.F_PROVISIONB+1 '+  coCRLF +
'				)RESULT, '+  coCRLF +
'				  	 CRE_CREDITO CRED, '+  coCRLF +
'			         CRE_CONTRATO CONT, '+  coCRLF +
'			         CRE_SUB_TIP_BCO BCO, '+  coCRLF +
'			         CONTRATO CON, '+  coCRLF +
'			         PERSONA PER '+  coCRLF +
'			   WHERE RESULT.ID_CREDITO=CRED.ID_CREDITO '+  coCRLF +
'			     AND CONT.ID_CONTRATO = CON.ID_CONTRATO '+  coCRLF +
'			     AND PER.ID_PERSONA = CON.ID_TITULAR '+  coCRLF +
'			     AND CRED.ID_CONTRATO = CONT.ID_CONTRATO '+  coCRLF +
'			     AND CONT.CVE_SUB_TIP_BCO = BCO.CVE_SUB_TIP_BCO '+  coCRLF +
'				 AND RESULT.CAMBIOA-RESULT.CAMBIOB=1 '+  coCRLF +
'			) RESULTTRASPASO '+  coCRLF;
end;
//PROVISION
if sProvision then
begin
        if sColocacion or sCobranza or sCapitalizacion or sTraspasos then
          sSQL:=sSQL+'       union all'+  coCRLF ;
sSQL:=sSQL+
'               SELECT   CRED.ID_CREDITO, CON.ID_TITULAR, PER.NOMBRE, CRED.SIT_CREDITO, CONT.CVE_SUB_TIP_BCO, 0 AS PERIODO,'+  coCRLF +
'                        BCO.DESC_SUB_TIPO, ''PROVISION'' AS TIPO, ''PROVISION'' AS EVENTO, TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Fin))+''',''DD/MM/YYYY'') AS F_APLICACION, '+  coCRLF +
'                        PROV.IMP_PROVISION as IMP_OPERACION, PROV.B_VENCIDO, ''-'' AS SIT_TRANSACCION '+  coCRLF +
'                   FROM (SELECT   SUM (IMP_INTERES_DIA) AS IMP_PROVISION, ID_CREDITO, '+  coCRLF +
'                                  DECODE (F_TRASPASO_VEN, NULL, ''NO'', ''SI'') AS B_VENCIDO '+  coCRLF +
'                             FROM CRE_PROV_DIARIA '+  coCRLF +
'                            WHERE F_PROVISION >= TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Inicio))+''',''DD/MM/YYYY'')'+ coCRLF +
'                              AND F_PROVISION <= TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Fin))+''',''DD/MM/YYYY'')'+ coCRLF +
'                         GROUP BY ID_CREDITO,F_TRASPASO_VEN ) PROV, '+  coCRLF +
'                        CRE_CREDITO CRED, '+  coCRLF +
'                        CRE_CONTRATO CONT, '+  coCRLF +
'                        CRE_SUB_TIP_BCO BCO, '+  coCRLF +
'                        CONTRATO CON, '+  coCRLF +
'                        PERSONA PER '+  coCRLF +
'                  WHERE PROV.ID_CREDITO = CRED.ID_CREDITO '+  coCRLF +
'                   AND CONT.ID_CONTRATO = CON.ID_CONTRATO '+  coCRLF +
'                   AND PER.ID_PERSONA = CON.ID_TITULAR '+  coCRLF +
'                    AND CRED.ID_CONTRATO = CONT.ID_CONTRATO '+  coCRLF +
'                    AND CONT.CVE_SUB_TIP_BCO = BCO.CVE_SUB_TIP_BCO '+  coCRLF;
end;
sSQL:=sSQL+
'	) result   '+  coCRLF +
'where    '+ coCRLF +
'result.CVE_SUB_TIP_BCO=57   '+ coCRLF;
if sTranAC then
 sSQL:=sSQL+ 'AND result.SIT_TRANSACCION = ''AC''   '+  coCRLF ;
if sTranCA then
 sSQL:=sSQL+ 'AND result.SIT_TRANSACCION = ''CA''   '+  coCRLF ;
if sFechas then begin
sSQL:=sSQL+
'AND TRUNC(result.F_APLICACION) >= TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Inicio))+''',''DD/MM/YYYY'')'+ coCRLF +
'AND TRUNC(result.F_APLICACION) <= TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Fin))+''',''DD/MM/YYYY'')'+ coCRLF ;
end;
if sbCesion then
 sSQL:=sSQL+ 'AND result.ID_CREDITO = '+sCesion+  coCRLF ;
sSQL:=sSQL+ 
'ORDER BY RESULT.TIPO, result.F_APLICACION, result.EVENTO, result.B_VENCIDO, result.ID_CREDITO,  result.SIT_CREDITO  ';
   Result:= sSQL;
End;

procedure TQrRepFov.qrDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
   sFVenc, sFPago: String;
begin

   If sArchivo <>'' Then Begin
      If qyRepFov.FieldByName('F_APLICACION').AsDateTime > 0 Then
         sFVenc:= FormatDateTime('dd/mm/yyyy',qyRepFov.FieldByName('F_APLICACION').AsDateTime);

      Writeln(F, qyRepFov.FieldByName('ID_CREDITO').AsString + #09 +
                 qyRepFov.FieldByName('ID_TITULAR').AsString + #09 +
                 qyRepFov.FieldByName('NOMBRE').AsString + #09 +
                 qyRepFov.FieldByName('SIT_CREDITO').AsString + #09 +
                 qyRepFov.FieldByName('CVE_SUB_TIP_BCO').AsString + #09 +
                 qyRepFov.FieldByName('DESC_SUB_TIPO').AsString + #09 +
                 qyRepFov.FieldByName('TIPO').AsString + #09 +
                 qyRepFov.FieldByName('PERIODO').AsString + #09 +
                 qyRepFov.FieldByName('EVENTO').AsString + #09 +
                 sFVenc + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',qyRepFov.FieldByName('IMP_OPERACION').AsFloat) + #09 +
                 qyRepFov.FieldByName('B_VENCIDO').AsString  + #09 +
                 qyRepFov.FieldByName('SIT_TRANSACCION').AsString
                 );
   End;
end;


end.
