unit IntQrCoCd;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead, UnSQL2,
  InterApl,Dialogs,
  IntQRPreview,
  Db, DBTables,
  IntGenCre,
  ComObj,
  IntXls,
  IntMQrCoCo;

type
  TQrCompCOINCREDetalle = class(TQuickRep)
    QRBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qCompCOIN: TQuery;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrDetalle: TQRBand;
    qrPiedeGrupoMetrica: TQRBand;
    qrdbSDO_COINCRE: TQRDBText;
    qrdbSDO_FIN_PER: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText4: TQRDBText;
    qrlblSegmento: TQRLabel;
    qrdbTxtSegmento: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRShpMoneda: TQRShape;
    QRLabel8: TQRLabel;
    qrdbMONEDA: TQRDBText;
    QRShpSegmento: TQRShape;
    QRShpTipoCuenta: TQRShape;
    qrdbTIPO_CUENTA: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    qrdbCVE_CTA_CONTABLE: TQRDBText;
    qCompCOINMONEDA: TStringField;
    qCompCOINORIGEN: TStringField;
    qCompCOINTIPO_CUENTA: TStringField;
    qCompCOINSEGMENTO: TStringField;
    qCompCOINSDO_FIN_PER: TFloatField;
    qCompCOINSDO_COINCRE: TFloatField;
    qCompCOINCVE_CTA_CONTABLE: TStringField;
    qCompCOINNOMBRE_PROD: TStringField;
    qCompCOINCVE_SECTOR: TStringField;
    qCompCOINDESC_SECTOR: TStringField;
    qCompCOINID_METRICA: TFloatField;
    qrdbNOMBRE_PROD: TQRDBText;
    qrPiedeGrupoSector: TQRBand;
    qrdbCVE_SECTOR: TQRDBText;
    qrdbDESC_SECTOR: TQRDBText;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRShpSubtotal: TQRShape;
    QRShpSubtotal1: TQRShape;
    qrlblSector: TQRLabel;
    QRLabel15: TQRLabel;
    QRShpSector: TQRShape;
    QRShpGrupoCta: TQRShape;
    QRDBText11: TQRDBText;
    QRShpTitle: TQRShape;
    QRShpDiferencias: TQRShape;
    QRShpSaldoContable: TQRShape;
    QRShape1: TQRShape;
    qrGrupoTipoCuenta: TQRGroup;
    qrGrupoSegmento: TQRGroup;
    qrGrupoMetrica: TQRGroup;
    qrGrupoSector: TQRGroup;
    QRShpGpoMoneda: TQRShape;
    QRLabel14: TQRLabel;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRLabel16: TQRLabel;
    QRExpr14: TQRExpr;
    qrPiedeGrupoSegmento: TQRBand;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel7: TQRLabel;
    QRExpr7: TQRExpr;
    qrPiedeGrupoCuenta: TQRBand;
    QRDBText1: TQRDBText;
    qrPiedeGrupoMoneda: TQRBand;
    QRShape3: TQRShape;
    QRLabel13: TQRLabel;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRLabel17: TQRLabel;
    QRExpr18: TQRExpr;
    QRDBText2: TQRDBText;
    procedure qrDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGrupoMetricaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrPiedeGrupoMetricaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGrupoSectorAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrDetalleAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrPiedeGrupoSectorAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrGrupoTipoCuentaAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrGrupoMonedaAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrPiedeGrupoMetricaAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrGrupoSegmentoAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrPiedeGrupoSegmentoAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
      vgBPintaTotalProd : Boolean;

       vgExcelApp : OleVariant;
       vgNumRow   : Integer;
       vgNumRowIniciaSector  : Integer;
       vgNumRowIniciaCuentas : Integer;
       vgBGeneraArchivo : Boolean;
       vgbUtilizaArchivoConcil : Boolean;
       vgArchivoExcel : String;
       vgStrList  : TStringList;
       vgCVE_CTA_CONTABLE_1, vgCVE_CTA_CONTABLE_2 : String;

       procedure IniciaArchivoExcel(peFileName : String);
       function  Cierra_Y_Guarda_ArchivoExcel : Boolean;
       procedure AgregaSaldosArchivoExcel(peCVE_SECTOR,
                                          peDESC_SECTOR,
                                          peID_OLTP_PRODUCTO_or_peCVE_CTA_CONTABLE,
                                          peDESC_OLTP_PRODUCTO : String;
                                          peIMP_SDO_COINCRE,
                                          peIMP_SDO_CONTABLE : Double
                                         );
       procedure ColocaFormulas;
  public
       Apli : TInterApli;
       Function ArmaQuery_CONSOLIDADO_Detalle(PEMes,PEAnio : Integer; PETipoCar : String; PETipoRep : String;Detalle :Boolean): String;
       Function ArmaQuery_COINCRE_Detalle(PEMes,PEAnio : Integer; PETipoCar : String; PETipoRep : String;Detalle :Boolean): String;

       //------------------------------------------------------
       // Inician funciones para obtener la Contabilidad de SAP
       Function ArmaQuery_CONTABLE_SAP(PEMes, PEAnio : Integer;
                                       pebColocaUnionAll,
                                       pebMuestraK_VIG,
                                       pebMuestraK_IMP,
                                       pebMuestraK_VEN,
                                       pebMuestraI_VIG,
                                       pebMuestraI_IMP,
                                       pebMuestraI_VEN,
                                       pebMuestraI_ANT
                                       : Boolean) : String;

       Function ArmaQuery_CONSOLIDADO_Detalle_SAP(PEMes,PEAnio : Integer;
                                                  PETipoRep : String;
                                                  pebMuestraK_VIG,
                                                  pebMuestraK_IMP,
                                                  pebMuestraK_VEN,
                                                  pebMuestraI_VIG,
                                                  pebMuestraI_IMP,
                                                  pebMuestraI_VEN : Boolean;
                                                  peFechaEspecifica : TDateTime
                                                 ) : String;

       Function ArmaQuery_COINCRE_Detalle_SAP(PEMes,PEAnio : Integer;
                                              PETipoRep : String;
                                              pebMuestraK_VIG,
                                              pebMuestraK_IMP,
                                              pebMuestraK_VEN,
                                              pebMuestraI_VIG,
                                              pebMuestraI_IMP,
                                              pebMuestraI_VEN : Boolean) : String;
  end;

var
  QrCompCOINCREDetalle: TQrCompCOINCREDetalle;

Procedure RepCompCOINCREDetalle(PEMes,PEAnio : Integer;
                                PEMesTxt : String;
                                pAPli     : TInterApli;
                                pPreview  : Boolean;
                                PETipoRep : String;
                                peStrArchivoXLS : String;
                                peStrArchivoQry : String;
                                pebMuestraK_VIG,
                                pebMuestraK_IMP,
                                pebMuestraK_VEN,
                                pebMuestraI_VIG,
                                pebMuestraI_IMP,
                                pebMuestraI_VEN : Boolean;
                                pedFechaEspecifica: TDateTime
                               );

function CuentaComunPadre(peCVE_CTA_CONTABLE1, peCVE_CTA_CONTABLE2: String) : String;

implementation

{$R *.DFM}

Procedure RepCompCOINCREDetalle(PEMes,PEAnio : Integer;
                                PEMesTxt : String;
                                pAPli     : TInterApli;
                                pPreview  : Boolean;
                                PETipoRep : String;
                                peStrArchivoXLS : String;
                                peStrArchivoQry : String;
                                pebMuestraK_VIG,
                                pebMuestraK_IMP,
                                pebMuestraK_VEN,
                                pebMuestraI_VIG,
                                pebMuestraI_IMP,
                                pebMuestraI_VEN : Boolean;
                                pedFechaEspecifica: TDateTime
                               );
Var
   QrCompCOINCREDetalle : TQrCompCOINCREDetalle;
   Preview     : TIntQRPreview;
   vlLista     : TStringList;
   vlQry       : TQuery;
   vlstrQRY    : String;
   vlBCargaCOINCREConcluida : Boolean;
   vlFecha     : TDateTime;
begin
   QrCompCOINCREDetalle := TQrCompCOINCREDetalle.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrCompCOINCREDetalle);
   vlLista := TStringList.Create;
   vlQry   := TQuery.Create(Nil);
   QrCompCOINCREDetalle.vgBGeneraArchivo := (ExtractFileName(Trim(peStrArchivoXLS)) <> '');
   QrCompCOINCREDetalle.vgArchivoExcel   := peStrArchivoXLS;
   vlBCargaCOINCREConcluida := BCargaCOINCREConcluida(pApli, PEAnio, PEMes);
   vlFecha := pAPli.DameFechaEmpresa;
   
   Try
      QrCompCOINCREDetalle.Apli := pApli;
      QrCompCOINCREDetalle.QRInterEncabezado1.Apli:=pApli;
      QrCompCOINCREDetalle.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrCompCOINCREDetalle.QRInterEncabezado1.NomReporte:='IntQrCoCd';

      // Si el reporte solicitado es de tipo Mensual, entonces...
      If (PETipoRep = 'ME') Then
        Begin
        // Verifica si la carga de COINCRE fue concluida y en caso de que no se haya cocluido,
        // obtiene el reporte "'OPERATIVO - CONTA ' + '(DIARIO FIN DE MES)'"
        If Not (vlBCargaCOINCREConcluida) Then
           PETipoRep := 'DM';
        End;

      if PETipoRep = 'ME' then
         Begin
         QrCompCOINCREDetalle.QRInterEncabezado1.Titulo1 := 'COINCRE - CONTA ' + '(MENSUAL)';
         QrCompCOINCREDetalle.QRInterEncabezado1.Titulo2 := 'Periodo: ' +  PEMesTxt +  ' del ' + IntToStr(PEAnio);
         End;
      //end if

      if PETipoRep = 'DI' then
         Begin
         QrCompCOINCREDetalle.QRInterEncabezado1.Titulo1 := 'OPERATIVO - CONTA ' + '(DIARIO)';

             If (pedFechaEspecifica = 0) Then vlFecha := pAPli.DameFechaEmpresa
             Else vlFecha := pedFechaEspecifica;

             QrCompCOINCREDetalle.QRInterEncabezado1.Titulo2 := 'Del día: ' + FormatDateTime('dd/mm/yyyy', vlFecha);
         End;
      //end if

      if PETipoRep = 'DM' then
         Begin
         QrCompCOINCREDetalle.QRInterEncabezado1.Titulo1 := 'OPERATIVO - CONTA ' + '(DIARIO FIN DE MES)';
         QrCompCOINCREDetalle.QRInterEncabezado1.Titulo2 := 'Periodo: ' +  PEMesTxt +  ' del ' + IntToStr(PEAnio);
         End;
      //end if

      QrCompCOINCREDetalle.qCompCOIN.Active:=False;
      //<LOLS 10 MAR 2006. SE ASIGNA PARAMETROS DEL APLI>
      QrCompCOINCREDetalle.qCompCOIN.DatabaseName := pAPli.DataBaseName;
      QrCompCOINCREDetalle.qCompCOIN.SessionName  := pAPli.SessionName;
      vlQry.DatabaseName                    :=pAPli.DataBaseName;
      vlQry.SessionName                     :=pAPli.SessionName;
      //</LOLS>

      // Si el Tipo de Reporte es Mensual
      If (PETipoRep = 'ME') Then
        Begin
        // Verifica si ya se concluyo la carga de COINCRE
        If (vlBCargaCOINCREConcluida) Then
          vlstrQRY := QrCompCOINCREDetalle.ArmaQuery_COINCRE_Detalle_SAP(PEMes,PEAnio, PETipoRep,
                                               pebMuestraK_VIG, pebMuestraK_IMP, pebMuestraK_VEN,
                                               pebMuestraI_VIG, pebMuestraI_IMP,  pebMuestraI_VEN )
        // Si no se ha concluido la carga de COINCRE, procede a obtener los saldos del CONSOLIDADO
        Else
          vlstrQRY := QrCompCOINCREDetalle.ArmaQuery_CONSOLIDADO_Detalle_SAP(PEMes,PEAnio, PETipoRep,
                                           pebMuestraK_VIG, pebMuestraK_IMP, pebMuestraK_VEN,
                                           pebMuestraI_VIG, pebMuestraI_IMP,  pebMuestraI_VEN,
                                           vlFecha );
        End
      Else
        Begin
        // Si es de tipo Diario, entonces...
          vlstrQRY := QrCompCOINCREDetalle.ArmaQuery_CONSOLIDADO_Detalle_SAP(PEMes,PEAnio, PETipoRep,
                                           pebMuestraK_VIG, pebMuestraK_IMP, pebMuestraK_VEN,
                                           pebMuestraI_VIG, pebMuestraI_IMP,  pebMuestraI_VEN,
                                           vlFecha );
        End;

      If (QrCompCOINCREDetalle.vgBGeneraArchivo) Then
         QrCompCOINCREDetalle.IniciaArchivoExcel(QrCompCOINCREDetalle.vgArchivoExcel);

      QrCompCOINCREDetalle.qCompCOIN.SQL.Clear;
      QrCompCOINCREDetalle.qCompCOIN.SQL.Add(vlstrQRY);
      QrCompCOINCREDetalle.qCompCOIN.SQL.SaveToFile('c:\qryCOINCRE');
      // Si se indico el Archivo en donde guardar el query, entonces...
      If (ExtractFileName(Trim(peStrArchivoQry)) <> '') Then
        Begin
        QrCompCOINCREDetalle.qCompCOIN.SQL.SaveToFile(peStrArchivoQry);
        End;

      QrCompCOINCREDetalle.qCompCOIN.Active:=True;

      If pPreview Then
         QrCompCOINCREDetalle.Preview
      Else
         QrCompCOINCREDetalle.Print;
      //end if
      QrCompCOINCREDetalle.Cierra_Y_Guarda_ArchivoExcel;
   Finally
      QrCompCOINCREDetalle.free;
      If Assigned(Preview) Then Preview.Free;
      vlLista.Free;
      vlQry.Free;
   End;
end;

function CuentaComunPadre(peCVE_CTA_CONTABLE1, peCVE_CTA_CONTABLE2: String) : String;
var I, vlLenCveCtaContable1, vlLenCveCtaContable2 : Integer;
    vlStr1, vlStr2 : String;
begin
  Result := peCVE_CTA_CONTABLE1;
  vlLenCveCtaContable1 := Length(peCVE_CTA_CONTABLE1);
  vlLenCveCtaContable2 := Length(peCVE_CTA_CONTABLE2);
  If ((vlLenCveCtaContable1 > 0) And (vlLenCveCtaContable2 > 0)) Then
     Begin
     I := 16;
     While (I > 0) Do
         Begin
         vlStr1 := Copy(peCVE_CTA_CONTABLE1, 1, I);
         vlStr2 := Copy(peCVE_CTA_CONTABLE2, 1, I);
         If (vlStr1 = vlStr2) Then
           Begin
           Result := vlStr1;
           Break;
           End;
         I := I - 2;
         End;
     End;
end;

Function TQrCompCOINCREDetalle.ArmaQuery_CONSOLIDADO_Detalle(PEMes,PEAnio : Integer; PETipoCar : String; PETipoRep : String; Detalle : Boolean): String;
var
     VlSalida  : String;
     VLFechaD  : String;
     vlCredito,vlCredito2,vlCredito3: String;
begin
     //DIARIO Y DIARIO MENSUAL
     if ((PETipoRep = 'DI') OR (PETipoRep = 'DM') OR (PETipoRep = 'ME'))  then
     begin
           if (PETipoRep = 'DI') then
              VLFechaD := 'TRUNC(SYSDATE - 1)';
           //end if
           if ((PETipoRep = 'DM') Or (PETipoRep = 'ME')) then
           begin
              VLFechaD := 'LAST_DAY(TO_DATE('+#39+'01'+#39+'||TO_CHAR('+IntToStr(peMes)+','+#39+'00'+#39+')||TO_CHAR('+IntToStr(peAnio)+','+#39+'0000'+#39+'),'+#39+'DDMMYYYY'+#39+'))';
           end;
           If Detalle then
           begin
             vlCredito:=',CONS.ID_CREDITO';
             vlCredito2:=', NULL AS ID_CREDITO';
             vlCredito3:=', ID_CREDITO';
           end
           else
           begin
             vlCredito:=''; vlCredito2:=''; vlCredito3:='';
           end;
// Inician mis modificaciones
          VlSalida :=
              ' SELECT * FROM ( '+coCRLF;
              if ((PETipoCar = 'CA') or (PETipoCar = 'NA')) then
              begin
                  VlSalida :=  VlSalida +
                  ' -- /////////////////////////////////////////////////////////////////////////////////////'+coCRLF+
                  ' -- //////////////// C O N S O L I D A D O   D E    A D E U D O   ///////////////////////'+coCRLF+
                  ' -- /////////////////////////////////////////////////////////////////////////////////////'+coCRLF+
                  ' -- CAPITAL VIGENTE'+coCRLF+
                  ' SELECT CONS.CVE_MONEDA AS MONEDA,''COINCRE'' AS ORIGEN,''CAPITAL'' AS TIPO_CUENTA,''VIGENTE'' AS SEGMENTO, CVE_CLAS_CONTAB,'+coCRLF+
                  '       0 AS SDO_FIN_PER,(SUM(CONS.IMP_CAP_VIG)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
                  '       CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR '+vlCredito+', METRICA.ID_METRICA '+coCRLF+
                  ' FROM  ('+coCRLF+
                  '       SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
                  '               CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA,'+coCRLF+
                  '               NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_CAP_VIG,'+coCRLF+
                  '               NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,'+coCRLF+
                  '               NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO,'+coCRLF+
                  '               SUBSTR(NVL(CP.CVE_CLAS_CONTAB, CCOE.CVE_CAT_MIN) || ''000000000000'', 1, 12) AS CVE_CLAS_CONTAB,'+coCRLF+
                  '               NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE,'+coCRLF+
                  '               NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR'+coCRLF+
                  '       FROM  (SELECT ID_CREDITO, IMP_CAP_VIG FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) =  '+VLFechaD+') CR_SDO,'+coCRLF+
                  '               MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE,'+coCRLF+
                  '               CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2'+coCRLF+
                  '       WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO'+coCRLF+
                  '       AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO'+coCRLF+
                  '       AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA'+coCRLF+
                  '       AND    P2.ID_PERSONA		   (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR'+coCRLF+
                  '       AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO'+coCRLF+
                  '       AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO'+coCRLF+
                  '       AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	      AND    P.ID_PERSONA		  (+)= C.ID_TITULAR'+coCRLF+
                  '       AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS,'+coCRLF+
                  '       ( SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
                  '         FROM CR_COINCRE_CONCD'+coCRLF+
                  '         WHERE ID_REPORTE = 4'+coCRLF+
                  '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA'+coCRLF+
                  '       ) METRICA'+coCRLF+
                  ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE'+coCRLF+
                  '   AND METRICA.CVE_SECTOR (+)= CONS.CVE_SECTOR'+coCRLF+
                  '   AND METRICA.CVE_MONEDA (+)= CONS.MONEDA'+coCRLF+
                  '   AND CONS.CVE_MONEDA    <> ''UDIS'''+coCRLF+
                  '   AND CONS.IMP_CAP_VIG   <> 0 '+coCRLF+
                  ' GROUP BY CVE_CLAS_CONTAB, CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR'+vlCredito+', METRICA.ID_METRICA'+coCRLF+
                  ' UNION ALL'+coCRLF+
                  coCRLF+
                  ' -- CAPITAL IMPAGADO'+coCRLF+
                  ' SELECT CONS.CVE_MONEDA AS MONEDA,''COINCRE'' AS ORIGEN,''CAPITAL'' AS TIPO_CUENTA,''IMPAGADO'' AS SEGMENTO, CVE_CLAS_CONTAB,'+coCRLF+
                  '       0 AS SDO_FIN_PER,(SUM(CONS.IMP_CAP_IMP)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
                  '       CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR'+vlCredito+', METRICA.ID_METRICA '+coCRLF+
                  ' FROM  ('+coCRLF+
                  '       SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
                  '               CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA,'+coCRLF+
                  '               NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_CAP_IMP,'+coCRLF+
                  '               NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,'+coCRLF+
                  '               NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO,'+coCRLF+
                  '               SUBSTR(NVL(CP.CVE_CLAS_CONTAB, CCOE.CVE_CAT_MIN) || ''000000000000'', 1, 12) AS CVE_CLAS_CONTAB,'+coCRLF+                  
                  '               NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE,'+coCRLF+
                  '               NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR'+coCRLF+
                  '       FROM  (SELECT ID_CREDITO, IMP_CAP_IMP FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) =  '+VLFechaD+') CR_SDO,'+coCRLF+
                  '               MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE,'+coCRLF+
                  '               CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2'+coCRLF+
                  '       WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO'+coCRLF+
                  '       AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO'+coCRLF+
                  '       AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA'+coCRLF+
                  '       AND    P2.ID_PERSONA		   (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR'+coCRLF+
                  '       AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO'+coCRLF+
                  '       AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO'+coCRLF+
                  '       AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	      AND    P.ID_PERSONA		  (+)= C.ID_TITULAR'+coCRLF+
                  '       AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS,'+coCRLF+
                  '       ( SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
                  '         FROM CR_COINCRE_CONCD'+coCRLF+
                  '         WHERE ID_REPORTE = 16'+coCRLF+
                  '         GROUP BY ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA, CVE_MONEDA'+coCRLF+
                  '       ) METRICA'+coCRLF+
                  ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE'+coCRLF+
                  '   AND METRICA.CVE_SECTOR	   (+)= CONS.CVE_SECTOR'+coCRLF+
                  '   AND METRICA.CVE_MONEDA	   (+)= CONS.MONEDA'+coCRLF+
                  '   AND CONS.CVE_MONEDA 	   <> ''UDIS'''+coCRLF+
                  '   AND CONS.IMP_CAP_IMP         <> 0 '+coCRLF+
                  ' GROUP BY CVE_CLAS_CONTAB, CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR'+vlCredito+', METRICA.ID_METRICA'+coCRLF+
                  ' UNION ALL'+coCRLF+
                  coCRLF+
                  ' -- CAPITAL VENCIDO'+coCRLF+
                  ' SELECT CONS.CVE_MONEDA AS MONEDA,''COINCRE'' AS ORIGEN,''CAPITAL'' AS TIPO_CUENTA,''VENCIDO'' AS SEGMENTO, CVE_CLAS_CONTAB,'+coCRLF+
                  '       0 AS SDO_FIN_PER,(SUM(CONS.IMP_CAP_VDO)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
                  '       CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR'+vlCredito+', METRICA.ID_METRICA '+coCRLF+
                  ' FROM  ('+coCRLF+
                  '       SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
                  '               CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA,'+coCRLF+
                  '               NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_CAP_VDO,'+coCRLF+
                  '               NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,'+coCRLF+
                  '               NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO,'+coCRLF+
                  '               SUBSTR(NVL(CP.CVE_CLAS_CONTAB, CCOE.CVE_CAT_MIN) || ''000000000000'', 1, 12) AS CVE_CLAS_CONTAB,'+coCRLF+                  
                  '               NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE,'+coCRLF+
                  '               NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR'+coCRLF+
                  '       FROM  (SELECT ID_CREDITO, IMP_CAP_VDO_EX + IMP_CAP_VDO_NE AS IMP_CAP_VDO FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) =  '+VLFechaD+') CR_SDO,'+coCRLF+
                  '               MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE,'+coCRLF+
                  '               CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2'+coCRLF+
                  '       WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO'+coCRLF+
                  '       AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO'+coCRLF+
                  '       AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA'+coCRLF+
                  '       AND    P2.ID_PERSONA		   (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR'+coCRLF+
                  '       AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO'+coCRLF+
                  '       AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO'+coCRLF+
                  '       AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	      AND    P.ID_PERSONA		  (+)= C.ID_TITULAR'+coCRLF+
                  '       AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS,'+coCRLF+
                  '       ( SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
                  '         FROM CR_COINCRE_CONCD'+coCRLF+
                  '         WHERE ID_REPORTE = 20'+coCRLF+
                  '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR,ID_METRICA,CVE_MONEDA'+coCRLF+
                  '       ) METRICA'+coCRLF+
                  ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE'+coCRLF+
                  '   AND METRICA.CVE_SECTOR       (+)= CONS.CVE_SECTOR'+coCRLF+
                  '   AND METRICA.CVE_MONEDA       (+)= CONS.MONEDA'+coCRLF+
                  '   AND CONS.CVE_MONEDA          <> ''UDIS'''+coCRLF+
                  '   AND CONS.IMP_CAP_VDO         <> 0 '+coCRLF+
                  ' GROUP BY CVE_CLAS_CONTAB, CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR'+vlCredito+', METRICA.ID_METRICA'+coCRLF+
                  ' UNION ALL'+coCRLF+
                  coCRLF+
                  ' -- INTERES VIGENTE'+coCRLF+
                  ' SELECT CONS.CVE_MONEDA AS MONEDA,''COINCRE'' AS ORIGEN,''INTERES'' AS TIPO_CUENTA,''VIGENTE'' AS SEGMENTO, CVE_CLAS_CONTAB,'+coCRLF+
                  '       0 AS SDO_FIN_PER,(SUM(CONS.IMP_INT_VIG)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
                  '       CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR'+vlCredito+', METRICA.ID_METRICA '+coCRLF+
                  ' FROM  ('+coCRLF+
                  '       SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
                  '               CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA,'+coCRLF+
                  '               NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_INT_VIG,'+coCRLF+
                  '               NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,'+coCRLF+
                  '               NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO,'+coCRLF+
                  '               SUBSTR(NVL(CP.CVE_CLAS_CONTAB, CCOE.CVE_CAT_MIN) || ''000000000000'', 1, 12) AS CVE_CLAS_CONTAB,'+coCRLF+                  
                  '               NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE,'+coCRLF+
                  '               NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR'+coCRLF+
                  '       FROM  (SELECT ID_CREDITO, IMP_INT_VIG  FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) =  '+VLFechaD+') CR_SDO,'+coCRLF+
                  '               MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE,'+coCRLF+
                  '               CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2'+coCRLF+
                  '       WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO'+coCRLF+
                  '       AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO'+coCRLF+
                  '       AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA'+coCRLF+
                  '       AND    P2.ID_PERSONA		   (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR'+coCRLF+
                  '       AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO'+coCRLF+
                  '       AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO'+coCRLF+
                  '       AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	      AND    P.ID_PERSONA		  (+)= C.ID_TITULAR'+coCRLF+
                  '       AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS,'+coCRLF+
                  '       ( SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
                  '         FROM CR_COINCRE_CONCD'+coCRLF+
                  '         WHERE ID_REPORTE = 30'+coCRLF+
                  '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR,ID_METRICA,CVE_MONEDA'+coCRLF+
                  '        ) METRICA'+coCRLF+
                  ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE'+coCRLF+
                  '   AND METRICA.CVE_SECTOR (+)= CONS.CVE_SECTOR'+coCRLF+
                  '   AND METRICA.CVE_MONEDA (+)= CONS.MONEDA'+coCRLF+
                  '   AND CONS.CVE_MONEDA    <> ''UDIS'''+coCRLF+
                  '   AND CONS.IMP_INT_VIG   <> 0 '+coCRLF+
                  ' GROUP BY CVE_CLAS_CONTAB, CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR'+vlCredito+', METRICA.ID_METRICA'+coCRLF+
                  ' UNION ALL'+coCRLF+
                  coCRLF+
                  ' -- INTERES IMPAGADO'+coCRLF+
                  ' SELECT CONS.CVE_MONEDA AS MONEDA,''COINCRE'' AS ORIGEN,''INTERES'' AS TIPO_CUENTA,''IMPAGADO'' AS SEGMENTO, CVE_CLAS_CONTAB,'+coCRLF+
                  '       0 AS SDO_FIN_PER,(SUM(CONS.IMP_INT_IMP)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
                  '       CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR'+vlCredito+', METRICA.ID_METRICA '+coCRLF+
                  ' FROM  ('+coCRLF+
                  '       SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
                  '               CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA,'+coCRLF+
                  '               NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_INT_IMP,'+coCRLF+
                  '               NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,'+coCRLF+
                  '               NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO,'+coCRLF+
                  '               SUBSTR(NVL(CP.CVE_CLAS_CONTAB, CCOE.CVE_CAT_MIN) || ''000000000000'', 1, 12) AS CVE_CLAS_CONTAB,'+coCRLF+                  
                  '               NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE,'+coCRLF+
                  '               NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR'+coCRLF+
                  '       FROM  (SELECT ID_CREDITO, IMP_INT_IMP FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) =  '+VLFechaD+') CR_SDO,'+coCRLF+
                  '               MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE,'+coCRLF+
                  '               CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2'+coCRLF+
                  '       WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO'+coCRLF+
                  '       AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO'+coCRLF+
                  '       AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA'+coCRLF+
                  '       AND    P2.ID_PERSONA		   (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR'+coCRLF+
                  '       AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO'+coCRLF+
                  '       AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO'+coCRLF+
                  '       AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	      AND    P.ID_PERSONA		  (+)= C.ID_TITULAR'+coCRLF+
                  '       AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS,'+coCRLF+
                  '       ( SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
                  '         FROM CR_COINCRE_CONCD'+coCRLF+
                  '         WHERE ID_REPORTE = 9'+coCRLF+
                  '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA'+coCRLF+
                  '       ) METRICA'+coCRLF+
                  ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE'+coCRLF+
                  '   AND METRICA.CVE_SECTOR  (+)= CONS.CVE_SECTOR'+coCRLF+
                  '   AND METRICA.CVE_MONEDA  (+)= CONS.MONEDA'+coCRLF+
                  '   AND CONS.CVE_MONEDA     <> ''UDIS'''+coCRLF+
                  '   AND CONS.IMP_INT_IMP    <> 0 '+coCRLF+
                  ' GROUP BY CVE_CLAS_CONTAB, CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR'+vlCredito+', METRICA.ID_METRICA'+coCRLF+
                  ' UNION ALL'+coCRLF+
                  coCRLF+
                  ' -- INTERES VENCIDO'+coCRLF+
                  ' SELECT CONS.CVE_MONEDA AS MONEDA,''COINCRE'' AS ORIGEN,''INTERES'' AS TIPO_CUENTA,''VENCIDO'' AS SEGMENTO, CVE_CLAS_CONTAB,'+coCRLF+
                  '       0 AS SDO_FIN_PER,(SUM(CONS.IMP_INT_VDO_EX +  CONS.IMP_INT_VDO_NE)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
                  '       CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR'+vlCredito+', METRICA.ID_METRICA '+coCRLF+
                  ' FROM  ('+coCRLF+
                  '       SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
                  '               CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA,'+coCRLF+
                  '               NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA, CR_SDO.IMP_INT_VDO_EX, CR_SDO.IMP_INT_VDO_NE,'+coCRLF+
                  '               NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,'+coCRLF+
                  '               NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO,'+coCRLF+
                  '               SUBSTR(NVL(CP.CVE_CLAS_CONTAB, CCOE.CVE_CAT_MIN) || ''000000000000'', 1, 12) AS CVE_CLAS_CONTAB,'+coCRLF+                  
                  '               NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE,'+coCRLF+
                  '               NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR'+coCRLF+
                  '       FROM  (SELECT ID_CREDITO,  IMP_INT_VDO_EX, IMP_INT_VDO_NE  FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) =  '+VLFechaD+') CR_SDO,'+coCRLF+
                  '               MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE,'+coCRLF+
                  '               CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2'+coCRLF+
                  '       WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO'+coCRLF+
                  '       AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO'+coCRLF+
                  '       AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA'+coCRLF+
                  '       AND    P2.ID_PERSONA		   (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR'+coCRLF+
                  '       AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO'+coCRLF+
                  '       AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO'+coCRLF+
                  '       AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	      AND    P.ID_PERSONA		  (+)= C.ID_TITULAR'+coCRLF+
                  '       AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS,'+coCRLF+
                  '       ( SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
                  '         FROM CR_COINCRE_CONCD'+coCRLF+
                  '         WHERE ID_REPORTE = 31'+coCRLF+
                  '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA'+coCRLF+
                  '        ) METRICA'+coCRLF+
                  ' WHERE   METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE'+coCRLF+
                  '   AND   METRICA.CVE_SECTOR	     (+)= CONS.CVE_SECTOR'+coCRLF+
                  '   AND   METRICA.CVE_MONEDA	     (+)= CONS.MONEDA'+coCRLF+
                  '   AND   CONS.CVE_MONEDA 	     <> ''UDIS'''+coCRLF+
                  '   AND     CONS.IMP_INT_VDO_EX    <> 0 '+coCRLF+
                  ' GROUP BY CVE_CLAS_CONTAB, CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR'+vlCredito+', METRICA.ID_METRICA'+coCRLF+
                  ' UNION ALL'+coCRLF+
                  coCRLF+
                  coCRLF+
                  ' -- ///////////////////////////////////////////////////////'+coCRLF+
                  ' -- ////////////////C O N T A B L E ///////////////////////'+coCRLF+
                  ' -- ///////////////////////////////////////////////////////'+coCRLF+
                  ' -- CAPITAL'+coCRLF+
                  ' -- CONTA CAPITAL VIGENTE B1 (A 16 DIGITOS)'+coCRLF+
                  ' SELECT DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),''100'',''PESO MEXICANO'',''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
                  '       ''CONTA'' AS ORIGEN,''CAPITAL'' AS TIPO_CUENTA,''VIGENTE'' AS SEGMENTO, NULL AS CVE_CLAS_CONTAB, SUM(SDO_FIN_PER) SDO_FIN_PER,'+coCRLF+
                  '       0 SDO_COINCRE,METRICA.CVE_CTA_CONTABLE CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD,METRICA.CVE_SECTOR,'+coCRLF+
                  '       METRICA.DESC_SECTOR'+vlCredito2+',METRICA.ID_METRICA'+coCRLF+
                  '  FROM CG_PERIODO_CTA@CONT PCTA,'+coCRLF+
                  '       ( SELECT DISTINCT(D.CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, D.CVE_SECTOR,S.DESC_SECTOR,D.ID_METRICA'+coCRLF+
                  '         FROM CR_COINCRE_CONCD D, SECTOR S'+coCRLF+
                  '         WHERE D.ID_REPORTE = 4'+coCRLF+
                  '           AND D.CVE_RELACION = ''B1'''+coCRLF+
                  '           AND S.CVE_SECTOR = D.CVE_SECTOR'+coCRLF+
                  '         GROUP BY  D.CVE_CTA_CONTABLE,  D.CVE_SECTOR,S.DESC_SECTOR,D.ID_METRICA'+coCRLF+
                  '        ) METRICA'+coCRLF+
                  ' WHERE   ID_EMPRESA=  ' + IntToStr(Apli.IdEmpresa) +coCRLF+
                  '   AND CVE_EJER_CONT = ' + IntToStr(PEAnio) +coCRLF+
                  '   AND CVE_MONEDA = 484'+coCRLF+
                  '   AND PCTA.CVE_CTA_CONTABLE = METRICA.CVE_CTA_CONTABLE'+coCRLF+
                  '   AND LENGTH(PCTA.CVE_CTA_CONTABLE) = 16'+coCRLF+
                  '   AND ((SUBSTR(PCTA.CVE_CTA_CONTABLE,14,3) = ''100'') OR ( SUBSTR(PCTA.CVE_CTA_CONTABLE,14,3) = ''201''))'+coCRLF+
                  '   AND NUM_PERIODOC = ' + IntToStr(PEMes) +coCRLF+
                  '   AND SDO_FIN_PER <>0'+coCRLF+
                  ' GROUP BY DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),''100'',''PESO MEXICANO'',''DOLAR AMERICANO'' ),METRICA.CVE_CTA_CONTABLE,'+coCRLF+
                  ' METRICA.CVE_SECTOR,METRICA.DESC_SECTOR,METRICA.ID_METRICA'+coCRLF+
                  ' UNION ALL'+coCRLF+
                  coCRLF+
                  ' -- CONTA CAPITAL IMPAGADO B1 (A 16 DIGITOS)'+coCRLF+
                  ' SELECT NULL AS CVE_CLAS_CONTAB, DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),''100'',''PESO MEXICANO'',''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
                  '       ''CONTA'' AS ORIGEN,''CAPITAL'' AS TIPO_CUENTA,''IMPAGADO'' AS SEGMENTO,SUM(SDO_FIN_PER) SDO_FIN_PER,'+coCRLF+
                  '       0 SDO_COINCRE,METRICA.CVE_CTA_CONTABLE CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD,METRICA.CVE_SECTOR,'+coCRLF+
                  '       METRICA.DESC_SECTOR'+vlCredito2+',METRICA.ID_METRICA'+coCRLF+
                  '  FROM CG_PERIODO_CTA@CONT PCTA,'+coCRLF+
                  '       ( SELECT DISTINCT(D.CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, D.CVE_SECTOR,S.DESC_SECTOR,D.ID_METRICA'+coCRLF+
                  '         FROM CR_COINCRE_CONCD D, SECTOR S'+coCRLF+
                  '         WHERE D.ID_REPORTE = 16'+coCRLF+
                  '           AND D.CVE_RELACION = ''B1'''+coCRLF+
                  '           AND S.CVE_SECTOR = D.CVE_SECTOR'+coCRLF+
                  '         GROUP BY  D.CVE_CTA_CONTABLE, D.CVE_SECTOR, S.DESC_SECTOR, D.ID_METRICA'+coCRLF+
                  '       ) METRICA'+coCRLF+
                  ' WHERE   ID_EMPRESA=  ' + IntToStr(Apli.IdEmpresa) +coCRLF+
                  '   AND CVE_EJER_CONT = ' + IntToStr(PEAnio) +coCRLF+
                  '   AND CVE_MONEDA = 484'+coCRLF+
                  '   AND PCTA.CVE_CTA_CONTABLE = METRICA.CVE_CTA_CONTABLE'+coCRLF+
                  '   AND LENGTH(PCTA.CVE_CTA_CONTABLE) = 16'+coCRLF+
                  '   AND ((SUBSTR(PCTA.CVE_CTA_CONTABLE,14,3) = ''100'') OR ( SUBSTR(PCTA.CVE_CTA_CONTABLE,14,3) = ''201''))'+coCRLF+
                  '   AND NUM_PERIODOC = ' + IntToStr(PEMes) +coCRLF+
                  '   AND SDO_FIN_PER <>0'+coCRLF+
                  ' GROUP BY DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),''100'',''PESO MEXICANO'',''DOLAR AMERICANO'' ),METRICA.CVE_CTA_CONTABLE,'+coCRLF+
                  ' METRICA.CVE_SECTOR, METRICA.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF+
                  ' UNION ALL'+coCRLF+
                  coCRLF+
                  ' -- CONTA CAPITAL VENCIDO B1 (A 16 DIGITOS)'+coCRLF+
                  ' SELECT NULL AS CVE_CLAS_CONTAB, DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),''100'',''PESO MEXICANO'',''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
                  '       ''CONTA'' AS ORIGEN,''CAPITAL'' AS TIPO_CUENTA,''VENCIDO'' AS SEGMENTO,SUM(SDO_FIN_PER) SDO_FIN_PER,'+coCRLF+
                  '       0 SDO_COINCRE,METRICA.CVE_CTA_CONTABLE CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD,METRICA.CVE_SECTOR,'+coCRLF+
                  '       METRICA.DESC_SECTOR'+vlCredito2+',METRICA.ID_METRICA'+coCRLF+
                  '  FROM CG_PERIODO_CTA@CONT PCTA,'+coCRLF+
                  '       ( SELECT DISTINCT(D.CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, D.CVE_SECTOR,S.DESC_SECTOR,D.ID_METRICA'+coCRLF+
                  '         FROM CR_COINCRE_CONCD D ,SECTOR S'+coCRLF+
                  '         WHERE D.ID_REPORTE = 20'+coCRLF+
                  '           AND D.CVE_RELACION = ''B1'''+coCRLF+
                  '           AND S.CVE_SECTOR = D.CVE_SECTOR'+coCRLF+
                  '         GROUP BY D.CVE_CTA_CONTABLE, D.CVE_SECTOR, S.DESC_SECTOR, D.ID_METRICA'+coCRLF+
                  '       ) METRICA'+coCRLF+
                  ' WHERE ID_EMPRESA = ' + IntToStr(Apli.IdEmpresa) +coCRLF+
                  '   AND CVE_EJER_CONT = ' + IntToStr(PEAnio) +coCRLF+
                  '   AND CVE_MONEDA = 484'+coCRLF+
                  '   AND PCTA.CVE_CTA_CONTABLE = METRICA.CVE_CTA_CONTABLE'+coCRLF+
                  '   AND LENGTH(PCTA.CVE_CTA_CONTABLE) = 16'+coCRLF+
                  '   AND ((SUBSTR(PCTA.CVE_CTA_CONTABLE,14,3) = ''100'') OR ( SUBSTR(PCTA.CVE_CTA_CONTABLE,14,3) = ''201''))'+coCRLF+
                  '   AND NUM_PERIODOC = ' + IntToStr(PEMes) +coCRLF+
                  '   AND SDO_FIN_PER <>0' + coCRLF+
                  ' GROUP BY DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),''100'',''PESO MEXICANO'',''DOLAR AMERICANO'' ),METRICA.CVE_CTA_CONTABLE,'+coCRLF+
                  ' METRICA.CVE_SECTOR,METRICA.DESC_SECTOR,METRICA.ID_METRICA'+coCRLF+
                  ' UNION ALL'+coCRLF+
                  coCRLF+
                  ' --CONTA INTERES VIGENTE B1 (A 16 DIGITOS)'+coCRLF+
                  ' SELECT NULL AS CVE_CLAS_CONTAB, DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),''100'',''PESO MEXICANO'',''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
                  '       ''CONTA'' AS ORIGEN,''INTERES'' AS TIPO_CUENTA,''VIGENTE'' AS SEGMENTO,SUM(SDO_FIN_PER) SDO_FIN_PER,'+coCRLF+
                  '       0 SDO_COINCRE,METRICA.CVE_CTA_CONTABLE CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD,METRICA.CVE_SECTOR,'+coCRLF+
                  '       METRICA.DESC_SECTOR'+vlCredito2+',METRICA.ID_METRICA'+coCRLF+
                  '  FROM CG_PERIODO_CTA@CONT PCTA,'+coCRLF+
                  '       ( SELECT DISTINCT(D.CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, D.CVE_SECTOR,S.DESC_SECTOR,D.ID_METRICA'+coCRLF+
                  '         FROM CR_COINCRE_CONCD D ,SECTOR S'+coCRLF+
                  '         WHERE D.ID_REPORTE = 30'+coCRLF+
                  '           AND D.CVE_RELACION = ''B1'''+coCRLF+
                  '           AND S.CVE_SECTOR = D.CVE_SECTOR'+coCRLF+
                  '         GROUP BY  D.CVE_CTA_CONTABLE, D.CVE_SECTOR, S.DESC_SECTOR, D.ID_METRICA'+coCRLF+
                  '       ) METRICA'+coCRLF+
                  ' WHERE ID_EMPRESA=  ' + IntToStr(Apli.IdEmpresa) +coCRLF+
                  '   AND CVE_EJER_CONT = ' + IntToStr(PEAnio) +coCRLF+
                  '   AND CVE_MONEDA = 484'+coCRLF+
                  '   AND PCTA.CVE_CTA_CONTABLE = METRICA.CVE_CTA_CONTABLE'+coCRLF+
                  '   AND LENGTH(PCTA.CVE_CTA_CONTABLE) = 16'+coCRLF+
                  '   AND ((SUBSTR(PCTA.CVE_CTA_CONTABLE,14,3) = ''100'') OR ( SUBSTR(PCTA.CVE_CTA_CONTABLE,14,3) = ''201''))'+coCRLF+
                  '   AND NUM_PERIODOC = ' + IntToStr(PEMes) +coCRLF+
                  '   AND SDO_FIN_PER <> 0'+coCRLF+
                  ' GROUP BY DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),''100'',''PESO MEXICANO'',''DOLAR AMERICANO'' ),METRICA.CVE_CTA_CONTABLE,'+coCRLF+
                  ' METRICA.CVE_SECTOR,METRICA.DESC_SECTOR,METRICA.ID_METRICA'+coCRLF+
                  ' UNION ALL'+coCRLF+
                  coCRLF+
                  ' -- CONTA INTERES IMPAGADO B1 (A 16 DIGITOS)'+coCRLF+
                  ' SELECT NULL AS CVE_CLAS_CONTAB, DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),''100'',''PESO MEXICANO'',''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
                  '       ''CONTA'' AS ORIGEN,''INTERES'' AS TIPO_CUENTA,''IMPAGADO'' AS SEGMENTO,SUM(SDO_FIN_PER) SDO_FIN_PER,'+coCRLF+
                  '       0 SDO_COINCRE,METRICA.CVE_CTA_CONTABLE CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD,METRICA.CVE_SECTOR,'+coCRLF+
                  '       METRICA.DESC_SECTOR'+vlCredito2+',METRICA.ID_METRICA'+coCRLF+
                  '  FROM CG_PERIODO_CTA@CONT PCTA,'+coCRLF+
                  '       ( SELECT DISTINCT(D.CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, D.CVE_SECTOR,S.DESC_SECTOR,D.ID_METRICA'+coCRLF+
                  '         FROM CR_COINCRE_CONCD D ,SECTOR S'+coCRLF+
                  '         WHERE D.ID_REPORTE = 9'+coCRLF+
                  '           AND D.CVE_RELACION = ''B1'''+coCRLF+
                  '           AND S.CVE_SECTOR = D.CVE_SECTOR'+coCRLF+
                  '         GROUP BY  D.CVE_CTA_CONTABLE,  D.CVE_SECTOR,S.DESC_SECTOR,D.ID_METRICA'+coCRLF+
                  '       ) METRICA'+coCRLF+
                  ' WHERE ID_EMPRESA=  ' + IntToStr(Apli.IdEmpresa) +coCRLF+
                  '   AND CVE_EJER_CONT = ' + IntToStr(PEAnio) +coCRLF+
                  '   AND CVE_MONEDA = 484'+coCRLF+
                  '   AND PCTA.CVE_CTA_CONTABLE = METRICA.CVE_CTA_CONTABLE'+coCRLF+
                  '   AND LENGTH(PCTA.CVE_CTA_CONTABLE) = 16'+coCRLF+
                  '   AND ((SUBSTR(PCTA.CVE_CTA_CONTABLE,14,3) = ''100'') OR ( SUBSTR(PCTA.CVE_CTA_CONTABLE,14,3) = ''201''))'+coCRLF+
                  '   AND NUM_PERIODOC = ' + IntToStr(PEMes) +coCRLF+
                  '   AND SDO_FIN_PER <>0'+coCRLF+
                  ' GROUP BY DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),''100'',''PESO MEXICANO'',''DOLAR AMERICANO'' ),METRICA.CVE_CTA_CONTABLE,'+coCRLF+
                  ' METRICA.CVE_SECTOR,METRICA.DESC_SECTOR,METRICA.ID_METRICA'+coCRLF+
                  ' UNION ALL'+coCRLF+
                  coCRLF+
                  ' -- CONTA INTERES VENCIDO B1 (A 16 DIGITOS)'+coCRLF+
                  ' SELECT NULL AS CVE_CLAS_CONTAB, DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),''100'',''PESO MEXICANO'',''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
                  '       ''CONTA'' AS ORIGEN,''INTERES'' AS TIPO_CUENTA,''VENCIDO'' AS SEGMENTO,SUM(SDO_FIN_PER) SDO_FIN_PER,'+coCRLF+
                  '       0 SDO_COINCRE,METRICA.CVE_CTA_CONTABLE CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD,METRICA.CVE_SECTOR,'+coCRLF+
                  '       METRICA.DESC_SECTOR'+vlCredito2+',METRICA.ID_METRICA'+coCRLF+
                  '  FROM CG_PERIODO_CTA@CONT PCTA,'+coCRLF+
                  '       ( SELECT DISTINCT(D.CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, D.CVE_SECTOR,S.DESC_SECTOR,D.ID_METRICA'+coCRLF+
                  '         FROM CR_COINCRE_CONCD D, SECTOR S'+coCRLF+
                  '         WHERE D.ID_REPORTE = 31'+coCRLF+
                  '           AND D.CVE_RELACION = ''B1'''+coCRLF+
                  '           AND S.CVE_SECTOR = D.CVE_SECTOR'+coCRLF+
                  '         GROUP BY D.CVE_CTA_CONTABLE,  D.CVE_SECTOR,S.DESC_SECTOR,D.ID_METRICA'+coCRLF+
                  '       ) METRICA'+coCRLF+
                  ' WHERE ID_EMPRESA=  ' + IntToStr(Apli.IdEmpresa) +coCRLF+
                  '   AND CVE_EJER_CONT = ' + IntToStr(PEAnio) +coCRLF+
                  '   AND CVE_MONEDA = 484'+coCRLF+
                  '   AND PCTA.CVE_CTA_CONTABLE = METRICA.CVE_CTA_CONTABLE'+coCRLF+
                  '   AND LENGTH(PCTA.CVE_CTA_CONTABLE) = 16'+coCRLF+
                  '   AND ((SUBSTR(PCTA.CVE_CTA_CONTABLE,14,3) = ''100'') OR ( SUBSTR(PCTA.CVE_CTA_CONTABLE,14,3) = ''201''))'+coCRLF+
                  '   AND NUM_PERIODOC = ' + IntToStr(PEMes) +coCRLF+
                  '   AND SDO_FIN_PER <>0'+coCRLF+
                  ' GROUP BY DECODE(substr(PCTA.CVE_CTA_CONTABLE,14,3),''100'',''PESO MEXICANO'',''DOLAR AMERICANO'' ),METRICA.CVE_CTA_CONTABLE,'+coCRLF+
                  ' METRICA.CVE_SECTOR,METRICA.DESC_SECTOR,METRICA.ID_METRICA'+coCRLF;
              end;
              VlSalida :=  VlSalida +
              //GRUPOS
              '        ) ORDER BY MONEDA, TIPO_CUENTA, SEGMENTO, CVE_CLAS_CONTAB, ID_METRICA, CVE_SECTOR '+vlCredito3+',ORIGEN, CVE_CTA_CONTABLE';
     end;
     Result := VlSalida;
end;

Function TQrCompCOINCREDetalle.ArmaQuery_CONTABLE_SAP(PEMes, PEAnio : Integer;
                                                      pebColocaUnionAll,
                                                      pebMuestraK_VIG,
                                                      pebMuestraK_IMP,
                                                      pebMuestraK_VEN,
                                                      pebMuestraI_VIG,
                                                      pebMuestraI_IMP,
                                                      pebMuestraI_VEN,
                                                      pebMuestraI_ANT : Boolean
                                                      ) : String;
var vlSalida, vlStrGJAHR, vlStrMONAT,
    vlStrSQLCheck, vlStrFiltro, vlStrLINK: String;
    vlTOTAL : Integer;
begin
  vlStrGJAHR := IntToStr(PEAnio);
  vlStrMONAT := IntToStr(PEMes);

  //  Con este query determina si existen registros contables SAP del mes solicitado,
  //  de lo contrario busca en los registros históricos
  vlStrSQLCheck :=
      ' SELECT COUNT(*) AS TOTAL FROM ZSALDOS_DET@SAP2FIPOLC'+coCRLF+
      ' WHERE MANDT IN (SELECT CVE_MANDANTE FROM CF_PARAMETRO_SAP@CONT WHERE CVE_CLASE_DOC = ''II'') AND BUKRS = ''B000'''+coCRLF+
      '   AND GJAHR = TRIM(TO_CHAR('+vlStrGJAHR+',''0000''))'+coCRLF+
      '   AND MONAT = TRIM(TO_CHAR('+vlStrMONAT+',''00''))'+coCRLF
      ;
  If (GetSQLInt(vlStrSQLCheck, Apli.DataBaseName, Apli.SessionName, 'TOTAL', vlTOTAL, False) = False) Then
     vlTOTAL := 0;

  // Si no hay registros de zsaldos_det@SAP2FIPOLC los toma del histórico zsaldos_det@CONT
  If (vlTOTAL = 0) Then
     Begin
     vlStrLINK := 'CONT';
     vlStrFiltro := ' AND B_CTA_AFECTACION = ''V'''; // Este filtro se adiciona para darle velocidad a la búsqueda (Sólo es para CONT)
     End
  Else
     Begin
     vlStrLINK := 'SAP2FIPOLC';
     vlStrFiltro := '';
     End;

  vlSalida :=
      '  -- ///////////////////////////////////////////////////////'+coCRLF+
      '  -- ////////////  C O N T A B L E    S A P  ///////////////'+coCRLF+
      '  -- ///////////////////////////////////////////////////////'+coCRLF;

  If (pebMuestraK_VIG) Then
      Begin
      If (pebColocaUnionAll) Then
          vlSalida := vlSalida + coCRLF + ' UNION ALL' + coCRLF;

      vlSalida := vlSalida +
      ''+coCRLF+
      '  -- CAPITAL'+coCRLF+
      ''+coCRLF+
      '  -- CONTA SAP CAPITAL VIGENTE B1'+coCRLF+
      ' SELECT DECODE(TEMP.CVE_MONEDA, 484, ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
      '        ''SAP'' AS ORIGEN,'+coCRLF+
      '        ''CAPITAL'' AS TIPO_CUENTA,'+coCRLF+
      '        ''VIGENTE'' AS SEGMENTO,'+coCRLF+
      '        TEMP.SDO_FIN_PER,'+coCRLF+
      '        0 AS SDO_COINCRE,'+coCRLF+
      '        (TEMP.CVE_CUENTA || TEMP.CVE_SUBCUENTA || TEMP.CVE_AUXILIAR || TEMP.CVE_SECTOR_SAP) AS CVE_CTA_CONTABLE,'+coCRLF+
      '        NULL AS NOMBRE_PROD,'+coCRLF+
      '        TEMP.CVE_SECTOR,'+coCRLF+
      '        S.DESC_SECTOR,'+coCRLF+
      '        TEMP.ID_METRICA'+coCRLF+
      ' FROM ( SELECT  METRICA.CVE_MONEDA,'+coCRLF+
      '                SUM(Z.S_FIN) AS SDO_FIN_PER,'+coCRLF+
      '                METRICA.CVE_CUENTA,'+coCRLF+
      '                METRICA.CVE_SUBCUENTA,'+coCRLF+
      '                METRICA.CVE_AUXILIAR,'+coCRLF+
      '                METRICA.CVE_SECTOR_SAP,'+coCRLF+
      '                METRICA.CVE_SECTOR,'+coCRLF+
      '                METRICA.ID_METRICA'+coCRLF+
      '        FROM ( SELECT HKONT, S_CTA, XREF1, XREF3, HWAER, WAERS, SUM(S_FIN) AS S_FIN'+coCRLF+
      '               FROM ZSALDOS_DET@'+vlStrLINK+coCRLF+
      '               WHERE MANDT IN (SELECT CVE_MANDANTE FROM CF_PARAMETRO_SAP@CONT WHERE CVE_CLASE_DOC = ''II'') AND BUKRS = ''B000'''+coCRLF+
      '                 AND GJAHR = '+vlStrGJAHR+' AND MONAT = '+vlStrMONAT+vlstrFILTRO+coCRLF+
      '               GROUP BY HKONT, S_CTA, XREF1, XREF3, HWAER, WAERS'+coCRLF+
      '             ) Z,'+coCRLF+
      '             ( SELECT CCS.CVE_CUENTA,   CCS.CVE_SUBCUENTA,'+coCRLF+
      '                      CCS.CVE_AUXILIAR, CCS.CVE_SECTOR_SAP,'+coCRLF+
      '                      CCS.CVE_SECTOR,   CCS.ID_METRICA,'+coCRLF+
      '                      CCS.CVE_MONEDA,   CMS.MONEDA'+coCRLF+
      '               FROM CR_COINCRE_SAP CCS,'+coCRLF+
      '                    CG_MONEDA_SAP@CONT CMS'+coCRLF+
      '               WHERE CCS.ID_REPORTE = 4 -- CON ESTO INDICA QUE ES LA CARTERA VIGENTE'+coCRLF+
      '                 AND CCS.CVE_RELACION = ''B1'''+coCRLF+
      '                 AND CMS.CVE_MONEDA = CCS.CVE_MONEDA'+coCRLF+
      '               GROUP BY CCS.CVE_CUENTA,  CCS.CVE_SUBCUENTA,  CCS.CVE_AUXILIAR, CCS.CVE_SECTOR_SAP,'+coCRLF+
      '                        CCS.CVE_SECTOR,   CCS.ID_METRICA, CCS.CVE_MONEDA, CMS.MONEDA'+coCRLF+
      '             ) METRICA'+coCRLF+
      '        WHERE Z.HKONT = METRICA.CVE_CUENTA'+coCRLF+
      '          AND Z.S_CTA = METRICA.CVE_SUBCUENTA'+coCRLF+
      '          AND Z.XREF1 = METRICA.CVE_AUXILIAR'+coCRLF+
      '          AND Z.XREF3 = METRICA.CVE_SECTOR_SAP'+coCRLF+
      '          AND Z.WAERS = METRICA.MONEDA'+coCRLF+
      '        GROUP BY METRICA.CVE_MONEDA, METRICA.CVE_CUENTA, METRICA.CVE_SUBCUENTA, METRICA.CVE_AUXILIAR,'+coCRLF+
      '                METRICA.CVE_SECTOR_SAP, METRICA.CVE_SECTOR, METRICA.ID_METRICA'+coCRLF+
      '      ) TEMP,'+coCRLF+
      '      SECTOR S'+coCRLF+
      'WHERE TEMP.SDO_FIN_PER <> 0'+coCRLF+
      '  AND S.CVE_SECTOR = TEMP.CVE_SECTOR'+coCRLF+
      ''+coCRLF
      ;
      pebColocaUnionAll := True;
  End; // If (pebMuestraK_VIG) Then


  If (pebMuestraK_IMP) Then
      Begin
      If (pebColocaUnionAll) Then
          vlSalida := vlSalida + coCRLF + ' UNION ALL' + coCRLF;

      vlSalida := vlSalida +
      ''+coCRLF+
      '  -- CONTA SAP CAPITAL IMPAGADO B1'+coCRLF+
      ' SELECT DECODE(TEMP.CVE_MONEDA, 484, ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
      '        ''SAP'' AS ORIGEN,'+coCRLF+
      '        ''CAPITAL'' AS TIPO_CUENTA,'+coCRLF+
      '        ''IMPAGADO'' AS SEGMENTO,'+coCRLF+
      '        TEMP.SDO_FIN_PER,'+coCRLF+
      '        0 AS SDO_COINCRE,'+coCRLF+
      '        (TEMP.CVE_CUENTA || TEMP.CVE_SUBCUENTA || TEMP.CVE_AUXILIAR || TEMP.CVE_SECTOR_SAP) AS CVE_CTA_CONTABLE,'+coCRLF+
      '        NULL AS NOMBRE_PROD,'+coCRLF+
      '        TEMP.CVE_SECTOR,'+coCRLF+
      '        S.DESC_SECTOR,'+coCRLF+
      '        TEMP.ID_METRICA'+coCRLF+
      ' FROM ( SELECT  METRICA.CVE_MONEDA,'+coCRLF+
      '                SUM(Z.S_FIN) AS SDO_FIN_PER,'+coCRLF+
      '                METRICA.CVE_CUENTA,'+coCRLF+
      '                METRICA.CVE_SUBCUENTA,'+coCRLF+
      '                METRICA.CVE_AUXILIAR,'+coCRLF+
      '                METRICA.CVE_SECTOR_SAP,'+coCRLF+
      '                METRICA.CVE_SECTOR,'+coCRLF+
      '                METRICA.ID_METRICA'+coCRLF+
      '        FROM ( SELECT HKONT, S_CTA, XREF1, XREF3, HWAER, WAERS, SUM(S_FIN) AS S_FIN'+coCRLF+
      '               FROM ZSALDOS_DET@'+vlStrLINK+coCRLF+
      '               WHERE MANDT IN (SELECT CVE_MANDANTE FROM CF_PARAMETRO_SAP@CONT WHERE CVE_CLASE_DOC = ''II'') AND BUKRS = ''B000'''+coCRLF+
      '                 AND GJAHR = '+vlStrGJAHR+' AND MONAT = '+vlStrMONAT+vlstrFILTRO+coCRLF+
      '               GROUP BY HKONT, S_CTA, XREF1, XREF3, HWAER, WAERS'+coCRLF+
      '             ) Z,'+coCRLF+
      '             ( SELECT CCS.CVE_CUENTA,   CCS.CVE_SUBCUENTA,'+coCRLF+
      '                      CCS.CVE_AUXILIAR, CCS.CVE_SECTOR_SAP,'+coCRLF+
      '                      CCS.CVE_SECTOR,   CCS.ID_METRICA,'+coCRLF+
      '                      CCS.CVE_MONEDA,   CMS.MONEDA'+coCRLF+
      '               FROM CR_COINCRE_SAP CCS,'+coCRLF+
      '                    CG_MONEDA_SAP@CONT CMS'+coCRLF+
      '               WHERE CCS.ID_REPORTE = 16 -- CON ESTO INDICA QUE ES LA CARTERA IMPAGADO'+coCRLF+
      '                 AND CCS.CVE_RELACION = ''B1'''+coCRLF+
      '                 AND CMS.CVE_MONEDA = CCS.CVE_MONEDA'+coCRLF+
      '               GROUP BY CCS.CVE_CUENTA,  CCS.CVE_SUBCUENTA,  CCS.CVE_AUXILIAR, CCS.CVE_SECTOR_SAP,'+coCRLF+
      '                        CCS.CVE_SECTOR,   CCS.ID_METRICA, CCS.CVE_MONEDA, CMS.MONEDA'+coCRLF+
      '             ) METRICA'+coCRLF+
      '        WHERE Z.HKONT = METRICA.CVE_CUENTA'+coCRLF+
      '          AND Z.S_CTA = METRICA.CVE_SUBCUENTA'+coCRLF+
      '          AND Z.XREF1 = METRICA.CVE_AUXILIAR'+coCRLF+
      '          AND Z.XREF3 = METRICA.CVE_SECTOR_SAP'+coCRLF+
      '          AND Z.WAERS = METRICA.MONEDA'+coCRLF+
      '        GROUP BY METRICA.CVE_MONEDA, METRICA.CVE_CUENTA, METRICA.CVE_SUBCUENTA, METRICA.CVE_AUXILIAR,'+coCRLF+
      '                METRICA.CVE_SECTOR_SAP, METRICA.CVE_SECTOR, METRICA.ID_METRICA'+coCRLF+
      '      ) TEMP,'+coCRLF+
      '      SECTOR S'+coCRLF+
      'WHERE TEMP.SDO_FIN_PER <> 0'+coCRLF+
      '  AND S.CVE_SECTOR = TEMP.CVE_SECTOR'+coCRLF+
      ''+coCRLF      
      ;
      pebColocaUnionAll := True;
  End; // If (pebMuestraK_IMP) Then

  If (pebMuestraK_VEN) Then
      Begin
      If (pebColocaUnionAll) Then
          vlSalida := vlSalida + coCRLF + ' UNION ALL' + coCRLF;

      vlSalida := vlSalida +
      ''+coCRLF+
      '  -- CONTA SAP CAPITAL VENCIDO B1'+coCRLF+                  
      ' SELECT DECODE(TEMP.CVE_MONEDA, 484, ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
      '        ''SAP'' AS ORIGEN,'+coCRLF+
      '        ''CAPITAL'' AS TIPO_CUENTA,'+coCRLF+
      '        ''VENCIDO'' AS SEGMENTO,'+coCRLF+
      '        TEMP.SDO_FIN_PER,'+coCRLF+
      '        0 AS SDO_COINCRE,'+coCRLF+
      '        (TEMP.CVE_CUENTA || TEMP.CVE_SUBCUENTA || TEMP.CVE_AUXILIAR || TEMP.CVE_SECTOR_SAP) AS CVE_CTA_CONTABLE,'+coCRLF+
      '        NULL AS NOMBRE_PROD,'+coCRLF+
      '        TEMP.CVE_SECTOR,'+coCRLF+
      '        S.DESC_SECTOR,'+coCRLF+
      '        TEMP.ID_METRICA'+coCRLF+
      ' FROM ( SELECT  METRICA.CVE_MONEDA,'+coCRLF+
      '                SUM(Z.S_FIN) AS SDO_FIN_PER,'+coCRLF+
      '                METRICA.CVE_CUENTA,'+coCRLF+
      '                METRICA.CVE_SUBCUENTA,'+coCRLF+
      '                METRICA.CVE_AUXILIAR,'+coCRLF+
      '                METRICA.CVE_SECTOR_SAP,'+coCRLF+
      '                METRICA.CVE_SECTOR,'+coCRLF+
      '                METRICA.ID_METRICA'+coCRLF+
      '        FROM ( SELECT HKONT, S_CTA, XREF1, XREF3, HWAER, WAERS, SUM(S_FIN) AS S_FIN'+coCRLF+
      '               FROM ZSALDOS_DET@'+vlStrLINK+coCRLF+
      '               WHERE MANDT IN (SELECT CVE_MANDANTE FROM CF_PARAMETRO_SAP@CONT WHERE CVE_CLASE_DOC = ''II'') AND BUKRS = ''B000'''+coCRLF+
      '                 AND GJAHR = '+vlStrGJAHR+' AND MONAT = '+vlStrMONAT+vlstrFILTRO+coCRLF+
      '               GROUP BY HKONT, S_CTA, XREF1, XREF3, HWAER, WAERS'+coCRLF+
      '             ) Z,'+coCRLF+
      '             ( SELECT CCS.CVE_CUENTA,   CCS.CVE_SUBCUENTA,'+coCRLF+
      '                      CCS.CVE_AUXILIAR, CCS.CVE_SECTOR_SAP,'+coCRLF+
      '                      CCS.CVE_SECTOR,   CCS.ID_METRICA,'+coCRLF+
      '                      CCS.CVE_MONEDA,   CMS.MONEDA'+coCRLF+
      '               FROM CR_COINCRE_SAP CCS,'+coCRLF+
      '                    CG_MONEDA_SAP@CONT CMS'+coCRLF+
      '               WHERE CCS.ID_REPORTE = 20 -- CON ESTO INDICA QUE ES LA CARTERA VENCIDO'+coCRLF+
      '                 AND CCS.CVE_RELACION = ''B1'''+coCRLF+
      '                 AND CMS.CVE_MONEDA = CCS.CVE_MONEDA'+coCRLF+
      '               GROUP BY CCS.CVE_CUENTA,  CCS.CVE_SUBCUENTA,  CCS.CVE_AUXILIAR, CCS.CVE_SECTOR_SAP,'+coCRLF+
      '                        CCS.CVE_SECTOR,   CCS.ID_METRICA, CCS.CVE_MONEDA, CMS.MONEDA'+coCRLF+
      '             ) METRICA'+coCRLF+
      '        WHERE Z.HKONT = METRICA.CVE_CUENTA'+coCRLF+
      '          AND Z.S_CTA = METRICA.CVE_SUBCUENTA'+coCRLF+
      '          AND Z.XREF1 = METRICA.CVE_AUXILIAR'+coCRLF+
      '          AND Z.XREF3 = METRICA.CVE_SECTOR_SAP'+coCRLF+
      '          AND Z.WAERS = METRICA.MONEDA'+coCRLF+
      '        GROUP BY METRICA.CVE_MONEDA, METRICA.CVE_CUENTA, METRICA.CVE_SUBCUENTA, METRICA.CVE_AUXILIAR,'+coCRLF+
      '                METRICA.CVE_SECTOR_SAP, METRICA.CVE_SECTOR, METRICA.ID_METRICA'+coCRLF+
      '      ) TEMP,'+coCRLF+
      '      SECTOR S'+coCRLF+
      'WHERE TEMP.SDO_FIN_PER <> 0'+coCRLF+
      '  AND S.CVE_SECTOR = TEMP.CVE_SECTOR'+coCRLF+
      ''+coCRLF
      ;
      pebColocaUnionAll := True;
  End; // If (pebMuestraK_VEN) Then

  If (pebMuestraI_VIG) Then
      Begin
      If (pebColocaUnionAll) Then
          vlSalida := vlSalida + coCRLF + ' UNION ALL' + coCRLF;

      vlSalida := vlSalida +
      ''+coCRLF+
      ' -- INTERES'+coCRLF+
      ''+coCRLF+
      ' -- CONTA SAP INTERES VIGENTE B1'+coCRLF+
      ' SELECT DECODE(TEMP.CVE_MONEDA, 484, ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
      '        ''SAP'' AS ORIGEN,'+coCRLF+
      '        ''INTERES'' AS TIPO_CUENTA,'+coCRLF+
      '        ''VIGENTE'' AS SEGMENTO,'+coCRLF+
      '        TEMP.SDO_FIN_PER,'+coCRLF+
      '        0 AS SDO_COINCRE,'+coCRLF+
      '        (TEMP.CVE_CUENTA || TEMP.CVE_SUBCUENTA || TEMP.CVE_AUXILIAR || TEMP.CVE_SECTOR_SAP) AS CVE_CTA_CONTABLE,'+coCRLF+
      '        NULL AS NOMBRE_PROD,'+coCRLF+
      '        TEMP.CVE_SECTOR,'+coCRLF+
      '        S.DESC_SECTOR,'+coCRLF+
      '        TEMP.ID_METRICA'+coCRLF+
      ' FROM ( SELECT  METRICA.CVE_MONEDA,'+coCRLF+
      '                SUM(Z.S_FIN) AS SDO_FIN_PER,'+coCRLF+
      '                METRICA.CVE_CUENTA,'+coCRLF+
      '                METRICA.CVE_SUBCUENTA,'+coCRLF+
      '                METRICA.CVE_AUXILIAR,'+coCRLF+
      '                METRICA.CVE_SECTOR_SAP,'+coCRLF+
      '                METRICA.CVE_SECTOR,'+coCRLF+
      '                METRICA.ID_METRICA'+coCRLF+
      '        FROM ( SELECT HKONT, S_CTA, XREF1, XREF3, HWAER, WAERS, SUM(S_FIN) AS S_FIN'+coCRLF+
      '               FROM ZSALDOS_DET@'+vlStrLINK+coCRLF+
      '               WHERE MANDT IN (SELECT CVE_MANDANTE FROM CF_PARAMETRO_SAP@CONT WHERE CVE_CLASE_DOC = ''II'') AND BUKRS = ''B000'''+coCRLF+
      '                 AND GJAHR = '+vlStrGJAHR+' AND MONAT = '+vlStrMONAT+vlstrFILTRO+coCRLF+
      '               GROUP BY HKONT, S_CTA, XREF1, XREF3, HWAER, WAERS'+coCRLF+
      '             ) Z,'+coCRLF+
      '             ( SELECT CCS.CVE_CUENTA,   CCS.CVE_SUBCUENTA,'+coCRLF+
      '                      CCS.CVE_AUXILIAR, CCS.CVE_SECTOR_SAP,'+coCRLF+
      '                      CCS.CVE_SECTOR,   CCS.ID_METRICA,'+coCRLF+
      '                      CCS.CVE_MONEDA,   CMS.MONEDA'+coCRLF+
      '               FROM CR_COINCRE_SAP CCS,'+coCRLF+
      '                    CG_MONEDA_SAP@CONT CMS'+coCRLF+
      '               WHERE CCS.ID_REPORTE = 30 -- CON ESTO INDICA QUE ES LA CARTERA INTERES VIGENTE'+coCRLF+
      '                 AND CCS.CVE_RELACION = ''B1'''+coCRLF+
      '                 AND CMS.CVE_MONEDA = CCS.CVE_MONEDA'+coCRLF+
      '               GROUP BY CCS.CVE_CUENTA,  CCS.CVE_SUBCUENTA,  CCS.CVE_AUXILIAR, CCS.CVE_SECTOR_SAP,'+coCRLF+
      '                        CCS.CVE_SECTOR,   CCS.ID_METRICA, CCS.CVE_MONEDA, CMS.MONEDA'+coCRLF+
      '             ) METRICA'+coCRLF+
      '        WHERE Z.HKONT = METRICA.CVE_CUENTA'+coCRLF+
      '          AND Z.S_CTA = METRICA.CVE_SUBCUENTA'+coCRLF+
      '          AND Z.XREF1 = METRICA.CVE_AUXILIAR'+coCRLF+
      '          AND Z.XREF3 = METRICA.CVE_SECTOR_SAP'+coCRLF+
      '          AND Z.WAERS = METRICA.MONEDA'+coCRLF+
      '        GROUP BY METRICA.CVE_MONEDA, METRICA.CVE_CUENTA, METRICA.CVE_SUBCUENTA, METRICA.CVE_AUXILIAR,'+coCRLF+
      '                METRICA.CVE_SECTOR_SAP, METRICA.CVE_SECTOR, METRICA.ID_METRICA'+coCRLF+
      '      ) TEMP,'+coCRLF+
      '      SECTOR S'+coCRLF+
      'WHERE TEMP.SDO_FIN_PER <> 0'+coCRLF+
      '  AND S.CVE_SECTOR = TEMP.CVE_SECTOR'+coCRLF+
      ''+coCRLF
      ;

      If (pebMuestraI_ANT) Then
         Begin
         vlSalida := vlSalida +
             ''+coCRLF+
             'UNION ALL'+coCRLF+                      
             ''+coCRLF+
             ' -- CONTA SAP INTERES COBRADO X ANTICIPADO B1'+coCRLF+
             ' SELECT DECODE(TEMP.CVE_MONEDA, 484, ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
             '        ''SAP'' AS ORIGEN,'+coCRLF+
             '        ''INTERES'' AS TIPO_CUENTA,'+coCRLF+
             '        ''COB_ANT'' AS SEGMENTO,'+coCRLF+
             '        TEMP.SDO_FIN_PER,'+coCRLF+
             '        0 AS SDO_COINCRE,'+coCRLF+
             '        (TEMP.CVE_CUENTA || TEMP.CVE_SUBCUENTA || TEMP.CVE_AUXILIAR || TEMP.CVE_SECTOR_SAP) AS CVE_CTA_CONTABLE,'+coCRLF+
             '        NULL AS NOMBRE_PROD,'+coCRLF+
             '        TEMP.CVE_SECTOR,'+coCRLF+
             '        S.DESC_SECTOR,'+coCRLF+
             '        TEMP.ID_METRICA'+coCRLF+
             ' FROM ( SELECT  METRICA.CVE_MONEDA,'+coCRLF+
             '                SUM(Z.S_FIN * -1) AS SDO_FIN_PER,'+coCRLF+
             '                METRICA.CVE_CUENTA,'+coCRLF+
             '                METRICA.CVE_SUBCUENTA,'+coCRLF+
             '                METRICA.CVE_AUXILIAR,'+coCRLF+
             '                METRICA.CVE_SECTOR_SAP,'+coCRLF+
             '                METRICA.CVE_SECTOR,'+coCRLF+
             '                METRICA.ID_METRICA'+coCRLF+
             '        FROM ( SELECT HKONT, S_CTA, XREF1, XREF3, HWAER, WAERS, SUM(S_FIN) AS S_FIN'+coCRLF+
             '               FROM ZSALDOS_DET@'+vlStrLINK+coCRLF+
             '               WHERE MANDT IN (SELECT CVE_MANDANTE FROM CF_PARAMETRO_SAP@CONT WHERE CVE_CLASE_DOC = ''II'') AND BUKRS = ''B000'''+coCRLF+
             '                 AND GJAHR = '+vlStrGJAHR+' AND MONAT = '+vlStrMONAT+vlstrFILTRO+coCRLF+
             '               GROUP BY HKONT, S_CTA, XREF1, XREF3, HWAER, WAERS'+coCRLF+
             '             ) Z,'+coCRLF+
             '             ( SELECT CCS.CVE_CUENTA,   CCS.CVE_SUBCUENTA,'+coCRLF+
             '                      CCS.CVE_AUXILIAR, CCS.CVE_SECTOR_SAP,'+coCRLF+
             '                      CCS.CVE_SECTOR,   CCS.ID_METRICA,'+coCRLF+
             '                      CCS.CVE_MONEDA,   CMS.MONEDA'+coCRLF+
             '               FROM CR_COINCRE_SAP CCS,'+coCRLF+
             '                    CG_MONEDA_SAP@CONT CMS'+coCRLF+
             '               WHERE CCS.ID_REPORTE = 32 -- CON ESTO INDICA QUE ES LA CARTERA INTERES COBRADOS x ANTICIPADOS'+coCRLF+
             '                 AND CCS.CVE_RELACION = ''B1'''+coCRLF+
             '                 AND CMS.CVE_MONEDA = CCS.CVE_MONEDA'+coCRLF+
             '               GROUP BY CCS.CVE_CUENTA,  CCS.CVE_SUBCUENTA,  CCS.CVE_AUXILIAR, CCS.CVE_SECTOR_SAP,'+coCRLF+
             '                        CCS.CVE_SECTOR,   CCS.ID_METRICA, CCS.CVE_MONEDA, CMS.MONEDA'+coCRLF+
             '             ) METRICA'+coCRLF+
             '        WHERE Z.HKONT = METRICA.CVE_CUENTA'+coCRLF+
             '          AND Z.S_CTA = METRICA.CVE_SUBCUENTA'+coCRLF+
             '          AND Z.XREF1 = METRICA.CVE_AUXILIAR'+coCRLF+
             '          AND Z.XREF3 = METRICA.CVE_SECTOR_SAP'+coCRLF+
             '          AND Z.WAERS = METRICA.MONEDA'+coCRLF+
             '        GROUP BY METRICA.CVE_MONEDA, METRICA.CVE_CUENTA, METRICA.CVE_SUBCUENTA, METRICA.CVE_AUXILIAR,'+coCRLF+
             '                METRICA.CVE_SECTOR_SAP, METRICA.CVE_SECTOR, METRICA.ID_METRICA'+coCRLF+
             '      ) TEMP,'+coCRLF+
             '      SECTOR S'+coCRLF+
             'WHERE TEMP.SDO_FIN_PER <> 0'+coCRLF+
             '  AND S.CVE_SECTOR = TEMP.CVE_SECTOR'+coCRLF+
             ''+coCRLF
             ;
         End;
      pebColocaUnionAll := True;
  End; // If (pebMuestraI_VIG) Then


  If (pebMuestraI_IMP) Then
      Begin
      If (pebColocaUnionAll) Then
          vlSalida := vlSalida + coCRLF + ' UNION ALL' + coCRLF;

      vlSalida := vlSalida +
      ''+coCRLF+
      ' -- CONTA SAP INTERES IMPAGADO B1'+coCRLF+
      ' SELECT DECODE(TEMP.CVE_MONEDA, 484, ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
      '        ''SAP'' AS ORIGEN,'+coCRLF+
      '        ''INTERES'' AS TIPO_CUENTA,'+coCRLF+
      '        ''IMPAGADO'' AS SEGMENTO,'+coCRLF+
      '        TEMP.SDO_FIN_PER,'+coCRLF+
      '        0 AS SDO_COINCRE,'+coCRLF+
      '        (TEMP.CVE_CUENTA || TEMP.CVE_SUBCUENTA || TEMP.CVE_AUXILIAR || TEMP.CVE_SECTOR_SAP) AS CVE_CTA_CONTABLE,'+coCRLF+
      '        NULL AS NOMBRE_PROD,'+coCRLF+
      '        TEMP.CVE_SECTOR,'+coCRLF+
      '        S.DESC_SECTOR,'+coCRLF+
      '        TEMP.ID_METRICA'+coCRLF+
      ' FROM ( SELECT  METRICA.CVE_MONEDA,'+coCRLF+
      '                SUM(Z.S_FIN) AS SDO_FIN_PER,'+coCRLF+
      '                METRICA.CVE_CUENTA,'+coCRLF+
      '                METRICA.CVE_SUBCUENTA,'+coCRLF+
      '                METRICA.CVE_AUXILIAR,'+coCRLF+
      '                METRICA.CVE_SECTOR_SAP,'+coCRLF+
      '                METRICA.CVE_SECTOR,'+coCRLF+
      '                METRICA.ID_METRICA'+coCRLF+
      '        FROM ( SELECT HKONT, S_CTA, XREF1, XREF3, HWAER, WAERS, SUM(S_FIN) AS S_FIN'+coCRLF+
      '               FROM ZSALDOS_DET@'+vlStrLINK+coCRLF+
      '               WHERE MANDT IN (SELECT CVE_MANDANTE FROM CF_PARAMETRO_SAP@CONT WHERE CVE_CLASE_DOC = ''II'') AND BUKRS = ''B000'''+coCRLF+
      '                 AND GJAHR = '+vlStrGJAHR+' AND MONAT = '+vlStrMONAT+vlstrFILTRO+coCRLF+
      '               GROUP BY HKONT, S_CTA, XREF1, XREF3, HWAER, WAERS'+coCRLF+
      '             ) Z,'+coCRLF+
      '             ( SELECT CCS.CVE_CUENTA,   CCS.CVE_SUBCUENTA,'+coCRLF+
      '                      CCS.CVE_AUXILIAR, CCS.CVE_SECTOR_SAP,'+coCRLF+
      '                      CCS.CVE_SECTOR,   CCS.ID_METRICA,'+coCRLF+
      '                      CCS.CVE_MONEDA,   CMS.MONEDA'+coCRLF+
      '               FROM CR_COINCRE_SAP CCS,'+coCRLF+
      '                    CG_MONEDA_SAP@CONT CMS'+coCRLF+
      '               WHERE CCS.ID_REPORTE = 9 -- CON ESTO INDICA QUE ES LA CARTERA INTERES IMPAGADO'+coCRLF+
      '                 AND CCS.CVE_RELACION = ''B1'''+coCRLF+
      '                 AND CMS.CVE_MONEDA = CCS.CVE_MONEDA'+coCRLF+
      '               GROUP BY CCS.CVE_CUENTA,  CCS.CVE_SUBCUENTA,  CCS.CVE_AUXILIAR, CCS.CVE_SECTOR_SAP,'+coCRLF+
      '                        CCS.CVE_SECTOR,   CCS.ID_METRICA, CCS.CVE_MONEDA, CMS.MONEDA'+coCRLF+
      '             ) METRICA'+coCRLF+
      '        WHERE Z.HKONT = METRICA.CVE_CUENTA'+coCRLF+
      '          AND Z.S_CTA = METRICA.CVE_SUBCUENTA'+coCRLF+
      '          AND Z.XREF1 = METRICA.CVE_AUXILIAR'+coCRLF+
      '          AND Z.XREF3 = METRICA.CVE_SECTOR_SAP'+coCRLF+
      '          AND Z.WAERS = METRICA.MONEDA'+coCRLF+
      '        GROUP BY METRICA.CVE_MONEDA, METRICA.CVE_CUENTA, METRICA.CVE_SUBCUENTA, METRICA.CVE_AUXILIAR,'+coCRLF+
      '                METRICA.CVE_SECTOR_SAP, METRICA.CVE_SECTOR, METRICA.ID_METRICA'+coCRLF+
      '      ) TEMP,'+coCRLF+
      '      SECTOR S'+coCRLF+
      'WHERE TEMP.SDO_FIN_PER <> 0'+coCRLF+
      '  AND S.CVE_SECTOR = TEMP.CVE_SECTOR'+coCRLF+
      ''+coCRLF
      ;
      pebColocaUnionAll := True;
  End; // If (pebMuestraI_VIG) Then

  If (pebMuestraI_VEN) Then
      Begin
      If (pebColocaUnionAll) Then
          vlSalida := vlSalida + coCRLF + ' UNION ALL' + coCRLF;

      vlSalida := vlSalida +
      ''+coCRLF+
      ' -- CONTA SAP INTERES VENCIDO  B1'+coCRLF+
      ' SELECT DECODE(TEMP.CVE_MONEDA, 484, ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
      '        ''SAP'' AS ORIGEN,'+coCRLF+
      '        ''INTERES'' AS TIPO_CUENTA,'+coCRLF+
      '        ''VENCIDO'' AS SEGMENTO,'+coCRLF+
      '        TEMP.SDO_FIN_PER,'+coCRLF+
      '        0 AS SDO_COINCRE,'+coCRLF+
      '        (TEMP.CVE_CUENTA || TEMP.CVE_SUBCUENTA || TEMP.CVE_AUXILIAR || TEMP.CVE_SECTOR_SAP) AS CVE_CTA_CONTABLE,'+coCRLF+
      '        NULL AS NOMBRE_PROD,'+coCRLF+
      '        TEMP.CVE_SECTOR,'+coCRLF+
      '        S.DESC_SECTOR,'+coCRLF+
      '        TEMP.ID_METRICA'+coCRLF+
      ' FROM ( SELECT  METRICA.CVE_MONEDA,'+coCRLF+
      '                SUM(Z.S_FIN) AS SDO_FIN_PER,'+coCRLF+
      '                METRICA.CVE_CUENTA,'+coCRLF+
      '                METRICA.CVE_SUBCUENTA,'+coCRLF+
      '                METRICA.CVE_AUXILIAR,'+coCRLF+
      '                METRICA.CVE_SECTOR_SAP,'+coCRLF+
      '                METRICA.CVE_SECTOR,'+coCRLF+
      '                METRICA.ID_METRICA'+coCRLF+
      '        FROM ( SELECT HKONT, S_CTA, XREF1, XREF3, HWAER, WAERS, SUM(S_FIN) AS S_FIN'+coCRLF+
      '               FROM ZSALDOS_DET@'+vlStrLINK+coCRLF+
      '               WHERE MANDT IN (SELECT CVE_MANDANTE FROM CF_PARAMETRO_SAP@CONT WHERE CVE_CLASE_DOC = ''II'') AND BUKRS = ''B000'''+coCRLF+
      '                 AND GJAHR = '+vlStrGJAHR+' AND MONAT = '+vlStrMONAT+vlstrFILTRO+coCRLF+
      '               GROUP BY HKONT, S_CTA, XREF1, XREF3, HWAER, WAERS'+coCRLF+
      '             ) Z,'+coCRLF+
      '             ( SELECT CCS.CVE_CUENTA,   CCS.CVE_SUBCUENTA,'+coCRLF+
      '                      CCS.CVE_AUXILIAR, CCS.CVE_SECTOR_SAP,'+coCRLF+
      '                      CCS.CVE_SECTOR,   CCS.ID_METRICA,'+coCRLF+
      '                      CCS.CVE_MONEDA,   CMS.MONEDA'+coCRLF+
      '               FROM CR_COINCRE_SAP CCS,'+coCRLF+
      '                    CG_MONEDA_SAP@CONT CMS'+coCRLF+
      '               WHERE CCS.ID_REPORTE = 31 -- CON ESTO INDICA QUE ES LA CARTERA INTERES VENCIDO'+coCRLF+
      '                 AND CCS.CVE_RELACION = ''B1'''+coCRLF+
      '                 AND CMS.CVE_MONEDA = CCS.CVE_MONEDA'+coCRLF+
      '               GROUP BY CCS.CVE_CUENTA,  CCS.CVE_SUBCUENTA,  CCS.CVE_AUXILIAR, CCS.CVE_SECTOR_SAP,'+coCRLF+
      '                        CCS.CVE_SECTOR,   CCS.ID_METRICA, CCS.CVE_MONEDA, CMS.MONEDA'+coCRLF+
      '             ) METRICA'+coCRLF+
      '        WHERE Z.HKONT = METRICA.CVE_CUENTA'+coCRLF+
      '          AND Z.S_CTA = METRICA.CVE_SUBCUENTA'+coCRLF+
      '          AND Z.XREF1 = METRICA.CVE_AUXILIAR'+coCRLF+
      '          AND Z.XREF3 = METRICA.CVE_SECTOR_SAP'+coCRLF+
      '          AND Z.WAERS = METRICA.MONEDA'+coCRLF+
      '        GROUP BY METRICA.CVE_MONEDA, METRICA.CVE_CUENTA, METRICA.CVE_SUBCUENTA, METRICA.CVE_AUXILIAR,'+coCRLF+
      '                METRICA.CVE_SECTOR_SAP, METRICA.CVE_SECTOR, METRICA.ID_METRICA'+coCRLF+
      '      ) TEMP,'+coCRLF+
      '      SECTOR S'+coCRLF+
      'WHERE TEMP.SDO_FIN_PER <> 0'+coCRLF+
      '  AND S.CVE_SECTOR = TEMP.CVE_SECTOR'+coCRLF+
      ''+coCRLF
      ;
  End; // If (pebMuestraI_VEN) Then

  Result := vlSalida;
end;

Function TQrCompCOINCREDetalle.ArmaQuery_CONSOLIDADO_Detalle_SAP(PEMes,PEAnio : Integer;
                                                                 PETipoRep : String;
                                                                 pebMuestraK_VIG,
                                                                 pebMuestraK_IMP,
                                                                 pebMuestraK_VEN,
                                                                 pebMuestraI_VIG,
                                                                 pebMuestraI_IMP,
                                                                 pebMuestraI_VEN : Boolean;
                                                                 peFechaEspecifica : TDateTime
                                                                 ) : String;
var
     VlSalida  : String;
     vlFechaD  : String;
     vlbColocaUnionAll : Boolean;

     vlStrGJAHR : String;
     vlStrMONAT : String;
begin
     //DIARIO Y DIARIO MENSUAL
     If ((PETipoRep = 'DI') Or (PETipoRep = 'DM') Or (PETipoRep = 'ME'))  Then
     Begin
     vlStrGJAHR := IntToStr(PEAnio);
     vlStrMONAT := IntToStr(PEMes);

     If (PETipoRep = 'DI') then
        Begin
            // Si no se indico la fecha especifica, entonces...
            If (peFechaEspecifica = 0) Then vlFechaD := 'TRUNC(SYSDATE - 1)'
            Else vlFechaD := SQLFecha(peFechaEspecifica);
        End
     Else If ((PETipoRep = 'DM') Or (PETipoRep = 'ME')) then
        Begin
        vlFechaD := 'LAST_DAY(TO_DATE('#39'01'#39'||TO_CHAR('+IntToStr(peMes)+','+#39'00'#39')||TO_CHAR('+IntToStr(peAnio)+','#39'0000'#39'),'#39'DDMMYYYY'#39'))';
        End;

    VlSalida :=
            ' SELECT * FROM ( '+coCRLF+
            ' -- /////////////////////////////////////////////////////////////////////////////////////'+coCRLF+
            ' -- //////////////// C O N S O L I D A D O   D E    A D E U D O   ///////////////////////'+coCRLF+
            ' -- /////////////////////////////////////////////////////////////////////////////////////'+coCRLF
            ;

        vlbColocaUnionAll := False;
        If (pebMuestraK_VIG) Then
            Begin
        VlSalida :=  VlSalida +                  
            ' -- CAPITAL VIGENTE'+coCRLF+
            ' SELECT CONS.CVE_MONEDA AS MONEDA,''COINCRE'' AS ORIGEN,''CAPITAL'' AS TIPO_CUENTA,''VIGENTE'' AS SEGMENTO,'+coCRLF+
            '        0 AS SDO_FIN_PER,(SUM(CONS.IMP_CAP_VIG)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
            '        CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA '+coCRLF+
            ' FROM  ('+coCRLF+
            '       SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
            '               CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA,'+coCRLF+
            '               NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_CAP_VIG,'+coCRLF+
            '               NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,'+coCRLF+
            '               NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO,'+coCRLF+
            '               NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE,'+coCRLF+
            '               NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR'+coCRLF+
            '       FROM  (SELECT ID_CREDITO, IMP_CAP_VIG FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) =  '+VLFechaD+') CR_SDO,'+coCRLF+
            '               MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE,'+coCRLF+
            '               CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2'+coCRLF+
            '       WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO'+coCRLF+
            '       AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO'+coCRLF+
            '       AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA'+coCRLF+
            '       AND    P2.ID_PERSONA		   (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR'+coCRLF+
            '       AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO'+coCRLF+
            '       AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO'+coCRLF+
            '       AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	      AND    P.ID_PERSONA		  (+)= C.ID_TITULAR'+coCRLF+
            '       AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS,'+coCRLF+
            '       ( SELECT ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
            '         FROM CR_COINCRE_SAP'+coCRLF+
            '         WHERE ID_REPORTE = 4'+coCRLF+
            '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA'+coCRLF+
            '       ) METRICA'+coCRLF+
            ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE'+coCRLF+
            '   AND METRICA.CVE_SECTOR (+)= CONS.CVE_SECTOR'+coCRLF+
            '   AND METRICA.CVE_MONEDA (+)= CONS.MONEDA'+coCRLF+
            '   AND CONS.CVE_MONEDA    <> ''UDIS'''+coCRLF+
            '   AND CONS.IMP_CAP_VIG   <> 0 '+coCRLF+
            ' GROUP BY CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR, CONS.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF
            ;
            vlbColocaUnionAll := True;
            End; // If (pebMuestraK_VIG) Then

        If (pebMuestraK_IMP) Then
            Begin
            If (vlbColocaUnionAll) Then
                VlSalida := VlSalida + coCRLF + ' UNION ALL' + coCRLF;

            VlSalida := VlSalida +
            coCRLF+
            ' -- CAPITAL IMPAGADO'+coCRLF+
            ' SELECT CONS.CVE_MONEDA AS MONEDA,''COINCRE'' AS ORIGEN,''CAPITAL'' AS TIPO_CUENTA,''IMPAGADO'' AS SEGMENTO,'+coCRLF+
            '        0 AS SDO_FIN_PER,(SUM(CONS.IMP_CAP_IMP)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
            '        CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA '+coCRLF+
            ' FROM  ('+coCRLF+
            '       SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
            '               CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA,'+coCRLF+
            '               NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_CAP_IMP,'+coCRLF+
            '               NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,'+coCRLF+
            '               NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO,'+coCRLF+
            '               NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE,'+coCRLF+
            '               NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR'+coCRLF+
            '       FROM  (SELECT ID_CREDITO, IMP_CAP_IMP FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) =  '+VLFechaD+') CR_SDO,'+coCRLF+
            '               MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE,'+coCRLF+
            '               CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2'+coCRLF+
            '       WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO'+coCRLF+
            '       AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO'+coCRLF+
            '       AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA'+coCRLF+
            '       AND    P2.ID_PERSONA		   (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR'+coCRLF+
            '       AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO'+coCRLF+
            '       AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO'+coCRLF+
            '       AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	      AND    P.ID_PERSONA		  (+)= C.ID_TITULAR'+coCRLF+
            '       AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS,'+coCRLF+
            '       ( SELECT ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
            '         FROM CR_COINCRE_SAP'+coCRLF+
            '         WHERE ID_REPORTE = 16'+coCRLF+
            '         GROUP BY ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA, CVE_MONEDA'+coCRLF+
            '       ) METRICA'+coCRLF+
            ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE'+coCRLF+
            '   AND METRICA.CVE_SECTOR	   (+)= CONS.CVE_SECTOR'+coCRLF+
            '   AND METRICA.CVE_MONEDA	   (+)= CONS.MONEDA'+coCRLF+
            '   AND CONS.CVE_MONEDA 	   <> ''UDIS'''+coCRLF+
            '   AND CONS.IMP_CAP_IMP         <> 0 '+coCRLF+
            ' GROUP BY CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF
            ;
            vlbColocaUnionAll := True;
            End; // If (pebMuestraK_IMP) Then


        If (pebMuestraK_VEN) Then
            Begin
            If (vlbColocaUnionAll) Then
                VlSalida := VlSalida + coCRLF + ' UNION ALL' + coCRLF;

            VlSalida := VlSalida +
            coCRLF+
            ' -- CAPITAL VENCIDO'+coCRLF+
            ' SELECT CONS.CVE_MONEDA AS MONEDA,''COINCRE'' AS ORIGEN,''CAPITAL'' AS TIPO_CUENTA,''VENCIDO'' AS SEGMENTO,'+coCRLF+
            '        0 AS SDO_FIN_PER,(SUM(CONS.IMP_CAP_VDO)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
            '        CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA '+coCRLF+
            ' FROM  ('+coCRLF+
            '       SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
            '               CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA,'+coCRLF+
            '               NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_CAP_VDO,'+coCRLF+
            '               NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,'+coCRLF+
            '               NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO,'+coCRLF+
            '               NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE,'+coCRLF+
            '               NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR'+coCRLF+
            '       FROM  (SELECT ID_CREDITO, IMP_CAP_VDO_EX + IMP_CAP_VDO_NE AS IMP_CAP_VDO FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) =  '+VLFechaD+') CR_SDO,'+coCRLF+
            '               MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE,'+coCRLF+
            '               CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2'+coCRLF+
            '       WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO'+coCRLF+
            '       AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO'+coCRLF+
            '       AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA'+coCRLF+
            '       AND    P2.ID_PERSONA		   (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR'+coCRLF+
            '       AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO'+coCRLF+
            '       AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO'+coCRLF+
            '       AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	      AND    P.ID_PERSONA		  (+)= C.ID_TITULAR'+coCRLF+
            '       AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS,'+coCRLF+
            '       ( SELECT ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
            '         FROM CR_COINCRE_SAP'+coCRLF+
            '         WHERE ID_REPORTE = 20'+coCRLF+
            '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR,ID_METRICA,CVE_MONEDA'+coCRLF+
            '       ) METRICA'+coCRLF+
            ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE'+coCRLF+
            '   AND METRICA.CVE_SECTOR       (+)= CONS.CVE_SECTOR'+coCRLF+
            '   AND METRICA.CVE_MONEDA       (+)= CONS.MONEDA'+coCRLF+
            '   AND CONS.CVE_MONEDA          <> ''UDIS'''+coCRLF+
            '   AND CONS.IMP_CAP_VDO         <> 0 '+coCRLF+
            ' GROUP BY CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF
            ;
            vlbColocaUnionAll := True;
            End; // If (pebMuestraK_VEN) Then

                  
        If (pebMuestraI_VIG) Then
            Begin
            If (vlbColocaUnionAll) Then
                VlSalida := VlSalida + coCRLF + ' UNION ALL' + coCRLF;

            VlSalida := VlSalida +                      
            coCRLF+
            ' -- INTERES VIGENTE'+coCRLF+
            ' SELECT CONS.CVE_MONEDA AS MONEDA,''COINCRE'' AS ORIGEN,''INTERES'' AS TIPO_CUENTA,''VIGENTE'' AS SEGMENTO,'+coCRLF+
            '        0 AS SDO_FIN_PER,(SUM(CONS.IMP_INT_VIG)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
            '        CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA '+coCRLF+
            ' FROM  ('+coCRLF+
            '       SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
            '               CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA,'+coCRLF+
            '               NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_INT_VIG,'+coCRLF+
            '               NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,'+coCRLF+
            '               NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO,'+coCRLF+
            '               NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE,'+coCRLF+
            '               NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR'+coCRLF+
            '       FROM  (SELECT ID_CREDITO, IMP_INT_VIG  FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) =  '+VLFechaD+') CR_SDO,'+coCRLF+
            '               MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE,'+coCRLF+
            '               CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2'+coCRLF+
            '       WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO'+coCRLF+
            '       AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO'+coCRLF+
            '       AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA'+coCRLF+
            '       AND    P2.ID_PERSONA		   (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR'+coCRLF+
            '       AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO'+coCRLF+
            '       AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO'+coCRLF+
            '       AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	      AND    P.ID_PERSONA		  (+)= C.ID_TITULAR'+coCRLF+
            '       AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS,'+coCRLF+
            '       ( SELECT ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
            '         FROM CR_COINCRE_SAP'+coCRLF+
            '         WHERE ID_REPORTE = 30'+coCRLF+
            '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR,ID_METRICA,CVE_MONEDA'+coCRLF+
            '        ) METRICA'+coCRLF+
            ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE'+coCRLF+
            '   AND METRICA.CVE_SECTOR (+)= CONS.CVE_SECTOR'+coCRLF+
            '   AND METRICA.CVE_MONEDA (+)= CONS.MONEDA'+coCRLF+
            '   AND CONS.CVE_MONEDA    <> ''UDIS'''+coCRLF+
            '   AND CONS.IMP_INT_VIG   <> 0 '+coCRLF+
            ' GROUP BY  CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF
            ;
            vlbColocaUnionAll := True;
            End; // If (pebMuestraI_VIG) Then


        If (pebMuestraI_IMP) Then
            Begin
            If (vlbColocaUnionAll) Then
                VlSalida := VlSalida + coCRLF + ' UNION ALL' + coCRLF;

            VlSalida := VlSalida +
            coCRLF+
            ' -- INTERES IMPAGADO'+coCRLF+
            ' SELECT CONS.CVE_MONEDA AS MONEDA,''COINCRE'' AS ORIGEN,''INTERES'' AS TIPO_CUENTA,''IMPAGADO'' AS SEGMENTO,'+coCRLF+
            '        0 AS SDO_FIN_PER,(SUM(CONS.IMP_INT_IMP)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
            '        CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA '+coCRLF+
            ' FROM  ('+coCRLF+
            '       SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
            '               CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA,'+coCRLF+
            '               NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_INT_IMP,'+coCRLF+
            '               NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,'+coCRLF+
            '               NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO,'+coCRLF+
            '               NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE,'+coCRLF+
            '               NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR'+coCRLF+
            '       FROM  (SELECT ID_CREDITO, IMP_INT_IMP FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) =  '+VLFechaD+') CR_SDO,'+coCRLF+
            '               MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE,'+coCRLF+
            '               CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2'+coCRLF+
            '       WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO'+coCRLF+
            '       AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO'+coCRLF+
            '       AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA'+coCRLF+
            '       AND    P2.ID_PERSONA		   (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR'+coCRLF+
            '       AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO'+coCRLF+
            '       AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO'+coCRLF+
            '       AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	      AND    P.ID_PERSONA		  (+)= C.ID_TITULAR'+coCRLF+
            '       AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS,'+coCRLF+
            '       ( SELECT ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
            '         FROM CR_COINCRE_SAP'+coCRLF+
            '         WHERE ID_REPORTE = 9'+coCRLF+
            '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA'+coCRLF+
            '       ) METRICA'+coCRLF+
            ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE'+coCRLF+
            '   AND METRICA.CVE_SECTOR  (+)= CONS.CVE_SECTOR'+coCRLF+
            '   AND METRICA.CVE_MONEDA  (+)= CONS.MONEDA'+coCRLF+
            '   AND CONS.CVE_MONEDA     <> ''UDIS'''+coCRLF+
            '   AND CONS.IMP_INT_IMP    <> 0 '+coCRLF+
            ' GROUP BY CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF
            ;
            vlbColocaUnionAll := True;
            End; // If (pebMuestraI_IMP) Then

        If (pebMuestraI_VEN) Then
            Begin
            If (vlbColocaUnionAll) Then
                VlSalida := VlSalida + coCRLF + ' UNION ALL' + coCRLF;

            VlSalida := VlSalida +
            coCRLF+
            ' -- INTERES VENCIDO'+coCRLF+
            ' SELECT CONS.CVE_MONEDA AS MONEDA,''COINCRE'' AS ORIGEN,''INTERES'' AS TIPO_CUENTA,''VENCIDO'' AS SEGMENTO,'+coCRLF+
            '        0 AS SDO_FIN_PER,(SUM(CONS.IMP_INT_VDO_EX /*+ CONS.IMP_INT_VDO_NE*/)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
            '        CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA '+coCRLF+
            ' FROM  ('+coCRLF+
            '       SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
            '               CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA,'+coCRLF+
            '               NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_INT_VDO_EX, CR_SDO.IMP_INT_VDO_NE,'+coCRLF+
            '               NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,'+coCRLF+
            '               NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO,'+coCRLF+
            '               NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE,'+coCRLF+
            '               NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR'+coCRLF+
            '       FROM  (SELECT ID_CREDITO,  IMP_INT_VDO_EX, IMP_INT_VDO_NE  FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) =  '+VLFechaD+') CR_SDO,'+coCRLF+
            '               MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE,'+coCRLF+
            '               CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2'+coCRLF+
            '       WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO'+coCRLF+
            '       AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO'+coCRLF+
            '       AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA'+coCRLF+
            '       AND    P2.ID_PERSONA		   (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR'+coCRLF+
            '       AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO'+coCRLF+
            '       AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO'+coCRLF+
            '       AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	      AND    P.ID_PERSONA		  (+)= C.ID_TITULAR'+coCRLF+
            '       AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS,'+coCRLF+
            '       ( SELECT ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
            '         FROM CR_COINCRE_SAP'+coCRLF+
            '         WHERE ID_REPORTE = 31'+coCRLF+
            '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA'+coCRLF+
            '        ) METRICA'+coCRLF+
            ' WHERE   METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE'+coCRLF+
            '   AND   METRICA.CVE_SECTOR	     (+)= CONS.CVE_SECTOR'+coCRLF+
            '   AND   METRICA.CVE_MONEDA	     (+)= CONS.MONEDA'+coCRLF+
            '   AND   CONS.CVE_MONEDA 	     <> ''UDIS'''+coCRLF+
            '   AND     CONS.IMP_INT_VDO_EX    <> 0 '+coCRLF+
            ' GROUP BY CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF
            ;
            vlbColocaUnionAll := True;
            End; // If (pebMuestraI_VEN) Then

            VlSalida := VlSalida + ArmaQuery_CONTABLE_SAP(PEMes,PEAnio,
                                                          vlbColocaUnionAll,
                                                          pebMuestraK_VIG,
                                                          pebMuestraK_IMP,
                                                          pebMuestraK_VEN,
                                                          pebMuestraI_VIG,
                                                          pebMuestraI_IMP,
                                                          pebMuestraI_VEN,
                                                          False // -- Incluye intereses cobrados x anticipados 
                                                          );
        VlSalida :=  VlSalida +
        //GRUPOS
         '  ) ORDER BY MONEDA, TIPO_CUENTA, SEGMENTO, ID_METRICA, CVE_SECTOR, ORIGEN, CVE_CTA_CONTABLE'+coCRLF;
     End;
     Result := VlSalida;
end;

Function TQrCompCOINCREDetalle.ArmaQuery_COINCRE_Detalle_SAP(PEMes,PEAnio : Integer;
                                                             PETipoRep : String;
                                                             pebMuestraK_VIG,
                                                             pebMuestraK_IMP,
                                                             pebMuestraK_VEN,
                                                             pebMuestraI_VIG,
                                                             pebMuestraI_IMP,
                                                             pebMuestraI_VEN : Boolean) : String;
var
     VlSalida  : String;
     vlbColocaUnionAll : Boolean;

     vlStrGJAHR : String;
     vlStrMONAT : String;
begin
     // MENSUAL
     If (PETipoRep = 'ME') Then
     begin
      vlStrGJAHR := IntToStr(PEAnio);
      vlStrMONAT := IntToStr(PEMes);

      VlSalida :=
              ' SELECT * FROM ( '+coCRLF+
              ' -- /////////////////////////////////////////////////////////////////////////////////////'+coCRLF+
              ' -- ////////////////////////// S A L D O S    C O I N C R E /////////////////////////////'+coCRLF+
              ' -- /////////////////////////////////////////////////////////////////////////////////////'+coCRLF
              ;

      vlbColocaUnionAll := False;
      If (pebMuestraK_VIG) Then
          Begin
      VlSalida :=  VlSalida +
          coCRLF +                  
          ' -- COINCRE CAPITAL VIGENTE'+coCRLF+
          ' SELECT DECODE(COINCRE.ID_OLTP_MONEDA, 484, ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
          '        ''COINCRE'' AS ORIGEN,''CAPITAL'' AS TIPO_CUENTA,''VIGENTE'' AS SEGMENTO,'+coCRLF+
          '        0 AS SDO_FIN_PER,(SUM(COINCRE.IMP_CAP_VIG)) as SDO_COINCRE, COINCRE.ID_OLTP_PRODUCTO AS CVE_CTA_CONTABLE,'+coCRLF+
          '        COINCRE.PRODUCTO AS NOMBRE_PROD, COINCRE.CVE_OLTP_SECTOR AS CVE_SECTOR, S.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF+
          ' FROM  ( SELECT DCFC.IMP_SDO_K_VIG AS IMP_CAP_VIG,'+coCRLF+
          '                DCDC.ID_OLTP_PRODUCTO,'+coCRLF+
          '                DCDC.PRODUCTO,'+coCRLF+
          '                DCDC.ID_OLTP_MONEDA,'+coCRLF+
          '                DCDC.CVE_OLTP_SECTOR'+coCRLF+
          '         FROM ( SELECT ID_ANIO_MES FROM DM_CR_DIM_MES@DWHC DCDM'+coCRLF+
          '                WHERE DCDM.ANIO = '+vlStrGJAHR+' AND DCDM.NUM_MES = '+vlStrMONAT+coCRLF+
          '              ) DCDM,'+coCRLF+
          '              ( SELECT ID_OLTP_PRODUCTO'+coCRLF+
          '                FROM CR_COINCRE_SAP'+coCRLF+
          '                WHERE ID_REPORTE = 4 -- CAPITAL VIGENTE'+coCRLF+
          '                GROUP BY ID_OLTP_PRODUCTO'+coCRLF+
          '              ) CCS,'+coCRLF+
          '              DM_CR_FAC_CREDITO@DWHC DCFC,'+coCRLF+
          '              DM_CR_DIM_CREDITO@DWHC DCDC'+coCRLF+
          '         WHERE DCFC.ID_ANIO_MES = DCDM.ID_ANIO_MES'+coCRLF+
          '           AND DCDC.ID_CREDITO = DCFC.ID_CREDITO'+coCRLF+
          '           AND DCDC.ID_OLTP_PRODUCTO = CCS.ID_OLTP_PRODUCTO'+coCRLF+
          '       ) COINCRE,'+coCRLF+
          '       ( SELECT ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
          '         FROM CR_COINCRE_SAP'+coCRLF+
          '         WHERE ID_REPORTE = 4 -- CAPITAL VIGENTE'+coCRLF+
          '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA'+coCRLF+
          '       ) METRICA,'+coCRLF+
          '       SECTOR S'+coCRLF+
          ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= COINCRE.ID_OLTP_PRODUCTO'+coCRLF+
          '   AND METRICA.CVE_SECTOR (+)= COINCRE.CVE_OLTP_SECTOR'+coCRLF+
          '   AND METRICA.CVE_MONEDA (+)= COINCRE.ID_OLTP_MONEDA'+coCRLF+
          '   AND COINCRE.ID_OLTP_MONEDA  <> 800 -- UDIS'+coCRLF+
          '   AND COINCRE.IMP_CAP_VIG <> 0'+coCRLF+
          '   AND S.CVE_SECTOR (+)= COINCRE.CVE_OLTP_SECTOR'+coCRLF+
          ' GROUP BY COINCRE.ID_OLTP_MONEDA, COINCRE.ID_OLTP_PRODUCTO, COINCRE.PRODUCTO, COINCRE.CVE_OLTP_SECTOR, S.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF
          ;
          vlbColocaUnionAll := True;
          End; // If (pebMuestraK_VIG) Then

      If (pebMuestraK_IMP) Then
          Begin
          If (vlbColocaUnionAll) Then
              VlSalida := VlSalida + coCRLF + ' UNION ALL' + coCRLF;

          VlSalida := VlSalida +
          coCRLF +
          ' -- COINCRE CAPITAL IMPAGADO'+coCRLF+
          ' SELECT DECODE(COINCRE.ID_OLTP_MONEDA, 484, ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
          '        ''COINCRE'' AS ORIGEN,''CAPITAL'' AS TIPO_CUENTA,''IMPAGADO'' AS SEGMENTO,'+coCRLF+
          '        0 AS SDO_FIN_PER,(SUM(COINCRE.IMP_CAP_IMP)) as SDO_COINCRE, COINCRE.ID_OLTP_PRODUCTO AS CVE_CTA_CONTABLE,'+coCRLF+
          '        COINCRE.PRODUCTO AS NOMBRE_PROD, COINCRE.CVE_OLTP_SECTOR AS CVE_SECTOR, S.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF+
          ' FROM  ( SELECT DCFC.IMP_SDO_K_IMP AS IMP_CAP_IMP,'+coCRLF+
          '                DCDC.ID_OLTP_PRODUCTO,'+coCRLF+
          '                DCDC.PRODUCTO,'+coCRLF+
          '                DCDC.ID_OLTP_MONEDA,'+coCRLF+
          '                DCDC.CVE_OLTP_SECTOR'+coCRLF+
          '         FROM ( SELECT ID_ANIO_MES FROM DM_CR_DIM_MES@DWHC DCDM'+coCRLF+
          '                WHERE DCDM.ANIO = '+vlStrGJAHR+' AND DCDM.NUM_MES = '+vlStrMONAT+coCRLF+
          '              ) DCDM,'+coCRLF+
          '              ( SELECT ID_OLTP_PRODUCTO'+coCRLF+
          '                FROM CR_COINCRE_SAP'+coCRLF+
          '                WHERE ID_REPORTE = 16 -- CAPITAL IMPAGADO'+coCRLF+
          '                GROUP BY ID_OLTP_PRODUCTO'+coCRLF+
          '              ) CCS,'+coCRLF+
          '              DM_CR_FAC_CREDITO@DWHC DCFC,'+coCRLF+
          '              DM_CR_DIM_CREDITO@DWHC DCDC'+coCRLF+
          '         WHERE DCFC.ID_ANIO_MES = DCDM.ID_ANIO_MES'+coCRLF+
          '           AND DCDC.ID_CREDITO = DCFC.ID_CREDITO'+coCRLF+
          '           AND DCDC.ID_OLTP_PRODUCTO = CCS.ID_OLTP_PRODUCTO'+coCRLF+
          '       ) COINCRE,'+coCRLF+
          '       ( SELECT ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
          '         FROM CR_COINCRE_SAP'+coCRLF+
          '         WHERE ID_REPORTE = 16 -- CAPITAL IMPAGADO'+coCRLF+
          '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA'+coCRLF+
          '       ) METRICA,'+coCRLF+
          '       SECTOR S'+coCRLF+
          ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= COINCRE.ID_OLTP_PRODUCTO'+coCRLF+
          '   AND METRICA.CVE_SECTOR (+)= COINCRE.CVE_OLTP_SECTOR'+coCRLF+
          '   AND METRICA.CVE_MONEDA (+)= COINCRE.ID_OLTP_MONEDA'+coCRLF+
          '   AND COINCRE.ID_OLTP_MONEDA  <> 800 -- UDIS'+coCRLF+
          '   AND COINCRE.IMP_CAP_IMP <> 0'+coCRLF+
          '   AND S.CVE_SECTOR (+)= COINCRE.CVE_OLTP_SECTOR'+coCRLF+
          ' GROUP BY COINCRE.ID_OLTP_MONEDA, COINCRE.ID_OLTP_PRODUCTO, COINCRE.PRODUCTO, COINCRE.CVE_OLTP_SECTOR, S.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF
          ;
          vlbColocaUnionAll := True;
          End; // If (pebMuestraK_IMP) Then


      If (pebMuestraK_VEN) Then
          Begin
          If (vlbColocaUnionAll) Then
              VlSalida := VlSalida + coCRLF + ' UNION ALL' + coCRLF;

          VlSalida := VlSalida +
          coCRLF +
          ' -- COINCRE CAPITAL VENCIDO'+coCRLF+
          ' SELECT DECODE(COINCRE.ID_OLTP_MONEDA, 484, ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
          '        ''COINCRE'' AS ORIGEN,''CAPITAL'' AS TIPO_CUENTA,''VENCIDO'' AS SEGMENTO,'+coCRLF+
          '        0 AS SDO_FIN_PER,(SUM(COINCRE.IMP_CAP_VDO)) as SDO_COINCRE, COINCRE.ID_OLTP_PRODUCTO AS CVE_CTA_CONTABLE,'+coCRLF+
          '        COINCRE.PRODUCTO AS NOMBRE_PROD, COINCRE.CVE_OLTP_SECTOR AS CVE_SECTOR, S.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF+
          ' FROM  ( SELECT DCFC.IMP_SDO_K_VEN AS IMP_CAP_VDO,'+coCRLF+
          '                DCDC.ID_OLTP_PRODUCTO,'+coCRLF+
          '                DCDC.PRODUCTO,'+coCRLF+
          '                DCDC.ID_OLTP_MONEDA,'+coCRLF+
          '                DCDC.CVE_OLTP_SECTOR'+coCRLF+
          '         FROM ( SELECT ID_ANIO_MES FROM DM_CR_DIM_MES@DWHC DCDM'+coCRLF+
          '                WHERE DCDM.ANIO = '+vlStrGJAHR+' AND DCDM.NUM_MES = '+vlStrMONAT+coCRLF+
          '              ) DCDM,'+coCRLF+
          '              ( SELECT ID_OLTP_PRODUCTO'+coCRLF+
          '                FROM CR_COINCRE_SAP'+coCRLF+
          '                WHERE ID_REPORTE = 20 -- CAPITAL VENCIDO'+coCRLF+
          '                GROUP BY ID_OLTP_PRODUCTO'+coCRLF+
          '              ) CCS,'+coCRLF+
          '              DM_CR_FAC_CREDITO@DWHC DCFC,'+coCRLF+
          '              DM_CR_DIM_CREDITO@DWHC DCDC'+coCRLF+
          '         WHERE DCFC.ID_ANIO_MES = DCDM.ID_ANIO_MES'+coCRLF+
          '           AND DCDC.ID_CREDITO = DCFC.ID_CREDITO'+coCRLF+
          '           AND DCDC.ID_OLTP_PRODUCTO = CCS.ID_OLTP_PRODUCTO'+coCRLF+
          '       ) COINCRE,'+coCRLF+
          '       ( SELECT ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
          '         FROM CR_COINCRE_SAP'+coCRLF+
          '         WHERE ID_REPORTE = 20 -- CAPITAL VENCIDO'+coCRLF+
          '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA'+coCRLF+
          '       ) METRICA,'+coCRLF+
          '       SECTOR S'+coCRLF+
          ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= COINCRE.ID_OLTP_PRODUCTO'+coCRLF+
          '   AND METRICA.CVE_SECTOR (+)= COINCRE.CVE_OLTP_SECTOR'+coCRLF+
          '   AND METRICA.CVE_MONEDA (+)= COINCRE.ID_OLTP_MONEDA'+coCRLF+
          '   AND COINCRE.ID_OLTP_MONEDA  <> 800 -- UDIS'+coCRLF+
          '   AND COINCRE.IMP_CAP_VDO <> 0'+coCRLF+
          '   AND S.CVE_SECTOR (+)= COINCRE.CVE_OLTP_SECTOR'+coCRLF+
          ' GROUP BY COINCRE.ID_OLTP_MONEDA, COINCRE.ID_OLTP_PRODUCTO, COINCRE.PRODUCTO, COINCRE.CVE_OLTP_SECTOR, S.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF
          ;
          vlbColocaUnionAll := True;
          End; // If (pebMuestraK_VEN) Then

                  
      If (pebMuestraI_VIG) Then
          Begin
          If (vlbColocaUnionAll) Then
              VlSalida := VlSalida + coCRLF + ' UNION ALL' + coCRLF;

          VlSalida := VlSalida +                      
          coCRLF+
          ' -- COINCRE INTERÉS VIGENTE'+coCRLF+
          ' SELECT DECODE(COINCRE.ID_OLTP_MONEDA, 484, ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
          '        ''COINCRE'' AS ORIGEN,''INTERES'' AS TIPO_CUENTA,''VIGENTE'' AS SEGMENTO,'+coCRLF+
          '        0 AS SDO_FIN_PER,(SUM(COINCRE.IMP_INT_VIG)) as SDO_COINCRE, COINCRE.ID_OLTP_PRODUCTO AS CVE_CTA_CONTABLE,'+coCRLF+
          '        COINCRE.PRODUCTO AS NOMBRE_PROD, COINCRE.CVE_OLTP_SECTOR AS CVE_SECTOR, S.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF+
          ' FROM  ( SELECT DCFC.IMP_INT_CORTE AS IMP_INT_VIG,'+coCRLF+
          '                DCDC.ID_OLTP_PRODUCTO,'+coCRLF+
          '                DCDC.PRODUCTO,'+coCRLF+
          '                DCDC.ID_OLTP_MONEDA,'+coCRLF+
          '                DCDC.CVE_OLTP_SECTOR'+coCRLF+
          '         FROM ( SELECT ID_ANIO_MES FROM DM_CR_DIM_MES@DWHC DCDM'+coCRLF+
          '                WHERE DCDM.ANIO = '+vlStrGJAHR+' AND DCDM.NUM_MES = '+vlStrMONAT+coCRLF+
          '              ) DCDM,'+coCRLF+
          '              ( SELECT ID_OLTP_PRODUCTO'+coCRLF+
          '                FROM CR_COINCRE_SAP'+coCRLF+
          '                WHERE ID_REPORTE = 30 -- INTERÉS VIGENTE'+coCRLF+
          '                GROUP BY ID_OLTP_PRODUCTO'+coCRLF+
          '              ) CCS,'+coCRLF+
          '              DM_CR_FAC_CREDITO@DWHC DCFC,'+coCRLF+
          '              DM_CR_DIM_CREDITO@DWHC DCDC'+coCRLF+
          '         WHERE DCFC.ID_ANIO_MES = DCDM.ID_ANIO_MES'+coCRLF+
          '           AND DCDC.ID_CREDITO = DCFC.ID_CREDITO'+coCRLF+
          '           AND DCDC.ID_OLTP_PRODUCTO = CCS.ID_OLTP_PRODUCTO'+coCRLF+
          '       ) COINCRE,'+coCRLF+
          '       ( SELECT ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
          '         FROM CR_COINCRE_SAP'+coCRLF+
          '         WHERE ID_REPORTE = 30 -- INTERÉS VIGENTE'+coCRLF+
          '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA'+coCRLF+
          '       ) METRICA,'+coCRLF+
          '       SECTOR S'+coCRLF+
          ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= COINCRE.ID_OLTP_PRODUCTO'+coCRLF+
          '   AND METRICA.CVE_SECTOR (+)= COINCRE.CVE_OLTP_SECTOR'+coCRLF+
          '   AND METRICA.CVE_MONEDA (+)= COINCRE.ID_OLTP_MONEDA'+coCRLF+
          '   AND COINCRE.ID_OLTP_MONEDA  <> 800 -- UDIS'+coCRLF+
          '   AND COINCRE.IMP_INT_VIG <> 0'+coCRLF+
          '   AND S.CVE_SECTOR (+)= COINCRE.CVE_OLTP_SECTOR'+coCRLF+
          ' GROUP BY COINCRE.ID_OLTP_MONEDA, COINCRE.ID_OLTP_PRODUCTO, COINCRE.PRODUCTO, COINCRE.CVE_OLTP_SECTOR, S.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF+
          ''+coCRLF+
          'UNION ALL'+
          ''+coCRLF+
          ' -- COINCRE INTERESES COBRADOS POR ANTICIPADO'+coCRLF+
          ' SELECT DECODE(COINCRE.ID_OLTP_MONEDA, 484, ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
          '        ''COINCRE'' AS ORIGEN,''INTERES'' AS TIPO_CUENTA,''COB_ANT'' AS SEGMENTO,'+coCRLF+
          '        0 AS SDO_FIN_PER,(SUM(COINCRE.IMP_INT_COB_ANT)) as SDO_COINCRE, COINCRE.ID_OLTP_PRODUCTO AS CVE_CTA_CONTABLE,'+coCRLF+
          '        COINCRE.PRODUCTO AS NOMBRE_PROD, COINCRE.CVE_OLTP_SECTOR AS CVE_SECTOR, S.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF+
          ' FROM  ( SELECT DCFC.IMP_INT_COB_ANT,'+coCRLF+
          '                DCDC.ID_OLTP_PRODUCTO,'+coCRLF+
          '                DCDC.PRODUCTO,'+coCRLF+
          '                DCDC.ID_OLTP_MONEDA,'+coCRLF+
          '                DCDC.CVE_OLTP_SECTOR'+coCRLF+
          '         FROM ( SELECT ID_ANIO_MES FROM DM_CR_DIM_MES@DWHC DCDM'+coCRLF+
          '                WHERE DCDM.ANIO = '+vlStrGJAHR+' AND DCDM.NUM_MES = '+vlStrMONAT+coCRLF+
          '              ) DCDM,'+coCRLF+
          '              ( SELECT ID_OLTP_PRODUCTO'+coCRLF+
          '                FROM CR_COINCRE_SAP'+coCRLF+
          '                WHERE ID_REPORTE = 32 -- INTERÉS COBRADO POR ANTICIPADO'+coCRLF+
          '                GROUP BY ID_OLTP_PRODUCTO'+coCRLF+
          '              ) CCS,'+coCRLF+
          '              DM_CR_FAC_CREDITO@DWHC DCFC,'+coCRLF+
          '              DM_CR_DIM_CREDITO@DWHC DCDC'+coCRLF+
          '         WHERE DCFC.ID_ANIO_MES = DCDM.ID_ANIO_MES'+coCRLF+
          '           AND DCDC.ID_CREDITO = DCFC.ID_CREDITO'+coCRLF+
          '           AND DCDC.ID_OLTP_PRODUCTO = CCS.ID_OLTP_PRODUCTO'+coCRLF+
          '       ) COINCRE,'+coCRLF+
          '       ( SELECT ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
          '         FROM CR_COINCRE_SAP'+coCRLF+
          '         WHERE ID_REPORTE = 32 -- INTERÉS COBRADO POR ANTICIPADO'+coCRLF+
          '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA'+coCRLF+
          '       ) METRICA,'+coCRLF+
          '       SECTOR S'+coCRLF+
          ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= COINCRE.ID_OLTP_PRODUCTO'+coCRLF+
          '   AND METRICA.CVE_SECTOR (+)= COINCRE.CVE_OLTP_SECTOR'+coCRLF+
          '   AND METRICA.CVE_MONEDA (+)= COINCRE.ID_OLTP_MONEDA'+coCRLF+
          '   AND COINCRE.ID_OLTP_MONEDA  <> 800 -- UDIS'+coCRLF+
          '   AND COINCRE.IMP_INT_COB_ANT <> 0'+coCRLF+
          '   AND S.CVE_SECTOR (+)= COINCRE.CVE_OLTP_SECTOR'+coCRLF+
          ' GROUP BY COINCRE.ID_OLTP_MONEDA, COINCRE.ID_OLTP_PRODUCTO, COINCRE.PRODUCTO, COINCRE.CVE_OLTP_SECTOR, S.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF
          ;
          vlbColocaUnionAll := True;
          End; // If (pebMuestraI_VIG) Then

      If (pebMuestraI_IMP) Then
          Begin
          If (vlbColocaUnionAll) Then
              VlSalida := VlSalida + coCRLF + ' UNION ALL' + coCRLF;

          VlSalida := VlSalida +
          coCRLF+
          ' -- COINCRE INTERES IMPAGADO'+coCRLF+
          ' SELECT DECODE(COINCRE.ID_OLTP_MONEDA, 484, ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
          '        ''COINCRE'' AS ORIGEN,''INTERES'' AS TIPO_CUENTA,''IMPAGADO'' AS SEGMENTO,'+coCRLF+
          '        0 AS SDO_FIN_PER,(SUM(COINCRE.IMP_INT_IMP)) as SDO_COINCRE, COINCRE.ID_OLTP_PRODUCTO AS CVE_CTA_CONTABLE,'+coCRLF+
          '        COINCRE.PRODUCTO AS NOMBRE_PROD, COINCRE.CVE_OLTP_SECTOR AS CVE_SECTOR, S.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF+
          ' FROM  ( SELECT DCFC.IMP_SDO_IO_IMP AS IMP_INT_IMP,'+coCRLF+
          '                DCDC.ID_OLTP_PRODUCTO,'+coCRLF+
          '                DCDC.PRODUCTO,'+coCRLF+
          '                DCDC.ID_OLTP_MONEDA,'+coCRLF+
          '                DCDC.CVE_OLTP_SECTOR'+coCRLF+
          '         FROM ( SELECT ID_ANIO_MES FROM DM_CR_DIM_MES@DWHC DCDM'+coCRLF+
          '                WHERE DCDM.ANIO = '+vlStrGJAHR+' AND DCDM.NUM_MES = '+vlStrMONAT+coCRLF+
          '              ) DCDM,'+coCRLF+
          '              ( SELECT ID_OLTP_PRODUCTO'+coCRLF+
          '                FROM CR_COINCRE_SAP'+coCRLF+
          '                WHERE ID_REPORTE = 9 -- INTERÉS IMPAGADO'+coCRLF+
          '                GROUP BY ID_OLTP_PRODUCTO'+coCRLF+
          '              ) CCS,'+coCRLF+
          '              DM_CR_FAC_CREDITO@DWHC DCFC,'+coCRLF+
          '              DM_CR_DIM_CREDITO@DWHC DCDC'+coCRLF+
          '         WHERE DCFC.ID_ANIO_MES = DCDM.ID_ANIO_MES'+coCRLF+
          '           AND DCDC.ID_CREDITO = DCFC.ID_CREDITO'+coCRLF+
          '           AND DCDC.ID_OLTP_PRODUCTO = CCS.ID_OLTP_PRODUCTO'+coCRLF+
          '       ) COINCRE,'+coCRLF+
          '       ( SELECT ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
          '         FROM CR_COINCRE_SAP'+coCRLF+
          '         WHERE ID_REPORTE = 9 -- INTERÉS IMPAGADO'+coCRLF+
          '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA'+coCRLF+
          '       ) METRICA,'+coCRLF+
          '       SECTOR S'+coCRLF+
          ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= COINCRE.ID_OLTP_PRODUCTO'+coCRLF+
          '   AND METRICA.CVE_SECTOR (+)= COINCRE.CVE_OLTP_SECTOR'+coCRLF+
          '   AND METRICA.CVE_MONEDA (+)= COINCRE.ID_OLTP_MONEDA'+coCRLF+
          '   AND COINCRE.ID_OLTP_MONEDA  <> 800 -- UDIS'+coCRLF+
          '   AND COINCRE.IMP_INT_IMP <> 0'+coCRLF+
          '   AND S.CVE_SECTOR (+)= COINCRE.CVE_OLTP_SECTOR'+coCRLF+
          ' GROUP BY COINCRE.ID_OLTP_MONEDA, COINCRE.ID_OLTP_PRODUCTO, COINCRE.PRODUCTO, COINCRE.CVE_OLTP_SECTOR, S.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF
          ;
          vlbColocaUnionAll := True;
          End; // If (pebMuestraI_IMP) Then

      If (pebMuestraI_VEN) Then
          Begin
          If (vlbColocaUnionAll) Then
              VlSalida := VlSalida + coCRLF + ' UNION ALL' + coCRLF;

          VlSalida := VlSalida +
          coCRLF+
          ' -- COINCRE INTERES VENCIDO'+coCRLF+
          ' SELECT DECODE(COINCRE.ID_OLTP_MONEDA, 484, ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
          '        ''COINCRE'' AS ORIGEN,''INTERES'' AS TIPO_CUENTA,''VENCIDO'' AS SEGMENTO,'+coCRLF+
          '        0 AS SDO_FIN_PER,(SUM(COINCRE.IMP_INT_DEV_VDO)) as SDO_COINCRE, COINCRE.ID_OLTP_PRODUCTO AS CVE_CTA_CONTABLE,'+coCRLF+
          '        COINCRE.PRODUCTO AS NOMBRE_PROD, COINCRE.CVE_OLTP_SECTOR AS CVE_SECTOR, S.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF+
          ' FROM  ( SELECT DCFC.IMP_INT_DEV_VDO AS IMP_INT_DEV_VDO,'+coCRLF+
          '                DCDC.ID_OLTP_PRODUCTO,'+coCRLF+
          '                DCDC.PRODUCTO,'+coCRLF+
          '                DCDC.ID_OLTP_MONEDA,'+coCRLF+
          '                DCDC.CVE_OLTP_SECTOR'+coCRLF+
          '         FROM ( SELECT ID_ANIO_MES FROM DM_CR_DIM_MES@DWHC DCDM'+coCRLF+
          '                WHERE DCDM.ANIO = '+vlStrGJAHR+' AND DCDM.NUM_MES = '+vlStrMONAT+coCRLF+
          '              ) DCDM,'+coCRLF+
          '              ( SELECT ID_OLTP_PRODUCTO'+coCRLF+
          '                FROM CR_COINCRE_SAP'+coCRLF+
          '                WHERE ID_REPORTE = 31 -- INTERÉS VENCIDO'+coCRLF+
          '                GROUP BY ID_OLTP_PRODUCTO'+coCRLF+
          '              ) CCS,'+coCRLF+
          '              DM_CR_FAC_CREDITO@DWHC DCFC,'+coCRLF+
          '              DM_CR_DIM_CREDITO@DWHC DCDC'+coCRLF+
          '         WHERE DCFC.ID_ANIO_MES = DCDM.ID_ANIO_MES'+coCRLF+
          '           AND DCDC.ID_CREDITO = DCFC.ID_CREDITO'+coCRLF+
          '           AND DCDC.ID_OLTP_PRODUCTO = CCS.ID_OLTP_PRODUCTO'+coCRLF+
          '       ) COINCRE,'+coCRLF+
          '       ( SELECT ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
          '         FROM CR_COINCRE_SAP'+coCRLF+
          '         WHERE ID_REPORTE = 31 -- INTERÉS VENCIDO'+coCRLF+
          '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA'+coCRLF+
          '       ) METRICA,'+coCRLF+
          '       SECTOR S'+coCRLF+
          ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= COINCRE.ID_OLTP_PRODUCTO'+coCRLF+
          '   AND METRICA.CVE_SECTOR (+)= COINCRE.CVE_OLTP_SECTOR'+coCRLF+
          '   AND METRICA.CVE_MONEDA (+)= COINCRE.ID_OLTP_MONEDA'+coCRLF+
          '   AND COINCRE.ID_OLTP_MONEDA  <> 800 -- UDIS'+coCRLF+
          '   AND COINCRE.IMP_INT_DEV_VDO <> 0'+coCRLF+
          '   AND S.CVE_SECTOR (+)= COINCRE.CVE_OLTP_SECTOR'+coCRLF+
          ' GROUP BY COINCRE.ID_OLTP_MONEDA, COINCRE.ID_OLTP_PRODUCTO, COINCRE.PRODUCTO, COINCRE.CVE_OLTP_SECTOR, S.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF
          ;
          vlbColocaUnionAll := True;
          End; // If (pebMuestraI_VEN) Then

          VlSalida := VlSalida + ArmaQuery_CONTABLE_SAP(PEMes,PEAnio,
                                                        vlbColocaUnionAll,
                                                        pebMuestraK_VIG,
                                                        pebMuestraK_IMP,
                                                        pebMuestraK_VEN,
                                                        pebMuestraI_VIG,
                                                        pebMuestraI_IMP,
                                                        pebMuestraI_VEN,
                                                        True // -- Incluye intereses cobrados x anticipados
                                                        );
                                                                
      VlSalida :=  VlSalida +
      //GRUPOS
       '  ) ORDER BY MONEDA, TIPO_CUENTA, SEGMENTO, ID_METRICA, CVE_SECTOR, ORIGEN, CVE_CTA_CONTABLE'+coCRLF;
     END;
     Result := VlSalida;
end;


Function TQrCompCOINCREDetalle.ArmaQuery_COINCRE_Detalle(PEMes,PEAnio : Integer; PETipoCar : String; PETipoRep : String; Detalle : Boolean): String;
var
     VlSalida  : String;
     VLFechaD  : String;
     vlCredito,vlCredito2,vlCredito3: String;
     vlStrID_ANIO_MES : String;
begin

     //DIARIO Y DIARIO MENSUAL
     if ((PETipoRep = 'DI') OR (PETipoRep = 'DM') OR (PETipoRep = 'ME'))  then
     begin
           if (PETipoRep = 'DI') then
              VLFechaD := 'TRUNC(SYSDATE - 1)';
           //end if
           if ((PETipoRep = 'DM') Or (PETipoRep = 'ME')) then
           begin
              VLFechaD := 'LAST_DAY(TO_DATE('+#39+'01'+#39+'||TO_CHAR('+IntToStr(peMes)+','+#39+'00'+#39+')||TO_CHAR('+IntToStr(peAnio)+','+#39+'0000'+#39+'),'+#39+'DDMMYYYY'+#39+'))';
           end;
           If Detalle then
           begin
             vlCredito:=',CONS.ID_CREDITO';
             vlCredito2:=', NULL AS ID_CREDITO';
             vlCredito3:=', ID_CREDITO';
           end
           else
           begin
             vlCredito:=''; vlCredito2:=''; vlCredito3:='';
           end;

           ////////////////////////////////////////////////////
           ////////////////  C O I N C R E   //////////////////
           ////////////////////////////////////////////////////

           // Obtiene el Identificador del Ano Mes en la base de datos de DWHC           
           vlStrID_ANIO_MES := IntToStr(ObtenIdAnioMes(Apli, PEAnio, peMES));
           If (vlStrID_ANIO_MES = '-1') Then
              Begin
              MessageDlg('Problemas al obtener el ID ANIO MES del Mes '+IntToStr(peMes)+' Anio '+IntToStr(peAnio),
                         mtError, [mbOk], 0);
              Exit;
              End;

      VlSalida :=
               ' SELECT * FROM ( '+coCRLF+
               ' -- COINCRE'+coCRLF+
               ' -- Capital Vigente'+coCRLF+
               '         SELECT DimCre.MONEDA AS MONEDA,''COINCRE''AS ORIGEN, ''CAPITAL'' AS TIPO_CUENTA, ''VIGENTE'' AS SEGMENTO,'+coCRLF+
               '         0 AS SDO_FIN_PER, (SUM(Imp_Sdo_K_Vig)) as SDO_COINCRE,'+coCRLF+
               '         DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO  AS NOMBRE_PROD,DimCre.CVE_SECTOR,DimCre.DESC_SECTOR,'+coCRLF+
               '         METRICA.ID_METRICA'+coCRLF+
               '         FROM'+coCRLF+
               '               (SELECT * FROM DM_CR_FAC_Credito@dwhc FacCre WHERE FacCre.id_anio_mes = '+vlStrID_ANIO_MES+' ) FacCre,'+coCRLF+
               '               (SELECT DimCre.*, s.cve_sector, s.desc_sector FROM DM_CR_DIM_Credito@dwhc DimCre, persona p, sector s'+coCRLF+
               '                             WHERE DimCre.ID_OLTP_MONEDA <> 800'+coCRLF+
               '                                   AND  DimCre.ID_OLTP_ACREDITADO=p.id_persona'+coCRLF+
               '                                   AND p.cve_tipo_sector = s.cve_sector) DimCre,'+coCRLF+
               '                DM_CR_DIM_Mes@dwhc DimMes,'+coCRLF+
               ''+coCRLF+
               '        (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
               '                FROM CR_COINCRE_CONCD where ID_REPORTE = 4'+coCRLF+
               '          GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA) METRICA'+coCRLF+
               ''+coCRLF+
               ''+coCRLF+
               '         WHERE  FacCre.Id_Credito        = DimCre.Id_Credito'+coCRLF+
               '         AND    FacCre.Id_Anio_Mes       = DimMes.Id_Anio_Mes'+coCRLF+
               '         AND    METRICA.ID_OLTP_PRODUCTO (+)= DimCre.ID_OLTP_PRODUCTO'+coCRLF+
               '                 AND    METRICA.CVE_SECTOR		(+)= DimCre.CVE_SECTOR'+coCRLF+
               '                 AND    METRICA.CVE_MONEDA		(+)= DimCre.ID_OLTP_MONEDA'+coCRLF+
               '                 AND    FacCre.Imp_Sdo_K_Vig        <> 0'+coCRLF+
               '         group by DimCre.MONEDA, DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO,DimCre.CVE_SECTOR,DimCre.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF+
               '         UNION ALL'+coCRLF+
               ' -- Capital IMPAGADO'+coCRLF+
               '         SELECT DimCre.MONEDA AS MONEDA,''COINCRE''AS ORIGEN, ''CAPITAL'' AS TIPO_CUENTA, ''IMPAGADO'' AS SEGMENTO,'+coCRLF+
               '         0 AS SDO_FIN_PER, (SUM(Imp_Sdo_K_Imp)) as SDO_COINCRE,'+coCRLF+
               '         DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO  AS NOMBRE_PROD,DimCre.CVE_SECTOR,DimCre.DESC_SECTOR,'+coCRLF+
               '         METRICA.ID_METRICA'+coCRLF+
               '         FROM'+coCRLF+
               '                       (SELECT * FROM DM_CR_FAC_Credito@dwhc FacCre WHERE FacCre.id_anio_mes =  '+vlStrID_ANIO_MES+' ) FacCre,'+coCRLF+
               '               (SELECT DimCre.*, s.cve_sector, s.desc_sector FROM DM_CR_DIM_Credito@dwhc DimCre, persona p, sector s'+coCRLF+
               '                             WHERE DimCre.ID_OLTP_MONEDA <> 800'+coCRLF+
               '                                   AND  DimCre.ID_OLTP_ACREDITADO=p.id_persona'+coCRLF+
               '                                   AND p.cve_tipo_sector = s.cve_sector) DimCre,'+coCRLF+
               '                DM_CR_DIM_Mes@dwhc DimMes,'+coCRLF+
               ''+coCRLF+
               '        (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
               '                FROM CR_COINCRE_CONCD where ID_REPORTE = 16'+coCRLF+
               '          GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA) METRICA'+coCRLF+
               ''+coCRLF+
               ''+coCRLF+
               '         WHERE  FacCre.Id_Credito        = DimCre.Id_Credito'+coCRLF+
               '         AND    FacCre.Id_Anio_Mes       = DimMes.Id_Anio_Mes'+coCRLF+
               '         AND    METRICA.ID_OLTP_PRODUCTO (+)= DimCre.ID_OLTP_PRODUCTO'+coCRLF+
               '                 AND    METRICA.CVE_SECTOR		(+)= DimCre.CVE_SECTOR'+coCRLF+
               '                 AND    METRICA.CVE_MONEDA		(+)= DimCre.ID_OLTP_MONEDA'+coCRLF+
               '                 AND    FacCre.Imp_Sdo_K_Imp        <> 0'+coCRLF+
               '         group by DimCre.MONEDA, DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO,DimCre.CVE_SECTOR,DimCre.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF+
               '         UNION ALL'+coCRLF+
               ' -- Capital VENCIDO'+coCRLF+
               '         SELECT DimCre.MONEDA AS MONEDA,''COINCRE''AS ORIGEN, ''CAPITAL'' AS TIPO_CUENTA, ''VENCIDO'' AS SEGMENTO,'+coCRLF+
               '         0 AS SDO_FIN_PER, (SUM(Imp_Sdo_K_Ven)) as SDO_COINCRE,'+coCRLF+
               '         DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO  AS NOMBRE_PROD,DimCre.CVE_SECTOR,DimCre.DESC_SECTOR,'+coCRLF+
               '         METRICA.ID_METRICA'+coCRLF+
               '         FROM'+coCRLF+
               '                       (SELECT * FROM DM_CR_FAC_Credito@dwhc FacCre WHERE FacCre.id_anio_mes =  '+vlStrID_ANIO_MES+' ) FacCre,'+coCRLF+
               '               (SELECT DimCre.*, s.cve_sector, s.desc_sector FROM DM_CR_DIM_Credito@dwhc DimCre, persona p, sector s'+coCRLF+
               '                             WHERE DimCre.ID_OLTP_MONEDA <> 800'+coCRLF+
               '                                   AND  DimCre.ID_OLTP_ACREDITADO=p.id_persona'+coCRLF+
               '                                   AND p.cve_tipo_sector = s.cve_sector) DimCre,'+coCRLF+
               '                DM_CR_DIM_Mes@dwhc DimMes,'+coCRLF+
               ''+coCRLF+
               '        (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
               '                FROM CR_COINCRE_CONCD where ID_REPORTE = 20'+coCRLF+
               '          GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA) METRICA'+coCRLF+
               ''+coCRLF+
               ''+coCRLF+
               '         WHERE  FacCre.Id_Credito        = DimCre.Id_Credito'+coCRLF+
               '         AND    FacCre.Id_Anio_Mes       = DimMes.Id_Anio_Mes'+coCRLF+
               '         AND    METRICA.ID_OLTP_PRODUCTO (+)= DimCre.ID_OLTP_PRODUCTO'+coCRLF+
               '                 AND    METRICA.CVE_SECTOR		(+)= DimCre.CVE_SECTOR'+coCRLF+
               '                 AND    METRICA.CVE_MONEDA		(+)= DimCre.ID_OLTP_MONEDA'+coCRLF+
               '                 AND    FacCre.Imp_Sdo_K_Ven        <> 0'+coCRLF+
               '         group by DimCre.MONEDA, DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO,DimCre.CVE_SECTOR,DimCre.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF+
               '         UNION ALL'+coCRLF+
               ' --Interes VIGENTE'+coCRLF+
               '         SELECT DimCre.MONEDA AS MONEDA,''COINCRE''AS ORIGEN, ''INTERES'' AS TIPO_CUENTA, ''VIGENTE'' AS SEGMENTO,'+coCRLF+
               '         0 AS SDO_FIN_PER, (SUM(IMP_INT_CORTE)) as SDO_COINCRE,'+coCRLF+
               '         DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO  AS NOMBRE_PROD,DimCre.CVE_SECTOR,DimCre.DESC_SECTOR,'+coCRLF+
               '         METRICA.ID_METRICA'+coCRLF+
               '         FROM'+coCRLF+
               '                       (SELECT * FROM DM_CR_FAC_Credito@dwhc FacCre WHERE FacCre.id_anio_mes =  '+vlStrID_ANIO_MES+' ) FacCre,'+coCRLF+
               '               (SELECT DimCre.*, s.cve_sector, s.desc_sector FROM DM_CR_DIM_Credito@dwhc DimCre, persona p, sector s'+coCRLF+
               '                             WHERE DimCre.ID_OLTP_MONEDA <> 800'+coCRLF+
               '                                   AND  DimCre.ID_OLTP_ACREDITADO=p.id_persona'+coCRLF+
               '                                   AND p.cve_tipo_sector = s.cve_sector) DimCre,'+coCRLF+
               '                DM_CR_DIM_Mes@dwhc DimMes,'+coCRLF+
               ''+coCRLF+
               '        (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
               '                FROM CR_COINCRE_CONCD where ID_REPORTE = 30'+coCRLF+
               '          GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA) METRICA'+coCRLF+
               ''+coCRLF+
               ''+coCRLF+
               '         WHERE  FacCre.Id_Credito        = DimCre.Id_Credito'+coCRLF+
               '         AND    FacCre.Id_Anio_Mes       = DimMes.Id_Anio_Mes'+coCRLF+
               '         AND    METRICA.ID_OLTP_PRODUCTO (+)= DimCre.ID_OLTP_PRODUCTO'+coCRLF+
               '                 AND    METRICA.CVE_SECTOR		(+)= DimCre.CVE_SECTOR'+coCRLF+
               '                 AND    METRICA.CVE_MONEDA		(+)= DimCre.ID_OLTP_MONEDA'+coCRLF+
               '                 AND    FacCre.IMP_INT_CORTE        <> 0'+coCRLF+
               '         group by DimCre.MONEDA, DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO,DimCre.CVE_SECTOR,DimCre.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF+
               '         UNION ALL'+coCRLF+
               ' --Interes IMPAGADO'+coCRLF+
               '         SELECT DimCre.MONEDA AS MONEDA,''COINCRE''AS ORIGEN, ''INTERES'' AS TIPO_CUENTA, ''IMPAGADO'' AS SEGMENTO,'+coCRLF+
               '         0 AS SDO_FIN_PER, (SUM(Imp_Sdo_IO_Imp)) as SDO_COINCRE,'+coCRLF+
               '         DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO  AS NOMBRE_PROD,DimCre.CVE_SECTOR,DimCre.DESC_SECTOR,'+coCRLF+
               '         METRICA.ID_METRICA'+coCRLF+
               '         FROM'+coCRLF+
               '                       (SELECT * FROM DM_CR_FAC_Credito@dwhc FacCre WHERE FacCre.id_anio_mes =  '+vlStrID_ANIO_MES+' ) FacCre,'+coCRLF+
               '               (SELECT DimCre.*, s.cve_sector, s.desc_sector FROM DM_CR_DIM_Credito@dwhc DimCre, persona p, sector s'+coCRLF+
               '                             WHERE DimCre.ID_OLTP_MONEDA <> 800'+coCRLF+
               '                                   AND  DimCre.ID_OLTP_ACREDITADO=p.id_persona'+coCRLF+
               '                                   AND p.cve_tipo_sector = s.cve_sector) DimCre,'+coCRLF+
               '                DM_CR_DIM_Mes@dwhc DimMes,'+coCRLF+
               ''+coCRLF+
               '        (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
               '                FROM CR_COINCRE_CONCD where ID_REPORTE = 9'+coCRLF+
               '          GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA) METRICA'+coCRLF+
               ''+coCRLF+
               ''+coCRLF+
               '         WHERE  FacCre.Id_Credito        = DimCre.Id_Credito'+coCRLF+
               '         AND    FacCre.Id_Anio_Mes       = DimMes.Id_Anio_Mes'+coCRLF+
               '         AND    METRICA.ID_OLTP_PRODUCTO (+)= DimCre.ID_OLTP_PRODUCTO'+coCRLF+
               '                 AND    METRICA.CVE_SECTOR		(+)= DimCre.CVE_SECTOR'+coCRLF+
               '                 AND    METRICA.CVE_MONEDA		(+)= DimCre.ID_OLTP_MONEDA'+coCRLF+
               '                 AND    FacCre.Imp_Sdo_IO_Imp        <> 0'+coCRLF+
               '         group by DimCre.MONEDA, DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO,DimCre.CVE_SECTOR,DimCre.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF+
               '         UNION ALL'+coCRLF+
               ' --Interes VENCIDO'+coCRLF+
               '         SELECT DimCre.MONEDA AS MONEDA,''COINCRE''AS ORIGEN, ''INTERES'' AS TIPO_CUENTA, ''VENCIDO'' AS SEGMENTO,'+coCRLF+
               '         0 AS SDO_FIN_PER, (SUM(IMP_INT_DEV_VDO)) as SDO_COINCRE,'+coCRLF+
               '         DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO  AS NOMBRE_PROD,DimCre.CVE_SECTOR,DimCre.DESC_SECTOR,'+coCRLF+
               '         METRICA.ID_METRICA'+coCRLF+
               '         FROM'+coCRLF+
               '                       (SELECT * FROM DM_CR_FAC_Credito@dwhc FacCre WHERE FacCre.id_anio_mes =  '+vlStrID_ANIO_MES+' ) FacCre,'+coCRLF+
               '               (SELECT DimCre.*, s.cve_sector, s.desc_sector FROM DM_CR_DIM_Credito@dwhc DimCre, persona p, sector s'+coCRLF+
               '                             WHERE DimCre.ID_OLTP_MONEDA <> 800'+coCRLF+
               '                                   AND  DimCre.ID_OLTP_ACREDITADO=p.id_persona'+coCRLF+
               '                                   AND p.cve_tipo_sector = s.cve_sector) DimCre,'+coCRLF+
               '                DM_CR_DIM_Mes@dwhc DimMes,'+coCRLF+
               ''+coCRLF+
               '        (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
               '                FROM CR_COINCRE_CONCD where ID_REPORTE = 31'+coCRLF+
               '          GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA) METRICA'+coCRLF+
               ''+coCRLF+
               ''+coCRLF+
               '         WHERE  FacCre.Id_Credito        = DimCre.Id_Credito'+coCRLF+
               '         AND    FacCre.Id_Anio_Mes       = DimMes.Id_Anio_Mes'+coCRLF+
               '         AND    METRICA.ID_OLTP_PRODUCTO (+)= DimCre.ID_OLTP_PRODUCTO'+coCRLF+
               '                 AND    METRICA.CVE_SECTOR		(+)= DimCre.CVE_SECTOR'+coCRLF+
               '                 AND    METRICA.CVE_MONEDA		(+)= DimCre.ID_OLTP_MONEDA'+coCRLF+
               '                 AND    FacCre.IMP_INT_DEV_VDO        <> 0'+coCRLF+
               '         group by DimCre.MONEDA, DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO,DimCre.CVE_SECTOR,DimCre.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF+
               '         UNION ALL'+coCRLF+
               ' --Interes COB_ANT'+coCRLF+
               '         SELECT DimCre.MONEDA AS MONEDA,''COINCRE''AS ORIGEN, ''INTERES'' AS TIPO_CUENTA, ''COB_ANT'' AS SEGMENTO,'+coCRLF+
               '         0 AS SDO_FIN_PER, (SUM(IMP_INT_COB_ANT	)) as SDO_COINCRE,'+coCRLF+
               '         DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO  AS NOMBRE_PROD,DimCre.CVE_SECTOR,DimCre.DESC_SECTOR,'+coCRLF+
               '         METRICA.ID_METRICA'+coCRLF+
               '         FROM'+coCRLF+
               '                       (SELECT * FROM DM_CR_FAC_Credito@dwhc FacCre WHERE FacCre.id_anio_mes =  '+vlStrID_ANIO_MES+' ) FacCre,'+coCRLF+
               '               (SELECT DimCre.*, s.cve_sector, s.desc_sector FROM DM_CR_DIM_Credito@dwhc DimCre, persona p, sector s'+coCRLF+
               '                             WHERE DimCre.ID_OLTP_MONEDA <> 800'+coCRLF+
               '                                   AND  DimCre.ID_OLTP_ACREDITADO=p.id_persona'+coCRLF+
               '                                   AND p.cve_tipo_sector = s.cve_sector) DimCre,'+coCRLF+
               '                DM_CR_DIM_Mes@dwhc DimMes,'+coCRLF+
               ''+coCRLF+
               '        (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
               '                FROM CR_COINCRE_CONCD where ID_REPORTE = 32'+coCRLF+
               '          GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA) METRICA'+coCRLF+
               ''+coCRLF+
               ''+coCRLF+
               '         WHERE  FacCre.Id_Credito        = DimCre.Id_Credito'+coCRLF+
               '         AND    FacCre.Id_Anio_Mes       = DimMes.Id_Anio_Mes'+coCRLF+
               '         AND    METRICA.ID_OLTP_PRODUCTO (+)= DimCre.ID_OLTP_PRODUCTO'+coCRLF+
               '                 AND    METRICA.CVE_SECTOR		(+)= DimCre.CVE_SECTOR'+coCRLF+
               '                 AND    METRICA.CVE_MONEDA		(+)= DimCre.ID_OLTP_MONEDA'+coCRLF+
               '                 AND    FacCre.IMP_INT_COB_ANT	 <> 0'+coCRLF+
               '         group by DimCre.MONEDA, DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO,DimCre.CVE_SECTOR,DimCre.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF+
               ''+coCRLF+
               ' ) ORDER BY MONEDA, TIPO_CUENTA, SEGMENTO,ID_METRICA,CVE_SECTOR ,ORIGEN, ID_OLTP_PRODUCTO'+coCRLF
               ;
     end;
     Result := VlSalida;
end;

procedure TQrCompCOINCREDetalle.qrDetalleBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
     PrintBand := (qCompCOINSDO_COINCRE.AsCurrency + qCompCOINSDO_FIN_PER.AsCurrency)<> 0;
     if vgBPintaTotalProd = False then
        vgBPintaTotalProd := (qCompCOINSDO_COINCRE.AsCurrency + qCompCOINSDO_FIN_PER.AsCurrency)<> 0;
     //end if;
end;

procedure TQrCompCOINCREDetalle.qrGrupoMetricaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     vgBPintaTotalProd := False;
end;

procedure TQrCompCOINCREDetalle.qrPiedeGrupoMetricaBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
     PrintBand := vgBPintaTotalProd;
end;

procedure TQrCompCOINCREDetalle.IniciaArchivoExcel(peFileName : String);
const aColumnWidth : Array[1..19] of Double = ( 2.14,  2.14, 6.86, 7.29, 3.00,  8.43, 49.43,
                                               14.00,    14, 8.43, 8.43, 8.43, 14.14,  8.43,
                                                8.43,  8.43, 8.43, 8.43, 45.43);

    procedure IniciaArchivoExcelNuevo;
    begin
      vgExcelApp := CreateOleObject('Excel.Application');
      vgExcelApp.Workbooks.Add;
    end;

var vlColumnRange : Variant;
    vlRange : Variant;
    vlCol : Integer;
    // vlRange : Variant;
    // vlRow : Integer;
    // vlstrRow : String;
begin
  IniciaArchivoExcelNuevo;

  vlColumnRange := vgExcelApp.Workbooks[1].WorkSheets[1].Columns;
  // Coloca el ancho de las columnas
  For vlCol := 1 To High(aColumnWidth) Do
    Begin
    vlColumnRange.Columns[vlCol].Font.Size := 8;
    vlColumnRange.Columns[vlCol].ColumnWidth := aColumnWidth[vlCol];
    End;
   If Assigned(vgStrList) Then vgStrList.Clear
   Else vgStrList := TStringList.Create;    

   // Coloca los títulos de las columnas
   vgNumRow := 1;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('D') ].Value := 'PRODUCTO-SUBTIPO';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('G') ].Value := 'CUENTA CONTABLE';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].Value := 'SALDO COINCRE';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].Value := 'SALDO CONTABLE';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('J') ].Value := 'DIFERENCIAS';

   //Le da formato al renglón de Titulos
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':J'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':J'+IntToStr(vgNumRow)].Font.Color := clWhite;
   vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['A'+IntToStr(vgNumRow)+':J'+IntToStr(vgNumRow)];
   try
     vgExcelApp.ActiveWindow.FreezePanes:=False;
     //vgExcelApp.Workbooks[1].WorkSheets[1].Range['A2'];
     //vgExcelApp.ActiveWindow.FreezePanes := True
   finally
   end;

   vlRange.Columns.Interior.ColorIndex := 1;

   // Deja un renglon en blanco
   Inc(vgNumRow);

   // Se aumenta un renglon más en donde dara inicio la colocación de la información
   Inc(vgNumRow);

   // Prepara la información para colocar los datos
   {
   For vlRow := 1 To 50 Do
     Begin
     vlstrRow := IntToStr(vlRow);
     vgExcelApp.Cells[ vlRow , ColumnXlS('N') ].Value := vlRow;
     vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['N'+vlstrRow+':O'+vlstrRow];
     vlRange.Columns.Interior.ColorIndex := vlRow;
     End;
   vlRange.WrapText := True;
   }
end;

function TQrCompCOINCREDetalle.Cierra_Y_Guarda_ArchivoExcel : Boolean;
begin
  Result := False;
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Then Exit;
  //
    If (Not vgbUtilizaArchivoConcil) Then
      vgExcelApp.ActiveWorkBook.SaveAs(vgArchivoExcel);

  vgStrList.Clear;
  vgStrList.Free;
  Result := CloseExcelFile(vgExcelApp);
end;

procedure TQrCompCOINCREDetalle.AgregaSaldosArchivoExcel(peCVE_SECTOR,
                                                  peDESC_SECTOR,
                                                  peID_OLTP_PRODUCTO_or_peCVE_CTA_CONTABLE,
                                                  peDESC_OLTP_PRODUCTO : String;
                                                  peIMP_SDO_COINCRE,
                                                  peIMP_SDO_CONTABLE : Double
                                                 );
var vlCVE_CTA_CONTABLE : String;                                                 
begin
   // Valida si se genera o no el Archivo de Excel
   If (Not vgBGeneraArchivo) Then Exit;
   //
   Inc(vgNumRow);
   vgExcelApp.Rows[vgNumRow].RowHeight := 11.25;
   If (Trim(peCVE_SECTOR) <> '') Then
      Begin
      vgExcelApp.Range['H'+IntToStr(vgNumRow)+':I'+IntToStr(vgNumRow)].Font.Bold := True;
      vgExcelApp.Cells[ vgNumRow , ColumnXlS('C') ].Value := 'SECTOR:';
      vgExcelApp.Cells[ vgNumRow , ColumnXlS('D') ].Value := peCVE_SECTOR;
      vgExcelApp.Cells[ vgNumRow , ColumnXlS('E') ].Value := peDESC_SECTOR;
      End
  Else
     Begin
         If (Trim(peDESC_OLTP_PRODUCTO) <> '') Then
            Begin
            vgExcelApp.Cells[ vgNumRow , ColumnXlS('F') ].Value := peID_OLTP_PRODUCTO_or_peCVE_CTA_CONTABLE;
            vgExcelApp.Cells[ vgNumRow , ColumnXlS('G') ].Value := peDESC_OLTP_PRODUCTO;
            vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].Value := peIMP_SDO_COINCRE;
            vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].NumberFormat := '#,##0.00';
            vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].Value := peIMP_SDO_CONTABLE;
            vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].NumberFormat := '#,##0.00';
            vgNumRowIniciaCuentas := vgNumRow;
            End
         Else
            Begin
            vlCVE_CTA_CONTABLE := #39 + peID_OLTP_PRODUCTO_or_peCVE_CTA_CONTABLE;
            // Identifica en donde va a guardar la primer cuenta contable
            If (Trim(vgCVE_CTA_CONTABLE_1) = '') Then
              vgCVE_CTA_CONTABLE_1 := vlCVE_CTA_CONTABLE
            Else
              vgCVE_CTA_CONTABLE_2 := vlCVE_CTA_CONTABLE;
            //
            vgExcelApp.Cells[ vgNumRow , ColumnXlS('E') ].Value := vlCVE_CTA_CONTABLE;
            vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].Value := peIMP_SDO_COINCRE;
            vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].NumberFormat := '#,##0.00';
            vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].Value := peIMP_SDO_CONTABLE;
            vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].NumberFormat := '#,##0.00';
            End;
     End;
end;

procedure TQrCompCOINCREDetalle.ColocaFormulas;
var vlRange : Variant;
begin
   // Valida si se genera o no el Archivo de Excel
   If (Not vgBGeneraArchivo) Then Exit;
   //
   Inc(vgNumRow);
   // Coloca Linea
   vgExcelApp.Cells[vgNumRow,ColumnXlS('C') ].Value := ' ';
   vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['C'+IntToStr(vgNumRow)+':J'+IntToStr(vgNumRow)];
   vlRange.Columns.Interior.ColorIndex := 1;
   // Coloca Alto de Renglón
   vgExcelApp.Rows[vgNumRow].RowHeight := 0.75;
   Inc(vgNumRow);

   // Coloca Formúlas
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].Value := '=SUM(H'+IntToStr(vgNumRowIniciaSector+2)+':H'+IntToStr(vgNumRow-1)+')';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].Value := '=SUM(I'+IntToStr(vgNumRowIniciaSector+2)+':I'+IntToStr(vgNumRow-1)+')';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('J') ].Value := '=H'+IntToStr(vgNumRow)+'-I'+IntToStr(vgNumRow);
//   vgExcelApp.Cells[ vgNumRow , ColumnXlS('N') ].Value := '=SUM(H'+IntToStr(vgNumRowIniciaSector+2)+':H'+IntToStr(vgNumRow-1)+')';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('P') ].Value := '=SUM(I'+IntToStr(vgNumRowIniciaSector+2)+':I'+IntToStr(vgNumRow-1)+')';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('F') ].Value := 'Total por Sector = '+qCompCOIN.FieldByName('CVE_SECTOR').AsString;

   // Coloca la Cuenta Padre o Comun de las 2 cuentas
{   vgExcelApp.Cells[ vgNumRow , ColumnXlS('M') ].Value := #39 +
                                                          CuentaComunPadre(TrimChar(vgCVE_CTA_CONTABLE_1,#32#39),
                                                                           TrimChar(vgCVE_CTA_CONTABLE_2,#32#39)); }

   //Coloca Formatos
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':K'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('J') ].NumberFormat := '#,##0.00';
//   vgExcelApp.Cells[ vgNumRow , ColumnXlS('N') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('P') ].NumberFormat := '#,##0.00';

   vgStrList.Add(IntToStr(vgNumRow));
   Inc(vgNumRow);
end;

procedure TQrCompCOINCREDetalle.qrGrupoMonedaAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   // Valida si se genera o no el Archivo de Excel
   If (Not vgBGeneraArchivo) Then Exit;
   //
   Inc(vgNumRow);
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':J'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := 'MONEDA:';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('D') ].Value := qCompCOIN.FieldByName('MONEDA').AsString;
end;

procedure TQrCompCOINCREDetalle.qrGrupoTipoCuentaAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var vlRange : Variant;
begin
   // Valida si se genera o no el Archivo de Excel
   If (Not vgBGeneraArchivo) Then Exit;
   //
   Inc(vgNumRow);
   vlRange := vgExcelApp.Range['B'+IntToStr(vgNumRow)+':J'+IntToStr(vgNumRow)];
   vlRange.Font.Bold := True;
   vlRange.Font.Color := clWhite;
   vlRange.Columns.Interior.ColorIndex := 1; // Negro

   vgExcelApp.Cells[ vgNumRow , ColumnXlS('B') ].Value := 'TIPO DE CUENTA:';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('E') ].Value := qCompCOIN.FieldByName('TIPO_CUENTA').AsString;
end;

procedure TQrCompCOINCREDetalle.qrGrupoSectorAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Then Exit;
  // Reinicia contadores y banderas
  vgNumRowIniciaSector := vgNumRow;
  vgCVE_CTA_CONTABLE_1 := '';
  vgCVE_CTA_CONTABLE_2 := '';
  //  
  AgregaSaldosArchivoExcel(qCompCOIN.FieldByName('CVE_SECTOR').AsString,   // peCVE_SECTOR
                           qCompCOIN.FieldByName('DESC_SECTOR').AsString,  // peDESC_SECTOR
                           '',                       // peID_OLTP_PRODUCTO_or_peCVE_CTA_CONTABLE
                           '',                       // peDESC_OLTP_PRODUCTO
                           0,                        // peIMP_SDO_COINCRE
                           0                         // peIMP_SDO_CONTABLE
                           );
end;

procedure TQrCompCOINCREDetalle.qrDetalleAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Then Exit;
  //
  AgregaSaldosArchivoExcel('',                           // peCVE_SECTOR
                           '',                           // peDESC_SECTOR
                           qCompCOIN.FieldByName('CVE_CTA_CONTABLE').AsString, // peID_OLTP_PRODUCTO_or_peCVE_CTA_CONTABLE
                           qCompCOIN.FieldByName('NOMBRE_PROD').AsString, // peDESC_OLTP_PRODUCTO
                           qCompCOIN.FieldByName('SDO_COINCRE').AsFloat,  // peIMP_SDO_COINCRE
                           qCompCOIN.FieldByName('SDO_FIN_PER').AsFloat   // peIMP_SDO_CONTABLE
                           );
end;

procedure TQrCompCOINCREDetalle.qrPiedeGrupoSectorAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Then Exit;
  //
  ColocaFormulas;
end;

procedure TQrCompCOINCREDetalle.qrPiedeGrupoMetricaAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var vlRange : Variant;
begin
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Or (Not vgBPintaTotalProd) Then Exit;

  // Coloca Linea
  vgExcelApp.Cells[vgNumRow,ColumnXlS('B') ].Value := ' ';
  vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['B'+IntToStr(vgNumRow)+':J'+IntToStr(vgNumRow)];
  // Coloca Alto de Renglón  
  vlRange.Columns.Interior.ColorIndex := 1;
  vgExcelApp.Rows[vgNumRow].RowHeight := 0.75;
  Inc(vgNumRow);
end;

procedure TQrCompCOINCREDetalle.qrGrupoSegmentoAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var vlRange : Variant;  
begin
  If Assigned(vgStrList) Then
     vgStrList.Clear;
   // Valida si se genera o no el Archivo de Excel
   If (Not vgBGeneraArchivo) Then Exit;
   //
   Inc(vgNumRow);
   vlRange := vgExcelApp.Range['C'+IntToStr(vgNumRow)+':J'+IntToStr(vgNumRow)];
   vlRange.Font.Bold := True;
   vlRange.Font.Color := clWhite;
   vlRange.Columns.Interior.ColorIndex := 16; // Gris Oscuro

   vgExcelApp.Cells[ vgNumRow , ColumnXlS('C') ].Value := qrlblSegmento.Caption;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('E') ].Value := '(' + qCompCOIN.FieldByName('TIPO_CUENTA').AsString + ')  '+
                                                          qCompCOIN.FieldByName('SEGMENTO').AsString + ')';
end;

procedure TQrCompCOINCREDetalle.qrPiedeGrupoSegmentoAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var I : Integer;
    vlstrFormula1, vlstrFormula2, vlstrPlus : String;
    vlRange : Variant;  
begin
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Then Exit;
  // Coloca Alto de Renglón
  vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['B'+IntToStr(vgNumRow)+':J'+IntToStr(vgNumRow)];  
  vlRange.Columns.Interior.ColorIndex := 1;
  vgExcelApp.Rows[vgNumRow].RowHeight := 0.75;
  // Coloca Formúlas de SUMATORIAS
  vlstrPlus := ''; vlstrFormula1 := ''; vlstrFormula2 := '';
  For I := 0 To vgStrList.Count-1 Do
    Begin
    vlstrFormula1 := vlstrFormula1 + vlstrPlus + 'H' + vgStrList[I];
    vlstrFormula2 := vlstrFormula2 + vlstrPlus + 'I' + vgStrList[I];
    vlstrPlus := '+';
    End;
  Inc(vgNumRow);
  Inc(vgNumRow);
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('F') ].Value := 'TOTAL';
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].Value := '='+vlstrFormula1;
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].Value := '='+vlstrFormula2;
  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':J'+IntToStr(vgNumRow)].Font.Bold := True;  
  Inc(vgNumRow);
end;

end.
