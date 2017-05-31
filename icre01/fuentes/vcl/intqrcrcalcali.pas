unit IntQrCrCalCali;
interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, QRExport,IntGenCre, U_InterCustomStar, U_InterDigDoc;

type
  TQrCrCalCali = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRExcelFilter1: TQRExcelFilter;
    qyRecCalif: TQuery;
    QRBandTitulos: TQRBand;
    QRLbMetodo: TQRLabel;
    QRLbSP: TQRLabel;
    QRLbMOODYS: TQRLabel;
    QRLbFITCH: TQRLabel;
    QRLbHR: TQRLabel;
    QRLbVERUM: TQRLabel;
    QRLbConR: TQRLabel;
    QRLbSHCP1: TQRLabel;
    QRLbEscala: TQRLabel;
    QRLbGrupo: TQRLabel;
    QRLbSinR: TQRLabel;
    QRLbSHCP2: TQRLabel;
    QRLbGrados: TQRLabel;
    QRS3: TQRShape;
    QRS1: TQRShape;
    QRS4: TQRShape;
    QRS2: TQRShape;
    QRS5: TQRShape;
    QRS6: TQRShape;
    QRS8: TQRShape;
    QRS9: TQRShape;
    QRS10: TQRShape;
    QRS7: TQRShape;
    QRGroupLista: TQRGroup;
    QRDBNUM_NIVEL: TQRDBText;
    QRDetalle: TQRBand;
    QRDBSP: TQRDBText;
    QRDBMOODYS: TQRDBText;
    QRL1: TQRShape;
    QRL2: TQRShape;
    QRL3: TQRShape;
    QRL5: TQRShape;
    QRL4: TQRShape;
    QRL6: TQRShape;
    QRL7: TQRShape;
    QRL8: TQRShape;
    QRL9: TQRShape;
    QRL10: TQRShape;
    QRL11: TQRShape;
    QRL12: TQRShape;
    QRL14: TQRShape;
    QRL15: TQRShape;
    QRL16: TQRShape;
    QRL18: TQRShape;
    QRL17: TQRShape;
    QRL19: TQRShape;
    QRL20: TQRShape;
    QRDBFITCH: TQRDBText;
    QRDBHR: TQRDBText;
    QRDBVERUM: TQRDBText;
    QRDBCVE_PONDERACION: TQRDBText;
    QRBPrueba: TQRBand;
    QRS11: TQRShape;
    QRL13: TQRShape;
    QRl21: TQRShape;
    QRLFINAL: TQRLabel;
    QRL150Porc: TQRLabel;
    QRL150Porc2: TQRLabel;
    QRLabel1: TQRLabel;
  private
  public
    Function FormaQuery():String;
  end;

var
  QrCrCalCali: TQrCrCalCali;

Procedure RepCalificadoras( pAPli : TInterApli; pPreview : Boolean);

Implementation
{$R *.DFM}

Procedure RepCalificadoras( pAPli : TInterApli; pPreview : Boolean);

Var
    QrCrCalCali: TQrCrCalCali;
    Preview     : TIntQRPreview;
Begin
   QrCrCalCali:=TQrCrCalCali.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrCrCalCali);
   Try
      QrCrCalCali.qyRecCalif.Active:=False;
      QrCrCalCali.qyRecCalif.Close;
      QrCrCalCali.qyRecCalif.SQL.Clear;

      QrCrCalCali.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrCrCalCali.QRInterEncabezado1.NomReporte:='IntQrCrCalCali';
      QrCrCalCali.QRInterEncabezado1.Titulo1:='Calificadoras';

      QrCrCalCali.qyRecCalif.SQL.Add(QrCrCalCali.FormaQuery());
      QrCrCalCali.qyRecCalif.DatabaseName:= pApli.DataBaseName;
      QrCrCalCali.qyRecCalif.SessionName:= pApli.SessionName;
      QrCrCalCali.QRInterEncabezado1.Apli := pApli;

      QrCrCalCali.qyRecCalif.Open;

          If QrCrCalCali.qyRecCalif.IsEmpty Then
              ShowMessage('No Existen Datos para el Reporte,  Reintente mas tarde.  Gracias !!')
          Else Begin
             If pPreview Then
                QrCrCalCali.Preview
             Else
                QrCrCalCali.Print;
          End;
          
    Finally
      QrCrCalCali.Free;
    End;
End;

Function TQrCrCalCali.FormaQuery( ):String;
Var
    sSQL    : String;
    sTipoRiesgo : String;
Begin
    sTipoRiesgo:='RIESLC';
    sSQL:= ''+
        ' SELECT b.num_nivel, b.cve_ordenacion, upper(a.sp) SP, upper(b.MOODYS) MOODYS, upper(c.FITCH) FITCH, upper(d.HR) HR, upper(e.VERUM) VERUM, b.CVE_PONDERACION from ' +
        '      ( ' +
        ' 	SELECT num_nivel, cve_ordenacion, cve_calificacion AS sp, '''' AS moodys, ' +
        ' 	  '''' AS fitch, '''' AS hr, '''' AS verum, cve_ponderacion ' +
        ' 	  FROM cr_cal_califica ' +
        ' 	  WHERE 2 = 2 AND cve_tipo_escala = 2 AND cve_tipo_riesgo = ' + #39 + 'RIESLC' + #39 + ' AND id_calificadora IN (332172) ' +
        '      	) A,   ' +
        '      	( ' +
        ' 	  SELECT num_nivel, cve_ordenacion, '''' AS sp, cve_calificacion AS moodys, ' +
        ' 	  '''' AS fitch, '''' AS hr, '''' AS verum, cve_ponderacion||'' %'' as cve_ponderacion ' +
        ' 	  FROM cr_cal_califica ' +
        ' 	  WHERE 2 = 2 AND cve_tipo_escala = 2 AND cve_tipo_riesgo = ' + #39 + 'RIESLC' + #39 + ' AND id_calificadora IN (116953) ' +
        ' 	  UNION ALL ' +
        ' 	  SELECT 1 num_nivel, ''1'' cve_ordenacion, '''' AS sp, '''' AS moodys, '''' AS fitch, '''' AS hr, '''' AS verum, '''' cve_ponderacion FROM DUAL ' +
        '      	) B, ' +
        ' 	( ' +
        ' 	  SELECT num_nivel, cve_ordenacion, '''' AS sp, '''' AS moodys, ' +
        ' 	  cve_calificacion fitch, '''' AS hr, '''' AS verum, cve_ponderacion ' +
        ' 	  FROM cr_cal_califica ' +
        ' 	  WHERE 2 = 2 ' +
        ' 	  AND cve_tipo_escala = 2 AND cve_tipo_riesgo = ' + #39 + 'RIESLC' + #39 + ' AND id_calificadora IN (44660) ' +
        ' 	)C, ' +
        ' 	( ' +
        ' 	  SELECT num_nivel, cve_ordenacion, '''' AS sp, '''' AS moodys, '''' AS fitch, ' +
        ' 	  cve_calificacion hr, '''' AS verum, cve_ponderacion ' +
        ' 	  FROM cr_cal_califica ' +
        ' 	  WHERE 2 = 2 AND cve_tipo_escala = 2 AND cve_tipo_riesgo = ' + #39 + 'RIESLC' + #39 + ' AND id_calificadora IN (466014) ' +
        ' 	)D, ' +
        ' 	( ' +
        ' 	  SELECT num_nivel, cve_ordenacion, '''' AS sp, '''' AS moodys, '''' AS fitch, ' +
        ' 	  '''' AS hr, cve_calificacion AS verum, cve_ponderacion ' +
        ' 	  FROM cr_cal_califica ' +
        ' 	  WHERE 2 = 2 AND cve_tipo_escala = 2 AND cve_tipo_riesgo = ' + #39 + 'RIESLC' + #39 + ' AND id_calificadora IN (494466) ' +
        ' 	) E ' +
        ' where a.cve_ordenacion(+)=b.cve_ordenacion ' +
        ' and a.num_nivel(+)=b.num_nivel ' +
        ' and c.cve_ordenacion(+)=b.cve_ordenacion ' +
        ' and c.num_nivel(+)=b.num_nivel ' +
        ' and d.cve_ordenacion(+)=b.cve_ordenacion ' +
        ' and d.num_nivel(+)=b.num_nivel ' +
        ' and e.cve_ordenacion(+)=b.cve_ordenacion ' +
        ' and e.num_nivel(+)=b.num_nivel ' +
        ' ORDER BY num_nivel, cve_ordenacion ';

     Result:= sSQL;
End;

End.
