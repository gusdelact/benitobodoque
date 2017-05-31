unit IntQrRepSolid;

// 01 JUN 2006. CORRECCION CAMPO SOL FONDEO NAFIN

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview;
Const
   coCRLF      = #13#10;
type
  TQrRepSolNafin = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qySolicitud: TQuery;
    qrGrupo0: TQRGroup;
    QRGroupCredito: TQRGroup;
    QRGroupSolicitud: TQRGroup;
    QRShape2: TQRShape;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel39: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel40: TQRLabel;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRLabel41: TQRLabel;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRDBText43: TQRDBText;
    QRLabel44: TQRLabel;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRDBText46: TQRDBText;
    QRLabel47: TQRLabel;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRLabel51: TQRLabel;
    QRDBText51: TQRDBText;
    QRLabel52: TQRLabel;
    QRDBText52: TQRDBText;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRDBText55: TQRDBText;
    QRLabel57: TQRLabel;
    QRDBText56: TQRDBText;
    QRLabel58: TQRLabel;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRDBText63: TQRDBText;
    QRDBText64: TQRDBText;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRDBText67: TQRDBText;
    QRLabel68: TQRLabel;
    QRDBText68: TQRDBText;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRDBText71: TQRDBText;
    QRDBText72: TQRDBText;
    QRLabel74: TQRLabel;
    qrGrupoGar: TQRGroup;
    QRGroupCveGar: TQRGroup;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRGroupCveGar2: TQRGroup;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    qrGrupoProposito: TQRGroup;
    QRGroupCveProp: TQRGroup;
    QRShape4: TQRShape;
    QRLabel10: TQRLabel;
    QRGroupCveProp2: TQRGroup;
    QRDBText10: TQRDBText;
    QRGroupDestino: TQRGroup;
    QRGroupCveDestino: TQRGroup;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRGroupCveDestino2: TQRGroup;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape5: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrGrupo0BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  public
    Function FormaQuery(iCredito, iSolicitud:Integer):String;
    Procedure ImprimeBanda;
  end;
var
  QrRepSolNafin: TQrRepSolNafin;

Procedure RepSolicitud(iCredito, iSolicitud:Integer; pAPli :TInterApli; pPreview  :Boolean);
Implementation
{$R *.DFM}

Procedure RepSolicitud(iCredito, iSolicitud:Integer; pAPli :TInterApli; pPreview  :Boolean);
Var
   QrRepSolNafin: TQrRepSolNafin;
   VLTitulo : String;
   Preview     : TIntQRPreview;
Begin
   VLTitulo := '';
   QrRepSolNafin:=TQrRepSolNafin.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrRepSolNafin);
   Try
      QrRepSolNafin.QRInterEncabezado1.Apli:=pAPli;
      QrRepSolNafin.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrRepSolNafin.QRInterEncabezado1.NomReporte:='IntQrRepSolid';
      QrRepSolNafin.QRInterEncabezado1.Titulo1:='Reporte de Solicitud de Participación en el Riesgo';

      If (iCredito > 0)Or(iSolicitud >0)Then Begin
         If iCredito > 0 Then
            VLTitulo := '  Crédito N°'+ IntToStr(iCredito)+ ' ';
         If iSolicitud >0 Then
            VLTitulo := '  Solicitud N°'+ IntToStr(iSolicitud)+ ' ';
      End;
      QrRepSolNafin.QRInterEncabezado1.Titulo2:= VLTitulo;
      QrRepSolNafin.qySolicitud.Active:=False;
      QrRepSolNafin.qySolicitud.DatabaseName := pApli.DataBaseName;
      QrRepSolNafin.qySolicitud.SessionName := pApli.SessionName;
      QrRepSolNafin.qySolicitud.SQL.Text:= QrRepSolNafin.FormaQuery(iCredito, iSolicitud);
      //QrRepSolNafin.qySolicitud.SQL.SaveToFile('C:\SQL.txt');
      QrRepSolNafin.qySolicitud.Active:=True;
      If pPreview Then QrRepSolNafin.Preview
      Else QrRepSolNafin.Print;
   Finally
      QrRepSolNafin.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;
procedure TQrRepSolNafin.qrGrupo0BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   ImprimeBanda;
end;

Function TQrRepSolNafin.FormaQuery(iCredito, iSolicitud:Integer):String;
Var
    sSQL:String;
Begin
    sSQL:=
            'SELECT * FROM '+ coCRLF +
            '('+ coCRLF +
            'SELECT 0 AS GRUPO, NVL(CRSOL.ID_CREDITO,0) AS ID_CREDITO, CRSOL.ID_SOLICITUD, '+ coCRLF +
            '       DATOS.ID_TITULAR, DATOS.NOMBRE, DATOS.RFC, DATOS.CALLE_NUMERO,'+ coCRLF +
            '       DATOS.COLONIA, DATOS.CODIGO_POSTAL, DATOS.CIUDAD, DATOS.MUNICIPIO,'+ coCRLF +
            '       DATOS.ESTADO, DATOS.DESC_SECTOR_ECO AS GIRO, CC.ID_CREDITO AS CVE_FINAN,'+ coCRLF +
            '       DATOS.TIPSEC, DECODE(NVL(CFC.ID_CREDITO,0),0,''N'',''S'')AS FONDEO_NAFIN,'+ coCRLF +
            '       ''S'' AS RIESGO_NAFIN, CRSOL.PCT_PART_RIESGO,'+ coCRLF +
            '	   NVL(CRSOL.NUM_PERSONAL,0) AS NUM_PERSONAL, CRSOL.IMP_PROM_VENTAS,'+ coCRLF +
            '       CRSOL.PCT_PROD_MER_INT, CRSOL.PCT_PROD_MER_EXT,'+ coCRLF +
            '       TIPAMORT.VALOR AS CVE_TIP_AMORTIZA, CRSOL.IMP_FINANCIAMTO,'+ coCRLF +
            '       TRIM(TO_CHAR(CC.F_AUTORIZA,''DD/MM/YYYY'')) AS F_DISPOSICION,'+ coCRLF +
            '       TRIM(TO_CHAR(CRSOL.F_PARTICIPACION,''DD/MM/YYYY'')) AS F_PARTICIPACION,'+ coCRLF +
            '       CC.IMP_CREDITO, MONEDA.CVE_CLAVE AS MONEDA,'+ coCRLF +
            '       CRSOL.NUM_MES_PLAZO, CRSOL.NUM_MES_GRACIA,'+ coCRLF +
            '       CC.SOBRETASA, FUNINTER.VALOR AS CVE_FUNC_INTER, INTFINAN.VALOR  AS CVE_INTER_FINAN,'+ coCRLF +
            '       TIPAUT.VALOR AS CVE_TIP_AUTORIZA, PROG.VALOR AS CVE_PROGRAMA, TIPTASA.VALOR AS CVE_TIP_TASA,'+ coCRLF +
            '       CCTO.DIAS_PLAZO, CRSOL.CVE_CALIF_CRE, CRSOL.MES_ANTIGUEDAD,'+ coCRLF +
            //'	   --Propósitos'+ coCRLF +
            '       '' '' AS CVE_PROPOSITO, TIPFINAN.VALOR AS CVE_TIP_CRED,'+ coCRLF +
            //'       --Garantías'+ coCRLF +
            '       '' '' AS CVE_GARANTIA, 0 IMP_GARANTIA,'+ coCRLF +
            '       0 AS NUM_GAR, '' '' AS DESC_GARANTIA, '' '' AS CLASIFICACION, '+ coCRLF +
            '       '' '' AS DESC_GARANT, '+ coCRLF +
            //'	   --Destino'+ coCRLF +
            '	   '' '' AS CVE_DESTINO, TRIM(TO_CHAR(0,''000'')) AS PCT_PARCIAL,'+ coCRLF +
            '       TRIM(TO_CHAR(0,''000'')) AS PCT_ORIGEN_NAL,'+ coCRLF +
            '       TRIM(TO_CHAR(0,''000'')) AS PCT_IMPORTACION, '' '' AS DESC_PROP, '' '' AS DESC_DESTINO, '+ coCRLF +
            '       DECODE(CRSOL.SIT_SOL_GTIA,''AC'',''ACTIVO'',''EN'',''ENVIADO'','' '') AS SIT_SOL_GTIA '+ coCRLF +
            '  FROM CR_CREDITO CC,'+ coCRLF +
            '       (SELECT CCTO.ID_CONTRATO, CTO.ID_TITULAR, TIT.NOMBRE,'+ coCRLF +
            '               RFC.SIGLAS_RFC||RFC.F_RFC||RFC.HOMOCLAVE_RFC AS RFC,'+ coCRLF +
            '               DOM.CALLE_NUMERO, DOM.COLONIA, DOM.CODIGO_POSTAL,'+ coCRLF +
            '               DOM.CVE_CIUDAD, CDAD.DESC_POBLACION AS CIUDAD,'+ coCRLF +
            '               DOM.CVE_CIUDAD AS CVE_MUNICIPIO,'+ coCRLF +
            '	           (SELECT CVE_MPIO_CLAVE FROM CR_MAP_MUNICIPIO'+ coCRLF +
            '                 WHERE CVE_ESTADO = DOM.CVE_ESTADO'+ coCRLF +
            '                   AND CVE_MPIO_CORP = DOM.CVE_CIUDAD)AS MUNICIPIO,'+ coCRLF +
            '               DOM.CVE_ESTADO, ESTADO.CVE_CLAVE AS ESTADO, ACR.CVE_SECTOR_ECO,'+ coCRLF +
            '               SE.DESC_SECTOR_ECO, SE.CVE_TIPO_SECTOR, SECTOR.CVE_CLAVE AS TIPSEC'+ coCRLF +
            '          FROM CR_CONTRATO CCTO, CONTRATO CTO, PERSONA TIT, RFC, DOMICILIO DOM,'+ coCRLF +
            //'               CR_ACREDITADO ACR, CR_SECTOR_ECO SE, /*CRE_SENICREB CSE,*/ POBLACION CDAD,'+ coCRLF +
            '               CR_ACREDITADO ACR, CR_SECTOR_ECO SE, POBLACION CDAD,'+ coCRLF +            
            '               (SELECT * FROM CR_MAPEO_CLAVE WHERE CVE_GRUPO_CLAVE=''CVEEDO'')ESTADO,'+ coCRLF +
            '               (SELECT * FROM CR_MAPEO_CLAVE WHERE CVE_GRUPO_CLAVE=''CVESEC'')SECTOR'+ coCRLF +
            '         WHERE CTO.ID_CONTRATO = CCTO.ID_CONTRATO'+ coCRLF +
            '           AND TIT.ID_PERSONA = CTO.ID_TITULAR'+ coCRLF +
            '           AND CTO.ID_TITULAR = RFC.ID_PERSONA'+ coCRLF +
            '           AND DOM.ID_DOMICILIO = TIT.ID_DOMICILIO'+ coCRLF +
            '           AND ACR.ID_ACREDITADO = CTO.ID_TITULAR'+ coCRLF +
            '           AND SE.CVE_SECTOR_ECO = ACR.CVE_SECTOR_ECO'+ coCRLF +
            //'           AND CSE.CVE_SENICREB = ACR.CVE_SENICREB'+ coCRLF +
            '           AND ESTADO.CVE_CORP = DOM.CVE_ESTADO'+ coCRLF +
            '           AND CDAD.CVE_POBLACION = DOM.CVE_CIUDAD'+ coCRLF +
            '           AND SECTOR.CVE_CORP = SE.CVE_TIPO_SECTOR'+ coCRLF +
            '       )DATOS,'+ coCRLF +
            '       CR_FND_CREDITO CFC, CR_CONTRATO CCTO, CR_CB_SOL_GTIA CRSOL,'+ coCRLF +
            '       (SELECT * FROM CR_MAPEO_CLAVE WHERE CVE_GRUPO_CLAVE=''CVEMON'')MONEDA,'+ coCRLF +
            '       (SELECT * FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE=''TIP_CR'')TIPFINAN,'+ coCRLF +
            '       (SELECT * FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE=''FORAUT'')TIPAMORT,'+ coCRLF +
            '       (SELECT * FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE=''TPTASA'')TIPTASA,'+ coCRLF +
            '       (SELECT * FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE=''TIPAUT'')TIPAUT, '+ coCRLF +
            '       (SELECT * FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE=''INTERM'')INTFINAN, '+ coCRLF +
            '       (SELECT * FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE=''TIPPRO'')PROG, '+ coCRLF +
            '       (SELECT * FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE=''FUNINT'')FUNINTER '+ coCRLF +
            ' WHERE DATOS.ID_CONTRATO = CC.ID_CONTRATO'  + coCRLF +
            '   AND CFC.ID_CREDITO (+)= CC.ID_CREDITO'   + coCRLF +
            '   AND CFC.PCT_REDESCONTADO (+) > 0 '       + coCRLF + // LOLS 01 JUN 2006
            '   AND CCTO.ID_CONTRATO = CC.ID_CONTRATO'   + coCRLF +
            '   AND CCTO.FOL_CONTRATO = CC.FOL_CONTRATO' + coCRLF +
            '   AND CRSOL.ID_CREDITO = CC.ID_CREDITO'    + coCRLF;

   If (iCredito > 0 ) Then
      sSQL:= sSQL + '   AND CRSOL.ID_CREDITO ='+ IntToStr(iCredito)+ coCRLF;
   If (iSolicitud > 0 ) Then
      sSQL:= sSQL + '   AND CRSOL.ID_SOLICITUD='+ IntToStr(iSolicitud)+ coCRLF;

   sSQL:= sSQL +
            '   AND MONEDA.CVE_CORP (+)= CCTO.CVE_MONEDA'+ coCRLF +
            '   AND TIPFINAN.CVE_REFERENCIA (+)= CRSOL.CVE_TIP_CRED'+ coCRLF +
            '   AND TIPAMORT.CVE_REFERENCIA (+)= CRSOL.CVE_TIP_AMORTIZA'+ coCRLF +
            '   AND TIPTASA.CVE_REFERENCIA (+)= CRSOL.CVE_TIP_TASA'+ coCRLF +
            '   AND TIPAUT.CVE_REFERENCIA (+)= CRSOL.CVE_TIP_AUTORIZA'+ coCRLF +
            '   AND INTFINAN.CVE_REFERENCIA (+)= CRSOL.CVE_INTER_FINAN'+ coCRLF +
            '   AND PROG.CVE_REFERENCIA (+)= CRSOL.CVE_PROGRAMA'+ coCRLF +
            '   AND FUNINTER.CVE_REFERENCIA (+)= CRSOL.CVE_FUNC_INTER'+ coCRLF +

            'UNION ALL'+ coCRLF +
            'SELECT 1 , NVL(GARANT.ID_DISPOSICION,0) ,'+ coCRLF +
            '      '+ IntToStr(iSolicitud) +' , '+ coCRLF +
            '       0 , '' '' , '' '' , '' '' ,'+ coCRLF +
            '       '' '' , '' '' , '' '' , '' '' ,'+ coCRLF +
            '       '' '' , '' '' , GARANT.ID_DISPOSICION ,'+ coCRLF +
            '       '' '' , ''S'' ,''S'' , 0 , 0 , 0 , 0 , 0 ,'' '' , 0 ,'+ coCRLF +
            '       TRIM(TO_CHAR(SYSDATE,''DD/MM/YYYY'')) ,'+ coCRLF +
            '       TRIM(TO_CHAR(SYSDATE,''DD/MM/YYYY'')) ,'+ coCRLF +
            '       0 , '' '' ,0 , 0 ,0 , '' '' , '' '' ,'+ coCRLF +
            '       '' '' , '' '' , '' '' ,0 , '' '' , 0 ,'+ coCRLF +
            //'	   --Propósitos'+ coCRLF +
            '       '' '' , '' '' ,'+ coCRLF +
            //'       --Garantías'+ coCRLF +
            '       GARANT.CVE_CLAVE AS CVE_GARANTIA, GARANT.IMP_GARANTIA,'+ coCRLF +
            '       GARANT.ID_SOLICITUD AS NUM_GAR, GARANT.DESC_GARANTIA, GARANT.CLASIFICACION, '+ coCRLF +
            '       GARANT.VALOR AS DESC_GARANT, '+ coCRLF +
            //'	   --Destino'+ coCRLF +
            '	   '' '' , TRIM(TO_CHAR(0,''000'')) ,'+ coCRLF +
            '       TRIM(TO_CHAR(0,''000'')) ,'+ coCRLF +
            '       TRIM(TO_CHAR(0,''000'')) , '' '' , '' '','' '' '+ coCRLF +
            '  FROM '+ coCRLF +
            '       --GARANTÍAS'+ coCRLF +
            '       (SELECT CR_GA_DIS_GAR.ID_DISPOSICION, CR_GA_REGISTRO.ID_ACREDITADO,'+ coCRLF +
            '               CR_GA_REGISTRO.ID_SOLICITUD, CR_GA_GARANTIA.DESC_GARANTIA,'+ coCRLF +
            '               DECODE(NVL(CR_GA_NAVE_IND.ID_SOLICITUD,0),0,'+ coCRLF +
            '               DECODE(NVL(CR_GA_BI_MUEB.ID_SOLICITUD,0),0,'+ coCRLF +
            '               DECODE(NVL(CR_GA_PRENDARIAS.ID_SOLICITUD,0),0,'+ coCRLF +
            '               DECODE(NVL(CR_GA_PERSONALES.ID_SOLICITUD,0),0,'+ coCRLF +
            '               DECODE(NVL(CR_GA_CESION.ID_SOLICITUD,0),0,'+ coCRLF +
            '               DECODE(NVL(CR_GA_PAR_APOR.ID_SOLICITUD,0),0,'+ coCRLF +
            '               DECODE(NVL(CR_GA_SIN_CLAS.ID_SOLICITUD,0),0,'+ coCRLF +
            '               DECODE(NVL(CR_GA_BI_INMUEB.ID_SOLICITUD,0),0,'+ coCRLF +
            '               DECODE(NVL(CR_GA_DOC_COB.ID_SOLICITUD,0),0,'' '','+ coCRLF +
            '               ''DOCUMENTOS POR COBRAR''),''BIEN INMUEBLE''),'+ coCRLF +
            '               ''SIN CLASIFICACION''),''PARTICIPACIONES/APORTACIONES FEDERALES''),'+ coCRLF +
            '               ''CESION''),''PERSONALES''),''PENDARIAS''),'+ coCRLF +
            '               ''BIEN MUEBLE''),''NAVE/UNIDAD INDUSTRIAL'')CLASIFICACION,'+ coCRLF +
            '               NVL(CR_GA_DIS_GAR.IMP_GARANTIA,0)IMP_GARANTIA,'+ coCRLF +
            '               CR_GA_DIS_GAR.ID_REL_DIS_GAR, GAR.CVE_CLAVE, GPO.VALOR'+ coCRLF +
            '          FROM CR_GA_REGISTRO, CR_GA_BI_INMUEB, CR_GA_BI_MUEB,'+ coCRLF +
            '               CR_GA_PRENDARIAS, CR_GA_PERSONALES, CR_GA_CESION,'+ coCRLF +
            '               CR_GA_PAR_APOR, CR_GA_SIN_CLAS, CR_GA_GARANTIA,'+ coCRLF +
            '               CR_GA_DIS_GAR, CR_GA_DOC_COB, CR_GA_NAVE_IND,'+ coCRLF +
            '               (SELECT * FROM CR_MAPEO_CLAVE WHERE CVE_GRUPO_CLAVE=''CVGTIA'')GAR,'+ coCRLF +
            '               CR_GRUPO_CLAVE GPO'+ coCRLF +
            '         WHERE CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_BI_INMUEB.ID_SOLICITUD(+)'+ coCRLF +
            '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_BI_MUEB.ID_SOLICITUD(+)'+ coCRLF +
            '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_PRENDARIAS.ID_SOLICITUD(+)'+ coCRLF +
            '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_PERSONALES.ID_SOLICITUD(+)'+ coCRLF +
            '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_CESION.ID_SOLICITUD(+)'+ coCRLF +
            '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_PAR_APOR.ID_SOLICITUD(+)'+ coCRLF +
            '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_SIN_CLAS.ID_SOLICITUD(+)'+ coCRLF +
            '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_DOC_COB.ID_SOLICITUD(+)'+ coCRLF +
            '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_NAVE_IND.ID_SOLICITUD(+)'+ coCRLF +
            '           AND CR_GA_REGISTRO.CVE_GARANTIA = CR_GA_GARANTIA.CVE_GARANTIA'+ coCRLF +
            '           AND CR_GA_REGISTRO.SIT_REG_GARANTIA=''AC'''+ coCRLF +
            '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_DIS_GAR.ID_REG_SOL_GAR'+ coCRLF +
            '           AND GAR.CVE_CORP (+)= CR_GA_REGISTRO.CVE_GARANTIA'+ coCRLF +
            '           AND GPO.CVE_REFERENCIA (+)= GAR.CVE_CLAVE'+ coCRLF +
            '           AND GPO.CVE_GRUPO_CLAVE (+)= GAR.CVE_GRUPO_CLAVE'+ coCRLF;
   If (iCredito > 0 ) Then
      sSQL:= sSQL +
            '           AND CR_GA_DIS_GAR.ID_DISPOSICION ='+ IntToStr(iCredito)+ coCRLF
   Else
      sSQL:= sSQL +
         '           AND CR_GA_DIS_GAR.ID_DISPOSICION  IN (SELECT ID_CREDITO FROM CR_CB_SOL_GTIA)'+ coCRLF;

   sSQL:= sSQL +
            '         ORDER BY CR_GA_DIS_GAR.ID_REL_DIS_GAR, CR_GA_DIS_GAR.ID_DISPOSICION'+ coCRLF +
            '       )GARANT,'             + coCRLF +
            '       CR_CB_SOL_GTIA CCSG'  + coCRLF +
            'WHERE  GARANT.ID_DISPOSICION = CCSG.ID_CREDITO'  + coCRLF +

   //PROPOSITOS
            'UNION ALL'+ coCRLF +
            'SELECT 2 AS GRUPO,PP.ID_CREDITO,PP.ID_SOLICITUD, 0, '' '', '' '', '' '', '' '', '' '', '' '', '' '','+ coCRLF +
            '       '' '', '' '', PP.ID_CREDITO, '' '', ''S'', ''S'' , 0,'+ coCRLF +
            '	     0, 0, 0, 0, '' '', 0, TRIM(TO_CHAR(SYSDATE,''YYYYMMDD'')) ,'+ coCRLF +
            '       TRIM(TO_CHAR(SYSDATE,''YYYYMMDD'')), '+ coCRLF +
            '       0,  '' '', 0, 0 , 0,  '' '',  '' '', '' '', '' '', '' '','+ coCRLF +
            '       0, '' '', 0, PP.CVE_PROPOSITO, '' '', '' '', 0,'+ coCRLF +
            '       0 AS NUM_GAR, '' '', '' '','' '', '+ coCRLF +
            '	     '' '', TRIM(TO_CHAR(0,''000'')),TRIM(TO_CHAR(0,''000'')),TRIM(TO_CHAR(0,''000'')),'+ coCRLF +
            '       PROP.VALOR AS DESC_PROP, '' '' AS DESC_DESTINO,'' '' '+ coCRLF +
            '  FROM CR_CB_PRO_PROY PP, '   + coCRLF +
            '       CR_CB_SOL_GTIA CCSG, ' + coCRLF +
            '       (SELECT * FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE=''CVPROP'')PROP '+ coCRLF +
            ' WHERE PROP.CVE_REFERENCIA = PP.CVE_PROPOSITO '  + coCRLF +
            '   AND  PP.ID_CREDITO      = CCSG.ID_CREDITO '   + coCRLF +
            '   AND  PP.ID_SOLICITUD    = CCSG.ID_SOLICITUD ' + coCRLF;

   If (iCredito > 0 ) Then
      sSQL:= sSQL + '   AND PP.ID_CREDITO ='+ IntToStr(iCredito)+ coCRLF;
   If (iSolicitud > 0 ) Then
      sSQL:= sSQL + '   AND PP.ID_SOLICITUD='+ IntToStr(iSolicitud)+ coCRLF;

   sSQL:= sSQL +
   //DESTINOS
            'UNION ALL'+ coCRLF +
            'SELECT 3 AS GRUPO, DES.ID_CREDITO, DES.ID_SOLICITUD, 0, '' '', '' '', '' '', '' '', '' '', '' '', '' '','+ coCRLF +
            '       '' '', '' '', DES.ID_CREDITO, '' '', ''S'', ''S'' , 0,'+ coCRLF +
            '	     0, 0, 0, 0, '' '', 0, TRIM(TO_CHAR(SYSDATE,''YYYYMMDD'')) ,'+ coCRLF +
            '       TRIM(TO_CHAR(SYSDATE,''YYYYMMDD'')), '+ coCRLF +
            '       0,  '' '', 0, 0 , 0,  '' '',  '' '', '' '', '' '', '' '','+ coCRLF +
            '       0, '' '', 0, '' '', '' '', '' '', 0,'+ coCRLF +
            '       0, '' '', '' '','' '', '+ coCRLF +
            '	     DES.CVE_DESTINO, TRIM(TO_CHAR(DES.PCT_PARCIAL,''000'')) AS PCT_PARCIAL,'+ coCRLF +
            '       TRIM(TO_CHAR(DES.PCT_ORIGEN_NAL,''000'')) AS PCT_ORIGEN_NAL,'+ coCRLF +
            '       TRIM(TO_CHAR(DES.PCT_IMPORTACION,''000'')) AS PCT_IMPORTACION, '+ coCRLF +
            '       '' '' AS DESC_PROP, DEST.VALOR AS DESC_DESTINO, '' '' '+ coCRLF +
            '  FROM CR_CB_DESTINO DES, '+ coCRLF +
            '       CR_CB_SOL_GTIA CCSG, ' + coCRLF +
            '       (SELECT * FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE=''CVEREC'')DEST '+ coCRLF +
            ' WHERE DEST.CVE_REFERENCIA = DES.CVE_DESTINO '   + coCRLF +
            '   AND  DES.ID_CREDITO     = CCSG.ID_CREDITO '   + coCRLF +
            '   AND  DES.ID_SOLICITUD   = CCSG.ID_SOLICITUD ' + coCRLF;

   If (iCredito > 0 ) Then
      sSQL:= sSQL + '   AND DES.ID_CREDITO ='+ IntToStr(iCredito)+ coCRLF;
   If (iSolicitud > 0 ) Then
      sSQL:= sSQL + '   AND DES.ID_SOLICITUD='+ IntToStr(iSolicitud)+ coCRLF;

   sSQL:= sSQL +
            ')'+ coCRLF +
            'ORDER BY CVE_FINAN, GRUPO, ID_SOLICITUD,  CVE_PROPOSITO, CVE_DESTINO';
    Result:= sSQL;
End;

{   RepSolicitud( Objeto.ID_CREDITO.AsInteger, Objeto.ID_SOLICITUD.AsInteger,
                  Objeto.Apli, True);  }

procedure TQrRepSolNafin.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   qrGrupo0.Enabled:= True;
   QRGroupCredito.Enabled:= True;
   QRGroupSolicitud.Enabled:= True;
   qrGrupoGar.Enabled:= True;
   QRGroupCveGar.Enabled:= True;
   QRGroupCveGar2.Enabled:= True;
   qrGrupoProposito.Enabled:= True;
   QRGroupCveProp.Enabled:= True;
   QRGroupCveProp2.Enabled:= True;
   QRGroupDestino.Enabled:= True;
   QRGroupCveDestino.Enabled:= True;
   QRGroupCveDestino2.Enabled:= True;
end;

Procedure TQrRepSolNafin.ImprimeBanda;
Begin
   qrGrupo0.Enabled:= True;
   QRGroupCredito.Enabled:= True;
   QRGroupSolicitud.Enabled:= True;
   qrGrupoGar.Enabled:= True;
   QRGroupCveGar.Enabled:= True;
   QRGroupCveGar2.Enabled:= True;
   qrGrupoProposito.Enabled:= True;
   QRGroupCveProp.Enabled:= True;
   QRGroupCveProp2.Enabled:= True;
   QRGroupDestino.Enabled:= True;
   QRGroupCveDestino.Enabled:= True;
   QRGroupCveDestino2.Enabled:= True;

   If qySolicitud.FieldByName('GRUPO').AsInteger =0 Then Begin
      qrGrupoGar.Enabled:= False;
      QRGroupCveGar.Enabled:= False;
      QRGroupCveGar2.Enabled:= False;
      qrGrupoProposito.Enabled:= False;
      QRGroupCveProp.Enabled:= False;
      QRGroupCveProp2.Enabled:= False;
      QRGroupDestino.Enabled:= False;
      QRGroupCveDestino.Enabled:= False;
      QRGroupCveDestino2.Enabled:= False;
   End Else If qySolicitud.FieldByName('GRUPO').AsInteger =1 Then Begin
      qrGrupo0.Enabled:= False;
      QRGroupCredito.Enabled:= False;
      QRGroupSolicitud.Enabled:= False;
      qrGrupoProposito.Enabled:= False;
      QRGroupCveProp.Enabled:= False;
      QRGroupCveProp2.Enabled:= False;
      QRGroupDestino.Enabled:= False;
      QRGroupCveDestino.Enabled:= False;
      QRGroupCveDestino2.Enabled:= False;
   End Else If qySolicitud.FieldByName('GRUPO').AsInteger =2 Then Begin
      qrGrupo0.Enabled:= False;
      QRGroupCredito.Enabled:= False;
      QRGroupSolicitud.Enabled:= False;
      qrGrupoGar.Enabled:= False;
      QRGroupCveGar.Enabled:= False;
      QRGroupCveGar2.Enabled:= False;
      QRGroupDestino.Enabled:= False;
      QRGroupCveDestino.Enabled:= False;
      QRGroupCveDestino2.Enabled:= False;
   End Else If qySolicitud.FieldByName('GRUPO').AsInteger =3 Then Begin
      qrGrupo0.Enabled:= False;
      QRGroupCredito.Enabled:= False;
      QRGroupSolicitud.Enabled:= False;
      qrGrupoGar.Enabled:= False;
      QRGroupCveGar.Enabled:= False;
      QRGroupCveGar2.Enabled:= False;
      qrGrupoProposito.Enabled:= False;
      QRGroupCveProp.Enabled:= False;
      QRGroupCveProp2.Enabled:= False;
   End;
End;

{
   RepSolicitud( Objeto.ID_CREDITO.AsInteger, Objeto.ID_SOLICITUD.AsInteger,
                  Objeto.Apli, True);
}
End.
