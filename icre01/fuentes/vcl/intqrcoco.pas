unit IntQrCoCo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead, UnSQL2,

  
  InterApl,
  IntQRPreview, Db, DBTables

  ;

type
  TQrCompCOINCRE = class(TQuickRep)
    QRBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qCompCOIN: TQuery;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRBand3: TQRBand;
    QRFGrupoCuenProd: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qCompCOINORIGEN: TStringField;
    qCompCOINTIPO_CUENTA: TStringField;
    qCompCOINSEGMENTO: TStringField;
    qCompCOINSDO_FIN_PER: TFloatField;
    qCompCOINSDO_COINCRE: TFloatField;
    qCompCOINCVE_CTA_CONTABLE: TStringField;
    qCompCOINNOMBRE_PROD: TStringField;
    qCompCOINID_METRICA: TFloatField;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRFGrupoSegmento: TQRBand;
    QRShape8: TQRShape;
    QRLabel6: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel7: TQRLabel;
    QRExpr7: TQRExpr;
    QRShape9: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    qCompCOINMONEDA: TStringField;
    QRShape6: TQRShape;
    QRShape5: TQRShape;
    QRShape10: TQRShape;
    QRShape7: TQRShape;
    QRShape11: TQRShape;
    QRDBText8: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFGrupoCuenProdBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
      VLBPintaTotalProd : Boolean;
  public
       Apli : TInterApli;
       Function DameFechaDWHC(PEMes,PEAnio : Integer): Integer;
       Function ArmaQuery(PEMes,PEAnio : Integer; PETipoCar : String; PETipoRep : String): String;
  end;

var
  QrCompCOINCRE: TQrCompCOINCRE;

Procedure RepCompCoincre(PEMes,PEAnio : Integer;
                         PEMesTxt : String;
                         PETipoCar : String;
                         pAPli     : TInterApli;
                         pPreview  : Boolean;
                         PETipoRep : String);

implementation

{$R *.DFM}

Procedure RepCompCoincre(PEMes,PEAnio : Integer;
                         PEMesTxt : String;
                         PETipoCar : String;
                         pAPli     : TInterApli;
                         pPreview  : Boolean;
                         PETipoRep : String);
Var
   QrCompCOINCRE: TQrCompCOINCRE;
   Preview     : TIntQRPreview;
begin
   QrCompCOINCRE:=TQrCompCOINCRE.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrCompCOINCRE);
   Try
      QrCompCOINCRE.Apli := pApli;
      QrCompCOINCRE.QRInterEncabezado1.Apli:=pApli;
      QrCompCOINCRE.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrCompCOINCRE.QRInterEncabezado1.NomReporte:='IntQrCoCo';
      if PETipoRep = 'ME' then
          QrCompCOINCRE.QRInterEncabezado1.Titulo1 := 'COINCRE - CONTA ' + '(MENSUAL)';
      //end if
      if PETipoRep = 'DI' then
          QrCompCOINCRE.QRInterEncabezado1.Titulo1 := 'OPERATIVO - CONTA ' + '(DIARIO)';
      //end if
      if PETipoRep = 'DM' then
          QrCompCOINCRE.QRInterEncabezado1.Titulo1 := 'OPERATIVO - CONTA ' + '(DIARIO FIN DE MES)';
      //end if
      if PETipoRep = 'ME' then
         QrCompCOINCRE.QRInterEncabezado1.Titulo2 := 'Periodo: ' +  PEMesTxt +  ' del ' + IntToStr(PEAnio);
      //end if
      if PETipoRep = 'DI' then
         QrCompCOINCRE.QRInterEncabezado1.Titulo2 := 'Del día: ' + FormatDateTime('dd/mm/yyyy',pAPli.DameFechaEmpresa);
      //end if
      if PETipoRep = 'DM' then
         QrCompCOINCRE.QRInterEncabezado1.Titulo2 := 'Periodo: ' +  PEMesTxt +  ' del ' + IntToStr(PEAnio);
      //end if

      QrCompCOINCRE.qCompCOIN.Active:=False;
      //<LOLS 10 MAR 2006. SE ASIGNA PARAMETROS DEL APLI>
      QrCompCOINCRE.qCompCOIN.DatabaseName := pAPli.DataBaseName;
      QrCompCOINCRE.qCompCOIN.SessionName  := pAPli.SessionName;
      //</LOLS>

      QrCompCOINCRE.qCompCOIN.SQL.Text:= QrCompCOINCRE.ArmaQuery(PEMes,PEAnio,PETipoCar,PETipoRep);
//      QrCompCOINCRE.qCompCOIN.SQL.SaveToFile('c:\COINCRE.TXT');
      QrCompCOINCRE.qCompCOIN.Active:=True;

      If pPreview Then
         QrCompCOINCRE.Preview
      Else
         QrCompCOINCRE.Print;
      //end if

   Finally
      QrCompCOINCRE.free;
      If Assigned(Preview) Then Preview.Free;
   End;

end;



Function TQrCompCOINCRE.DameFechaDWHC(PEMes,PEAnio : Integer): Integer;
var vlQry : TQuery;
    vlsql : String;
    VLSalida : Integer;
begin
     VLSalida := 0;
     vlsql:= ' SELECT ID_ANIO_MES ' +
             ' FROM   DM_CR_DIM_Mes@dwhc ' +
             ' WHERE ANIO  = ' + IntToStr(PEAnio) +
             '   AND NUM_MES  = ' + IntToStr(PEMes);

     vlQry := GetSQLQuery(vlsql,Apli.DataBaseName, Apli.SessionName, True );
     try
        if vlQry <> nil then
        Begin
             VLSalida := vlQry.FieldByName('ID_ANIO_MES').AsInteger;
        end
        else
        Begin
             VLSalida := 0;
        end;
     finally
       if vlQry <> nil then
          vlQry.free;
       //end if
     end;
//     VLSalida := 225;
     DameFechaDWHC := VLSalida;
end;


Function    TQrCompCOINCRE.ArmaQuery(PEMes,PEAnio : Integer; PETipoCar : String; PETipoRep : String): String;
var
     VlSalida  : String;
     VLFDWHC   : Integer;
     VLFechaD  : String;
begin
     //MENSUAL
     if PETipoRep = 'ME' then
     begin
           VLFDWHC := DameFechaDWHC(PEMes,PEAnio);

           VlSalida :=
              ' SELECT * FROM ( ';
              if ((PETipoCar = 'CA') or (PETipoCar = 'NA')) then
              begin
                  VlSalida :=  VlSalida +
                  //CAPITAL
                  //CONTA CAPITAL VIGENTE B1 (A 16 DIGITOS)
                  '         select  DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' )AS MONEDA,'+
                                     #39+'CONTA'+#39+' AS ORIGEN, '+#39+'CAPITAL'+#39+' AS TIPO_CUENTA, '+#39+'VIGENTE'+#39+' AS SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD, METRICA.ID_METRICA ' +
                  '         from    cg_periodo_cta@cont PCTA, ' +
                  '                (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 4 and SIT_RELACION = '+#39+'B1'+#39+' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA ' +
                  '         where   id_empresa = ' + IntToStr(Apli.IdEmpresa) +
                  '         and     CVE_EJER_CONT = ' + IntToStr(PEAnio) +
                  '         and     CVE_MONEDA = 484 ' +
                  '         and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) = METRICA.CVE_CTA_CONTABLE' +
                  '         and     length(PCTA.CVE_CTA_CONTABLE) = 16' +
                  '         and     ((substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'100'+#39+ ') or (' + 'substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'201'+#39+ '))' +
                  '         and     NUM_PERIODOC = ' + IntToStr(PEMes) +
                  '         GROUP BY DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' ), SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA' +
                  '         union all' +
                  //CONTA CAPITAL VIGENTE B2 (A 12 DIGITOS - COMPLEMENTO)
                  '         select '+#39+'PESO MEXICANO'+#39+' AS MONEDA,'+#39+'CONTA'+#39+' AS ORIGEN, '+#39+'CAPITAL'+#39+' AS TIPO_CUENTA, '+#39+'VIGENTE'+#39+' AS SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD, METRICA.ID_METRICA' +
                  '         from    cg_periodo_cta@cont PCTA,' +
                  '                (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 4 and SIT_RELACION = '+#39+'B2'+#39+' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA' +
                  '         where   id_empresa = ' + IntToStr(Apli.IdEmpresa) +
                  '         and     CVE_EJER_CONT = ' + IntToStr(PEAnio) +
                  '         and     CVE_MONEDA = 484' +
                  '         and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) = METRICA.CVE_CTA_CONTABLE' +
                  '         and     length(PCTA.CVE_CTA_CONTABLE) = 12' +
                  '         and     NUM_PERIODOC = ' + IntToStr(PEMes) +
                  '         GROUP BY SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA' +
                  '         UNION ALL' +
                  //CONTA CAPITAL VIGENTE B3 (A 4 DIGITOS - COMPLEMENTO)
                  '         select '+#39+'PESO MEXICANO'+#39+' AS MONEDA,'+#39+'CONTA'+#39+' AS ORIGEN, '+#39+'CAPITAL'+#39+' AS TIPO_CUENTA, '+#39+'VIGENTE'+#39+' AS SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(PCTA.CVE_CTA_CONTABLE,1,4) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD, METRICA.ID_METRICA' +
                  '         from    cg_periodo_cta@cont PCTA,' +
                  '                (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 4 and SIT_RELACION = '+#39+'B3'+#39+' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA' +
                  '         where   id_empresa = ' + IntToStr(Apli.IdEmpresa) +
                  '         and     CVE_EJER_CONT = ' + IntToStr(PEAnio) +
                  '         and     CVE_MONEDA = 484' +
                  '         and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,4) = METRICA.CVE_CTA_CONTABLE' +
                  '         and     length(PCTA.CVE_CTA_CONTABLE) = 4' +
                  '         and     NUM_PERIODOC = ' + IntToStr(PEMes) +
                  '         GROUP BY SUBSTR(PCTA.CVE_CTA_CONTABLE,1,4), METRICA.ID_METRICA' +
                  '         UNION ALL' +
                  //COINCRE CAPITAL VIGENTE
                  '        SELECT DimCre.MONEDA AS MONEDA,'+#39+'COINCRE'+#39+' AS ORIGEN, '+#39+'CAPITAL'+#39+' AS TIPO_CUENTA, '+#39+'VIGENTE'+#39+' AS SEGMENTO,' +
                  '        0 AS SDO_FIN_PER, (SUM(Imp_Sdo_K_Vig)) as SDO_COINCRE,' +
                  '        DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO  AS NOMBRE_PROD,' +
                  '        METRICA.ID_METRICA' +
                  '        FROM  (SELECT * FROM DM_CR_FAC_Credito@dwhc FacCre WHERE FacCre.id_anio_mes = ' + InttoStr(VLFDWHC) + ') FacCre,' +
//                  '              (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE NOT(DimCre.ID_OLTP_PRODUCTO LIKE '+#39+'%N%'+#39+') AND DimCre.ID_OLTP_MONEDA <> 800 ) DimCre,' +
                  '              (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE DimCre.ID_OLTP_MONEDA <> 800 ) DimCre,' +
                  '               DM_CR_DIM_Mes@dwhc DimMes,' +
                  '              (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 4 GROUP BY ID_OLTP_PRODUCTO, ID_METRICA) METRICA' +
                  '        WHERE  FacCre.Id_Credito        = DimCre.Id_Credito' +
                  '        AND    FacCre.Id_Anio_Mes       = DimMes.Id_Anio_Mes' +
                  '        AND    METRICA.ID_OLTP_PRODUCTO (+)= DimCre.ID_OLTP_PRODUCTO' +
                  '        group by DimCre.MONEDA, DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO, METRICA.ID_METRICA' +
                  '        UNION ALL' +
                  //CONTA CAPITAL IMPAGADO
                  '         select  DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' )AS MONEDA,'+
                                     #39+'CONTA'+#39+' AS ORIGEN, '+#39+'CAPITAL'+#39+' AS TIPO_CUENTA, '+#39+'IMPAGADO'+#39+' AS SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD, METRICA.ID_METRICA' +
                  '         from    cg_periodo_cta@cont PCTA,' +
                  '                (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 16 and SIT_RELACION = '+#39+'B1'+#39+' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA' +
                  '         where   id_empresa = ' + IntToStr(Apli.IdEmpresa) +
                  '         and     CVE_EJER_CONT = ' + IntToStr(PEAnio) +
                  '         and     CVE_MONEDA = 484' +
                  '         and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) = METRICA.CVE_CTA_CONTABLE' +
                  '         and     length(PCTA.CVE_CTA_CONTABLE) = 16' +
                  '         and     ((substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'100'+#39+ ') or (' + 'substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'201'+#39+ '))' +
                  '         and     NUM_PERIODOC = ' + IntToStr(PEMes) +
                  '         GROUP BY DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' ), SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA' +
                  '         UNION ALL' +
                  //COINCRE CAPITAL IMPAGADO
                  '        SELECT DimCre.MONEDA AS MONEDA,'+#39+'COINCRE'+#39+' AS ORIGEN, '+#39+'CAPITAL'+#39+' AS TIPO_CUENTA, DECODE(DimCre.ID_OLTP_PRODUCTO,'+#39+'50'+#39+','+#39+'VIGENTE'+#39+','+#39+'IMPAGADO'+#39+') AS SEGMENTO,' +
                  '        0 AS SDO_FIN_PER,(SUM(Imp_Sdo_K_Imp)) as SDO_COINCRE,' +
                  '        DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO  AS NOMBRE_PROD,' +
                  '        DECODE(DimCre.ID_OLTP_PRODUCTO,'+#39+'50'+#39+',METRICA_50.ID_METRICA,METRICA.ID_METRICA) AS ID_METRICA' +
                  '        FROM  (SELECT * FROM DM_CR_FAC_Credito@dwhc FacCre WHERE FacCre.id_anio_mes = ' + InttoStr(VLFDWHC) + ') FacCre,' +
                  '              (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE  DimCre.ID_OLTP_MONEDA <> 800 ) DimCre,' +
                  '               DM_CR_DIM_Mes@dwhc DimMes,' +
                  '              (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 16 and SIT_RELACION = '+#39+'B1'+#39+' GROUP BY ID_OLTP_PRODUCTO, ID_METRICA) METRICA,' +
                  '              (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 4 and SIT_RELACION = '+#39+'B1'+#39+' GROUP BY ID_OLTP_PRODUCTO, ID_METRICA) METRICA_50' +
                  '        WHERE  FacCre.Id_Credito        = DimCre.Id_Credito' +
                  '        AND    FacCre.Id_Anio_Mes       = DimMes.Id_Anio_Mes' +
                  '        AND    METRICA.ID_OLTP_PRODUCTO (+)= DimCre.ID_OLTP_PRODUCTO' +
                  '        AND    METRICA_50.ID_OLTP_PRODUCTO (+)= DimCre.ID_OLTP_PRODUCTO' +
                  '        group by DimCre.MONEDA, DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO, DECODE(DimCre.ID_OLTP_PRODUCTO,'+#39+'50'+#39+',METRICA_50.ID_METRICA,METRICA.ID_METRICA)' +
                  '        UNION ALL'+
                  //CONTA CAPITAL VENCIDO
                  '         select  DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' )AS MONEDA,'+
                                       #39+'CONTA'+#39+' AS ORIGEN, '+#39+'CAPITAL'+#39+' AS TIPO_CUENTA, '+#39+'VENCIDO'+#39+' AS SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD, METRICA.ID_METRICA' +
                  '         from    cg_periodo_cta@cont PCTA,' +
                  '                (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 20 and SIT_RELACION = '+#39+'B1'+#39+' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA' +
                  '         where   id_empresa = ' + IntToStr(Apli.IdEmpresa) +
                  '         and     CVE_EJER_CONT = ' + IntToStr(PEAnio) +
                  '         and     CVE_MONEDA = 484' +
                  '         and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) = METRICA.CVE_CTA_CONTABLE' +
                  '         and     length(PCTA.CVE_CTA_CONTABLE) = 16' +
                  '         and     ((substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'100'+#39+ ') or (' + 'substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'201'+#39+ '))' +
                  '         and     NUM_PERIODOC = ' + IntToStr(PEMes) +
                  '         GROUP BY DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' ), SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA' +
                  '         UNION ALL'+
                  //COINCRE CAPITAL VENCIDO
                  '        SELECT DimCre.MONEDA AS MONEDA,'+#39+'COINCRE'+#39+' AS ORIGEN, '+#39+'CAPITAL'+#39+' AS TIPO_CUENTA, '+#39+'VENCIDO'+#39+' AS SEGMENTO,' +
                  '        0 AS SDO_FIN_PER,(SUM(Imp_Sdo_K_Ven)) as SDO_COINCRE,' +
                  '        DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO  AS NOMBRE_PROD,' +
                  '        METRICA.ID_METRICA' +
                  '        FROM  (SELECT * FROM DM_CR_FAC_Credito@dwhc FacCre WHERE FacCre.id_anio_mes = ' + InttoStr(VLFDWHC) + ') FacCre,' +
                  '              (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE  DimCre.ID_OLTP_MONEDA <> 800 ) DimCre,' +
                  '               DM_CR_DIM_Mes@dwhc DimMes,' +
                  '              (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 20 and SIT_RELACION = '+#39+'B1'+#39+' GROUP BY ID_OLTP_PRODUCTO, ID_METRICA) METRICA' +
                  '        WHERE  FacCre.Id_Credito        = DimCre.Id_Credito' +
                  '        AND    FacCre.Id_Anio_Mes       = DimMes.Id_Anio_Mes' +
                  '        AND    METRICA.ID_OLTP_PRODUCTO (+)= DimCre.ID_OLTP_PRODUCTO' +
                  '        group by DimCre.MONEDA,DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO, METRICA.ID_METRICA' +
                  '        UNION ALL';
              end;
              if ((PETipoCar = 'IN') or (PETipoCar = 'NA')) then
              begin
                  VlSalida :=  VlSalida +
                  //INTERES
                  //CONTA INTERES VIGENTE B1
                  '         select  DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' )AS MONEDA,'+
                                       #39+'CONTA'+#39+' AS ORIGEN, '+#39+'INTERES'+#39+' AS TIPO_CUENTA, '+#39+'VIGENTE'+#39+' AS SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD, METRICA.ID_METRICA' +
                  '         from    cg_periodo_cta@cont PCTA,' +
                  '                (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 30 and SIT_RELACION = '+#39+'B1'+#39+' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA' +
                  '         where   id_empresa = ' + IntToStr(Apli.IdEmpresa) +
                  '         and     CVE_EJER_CONT = ' + IntToStr(PEAnio) +
                  '         and     CVE_MONEDA = 484' +
                  '         and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) = METRICA.CVE_CTA_CONTABLE' +
                  '         and     length(PCTA.CVE_CTA_CONTABLE) = 16' +
                  '         and     ((substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'100'+#39+ ') or (' + 'substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'201'+#39+ '))' +
                  '         and     NUM_PERIODOC = ' + IntToStr(PEMes) +
                  '         GROUP BY DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' ),SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA' +
                  '         UNION ALL' +
                  //CONTA INTERES VIGENTE B2
                  '         select '+#39+'PESO MEXICANO'+#39+' AS MONEDA,'+#39+'CONTA'+#39+' AS ORIGEN, '+#39+'INTERES'+#39+' AS TIPO_CUENTA, '+#39+'VIGENTE'+#39+' AS SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD, METRICA.ID_METRICA' +
                  '         from    cg_periodo_cta@cont PCTA,' +
                  '                (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 30 and SIT_RELACION = '+#39+'B2'+#39+' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA' +
                  '         where   id_empresa = ' + IntToStr(Apli.IdEmpresa) +
                  '         and     CVE_EJER_CONT = ' + IntToStr(PEAnio) +
                  '         and     CVE_MONEDA = 484' +
                  '         and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) = METRICA.CVE_CTA_CONTABLE' +
                  '         and     length(PCTA.CVE_CTA_CONTABLE) = 10' +
                  '         and     NUM_PERIODOC = ' + IntToStr(PEMes) +
                  '         GROUP BY SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA' +
                  '         UNION ALL' +
                  //COINCRE INTERES VIGENTE
                  '        SELECT DimCre.MONEDA AS MONEDA,'+#39+'COINCRE'+#39+' AS ORIGEN, '+#39+'INTERES'+#39+' AS TIPO_CUENTA, '+#39+'VIGENTE'+#39+' AS SEGMENTO,' +
                  '        0 AS SDO_FIN_PER,(SUM(IMP_INT_CORTE)) as SDO_COINCRE,' +
                  '        DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO  AS NOMBRE_PROD,' +
                  '        METRICA.ID_METRICA' +
                  '        FROM  (SELECT * FROM DM_CR_FAC_Credito@dwhc FacCre WHERE FacCre.id_anio_mes = ' + InttoStr(VLFDWHC) + ') FacCre,' +
                  '              (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE DimCre.ID_OLTP_MONEDA <> 800 ) DimCre,' +
                  '               DM_CR_DIM_Mes@dwhc DimMes,' +
                  '              (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 30 GROUP BY ID_OLTP_PRODUCTO, ID_METRICA) METRICA' +
                  '        WHERE  FacCre.Id_Credito        = DimCre.Id_Credito' +
                  '        AND    FacCre.Id_Anio_Mes       = DimMes.Id_Anio_Mes' +
                  '        AND    METRICA.ID_OLTP_PRODUCTO (+)= DimCre.ID_OLTP_PRODUCTO' +
                  '        AND    DimCre.ID_OLTP_PRODUCTO NOT IN ('+#39+'50'+#39+','+#39+'001PPI'+#39+','+#39+'002PPI'+#39+')' +
                  '        group by DimCre.MONEDA, DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO, METRICA.ID_METRICA' +
                  '        UNION ALL'+
                  //CONTA INTERES IMPAGADO
                  '         select  DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' )AS MONEDA,'+
                                       #39+'CONTA'+#39+' AS ORIGEN, '+#39+'INTERES'+#39+' AS TIPO_CUENTA, '+#39+'IMPAGADO'+#39+' AS SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD, METRICA.ID_METRICA' +
                  '         from    cg_periodo_cta@cont PCTA,' +
                  '                (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 9 and SIT_RELACION = '+#39+'B1'+#39+' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA' +
                  '         where   id_empresa = ' + IntToStr(Apli.IdEmpresa) +
                  '         and     CVE_EJER_CONT = ' + IntToStr(PEAnio) +
                  '         and     CVE_MONEDA = 484' +
                  '         and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) = METRICA.CVE_CTA_CONTABLE' +
                  '         and     length(PCTA.CVE_CTA_CONTABLE) = 16' +
                  '         and     ((substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'100'+#39+ ') or (' + 'substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'201'+#39+ '))' +
                  '         and     NUM_PERIODOC = ' + IntToStr(PEMes) +
                  '         GROUP BY DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' ), SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA' +
                  '         UNION ALL' +
                  //COINCRE INTERES IMPAGADO
                  '        SELECT DimCre.MONEDA AS MONEDA,'+#39+'COINCRE'+#39+' AS ORIGEN, '+#39+'INTERES'+#39+' AS TIPO_CUENTA, '+#39+'IMPAGADO'+#39+' AS SEGMENTO,' +
                  '        0 AS SDO_FIN_PER,(SUM(Imp_Sdo_IO_Imp)) as SDO_COINCRE,' +
                  '        DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO  AS NOMBRE_PROD,' +
                  '        METRICA.ID_METRICA' +
                  '        FROM  (SELECT * FROM DM_CR_FAC_Credito@dwhc FacCre WHERE FacCre.id_anio_mes = ' + InttoStr(VLFDWHC) + ') FacCre,' +
                  '              (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE  DimCre.ID_OLTP_MONEDA <> 800 ) DimCre,' +
                  '               DM_CR_DIM_Mes@dwhc DimMes,' +
                  '              (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 9 and SIT_RELACION = '+#39+'B1'+#39+' GROUP BY ID_OLTP_PRODUCTO, ID_METRICA) METRICA' +
                  '        WHERE  FacCre.Id_Credito        = DimCre.Id_Credito' +
                  '        AND    FacCre.Id_Anio_Mes       = DimMes.Id_Anio_Mes' +
                  '        AND    METRICA.ID_OLTP_PRODUCTO (+)= DimCre.ID_OLTP_PRODUCTO' +
                  '        AND    DimCre.ID_OLTP_PRODUCTO NOT IN ('+#39+'50'+#39+','+#39+'001PPI'+#39+','+#39+'002PPI'+#39+')' +
                  '        group by DimCre.MONEDA, DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO, METRICA.ID_METRICA'+
                  '        UNION ALL'+
                  //CONTA INTERES VENCIDO B1
                  '         select  DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' )AS MONEDA,'+
                                       #39+'CONTA'+#39+' AS ORIGEN, '+#39+'INTERES'+#39+' AS TIPO_CUENTA, '+#39+'VENCIDO'+#39+' AS SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD, METRICA.ID_METRICA' +
                  '         from    cg_periodo_cta@cont PCTA,' +
                  '                (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 31 and SIT_RELACION = '+#39+'B1'+#39+' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA' +
                  '         where   id_empresa = ' + IntToStr(Apli.IdEmpresa) +
                  '         and     CVE_EJER_CONT = ' + IntToStr(PEAnio) +
                  '         and     CVE_MONEDA = 484' +
                  '         and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) = METRICA.CVE_CTA_CONTABLE' +
                  '         and     length(PCTA.CVE_CTA_CONTABLE) = 16' +
                  '         and     ((substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'100'+#39+ ') or (' + 'substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'201'+#39+ '))' +
                  '         and     NUM_PERIODOC = ' + IntToStr(PEMes) +
                  '         GROUP BY DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' ), SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA' +
                  '         UNION ALL' +
                  //CONTA INTERES VENCIDO B3
                  '         select '+#39+'PESO MEXICANO'+#39+' AS MONEDA,'+#39+'CONTA'+#39+' AS ORIGEN, '+#39+'INTERES'+#39+' AS TIPO_CUENTA, '+#39+'VENCIDO'+#39+' AS SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD, METRICA.ID_METRICA' +
                  '         from    cg_periodo_cta@cont PCTA,' +
                  '                (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 31 and SIT_RELACION = '+#39+'B3'+#39+' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA' +
                  '         where   id_empresa = ' + IntToStr(Apli.IdEmpresa) +
                  '         and     CVE_EJER_CONT = ' + IntToStr(PEAnio) +
                  '         and     CVE_MONEDA = 484' +
                  '         and     PCTA.CVE_CTA_CONTABLE = METRICA.CVE_CTA_CONTABLE' +
                  '         and     NUM_PERIODOC = ' + IntToStr(PEMes) +
                  '         GROUP BY SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA' +
                  '         UNION ALL' +
                  //COINCRE INTERES VENCIDO
                  '        SELECT DimCre.MONEDA AS MONEDA, '+#39+'COINCRE'+#39+' AS ORIGEN, '+#39+'INTERES'+#39+' AS TIPO_CUENTA, '+#39+'VENCIDO'+#39+' AS SEGMENTO,' +
                  '        0 AS SDO_FIN_PER,(SUM(IMP_INT_DEV_VDO)) as SDO_COINCRE,' +
                  '        DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO  AS NOMBRE_PROD,' +
                  '        METRICA.ID_METRICA' +
                  '        FROM  (SELECT * FROM DM_CR_FAC_Credito@dwhc FacCre WHERE FacCre.id_anio_mes = ' + InttoStr(VLFDWHC) + ') FacCre,' +
                  '              (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE  DimCre.ID_OLTP_MONEDA <> 800 ) DimCre,' +
                  '               DM_CR_DIM_Mes@dwhc DimMes,' +
                  '              (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 31 GROUP BY ID_OLTP_PRODUCTO, ID_METRICA) METRICA' +
                  '        WHERE  FacCre.Id_Credito        = DimCre.Id_Credito' +
                  '        AND    FacCre.Id_Anio_Mes       = DimMes.Id_Anio_Mes' +
                  '        AND    METRICA.ID_OLTP_PRODUCTO (+)= DimCre.ID_OLTP_PRODUCTO'+
                  '        group by DimCre.MONEDA, DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO, METRICA.ID_METRICA';
                  //COINCRE INTERESES COBRADOS POR ANTICIPADO
                  VlSalida :=  VlSalida +
                  '        UNION ALL ' +
                  '        SELECT DimCre.MONEDA AS MONEDA,'+#39+'COINCRE'+#39+' AS ORIGEN, '+#39+'INTERES'+#39+' AS TIPO_CUENTA, '+#39+'COB_ANT'+#39+' AS SEGMENTO,' +
                  '        0 AS SDO_FIN_PER,(SUM(IMP_INT_COB_ANT)) as SDO_COINCRE,' +
                  '        DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO  AS NOMBRE_PROD,' +
                  '        METRICA.ID_METRICA' +
                  '        FROM  (SELECT * FROM DM_CR_FAC_Credito@dwhc FacCre WHERE FacCre.id_anio_mes = ' + InttoStr(VLFDWHC) + ') FacCre,' +
                  '              (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE  DimCre.ID_OLTP_MONEDA <> 800 ) DimCre,' +
                  '               DM_CR_DIM_Mes@dwhc DimMes,' +
                  '              (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 32 GROUP BY ID_OLTP_PRODUCTO, ID_METRICA) METRICA' +
                  '        WHERE  FacCre.Id_Credito        = DimCre.Id_Credito' +
                  '        AND    FacCre.Id_Anio_Mes       = DimMes.Id_Anio_Mes' +
                  '        AND    METRICA.ID_OLTP_PRODUCTO (+)= DimCre.ID_OLTP_PRODUCTO' +
                  '        group by DimCre.MONEDA, DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO, METRICA.ID_METRICA'+
                  //CONTA INTERESES COBRADOS POR ANTICIPADO B1
                  '         UNION ALL ' +
                  '         select  DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' )AS MONEDA,'+
                                       #39+'CONTA'+#39+' AS ORIGEN, '+#39+'INTERES'+#39+' AS TIPO_CUENTA, '+#39+'COB_ANT'+#39+' AS SEGMENTO, sum(SDO_FIN_PER * -1) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD, METRICA.ID_METRICA' +
                  '         from    cg_periodo_cta@cont PCTA,' +
                  '                (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 32 and SIT_RELACION = '+#39+'B1'+#39+' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA' +
                  '         where   id_empresa = ' + IntToStr(Apli.IdEmpresa) +
                  '         and     CVE_EJER_CONT = ' + IntToStr(PEAnio) +
                  '         and     CVE_MONEDA = 484' +
                  '         and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) = METRICA.CVE_CTA_CONTABLE' +
                  '         and     length(PCTA.CVE_CTA_CONTABLE) = 16' +
                  '         and     ((substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'100'+#39+ ') or (' + 'substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'201'+#39+ '))' +
                  '         and     NUM_PERIODOC = ' + IntToStr(PEMes) +
                  '         GROUP BY DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' ), SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA';

              end;
              VlSalida :=  VlSalida +
              //GRUPOS
              '        ) ORDER BY' +
              '        MONEDA,' +
              '        TIPO_CUENTA,' +
              '        SEGMENTO,' +
              '        ID_METRICA,' +
              '        ORIGEN,' +
              '        CVE_CTA_CONTABLE';
     end;

     //DIARIO Y DIARIO MENSUAL
     if ((PETipoRep = 'DI') OR (PETipoRep = 'DM'))  then
     begin

           VLFDWHC := DameFechaDWHC(PEMes,PEAnio);

           if (PETipoRep = 'DI') then
              VLFechaD := 'TRUNC(SYSDATE - 1)';
           //end if
           if (PETipoRep = 'DM') then
           begin
              VLFechaD := 'LAST_DAY(TO_DATE('+#39+'01'+#39+'||TO_CHAR('+IntToStr(peMes)+','+#39+'00'+#39+')||TO_CHAR('+IntToStr(peAnio)+','+#39+'0000'+#39+'),'+#39+'DDMMYYYY'+#39+'))';
           end;

           VlSalida :=
              ' SELECT * FROM ( ';
              if ((PETipoCar = 'CA') or (PETipoCar = 'NA')) then
              begin
                  VlSalida :=  VlSalida +
                  ///////////////////////////////////////////////////////
                  ////////////////C O N T A B L E ///////////////////////
                  ///////////////////////////////////////////////////////
                  //CAPITAL
                  //CONTA CAPITAL VIGENTE B1 (A 16 DIGITOS)
                  '         select  DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' )AS MONEDA,'+
                                     #39+'CONTA'+#39+' AS ORIGEN, '+#39+'CAPITAL'+#39+' AS TIPO_CUENTA, '+#39+'VIGENTE'+#39+' AS SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD, METRICA.ID_METRICA ' +
                  '         from    cg_periodo_cta@cont PCTA, ' +
                  '                (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 4 and SIT_RELACION = '+#39+'B1'+#39+' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA ' +
                  '         where   id_empresa = ' + IntToStr(Apli.IdEmpresa) +
                  '         and     CVE_EJER_CONT = ' + IntToStr(PEAnio) +
                  '         and     CVE_MONEDA = 484 ' +
                  '         and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) = METRICA.CVE_CTA_CONTABLE' +
                  '         and     length(PCTA.CVE_CTA_CONTABLE) = 16' +
                  '         and     ((substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'100'+#39+ ') or (' + 'substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'201'+#39+ '))' +
                  '         and     NUM_PERIODOC = ' + IntToStr(PEMes) +
                  '         GROUP BY DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' ), SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA' +
                  '         union all' +
                  //CONTA CAPITAL VIGENTE B2 (A 12 DIGITOS - COMPLEMENTO)
                  '         select '+#39+'PESO MEXICANO'+#39+' AS MONEDA,'+#39+'CONTA'+#39+' AS ORIGEN, '+#39+'CAPITAL'+#39+' AS TIPO_CUENTA, '+#39+'VIGENTE'+#39+' AS SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD, METRICA.ID_METRICA' +
                  '         from    cg_periodo_cta@cont PCTA,' +
                  '                (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 4 and SIT_RELACION = '+#39+'B2'+#39+' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA' +
                  '         where   id_empresa = ' + IntToStr(Apli.IdEmpresa) +
                  '         and     CVE_EJER_CONT = ' + IntToStr(PEAnio) +
                  '         and     CVE_MONEDA = 484' +
                  '         and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) = METRICA.CVE_CTA_CONTABLE' +
                  '         and     length(PCTA.CVE_CTA_CONTABLE) = 12' +
                  '         and     NUM_PERIODOC = ' + IntToStr(PEMes) +
                  '         GROUP BY SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA' +
                  '         UNION ALL' +
                  //CONTA CAPITAL VIGENTE B3 (A 4 DIGITOS - COMPLEMENTO)
                  '         select '+#39+'PESO MEXICANO'+#39+' AS MONEDA,'+#39+'CONTA'+#39+' AS ORIGEN, '+#39+'CAPITAL'+#39+' AS TIPO_CUENTA, '+#39+'VIGENTE'+#39+' AS SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD, METRICA.ID_METRICA' +
                  '         from    cg_periodo_cta@cont PCTA,' +
                  '                (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 4 and SIT_RELACION = '+#39+'B3'+#39+' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA' +
                  '         where   id_empresa = ' + IntToStr(Apli.IdEmpresa) +
                  '         and     CVE_EJER_CONT = ' + IntToStr(PEAnio) +
                  '         and     CVE_MONEDA = 484' +
                  '         and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,4) = METRICA.CVE_CTA_CONTABLE' +
                  '         and     length(PCTA.CVE_CTA_CONTABLE) = 4' +
                  '         and     NUM_PERIODOC = ' + IntToStr(PEMes) +
                  '         GROUP BY SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA' +
                  '         UNION ALL' +
                   //CONTA CAPITAL IMPAGADO
                  '         select DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' )AS MONEDA,'
                                    +#39+'CONTA'+#39+' AS ORIGEN, '+#39+'CAPITAL'+#39+' AS TIPO_CUENTA, '+#39+'IMPAGADO'+#39+' AS SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD, METRICA.ID_METRICA' +
                  '         from    cg_periodo_cta@cont PCTA,' +
                  '                (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 16 and SIT_RELACION = '+#39+'B1'+#39+' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA' +
                  '         where   id_empresa = ' + IntToStr(Apli.IdEmpresa) +
                  '         and     CVE_EJER_CONT = ' + IntToStr(PEAnio) +
                  '         and     CVE_MONEDA = 484' +
                  '         and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) = METRICA.CVE_CTA_CONTABLE' +
                  '         and     ((substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'100'+#39+ ') or (' + 'substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'201'+#39+ '))' +
                  '         and     length(PCTA.CVE_CTA_CONTABLE) = 16' +
                  '         and     NUM_PERIODOC = ' + IntToStr(PEMes) +
                  '         GROUP BY DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' ), SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA' +
                  '         UNION ALL' +
                  //CONTA CAPITAL VENCIDO
                  '         select DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' )AS MONEDA,'
                                    +#39+'CONTA'+#39+' AS ORIGEN, '+#39+'CAPITAL'+#39+' AS TIPO_CUENTA, '+#39+'VENCIDO'+#39+' AS SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD, METRICA.ID_METRICA' +
                  '         from    cg_periodo_cta@cont PCTA,' +
                  '                (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 20 and SIT_RELACION = '+#39+'B1'+#39+' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA' +
                  '         where   id_empresa = ' + IntToStr(Apli.IdEmpresa) +
                  '         and     CVE_EJER_CONT = ' + IntToStr(PEAnio) +
                  '         and     CVE_MONEDA = 484' +
                  '         and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) = METRICA.CVE_CTA_CONTABLE' +
                  '         and     ((substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'100'+#39+ ') or (' + 'substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'201'+#39+ '))' +
                  '         and     length(PCTA.CVE_CTA_CONTABLE) = 16' +
                  '         and     NUM_PERIODOC = ' + IntToStr(PEMes) +
                  '         GROUP BY DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' ), SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA' +
                  '         UNION ALL'+
                  //CONTA INTERES VIGENTE B1
                  '         select DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' )AS MONEDA,'
                                    +#39+'CONTA'+#39+' AS ORIGEN, '+#39+'INTERES'+#39+' AS TIPO_CUENTA, '+#39+'VIGENTE'+#39+' AS SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD, METRICA.ID_METRICA' +
                  '         from    cg_periodo_cta@cont PCTA,' +
                  '                (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 30 and SIT_RELACION = '+#39+'B1'+#39+' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA' +
                  '         where   id_empresa = ' + IntToStr(Apli.IdEmpresa) +
                  '         and     CVE_EJER_CONT = ' + IntToStr(PEAnio) +
                  '         and     CVE_MONEDA = 484' +
                  '         and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) = METRICA.CVE_CTA_CONTABLE' +
                  '         and     ((substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'100'+#39+ ') or (' + 'substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'201'+#39+ '))' +
                  '         and     length(PCTA.CVE_CTA_CONTABLE) = 16' +
                  '         and     NUM_PERIODOC = ' + IntToStr(PEMes) +
                  '         GROUP BY DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' ), SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA' +
                  '         UNION ALL' +
                  //CONTA INTERES VIGENTE B2
                  '         select DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' )AS MONEDA,'
                                    +#39+'CONTA'+#39+' AS ORIGEN, '+#39+'INTERES'+#39+' AS TIPO_CUENTA, '+#39+'VIGENTE'+#39+' AS SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD, METRICA.ID_METRICA' +
                  '         from    cg_periodo_cta@cont PCTA,' +
                  '                (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 30 and SIT_RELACION = '+#39+'B2'+#39+' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA' +
                  '         where   id_empresa = ' + IntToStr(Apli.IdEmpresa) +
                  '         and     CVE_EJER_CONT = ' + IntToStr(PEAnio) +
                  '         and     CVE_MONEDA = 484' +
                  '         and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) = METRICA.CVE_CTA_CONTABLE' +
                  '         and     ((substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'100'+#39+ ') or (' + 'substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'201'+#39+ '))' +
                  '         and     length(PCTA.CVE_CTA_CONTABLE) = 10' +
                  '         and     NUM_PERIODOC = ' + IntToStr(PEMes) +
                  '         GROUP BY DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' ), SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA' +
                  '         UNION ALL' +
                  //CONTA INTERES IMPAGADO
                  '         select  DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' )AS MONEDA,'+
                                     #39+'CONTA'+#39+' AS ORIGEN, '+#39+'INTERES'+#39+' AS TIPO_CUENTA, '+#39+'IMPAGADO'+#39+' AS SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD, METRICA.ID_METRICA' +
                  '         from    cg_periodo_cta@cont PCTA,' +
                  '                (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 9 and SIT_RELACION = '+#39+'B1'+#39+' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA' +
                  '         where   id_empresa = ' + IntToStr(Apli.IdEmpresa) +
                  '         and     CVE_EJER_CONT = ' + IntToStr(PEAnio) +
                  '         and     CVE_MONEDA = 484' +
                  '         and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) = METRICA.CVE_CTA_CONTABLE' +
                  '         and     ((substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'100'+#39+ ') or (' + 'substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'201'+#39+ '))' +
                  '         and     length(PCTA.CVE_CTA_CONTABLE) = 16' +
                  '         and     NUM_PERIODOC = ' + IntToStr(PEMes) +
                  '         GROUP BY DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' ), SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA' +
                  '         UNION ALL' +
                  //CONTA INTERES VENCIDO B1
                  '         select  DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' )AS MONEDA,'+
                                       #39+'CONTA'+#39+' AS ORIGEN, '+#39+'INTERES'+#39+' AS TIPO_CUENTA, '+#39+'VENCIDO'+#39+' AS SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD, METRICA.ID_METRICA' +
                  '         from    cg_periodo_cta@cont PCTA,' +
                  '                (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 31 and SIT_RELACION = '+#39+'B1'+#39+' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA' +
                  '         where   id_empresa = ' + IntToStr(Apli.IdEmpresa) +
                  '         and     CVE_EJER_CONT = ' + IntToStr(PEAnio) +
                  '         and     CVE_MONEDA = 484' +
                  '         and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) = METRICA.CVE_CTA_CONTABLE' +
                  '         and     ((substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'100'+#39+ ') or (' + 'substr(PCTA.CVE_CTA_CONTABLE,14,3) = '+#39+'201'+#39+ '))' +
                  '         and     length(PCTA.CVE_CTA_CONTABLE) = 16' +
                  '         and     NUM_PERIODOC = ' + IntToStr(PEMes) +
                  '         GROUP BY DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),'+#39+'100'+#39+ ','+#39+'PESO MEXICANO'+#39+','+#39+'DOLAR AMERICANO'+#39+' ), SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA' +
                  '         UNION ALL' +
                  //CONTA INTERES VENCIDO B3
                  '         select '+#39+'PESO MEXICANO'+#39+' AS MONEDA,'+#39+'CONTA'+#39+' AS ORIGEN, '+#39+'INTERES'+#39+' AS TIPO_CUENTA, '+#39+'VENCIDO'+#39+' AS SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD, METRICA.ID_METRICA' +
                  '         from    cg_periodo_cta@cont PCTA,' +
                  '                (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 31 and SIT_RELACION = '+#39+'B3'+#39+' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA' +
                  '         where   id_empresa = ' + IntToStr(Apli.IdEmpresa) +
                  '         and     CVE_EJER_CONT = ' + IntToStr(PEAnio) +
                  '         and     CVE_MONEDA = 484' +
                  '         and     PCTA.CVE_CTA_CONTABLE = METRICA.CVE_CTA_CONTABLE' +
                  '         and     NUM_PERIODOC = ' + IntToStr(PEMes) +
                  '         GROUP BY SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA' +
                  '         UNION ALL' +

                  ///////////////////////////////////////////////////////
                  ////////////////OPERATIVO COINCRE//////////////////////
                  ///////////////////////////////////////////////////////

                  //COINCRE CAPITAL VIGENTE
                  '         SELECT CONS.CVE_MONEDA AS MONEDA,'+#39+'COINCRE'+#39+' AS ORIGEN, '+#39+'CAPITAL'+#39+' AS TIPO_CUENTA, '+#39+'VIGENTE'+#39+' AS SEGMENTO,' +
                  '         0 AS SDO_FIN_PER, (SUM(CONS.IMP_CAP_VIG)) as SDO_COINCRE, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD,  METRICA.ID_METRICA' +
                  '         FROM  (SELECT NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA, CR_SDO.IMP_CAP_VIG,' +
                  '                       NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,' +
                  '                       NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO' +
                  '                FROM  (SELECT ID_CREDITO, IMP_CAP_VIG FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) = ' + VLFechaD + ') CR_SDO,' +
                  '                       MONEDA MO, MONEDA MOE, CR_CREDITO  CC,    CR_CONTRATO CCO,      CR_PRODUCTO CP,' +
                  '                       CRE_CREDITO  CCE,      CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB, CONTRATO C' +
                  '                WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO' +
                  '                AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE' +
                  '                AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA' +
                  '                AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO' +
                  '                AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO' +
                  '                AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA) CONS,' +
                  '               (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 4 GROUP BY ID_OLTP_PRODUCTO, ID_METRICA) METRICA' +
                  '         WHERE  METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE' +
                  '         AND    CONS.CVE_MONEDA <> '+#39+'UDIS'+#39+
                  '         group by CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, METRICA.ID_METRICA'+
                  '         UNION ALL' +
                  //COINCRE CAPITAL IMPAGADO
                  '         SELECT CONS.CVE_MONEDA AS MONEDA,'+#39+'COINCRE'+#39+' AS ORIGEN, '+#39+'CAPITAL'+#39+' AS TIPO_CUENTA, '+#39+'IMPAGADO'+#39+' AS SEGMENTO,' +
                  '         0 AS SDO_FIN_PER, (SUM(CONS.IMP_CAP_IMP)) as SDO_COINCRE, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD,  METRICA.ID_METRICA' +
                  '         FROM  (SELECT NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA, CR_SDO.IMP_CAP_IMP,' +
                  '                       NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,' +
                  '                       NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO' +
                  '                FROM  (SELECT ID_CREDITO, IMP_CAP_IMP FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) = ' + VLFechaD + ') CR_SDO,' +
                  '                       MONEDA MO, MONEDA MOE, CR_CREDITO  CC,    CR_CONTRATO CCO,      CR_PRODUCTO CP,' +
                  '                       CRE_CREDITO  CCE,      CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB, CONTRATO C' +
                  '                WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO' +
                  '                AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE' +
                  '                AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA' +
                  '                AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO' +
                  '                AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO' +
                  '                AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA) CONS,' +
                  '               (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 16 GROUP BY ID_OLTP_PRODUCTO, ID_METRICA) METRICA' +
                  '         WHERE  METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE' +
                  '         AND    CONS.CVE_MONEDA <> '+#39+'UDIS'+#39+
                  '         group by CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, METRICA.ID_METRICA' +
                  '         UNION ALL' +
                  //COINCRE CAPITAL VENCIDO
                  '         SELECT CONS.CVE_MONEDA AS MONEDA,'+#39+'COINCRE'+#39+' AS ORIGEN, '+#39+'CAPITAL'+#39+' AS TIPO_CUENTA, '+#39+'VENCIDO'+#39+' AS SEGMENTO,' +
                  '         0 AS SDO_FIN_PER, (SUM(CONS.IMP_CAP_VDO)) as SDO_COINCRE, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD,  METRICA.ID_METRICA' +
                  '         FROM  (SELECT NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA, CR_SDO.IMP_CAP_VDO,' +
                  '                       NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,' +
                  '                       NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO' +
                  '                FROM  (SELECT ID_CREDITO, IMP_CAP_VDO_EX + IMP_CAP_VDO_NE AS IMP_CAP_VDO FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) = ' + VLFechaD + ') CR_SDO,' +
                  '                       MONEDA MO, MONEDA MOE, CR_CREDITO  CC,    CR_CONTRATO CCO,      CR_PRODUCTO CP,' +
                  '                       CRE_CREDITO  CCE,      CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB, CONTRATO C' +
                  '                WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO' +
                  '                AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE' +
                  '                AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA' +
                  '                AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO' +
                  '                AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO' +
                  '                AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA) CONS,' +
                  '               (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 20 GROUP BY ID_OLTP_PRODUCTO, ID_METRICA) METRICA' +
                  '         WHERE  METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE' +
                  '         AND    CONS.CVE_MONEDA <> '+#39+'UDIS'+#39+
                  '         group by CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, METRICA.ID_METRICA'+
                  '         UNION ALL' +
                  //COINCRE INTERES VIGENTE
                  '         SELECT CONS.CVE_MONEDA AS MONEDA,'+#39+'COINCRE'+#39+' AS ORIGEN, '+#39+'INTERES'+#39+' AS TIPO_CUENTA, '+#39+'VIGENTE'+#39+' AS SEGMENTO,' +
                  '         0 AS SDO_FIN_PER, (SUM(CONS.IMP_INT_VIG)) as SDO_COINCRE, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD,  METRICA.ID_METRICA' +
                  '         FROM  (SELECT NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA, CR_SDO.IMP_INT_VIG,' +
                  '                       NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,' +
                  '                       NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO' +
                  '                FROM  (SELECT ID_CREDITO, IMP_INT_VIG FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) = ' + VLFechaD + ') CR_SDO,' +
                  '                       MONEDA MO, MONEDA MOE, CR_CREDITO  CC,    CR_CONTRATO CCO,      CR_PRODUCTO CP,' +
                  '                       CRE_CREDITO  CCE,      CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB, CONTRATO C' +
                  '                WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO' +
                  '                AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE' +
                  '                AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA' +
                  '                AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO' +
                  '                AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO' +
                  '                AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA) CONS,' +
                  '               (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 30 GROUP BY ID_OLTP_PRODUCTO, ID_METRICA) METRICA' +
                  '         WHERE  METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE' +
                  '         AND    CONS.CVE_MONEDA <> '+#39+'UDIS'+#39+
                  '         group by CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, METRICA.ID_METRICA' +
                  '         UNION ALL' +
                  //COINCRE INTERES IMPAGADO
                  '         SELECT CONS.CVE_MONEDA AS MONEDA,'+#39+'COINCRE'+#39+' AS ORIGEN, '+#39+'INTERES'+#39+' AS TIPO_CUENTA, '+#39+'IMPAGADO'+#39+' AS SEGMENTO,' +
                  '         0 AS SDO_FIN_PER, (SUM(CONS.IMP_INT_IMP)) as SDO_COINCRE, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD,  METRICA.ID_METRICA' +
                  '         FROM  (SELECT NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA, CR_SDO.IMP_INT_IMP,' +
                  '                       NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,' +
                  '                       NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO' +
                  '                FROM  (SELECT ID_CREDITO, IMP_INT_IMP FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) = ' + VLFechaD + ') CR_SDO,' +
                  '                       MONEDA MO, MONEDA MOE, CR_CREDITO  CC,    CR_CONTRATO CCO,      CR_PRODUCTO CP,' +
                  '                       CRE_CREDITO  CCE,      CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB, CONTRATO C' +
                  '                WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO' +
                  '                AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE' +
                  '                AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA' +
                  '                AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO' +
                  '                AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO' +
                  '                AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA) CONS,' +
                  '               (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 9 GROUP BY ID_OLTP_PRODUCTO, ID_METRICA) METRICA' +
                  '         WHERE  METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE' +
                  '         AND    CONS.CVE_MONEDA <> '+#39+'UDIS'+#39+
                  '         group by CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, METRICA.ID_METRICA'+
                  '         UNION ALL' +
                  //COINCRE INTERES IMPAGADO
                  '         SELECT CONS.CVE_MONEDA AS MONEDA,'+#39+'COINCRE'+#39+' AS ORIGEN, '+#39+'INTERES'+#39+' AS TIPO_CUENTA, '+#39+'VENCIDO'+#39+' AS SEGMENTO,' +
                  '         0 AS SDO_FIN_PER, (SUM(CONS.IMP_INT_VDO_EX)) as SDO_COINCRE, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD,  METRICA.ID_METRICA' +
                  '         FROM  (SELECT NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA, CR_SDO.IMP_INT_VDO_EX,' +
                  '                       NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,' +
                  '                       NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO' +
                  '                FROM  (SELECT ID_CREDITO, IMP_INT_VDO_EX FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) = ' + VLFechaD + ') CR_SDO,' +
                  '                       MONEDA MO, MONEDA MOE, CR_CREDITO  CC,    CR_CONTRATO CCO,      CR_PRODUCTO CP,' +
                  '                       CRE_CREDITO  CCE,      CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB, CONTRATO C' +
                  '                WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO' +
                  '                AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE' +
                  '                AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA' +
                  '                AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO' +
                  '                AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO' +
                  '                AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA) CONS,' +
                  '               (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, ID_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 31 GROUP BY ID_OLTP_PRODUCTO, ID_METRICA) METRICA' +
                  '         WHERE  METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE' +
                  '         AND    CONS.CVE_MONEDA <> '+#39+'UDIS'+#39+
                  '         group by CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, METRICA.ID_METRICA' ;

              end;
              VlSalida :=  VlSalida +
              //GRUPOS
              '        ) ORDER BY MONEDA, TIPO_CUENTA, SEGMENTO, ID_METRICA, ORIGEN,  CVE_CTA_CONTABLE';

     end;

     ArmaQuery := VlSalida;

end;

procedure TQrCompCOINCRE.QRBand3BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
     PrintBand := (qCompCOINSDO_COINCRE.AsCurrency + qCompCOINSDO_FIN_PER.AsCurrency)<> 0;
     if VLBPintaTotalProd = False then
        VLBPintaTotalProd := (qCompCOINSDO_COINCRE.AsCurrency + qCompCOINSDO_FIN_PER.AsCurrency)<> 0;
     //end if;
end;

procedure TQrCompCOINCRE.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     VLBPintaTotalProd := False;
end;

procedure TQrCompCOINCRE.QRFGrupoCuenProdBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
     PrintBand := VLBPintaTotalProd;
end;

end.
