unit IntMQrDocCte;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview;

type
  TQrDocCte = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    qyDocCte: TQuery;
    QRDBText8: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText32: TQRDBText;
    QRGroupNVL: TQRGroup;
    QRGroupCliente: TQRGroup;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    TitleBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText7: TQRDBText;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRDBText9: TQRDBText;


  private
  public
    Function FormaQuery(sF_OpeIni, sF_OpeFin, sF_EntCIni, sF_EntCFin,
                     sAcreditado, sCveTramite,sCveDocto, sAutoriza,
                     sSituacion : String):String;
  end;

var
  QrDocCte: TQrDocCte;

Procedure RepDocCte( sF_OpeIni, sF_OpeFin, sF_EntCIni, sF_EntCFin,
                     sAcreditado, sCveTramite,sCveDocto, sAutoriza,
                     sSituacion : String;
                     pAPli    : TInterApli;
                     pPreview : Boolean);
Implementation
{$R *.DFM}

Procedure RepDocCte( sF_OpeIni, sF_OpeFin, sF_EntCIni, sF_EntCFin,
                     sAcreditado, sCveTramite,sCveDocto, sAutoriza,
                     sSituacion : String;
                     pAPli    : TInterApli;
                     pPreview : Boolean);
Var
    QrDocCte: TQrDocCte;
    VLTitulo : String;
    Preview     : TIntQRPreview;
Begin
    VLTitulo := '';
    QrDocCte:=TQrDocCte.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrDocCte);
    Try

        QrDocCte.QRInterEncabezado1.Apli:=pApli;
        QrDocCte.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrDocCte.QRInterEncabezado1.NomReporte:= 'IntMQrDocCte';
        QrDocCte.QRInterEncabezado1.Titulo1:='Seguimiento del Cliente';

        If ((Trim(sF_OpeIni)<>'') or (Trim(sF_OpeFin)<>'')) Then Begin
            VLTitulo := VLTitulo + ' F Ent.Or: ';
            If Trim(sF_OpeIni)<>'' Then
               VLTitulo := VLTitulo + sF_OpeIni;
            If Trim(sF_OpeFin)<>'' Then Begin
                 If Trim(sF_OpeIni)<>'' Then
                    VLTitulo := VLTitulo + ' al ';
                 VLTitulo := VLTitulo + sF_OpeFin;
            End;
        End;
        If ((Trim(sF_EntCIni)<>'') or (Trim(sF_EntCFin)<>'')) Then Begin
            VLTitulo := VLTitulo + ' F Ent.Cop: ';
            If Trim(sF_EntCIni)<>'' Then
               VLTitulo := VLTitulo + sF_EntCIni;
            If Trim(sF_EntCFin)<>'' Then Begin
                 If Trim(sF_EntCIni)<>'' Then
                    VLTitulo := VLTitulo + ' al ';
                 VLTitulo := VLTitulo + sF_EntCFin;
            End;
        End;
        If (Trim(sAcreditado)<>'') Then
            VLTitulo := VLTitulo + ' por Acreditado';
        If (Trim(sCveTramite)<>'') Then
            VLTitulo := VLTitulo + ' por Trámite';
        If (Trim(sCveDocto)<>'') Then
            VLTitulo := VLTitulo + ' por Documento';
        If (Trim(sAutoriza)<>'') Then
            VLTitulo := VLTitulo + ' por Usuario de Alta';
        If (Trim(sSituacion)<>'') Then
            VLTitulo := VLTitulo + ' por Situación';

        QrDocCte.QRInterEncabezado1.Titulo2 := VLTitulo;

        QrDocCte.qyDocCte.DatabaseName := pApli.DataBaseName;
        QrDocCte.qyDocCte.SessionName := pApli.SessionName;
        QrDocCte.qyDocCte.Active:=False;
        QrDocCte.qyDocCte.SQL.Text:= QrDocCte.FormaQuery(sF_OpeIni, sF_OpeFin,
                     sF_EntCIni, sF_EntCFin,sAcreditado, sCveTramite,
                     sCveDocto, sAutoriza,sSituacion);

        QrDocCte.qyDocCte.Active:=True;

        If pPreview Then
            QrDocCte.Preview
        Else
            QrDocCte.Print;
    Finally
        QrDocCte.free;
    End;
End;

Function TQrDocCte.FormaQuery(sF_OpeIni, sF_OpeFin, sF_EntCIni, sF_EntCFin,
                     sAcreditado, sCveTramite,sCveDocto, sAutoriza,
                     sSituacion : String):String;
Var
    sSQL:String;
Begin
    sSQL:=  '  SELECT T1.*, P.NOMBRE, TRAM.DESC_C_TRAMITE , '+
            '			 NVL2(DOC.F_ENTREGA_OR,DOC.F_ENTREGA_OR,DOC.F_ENTREGA_COP) F_ENTREGA, '+
            '         DOC.F_ENTREGA_OR, '+
            '         DOC.F_ENTREGA_COP, '+
            '         EXC.F_ALTA F_ALTA_EXC, '+
            '         DOC.NUM_EXPEDIENTE, '+
            '         DOC.F_EXPIRA, '+
            '         DECODE(DOC.SIT_DOCUMENTO,''AC'',''Activo'',''RN'', '+
            '  							''Renovado'',''VE'',''Vencido'',''DV'',''Devuelto'','''')SIT_DOCUMENTO '+
            '    FROM ('+
            '  (SELECT REL.ID_EMPRESA, '+
            '          REL.CVE_TRAMITE, '+
            '          REL.CVE_DOCUMENTO, '+
            '          DOC.DESC_DOCUMENTO, '+
            '          TRAM.ID_TRAMITE, '+
            '          TRAM.ID_ACREDITADO, '+
            '          TRAM.CVE_MEDIO, '+
            '          DECODE(TRAM.SIT_RECEP_TRAM,''AC'',''Activo'',''PE'',''Pendiente'', '+
            '  							 ''AU'',''Autorizado'',''CA'',''Cancelado'','''')SIT_RECEP_TRAM, '+
            '          TRAM.CVE_USU_ALTA '+
            '     FROM DO_REL_TRAM_DOC REL, DO_DOCUMENTO DOC, '+
            '          DO_RECEP_TRAM TRAM '+
            '    WHERE REL.ID_EMPRESA    = DOC.ID_EMPRESA '+
            '      AND REL.CVE_DOCUMENTO = DOC.CVE_DOCUMENTO '+
            '      AND REL.ID_EMPRESA    = TRAM.ID_EMPRESA '+
            '      AND REL.CVE_TRAMITE   = TRAM.CVE_TRAMITE) '+
            ' UNION ALL '+
            '           (SELECT DO_RECEP_DOC.ID_EMPRESA, '+
            '                   DO_RECEP_TRAM.CVE_TRAMITE, '+
            '                   DO_RECEP_DOC.CVE_DOCUMENTO, '+
            '                   DO_DOCUMENTO.DESC_DOCUMENTO, '+
            '                   DO_RECEP_DOC.ID_TRAMITE, '+
            '                   DO_RECEP_TRAM.ID_ACREDITADO, '+
            '                   DO_RECEP_TRAM.CVE_MEDIO, '+
            '                   DECODE(DO_RECEP_TRAM.SIT_RECEP_TRAM,''AC'',''Activo'',''PE'',''Pendiente'',   ''AU'',''Autorizado'',''CA'',''Cancelado'','' '')SIT_RECEP_TRAM, '+
            '                   DO_RECEP_TRAM.CVE_USU_ALTA '+
            '              FROM DO_RECEP_DOC, DO_DOCUMENTO, DO_RECEP_TRAM '+
            '             WHERE DO_RECEP_DOC.CVE_DOCUMENTO '+
            '                      NOT IN (SELECT CVE_DOCUMENTO '+
            '                                FROM DO_REL_TRAM_DOC REL '+
            '                               WHERE SIT_REL_TRAM_DO =''AC'' '+
            '                                 AND ID_EMPRESA = DO_RECEP_DOC.ID_EMPRESA '+
            '                                 AND CVE_TRAMITE = DO_RECEP_TRAM.CVE_TRAMITE ) '+
            '          AND  SIT_RECEP_DOC = ''AC'' '+
            '          AND  DO_RECEP_DOC.ID_EMPRESA = DO_DOCUMENTO.ID_EMPRESA '+
            '          AND  DO_RECEP_DOC.CVE_DOCUMENTO = DO_DOCUMENTO.CVE_DOCUMENTO '+
            '          AND  DO_RECEP_DOC.ID_EMPRESA = DO_RECEP_TRAM.ID_EMPRESA '+
            '          AND  DO_RECEP_DOC.ID_TRAMITE = DO_RECEP_TRAM.ID_TRAMITE) '+
            '          ) T1, DO_CLIENTE_DOC DOC, DO_RECEP_EXC EXC, '+
            '         CR_ACREDITADO ACRE, PERSONA P, DO_TRAMITE TRAM '+

            '   WHERE T1.CVE_DOCUMENTO = DOC.CVE_DOCUMENTO(+) '+
            '     AND T1.ID_ACREDITADO = DOC.ID_ACREDITADO(+) '+
            '     AND T1.ID_EMPRESA    = EXC.ID_EMPRESA(+) '+
            '     AND T1.ID_TRAMITE    = EXC.ID_TRAMITE(+) '+
            '     AND T1.CVE_DOCUMENTO = EXC.CVE_DOCUMENTO(+) '+
            '     AND T1.ID_ACREDITADO = ACRE.ID_ACREDITADO '+
            '     AND ACRE.ID_ACREDITADO = P.ID_PERSONA '+
            '     AND T1.ID_EMPRESA    = TRAM.ID_EMPRESA '+
            '     AND T1.CVE_TRAMITE   = TRAM.CVE_TRAMITE ';

    If (Trim(sF_OpeIni)<>'')And(Trim(sF_OpeFin)<>'') Then Begin
        sSQL:= sSQL + ' AND DOC.F_ENTREGA_OR BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_OpeIni))+
        ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_OpeFin))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(sF_OpeIni)<>'')And(Trim(sF_OpeFin)='') Then Begin
        sSQL:= sSQL + ' AND DOC.F_ENTREGA_OR > TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_OpeIni))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(sF_OpeIni)='')And(Trim(sF_OpeFin)<>'') Then Begin
        sSQL:= sSQL + ' AND DOC.F_ENTREGA_OR < TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_OpeFin))+
        ''',''DD/MM/YYYY'')';
    End;

    If (Trim(sF_EntCIni)<>'')And(Trim(sF_EntCFin)<>'') Then Begin
        sSQL:= sSQL + ' AND DOC.F_ENTREGA_COP BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_EntCIni))+
        ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_EntCFin))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(sF_EntCIni)<>'')And(Trim(sF_EntCFin)='') Then Begin
        sSQL:= sSQL + ' AND DOC.F_ENTREGA_COP > TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_EntCIni))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(sF_EntCIni)='')And(Trim(sF_EntCFin)<>'') Then Begin
        sSQL:= sSQL + ' AND DOC.F_ENTREGA_COP < TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_EntCFin))+
        ''',''DD/MM/YYYY'')';
    End;

   If (Trim(sAcreditado)<>'') Then
      sSQL:= sSQL + ' AND   T1.ID_ACREDITADO = '+ sAcreditado;
   If (Trim(sCveTramite)<>'') Then
      sSQL:= sSQL + ' AND   T1.CVE_TRAMITE ='''+ sCveTramite +'''';
   If (Trim(sCveDocto)<>'') Then
      sSQL:= sSQL + ' AND   T1.CVE_DOCUMENTO = '''+ sCveDocto +'''';
   If (Trim(sAutoriza)<>'') Then
      sSQL:= sSQL + ' AND   T1.CVE_USU_ALTA ='''+ sAutoriza +'''';
   If (Trim(sSituacion)<>'') Then
      sSQL:= sSQL + ' AND   DOC.SIT_DOCUMENTO ='''+ sSituacion+'''';

   sSQL:= sSQL + '    ORDER BY P.NOMBRE, TRAM.DESC_C_TRAMITE, T1.ID_TRAMITE, '+
					  '             T1.DESC_DOCUMENTO,DOC.SIT_DOCUMENTO,DOC.F_ENTREGA_OR';

   Result:= sSQL;
End;
End.
