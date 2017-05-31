
unit IntQrCoCN;
            
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
  TQrCompCOINCREDetalleN = class(TQuickRep)
    QRBand1: TQRBand;
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
    QRDBText4: TQRDBText;
    qrdbTxtSegmento: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRShpMoneda: TQRShape;
    QRLabel8: TQRLabel;
    qrdbMONEDA: TQRDBText;
    QRShpSegmento: TQRShape;
    QRShpTipoCuenta: TQRShape;
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
    qrdbNOMBRE_PROD: TQRDBText;
    qrPiedeGrupoSector: TQRBand;
    qrdbCVE_SECTOR: TQRDBText;
    qrdbDESC_SECTOR: TQRDBText;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    qrlblSector: TQRLabel;
    QRLabel15: TQRLabel;
    QRShpSector: TQRShape;
    QRShpGrupoCta: TQRShape;
    QRShpTitle: TQRShape;
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
    qCompCOINID_METRICA: TStringField;
    QRTSec: TQRLabel;
    QRInterEncabezado1: TQRInterEncabezado;
    QRDCveCtaTot: TQRDBText;
    QRDBNomDetTot: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qCompCOINCVE_TIPO_CTA: TStringField;
    QRDBText3: TQRDBText;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    qrGrupoTipoCuenta: TQRGroup;
    qrGrupoSegmento: TQRGroup;
    qrGrupoMetrica: TQRGroup;
    qrGrupoSector: TQRGroup;
    QRTipoRest: TQRGroup;
    QRExpr10: TQRExpr;
    QRExpr19: TQRExpr;
    QRDifValorizada: TQRLabel;
    QRTCVal: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
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
    procedure Z(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrPiedeGrupoMetricaAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrGrupoSegmentoAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrPiedeGrupoSegmentoAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrGrupoSectorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrPiedeGrupoSectorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrPiedeGrupoSegmentoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrPiedeGrupoCuentaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrPiedeGrupoMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRTipoRestAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrPiedeGrupoMonedaAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrPiedeGrupoCuentaAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrGrupoMonedaAfterPrint(Sender: TQRCustomBand;
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
       vgStrList1 : TStringList;
       vgCVE_CTA_CONTABLE_1, vgCVE_CTA_CONTABLE_2 : String;
       vgdFechaEspecifica : TDateTime;
       vgTipoCambio : real;

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
                                       : Boolean;
                                       peFechaEspecifica : TDateTime
                                       ) : String;

       Function ArmaQuery_CONSOLIDADO_Detalle_SAP(PEMes,PEAnio : Integer;
                                                  PETipoRep : String;
                                                  pebMuestraK_VIG,
                                                  pebMuestraK_IMP,
                                                  pebMuestraK_VEN,
                                                  pebMuestraI_VIG,
                                                  pebMuestraI_IMP,
                                                  pebMuestraI_VEN,
                                                  pebMuestraI_ANT : Boolean;
                                                  peFechaEspecifica : TDateTime
                                                 ) : String;

       Function ArmaQuery_COINCRE_Detalle_SAP(PEMes,PEAnio : Integer;
                                              PETipoRep : String;
                                              pebMuestraK_VIG,
                                              pebMuestraK_IMP,
                                              pebMuestraK_VEN,
                                              pebMuestraI_VIG,
                                              pebMuestraI_IMP,
                                              pebMuestraI_VEN : Boolean;
                                              peFechaEspecifica : TDateTime
                                              ) : String;
  end;

var
  QrCompCOINCREDetalle: TQrCompCOINCREDetalleN;

Procedure RepCompCOINCREDetalleN(PEMes,PEAnio : Integer;
                                 PEMesTxt : String;
                                 pAPli     : TInterApli;
                                 pPreview  : Boolean;
                                 PETipoRep : String;
                                 PETipoDet : String;
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

function CuentaComunPadreS(peCVE_CTA_CONTABLE1, peCVE_CTA_CONTABLE2: String) : String;

var
   vgsdoconsol :  Currency;
   vgsdocontsap : Currency;
   vgsdoconsmone : Currency;
   vgsdocontsmon : Currency;

implementation

{$R *.DFM}

Procedure RepCompCOINCREDetalleN(PEMes,PEAnio : Integer;
                                 PEMesTxt : String;
                                 pAPli     : TInterApli;
                                 pPreview  : Boolean;
                                 PETipoRep : String;
                                 PETipoDet : String;
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
   QrCompCOINCREDetalle : TQrCompCOINCREDetalleN;
   Preview     : TIntQRPreview;
   vlLista     : TStringList;
   vlQry       : TQuery;
   vlstrQRY    : String;
   vlBCargaCOINCREConcluida : Boolean;
   vlFecha     : TDateTime;

begin
   QrCompCOINCREDetalle := TQrCompCOINCREDetalleN.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrCompCOINCREDetalle);
   vlLista := TStringList.Create;
   vlQry   := TQuery.Create(Nil);
   QrCompCOINCREDetalle.vgBGeneraArchivo := (ExtractFileName(Trim(peStrArchivoXLS)) <> '');
   QrCompCOINCREDetalle.vgArchivoExcel   := peStrArchivoXLS;
   vlBCargaCOINCREConcluida := BCargaCOINCREConcluida(pApli, PEAnio, PEMes);

   //RABA JUL 2015 Se obtiene la fecha de la especificada
   //vlFecha := pAPli.DameFechaEmpresa;
   If (pedFechaEspecifica = 0) Then
       vlFecha := pAPli.DameFechaEmpresa
   Else
       vlFecha := pedFechaEspecifica;
   //FIN RABA

   Try
      QrCompCOINCREDetalle.Apli := pApli;
      QrCompCOINCREDetalle.QRInterEncabezado1.Apli:=pApli;
      QrCompCOINCREDetalle.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrCompCOINCREDetalle.QRInterEncabezado1.NomReporte:='IntQrCoCN';

      QrCompCOINCREDetalle.vgdFechaEspecifica := pedFechaEspecifica;

      QrCompCOINCREDetalle.vgTipoCambio := 0;

      vgsdoconsol :=  0;
      vgsdocontsap := 0;
      vgsdoconsmone := 0;
      vgsdocontsmon := 0;

       GetSQLFloat('SELECT PKGCRCONTA.STPOBT_TIPO_CAMBIO_SAP(2,' + SQLFecha(QrCompCOINCREDetalle.vgdFechaEspecifica) + ',840) AS TIPO_CAMBIO FROM DUAL',
                     QrCompCOINCREDetalle.Apli.DataBaseName,QrCompCOINCREDetalle.Apli.SessionName, 'TIPO_CAMBIO',QrCompCOINCREDetalle.vgTipoCambio,true);

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
         QrCompCOINCREDetalle.QRInterEncabezado1.Titulo1 := 'COINCRE - CONTA DOS ' + '(M)';
         QrCompCOINCREDetalle.QRInterEncabezado1.Titulo2 := 'Periodo: ' +  PEMesTxt +  ' del ' + IntToStr(PEAnio);
         End;
      //end if

      if PETipoRep = 'DI' then
         Begin
         QrCompCOINCREDetalle.QRInterEncabezado1.Titulo1 := 'CONCILIADOR OPERATIVO-CONTABLE ' + '(D)';

             If (pedFechaEspecifica = 0) Then vlFecha := pAPli.DameFechaEmpresa
             Else vlFecha := pedFechaEspecifica;

             QrCompCOINCREDetalle.QRInterEncabezado1.Titulo2 := 'Del día: ' + FormatDateTime('dd/mm/yyyy', vlFecha);
         End;
      //end if

      if PETipoRep = 'DM' then
         Begin
         QrCompCOINCREDetalle.QRInterEncabezado1.Titulo1 := 'CONCILIADOR OPERATIVO-CONTABLE ' + '(DFM)';
         QrCompCOINCREDetalle.QRInterEncabezado1.Titulo2 := 'Periodo: ' +  PEMesTxt +  ' del ' + IntToStr(PEAnio);
         End;
      //end if

      if PETipoDet= 'DE' then
      begin
          QrCompCOINCREDetalle.QRInterEncabezado1.Titulo1 := QrCompCOINCREDetalle.QRInterEncabezado1.Titulo1 + ' DETALLE ';
          QrCompCOINCREDetalle.QRDCveCtaTot.Enabled := False;
          QrCompCOINCREDetalle.QRDBNomDetTot.Enabled := False;
      end
      else
      begin
          QrCompCOINCREDetalle.QRInterEncabezado1.Titulo1 := QrCompCOINCREDetalle.QRInterEncabezado1.Titulo1 + ' RESUMEN ';
          QrCompCOINCREDetalle.QRShpGrupoCta.Enabled := False;
          QrCompCOINCREDetalle.QRShpSector.Enabled := False;
          QrCompCOINCREDetalle.qrGrupoMetrica.Height := 0;
          QrCompCOINCREDetalle.qrGrupoSector.Height := 0;
          QrCompCOINCREDetalle.qrDetalle.Height := 0;
          QrCompCOINCREDetalle.qrPiedeGrupoSector.Height := 0;
      end;

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
                                               pebMuestraI_VIG, pebMuestraI_IMP,  pebMuestraI_VEN,
                                               vlFecha )
        // Si no se ha concluido la carga de COINCRE, procede a obtener los saldos del CONSOLIDADO
        Else
          vlstrQRY := QrCompCOINCREDetalle.ArmaQuery_CONSOLIDADO_Detalle_SAP(PEMes,PEAnio, PETipoRep,
                                           pebMuestraK_VIG, pebMuestraK_IMP, pebMuestraK_VEN,
                                           pebMuestraI_VIG, pebMuestraI_IMP,  pebMuestraI_VEN,
                                           TRUE,  //Interes Cob Por Ant...
                                           vlFecha );
        End
      Else
        Begin
        // Si es de tipo Diario, entonces...
          vlstrQRY := QrCompCOINCREDetalle.ArmaQuery_CONSOLIDADO_Detalle_SAP(PEMes,PEAnio, PETipoRep,
                                           pebMuestraK_VIG, pebMuestraK_IMP, pebMuestraK_VEN,
                                           pebMuestraI_VIG, pebMuestraI_IMP,  pebMuestraI_VEN,
                                           TRUE,  //Interes Cob Por Ant...
                                           vlFecha );
        End;

      If (QrCompCOINCREDetalle.vgBGeneraArchivo) Then
         QrCompCOINCREDetalle.IniciaArchivoExcel(QrCompCOINCREDetalle.vgArchivoExcel);

      QrCompCOINCREDetalle.qCompCOIN.SQL.Clear;
      QrCompCOINCREDetalle.qCompCOIN.SQL.Add(vlstrQRY);
      QrCompCOINCREDetalle.qCompCOIN.SQL.SaveToFile('c:\qryCOINCRE.SQL');
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

function CuentaComunPadreS(peCVE_CTA_CONTABLE1, peCVE_CTA_CONTABLE2: String) : String;
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

Function TQrCompCOINCREDetalleN.ArmaQuery_CONTABLE_SAP(PEMes, PEAnio : Integer;
                                                      pebColocaUnionAll,
                                                      pebMuestraK_VIG,
                                                      pebMuestraK_IMP,
                                                      pebMuestraK_VEN,
                                                      pebMuestraI_VIG,
                                                      pebMuestraI_IMP,
                                                      pebMuestraI_VEN,
                                                      pebMuestraI_ANT : Boolean;
                                                      peFechaEspecifica : TDateTime
                                                      ) : String;
var vlSalida, vlStrGJAHR, vlStrMONAT,
    vlStrSQLCheck, vlStrFiltro, vlStrLINK: String;
    vlTOTAL, vMes : Integer;
begin
  vlStrGJAHR := IntToStr(PEAnio);
  vlStrMONAT := IntToStr(PEMes);

  //  Con este query determina si existen registros contables SAP del mes solicitado,
  //  de lo contrario busca en los registros históricos
  vlStrSQLCheck :=
      ' SELECT COUNT(*) AS TOTAL FROM ZSALDOS_DET@SAP2FIPOLC'+coCRLF+
      ' WHERE MANDT IN (130) AND BUKRS = ''B000'''+coCRLF+
      '   AND GJAHR = TRIM(TO_CHAR('+vlStrGJAHR+',''0000''))'+coCRLF+
      '   AND MONAT = TRIM(TO_CHAR('+vlStrMONAT+',''00''))'+coCRLF
      ;
  If (GetSQLInt(vlStrSQLCheck, Apli.DataBaseName, Apli.SessionName, 'TOTAL', vlTOTAL, False) = False) Then
     vlTOTAL := 0;

  // Si no hay registros de zsaldos_det@SAP2FIPOLC los toma del histórico zsaldos_det@CONT
  If (vlTOTAL = 0) Then
     Begin
     // Agregado por Roberto Andres Silva Tello
     // Se agrega nueva tabla dependiendo si existem registros se mantiene Z_SALDOS@SAP2FIPOLC si no tiene registros se ocupa la tabla IZ_DET_SALDOS_SAP@DSTSAP

     vlStrLINK:= '';

//     vlStrLINK:= vlStrLINK + 'SELECT CUENTA AS HKONT, '''' AS S_CTA, AUXILIAR AS XREF1, SECTOR AS XREF3, CVE_MONEDA HWAER, ' +
//                             ' CVE_MONEDA WAERS, SUM(SDO_FIN_PER) AS S_FIN  ' + coCRLF+
     vlStrLINK:= vlStrLINK + 'SELECT TO_CHAR(CVE_CUENTA) AS HKONT, '''' AS S_CTA, '''' AS XREF1, ''99'' AS XREF3, MONEDA HWAER, '+
                             ' MONEDA WAERS, SUM(SDO_FINAL) AS S_FIN  ' + coCRLF+

//                             ' FROM CG_SALDOS_CTB@CONT ' + coCRLF +
                             '  FROM IZ_DET_SALDOS_SAP@STSAP ' + coCRLF +

//                             ' WHERE ID_EMPRESA = 2 AND CVE_EJER_CONT = ' + vlStrGJAHR + ' AND NUM_PERIODO = ' +vlStrMONAT + coCRLF +
                             ' WHERE SOCIEDAD_FI = ''BAIN'' AND FECHA_CONT = ' + SQLFecha(peFechaEspecifica) + '  AND EJERCICIO_CONT = ' + vlStrGJAHR + ' AND PERIODO_CONT = ' +vlStrMONAT + coCRLF +

 //                            ' GROUP BY CUENTA,  AUXILIAR, SECTOR, CVE_MONEDA ';
                             '  GROUP BY CVE_CUENTA, MONEDA ';

//      SHOWMESSAGE(vlStrLINK);

    // vlStrLINK := 'CONT';
    //  vlStrFiltro := ' AND B_CTA_AFECTACION = ''V'''; // Este filtro se adiciona para darle velocidad a la búsqueda (Sólo es para CONT)
        vlStrFiltro := '';
     End
  Else
     Begin

     vlStrLINK := '';
     vlStrLINK := 'SELECT HKONT, S_CTA, XREF1, XREF3, HWAER, WAERS, SUM(S_FIN) AS S_FIN'+coCRLF+
             '               FROM zsaldos_det@sap2fipolc ' + coCRLF +
             '               WHERE MANDT IN (130) AND BUKRS = ''B000'''+coCRLF+
             '                 AND GJAHR = '+vlStrGJAHR+' AND MONAT = '+vlStrMONAT+coCRLF+
             '               GROUP BY HKONT, S_CTA, XREF1, XREF3, HWAER, WAERS'+coCRLF;
     //vlStrLINK := 'SAP2FIPOLC';
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
      ' SELECT DECODE(TEMP.CVE_MONEDA, ''MXN'', ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
      '        ''SAP'' AS ORIGEN,'+coCRLF+
      '        ''1 CARTERA DE CREDITO'' AS TIPO_CUENTA,'+coCRLF+
      '        ''1.1 VIGENTE'' AS SEGMENTO,'+coCRLF+
      '        TEMP.SDO_FIN_PER,'+coCRLF+
      '        0 AS SDO_COINCRE,'+coCRLF+
      '        (TEMP.CVE_CUENTA) AS CVE_CTA_CONTABLE,'+coCRLF+
      '        TEMP.DESC_LARGA_CUENTA AS NOMBRE_PROD,'+coCRLF+
      '        TEMP.CVE_SECTOR,'+coCRLF+
      '        S.DESC_SECTOR,'+coCRLF+
      '        TEMP.ID_METRICA,'+coCRLF+
      '        DECODE(TEMP.CVE_TIPO_CTA,''CR'',''CON RESTRICCION'',''SIN RESTRICCION'') AS CVE_TIPO_CTA'+coCRLF+
      ' FROM ( SELECT  Z.WAERS AS CVE_MONEDA,'+coCRLF+
      '                SUM(Z.S_FIN) AS SDO_FIN_PER,'+coCRLF+
      '                METRICA.CVE_CUENTA,'+coCRLF+
      '                Z.S_CTA AS CVE_SUBCUENTA,'+coCRLF+
      '                Z.XREF1 AS CVE_AUXILIAR,'+coCRLF+
      '                Z.XREF3 AS CVE_SECTOR_SAP,'+coCRLF+
      '                Z.XREF3 AS CVE_SECTOR,'+coCRLF+
      '                METRICA.ID_METRICA AS ID_METRICA, '+coCRLF+
      '                ICM.DESC_LARGA_CUENTA, '+coCRLF+
      '                METRICA.CVE_TIPO_CTA '+coCRLF+
      '        FROM (  ' + vlStrLINK +coCRLF+  // Se agrega nueva tabla, por Roberto Andres Silva Tello
      '             ) Z, IZ_CUENTA_MAYOR@STSAP ICM, '+coCRLF+
// RABA JUL 2015
//      '             ( SELECT DISTINCT SUBSTR(CCCG.CTA_CONTABLE,1,10) AS CVE_CUENTA, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA, CCCG.CVE_TIPO_CTA'+coCRLF+
//      '               FROM   CR_CONT_CVES_GUIA CCCG'+coCRLF+
//      '               WHERE  CCCG.CVE_CUENTA = ''SIPAVE'''+coCRLF+
//      '                 AND  CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
//      '             ) METRICA'+coCRLF+
      '             ( SELECT DISTINCT SUBSTR(CCCG.CTA_CONTABLE,1,10) AS CVE_CUENTA, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA, CCCG.CVE_TIPO_CTA '+coCRLF+
      '               FROM   CR_CONT_CTA_GUIA CCCG, '+coCRLF+
      '                      CR_CONT_BIT_CAT BI '+coCRLF+
      '               WHERE  CCCG.CVE_CUENTA = ''SIPAVE'' '+coCRLF+
      '                 AND  CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
      '                 AND  BI.CVE_PROCESO = CCCG.CVE_PROCESO '+coCRLF+
      '                 AND  BI.ID_BIT_CAT  = CCCG.ID_BIT_CAT '+coCRLF+
      '                 AND  BI.CVE_PROCESO = ''CONTAICRE'' '+coCRLF+
      '                 AND  ' + SQLFecha(peFechaEspecifica) + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
      '              ) METRICA '+coCRLF+
// FIN RABA
      '        WHERE Z.HKONT = METRICA.CVE_CUENTA'+coCRLF+
      '	       AND   ICM.CUENTA (+)= METRICA.CVE_CUENTA'+coCRLF+
      '        GROUP BY Z.WAERS, METRICA.CVE_CUENTA,METRICA.ID_METRICA, Z.S_CTA, Z.XREF1, Z.XREF3,DESC_LARGA_CUENTA,CVE_TIPO_CTA '+coCRLF+
      '      ) TEMP,'+coCRLF+
      '      SECTOR S'+coCRLF+
      'WHERE TEMP.SDO_FIN_PER <> 0'+coCRLF+
      '  AND S.CVE_SECTOR (+)= TEMP.CVE_SECTOR_SAP'+coCRLF+
      ''+coCRLF
      ;
      pebColocaUnionAll := True;
  End; // If (pebMuestraK_VIG) Then


//  If (pebMuestraK_IMP) Then
//      Begin
//      If (pebColocaUnionAll) Then
//          vlSalida := vlSalida + coCRLF + ' UNION ALL' + coCRLF;

//      vlSalida := vlSalida +
//      ''+coCRLF+
//      '  -- CONTA SAP CAPITAL IMPAGADO B1'+coCRLF+
//      ' SELECT DECODE(TEMP.CVE_MONEDA, ''MXN'', ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
//      '        ''SAP'' AS ORIGEN,'+coCRLF+
//      '        ''CAPITAL'' AS TIPO_CUENTA,'+coCRLF+
//      '        ''VIGENTE'' AS SEGMENTO,'+coCRLF+
//      '        TEMP.SDO_FIN_PER,'+coCRLF+
//      '        0 AS SDO_COINCRE,'+coCRLF+
//      '        (TEMP.CVE_CUENTA) AS CVE_CTA_CONTABLE,'+coCRLF+
//      '        NULL AS NOMBRE_PROD,'+coCRLF+
//      '        TEMP.CVE_SECTOR,'+coCRLF+
//      '        S.DESC_SECTOR,'+coCRLF+
//      '        TEMP.ID_METRICA'+coCRLF+
//      ' FROM ( SELECT  Z.WAERS AS CVE_MONEDA,'+coCRLF+
//      '                SUM(Z.S_FIN) AS SDO_FIN_PER,'+coCRLF+
//      '                METRICA.CVE_CUENTA,'+coCRLF+
//      '                Z.S_CTA AS CVE_SUBCUENTA,'+coCRLF+
//      '                Z.XREF1 AS CVE_AUXILIAR,'+coCRLF+
//      '                Z.XREF3 AS CVE_SECTOR_SAP,'+coCRLF+
//      '                Z.XREF3 AS CVE_SECTOR,'+coCRLF+
//      '                METRICA.ID_METRICA AS ID_METRICA'+coCRLF+
//      '        FROM ( ' +vlStrLINK +coCRLF+ // Se agrega nueva tabla, por Roberto Andres Silva Tello
//      '             ) Z,'+coCRLF+
//      '             ( SELECT DISTINCT SUBSTR(CCCG.CTA_CONTABLE,1,10) AS CVE_CUENTA, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA'+coCRLF+
//      '               FROM   CR_CONT_CVES_GUIA CCCG'+coCRLF+
//      '               WHERE  CCCG.CVE_CUENTA = ''COPAVE'''+coCRLF+
//      '                 AND  CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
//      '             ) METRICA'+coCRLF+
//      '        WHERE Z.HKONT = METRICA.CVE_CUENTA'+coCRLF+
//      '        GROUP BY Z.WAERS, METRICA.CVE_CUENTA,METRICA.ID_METRICA, Z.S_CTA, Z.XREF1, Z.XREF3'+coCRLF+
//      '      ) TEMP,'+coCRLF+
//      '      SECTOR S'+coCRLF+
//      'WHERE TEMP.SDO_FIN_PER <> 0'+coCRLF+
//      '  AND S.CVE_SECTOR (+)= TEMP.CVE_SECTOR_SAP'+coCRLF+
//      ''+coCRLF
//      ;
//      pebColocaUnionAll := True;
//  End; // If (pebMuestraK_IMP) Then

  If (pebMuestraK_VEN) Then
      Begin
      If (pebColocaUnionAll) Then
          vlSalida := vlSalida + coCRLF + ' UNION ALL' + coCRLF;

      vlSalida := vlSalida +
      ''+coCRLF+
      '  -- CONTA SAP CAPITAL VENCIDO B1'+coCRLF+                  
      ' SELECT DECODE(TEMP.CVE_MONEDA, ''MXN'', ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
      '        ''SAP'' AS ORIGEN,'+coCRLF+
      '        ''1 CARTERA DE CREDITO'' AS TIPO_CUENTA,'+coCRLF+
      '        ''1.2 VENCIDO'' AS SEGMENTO,'+coCRLF+
      '        TEMP.SDO_FIN_PER,'+coCRLF+
      '        0 AS SDO_COINCRE,'+coCRLF+
      '        (TEMP.CVE_CUENTA) AS CVE_CTA_CONTABLE,'+coCRLF+
      '        TEMP.DESC_LARGA_CUENTA AS NOMBRE_PROD,'+coCRLF+
      '        TEMP.CVE_SECTOR,'+coCRLF+
      '        S.DESC_SECTOR,'+coCRLF+
      '        TEMP.ID_METRICA,'+coCRLF+
      '        DECODE(TEMP.CVE_TIPO_CTA,''CR'',''CON RESTRICCION'',''SIN RESTRICCION'') AS CVE_TIPO_CTA'+coCRLF+
      ' FROM ( SELECT  Z.WAERS AS CVE_MONEDA,'+coCRLF+
      '                SUM(Z.S_FIN) AS SDO_FIN_PER,'+coCRLF+
      '                METRICA.CVE_CUENTA,'+coCRLF+
      '                Z.S_CTA AS CVE_SUBCUENTA,'+coCRLF+
      '                Z.XREF1 AS CVE_AUXILIAR,'+coCRLF+
      '                Z.XREF3 AS CVE_SECTOR_SAP,'+coCRLF+
      '                Z.XREF3 AS CVE_SECTOR,'+coCRLF+
      '                METRICA.ID_METRICA AS ID_METRICA, '+coCRLF+
      '                ICM.DESC_LARGA_CUENTA, '+coCRLF+
      '                METRICA.CVE_TIPO_CTA '+coCRLF+
      '        FROM ( ' + vlStrLINK +coCRLF+ // Se agrega nueva tabla, por Roberto Andres Silva Tello
      '             ) Z, IZ_CUENTA_MAYOR@STSAP ICM, '+coCRLF+
// RABA JUL 2015
{
      '             ( SELECT DISTINCT SUBSTR(CCCG.CTA_CONTABLE,1,10) AS CVE_CUENTA, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA, CCCG.CVE_TIPO_CTA'+coCRLF+
      '               FROM   CR_CONT_CVES_GUIA CCCG'+coCRLF+
      '               WHERE  CCCG.CVE_CUENTA IN (''CAVE'',''CAVENE'')'+coCRLF+
      '                 AND  CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
      '             ) METRICA'+coCRLF+
}
      '             (SELECT DISTINCT SUBSTR(CCCG.CTA_CONTABLE,1,10) AS CVE_CUENTA, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA, CCCG.CVE_TIPO_CTA '+coCRLF+
      '               FROM   CR_CONT_CTA_GUIA CCCG, '+coCRLF+
      '                      CR_CONT_BIT_CAT BI '+coCRLF+
      '               WHERE  CCCG.CVE_CUENTA IN (''CAVE'',''CAVENE'') '+coCRLF+
      '                 AND  CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
      '                 AND  BI.CVE_PROCESO = CCCG.CVE_PROCESO '+coCRLF+
      '                 AND  BI.ID_BIT_CAT  = CCCG.ID_BIT_CAT '+coCRLF+
      '                 AND  BI.CVE_PROCESO = ''CONTAICRE'' '+coCRLF+
      '                 AND  ' + SQLFecha(peFechaEspecifica) + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
      '              ) METRICA '+coCRLF+
// FIN RABA
      '        WHERE Z.HKONT = METRICA.CVE_CUENTA'+coCRLF+
      '	       AND   ICM.CUENTA (+)= METRICA.CVE_CUENTA'+coCRLF+
      '        GROUP BY Z.WAERS, METRICA.CVE_CUENTA,METRICA.ID_METRICA, Z.S_CTA, Z.XREF1, Z.XREF3,DESC_LARGA_CUENTA,CVE_TIPO_CTA '+coCRLF+
      '      ) TEMP,'+coCRLF+
      '      SECTOR S'+coCRLF+
      'WHERE TEMP.SDO_FIN_PER <> 0'+coCRLF+
      '  AND S.CVE_SECTOR (+)= TEMP.CVE_SECTOR_SAP'+coCRLF+
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
      ' SELECT DECODE(TEMP.CVE_MONEDA, ''MXN'', ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
      '        ''SAP'' AS ORIGEN,'+coCRLF+
      '        ''1 CARTERA DE CREDITO'' AS TIPO_CUENTA,'+coCRLF+
      '        ''1.1 VIGENTE'' AS SEGMENTO,'+coCRLF+
      '        TEMP.SDO_FIN_PER,'+coCRLF+
      '        0 AS SDO_COINCRE,'+coCRLF+
      '        (TEMP.CVE_CUENTA) AS CVE_CTA_CONTABLE,'+coCRLF+
      '        TEMP.DESC_LARGA_CUENTA AS NOMBRE_PROD,'+coCRLF+
      '        TEMP.CVE_SECTOR,'+coCRLF+
      '        S.DESC_SECTOR,'+coCRLF+
      '        TEMP.ID_METRICA,'+coCRLF+
      '        DECODE(TEMP.CVE_TIPO_CTA,''CR'',''CON RESTRICCION'',''SIN RESTRICCION'') AS CVE_TIPO_CTA'+coCRLF+
      ' FROM ( SELECT  Z.WAERS AS CVE_MONEDA,'+coCRLF+
      '                SUM(Z.S_FIN) AS SDO_FIN_PER,'+coCRLF+
      '                METRICA.CVE_CUENTA,'+coCRLF+
      '                Z.S_CTA AS CVE_SUBCUENTA,'+coCRLF+
      '                Z.XREF1 AS CVE_AUXILIAR,'+coCRLF+
      '                Z.XREF3 AS CVE_SECTOR_SAP,'+coCRLF+
      '                Z.XREF3 AS CVE_SECTOR,'+coCRLF+
      '                METRICA.ID_METRICA AS ID_METRICA, '+coCRLF+
      '                ICM.DESC_LARGA_CUENTA, '+coCRLF+
      '                METRICA.CVE_TIPO_CTA '+coCRLF+
      '        FROM ( ' +vlStrLINK+coCRLF+ // Se agrega nueva tabla, por Roberto Andres Silva Tello
      '             ) Z, IZ_CUENTA_MAYOR@STSAP ICM, '+coCRLF+
// RABA JUL 2015
//      '             ( SELECT DISTINCT SUBSTR(CCCG.CTA_CONTABLE,1,10) AS CVE_CUENTA, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA, ''SR'' AS CVE_TIPO_CTA'+coCRLF+
//      '               FROM   CR_CONT_CVES_GUIA CCCG'+coCRLF+
//      '               WHERE  CCCG.CVE_CUENTA = ''IDSPVE'''+coCRLF+
////      '                 AND  CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
//      '             ) METRICA'+coCRLF+
      '             (SELECT DISTINCT SUBSTR(CCCG.CTA_CONTABLE,1,10) AS CVE_CUENTA, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA, CCCG.CVE_TIPO_CTA '+coCRLF+
      '               FROM   CR_CONT_CTA_GUIA CCCG, '+coCRLF+
      '                      CR_CONT_BIT_CAT BI '+coCRLF+
      '               WHERE  CCCG.CVE_CUENTA = ''IDSPVE'' '+coCRLF+
      '                 AND  CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
      '                 AND  BI.CVE_PROCESO = CCCG.CVE_PROCESO '+coCRLF+
      '                 AND  BI.ID_BIT_CAT  = CCCG.ID_BIT_CAT '+coCRLF+
      '                 AND  BI.CVE_PROCESO = ''CONTAICRE'' '+coCRLF+
      '                 AND  ' + SQLFecha(peFechaEspecifica) + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
      '              ) METRICA '+coCRLF+
//FIN RABA
      '        WHERE Z.HKONT = METRICA.CVE_CUENTA'+coCRLF+
      '	       AND   ICM.CUENTA (+)= METRICA.CVE_CUENTA'+coCRLF+
      '        GROUP BY Z.WAERS, METRICA.CVE_CUENTA,METRICA.ID_METRICA, Z.S_CTA, Z.XREF1, Z.XREF3,DESC_LARGA_CUENTA,CVE_TIPO_CTA '+coCRLF+
      '      ) TEMP,'+coCRLF+
      '      SECTOR S'+coCRLF+
      'WHERE TEMP.SDO_FIN_PER <> 0'+coCRLF+
      '  AND S.CVE_SECTOR (+)= TEMP.CVE_SECTOR_SAP'+coCRLF+
      ''+coCRLF
      ;

      If (pebMuestraI_ANT) Then
         Begin
         vlSalida := vlSalida +
             ''+coCRLF+
             'UNION ALL'+coCRLF+
             ''+coCRLF+
             ' -- CONTA SAP INTERES COBRADO X ANTICIPADO B1'+coCRLF+
             ' SELECT DECODE(TEMP.CVE_MONEDA, ''MXN'', ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
             '        ''SAP'' AS ORIGEN,'+coCRLF+
             '        ''2 INTERES COBRADO POR ANTICIPADO'' AS TIPO_CUENTA,'+coCRLF+
             '        ''2.1 VIGENTE'' AS SEGMENTO,'+coCRLF+
             '        TEMP.SDO_FIN_PER,'+coCRLF+
             '        0 AS SDO_COINCRE,'+coCRLF+
             '        (TEMP.CVE_CUENTA) AS CVE_CTA_CONTABLE,'+coCRLF+
             '        TEMP.DESC_LARGA_CUENTA AS NOMBRE_PROD,'+coCRLF+
             '        TEMP.CVE_SECTOR,'+coCRLF+
             '        S.DESC_SECTOR,'+coCRLF+
             '        TEMP.ID_METRICA,'+coCRLF+
             '        DECODE(TEMP.CVE_TIPO_CTA,''CR'',''CON RESTRICCION'',''SIN RESTRICCION'') AS CVE_TIPO_CTA'+coCRLF+
             ' FROM ( SELECT  Z.WAERS AS CVE_MONEDA,'+coCRLF+
             '                SUM(Z.S_FIN * -1) AS SDO_FIN_PER,'+coCRLF+
             '                METRICA.CVE_CUENTA,'+coCRLF+
             '                Z.S_CTA AS CVE_SUBCUENTA,'+coCRLF+
             '                Z.XREF1 AS CVE_AUXILIAR,'+coCRLF+
             '                Z.XREF3 AS CVE_SECTOR_SAP,'+coCRLF+
             '                Z.XREF3 AS CVE_SECTOR,'+coCRLF+
             '                METRICA.ID_METRICA AS ID_METRICA, '+coCRLF+
             '                ICM.DESC_LARGA_CUENTA, '+coCRLF+
             '                METRICA.CVE_TIPO_CTA '+coCRLF+
             '        FROM ( ' +vlStrLINK+coCRLF+ // Se agrega nueva tabla, por Roberto Andres Silva Tello
             '             ) Z, IZ_CUENTA_MAYOR@STSAP ICM, '+coCRLF+
//RABA JUL 2015
{
             '             ( SELECT DISTINCT SUBSTR(CCCG.CTA_CONTABLE,1,10) AS CVE_CUENTA, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA, CCCG.CVE_TIPO_CTA'+coCRLF+
             '               FROM   CR_CONT_CVES_GUIA CCCG'+coCRLF+
	     '               WHERE  CCCG.CVE_CUENTA = ''INCOAN'''+coCRLF+
             '                 AND  CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
             '             ) METRICA'+coCRLF+
}
             '             (SELECT DISTINCT SUBSTR(CCCG.CTA_CONTABLE,1,10) AS CVE_CUENTA, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA, CCCG.CVE_TIPO_CTA '+coCRLF+
             '               FROM   CR_CONT_CTA_GUIA CCCG, '+coCRLF+
             '                      CR_CONT_BIT_CAT BI '+coCRLF+
             '               WHERE  CCCG.CVE_CUENTA = ''INCOAN'' '+coCRLF+
             '                 AND  CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
             '                 AND  BI.CVE_PROCESO = CCCG.CVE_PROCESO '+coCRLF+
             '                 AND  BI.ID_BIT_CAT  = CCCG.ID_BIT_CAT '+coCRLF+
             '                 AND  BI.CVE_PROCESO = ''CONTAICRE'' '+coCRLF+
             '                 AND  ' + SQLFecha(peFechaEspecifica) + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
             '              ) METRICA '+coCRLF+
//FIN RABA
             '        WHERE Z.HKONT = METRICA.CVE_CUENTA'+coCRLF+
             '	       AND   ICM.CUENTA (+)= METRICA.CVE_CUENTA'+coCRLF+
             '        GROUP BY Z.WAERS, METRICA.CVE_CUENTA,METRICA.ID_METRICA, Z.S_CTA, Z.XREF1, Z.XREF3,DESC_LARGA_CUENTA,CVE_TIPO_CTA '+coCRLF+
             '      ) TEMP,'+coCRLF+
             '      SECTOR S'+coCRLF+
             'WHERE TEMP.SDO_FIN_PER <> 0'+coCRLF+
             '  AND S.CVE_SECTOR (+)= TEMP.CVE_SECTOR_SAP'+coCRLF+
             ''+coCRLF
             ;
         End;
      pebColocaUnionAll := True;
  End; // If (pebMuestraI_VIG) Then


//  If (pebMuestraI_IMP) Then
//      Begin
//      If (pebColocaUnionAll) Then
//          vlSalida := vlSalida + coCRLF + ' UNION ALL' + coCRLF;

//      vlSalida := vlSalida +
//      ''+coCRLF+
//      ' -- CONTA SAP INTERES IMPAGADO B1'+coCRLF+
//      ' SELECT DECODE(TEMP.CVE_MONEDA, ''MXN'', ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
//      '        ''SAP'' AS ORIGEN,'+coCRLF+
//      '        ''INTERES'' AS TIPO_CUENTA,'+coCRLF+
//      '        ''VIGENTE'' AS SEGMENTO,'+coCRLF+
//      '        TEMP.SDO_FIN_PER,'+coCRLF+
//      '        0 AS SDO_COINCRE,'+coCRLF+
//      '        (TEMP.CVE_CUENTA) AS CVE_CTA_CONTABLE,'+coCRLF+
//      '        NULL AS NOMBRE_PROD,'+coCRLF+
//      '        TEMP.CVE_SECTOR,'+coCRLF+
//      '        S.DESC_SECTOR,'+coCRLF+
//      '        TEMP.ID_METRICA'+coCRLF+
//      ' FROM ( SELECT  Z.WAERS AS CVE_MONEDA,'+coCRLF+
//      '                SUM(Z.S_FIN) AS SDO_FIN_PER,'+coCRLF+
//      '                METRICA.CVE_CUENTA,'+coCRLF+
//      '                Z.S_CTA AS CVE_SUBCUENTA,'+coCRLF+
//      '                Z.XREF1 AS CVE_AUXILIAR,'+coCRLF+
//      '                Z.XREF3 AS CVE_SECTOR_SAP,'+coCRLF+
//      '                Z.XREF3 AS CVE_SECTOR,'+coCRLF+
//      '                METRICA.ID_METRICA AS ID_METRICA'+coCRLF+
//      '        FROM ( ' +vlStrLINK+coCRLF+ // Se agrega nueva tabla, por Roberto Andres Silva Tello
//      '             ) Z,'+coCRLF+
//      '             ( SELECT DISTINCT SUBSTR(CCCG.CTA_CONTABLE,1,10) AS CVE_CUENTA, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA'+coCRLF+
//      '               FROM   CR_CONT_CVES_GUIA CCCG'+coCRLF+
//      '               WHERE  CCCG.CVE_CUENTA = ''IDCPVE'''+coCRLF+
//      '                 AND  CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
//      '             ) METRICA'+coCRLF+
//      '        WHERE Z.HKONT = METRICA.CVE_CUENTA'+coCRLF+
//      '        GROUP BY Z.WAERS, METRICA.CVE_CUENTA,METRICA.ID_METRICA, Z.S_CTA, Z.XREF1, Z.XREF3'+coCRLF+
//      '      ) TEMP,'+coCRLF+
//      '      SECTOR S'+coCRLF+
//      'WHERE TEMP.SDO_FIN_PER <> 0'+coCRLF+
//      '  AND S.CVE_SECTOR (+)= TEMP.CVE_SECTOR_SAP'+coCRLF+
//      ''+coCRLF
//      ;
//      pebColocaUnionAll := True;
//  End; // If (pebMuestraI_VIG) Then

  If (pebMuestraI_VEN) Then
      Begin
      If (pebColocaUnionAll) Then
          vlSalida := vlSalida + coCRLF + ' UNION ALL' + coCRLF;

      vlSalida := vlSalida +
      ''+coCRLF+
      ' -- CONTA SAP INTERES VENCIDO  B1'+coCRLF+
      ' SELECT DECODE(TEMP.CVE_MONEDA, ''MXN'', ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
      '        ''SAP'' AS ORIGEN,'+coCRLF+
      '        ''1 CARTERA DE CREDITO'' AS TIPO_CUENTA,'+coCRLF+
      '        ''1.2 VENCIDO'' AS SEGMENTO,'+coCRLF+
      '        TEMP.SDO_FIN_PER,'+coCRLF+
      '        0 AS SDO_COINCRE,'+coCRLF+
      '        (TEMP.CVE_CUENTA) AS CVE_CTA_CONTABLE,'+coCRLF+
      '        TEMP.DESC_LARGA_CUENTA AS NOMBRE_PROD,'+coCRLF+
      '        TEMP.CVE_SECTOR,'+coCRLF+
      '        S.DESC_SECTOR,'+coCRLF+
      '        TEMP.ID_METRICA,'+coCRLF+
      '        DECODE(TEMP.CVE_TIPO_CTA,''CR'',''CON RESTRICCION'',''SIN RESTRICCION'') AS CVE_TIPO_CTA'+coCRLF+
      ' FROM ( SELECT  Z.WAERS AS CVE_MONEDA,'+coCRLF+
      '                SUM(Z.S_FIN) AS SDO_FIN_PER,'+coCRLF+
      '                METRICA.CVE_CUENTA,'+coCRLF+
      '                Z.S_CTA AS CVE_SUBCUENTA,'+coCRLF+
      '                Z.XREF1 AS CVE_AUXILIAR,'+coCRLF+
      '                Z.XREF3 AS CVE_SECTOR_SAP,'+coCRLF+
      '                Z.XREF3 AS CVE_SECTOR,'+coCRLF+
      '                METRICA.ID_METRICA AS ID_METRICA, '+coCRLF+
      '                ICM.DESC_LARGA_CUENTA, '+coCRLF+
      '                METRICA.CVE_TIPO_CTA '+coCRLF+
      '        FROM ( ' +vlStrLINK+coCRLF+ // Se agrega nueva tabla, por Roberto Andres Silva Tello
      '             ) Z, IZ_CUENTA_MAYOR@STSAP ICM, '+coCRLF+
//RABA JUL 2015
{
      '             ( SELECT DISTINCT SUBSTR(CCCG.CTA_CONTABLE,1,10) AS CVE_CUENTA, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA, ''SR'' AS CVE_TIPO_CTA'+coCRLF+
      '               FROM   CR_CONT_CVES_GUIA CCCG'+coCRLF+
      '               WHERE  CCCG.CVE_CUENTA = ''INVE'''+coCRLF+
      '                 AND  CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
      '             ) METRICA'+coCRLF+
}
      '             (SELECT DISTINCT SUBSTR(CCCG.CTA_CONTABLE,1,10) AS CVE_CUENTA, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA, CCCG.CVE_TIPO_CTA '+coCRLF+
      '               FROM   CR_CONT_CTA_GUIA CCCG, '+coCRLF+
      '                      CR_CONT_BIT_CAT BI '+coCRLF+
      '               WHERE  CCCG.CVE_CUENTA = ''INVE'' '+coCRLF+
      '                 AND  CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
      '                 AND  BI.CVE_PROCESO = CCCG.CVE_PROCESO '+coCRLF+
      '                 AND  BI.ID_BIT_CAT  = CCCG.ID_BIT_CAT '+coCRLF+
      '                 AND  BI.CVE_PROCESO = ''CONTAICRE'' '+coCRLF+
      '                 AND  ' + SQLFecha(peFechaEspecifica) + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
      '              ) METRICA '+coCRLF+
//FIN RABA
      '        WHERE Z.HKONT = METRICA.CVE_CUENTA '+coCRLF+
      '	       AND   ICM.CUENTA (+)= METRICA.CVE_CUENTA '+coCRLF+
      '        GROUP BY Z.WAERS, METRICA.CVE_CUENTA,METRICA.ID_METRICA, Z.S_CTA, Z.XREF1, Z.XREF3,DESC_LARGA_CUENTA,CVE_TIPO_CTA '+coCRLF+
      '      ) TEMP,'+coCRLF+
      '      SECTOR S'+coCRLF+
      'WHERE TEMP.SDO_FIN_PER <> 0'+coCRLF+
      '  AND S.CVE_SECTOR (+)= TEMP.CVE_SECTOR_SAP'+coCRLF+
      ''+coCRLF
      ;
  End; // If (pebMuestraI_VEN) Then

  Result := vlSalida;
end;

Function TQrCompCOINCREDetalleN.ArmaQuery_CONSOLIDADO_Detalle_SAP(PEMes,PEAnio : Integer;
                                                                 PETipoRep : String;
                                                                 pebMuestraK_VIG,
                                                                 pebMuestraK_IMP,
                                                                 pebMuestraK_VEN,
                                                                 pebMuestraI_VIG,
                                                                 pebMuestraI_IMP,
                                                                 pebMuestraI_VEN,
                                                                 pebMuestraI_ANT : Boolean;
                                                                 peFechaEspecifica : TDateTime
                                                                 ) : String;
var
     VlSalida  : String;
     vlFechaD  : String;
     vlbColocaUnionAll : Boolean;

     vlStrGJAHR : String;
     vlStrMONAT : String;
     vlHisto    : String;
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

    //RABA ABR 2016 PARA OBTENER PRODUCTO DE FORMA HISTORICA
    vlHisto := '               Table (PKGCRBitacoraViews.VW_CR_Contrato_Prod ('+VLFechaD+')) CCO, '+coCRLF+
               '               Table (PKGCRBitacoraViews.VW_CRE_Contrato_CveSubTipoBco ('+VLFechaD+')) CCOE '+coCRLF;
    VlSalida :=
            ' SELECT * FROM ( '+coCRLF+
            ' -- /////////////////////////////////////////////////////////////////////////////////////'+coCRLF+
            ' -- //////////////// C O N S O L I D A D O   D E    A D E U D O   ///////////////////////'+coCRLF+
            ' -- /////////////////////////////////////////////////////////////////////////////////////'+coCRLF
            ;

            //HERJA - HAY QUE QUITAR DESPUES
    VlSalida := VlSalida +
            ' SELECT A.*, (A.MONEDA||'' ''||A.ORIGEN||'' ''||A.TIPO_CUENTA||'' ''||A.SEGMENTO||'' ''||A.CVE_SECTOR||'' ''||A.ID_METRICA) ID_PA FROM ( '+coCRLF;
            //FIN HERJA

        vlbColocaUnionAll := False;
        If (pebMuestraK_VIG) Then
            Begin
        VlSalida :=  VlSalida +
            ' -- CAPITAL VIGENTE'+coCRLF+
            ' SELECT CONS.CVE_MONEDA AS MONEDA,''COINCRE'' AS ORIGEN,''1 CARTERA DE CREDITO'' AS TIPO_CUENTA,''1.1 VIGENTE'' AS SEGMENTO,'+coCRLF+
            '        0 AS SDO_FIN_PER,(SUM(CONS.IMP_CAP_VIG)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
            '        CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA, ''SIN RESTRICCION'' AS CVE_TIPO_CTA'+coCRLF+
            ' FROM  ('+coCRLF+
            '       SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
            '               CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA,'+coCRLF+
            '               NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_CAP_VIG,'+coCRLF+
            //'               NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,'+coCRLF+  //RABA JUL 2015 B-6 HISTORICO
            '               NVL(CCO.CVE_PRODUCTO_OLD, CCOE.CVE_SUB_TIP_BCO_OLD) AS CVE_PRODUCTO_CRE ,'+coCRLF+
            '               NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO,'+coCRLF+
            '               NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE,'+coCRLF+
            '               NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR'+coCRLF+
            '       FROM  (SELECT ID_CREDITO, IMP_CAP_VIG FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) =  '+VLFechaD+') CR_SDO,'+coCRLF+
            '               MONEDA MO, MONEDA MOE, CR_CREDITO CC, CR_PRODUCTO CP, CRE_CREDITO  CCE,'+coCRLF+
            '               CRE_SUB_TIP_BCO CSTB, CONTRATO C, CONTRATO C2, PERSONA P, PERSONA P2, SECTOR S, SECTOR S2, '+coCRLF+
            vlHisto +
            '       WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO'+coCRLF+
            '       AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO'+coCRLF+
            '       AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_OLD  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA'+coCRLF+    //RABA JUL 2015 HISTORICO
            '       AND    P2.ID_PERSONA	(+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR'+coCRLF+
            '       AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO'+coCRLF+
            '       AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO_OLD  AND    C.ID_CONTRATO    (+)= CCE.ID_CONTRATO'+coCRLF+   //RABA JUL 2015 HISTORICO
            '       AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	   AND    P.ID_PERSONA	       (+)= C.ID_TITULAR'+coCRLF+
            '       AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS,'+coCRLF+
            //  RABA JUL 2015 SE SUSTITUYE PARA HACER EL REPORTE HISTORICO
            {
            '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA'+coCRLF+
            '         FROM   CR_CONT_GPO_PRO GP,'+coCRLF+
            '                CR_CONT_CVES_GUIA CCCG'+coCRLF+
            '         WHERE  GP.CVE_GPO = CCCG.CVE_GPO'+coCRLF+
            '         AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
	    '	      AND    CCCG.CVE_CUENTA = ''SIPAVE'''+coCRLF+
            '       ) METRICA'+coCRLF+
             }
            '       (SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
            '        FROM   CR_CONT_GRUPO_PROD GP, '+coCRLF+
            '               CR_CONT_CTA_GUIA CCCG, '+coCRLF+
            '               CR_CONT_BIT_CAT BI '+coCRLF+
            '        WHERE  GP.CVE_GRUPO = CCCG.CVE_GRUPO '+coCRLF+
            '          AND  CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
            '          AND  CCCG.CVE_CUENTA = ''SIPAVE'' '+coCRLF+
            '          AND  BI.CVE_PROCESO = GP.CVE_PROCESO '+coCRLF+
            '          AND  BI.ID_BIT_CAT  = GP.ID_BIT_CAT '+coCRLF+
            '          AND  BI.CVE_PROCESO = CCCG.CVE_PROCESO '+coCRLF+
            '          AND  BI.ID_BIT_CAT  = CCCG.ID_BIT_CAT '+coCRLF+
            '          AND  BI.CVE_PROCESO = ''CONTAICRE'' '+coCRLF+
            '          AND  ' + VLFechaD + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
            '        ) METRICA '+coCRLF+
            // FIN RABA
            ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE'+coCRLF+
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
            ' SELECT CONS.CVE_MONEDA AS MONEDA,''COINCRE'' AS ORIGEN,''1 CARTERA DE CREDITO'' AS TIPO_CUENTA,''1.1 VIGENTE'' AS SEGMENTO,'+coCRLF+
            '        0 AS SDO_FIN_PER,(SUM(CONS.IMP_CAP_IMP)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
            '        CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA, ''SIN RESTRICCION'' AS CVE_TIPO_CTA '+coCRLF+
            ' FROM  ('+coCRLF+
            '       SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
            '               CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA,'+coCRLF+
            '               NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_CAP_IMP,'+coCRLF+
            //'               NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,'+coCRLF+  //RABA JUL 2015 B-6 HISTORICO
            '               NVL(CCO.CVE_PRODUCTO_OLD, CCOE.CVE_SUB_TIP_BCO_OLD) AS CVE_PRODUCTO_CRE ,'+coCRLF+
            '               NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO,'+coCRLF+
            '               NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE,'+coCRLF+
            '               NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR'+coCRLF+
            '       FROM  (SELECT ID_CREDITO, IMP_CAP_IMP FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) =  '+VLFechaD+') CR_SDO,'+coCRLF+
            '               MONEDA MO, MONEDA MOE, CR_CREDITO CC, CR_PRODUCTO CP, CRE_CREDITO CCE,'+coCRLF+
            '               CRE_SUB_TIP_BCO CSTB, CONTRATO C, CONTRATO C2, PERSONA P, PERSONA P2, SECTOR S, SECTOR S2, '+coCRLF+
            vlHisto +
            '       WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO'+coCRLF+
            '       AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO'+coCRLF+
            '       AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_OLD  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA'+coCRLF+      //RABA JUL 2015 HISTORICO
            '       AND    P2.ID_PERSONA	(+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR'+coCRLF+
            '       AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO'+coCRLF+
            '       AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO_OLD  AND    C.ID_CONTRATO    (+)= CCE.ID_CONTRATO'+coCRLF+     //RABA JUL 2015 HISTORICO
            '       AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	   AND    P.ID_PERSONA         (+)= C.ID_TITULAR'+coCRLF+
            '       AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS,'+coCRLF+
            //  RABA JUL 2015 SE SUSTITUYE PARA HACER EL REPORTE HISTORICO
            {
            '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA'+coCRLF+
            '         FROM   CR_CONT_GPO_PRO GP,'+coCRLF+
            '                CR_CONT_CVES_GUIA CCCG'+coCRLF+
            '         WHERE  GP.CVE_GPO = CCCG.CVE_GPO'+coCRLF+
            '         AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
	    '	      AND    CCCG.CVE_CUENTA = ''COPAVE'''+coCRLF+
            '       ) METRICA'+coCRLF+
            }
            '       (SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
            '        FROM   CR_CONT_GRUPO_PROD GP, '+coCRLF+
            '               CR_CONT_CTA_GUIA CCCG, '+coCRLF+
            '               CR_CONT_BIT_CAT BI '+coCRLF+
            '        WHERE  GP.CVE_GRUPO = CCCG.CVE_GRUPO '+coCRLF+
            '          AND  CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
            '          AND  CCCG.CVE_CUENTA = ''COPAVE'' '+coCRLF+
            '          AND  BI.CVE_PROCESO = GP.CVE_PROCESO '+coCRLF+
            '          AND  BI.ID_BIT_CAT  = GP.ID_BIT_CAT '+coCRLF+
            '          AND  BI.CVE_PROCESO = CCCG.CVE_PROCESO '+coCRLF+
            '          AND  BI.ID_BIT_CAT  = CCCG.ID_BIT_CAT '+coCRLF+
            '          AND  BI.CVE_PROCESO = ''CONTAICRE'' '+coCRLF+
            '          AND  ' + VLFechaD + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
            '       ) METRICA '+coCRLF+
            // FIN RABA
            ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE'+coCRLF+
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
            ' SELECT CONS.CVE_MONEDA AS MONEDA,''COINCRE'' AS ORIGEN,''1 CARTERA DE CREDITO'' AS TIPO_CUENTA,''1.2 VENCIDO'' AS SEGMENTO,'+coCRLF+
            '        0 AS SDO_FIN_PER,(SUM(CONS.IMP_CAP_VDO)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
            '        CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA, ''SIN RESTRICCION'' AS CVE_TIPO_CTA '+coCRLF+
            ' FROM  ('+coCRLF+
            '       SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
            '               CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA,'+coCRLF+
            '               NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_CAP_VDO,'+coCRLF+
            //'               NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,'+coCRLF+  //RABA JUL 2015 B-6 HISTORICO
            '               NVL(CCO.CVE_PRODUCTO_OLD, CCOE.CVE_SUB_TIP_BCO_OLD) AS CVE_PRODUCTO_CRE ,'+coCRLF+
            '               NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO,'+coCRLF+
            '               NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE,'+coCRLF+
            '               NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR'+coCRLF+
            '       FROM  (SELECT ID_CREDITO, IMP_CAP_VDO_EX + IMP_CAP_VDO_NE AS IMP_CAP_VDO FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) =  '+VLFechaD+') CR_SDO,'+coCRLF+
            '               MONEDA MO, MONEDA MOE, CR_CREDITO CC, CR_PRODUCTO CP, CRE_CREDITO CCE,'+coCRLF+
            '               CRE_SUB_TIP_BCO CSTB, CONTRATO C, CONTRATO C2, PERSONA P, PERSONA P2, SECTOR S, SECTOR S2, '+coCRLF+
            vlHisto +
            '       WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO'+coCRLF+
            '       AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO'+coCRLF+
            '       AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_OLD  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA'+coCRLF+  //RABA JUL 2015 HISTORICO
            '       AND    P2.ID_PERSONA	(+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR'+coCRLF+
            '       AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO'+coCRLF+
            '       AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO_OLD  AND    C.ID_CONTRATO    (+)= CCE.ID_CONTRATO'+coCRLF+  //RABA JUL 2015 HISTORICO
            '       AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	   AND    P.ID_PERSONA	       (+)= C.ID_TITULAR'+coCRLF+
            '       AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS,'+coCRLF+
            //  RABA JUL 2015 SE SUSTITUYE PARA HACER EL REPORTE HISTORICO
            {
            '       ( SELECT DISTINCT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA'+coCRLF+
            '         FROM   CR_CONT_GPO_PRO GP,'+coCRLF+
            '                CR_CONT_CVES_GUIA CCCG'+coCRLF+
            '         WHERE  GP.CVE_GPO = CCCG.CVE_GPO'+coCRLF+
	    '	      AND    CCCG.CVE_CUENTA  IN (''CAVE'',''CAVENE'')'+coCRLF+
            '         AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
            '       ) METRICA'+coCRLF+
            }
            '       (SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
            '        FROM   CR_CONT_GRUPO_PROD GP, '+coCRLF+
            '               CR_CONT_CTA_GUIA CCCG, '+coCRLF+
            '               CR_CONT_BIT_CAT BI '+coCRLF+
            '        WHERE  GP.CVE_GRUPO = CCCG.CVE_GRUPO '+coCRLF+
            '          AND  CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
            '          AND  CCCG.CVE_CUENTA IN (''CAVE'',''CAVENE'') '+coCRLF+
            '          AND  BI.CVE_PROCESO = GP.CVE_PROCESO '+coCRLF+
            '          AND  BI.ID_BIT_CAT  = GP.ID_BIT_CAT '+coCRLF+
            '          AND  BI.CVE_PROCESO = CCCG.CVE_PROCESO '+coCRLF+
            '          AND  BI.ID_BIT_CAT  = CCCG.ID_BIT_CAT '+coCRLF+
            '          AND  BI.CVE_PROCESO = ''CONTAICRE'' '+coCRLF+
            '          AND  ' + VLFechaD + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
            '        GROUP BY GP.CVE_PROD_PROG, SUBSTR(CCCG.CTA_CONTABLE,1,10) '+coCRLF+
            '       ) METRICA '+coCRLF+
            // FIN RABA
            ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE'+coCRLF+
            '   AND CONS.CVE_MONEDA          <> ''UDIS'''+coCRLF+
            '   AND CONS.IMP_CAP_VDO         <> 0 '+coCRLF+
            ' GROUP BY CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF
            ;
            vlbColocaUnionAll := True;
            End; // If (pebMuestraK_VEN) Then


        If (pebMuestraI_ANT) Then
            Begin
                 If (vlbColocaUnionAll) Then
                     VlSalida := VlSalida + coCRLF + ' UNION ALL' + coCRLF;

                 VlSalida := VlSalida +
                 coCRLF+
                 ' -- INTERES COB POR ANT '+coCRLF+
                 ' SELECT CONS.CVE_MONEDA AS MONEDA,''COINCRE'' AS ORIGEN,''2 INTERES COBRADO POR ANTICIPADO'' AS TIPO_CUENTA,''2.1 VIGENTE'' AS SEGMENTO,'+coCRLF+
                 '        0 AS SDO_FIN_PER,(SUM(CONS.IMP_PRE_DEVENGAR)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
                 '        CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA, ''SIN RESTRICCION'' AS CVE_TIPO_CTA '+coCRLF+
                 ' FROM  ('+coCRLF+
                 '       SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
                 '               CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA,'+coCRLF+
                 '               NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_PRE_DEVENGAR,'+coCRLF+
                 //'               NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,'+coCRLF+   //RABA JUL 2015 B-6 HISTORICO
                 '               NVL(CCO.CVE_PRODUCTO_OLD, CCOE.CVE_SUB_TIP_BCO_OLD) AS CVE_PRODUCTO_CRE , '+coCRLF+
                 '               NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO,'+coCRLF+
                 '               NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE,'+coCRLF+
                 '               NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR'+coCRLF+
                 '       FROM  (SELECT ID_CREDITO, IMP_PRE_DEVENGAR  FROM CRE_PROV_DIARIA WHERE   IMP_PRE_DEVENGAR > 0   '+coCRLF+
                 '               AND  TRUNC(F_PROVISION) =  '+VLFechaD+') CR_SDO,'+coCRLF+
                 '               MONEDA MO, MONEDA MOE, CR_CREDITO CC, CR_PRODUCTO CP, CRE_CREDITO CCE,'+coCRLF+
                 '               CRE_SUB_TIP_BCO CSTB, CONTRATO C, CONTRATO C2, PERSONA P, PERSONA P2, SECTOR S, SECTOR S2, '+coCRLF+
                 vlHisto +
                 '       WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO'+coCRLF+
                 '       AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO'+coCRLF+
                 '       AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_OLD  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA'+coCRLF+    //RABA JUL 2015 HISTORICO
                 '       AND    P2.ID_PERSONA	     (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR'+coCRLF+
                 '       AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO'+coCRLF+
                 '       AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO_OLD   AND    C.ID_CONTRATO   (+)= CCE.ID_CONTRATO'+coCRLF+   //RABA JUL 2015 HISTORICO
                 '       AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	      AND    P.ID_PERSONA	    (+)= C.ID_TITULAR'+coCRLF+
                 '       AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS,'+coCRLF+
                 //  RABA JUL 2015 SE SUSTITUYE PARA HACER EL REPORTE HISTORICO
                 {
                 '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA'+coCRLF+
                 '         FROM   CR_CONT_GPO_PRO GP,'+coCRLF+
                 '                CR_CONT_CVES_GUIA CCCG'+coCRLF+
                 '         WHERE  GP.CVE_GPO = CCCG.CVE_GPO'+coCRLF+
	         '	      AND    CCCG.CVE_CUENTA = ''INCOAN'''+coCRLF+
                 '         AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
                 '        ) METRICA'+coCRLF+
                 }
                 '       (SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
                 '        FROM   CR_CONT_GRUPO_PROD GP, '+coCRLF+
                 '               CR_CONT_CTA_GUIA CCCG, '+coCRLF+
                 '               CR_CONT_BIT_CAT BI '+coCRLF+
                 '        WHERE  GP.CVE_GRUPO = CCCG.CVE_GRUPO '+coCRLF+
                 '          AND  CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
                 '          AND  CCCG.CVE_CUENTA = ''INCOAN'' '+coCRLF+
                 '          AND  BI.CVE_PROCESO = GP.CVE_PROCESO '+coCRLF+
                 '          AND  BI.ID_BIT_CAT  = GP.ID_BIT_CAT '+coCRLF+
                 '          AND  BI.CVE_PROCESO = CCCG.CVE_PROCESO '+coCRLF+
                 '          AND  BI.ID_BIT_CAT  = CCCG.ID_BIT_CAT '+coCRLF+
                 '          AND  BI.CVE_PROCESO = ''CONTAICRE'' '+coCRLF+
                 '          AND  ' + VLFechaD + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
                 '       ) METRICA '+coCRLF+
                 //FIN RABA
                 ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE'+coCRLF+
                 '   AND CONS.CVE_MONEDA    <> ''UDIS'''+coCRLF+
                 '   AND CONS.IMP_PRE_DEVENGAR  <> 0 '+coCRLF+
                 ' GROUP BY  CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF
                 ;
                 vlbColocaUnionAll := True;
            End;


        If (pebMuestraI_VIG) Then
            Begin
            If (vlbColocaUnionAll) Then
                VlSalida := VlSalida + coCRLF + ' UNION ALL' + coCRLF;

            VlSalida := VlSalida +
            coCRLF+
            ' -- INTERES VIGENTE'+coCRLF+
            ' SELECT CONS.CVE_MONEDA AS MONEDA,''COINCRE'' AS ORIGEN,''1 CARTERA DE CREDITO'' AS TIPO_CUENTA,''1.1 VIGENTE'' AS SEGMENTO,'+coCRLF+
            '        0 AS SDO_FIN_PER,(SUM(CONS.IMP_INT_VIG)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
            '        CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA, ''SIN RESTRICCION'' AS CVE_TIPO_CTA '+coCRLF+
            ' FROM  ('+coCRLF+
            '       SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
            '               CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA,'+coCRLF+
            '               NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_INT_VIG,'+coCRLF+
            //'               NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,'+coCRLF+  //RABA JUL 2015 B-6 HISTORICO
            '               NVL(CCO.CVE_PRODUCTO_OLD, CCOE.CVE_SUB_TIP_BCO_OLD) AS CVE_PRODUCTO_CRE ,'+coCRLF+
            '               NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO,'+coCRLF+
            '               NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE,'+coCRLF+
            '               NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR'+coCRLF+
            '       FROM  (SELECT ID_CREDITO, IMP_INT_VIG  FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) =  '+VLFechaD+') CR_SDO,'+coCRLF+
            '               MONEDA MO, MONEDA MOE, CR_CREDITO CC, CR_PRODUCTO CP, CRE_CREDITO CCE,'+coCRLF+
            '               CRE_SUB_TIP_BCO CSTB, CONTRATO C, CONTRATO C2, PERSONA P, PERSONA P2, SECTOR S, SECTOR S2, '+coCRLF+
            vlHisto +
            '       WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO'+coCRLF+
            '       AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO'+coCRLF+
            '       AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_OLD  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA'+coCRLF+        //RABA JUL 2015 HISTORICO
            '       AND    P2.ID_PERSONA	(+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR'+coCRLF+
            '       AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO'+coCRLF+
            '       AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO_OLD  AND    C.ID_CONTRATO    (+)= CCE.ID_CONTRATO'+coCRLF+       //RABA JUL 2015 HISTORICO
            '       AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	   AND    P.ID_PERSONA	       (+)= C.ID_TITULAR'+coCRLF+
            '       AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS,'+coCRLF+
            //  RABA JUL 2015 SE SUSTITUYE PARA HACER EL REPORTE HISTORICO
            {
            '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA'+coCRLF+
            '         FROM   CR_CONT_GPO_PRO GP,'+coCRLF+
            '                CR_CONT_CVES_GUIA CCCG'+coCRLF+
            '         WHERE  GP.CVE_GPO = CCCG.CVE_GPO'+coCRLF+
	    '	      AND    CCCG.CVE_CUENTA = ''IDSPVE'''+coCRLF+
            '         AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
            '        ) METRICA'+coCRLF+
            }
            '       (SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
            '        FROM   CR_CONT_GRUPO_PROD GP, '+coCRLF+
            '               CR_CONT_CTA_GUIA CCCG, '+coCRLF+
            '               CR_CONT_BIT_CAT BI '+coCRLF+
            '        WHERE  GP.CVE_GRUPO = CCCG.CVE_GRUPO '+coCRLF+
            '          AND  CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
            '          AND  CCCG.CVE_CUENTA = ''IDSPVE'' '+coCRLF+
            '          AND  BI.CVE_PROCESO = GP.CVE_PROCESO '+coCRLF+
            '          AND  BI.ID_BIT_CAT  = GP.ID_BIT_CAT '+coCRLF+
            '          AND  BI.CVE_PROCESO = CCCG.CVE_PROCESO '+coCRLF+
            '          AND  BI.ID_BIT_CAT  = CCCG.ID_BIT_CAT '+coCRLF+
            '          AND  BI.CVE_PROCESO = ''CONTAICRE'' '+coCRLF+
            '          AND  ' + VLFechaD + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
            '       ) METRICA '+coCRLF+
            // FIN RABA
            ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE'+coCRLF+
            '   AND CONS.CVE_MONEDA    <> ''UDIS'''+coCRLF+
            '   AND CONS.IMP_INT_VIG   <> 0 '+coCRLF+
            ' GROUP BY  CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF
            ;
            vlbColocaUnionAll := True;
            End; // If (pebMuestraI_VIG) Then

//         If (true) Then
//           Begin
//            If (vlbColocaUnionAll) Then
//                VlSalida := VlSalida + coCRLF + ' UNION ALL' + coCRLF;

//            VlSalida := VlSalida +
//          ' -- COINCRE INTERESES COBRADOS POR ANTICIPADO'+coCRLF+
//          ' SELECT DECODE(COINCRE.ID_OLTP_MONEDA, 484, ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
//          '        ''COINCRE'' AS ORIGEN,''2 INTERES COBRADO POR ANTICIPADO'' AS TIPO_CUENTA,''2.1 VIGENTE'' AS SEGMENTO,'+coCRLF+
//          '        0 AS SDO_FIN_PER,(SUM(COINCRE.IMP_INT_COB_ANT)) as SDO_COINCRE, COINCRE.ID_OLTP_PRODUCTO AS CVE_CTA_CONTABLE,'+coCRLF+
//          '        COINCRE.PRODUCTO AS NOMBRE_PROD, COINCRE.CVE_OLTP_SECTOR AS CVE_SECTOR, S.DESC_SECTOR, TO_CHAR(METRICA.ID_METRICA) ID_METRICA, ''SIN RESTRICCION'' AS CVE_TIPO_CTA '+coCRLF+
//          ' FROM  ( SELECT DCFC.IMP_INT_COB_ANT,'+coCRLF+
//          '                DCDC.ID_OLTP_PRODUCTO,'+coCRLF+
//          '                DCDC.PRODUCTO,'+coCRLF+
//          '                DCDC.ID_OLTP_MONEDA,'+coCRLF+
//          '                DCDC.CVE_OLTP_SECTOR'+coCRLF+
//          '         FROM ( SELECT ID_ANIO_MES FROM DM_CR_DIM_MES@DWHC DCDM'+coCRLF+
//          '                WHERE DCDM.ANIO = '+vlStrGJAHR+' AND DCDM.NUM_MES = '+vlStrMONAT+coCRLF+
//          '              ) DCDM,'+coCRLF+
//          '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO '+coCRLF+
//          '           FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
//          '                  CR_CONT_CVES_GUIA CCCG '+coCRLF+
//          '           WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
//          '           AND    CCCG.CVE_CUENTA = ''INCOAN'' '+coCRLF+
//          '           AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+
//          '       ) CCS,'+coCRLF+
//          '              DM_CR_FAC_CREDITO@DWHC DCFC,'+coCRLF+
//          '              DM_CR_DIM_CREDITO@DWHC DCDC'+coCRLF+
//          '         WHERE DCFC.ID_ANIO_MES = DCDM.ID_ANIO_MES'+coCRLF+
//          '           AND DCDC.ID_CREDITO = DCFC.ID_CREDITO'+coCRLF+
//          '           AND DCDC.ID_OLTP_PRODUCTO = CCS.ID_OLTP_PRODUCTO'+coCRLF+
//          '           AND DCDC.ORIGEN_INFO NOT IN (''INTERCREDITOS'',''OI_INT'')'+coCRLF+   // RABA ENE 2013 SIN INFO DE INTERCREDITOS
//          '       ) COINCRE,'+coCRLF+
//          '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
//          '           FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
//          '                  CR_CONT_CVES_GUIA CCCG '+coCRLF+
//          '           WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
//          '           AND    CCCG.CVE_CUENTA = ''INCOAN'' '+coCRLF+
//          '           AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+
//          '       ) METRICA, '+coCRLF+

//          '       SECTOR S'+coCRLF+
//          ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= COINCRE.ID_OLTP_PRODUCTO'+coCRLF+
//          '   AND COINCRE.ID_OLTP_MONEDA  <> 800 -- UDIS'+coCRLF+
//          '   AND COINCRE.IMP_INT_COB_ANT <> 0'+coCRLF+
//          '   AND S.CVE_SECTOR (+)= COINCRE.CVE_OLTP_SECTOR'+coCRLF+
//          ' GROUP BY COINCRE.ID_OLTP_MONEDA, COINCRE.ID_OLTP_PRODUCTO, COINCRE.PRODUCTO, COINCRE.CVE_OLTP_SECTOR, S.DESC_SECTOR, METRICA.ID_METRICA'+coCRLF
//          ;
//             vlbColocaUnionAll := True;
//            End;


        If (pebMuestraI_IMP) Then
            Begin
            If (vlbColocaUnionAll) Then
                VlSalida := VlSalida + coCRLF + ' UNION ALL' + coCRLF;

            VlSalida := VlSalida +
            coCRLF+
            ' -- INTERES IMPAGADO'+coCRLF+
            ' SELECT CONS.CVE_MONEDA AS MONEDA,''COINCRE'' AS ORIGEN,''1 CARTERA DE CREDITO'' AS TIPO_CUENTA,''1.1 VIGENTE'' AS SEGMENTO,'+coCRLF+
            '        0 AS SDO_FIN_PER,(SUM(CONS.IMP_INT_IMP)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
            '        CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA, ''SIN RESTRICCION'' AS CVE_TIPO_CTA '+coCRLF+
            ' FROM  ('+coCRLF+
            '       SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
            '               CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA,'+coCRLF+
            '               NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_INT_IMP,'+coCRLF+
            //'               NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,'+coCRLF+  //RABA JUL 2015 B-6 HISTORICO
            '               NVL(CCO.CVE_PRODUCTO_OLD, CCOE.CVE_SUB_TIP_BCO_OLD) AS CVE_PRODUCTO_CRE ,'+coCRLF+
            '               NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO,'+coCRLF+
            '               NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE,'+coCRLF+
            '               NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR'+coCRLF+
            '       FROM  (SELECT ID_CREDITO, IMP_INT_IMP FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) =  '+VLFechaD+') CR_SDO,'+coCRLF+
            '               MONEDA MO, MONEDA MOE, CR_CREDITO CC, CR_PRODUCTO CP, CRE_CREDITO CCE,'+coCRLF+
            '               CRE_SUB_TIP_BCO CSTB, CONTRATO C, CONTRATO C2, PERSONA P, PERSONA P2, SECTOR S, SECTOR S2, '+coCRLF+
            vlHisto +
            '       WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO'+coCRLF+
            '       AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO'+coCRLF+
            '       AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_OLD  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA'+coCRLF+      //RABA JUL 2015 HISTORICO
            '       AND    P2.ID_PERSONA	(+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR'+coCRLF+
            '       AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO'+coCRLF+
            '       AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO_OLD  AND    C.ID_CONTRATO    (+)= CCE.ID_CONTRATO'+coCRLF+     //RABA JUL 2015 HISTORICO
            '       AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	   AND    P.ID_PERSONA         (+)= C.ID_TITULAR'+coCRLF+
            '       AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS,'+coCRLF+
            //  RABA JUL 2015 SE SUSTITUYE PARA HACER EL REPORTE HISTORICO
            {
            '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA'+coCRLF+
            '         FROM   CR_CONT_GPO_PRO GP,'+coCRLF+
            '                CR_CONT_CVES_GUIA CCCG'+coCRLF+
            '         WHERE  GP.CVE_GPO = CCCG.CVE_GPO'+coCRLF+
	    '	      AND    CCCG.CVE_CUENTA = ''IDCPVE'''+coCRLF+
            '         AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
            '       ) METRICA'+coCRLF+
            }
            '       (SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
            '        FROM   CR_CONT_GRUPO_PROD GP, '+coCRLF+
            '               CR_CONT_CTA_GUIA CCCG, '+coCRLF+
            '               CR_CONT_BIT_CAT BI '+coCRLF+
            '        WHERE  GP.CVE_GRUPO = CCCG.CVE_GRUPO '+coCRLF+
            '          AND  CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
            '          AND  CCCG.CVE_CUENTA = ''IDCPVE'' '+coCRLF+
            '          AND  BI.CVE_PROCESO = GP.CVE_PROCESO '+coCRLF+
            '          AND  BI.ID_BIT_CAT  = GP.ID_BIT_CAT '+coCRLF+
            '          AND  BI.CVE_PROCESO = CCCG.CVE_PROCESO '+coCRLF+
            '          AND  BI.ID_BIT_CAT  = CCCG.ID_BIT_CAT '+coCRLF+
            '          AND  BI.CVE_PROCESO = ''CONTAICRE'' '+coCRLF+
            '          AND  ' + VLFechaD + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
            '       ) METRICA '+coCRLF+
            //FIN RABA
            ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE '+coCRLF+
            '   AND CONS.CVE_MONEDA     <> ''UDIS'' '+coCRLF+
            '   AND CONS.IMP_INT_IMP    <> 0 '+coCRLF+
            ' GROUP BY CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA '+coCRLF
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
            ' SELECT CONS.CVE_MONEDA AS MONEDA,''COINCRE'' AS ORIGEN,''1 CARTERA DE CREDITO'' AS TIPO_CUENTA,''1.2 VENCIDO'' AS SEGMENTO,'+coCRLF+
            '        0 AS SDO_FIN_PER,(SUM(CONS.IMP_INT_VDO_EX /*+ CONS.IMP_INT_VDO_NE*/)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
            '        CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA, ''SIN RESTRICCION'' AS CVE_TIPO_CTA '+coCRLF+
            ' FROM  ('+coCRLF+
            '       SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
            '               CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA,'+coCRLF+
            '               NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_INT_VDO_EX, CR_SDO.IMP_INT_VDO_NE,'+coCRLF+
            //'               NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE ,'+coCRLF+  //RABA JUL 2015 B-6 HISTORICO
            '               NVL(CCO.CVE_PRODUCTO_OLD, CCOE.CVE_SUB_TIP_BCO_OLD) AS CVE_PRODUCTO_CRE ,'+coCRLF+
            '               NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO,'+coCRLF+
            '               NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE,'+coCRLF+
            '               NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR'+coCRLF+
            '       FROM  (SELECT ID_CREDITO,  IMP_INT_VDO_EX, IMP_INT_VDO_NE  FROM CR_CON_ADEUDO_SDO WHERE TRUNC(F_CIERRE) =  '+VLFechaD+') CR_SDO,'+coCRLF+
            '               MONEDA MO, MONEDA MOE, CR_CREDITO CC, CR_PRODUCTO CP, CRE_CREDITO CCE,'+coCRLF+
            '               CRE_SUB_TIP_BCO CSTB, CONTRATO C, CONTRATO C2, PERSONA P, PERSONA P2, SECTOR S, SECTOR S2, '+coCRLF+
            vlHisto +
            '       WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO'+coCRLF+
            '       AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO'+coCRLF+
            '       AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_OLD  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA'+coCRLF+        //RABA JUL 2015 HISTORICO
            '       AND    P2.ID_PERSONA	(+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)= P2.CVE_TIPO_SECTOR'+coCRLF+
            '       AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO'+coCRLF+
            '       AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO_OLD  AND    C.ID_CONTRATO    (+)= CCE.ID_CONTRATO'+coCRLF+       //RABA JUL 2015 HISTORICO
            '       AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	   AND    P.ID_PERSONA	       (+)= C.ID_TITULAR'+coCRLF+
            '       AND    S.CVE_SECTOR         (+)= P.CVE_TIPO_SECTOR ) CONS,'+coCRLF+
            //  RABA JUL 2015 SE SUSTITUYE PARA HACER EL REPORTE HISTORICO
            {
            '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA'+coCRLF+
            '         FROM   CR_CONT_GPO_PRO GP,'+coCRLF+
            '                CR_CONT_CVES_GUIA CCCG'+coCRLF+
            '         WHERE  GP.CVE_GPO = CCCG.CVE_GPO'+coCRLF+
	    '	      AND    CCCG.CVE_CUENTA = ''INVE'''+coCRLF+
            '         AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
            '        ) METRICA'+coCRLF+
            }
            '       (SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
            '        FROM   CR_CONT_GRUPO_PROD GP, '+coCRLF+
            '               CR_CONT_CTA_GUIA CCCG, '+coCRLF+
            '               CR_CONT_BIT_CAT BI '+coCRLF+
            '        WHERE  GP.CVE_GRUPO = CCCG.CVE_GRUPO '+coCRLF+
            '          AND  CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
            '          AND  CCCG.CVE_CUENTA = ''INVE'' '+coCRLF+
            '          AND  BI.CVE_PROCESO = GP.CVE_PROCESO '+coCRLF+
            '          AND  BI.ID_BIT_CAT  = GP.ID_BIT_CAT '+coCRLF+
            '          AND  BI.CVE_PROCESO = CCCG.CVE_PROCESO '+coCRLF+
            '          AND  BI.ID_BIT_CAT  = CCCG.ID_BIT_CAT '+coCRLF+
            '          AND  BI.CVE_PROCESO = ''CONTAICRE'' '+coCRLF+
            '          AND  ' + VLFechaD + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
            '       ) METRICA '+coCRLF+
            // FIN RABA
            ' WHERE   METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE'+coCRLF+
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
                                                          TRUE, // -- Incluye intereses cobrados x anticipados
                                                          peFechaEspecifica);
        VlSalida :=  VlSalida +
        //GRUPOS
         '  ) A'+ coCRLF;    //HERJA QUITAR LA 'A'

//        VlSalida :=  VlSalida + 'ORDER BY CVE_TIPO_CTA, MONEDA, TIPO_CUENTA, SEGMENTO, ID_METRICA, CVE_SECTOR, CVE_CTA_CONTABLE '+coCRLF;

        //HERJA - QUITAR POSTERIORMENTE
        VlSalida :=  VlSalida +
                    ') WHERE 1=1 '+coCRLF+
                    '  AND NOT (ID_PA LIKE ( ''%140104%'' )) '+ coCRLF+
                    '  AND NOT (ID_PA LIKE ( ''%505059%'' )) '+coCRLF;
        //FIN HERJA


        VlSalida :=  VlSalida + 'ORDER BY CVE_TIPO_CTA, MONEDA, TIPO_CUENTA, SEGMENTO, ID_METRICA, CVE_SECTOR, CVE_CTA_CONTABLE '+coCRLF;        

     End;
     Result := VlSalida;
end;

Function TQrCompCOINCREDetalleN.ArmaQuery_COINCRE_Detalle_SAP(PEMes,PEAnio : Integer;
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
     // MENSUAL
     If (PETipoRep = 'ME') Then
     begin
      vlStrGJAHR := IntToStr(PEAnio);
      vlStrMONAT := IntToStr(PEMes);
      vlFechaD := 'LAST_DAY(TO_DATE('#39'01'#39'||TO_CHAR('+IntToStr(PEMes)+','+#39'00'#39')||TO_CHAR('+IntToStr(PEAnio)+','#39'0000'#39'),'#39'DDMMYYYY'#39'))';

      VlSalida :=
              ' SELECT * FROM ( '+coCRLF+
              ' -- /////////////////////////////////////////////////////////////////////////////////////'+coCRLF+
              ' -- ////////////////////////// S A L D O S    C O I N C R E /////////////////////////////'+coCRLF+
              ' -- /////////////////////////////////////////////////////////////////////////////////////'+coCRLF
              ;

            //HERJA - HAY QUE QUITAR DESPUES
      VlSalida :=  VlSalida +
            ' SELECT A.*, (A.MONEDA||'' ''||A.ORIGEN||'' ''||A.TIPO_CUENTA||'' ''||A.SEGMENTO||'' ''||A.CVE_SECTOR||'' ''||A.ID_METRICA) ID_PA FROM ( '+coCRLF;
            //FIN HERJA

      vlbColocaUnionAll := False;
      If (pebMuestraK_VIG) Then
          Begin
      VlSalida :=  VlSalida +
          coCRLF +
          ' -- COINCRE CAPITAL VIGENTE'+coCRLF+
          ' SELECT DECODE(COINCRE.ID_OLTP_MONEDA, 484, ''PESO MEXICANO'', ''DOLAR AMERICANO'') AS MONEDA,'+coCRLF+
          '        ''COINCRE'' AS ORIGEN,''CAPITAL'' AS TIPO_CUENTA,''VIGENTE'' AS SEGMENTO,'+coCRLF+
          '        0 AS SDO_FIN_PER,(SUM(COINCRE.IMP_CAP_VIG)) as SDO_COINCRE, COINCRE.ID_OLTP_PRODUCTO AS CVE_CTA_CONTABLE,'+coCRLF+
          '        COINCRE.PRODUCTO AS NOMBRE_PROD, COINCRE.CVE_OLTP_SECTOR AS CVE_SECTOR, S.DESC_SECTOR, TO_CHAR(METRICA.ID_METRICA) ID_METRICA, '+coCRLF+
          '        ''SIN RESTRICCION'' AS CVE_TIPO_CTA '+coCRLF+                //RABA JUL 2015 FALTA ESTA COLUMNA
          ' FROM  ( SELECT DCFC.IMP_SDO_K_VIG AS IMP_CAP_VIG,'+coCRLF+
          '                DCDC.ID_OLTP_PRODUCTO,'+coCRLF+
          '                DCDC.PRODUCTO,'+coCRLF+
          '                DCDC.ID_OLTP_MONEDA,'+coCRLF+
          '                DCDC.CVE_OLTP_SECTOR'+coCRLF+
          '         FROM ( SELECT ID_ANIO_MES FROM DM_CR_DIM_MES@DWHC DCDM'+coCRLF+
          '                WHERE DCDM.ANIO = '+vlStrGJAHR+' AND DCDM.NUM_MES = '+vlStrMONAT+coCRLF+
          '              ) DCDM,'+coCRLF+
          //RABA SEP 2012 - CAMBIO EN LA METRICA
{          '              ( SELECT ID_OLTP_PRODUCTO'+coCRLF+
          '                FROM CR_COINCRE_SAP'+coCRLF+
          '                WHERE ID_REPORTE = 4 -- CAPITAL VIGENTE'+coCRLF+
          '                GROUP BY ID_OLTP_PRODUCTO'+coCRLF+
          '              ) CCS,'+coCRLF+
}
// RABA JUL 2015 NUEVAMENTE CAMBIO EN CATÁLOGOS B-6
{          '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO '+coCRLF+
          '           FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
          '                  CR_CONT_CVES_GUIA CCCG '+coCRLF+
          '           WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
          '           AND    CCCG.CVE_CUENTA = ''SIPAVE'' '+coCRLF+
          '           AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
          '       ) CCS,'+coCRLF+
}          //FIN RABA
          '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO '+coCRLF+
          '         FROM CR_CONT_GRUPO_PROD GP,  '+coCRLF+
          '              CR_CONT_CTA_GUIA CCCG, '+coCRLF+
          '              CR_CONT_BIT_CAT BI '+coCRLF+
          '         WHERE GP.CVE_GRUPO     = CCCG.CVE_GRUPO '+coCRLF+
          '           AND GP.CVE_PROCESO   = BI.CVE_PROCESO '+coCRLF+
          '           AND GP.ID_BIT_CAT    = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_PROCESO = BI.CVE_PROCESO '+coCRLF+
          '           AND CCCG.ID_BIT_CAT  = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_CUENTA = ''SIPAVE'' '+coCRLF+
          '           AND CCCG.CVE_TIPO_CTA = ''SR''  '+coCRLF+
          '           AND ' + vlFechaD + ' BETWEEN BI.F_INICIO AND BI.F_FINAL  '+coCRLF+
          '        ) CCS, '+coCRLF+
//FIN RABA
          '              DM_CR_FAC_CREDITO@DWHC DCFC,'+coCRLF+
          '              DM_CR_DIM_CREDITO@DWHC DCDC'+coCRLF+
          '         WHERE DCFC.ID_ANIO_MES = DCDM.ID_ANIO_MES'+coCRLF+
          '           AND DCDC.ID_CREDITO = DCFC.ID_CREDITO'+coCRLF+
          '           AND DCDC.ID_OLTP_PRODUCTO = CCS.ID_OLTP_PRODUCTO'+coCRLF+
          '       ) COINCRE,'+coCRLF+
          {'       ( SELECT ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
          '         FROM CR_COINCRE_SAP'+coCRLF+
          '         WHERE ID_REPORTE = 4 -- CAPITAL VIGENTE'+coCRLF+
          '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA'+coCRLF+
          '       ) METRICA,'+coCRLF+ }
          //HERJA - CAMBIO EN LA METRICA
// RABA JUL 2015 NUEVAMENTE CAMBIO EN CATÁLOGOS B-6
{          '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
          '           FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
          '                  CR_CONT_CVES_GUIA CCCG '+coCRLF+
          '           WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
          '           AND    CCCG.CVE_CUENTA = ''SIPAVE'' '+coCRLF+
          '           AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
          '       ) METRICA, '+coCRLF+
          //FIN HERJA
}
          '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
          '         FROM CR_CONT_GRUPO_PROD GP, '+coCRLF+
          '              CR_CONT_CTA_GUIA CCCG, '+coCRLF+
          '              CR_CONT_BIT_CAT BI '+coCRLF+
          '         WHERE GP.CVE_GRUPO     = CCCG.CVE_GRUPO '+coCRLF+
          '           AND GP.CVE_PROCESO   = BI.CVE_PROCESO '+coCRLF+
          '           AND GP.ID_BIT_CAT    = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_PROCESO = BI.CVE_PROCESO '+coCRLF+
          '           AND CCCG.ID_BIT_CAT  = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_CUENTA = ''SIPAVE'' '+coCRLF+
          '           AND CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
          '           AND ' + vlFechaD + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
          '        ) METRICA, '+coCRLF+
// RABA JUL 2015 ACTUALIZACIÓN B-6 SE ELIMINA AUTO-DBLINK
//          '       SECTOR@CORP S'+coCRLF+
          '       SECTOR S'+coCRLF+
// FIN RABA
          ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= COINCRE.ID_OLTP_PRODUCTO'+coCRLF+
          //'   AND METRICA.CVE_SECTOR (+)= COINCRE.CVE_OLTP_SECTOR'+coCRLF+
          //'   AND METRICA.CVE_MONEDA (+)= COINCRE.ID_OLTP_MONEDA'+coCRLF+
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
          '        COINCRE.PRODUCTO AS NOMBRE_PROD, COINCRE.CVE_OLTP_SECTOR AS CVE_SECTOR, S.DESC_SECTOR, TO_CHAR(METRICA.ID_METRICA) ID_METRICA, '+coCRLF+
          '        ''SIN RESTRICCION'' AS CVE_TIPO_CTA '+coCRLF+                //RABA JUL 2015 FALTA ESTA COLUMNA
          ' FROM  ( SELECT DCFC.IMP_SDO_K_IMP AS IMP_CAP_IMP,'+coCRLF+
          '                DCDC.ID_OLTP_PRODUCTO,'+coCRLF+
          '                DCDC.PRODUCTO,'+coCRLF+
          '                DCDC.ID_OLTP_MONEDA,'+coCRLF+
          '                DCDC.CVE_OLTP_SECTOR'+coCRLF+
          '         FROM ( SELECT ID_ANIO_MES FROM DM_CR_DIM_MES@DWHC DCDM'+coCRLF+
          '                WHERE DCDM.ANIO = '+vlStrGJAHR+' AND DCDM.NUM_MES = '+vlStrMONAT+coCRLF+
          '              ) DCDM,'+coCRLF+
          //RABA SEP 2012 - CAMBIO EN LA METRICA
{          '              ( SELECT ID_OLTP_PRODUCTO'+coCRLF+
          '                FROM CR_COINCRE_SAP'+coCRLF+
          '                WHERE ID_REPORTE = 16 -- CAPITAL IMPAGADO'+coCRLF+
          '                GROUP BY ID_OLTP_PRODUCTO'+coCRLF+
          '              ) CCS,'+coCRLF+
}
{          '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO '+coCRLF+
          '           FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
          '                  CR_CONT_CVES_GUIA CCCG '+coCRLF+
          '           WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
          '           AND    CCCG.CVE_CUENTA = ''COPAVE'' '+coCRLF+
          '           AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
          '       ) CCS,'+coCRLF+
}          //FIN RABA
          //RABA JUL 2015
          '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO '+coCRLF+
          '         FROM CR_CONT_GRUPO_PROD GP, '+coCRLF+
          '              CR_CONT_CTA_GUIA CCCG, '+coCRLF+
          '              CR_CONT_BIT_CAT BI '+coCRLF+
          '         WHERE GP.CVE_GRUPO     = CCCG.CVE_GRUPO '+coCRLF+
          '           AND GP.CVE_PROCESO   = BI.CVE_PROCESO '+coCRLF+
          '           AND GP.ID_BIT_CAT    = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_PROCESO = BI.CVE_PROCESO '+coCRLF+
          '           AND CCCG.ID_BIT_CAT  = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_CUENTA = ''COPAVE'' '+coCRLF+
          '           AND CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
          '           AND ' + vlFechaD + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
          '        ) CCS,'+coCRLF+
          //FIN RABA
          '              DM_CR_FAC_CREDITO@DWHC DCFC,'+coCRLF+
          '              DM_CR_DIM_CREDITO@DWHC DCDC'+coCRLF+
          '         WHERE DCFC.ID_ANIO_MES = DCDM.ID_ANIO_MES'+coCRLF+
          '           AND DCDC.ID_CREDITO = DCFC.ID_CREDITO'+coCRLF+
          '           AND DCDC.ID_OLTP_PRODUCTO = CCS.ID_OLTP_PRODUCTO'+coCRLF+
          '       ) COINCRE,'+coCRLF+
          {'       ( SELECT ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
          '         FROM CR_COINCRE_SAP'+coCRLF+
          '         WHERE ID_REPORTE = 16 -- CAPITAL IMPAGADO'+coCRLF+
          '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA'+coCRLF+
          '       ) METRICA,'+coCRLF+     }
          //HERJA - CAMBIO EN LA METRICA
{          '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
          '           FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
          '                  CR_CONT_CVES_GUIA CCCG '+coCRLF+
          '           WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
          '           AND    CCCG.CVE_CUENTA = ''COPAVE'' '+coCRLF+
          '           AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
          '       ) METRICA, '+coCRLF+
}          //FIN HERJA
          '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
          '         FROM CR_CONT_GRUPO_PROD GP, '+coCRLF+
          '              CR_CONT_CTA_GUIA CCCG, '+coCRLF+
          '              CR_CONT_BIT_CAT BI '+coCRLF+
          '         WHERE GP.CVE_GRUPO     = CCCG.CVE_GRUPO '+coCRLF+
          '           AND GP.CVE_PROCESO   = BI.CVE_PROCESO '+coCRLF+
          '           AND GP.ID_BIT_CAT    = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_PROCESO = BI.CVE_PROCESO '+coCRLF+
          '           AND CCCG.ID_BIT_CAT  = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_CUENTA = ''COPAVE'' '+coCRLF+
          '           AND CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
          '           AND ' + vlFechaD + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
          '        ) METRICA, '+coCRLF+
// RABA JUL 2015 ACTUALIZACIÓN B-6 SE ELIMINA AUTO-DBLINK
//          '       SECTOR@CORP S'+coCRLF+
          '       SECTOR S'+coCRLF+
//FIN RABA
          ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= COINCRE.ID_OLTP_PRODUCTO'+coCRLF+
          //'   AND METRICA.CVE_SECTOR (+)= COINCRE.CVE_OLTP_SECTOR'+coCRLF+
          //'   AND METRICA.CVE_MONEDA (+)= COINCRE.ID_OLTP_MONEDA'+coCRLF+
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
          '        COINCRE.PRODUCTO AS NOMBRE_PROD, COINCRE.CVE_OLTP_SECTOR AS CVE_SECTOR, S.DESC_SECTOR, TO_CHAR(METRICA.ID_METRICA) ID_METRICA, '+coCRLF+
          '        ''SIN RESTRICCION'' AS CVE_TIPO_CTA '+coCRLF+                //RABA JUL 2015 FALTA ESTA COLUMNA
          ' FROM  ( SELECT DCFC.IMP_SDO_K_VEN AS IMP_CAP_VDO,'+coCRLF+
          '                DCDC.ID_OLTP_PRODUCTO,'+coCRLF+
          '                DCDC.PRODUCTO,'+coCRLF+
          '                DCDC.ID_OLTP_MONEDA,'+coCRLF+
          '                DCDC.CVE_OLTP_SECTOR'+coCRLF+
          '         FROM ( SELECT ID_ANIO_MES FROM DM_CR_DIM_MES@DWHC DCDM'+coCRLF+
          '                WHERE DCDM.ANIO = '+vlStrGJAHR+' AND DCDM.NUM_MES = '+vlStrMONAT+coCRLF+
          '              ) DCDM,'+coCRLF+
          //RABA SEP 2012 - CAMBIO EN LA METRICA
{          '              ( SELECT ID_OLTP_PRODUCTO'+coCRLF+
          '                FROM CR_COINCRE_SAP'+coCRLF+
          '                WHERE ID_REPORTE = 20 -- CAPITAL VENCIDO'+coCRLF+
          '                GROUP BY ID_OLTP_PRODUCTO'+coCRLF+
          '              ) CCS,'+coCRLF+
}
          //RABA JUL 2015 B-6
{          '       ( SELECT DISTINCT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO '+coCRLF+
          '           FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
          '                  CR_CONT_CVES_GUIA CCCG '+coCRLF+
          '           WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
          '           AND    CCCG.CVE_CUENTA IN (''CAVE'',''CAVENE'') '+coCRLF+
          '           AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
          '       ) CCS,'+coCRLF+
}          //FIN RABA
          '       ( SELECT DISTINCT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO '+coCRLF+
          '         FROM CR_CONT_GRUPO_PROD GP, '+coCRLF+
          '              CR_CONT_CTA_GUIA CCCG, '+coCRLF+
          '              CR_CONT_BIT_CAT BI '+coCRLF+
          '         WHERE GP.CVE_GRUPO     = CCCG.CVE_GRUPO '+coCRLF+
          '           AND GP.CVE_PROCESO   = BI.CVE_PROCESO '+coCRLF+
          '           AND GP.ID_BIT_CAT    = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_PROCESO = BI.CVE_PROCESO '+coCRLF+
          '           AND CCCG.ID_BIT_CAT  = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_CUENTA IN (''CAVE'',''CAVENE'') '+coCRLF+
          '           AND CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
          '           AND ' + vlFechaD + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
          '        ) CCS, '+coCRLF+
          //FIN RABA
          '              DM_CR_FAC_CREDITO@DWHC DCFC,'+coCRLF+
          '              DM_CR_DIM_CREDITO@DWHC DCDC'+coCRLF+
          '         WHERE DCFC.ID_ANIO_MES = DCDM.ID_ANIO_MES'+coCRLF+
          '           AND DCDC.ID_CREDITO = DCFC.ID_CREDITO'+coCRLF+
          '           AND DCDC.ID_OLTP_PRODUCTO = CCS.ID_OLTP_PRODUCTO'+coCRLF+
          '       ) COINCRE,'+coCRLF+
          {'       ( SELECT ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
          '         FROM CR_COINCRE_SAP'+coCRLF+
          '         WHERE ID_REPORTE = 20 -- CAPITAL VENCIDO'+coCRLF+
          '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA'+coCRLF+
          '       ) METRICA,'+coCRLF+}
          //HERJA - CAMBIO EN LA METRICA
{          '       ( SELECT DISTINCT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,2)||SUBSTR(CCCG.CTA_CONTABLE,5,6) AS ID_METRICA '+coCRLF+
          '           FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
          '                  CR_CONT_CVES_GUIA CCCG '+coCRLF+
          '           WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
          '           AND    CCCG.CVE_CUENTA IN (''CAVE'',''CAVENE'') '+coCRLF+
          '           AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
          '       ) METRICA, '+coCRLF+
}          //FIN HERJA
          '       ( SELECT DISTINCT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
          '         FROM CR_CONT_GRUPO_PROD GP, '+coCRLF+
          '              CR_CONT_CTA_GUIA CCCG, '+coCRLF+
          '              CR_CONT_BIT_CAT BI '+coCRLF+
          '         WHERE GP.CVE_GRUPO     = CCCG.CVE_GRUPO '+coCRLF+
          '           AND GP.CVE_PROCESO   = BI.CVE_PROCESO '+coCRLF+
          '           AND GP.ID_BIT_CAT    = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_PROCESO = BI.CVE_PROCESO '+coCRLF+
          '           AND CCCG.ID_BIT_CAT  = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_CUENTA IN (''CAVE'',''CAVENE'') '+coCRLF+
          '           AND CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
          '           AND ' + vlFechaD + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
          '        ) METRICA, '+coCRLF+
          //FIN HERJA
// RABA JUL 2015 ACTUALIZACIÓN B-6 SE ELIMINA AUTO-DBLINK
//          '       SECTOR@CORP S'+coCRLF+
          '       SECTOR S'+coCRLF+
//FIN RABA
          ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= COINCRE.ID_OLTP_PRODUCTO'+coCRLF+
          //'   AND METRICA.CVE_SECTOR (+)= COINCRE.CVE_OLTP_SECTOR'+coCRLF+
          //'   AND METRICA.CVE_MONEDA (+)= COINCRE.ID_OLTP_MONEDA'+coCRLF+
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
          '        COINCRE.PRODUCTO AS NOMBRE_PROD, COINCRE.CVE_OLTP_SECTOR AS CVE_SECTOR, S.DESC_SECTOR, TO_CHAR(METRICA.ID_METRICA) ID_METRICA, '+coCRLF+
          '        ''SIN RESTRICCION'' AS CVE_TIPO_CTA '+coCRLF+                //RABA JUL 2015 FALTA ESTA COLUMNA
          ' FROM  ( SELECT DCFC.IMP_INT_CORTE AS IMP_INT_VIG,'+coCRLF+
          '                DCDC.ID_OLTP_PRODUCTO,'+coCRLF+
          '                DCDC.PRODUCTO,'+coCRLF+
          '                DCDC.ID_OLTP_MONEDA,'+coCRLF+
          '                DCDC.CVE_OLTP_SECTOR'+coCRLF+
          '         FROM ( SELECT ID_ANIO_MES FROM DM_CR_DIM_MES@DWHC DCDM'+coCRLF+
          '                WHERE DCDM.ANIO = '+vlStrGJAHR+' AND DCDM.NUM_MES = '+vlStrMONAT+coCRLF+
          '              ) DCDM,'+coCRLF+
          //RABA SEP 2012 - CAMBIO EN LA METRICA
{          '              ( SELECT ID_OLTP_PRODUCTO'+coCRLF+
          '                FROM CR_COINCRE_SAP'+coCRLF+
          '                WHERE ID_REPORTE = 30 -- INTERÉS VIGENTE'+coCRLF+
          '                GROUP BY ID_OLTP_PRODUCTO'+coCRLF+
          '              ) CCS,'+coCRLF+
}
          //RABA JUL 2015 B-6
{          '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO '+coCRLF+
          '           FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
          '                  CR_CONT_CVES_GUIA CCCG '+coCRLF+
          '           WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
          '           AND    CCCG.CVE_CUENTA = ''IDSPVE'' '+coCRLF+
          '           AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
          '       ) CCS,'+coCRLF+
}          //FIN RABA
          '       ( SELECT DISTINCT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO '+coCRLF+
          '         FROM CR_CONT_GRUPO_PROD GP, '+coCRLF+
          '              CR_CONT_CTA_GUIA CCCG, '+coCRLF+
          '              CR_CONT_BIT_CAT BI '+coCRLF+
          '         WHERE GP.CVE_GRUPO     = CCCG.CVE_GRUPO '+coCRLF+
          '           AND GP.CVE_PROCESO   = BI.CVE_PROCESO '+coCRLF+
          '           AND GP.ID_BIT_CAT    = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_PROCESO = BI.CVE_PROCESO '+coCRLF+
          '           AND CCCG.ID_BIT_CAT  = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_CUENTA = ''IDSPVE'' '+coCRLF+
          '           AND CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
          '           AND ' + vlFechaD + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
          '        ) CCS, '+coCRLF+
          //FIN RABA
          '              DM_CR_FAC_CREDITO@DWHC DCFC,'+coCRLF+
          '              DM_CR_DIM_CREDITO@DWHC DCDC'+coCRLF+
          '         WHERE DCFC.ID_ANIO_MES = DCDM.ID_ANIO_MES'+coCRLF+
          '           AND DCDC.ID_CREDITO = DCFC.ID_CREDITO'+coCRLF+
          '           AND DCDC.ID_OLTP_PRODUCTO = CCS.ID_OLTP_PRODUCTO'+coCRLF+
          '       ) COINCRE,'+coCRLF+
          {'       ( SELECT ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
          '         FROM CR_COINCRE_SAP'+coCRLF+
          '         WHERE ID_REPORTE = 30 -- INTERÉS VIGENTE'+coCRLF+
          '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA'+coCRLF+
          '       ) METRICA,'+coCRLF+ }
          //HERJA - CAMBIO EN LA METRICA
{          '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
          '           FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
          '                  CR_CONT_CVES_GUIA CCCG '+coCRLF+
          '           WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
          '           AND    CCCG.CVE_CUENTA = ''IDSPVE'' '+coCRLF+
          '           AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
          '       ) METRICA, '+coCRLF+
}          //FIN HERJA
          '       ( SELECT DISTINCT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
          '         FROM CR_CONT_GRUPO_PROD GP, '+coCRLF+
          '              CR_CONT_CTA_GUIA CCCG, '+coCRLF+
          '              CR_CONT_BIT_CAT BI '+coCRLF+
          '         WHERE GP.CVE_GRUPO     = CCCG.CVE_GRUPO '+coCRLF+
          '           AND GP.CVE_PROCESO   = BI.CVE_PROCESO '+coCRLF+
          '           AND GP.ID_BIT_CAT    = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_PROCESO = BI.CVE_PROCESO '+coCRLF+
          '           AND CCCG.ID_BIT_CAT  = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_CUENTA = ''IDSPVE'' '+coCRLF+
          '           AND CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
          '           AND ' + vlFechaD + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
          '        ) METRICA, '+coCRLF+
          //FIN HERJA
// RABA JUL 2015 ACTUALIZACIÓN B-6 SE ELIMINA AUTO-DBLINK
//          '       SECTOR@CORP S'+coCRLF+
          '       SECTOR S'+coCRLF+
//FIN RABA
          ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= COINCRE.ID_OLTP_PRODUCTO'+coCRLF+
          //'   AND METRICA.CVE_SECTOR (+)= COINCRE.CVE_OLTP_SECTOR'+coCRLF+
          //'   AND METRICA.CVE_MONEDA (+)= COINCRE.ID_OLTP_MONEDA'+coCRLF+
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
          '        COINCRE.PRODUCTO AS NOMBRE_PROD, COINCRE.CVE_OLTP_SECTOR AS CVE_SECTOR, S.DESC_SECTOR, TO_CHAR(METRICA.ID_METRICA) ID_METRICA, '+coCRLF+
          '        ''SIN RESTRICCION'' AS CVE_TIPO_CTA '+coCRLF+                //RABA JUL 2015 FALTA ESTA COLUMNA
          ' FROM  ( SELECT DCFC.IMP_INT_COB_ANT,'+coCRLF+
          '                DCDC.ID_OLTP_PRODUCTO,'+coCRLF+
          '                DCDC.PRODUCTO,'+coCRLF+
          '                DCDC.ID_OLTP_MONEDA,'+coCRLF+
          '                DCDC.CVE_OLTP_SECTOR'+coCRLF+
          '         FROM ( SELECT ID_ANIO_MES FROM DM_CR_DIM_MES@DWHC DCDM'+coCRLF+
          '                WHERE DCDM.ANIO = '+vlStrGJAHR+' AND DCDM.NUM_MES = '+vlStrMONAT+coCRLF+
          '              ) DCDM,'+coCRLF+
          //RABA SEP 2012 - CAMBIO EN LA METRICA
{          '              ( SELECT ID_OLTP_PRODUCTO'+coCRLF+
          '                FROM CR_COINCRE_SAP'+coCRLF+
          '                WHERE ID_REPORTE = 32 -- INTERÉS COBRADO POR ANTICIPADO'+coCRLF+
          '                GROUP BY ID_OLTP_PRODUCTO'+coCRLF+
          '              ) CCS,'+coCRLF+
}
          //RABA JUL 2015 B-6
{          '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO '+coCRLF+
          '           FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
          '                  CR_CONT_CVES_GUIA CCCG '+coCRLF+
          '           WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
          '           AND    CCCG.CVE_CUENTA = ''INCOAN'' '+coCRLF+
          '           AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
          '       ) CCS,'+coCRLF+
}          //FIN RABA
          '       ( SELECT DISTINCT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO '+coCRLF+
          '         FROM CR_CONT_GRUPO_PROD GP, '+coCRLF+
          '              CR_CONT_CTA_GUIA CCCG, '+coCRLF+
          '              CR_CONT_BIT_CAT BI '+coCRLF+
          '         WHERE GP.CVE_GRUPO     = CCCG.CVE_GRUPO '+coCRLF+
          '           AND GP.CVE_PROCESO   = BI.CVE_PROCESO '+coCRLF+
          '           AND GP.ID_BIT_CAT    = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_PROCESO = BI.CVE_PROCESO '+coCRLF+
          '           AND CCCG.ID_BIT_CAT  = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_CUENTA = ''INCOAN'' '+coCRLF+
          '           AND CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
          '           AND ' + vlFechaD + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
          '        ) CCS, '+coCRLF+
          //FIN RABA
          '              DM_CR_FAC_CREDITO@DWHC DCFC,'+coCRLF+
          '              DM_CR_DIM_CREDITO@DWHC DCDC'+coCRLF+
          '         WHERE DCFC.ID_ANIO_MES = DCDM.ID_ANIO_MES'+coCRLF+
          '           AND DCDC.ID_CREDITO = DCFC.ID_CREDITO'+coCRLF+
          '           AND DCDC.ID_OLTP_PRODUCTO = CCS.ID_OLTP_PRODUCTO'+coCRLF+
          '           AND DCDC.ORIGEN_INFO NOT IN (''INTERCREDITOS'',''OI_INT'')'+coCRLF+   // RABA ENE 2013 SIN INFO DE INTERCREDITOS
          '       ) COINCRE,'+coCRLF+
          {'       ( SELECT ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
          '         FROM CR_COINCRE_SAP'+coCRLF+
          '         WHERE ID_REPORTE = 32 -- INTERÉS COBRADO POR ANTICIPADO'+coCRLF+
          '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA'+coCRLF+
          '       ) METRICA,'+coCRLF+ }
          //HERJA - CAMBIO EN LA METRICA
{          '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
          '           FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
          '                  CR_CONT_CVES_GUIA CCCG '+coCRLF+
          '           WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
          '           AND    CCCG.CVE_CUENTA = ''INCOAN'' '+coCRLF+
          '           AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
          '       ) METRICA, '+coCRLF+
}          //FIN HERJA
          '       ( SELECT DISTINCT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
          '         FROM CR_CONT_GRUPO_PROD GP, '+coCRLF+
          '              CR_CONT_CTA_GUIA CCCG, '+coCRLF+
          '              CR_CONT_BIT_CAT BI '+coCRLF+
          '         WHERE GP.CVE_GRUPO     = CCCG.CVE_GRUPO '+coCRLF+
          '           AND GP.CVE_PROCESO   = BI.CVE_PROCESO '+coCRLF+
          '           AND GP.ID_BIT_CAT    = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_PROCESO = BI.CVE_PROCESO '+coCRLF+
          '           AND CCCG.ID_BIT_CAT  = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_CUENTA = ''INCOAN'' '+coCRLF+
          '           AND CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
          '           AND ' + vlFechaD + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
          '        ) METRICA, '+coCRLF+
// RABA JUL 2015 ACTUALIZACIÓN B-6 SE ELIMINA AUTO-DBLINK
//          '       SECTOR@CORP S'+coCRLF+
          '       SECTOR S'+coCRLF+
//FIN RABA
          ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= COINCRE.ID_OLTP_PRODUCTO'+coCRLF+
          //'   AND METRICA.CVE_SECTOR (+)= COINCRE.CVE_OLTP_SECTOR'+coCRLF+
          //'   AND METRICA.CVE_MONEDA (+)= COINCRE.ID_OLTP_MONEDA'+coCRLF+
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
          '        COINCRE.PRODUCTO AS NOMBRE_PROD, COINCRE.CVE_OLTP_SECTOR AS CVE_SECTOR, S.DESC_SECTOR, TO_CHAR(METRICA.ID_METRICA) ID_METRICA, '+coCRLF+
          '        ''SIN RESTRICCION'' AS CVE_TIPO_CTA '+coCRLF+                //RABA JUL 2015 FALTA ESTA COLUMNA
          ' FROM  ( SELECT DCFC.IMP_SDO_IO_IMP AS IMP_INT_IMP,'+coCRLF+
          '                DCDC.ID_OLTP_PRODUCTO,'+coCRLF+
          '                DCDC.PRODUCTO,'+coCRLF+
          '                DCDC.ID_OLTP_MONEDA,'+coCRLF+
          '                DCDC.CVE_OLTP_SECTOR'+coCRLF+
          '         FROM ( SELECT ID_ANIO_MES FROM DM_CR_DIM_MES@DWHC DCDM'+coCRLF+
          '                WHERE DCDM.ANIO = '+vlStrGJAHR+' AND DCDM.NUM_MES = '+vlStrMONAT+coCRLF+
          '              ) DCDM,'+coCRLF+
          //RABA SEP 2012 - CAMBIO EN LA METRICA
{          '              ( SELECT ID_OLTP_PRODUCTO'+coCRLF+
          '                FROM CR_COINCRE_SAP'+coCRLF+
          '                WHERE ID_REPORTE = 9 -- INTERÉS IMPAGADO'+coCRLF+
          '                GROUP BY ID_OLTP_PRODUCTO'+coCRLF+
          '              ) CCS,'+coCRLF+
}
          //RABA JUL 2015 B-6
{         '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO '+coCRLF+
          '           FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
          '                  CR_CONT_CVES_GUIA CCCG '+coCRLF+
          '           WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
          '           AND    CCCG.CVE_CUENTA = ''IDCPVE'' '+coCRLF+
          '           AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION--------------------OJO
          '       ) CCS,'+coCRLF+
}         //FIN RABA
          '       ( SELECT DISTINCT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO '+coCRLF+
          '         FROM CR_CONT_GRUPO_PROD GP, '+coCRLF+
          '              CR_CONT_CTA_GUIA CCCG, '+coCRLF+
          '              CR_CONT_BIT_CAT BI '+coCRLF+
          '         WHERE GP.CVE_GRUPO     = CCCG.CVE_GRUPO '+coCRLF+
          '           AND GP.CVE_PROCESO   = BI.CVE_PROCESO '+coCRLF+
          '           AND GP.ID_BIT_CAT    = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_PROCESO = BI.CVE_PROCESO '+coCRLF+
          '           AND CCCG.ID_BIT_CAT  = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_CUENTA = ''IDCPVE'' '+coCRLF+
          '           AND CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
          '           AND ' + vlFechaD + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
          '        ) CCS, '+coCRLF+
          //FIN RABA
          '              DM_CR_FAC_CREDITO@DWHC DCFC,'+coCRLF+
          '              DM_CR_DIM_CREDITO@DWHC DCDC'+coCRLF+
          '         WHERE DCFC.ID_ANIO_MES = DCDM.ID_ANIO_MES'+coCRLF+
          '           AND DCDC.ID_CREDITO = DCFC.ID_CREDITO'+coCRLF+
          '           AND DCDC.ID_OLTP_PRODUCTO = CCS.ID_OLTP_PRODUCTO'+coCRLF+
          '       ) COINCRE,'+coCRLF+
          {'       ( SELECT ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
          '         FROM CR_COINCRE_SAP'+coCRLF+
          '         WHERE ID_REPORTE = 9 -- INTERÉS IMPAGADO'+coCRLF+
          '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA'+coCRLF+
          '       ) METRICA,'+coCRLF+}
          //HERJA - CAMBIO EN LA METRICA
{         '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
          '           FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
          '                  CR_CONT_CVES_GUIA CCCG '+coCRLF+
          '           WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
          '           AND    CCCG.CVE_CUENTA = ''IDCPVE'' '+coCRLF+
          '           AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
          '       ) METRICA, '+coCRLF+
}         //FIN HERJA
          '       ( SELECT DISTINCT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
          '         FROM CR_CONT_GRUPO_PROD GP, '+coCRLF+
          '              CR_CONT_CTA_GUIA CCCG, '+coCRLF+
          '              CR_CONT_BIT_CAT BI '+coCRLF+
          '         WHERE GP.CVE_GRUPO     = CCCG.CVE_GRUPO '+coCRLF+
          '           AND GP.CVE_PROCESO   = BI.CVE_PROCESO '+coCRLF+
          '           AND GP.ID_BIT_CAT    = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_PROCESO = BI.CVE_PROCESO '+coCRLF+
          '           AND CCCG.ID_BIT_CAT  = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_CUENTA = ''IDCPVE'' '+coCRLF+
          '           AND CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
          '           AND ' + vlFechaD + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
          '        ) METRICA, '+coCRLF+
          //FIN HERJA
// RABA JUL 2015 ACTUALIZACIÓN B-6 SE ELIMINA AUTO-DBLINK
//          '       SECTOR@CORP S'+coCRLF+
          '       SECTOR S'+coCRLF+
//FIN RABA
          ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= COINCRE.ID_OLTP_PRODUCTO'+coCRLF+
          //'   AND METRICA.CVE_SECTOR (+)= COINCRE.CVE_OLTP_SECTOR'+coCRLF+
          //'   AND METRICA.CVE_MONEDA (+)= COINCRE.ID_OLTP_MONEDA'+coCRLF+
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
          '        COINCRE.PRODUCTO AS NOMBRE_PROD, COINCRE.CVE_OLTP_SECTOR AS CVE_SECTOR, S.DESC_SECTOR, TO_CHAR(METRICA.ID_METRICA) ID_METRICA, '+coCRLF+
          '        ''SIN RESTRICCION'' AS CVE_TIPO_CTA '+coCRLF+                //RABA JUL 2015 FALTA ESTA COLUMNA
          ' FROM  ( SELECT DCFC.IMP_INT_DEV_VDO AS IMP_INT_DEV_VDO,'+coCRLF+
          '                DCDC.ID_OLTP_PRODUCTO,'+coCRLF+
          '                DCDC.PRODUCTO,'+coCRLF+
          '                DCDC.ID_OLTP_MONEDA,'+coCRLF+
          '                DCDC.CVE_OLTP_SECTOR'+coCRLF+
          '         FROM ( SELECT ID_ANIO_MES FROM DM_CR_DIM_MES@DWHC DCDM'+coCRLF+
          '                WHERE DCDM.ANIO = '+vlStrGJAHR+' AND DCDM.NUM_MES = '+vlStrMONAT+coCRLF+
          '              ) DCDM,'+coCRLF+
          //RABA SEP 2012 - CAMBIO EN LA METRICA
{          '              ( SELECT ID_OLTP_PRODUCTO'+coCRLF+
          '                FROM CR_COINCRE_SAP'+coCRLF+
          '                WHERE ID_REPORTE = 31 -- INTERÉS VENCIDO'+coCRLF+
          '                GROUP BY ID_OLTP_PRODUCTO'+coCRLF+
          '              ) CCS,'+coCRLF+
}
          //RABA JUL 2015 B-6
{          '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO '+coCRLF+
          '           FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
          '                  CR_CONT_CVES_GUIA CCCG '+coCRLF+
          '           WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
          '           AND    CCCG.CVE_CUENTA = ''INVE'' '+coCRLF+
          '           AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
          '       ) CCS,'+coCRLF+
}          //FIN RABA
          '       ( SELECT DISTINCT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO '+coCRLF+
          '         FROM CR_CONT_GRUPO_PROD GP, '+coCRLF+
          '              CR_CONT_CTA_GUIA CCCG, '+coCRLF+
          '              CR_CONT_BIT_CAT BI '+coCRLF+
          '         WHERE GP.CVE_GRUPO     = CCCG.CVE_GRUPO '+coCRLF+
          '           AND GP.CVE_PROCESO   = BI.CVE_PROCESO '+coCRLF+
          '           AND GP.ID_BIT_CAT    = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_PROCESO = BI.CVE_PROCESO '+coCRLF+
          '           AND CCCG.ID_BIT_CAT  = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_CUENTA = ''INVE'' '+coCRLF+
          '           AND CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
          '           AND ' + vlFechaD + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
          '        ) CCS, '+coCRLF+
          //FIN RABA
          '              DM_CR_FAC_CREDITO@DWHC DCFC,'+coCRLF+
          '              DM_CR_DIM_CREDITO@DWHC DCDC'+coCRLF+
          '         WHERE DCFC.ID_ANIO_MES = DCDM.ID_ANIO_MES'+coCRLF+
          '           AND DCDC.ID_CREDITO = DCFC.ID_CREDITO'+coCRLF+
          '           AND DCDC.ID_OLTP_PRODUCTO = CCS.ID_OLTP_PRODUCTO'+coCRLF+
          '       ) COINCRE,'+coCRLF+
          {'       ( SELECT ID_OLTP_PRODUCTO, CVE_SECTOR, ID_METRICA,CVE_MONEDA'+coCRLF+
          '         FROM CR_COINCRE_SAP'+coCRLF+
          '         WHERE ID_REPORTE = 31 -- INTERÉS VENCIDO'+coCRLF+
          '         GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA'+coCRLF+
          '       ) METRICA,'+coCRLF+}
          //HERJA - CAMBIO EN LA METRICA
{          '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
          '           FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
          '                  CR_CONT_CVES_GUIA CCCG '+coCRLF+
          '           WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
          '           AND    CCCG.CVE_CUENTA = ''INVE'' '+coCRLF+
          '           AND    CCCG.CVE_TIPO_CTA = ''SR'''+coCRLF+   // RABA ENE 2013 CREDITOS SIN RESTRICCION
          '       ) METRICA, '+coCRLF+
}          //FIN HERJA
          '       ( SELECT DISTINCT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
          '         FROM CR_CONT_GRUPO_PROD GP, '+coCRLF+
          '              CR_CONT_CTA_GUIA CCCG, '+coCRLF+
          '              CR_CONT_BIT_CAT BI '+coCRLF+
          '         WHERE GP.CVE_GRUPO     = CCCG.CVE_GRUPO '+coCRLF+
          '           AND GP.CVE_PROCESO   = BI.CVE_PROCESO '+coCRLF+
          '           AND GP.ID_BIT_CAT    = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_PROCESO = BI.CVE_PROCESO '+coCRLF+
          '           AND CCCG.ID_BIT_CAT  = BI.ID_BIT_CAT '+coCRLF+
          '           AND CCCG.CVE_CUENTA = ''INVE'' '+coCRLF+
          '           AND CCCG.CVE_TIPO_CTA = ''SR'' '+coCRLF+
          '           AND ' + vlFechaD + ' BETWEEN BI.F_INICIO AND BI.F_FINAL '+coCRLF+
          '        ) METRICA, '+coCRLF+
          //FIN HERJA
// RABA JUL 2015 ACTUALIZACIÓN B-6 SE ELIMINA AUTO-DBLINK
//          '       SECTOR@CORP S'+coCRLF+
          '       SECTOR S'+coCRLF+
//FIN RABA
          ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= COINCRE.ID_OLTP_PRODUCTO'+coCRLF+
          //'   AND METRICA.CVE_SECTOR (+)= COINCRE.CVE_OLTP_SECTOR'+coCRLF+
          //'   AND METRICA.CVE_MONEDA (+)= COINCRE.ID_OLTP_MONEDA'+coCRLF+
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
                                                        True, // -- Incluye intereses cobrados x anticipados
                                                        peFechaEspecifica);

      VlSalida :=  VlSalida +
        //GRUPOS
         '  ) A'+ coCRLF;    //HERJA QUITAR LA 'A'

        VlSalida :=  VlSalida + 'ORDER BY MONEDA, TIPO_CUENTA, SEGMENTO, ID_METRICA, CVE_SECTOR, ORIGEN, CVE_CTA_CONTABLE'+coCRLF;

        //HERJA - QUITAR POSTERIORMENTE
        VlSalida :=  VlSalida +
                    ') WHERE 1=1 '+coCRLF+
                    '  AND ID_PA NOT IN ( '+coCRLF+
                    '  ''PESO MEXICANO SAP CAPITAL IMPAGADO 32 1606010101'', '+coCRLF+
                    '  ''PESO MEXICANO SAP CAPITAL IMPAGADO 32 1606020101'', '+coCRLF+
                    '  ''PESO MEXICANO SAP CAPITAL VENCIDO 32 16010101'', '+coCRLF+
                    '  ''PESO MEXICANO SAP CAPITAL VENCIDO 32 16020101'', '+coCRLF+
                    '  ''PESO MEXICANO SAP INTERES IMPAGADO 32 5208090101'', '+coCRLF+
                    '  ''PESO MEXICANO SAP INTERES VENCIDO 32 5208090101'', '+coCRLF+
                    '  ''PESO MEXICANO SAP INTERES VIGENTE 32 5208090101'' '+coCRLF+
                    ') '+coCRLF;
        //FIN HERJA


     END;
     Result := VlSalida;
end;

procedure TQrCompCOINCREDetalleN.qrDetalleBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
     PrintBand := (qCompCOINSDO_COINCRE.AsCurrency + qCompCOINSDO_FIN_PER.AsCurrency)<> 0;
     if vgBPintaTotalProd = False then
        vgBPintaTotalProd := (qCompCOINSDO_COINCRE.AsCurrency + qCompCOINSDO_FIN_PER.AsCurrency)<> 0;
     //end if;
end;

procedure TQrCompCOINCREDetalleN.qrGrupoMetricaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     vgBPintaTotalProd := False;
end;

procedure TQrCompCOINCREDetalleN.qrPiedeGrupoMetricaBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
     if qCompCOINMONEDA.AsString = 'DOLAR AMERICANO' then
     begin
          QRTCVal.Caption := FormatFloat('##0.0000', vgTipoCambio);
          QRDifValorizada.Caption := FormatFloat('###,###,###,###,###,###,##0.00',QRExpr19.Value.dblResult * vgTipoCambio);
     end
     else
     begin
          QRTCVal.Caption := '';
          QRDifValorizada.Caption := '';
     end;
     PrintBand := vgBPintaTotalProd;
end;

procedure TQrCompCOINCREDetalleN.IniciaArchivoExcel(peFileName : String);
const aColumnWidth : Array[1..19] of Double = ( 2.14,  2.14, 6.86, 7.29, 5.00,  10.43, 49.43,
                                               16.00,  16.00, 16.00, 11.43, 14.43, 14.14,  8.43,
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

   If Assigned(vgStrList1) Then vgStrList1.Clear
   Else vgStrList1 := TStringList.Create;

   // Coloca los títulos de las columnas
   vgNumRow := 1;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('D') ].Value := 'PRODUCTO - SUBTIPO ';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('G') ].Value := 'CUENTA CONTABLE';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].Value := 'SALDO CONSOLIDADO';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].Value := 'SALDO CONTABLE SAP';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('J') ].Value := 'DIFERENCIAS';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := 'TIPO DE CAMBIO';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := ' USD VALORIZADOS';


   //Le da formato al renglón de Titulos
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)].Font.Color := clWhite;
   vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['A'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)];
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

function TQrCompCOINCREDetalleN.Cierra_Y_Guarda_ArchivoExcel : Boolean;
begin
  Result := False;
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Then Exit;
  //
    If (Not vgbUtilizaArchivoConcil) Then
      vgExcelApp.ActiveWorkBook.SaveAs(vgArchivoExcel);

  vgStrList.Clear;
  vgStrList.Free;
  
  vgStrList1.Clear;
  vgStrList1.Free;

  Result := CloseExcelFile(vgExcelApp);
end;

procedure TQrCompCOINCREDetalleN.AgregaSaldosArchivoExcel(peCVE_SECTOR,
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
      vgExcelApp.Range['H'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)].Font.Bold := True;
      vgExcelApp.Cells[ vgNumRow , ColumnXlS('C') ].Value := 'SECTOR:';
      vgExcelApp.Cells[ vgNumRow , ColumnXlS('D') ].Value := peCVE_SECTOR;
      vgExcelApp.Cells[ vgNumRow , ColumnXlS('E') ].Value := peDESC_SECTOR;

      if qCompCOINCVE_SECTOR.AsInteger = 99 then
      begin
      vgExcelApp.Cells[ vgNumRow , ColumnXlS('C') ].Font.Color := clWhite;
      vgExcelApp.Cells[ vgNumRow , ColumnXlS('D') ].Font.Color := clWhite;
      vgExcelApp.Cells[ vgNumRow , ColumnXlS('E') ].Font.Color := clWhite;
      end;

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

            if qCompCOINMONEDA.AsString = 'DOLAR AMERICANO' then
            begin
            {vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := FormatFloat('##0.0000', vgTipoCambio);
            vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].NumberFormat := '#,##0.00000';

            vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := FormatFloat('###,###,###,###,###,###,##0.00',QRExpr19.Value.dblResult * vgTipoCambio);
            vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].NumberFormat := '#,##0.0000';   }
            end
            else
            begin
            vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := '';
            vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := '';
            end;

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


            if qCompCOINMONEDA.AsString = 'DOLAR AMERICANO' then
            begin
            {vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := FormatFloat('##0.0000', vgTipoCambio);
            vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].NumberFormat := '#,##0.0000';

            vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := FormatFloat('###,###,###,###,###,###,##0.00',QRExpr19.Value.dblResult * vgTipoCambio);
            vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].NumberFormat := '#,##0.0000';    }
            end
            else
            begin
            vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := '';
            vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := '';
            end;

            End;
     End;
end;

procedure TQrCompCOINCREDetalleN.ColocaFormulas;
var vlRange : Variant;
begin
   // Valida si se genera o no el Archivo de Excel
   If (Not vgBGeneraArchivo) Then Exit;
   //
   Inc(vgNumRow);
   // Coloca Linea
   vgExcelApp.Cells[vgNumRow,ColumnXlS('C') ].Value := ' ';
//   vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['C'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)];
//   vlRange.Columns.Interior.ColorIndex := 1;
   // Coloca Alto de Renglón
   vgExcelApp.Rows[vgNumRow].RowHeight := 0.75;
   Inc(vgNumRow);

   // Coloca Formúlas
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].Value := '=SUM(H'+IntToStr(vgNumRowIniciaSector+2)+':H'+IntToStr(vgNumRow-1)+')';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].Value := '=SUM(I'+IntToStr(vgNumRowIniciaSector+2)+':I'+IntToStr(vgNumRow-1)+')';
//   vgExcelApp.Cells[ vgNumRow , ColumnXlS('J') ].Value := '=H'+IntToStr(vgNumRow)+'-I'+IntToStr(vgNumRow);  JFOF
//   vgExcelApp.Cells[ vgNumRow , ColumnXlS('N') ].Value := '=SUM(H'+IntToStr(vgNumRowIniciaSector+2)+':H'+IntToStr(vgNumRow-1)+')';
//   vgExcelApp.Cells[ vgNumRow , ColumnXlS('P') ].Value := '=SUM(I'+IntToStr(vgNumRowIniciaSector+2)+':I'+IntToStr(vgNumRow-1)+')';  JFOF

//   vgExcelApp.Cells[ vgNumRow , ColumnXlS('F') ].Value := 'Total por Sector = '+qCompCOIN.FieldByName('CVE_SECTOR').AsString;
   if qCompCOINCVE_SECTOR.AsInteger = 99 then
   begin
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('F') ].Value := 'Total por Sector = '
   end
   else begin
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('F') ].Value := 'Total por Sector = '+qCompCOIN.FieldByName('CVE_SECTOR').AsString;
   end;

//   vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := '=SUM(L'+IntToStr(vgNumRowIniciaSector+2)+':L'+IntToStr(vgNumRow-1)+')'; JFOF


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

   vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].NumberFormat := '#,##0.00';
   vgStrList1.Add(IntToStr(vgNumRow));
   vgStrList.Add(IntToStr(vgNumRow));

   if qCompCOINCVE_SECTOR.AsInteger = 99 then
   Inc(vgNumRow);
  
end;


procedure TQrCompCOINCREDetalleN.QRTipoRestAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
   // Valida si se genera o no el Archivo de Excel
   If (Not vgBGeneraArchivo) Then Exit;
   //
   Inc(vgNumRow);
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('C') ].Value := qCompCOIN.FieldByName('CVE_TIPO_CTA').AsString;
end;



procedure TQrCompCOINCREDetalleN.Z(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   // Valida si se genera o no el Archivo de Excel
   If (Not vgBGeneraArchivo) Then Exit;
   //
   Inc(vgNumRow);
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := 'MONEDA:';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('D') ].Value := qCompCOIN.FieldByName('MONEDA').AsString;
end;

procedure TQrCompCOINCREDetalleN.qrGrupoTipoCuentaAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var vlRange : Variant;
begin
  If Assigned(vgStrList) Then
     vgStrList.Clear;
   // Valida si se genera o no el Archivo de Excel
   If (Not vgBGeneraArchivo) Then Exit;
   //
   vgsdoconsol := 0;
   vgsdocontsap := 0;

   Inc(vgNumRow);
   vlRange := vgExcelApp.Range['B'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)];
   vlRange.Font.Bold := True;
   vlRange.Font.Color := clWhite;
   vlRange.Columns.Interior.ColorIndex := 1; // Negro

   vgExcelApp.Cells[ vgNumRow , ColumnXlS('B') ].Value := 'TIPO DE CUENTA:';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('E') ].Value := qCompCOIN.FieldByName('TIPO_CUENTA').AsString;
end;

procedure TQrCompCOINCREDetalleN.qrGrupoSectorAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var vlvalidasec, vlvalidasecant : String;
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

  {if (qCompCOINCVE_SECTOR.AsInteger = 99) then
    begin
    If Assigned(vgStrList1) Then
       vgStrList1.Clear;
    end;    }
end;

procedure TQrCompCOINCREDetalleN.qrDetalleAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Then Exit;
  //
  AgregaSaldosArchivoExcel('',                           // peCVE_SECTOR
                           '',                           // peDESC_SECTOR
                           qCompCOIN.FieldByName('CVE_CTA_CONTABLE').AsString, // peID_OLTP_PRODUCTO_or_peCVE_CTA_CONTABLE
                           qCompCOIN.FieldByName('NOMBRE_PROD').AsString,      // peDESC_OLTP_PRODUCTO
                           qCompCOIN.FieldByName('SDO_COINCRE').AsFloat,       // peIMP_SDO_COINCRE
                           qCompCOIN.FieldByName('SDO_FIN_PER').AsFloat        // peIMP_SDO_CONTABLE
                           );
end;

procedure TQrCompCOINCREDetalleN.qrPiedeGrupoSectorAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Then Exit;
  //
  ColocaFormulas;
end;

procedure TQrCompCOINCREDetalleN.qrPiedeGrupoMetricaAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var vlRange : Variant;
    I : Integer;
    vlstrFormula1, vlstrFormula2, vlstrFormula3, vlstrFormula4, vlstrPlus : String;

begin
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Or (Not vgBPintaTotalProd) Then Exit;

  // Coloca Linea
  vgExcelApp.Cells[vgNumRow,ColumnXlS('B') ].Value := ' ';
  vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['C'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)];
  vlRange.Columns.Interior.ColorIndex := 1;
  vgExcelApp.Rows[vgNumRow].RowHeight := 0.75;
  // Coloca Formúlas de SUMATORIAS
  vlstrPlus := ''; vlstrFormula1 := ''; vlstrFormula2 := ''; vlstrFormula3 := '';
  For I := 0 To vgStrList1.Count-1 Do
    Begin
    vlstrFormula1 := vlstrFormula1 + vlstrPlus + 'H' + vgStrList1[I];
    vlstrFormula2 := vlstrFormula2 + vlstrPlus + 'I' + vgStrList1[I];
    vlstrFormula3 := vlstrFormula3 + vlstrPlus + 'L' + vgStrList1[I];
    vlstrFormula4 := vlstrFormula4 + vlstrPlus + 'J' + vgStrList1[I];
    vlstrPlus := '+';
    End;
  Inc(vgNumRow);
//  Inc(vgNumRow);
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('F') ].Value := 'TOTAL';
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].Value := '='+vlstrFormula1;
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].Value := '='+vlstrFormula2;
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('J') ].Value := '=H'+IntToStr(vgNumRow)+'-I'+IntToStr(vgNumRow);

 if qCompCOINMONEDA.AsString = 'DOLAR AMERICANO' then
 begin
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := vgtipocambio;
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := '=J'+IntToStr(vgNumRow)+'*K'+IntToStr(vgNumRow);
 end
 else begin
 vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := ' ';
 vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := ' ';
 end;

  vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].NumberFormat := '#,##0.0000';
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].NumberFormat := '#,##0.00';

  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)].Font.Bold := True;

  Inc(vgNumRow);
  vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['C'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)];
  vlRange.Columns.Interior.ColorIndex := 1;
  vgExcelApp.Rows[vgNumRow].RowHeight := 0.75;
  Inc(vgNumRow);

 If Assigned(vgStrList1) Then
     vgStrList1.Clear;

end;

procedure TQrCompCOINCREDetalleN.qrGrupoSegmentoAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var vlRange : Variant;
begin
  If Assigned(vgStrList) Then
     vgStrList.Clear;

  {If Assigned(vgStrList1) Then
     vgStrList1.Clear; }
   // Valida si se genera o no el Archivo de Excel
   If (Not vgBGeneraArchivo) Then Exit;
   //
   Inc(vgNumRow);
   vlRange := vgExcelApp.Range['C'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)];
   vlRange.Font.Bold := True;
   vlRange.Font.Color := clWhite;
   vlRange.Columns.Interior.ColorIndex := 16; // Gris Oscuro

//   vgExcelApp.Cells[ vgNumRow , ColumnXlS('C') ].Value := qrlblSegmento.Caption;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('E') ].Value := '(' + qCompCOIN.FieldByName('TIPO_CUENTA').AsString + ')  '+
                                                          qCompCOIN.FieldByName('SEGMENTO').AsString + ')';
end;

procedure TQrCompCOINCREDetalleN.qrPiedeGrupoSegmentoAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var I : Integer;
    vlstrFormula1, vlstrFormula2, vlstrFormula3, vlstrFormula4, vlstrPlus : String;
    vlRange : Variant;  
begin
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Then Exit;

//  If Assigned(vgStrList) Then   //elimina
//     vgStrList.Clear;

// Coloca Alto de Renglón
//  vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['B'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)];
//  vlRange.Columns.Interior.ColorIndex := 1;
//  vgExcelApp.Rows[vgNumRow].RowHeight := 0.75;
  // Coloca Formúlas de SUMATORIAS
  vlstrPlus := ''; vlstrFormula1 := ''; vlstrFormula2 := ''; vlstrFormula3 := '';
  For I := 0 To vgStrList.Count-1 Do
    Begin
    vlstrFormula1 := vlstrFormula1 + vlstrPlus + 'H' + vgStrList[I];
    vlstrFormula2 := vlstrFormula2 + vlstrPlus + 'I' + vgStrList[I];
    vlstrFormula3 := vlstrFormula3 + vlstrPlus + 'L' + vgStrList[I];
    vlstrFormula4 := vlstrFormula4 + vlstrPlus + 'J' + vgStrList[I];
    vlstrPlus := '+';
    End;
  Inc(vgNumRow);
  Inc(vgNumRow);
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('F') ].Value := 'TOTAL SEGMENTO:';
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].Value := '='+vlstrFormula1;
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].Value := '='+vlstrFormula2;
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('J') ].Value := '=H'+IntToStr(vgNumRow)+'-I'+IntToStr(vgNumRow);
//  vgExcelApp.Cells[ vgNumRow , ColumnXlS('C') ].Value := 'VARIACIÓN:  '+ QRExpr7.Value.strResult;

 if qCompCOINMONEDA.AsString = 'DOLAR AMERICANO' then
 begin
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := vgtipocambio;
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := '=J'+IntToStr(vgNumRow)+'*K'+IntToStr(vgNumRow);
 end
 else begin
 vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := ' ';
 vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := ' ';
 end;

  vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].NumberFormat := '#,##0.0000';
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].NumberFormat := '#,##0.00';


  vgsdoconsol := vgsdoconsol + vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].Value;
  vgsdocontsap := vgsdocontsap + vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].Value;

  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)].Font.Bold := True;
  Inc(vgNumRow);
end;

procedure TQrCompCOINCREDetalleN.qrGrupoSectorBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
    if  qCompCOINCVE_SECTOR.AsInteger = 99 then
        qrGrupoSector.Enabled := False
    else
        qrGrupoSector.Enabled := True;

end;

procedure TQrCompCOINCREDetalleN.qrPiedeGrupoSectorBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
    if  qCompCOINCVE_SECTOR.AsInteger = 99 then
    begin
         QRTSec.Caption := ' ';
    end
    else
    begin
         QRTSec.Caption := qCompCOINCVE_SECTOR.AsString;
    end;
end;

procedure TQrCompCOINCREDetalleN.qrPiedeGrupoSegmentoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     if qCompCOINMONEDA.AsString = 'DOLAR AMERICANO' then
     begin
          QRLabel11.Caption := FormatFloat('##0.0000', vgTipoCambio);
          QRLabel12.Caption := FormatFloat('###,###,###,###,###,###,##0.00',QRExpr6.Value.dblResult * vgTipoCambio);
     end
     else
     begin
          QRLabel11.Caption := '';
          QRLabel12.Caption := '';
     end;
end;

procedure TQrCompCOINCREDetalleN.qrPiedeGrupoCuentaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     if qCompCOINMONEDA.AsString = 'DOLAR AMERICANO' then
     begin
          QRLabel18.Caption := FormatFloat('##0.0000', vgTipoCambio);
          QRLabel19.Caption := FormatFloat('###,###,###,###,###,###,##0.00',QRExpr13.Value.dblResult * vgTipoCambio);
     end
     else
     begin
          QRLabel18.Caption := '';
          QRLabel19.Caption := '';
     end;
end;

procedure TQrCompCOINCREDetalleN.qrPiedeGrupoMonedaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     if qCompCOINMONEDA.AsString = 'DOLAR AMERICANO' then
     begin
          QRLabel20.Caption := FormatFloat('##0.0000', vgTipoCambio);
          QRLabel21.Caption := FormatFloat('###,###,###,###,###,###,##0.00',QRExpr17.Value.dblResult * vgTipoCambio);
     end
     else
     begin
          QRLabel20.Caption := '';
          QRLabel21.Caption := '';
     end;
end;


procedure TQrCompCOINCREDetalleN.qrPiedeGrupoMonedaAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var I : Integer;
    vlstrFormula1, vlstrFormula2, vlstrFormula3, vlstrFormula4, vlstrPlus : String;
    vlRange : Variant;  
begin
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Then Exit;
  // Coloca Alto de Renglón
//  vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['B'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)];
//  vlRange.Columns.Interior.ColorIndex := 1;
  vgExcelApp.Rows[vgNumRow].RowHeight := 0.75;
  // Coloca Formúlas de SUMATORIAS
  vlstrPlus := ''; vlstrFormula1 := ''; vlstrFormula2 := ''; vlstrFormula3 := '';
  For I := 0 To vgStrList.Count-1 Do
    Begin
    vlstrFormula1 := vlstrFormula1 + vlstrPlus + 'H' + vgStrList[I];
    vlstrFormula2 := vlstrFormula2 + vlstrPlus + 'I' + vgStrList[I];
    vlstrFormula3 := vlstrFormula3 + vlstrPlus + 'L' + vgStrList[I];
    vlstrFormula4 := vlstrFormula4 + vlstrPlus + 'J' + vgStrList[I];
    vlstrPlus := '+';
    End;
  Inc(vgNumRow);
//  Inc(vgNumRow);
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('F') ].Value := 'TOTAL MONEDA: '+ qCompCOIN.FieldByName('MONEDA').AsString;
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].Value := vgsdoconsmone;
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].Value := vgsdocontsmon;
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('J') ].Value := '=H'+IntToStr(vgNumRow)+'-I'+IntToStr(vgNumRow);
//  vgExcelApp.Cells[ vgNumRow , ColumnXlS('C') ].Value := 'VARIACIÓN: '+ QRExpr18.Value.strResult;

 if qCompCOINMONEDA.AsString = 'DOLAR AMERICANO' then
 begin
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := vgtipocambio;
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := '=J'+IntToStr(vgNumRow)+'*K'+IntToStr(vgNumRow);
 end
 else begin
 vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := ' ';
 vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := ' ';
 end;

  vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].NumberFormat := '#,##0.0000';
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].NumberFormat := '#,##0.00';
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].NumberFormat := '#,##0.00';
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].NumberFormat := '#,##0.00';
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('J') ].NumberFormat := '#,##0.00';


  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)].Font.Bold := True;
  Inc(vgNumRow);
end;

procedure TQrCompCOINCREDetalleN.qrPiedeGrupoCuentaAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var I : Integer;
    vlstrFormula1, vlstrFormula2, vlstrFormula3, vlstrFormula4, vlstrPlus : String;
    vlRange : Variant;  
begin
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Then Exit;
  // Coloca Alto de Renglón
//  vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['B'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)];
//  vlRange.Columns.Interior.ColorIndex := 1;
  vgExcelApp.Rows[vgNumRow].RowHeight := 0.75;
  // Coloca Formúlas de SUMATORIAS
  vlstrPlus := ''; vlstrFormula1 := ''; vlstrFormula2 := ''; vlstrFormula3 := '';
  For I := 0 To vgStrList.Count-1 Do
    Begin
    vlstrFormula1 := vlstrFormula1 + vlstrPlus + 'H' + vgStrList[I];
    vlstrFormula2 := vlstrFormula2 + vlstrPlus + 'I' + vgStrList[I];
    vlstrFormula3 := vlstrFormula3 + vlstrPlus + 'L' + vgStrList[I];
    vlstrFormula4 := vlstrFormula4 + vlstrPlus + 'J' + vgStrList[I];
    vlstrPlus := '+';
    End;
  Inc(vgNumRow);
//  Inc(vgNumRow);
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('F') ].Value := 'TOTAL CUENTA: '+ qCompCOIN.FieldByName('TIPO_CUENTA').AsString;
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].Value := vgsdoconsol;
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].Value := vgsdocontsap;
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('J') ].Value := '=H'+IntToStr(vgNumRow)+'-I'+IntToStr(vgNumRow);
//  vgExcelApp.Cells[ vgNumRow , ColumnXlS('C') ].Value := 'VARIACIÓN:  '+ QRExpr14.Value.strResult;



 if qCompCOINMONEDA.AsString = 'DOLAR AMERICANO' then
 begin
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := vgtipocambio;
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := '=J'+IntToStr(vgNumRow)+'*K'+IntToStr(vgNumRow);
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].NumberFormat := '#,##0.0000';
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].NumberFormat := '#,##0.00';
 end
 else begin
 vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := ' ';
 vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := ' ';
 end;

  vgsdoconsmone := vgsdoconsmone + vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].Value;
  vgsdocontsmon := vgsdocontsmon + vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].Value;

//  vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].NumberFormat := '#,##0.0000';
//  vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].NumberFormat := '#,##0.00';
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].NumberFormat := '#,##0.00';
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].NumberFormat := '#,##0.00';
  vgExcelApp.Cells[ vgNumRow , ColumnXlS('J') ].NumberFormat := '#,##0.00';


  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)].Font.Bold := True;
  Inc(vgNumRow);
end;

procedure TQrCompCOINCREDetalleN.qrGrupoMonedaAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  If Assigned(vgStrList) Then
     vgStrList.Clear;

     vgsdoconsmone := 0;
     vgsdocontsmon := 0;
     // Valida si se genera o no el Archivo de Excel
     If (Not vgBGeneraArchivo) Then Exit;
     //
     Inc(vgNumRow);
     vgExcelApp.Range['A'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)].Font.Bold := True;
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := 'MONEDA:';
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('D') ].Value := qCompCOIN.FieldByName('MONEDA').AsString;
end;

end.
