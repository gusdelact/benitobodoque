unit IntMQrIncDecPe;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2;

type
  TQrIncDecPe = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyConsulta: TQuery;
    GpoMon: TQRGroup;
    GpoProd: TQRGroup;
    GpoCom: TQRGroup;
    GpoCli: TQRGroup;
    FooProd: TQRBand;
    QRExpr5: TQRExpr;
    QRBand4: TQRBand;
    QRLabel16: TQRLabel;
    QRLabel38: TQRLabel;
    QRBand5: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel53: TQRLabel;
    QRExpr4: TQRExpr;
    FooMon: TQRBand;
    QRLabel1: TQRLabel;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel2: TQRLabel;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRLabel4: TQRLabel;
    FooCom: TQRBand;
    QRExpr15: TQRExpr;
    QRLabel8: TQRLabel;
    QRExpr16: TQRExpr;
    QRExpr19: TQRExpr;
    FooCli: TQRBand;
    QRExpr21: TQRExpr;
    QRLabel9: TQRLabel;
    QRExpr22: TQRExpr;
    QRExpr25: TQRExpr;
    QRBand2: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape1: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText22: TQRDBText;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
  private
  public
     Apli : TInterApli;

     Function FormaQuery(sFIni, sFFin, sMoneda, sPromotor, sProducto, sAcreditado, sAutorizacion,
                         sSituacion, sEmpresa, sSucursal: String; pAPli: TInterApli): String;
  end;

var
    QrIncDecPe: TQrIncDecPe;

Procedure RepIncDecPer(sFIni, sFFin, sMoneda, sPromotor, sProducto, sAcreditado, sAutorizacion,
                         sSituacion, sEmpresa, sSucursal: String; pAPli: TInterApli; pPreview: Boolean);
Implementation
{$R *.DFM}

Procedure RepIncDecPer(sFIni, sFFin, sMoneda, sPromotor, sProducto, sAcreditado, sAutorizacion,
                         sSituacion, sEmpresa, sSucursal: String; pAPli: TInterApli; pPreview: Boolean);
Var
    QrIncDecPe  : TQrIncDecPe;
    Preview     : TIntQRPreview;
Begin
    QrIncDecPe   := TQrIncDecPe.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrIncDecPe);
    QrIncDecPe.Apli := pAPli;

    Try
        QrIncDecPe.QRInterEncabezado1.Apli := pApli;
        QrIncDecPe.QRInterEncabezado1.IdEmpresa := pAPli.IdEmpresa;
        QrIncDecPe.QRInterEncabezado1.NomReporte :='IntMQrIncDecPe';
        QrIncDecPe.QRInterEncabezado1.Titulo1 := 'INCREMENTOS / DECREMENTOS POR PERIODO';
        QrIncDecPe.QRInterEncabezado1.Titulo2 := 'Del ' + sFIni + ' Al ' + sFFin;
        QrIncDecPe.qyConsulta.DatabaseName := pApli.DataBaseName;
        QrIncDecPe.qyConsulta.SessionName := pApli.SessionName;
        QrIncDecPe.qyConsulta.Active := False;

        QrIncDecPe.qyConsulta.SQL.Text := QrIncDecPe.FormaQuery(sFIni, sFFin, sMoneda, sPromotor, sProducto, sAcreditado,
                                                                sAutorizacion, sSituacion, sEmpresa, sSucursal,pAPli);

        // QrIncDecPe.qyConsulta.SQL.SaveToFile('C:\Intercase\Interacciones\ICre01\Consulta.txt');

        QrIncDecPe.qyConsulta.Active := True;

        If pPreview Then
            QrIncDecPe.Preview
        Else
            QrIncDecPe.Print;
    Finally
        QrIncDecPe.free;
        If Assigned(Preview) Then Preview.Free;
    End;
End;

Function TQrIncDecPe.FormaQuery(sFIni, sFFin, sMoneda, sPromotor, sProducto, sAcreditado, sAutorizacion,
                                sSituacion, sEmpresa, sSucursal: String; pAPli: TInterApli): String;
Var
    sSQL:         String;
    sFiltros:     String;
Begin
    sFiltros := '   AND CTO.ID_EMPRESA = ' + sEmpresa + coCRLF;

    If (Trim(sSituacion) <> '') Then
        sFiltros := sFiltros + '    AND CTO.SIT_CONTRATO = ''' + sSituacion + '''' + coCRLF;
    If Trim(sMoneda) <> '' Then
        sFiltros := sFiltros + '    AND MON.CVE_MONEDA = ''' + sMoneda + '''' + coCRLF;
    If Trim(sPromotor) <> '' Then
        sFiltros := sFiltros + '    AND PA.ID_PERSONA = ' + sPromotor + coCRLF;
    If Trim(sProducto) <> '' Then
        sFiltros := sFiltros + '    AND CCTO.CVE_PRODUCTO_CRE = ''' + sProducto + '''' + coCRLF;
    If Trim(sAcreditado) <> '' Then
        sFiltros := sFiltros + '    AND PER.ID_PERSONA = ' + sAcreditado + coCRLF;
    If Trim(sAutorizacion) <> '' Then
        sFiltros := sFiltros + '    AND CTO.ID_CONTRATO = ' + sAutorizacion + coCRLF;

    sSQL := ' SELECT ' + coCRLF +
            '    DATOS.ID_EMPRESA, ' + coCRLF +
            '    DATOS.ID_ENTIDAD, ' + coCRLF +
            '    DATOS.DESC_ENTIDAD, ' + coCRLF +
            '    DATOS.CVE_MONEDA, ' + coCRLF +
            '    DATOS.DESC_MONEDA, ' + coCRLF +
            '    DATOS.ID_PERSONA, ' + coCRLF +
            '    DATOS.NOMBRE NOM_PROMOTOR, ' + coCRLF +
            '    DATOS.CVE_TIPO_MOVTO, ' + coCRLF +
            '    DATOS.TIPO_MOVTO, ' + coCRLF +
            '    DATOS.ID_SOL_EXCESO, ' + coCRLF +
            '    DATOS.ID_TITULAR, ' + coCRLF +
            '    DATOS.ID_CONTRATO, ' + coCRLF +
            '    DATOS.NOMBRE, ' + coCRLF +
            '    DATOS.CVE_PRODUCTO_CRE, ' + coCRLF +
            '    DATOS.F_INICIO, ' + coCRLF +
            '    DATOS.F_VENCIMIENTO, ' + coCRLF +
            '    DATOS.IMP_AUTORIZADO, ' + coCRLF +
            '    DATOS.IMP_DISPUESTO, ' + coCRLF +
            '    DATOS.IMP_AUTORIZADO - DATOS.IMP_DISPUESTO SDO_DISPONIBLE, ' + coCRLF +
            '    DATOS.F_INI_EXCESO, ' + coCRLF +
            '    DATOS.F_VTO_EXCESO, ' + coCRLF +
            '    DATOS.IMP_EXCESO_EVE, ' + coCRLF +
            '    DATOS.IMP_AUTORIZADO + IMP_EXC_EVE_SIGNO IMP_AUT_DISP, ' + coCRLF +
            '    DATOS.IMP_AUTORIZADO - DATOS.IMP_DISPUESTO + IMP_EXC_EVE_SIGNO TOTAL_DISP ' + coCRLF +
            ' FROM ' + coCRLF +
            '    ( ' + coCRLF +
            '     SELECT ' + coCRLF +
            '        CTO.ID_EMPRESA, ' + coCRLF +
            '        UN.ID_ENTIDAD, ' + coCRLF +
            '        UN.DESC_ENTIDAD, ' + coCRLF +
            '        MON.CVE_MONEDA, ' + coCRLF +
            '        MON.DESC_MONEDA, ' + coCRLF +
            '        PA.ID_PERSONA, ' + coCRLF +
            '        PA.NOMBRE NOM_PROMOTOR, ' + coCRLF +
            '        CDA.CVE_TIPO_MOVTO, ' + coCRLF +
            '        CDA.ID_SOL_EXCESO, ' + coCRLF +
            '        CDA.TIPO_MOVTO, ' + coCRLF +
            '        CTO.ID_TITULAR, ' + coCRLF +
            '        CTO.ID_CONTRATO, ' + coCRLF +
            '        PER.NOMBRE, ' + coCRLF +
            '        CCTO.CVE_PRODUCTO_CRE, ' + coCRLF +
            '        TO_CHAR(CCTO.F_AUT_COMITE,''DD/MM/YYYY'') AS F_INICIO, ' + coCRLF +
            '        TO_CHAR(CCTO.F_VENCIMIENTO,''DD/MM/YYYY'') AS F_VENCIMIENTO, ' + coCRLF +
            '        CCTO.IMP_AUTORIZADO - NVL( ( SIGNO * IMP_EXCESO_EVE ), 0 ) IMP_AUTORIZADO, ' + coCRLF +
            '        PKGCRSALDOS.STPOBTDISPUESTOAUT(CCTO.ID_CONTRATO, CCTO.FOL_CONTRATO) AS IMP_DISPUESTO, ' + coCRLF +
            '        0 AS SDO_DISPONIBLE, ' + coCRLF +
            '        CDA.F_INI_EXCESO, ' + coCRLF +
            '        CDA.F_VTO_EXCESO, ' + coCRLF +
            '        CDA.IMP_EXCESO_EVE, ' + coCRLF +
            '        NVL( CDA.IMP_EXCESO_EVE * SIGNO, 0 ) IMP_EXC_EVE_SIGNO ' + coCRLF +
            '     FROM ' + coCRLF +
            '        CONTRATO CTO, ' + coCRLF +
            '        CR_CONTRATO CCTO, ' + coCRLF +
            '        MONEDA MON, ' + coCRLF +
            '        UNIDAD_NEGOCIO UN, ' + coCRLF +
            '        PERSONA PER, ' + coCRLF +
            '        PERSONA PA, ' + coCRLF +
            '        (SELECT CDA.ID_CONTRATO, ' + coCRLF +
            '                CDA.CVE_TIPO_MOVTO, ' + coCRLF +
            '                DECODE(CDA.CVE_TIPO_MOVTO, ''I'', ''Incremento'', ' + coCRLF +
            '                                           ''D'', ''Decremento'', ''Avisar a Sistemas'') AS TIPO_MOVTO, ' + coCRLF +
            '                DECODE(CDA.CVE_TIPO_MOVTO, ''I'', 1, ' + coCRLF +
            '                                           ''D'', -1, 0) AS SIGNO, ' + coCRLF +
            '                   CSE.ID_SOL_EXCESO, ' + coCRLF +
            '                TO_CHAR(CSE.F_INI_EXCESO,''DD/MM/YYYY'') AS F_INI_EXCESO, ' + coCRLF +
            '                TO_CHAR(CSE.F_VTO_EXCESO,''DD/MM/YYYY'') AS F_VTO_EXCESO, ' + coCRLF +
            '                DECODE((DECODE(SIGN(TO_DATE(''' + sFIni + ''',''DD/MM/YYYY'') - CSE.F_INI_EXCESO), ' + coCRLF +
            '				             -1,0,CSE.IMP_EXCESO_EVE)), ' + coCRLF +
            '                        (DECODE(SIGN(CSE.F_VTO_EXCESO - TO_DATE(''' + sFIni + ''',''DD/MM/YYYY'')), ' + coCRLF +
            '                             -1,0,CSE.IMP_EXCESO_EVE)),CSE.IMP_EXCESO_EVE,0) AS IMP_EXCESO_EVE ' + coCRLF +
            '            FROM   CR_SOL_EXCESO_AC CSE, ' + coCRLF +
            '                   CR_DET_EXCESO_AU CDA ' + coCRLF +
            '            WHERE  CDA.ID_SOL_EXCESO = CSE.ID_SOL_EXCESO ' + coCRLF +
            '              AND  CDA.ID_ACREDITADO = CSE.ID_ACREDITADO ' + coCRLF +
            '           )CDA ' + coCRLF +
            '     WHERE ' + coCRLF +
            '        CTO.ID_CONTRATO = CCTO.ID_CONTRATO ' + coCRLF +
            '        AND CTO.CVE_MONEDA = MON.CVE_MONEDA ' + coCRLF +
            '        AND CTO.ID_EMPRESA = UN.ID_EMPRESA ' + coCRLF +
            '        AND CTO.ID_ENTIDAD = UN.ID_ENTIDAD ' + coCRLF +
            '        AND PER.ID_PERSONA = CTO.ID_TITULAR ' + coCRLF +
            '        AND CTO.ID_PERS_ASOCIAD = PA.ID_PERSONA ' + coCRLF +
            '        AND CTO.ID_CONTRATO = CDA.ID_CONTRATO ';

            sSQL := sSQL + sFiltros;

            sSQL := sSQL + '    ) DATOS ' + coCRLF +
                           ' ORDER BY ' + coCRLF +
                           '    DATOS.ID_ENTIDAD, DATOS.CVE_MONEDA, ' + coCRLF +
                           '    DATOS.ID_PERSONA, DATOS.ID_TITULAR, ' + coCRLF +
                           '    DATOS.CVE_TIPO_MOVTO, DATOS.ID_SOL_EXCESO ' + coCRLF;

    Result := sSQL;
End;

End.

