unit IntMQrAuBlqDes;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2;

type
  TQrAuBlqDes = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyConsulta: TQuery;
    GpoMon: TQRGroup;
    GpoProd: TQRGroup;
    QRDBText3: TQRDBText;
    FooAcred: TQRBand;
    QRExpr5: TQRExpr;
    QRBand4: TQRBand;
    QRLabel16: TQRLabel;
    QRLabel38: TQRLabel;
    QRBand5: TQRBand;
    QRLabel23: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel53: TQRLabel;
    QRDBText7: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr6: TQRExpr;
    QRDBText15: TQRDBText;
    FooMon: TQRBand;
    QRLabel1: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel2: TQRLabel;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand2: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape1: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText11: TQRDBText;
    QRShape12: TQRShape;
    QRShape11: TQRShape;
    QRDBText1: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr7: TQRExpr;
  private
  public
    Apli : TInterApli;
    Function FormaQuery(sFIniBloq, sFFinBloq, sFIniDBloq, sFFinDBloq,
                        sMoneda, sAcreditado, sAutorizacion, sUsuario,
                        sEmpresa, sSucursal: String; pAPli: TInterApli): String;
  end;

var
    QrAuBlqDes: TQrAuBlqDes;

Procedure RepAuBlqDes(sFIniBloq, sFFinBloq, sFIniDBloq, sFFinDBloq,
                      sMoneda, sAcreditado, sAutorizacion, sUsuario,
                      sEmpresa, sSucursal: String; pAPli: TInterApli; pPreview: Boolean);
Implementation
{$R *.DFM}

Procedure RepAuBlqDes(sFIniBloq, sFFinBloq, sFIniDBloq, sFFinDBloq,
                      sMoneda, sAcreditado, sAutorizacion, sUsuario,
                      sEmpresa, sSucursal: String; pAPli: TInterApli; pPreview: Boolean);
Var
    QrAuBlqDes  : TQrAuBlqDes;
    Preview     : TIntQRPreview;
Begin
    QrAuBlqDes   := TQrAuBlqDes.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrAuBlqDes);
    QrAuBlqDes.Apli := pAPli;

    Try
        QrAuBlqDes.QRInterEncabezado1.Apli := pApli;
        QrAuBlqDes.QRInterEncabezado1.IdEmpresa := pAPli.IdEmpresa;
        QrAuBlqDes.QRInterEncabezado1.NomReporte :='IntMQrAuBlqDes';
        QrAuBlqDes.QRInterEncabezado1.Titulo1 := 'Autorizaciones Bloqueadas / Desbloqueadas';
        QrAuBlqDes.QRInterEncabezado1.Titulo2 := '';
        //
        if ( sFIniBloq  <> '' ) and ( sFFinBloq   <> '' ) then
          QrAuBlqDes.QRInterEncabezado1.Titulo2 := 'Bloqueo del ' + sFIniBloq + ' al ' + sFFinBloq;
        //
        if ( sFIniDBloq <> '' ) and  ( sFFinDBloq <> '' ) then
          if QrAuBlqDes.QRInterEncabezado1.Titulo2 = '' then
            QrAuBlqDes.QRInterEncabezado1.Titulo2 := 'Desbloqueo del ' + sFIniDBloq + ' al ' + sFFinDBloq
          else
            QrAuBlqDes.QRInterEncabezado1.Titulo2 := QrAuBlqDes.QRInterEncabezado1.Titulo2 + ' ' +
                                                     'Desbloqueo del ' + sFIniDBloq + ' al ' + sFFinDBloq;
        //
        QrAuBlqDes.qyConsulta.DatabaseName := pApli.DataBaseName;
        QrAuBlqDes.qyConsulta.SessionName := pApli.SessionName;
        QrAuBlqDes.qyConsulta.Active := False;

        QrAuBlqDes.qyConsulta.SQL.Text := QrAuBlqDes.FormaQuery(sFIniBloq,
          sFFinBloq, sFIniDBloq, sFFinDBloq, sMoneda, sAcreditado, sAutorizacion,
          sUsuario, sEmpresa, sSucursal,pAPli);

        QrAuBlqDes.qyConsulta.Active := True;

        If pPreview Then
            QrAuBlqDes.Preview
        Else
            QrAuBlqDes.Print;
    Finally
        QrAuBlqDes.free;
        If Assigned(Preview) Then Preview.Free;
    End;
End;

Function TQrAuBlqDes.FormaQuery(sFIniBloq, sFFinBloq, sFIniDBloq, sFFinDBloq,
                                sMoneda, sAcreditado, sAutorizacion, sUsuario,
                                sEmpresa, sSucursal: String; pAPli: TInterApli): String;
var sSQL:         String;
    sFiltros:     String;
Begin
    sSQL:= 'SELECT B.ID_TRN_BLQ_RECEP, '    + coCRLF +
           '       B.ID_ACREDITADO, '       + coCRLF +
           '       D.ID_CONTRATO, '         + coCRLF +
           '       B.TX_NOTA, '             + coCRLF +
           '       DECODE(B.ID_CONTRATO, 0, ''ACREDITADO'', ''AUTORIZACION'') NIVEL_BLOQUEO, ' + coCRLF +
           '       B.F_OPERACION F_BLOQUEO, ' + coCRLF +
           '       DB.F_DESBLOQUEO, '       + coCRLF +
           '       B.PCT_MOVIMIENTO,'       + coCRLF +
           '       L.IMP_AUTORIZADO, '      + coCRLF +
           '       PKGCRSALDOS.STPOBTDISPONIBLEAUT( L.ID_CONTRATO, L.FOL_CONTRATO ) IMP_DISPONIBLE, ' + coCRLF +
           '       D.IMP_BLOQUEO, '         + coCRLF +
           '       D.IMP_DESBLOQUEO, '      + coCRLF +
           '       D.IMP_BLOQUEO - D.IMP_DESBLOQUEO IMP_TOT_BLOQ, ' + coCRLF +
           '       B.CVE_USU_ALTA, '        + coCRLF +
           '       L.F_AUT_COMITE, '        + coCRLF +
           '       CTTO.ID_EMPRESA,'        + coCRLF +
           '       P.ID_PERSONA, '          + coCRLF +
           '       P.NOMBRE, '              + coCRLF +
           '       MON.CVE_MONEDA, '        + coCRLF +
           '       MON.DESC_MONEDA '        + coCRLF +
           'FROM   CR_CL_BLQ_RECEP B, '     + coCRLF +
           '       CR_CL_DET_BLQ D, '       + coCRLF +
           '       CR_CONTRATO L, '         + coCRLF +
           '       CONTRATO CTTO, '         + coCRLF +
           '       MONEDA MON, '            + coCRLF +
           '       PERSONA P, '             + coCRLF +
           '       (SELECT D.ID_TRN_BLQ_RECEP, '     + coCRLF +
           '               MAX(CT.F_OPERACION) F_DESBLOQUEO ' + coCRLF +
           '        FROM   CR_CL_DET_BLQ D, '        + coCRLF +
           '               CR_TRANSACCION CT '       + coCRLF +
           '        WHERE  CT.ID_GRUPO_TRANSAC = D.ID_GRUPO_TRANSAC ' + coCRLF +
           '          AND  CT.CVE_OPERACION    = ''DBLQLN'' ' + coCRLF +
           '          AND  CT.SIT_TRANSACCION  = ''AC'' '     + coCRLF +
           '          AND  CT.ID_TRANS_CANCELA IS NULL '      + coCRLF +
           '        GROUP BY D.ID_TRN_BLQ_RECEP '             + coCRLF +
           '       )DB '                                      + coCRLF +
           'WHERE  D.ID_TRN_BLQ_RECEP     = B.ID_TRN_BLQ_RECEP ' + coCRLF +
           '  AND  L.ID_CONTRATO          = D.ID_CONTRATO '      + coCRLF +
           '  AND  L.FOL_CONTRATO         = D.FOL_CONTRATO '     + coCRLF +
           '  AND  CTTO.ID_CONTRATO       = L.ID_CONTRATO '      + coCRLF +
           '  AND  MON.CVE_MONEDA         = CTTO.CVE_MONEDA '    + coCRLF +
           '  AND  P.ID_PERSONA           = CTTO.ID_TITULAR '    + coCRLF +
           '  AND  DB.ID_TRN_BLQ_RECEP(+) = B.ID_TRN_BLQ_RECEP ';


    sFiltros := ' AND CTTO.ID_EMPRESA = ' + sEmpresa;
    //
    If Trim(sMoneda) <> '' Then
        sFiltros := sFiltros + '  AND MON.CVE_MONEDA = '  + sMoneda    +  coCRLF;
    If Trim(sAcreditado) <> '' Then
        sFiltros := sFiltros + '  AND P.ID_PERSONA  = '   + sAcreditado + coCRLF;
    If Trim(sAutorizacion) <> '' Then
        sFiltros := sFiltros + '  AND D.ID_CONTRATO = '   + sAutorizacion + coCRLF;
    If ( Trim(sFIniBloq) <> '' ) and (Trim(sFFinBloq) <> '') Then
        sFiltros := sFiltros + '  AND B.F_OPERACION BETWEEN TO_DATE( ''' + sFIniBloq + ''', ''DD/MM/YYYY'' ) ' + coCRLF +
                               '  AND TO_DATE( ''' + sFFinBloq    + ''', ''DD/MM/YYYY'' ) ' + coCRLF;
    If ( Trim(sFIniDBloq) <> '' ) and (Trim(sFFinDBloq) <> '') Then
        sFiltros := sFiltros + '  AND DB.F_DESBLOQUEO BETWEEN TO_DATE( ''' + sFIniDBloq + ''', ''DD/MM/YYYY'' ) ' + coCRLF +
                               '  AND TO_DATE( ''' + sFFinDBloq   + ''', ''DD/MM/YYYY'' ) ' + coCRLF;
    If Trim(sUsuario) <> '' Then
        sFiltros := sFiltros + '  AND B.CVE_USU_ALTA  = ''' + sUsuario + '''' + coCRLF;

    sSQL := sSQL + coCRLF + sFiltros;
    
    sSQL := sSQL + coCRLF + 'ORDER BY B.F_OPERACION, MON.DESC_MONEDA, P.NOMBRE';
    //
    Result := sSQL;
End;

End.

