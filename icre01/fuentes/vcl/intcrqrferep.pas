unit IntCRQRFEReP;

interface      

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,InterApl,  IntQRPreview,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead, Db, DBTables, IntGenCre;

type
  TqrReportePagos = class(TQuickRep)
    qyRelDocEmi: TQuery;
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    qyRelDocEmiCVE_FND_ENT_DES: TStringField;
    qyRelDocEmiID_EPO: TFloatField;
    qyRelDocEmiNOMBRE_EMISOR: TStringField;
    qyRelDocEmiCVE_MONEDA: TFloatField;
    qyRelDocEmiDESC_MONEDA: TStringField;
    qyRelDocEmiID_PROVEEDOR: TFloatField;
    qyRelDocEmiNOMBRE: TStringField;
    qyRelDocEmiFOL_ACUSE: TStringField;
    qyRelDocEmiID_DOCUMENTO: TStringField;
    qyRelDocEmiIMP_NOMINAL: TFloatField;
    qyRelDocEmiIMPORTE_REPORTAR: TFloatField;
    qyRelDocEmiF_VENCIMIENTO_DO: TDateTimeField;
    QRGroup2: TQRGroup;
    QRGroup3: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRBFEmisor: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRShape7: TQRShape;
    QRLabel5: TQRLabel;
  private

  public
    Function FormaQuery(sMoneda,sEmisor,sProveedor,
                        sF_ComIni,sF_ComFin,
                        sEmpresa, sSucursal:String;
                        pAPli     : TInterApli):String;
  end;

var
  qrReportePagos: TqrReportePagos;

Procedure RepPagosFEEmisor( sMoneda,sEmisor,sProveedor,
                            sF_ComIni,sF_ComFin,
                            sEmpresa, sSucursal:String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);

implementation

{$R *.DFM}

Procedure RepPagosFEEmisor( sMoneda,sEmisor,sProveedor,
                            sF_ComIni,sF_ComFin,
                            sEmpresa, sSucursal:String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Var
    qrReportePagos: TqrReportePagos;
    VLTitulo : String;
    Preview     : TIntQRPreview;
Begin
    VLTitulo := '';
    qrReportePagos:=TqrReportePagos.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, qrReportePagos);
    Try

        qrReportePagos.QRInterEncabezado1.Apli:=pApli;
        qrReportePagos.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        qrReportePagos.QRInterEncabezado1.NomReporte:= 'IntCRQRFEReP';
        qrReportePagos.QRInterEncabezado1.Titulo1:='Relación de Documentos reportado por Pagar por Emisor';



        If ((Trim(sF_ComIni)<>'') or (Trim(sF_ComIni)<>'')) Then
        begin

        end;

        If (Trim(sMoneda)<>'') Then
            VLTitulo := VLTitulo + ' Por Moneda';
        If (Trim(sEmisor)<>'') Then
            VLTitulo := VLTitulo + ' Por Emisor';
        If (Trim(sProveedor)<>'') Then
            VLTitulo := VLTitulo + ' Por Prov.';

        qrReportePagos.QRInterEncabezado1.Titulo2 := VLTitulo;

        qrReportePagos.qyRelDocEmi.DatabaseName := pApli.DataBaseName;
        qrReportePagos.qyRelDocEmi.SessionName := pApli.SessionName;
        qrReportePagos.qyRelDocEmi.Active:=False;
        qrReportePagos.qyRelDocEmi.SQL.Text:= qrReportePagos.FormaQuery(sMoneda,sEmisor,sProveedor,
                                                                        sF_ComIni,sF_ComFin,
                                                                        sEmpresa, sSucursal,
                                                                        pAPli);
        qrReportePagos.qyRelDocEmi.SQL.SaveToFile('C:\IntCRQRFEReP.sql');

        qrReportePagos.qyRelDocEmi.Active:=True;

        If pPreview Then
            qrReportePagos.Preview
        Else
            qrReportePagos.Print;
    Finally
        qrReportePagos.free;
    End;
End;

Function TqrReportePagos.FormaQuery(sMoneda,sEmisor,sProveedor,
                        sF_ComIni,sF_ComFin,
                        sEmpresa, sSucursal:String;
                        pAPli     : TInterApli):String;
Var
    sSQL:String;
Begin
    sSQL:=  '    SELECT * FROM (' + coCRLF +
            '    select   CFD.CVE_FND_ENT_DES,' + coCRLF +
            '             CFD.ID_EPO,' + coCRLF +
            '             CE.NOMBRE AS NOMBRE_EMISOR,' + coCRLF +
            '                     M.CVE_MONEDA,' + coCRLF +
            '             decode (M.CVE_MONEDA, 484, ''PESO'', 840, ''DLLS'', M.CVE_MONEDA) as DESC_MONEDA,' + coCRLF +
            '             PE.ID_ACREDITADO AS ID_PROVEEDOR,' + coCRLF +
            '                     PE.NOMBRE,' + coCRLF +
            '                     CFD.FOL_ACUSE,' + coCRLF +
            '                     CFD.ID_DOCUMENTO,' + coCRLF +
            '             CFD.IMP_DOCUMENTO AS IMP_NOMINAL,' + coCRLF +
            '                     CFRP.IMPORTE_REPORTAR,' + coCRLF +
            '                     CFD.F_VENCIMIENTO_DO' + coCRLF +
            '    from     CR_FE_DOCUMENTO CFD,' + coCRLF +
            '             CR_FE_REG_PAGO CFRP,' + coCRLF +
            '            (select CR_EMISOR.*, P.NOMBRE' + coCRLF +
            '             from   CR_EMISOR,PERSONA P' + coCRLF +
            '             where  ID_ACREDITADO = P.ID_PERSONA and CVE_FND_ENT_DES = ''0070020'') CE,' + coCRLF +
            '            (select CP.ID_ACREDITADO, CP.ID_PROV_EXTERNO, P.NOMBRE' + coCRLF +
            '             from   CR_PROVEEDOR CP,' + coCRLF +
            '                         PERSONA P' + coCRLF +
            '             where  CP.ID_ACREDITADO = P.ID_PERSONA and CVE_FND_ENT_DES = ''0070020'') PE,' + coCRLF +
            '             MONEDA M,' + coCRLF +
            '            (select ID_PERSONA,SIGLAS_RFC || F_RFC || HOMOCLAVE_RFC as RFC from RFC) RFC' + coCRLF +
            '    where    CFD.SIT_DOCUMENTO = ''OR''' + coCRLF +
            '    and      CFRP.CVE_FND_ENT_DES = CFD.CVE_FND_ENT_DES' + coCRLF +
            '    and      CFRP.FOL_ACUSE = CFD.FOL_ACUSE' + coCRLF +
            '    and      CFRP.ID_DOCUMENTO = CFD.ID_DOCUMENTO' + coCRLF +
            '    and      CFRP.ID_EPO =  CFD.ID_EPO' + coCRLF +
            '    and      CE.CVE_EMISOR_EXT(+) = CFD.ID_EPO' + coCRLF +
            '    and      PE.ID_ACREDITADO(+) = RFC.ID_PERSONA' + coCRLF +
            '    and      M.CVE_MON_NAFIN(+) = CFD.CVE_MONEDA ' + coCRLF +
            '    and      CFD.RFC_PYME = RFC.RFC(+) ) QBASE ' + coCRLF +
            '    WHERE    1 = 1';

    If (Trim(sF_ComIni)<>'')And(Trim(sF_ComFin)<>'') Then
    Begin
        sSQL:= sSQL + ' AND QBASE.F_VENCIMIENTO_DO BETWEEN ' + coCRLF +
                      '     TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_ComIni))+ ''',''DD/MM/YYYY'')  ' + coCRLF +
                      ' AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_ComFin))+ ''',''DD/MM/YYYY'')  ' + coCRLF ;
    End;

    If (Trim(sMoneda)<>'') Then
        sSQL:= sSQL + ' AND   QBASE.CVE_MONEDA ='+sMoneda + coCRLF;
    If (Trim(sEmisor)<>'') Then
        sSQL:= sSQL + ' AND   QBASE.ID_EPO  ='+sEmisor + coCRLF;
    If (Trim(sProveedor)<>'') Then
        sSQL:= sSQL + ' AND   QBASE.ID_PROVEEDOR  ='+ sProveedor + coCRLF;

    sSQL:= sSQL + ' ORDER BY QBASE.CVE_FND_ENT_DES, QBASE.CVE_MONEDA, QBASE.ID_EPO ';

    Result:= sSQL;
End;

end.
