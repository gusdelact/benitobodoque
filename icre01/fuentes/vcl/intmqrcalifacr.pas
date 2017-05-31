unit IntMQrCalifAcr;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre, UnSQL2, Dialogs, IntXls;

type
  TQrCalifAcr = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    qryQrCalifAcr: TQuery;
    SaveDialog: TSaveDialog;
    qryQrCalifAcrF_CALIFICACION: TDateTimeField;
    qryQrCalifAcrID_ACREDITADO: TFloatField;
    qryQrCalifAcrNOM_ACREDITADO: TStringField;
    qryQrCalifAcrNOM_CALIFICADORA1: TStringField;
    qryQrCalifAcrCVE_CALIFICACION1: TMemoField;
    qryQrCalifAcrNOM_CALIFICADORA2: TStringField;
    qryQrCalifAcrCVE_CALIFICACION2: TMemoField;
    qryQrCalifAcrNOM_CALIFICADORA3: TStringField;
    qryQrCalifAcrCVE_CALIFICACION3: TMemoField;
    qryQrCalifAcrNOM_CALIFICADORA4: TStringField;
    qryQrCalifAcrCVE_CALIFICACION4: TMemoField;
    qryQrCalifAcrNOM_CALIFICADORA5: TStringField;
    qryQrCalifAcrCVE_CALIFICACION5: TMemoField;
    qryQrCalifAcrNOM_CALIFICADORA6: TStringField;
    qryQrCalifAcrCVE_CALIFICACION6: TMemoField;
    qryQrCalifAcrCVE_CALIFICACION_SICC: TMemoField;
    qryQrCalifAcrNUM_PUNTOS_DIST: TFloatField;
    qryQrCalifAcrNUM_NIVEL: TFloatField;
    qrShpAdeudoTotal: TQRShape;
    qrlblID_ACREDITADO: TQRLabel;
    qrshpCalificadoras: TQRShape;
    qrlblCalificadoras: TQRLabel;
    qrShpNomCalificadora1: TQRShape;
    qrShpNomCalificadora2: TQRShape;
    qrShpNomCalificadora3: TQRShape;
    qrShpNomCalificadora4: TQRShape;
    qrshpNomCalificadora5: TQRShape;
    qrShpNomCalificadora6: TQRShape;
    qrdbNOM_CALIFICADORA1: TQRDBText;
    qrdbNOM_CALIFICADORA2: TQRDBText;
    qrdbNOM_CALIFICADORA3: TQRDBText;
    qrdbNOM_CALIFICADORA4: TQRDBText;
    qrdbNOM_CALIFICADORA5: TQRDBText;
    qrdbNOM_CALIFICADORA6: TQRDBText;
    QRShape1: TQRShape;
    qrlblNOM_ACREDITADO: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    qrDetail: TQRBand;
    qrGrpF_CALIFICACION: TQRGroup;
    qrFootF_CALIFICACION: TQRBand;
    qrlblF_CALIFICACION: TQRLabel;
    qrdbF_CALIFICACION: TQRDBText;
    qrshpF_CALIFICACION: TQRShape;
    qrdbID_ACREDITADO: TQRDBText;
    qrdbNOM_ACREDITADO: TQRDBText;
    qrdbCVE_CALIFICACION1: TQRDBText;
    qrdbCVE_CALIFICACION2: TQRDBText;
    qrdbCVE_CALIFICACION3: TQRDBText;
    qrdbCVE_CALIFICACION4: TQRDBText;
    qrdbCVE_CALIFICACION5: TQRDBText;
    qrdbCVE_CALIFICACION6: TQRDBText;
    qrdbNUM_PUNTOS_DIST: TQRDBText;
    qrdbNUM_NIVEL: TQRDBText;
  private
  
  public
    Function FormaQuery( peF_FINAL, peF_INICIAL : TDateTime;
                         peID_ACREDITADO, peID_CALIFICADORA, peID_EMPRESA : Integer;
                         peMUESTRA : String; peORDEN : String; peFECHA : TDateTime
                       ) : String;
  end;

var
  QrCalifAcr: TQrCalifAcr;

procedure RepCalifAcr( peF_FINAL, peF_INICIAL : TDateTime;
                       peID_ACREDITADO, peID_CALIFICADORA, peID_EMPRESA : Integer;
                       peMUESTRA : String; peORDEN : String; peFECHA : TDateTime;
                       pAPli    : TInterApli;
                       pPreview : Boolean;
                       peB_SAVE_QRY_TO_FILE : Boolean);
Implementation
{$R *.DFM}

procedure RepCalifAcr( peF_FINAL, peF_INICIAL : TDateTime;
                       peID_ACREDITADO, peID_CALIFICADORA, peID_EMPRESA : Integer;
                       peMUESTRA : String; peORDEN : String; peFECHA : TDateTime;
                       pAPli    : TInterApli;
                       pPreview : Boolean;
                       peB_SAVE_QRY_TO_FILE : Boolean);
Var
    QrCalifAcr : TQrCalifAcr;
    VLTitulo : String;
    Preview  : TIntQRPreview;
Begin
    VLTitulo := '';
    QrCalifAcr := TQrCalifAcr.Create(Nil);
    Preview  := TIntQRPreview.CreatePreview(Application, QrCalifAcr);
    If Assigned(QrCalifAcr) Then
     With QrCalifAcr Do
      Try
        QRInterEncabezado1.Apli:=pApli;
        QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QRInterEncabezado1.NomReporte:= 'IntMQrCalifAcr';
        QRInterEncabezado1.Titulo1 := 'Reporte de Calificación por Acreditado';
        QRInterEncabezado1.Titulo2 := 'Del'+FormatDateTime('DD/MM/YYYY',peF_INICIAL)+' al '+FormatDateTime('DD/MM/YYYY',peF_FINAL);

        qryQrCalifAcr.DatabaseName := pApli.DataBaseName;
        qryQrCalifAcr.SessionName  := pApli.SessionName;
        qryQrCalifAcr.Active   := False;
        qryQrCalifAcr.SQL.Text := FormaQuery(peF_FINAL, peF_INICIAL,
                                           peID_ACREDITADO, peID_CALIFICADORA, peID_EMPRESA,
                                           peMUESTRA, peORDEN, peFECHA);

        If (peB_SAVE_QRY_TO_FILE) Then
         If SaveDialog.Execute Then
          qryQrCalifAcr.SQL.SaveToFile(SaveDialog.FileName);

        qryQrCalifAcr.Open;

        If pPreview Then
            QrCalifAcr.Preview
        Else
            QrCalifAcr.Print;
      Finally
        qryQrCalifAcr.Close;
        QrCalifAcr.Free;
      End;
End;

Function TQrCalifAcr.FormaQuery( peF_FINAL, peF_INICIAL : TDateTime;
                                 peID_ACREDITADO, peID_CALIFICADORA, peID_EMPRESA : Integer;
                                 peMUESTRA : String; peORDEN : String; peFECHA : TDateTime
                               ) : String;
var
   vlF_FINAL,   vlF_INICIAL, vlID_ACREDITADO, vlID_CALIFICADORA,   vlID_EMPRESA,
   vlMUESTRA,   vlFECHA,     vlSQL : String;
Begin
  vlF_FINAL         := SQLFecha(peF_FINAL);
  vlF_INICIAL       := SQLFecha(peF_INICIAL);
  vlID_ACREDITADO   := IntToStr(peID_ACREDITADO);
  vlID_CALIFICADORA := IntToStr(peID_CALIFICADORA);
  vlID_EMPRESA      := IntToStr(peID_EMPRESA);
  If (peMUESTRA = CFALSO) Then  vlMUESTRA         := 'NULL'
  Else vlMUESTRA        := 'NOT NULL';
  vlFECHA           := SQLFecha(peFECHA);

  //vlSQL := ' SELECT R.*,'+coCRLF+
  // RUCJ424 ::
  // A PETICION DEL AREA DE CREDITO SE ELIMINA EL CAMPO CVE_CALIFICACION_SICC PARA QUE NO SE MUESTRE EN EL REPORTE
  //  SOLO Quito la referencia del campo TQrDbTex.DataField = CVE_CALIFICACION_SICC
  vlSQL := '' +
           ' select * from ( ' +   //RUCJ4248
           '	 SELECT row_number() over(partition by cve_calificacion1, cve_calificacion2, cve_calificacion3, ' +   //RUCJ4248
           '			cve_calificacion4, cve_calificacion5, cve_calificacion6 order by f_calificacion) as F_Pivote, ' +   //RUCJ4248
           ' R.*,'+coCRLF+   // RUCJ4248
           '        (SELECT NUM_PUNTOS_DIST FROM CR_CAL_CALIFICA WHERE ID_CALIFICADORA = 0'+coCRLF+
           '         AND CVE_CALIFICACION = R.CVE_CALIFICACION_SICC AND SIT_CAL_CALIFICA <> ''CA'')AS NUM_PUNTOS_DIST,'+coCRLF+
           '        (SELECT NUM_NIVEL FROM CR_CAL_CALIFICA WHERE ID_CALIFICADORA = 0'+coCRLF+
           '         AND CVE_CALIFICACION = R.CVE_CALIFICACION_SICC AND SIT_CAL_CALIFICA <> ''CA'')AS NUM_NIVEL'+coCRLF+
           ''+coCRLF+
           ' FROM ( SELECT TEMP.F_CALIFICACION,'+coCRLF+
           '                GYM.ID_ACREDITADO,'+coCRLF+
           '                GYM.NOM_ACREDITADO,'+coCRLF+
           '      CCAL.NOM_CALIFICADORA1,'+coCRLF+
           '      NVL2(CCAL.ID_CALIFICADORA1,'+coCRLF+
           '      PKGCRSICC.GET_ULTIMA_CALIF_ACRED(GYM.ID_ACREDITADO, CCAL.ID_CALIFICADORA1, ''RIESGO'','+coCRLF+
           '                TEMP.F_CALIFICACION),NULL) AS CVE_CALIFICACION1,'+coCRLF+
           '      CCAL.NOM_CALIFICADORA2,'+coCRLF+
           '      NVL2(CCAL.ID_CALIFICADORA2,'+coCRLF+
           '      PKGCRSICC.GET_ULTIMA_CALIF_ACRED(GYM.ID_ACREDITADO, CCAL.ID_CALIFICADORA2, ''RIESGO'','+coCRLF+
           '                TEMP.F_CALIFICACION),NULL) AS CVE_CALIFICACION2,'+coCRLF+
           '      CCAL.NOM_CALIFICADORA3,'+coCRLF+
           '      NVL2(CCAL.ID_CALIFICADORA3,'+coCRLF+
           '      PKGCRSICC.GET_ULTIMA_CALIF_ACRED(GYM.ID_ACREDITADO, CCAL.ID_CALIFICADORA3, ''RIESGO'','+coCRLF+
           '                TEMP.F_CALIFICACION),NULL) AS CVE_CALIFICACION3,'+coCRLF+
           '      CCAL.NOM_CALIFICADORA4,'+coCRLF+
           '      NVL2(CCAL.ID_CALIFICADORA4,'+coCRLF+
           '      PKGCRSICC.GET_ULTIMA_CALIF_ACRED(GYM.ID_ACREDITADO, CCAL.ID_CALIFICADORA4, ''RIESGO'','+coCRLF+
           '                TEMP.F_CALIFICACION),NULL) AS CVE_CALIFICACION4,'+coCRLF+
           '      CCAL.NOM_CALIFICADORA5,'+coCRLF+
           '      NVL2(CCAL.ID_CALIFICADORA5,'+coCRLF+
           '      PKGCRSICC.GET_ULTIMA_CALIF_ACRED(GYM.ID_ACREDITADO, CCAL.ID_CALIFICADORA5, ''RIESGO'','+coCRLF+
           '                TEMP.F_CALIFICACION),NULL) AS CVE_CALIFICACION5,'+coCRLF+
           '      CCAL.NOM_CALIFICADORA6,'+coCRLF+
           '      NVL2(CCAL.ID_CALIFICADORA6,'+coCRLF+
           '      PKGCRSICC.GET_ULTIMA_CALIF_ACRED(GYM.ID_ACREDITADO, CCAL.ID_CALIFICADORA6, ''RIESGO'','+coCRLF+
           '                TEMP.F_CALIFICACION),NULL) AS CVE_CALIFICACION6,'+coCRLF+
           '      PKGCRSICC.GET_ULTIMA_CALIF_ACRED(GYM.ID_ACREDITADO, NULL, NULL, TEMP.F_CALIFICACION) AS CVE_CALIFICACION_SICC'+coCRLF+
           '        FROM ( SELECT F_CALIFICACION'+coCRLF+
           '               FROM ( SELECT F_CALIFICACION'+coCRLF+
           '                        FROM ADMIPROD.CR_CAL_ACRED'+coCRLF+
           '                       WHERE SIT_CAL_ACRED <> ''CA'''+coCRLF+
           '                         AND ID_CALIFICADORA = DECODE('+vlID_CALIFICADORA+',0,ID_CALIFICADORA,'+vlID_CALIFICADORA+')'+coCRLF+
           '                         AND F_CALIFICACION BETWEEN '+vlF_INICIAL+coCRLF+
           '                             AND '+vlF_FINAL+coCRLF+
           '                     UNION'+coCRLF+
           '                      SELECT F_CALIFICACION'+coCRLF+
           '                        FROM ADMIPROD.CR_CAL_AR_CABEC'+coCRLF+
           '                       WHERE SIT_CAL_AR_CABE <> ''CA'''+coCRLF+
           '                         AND ID_CALIFICADORA = DECODE('+vlID_CALIFICADORA+',0,ID_CALIFICADORA,'+vlID_CALIFICADORA+')'+coCRLF+
           '                         AND F_CALIFICACION BETWEEN '+vlF_INICIAL+coCRLF+
           '                             AND '+vlF_FINAL+coCRLF+
           '                    )'+coCRLF+
           '               GROUP BY F_CALIFICACION'+coCRLF+
           '             ) TEMP,'+coCRLF+
           '             ( SELECT CA.ID_ACREDITADO,'+coCRLF+
           '                      SUBSTR(PKGCRSICC.STP_OBT_NOM_TITULAR_2(NULL, NULL, CA.ID_ACREDITADO),1,255) AS NOM_ACREDITADO'+coCRLF+
           '                 FROM (SELECT CA.ID_ACREDITADO'+coCRLF+
           '						   FROM CR_CONTRATO CCTO, CONTRATO CTO,'+coCRLF+
           '                              (SELECT ID_ACREDITADO FROM CR_ACREDITADO WHERE SIT_ACREDITADO=''AC'')CA'+coCRLF+
           '                        WHERE CTO.ID_CONTRATO = CCTO.ID_CONTRATO'+coCRLF+
           '                          AND CA.ID_ACREDITADO = CTO.ID_TITULAR'+coCRLF+
           '        					AND CA.ID_ACREDITADO = DECODE('+vlID_ACREDITADO+',0,CA.ID_ACREDITADO,'+vlID_ACREDITADO+')'+coCRLF+
           '                          AND CTO.ID_EMPRESA = DECODE('+vlID_EMPRESA+',0,CTO.ID_EMPRESA,'+vlID_EMPRESA+')'+coCRLF+
           '                        GROUP BY CA.ID_ACREDITADO'+coCRLF+
           '                      ) CA'+coCRLF+
           '             ) GYM,'+coCRLF+
           '             (SELECT MAX(DECODE(ROWNUM,1, ID_CALIFICADORA, NULL)) AS ID_CALIFICADORA1,'+coCRLF+
           '              MAX(DECODE(ROWNUM,1, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA1,'+coCRLF+
           '              MAX(DECODE(ROWNUM,2, ID_CALIFICADORA, NULL)) AS ID_CALIFICADORA2,'+coCRLF+
           '              MAX(DECODE(ROWNUM,2, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA2,'+coCRLF+
           '              MAX(DECODE(ROWNUM,3, ID_CALIFICADORA, NULL)) AS ID_CALIFICADORA3,'+coCRLF+
           '              MAX(DECODE(ROWNUM,3, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA3,'+coCRLF+
           '              MAX(DECODE(ROWNUM,4, ID_CALIFICADORA, NULL)) AS ID_CALIFICADORA4,'+coCRLF+
           '              MAX(DECODE(ROWNUM,4, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA4,'+coCRLF+
           '              MAX(DECODE(ROWNUM,5, ID_CALIFICADORA, NULL)) AS ID_CALIFICADORA5,'+coCRLF+
           '              MAX(DECODE(ROWNUM,5, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA5,'+coCRLF+
           '              MAX(DECODE(ROWNUM,6, ID_CALIFICADORA, NULL)) AS ID_CALIFICADORA6,'+coCRLF+
           '              MAX(DECODE(ROWNUM,6, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA6'+coCRLF+
           ''+coCRLF+
           '              FROM( SELECT ID_CALIFICADORA,'+coCRLF+
           '                      SUBSTR(PKGCRSICC.STP_OBT_NOM_TITULAR_2(NULL, NULL, ID_CALIFICADORA),1,255) AS NOM_CALIFICADORA'+coCRLF+
           '                 FROM CR_CALIFICADORA'+coCRLF+
           '                WHERE SIT_CALIFICADORA <> ''CA'''+coCRLF+
           '                  AND ID_CALIFICADORA = DECODE('+vlID_CALIFICADORA+',0,ID_CALIFICADORA,'+vlID_CALIFICADORA+')'+coCRLF+
           '                ORDER BY NOM_CALIFICADORA)'+coCRLF+
           '             ) CCAL'+coCRLF+
           '      ) R'+coCRLF+
           ''+coCRLF+
           ' WHERE ( (R.CVE_CALIFICACION1 IS '+vlMUESTRA+') OR'+coCRLF+
           '         (R.CVE_CALIFICACION2 IS  '+vlMUESTRA+') OR'+coCRLF+
           '         (R.CVE_CALIFICACION3 IS  '+vlMUESTRA+') OR'+coCRLF+
           '         (R.CVE_CALIFICACION4 IS  '+vlMUESTRA+') OR'+coCRLF+
           '         (R.CVE_CALIFICACION5 IS  '+vlMUESTRA+') OR'+coCRLF+
           '         (R.CVE_CALIFICACION6 IS  '+vlMUESTRA+') )'+coCRLF+
           ''+coCRLF+
           ' ORDER BY R.F_CALIFICACION DESC , '+peORDEN+coCRLF +
           ' ) where f_pivote = 1 '   // RUCJ4248
           ;
  Result := vlSQL;
End;

{
      rptReporte.ParamFields.Name := 'pF_FINAL';
      rptReporte.ParamFields.AsDate := Objeto.F_FINAL.AsDateTime;
      rptReporte.ParamFields.Name := 'pF_INICIAL';
      rptReporte.ParamFields.AsDate := Objeto.F_INICIAL.AsDateTime;
      rptReporte.ParamFields.Name := 'pID_ACREDITADO';
      rptReporte.ParamFields.AsNumber := Objeto.ID_TITULAR.AsInteger;
      rptReporte.ParamFields.Name := 'pID_CALIFICADORA';
      rptReporte.ParamFields.AsNumber := Objeto.ID_CALIFICADORA.AsInteger;
      rptReporte.ParamFields.Name := 'pID_EMPRESA';
      rptReporte.ParamFields.AsNumber := Objeto.ID_EMPRESA.AsInteger;
      rptReporte.ParamFields.Name := 'pMUESTRA';
      If Objeto.MUESTRA_ACRED.AsString ='F' Then
         rptReporte.ParamFields.Value := 'NULL'
      Else
         rptReporte.ParamFields.Value := 'NOT NULL';
      rptReporte.ParamFields.Name := 'pORDEN';
      rptReporte.ParamFields.Value := Objeto.ORDEN.AsString;
      rptReporte.ParamFields.Name := 'pFECHA';
      rptReporte.ParamFields.AsDate := Objeto.Apli.DameFechaEmpresaDia('D000');
}

End.
