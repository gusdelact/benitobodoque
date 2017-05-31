unit IntMQrExcPen;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview;

type
  TQrExcPen = class(TQuickRep)
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
    qyExcep: TQuery;
    QRDBText8: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
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
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;


  private
  public
    Function FormaQuery(sF_OpeIni,sF_OpeFin,sF_RegIni,sF_RegFin,sF_AutIni,sF_AutFin,
                         sCveTramite,sAcreditado,sAutoriza,sCveRiesgo,sSituacion:String):String;
  end;

var
  QrExcPen: TQrExcPen;

Procedure RepExcepciones(sF_OpeIni,sF_OpeFin,sF_RegIni,sF_RegFin,sF_AutIni,sF_AutFin,
                         sCveTramite,sAcreditado,sAutoriza,sCveRiesgo,sSituacion:String;
                         pAPli     : TInterApli;
                         pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepExcepciones(sF_OpeIni,sF_OpeFin,sF_RegIni,sF_RegFin,sF_AutIni,sF_AutFin,
                         sCveTramite,sAcreditado,sAutoriza,sCveRiesgo,sSituacion:String;
                         pAPli     : TInterApli;
                         pPreview  : Boolean);
Var
    QrExcPen: TQrExcPen;
    VLTitulo : String;
    Preview     : TIntQRPreview;
Begin
    VLTitulo := '';
    QrExcPen:=TQrExcPen.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrExcPen);
    Try

        QrExcPen.QRInterEncabezado1.Apli:=pApli;
        QrExcPen.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrExcPen.QRInterEncabezado1.NomReporte:= 'IntMQrExcPen';
        QrExcPen.QRInterEncabezado1.Titulo1:='Excepciones de Documentos';

        If ((Trim(sF_OpeIni)<>'') or (Trim(sF_OpeFin)<>'')) Then Begin
            VLTitulo := VLTitulo + ' F Ope: ';
            If Trim(sF_OpeIni)<>'' Then
               VLTitulo := VLTitulo + sF_OpeIni;
            If Trim(sF_OpeFin)<>'' Then Begin
                 If Trim(sF_OpeIni)<>'' Then
                    VLTitulo := VLTitulo + ' al ';
                 VLTitulo := VLTitulo + sF_OpeFin;
            End;
        End;
        If ((Trim(sF_RegIni)<>'') or (Trim(sF_RegIni)<>'')) Then Begin
            VLTitulo := VLTitulo + ' F Reg.: ';
            If Trim(sF_RegIni)<>'' Then
               VLTitulo := VLTitulo + sF_RegIni;
            If Trim(sF_RegIni)<>'' Then Begin
               If Trim(sF_RegIni)<>'' Then
                  VLTitulo := VLTitulo + ' al ';
                  VLTitulo := VLTitulo + sF_RegFin;
            end;
        end;
        If ((Trim(sF_AutIni)<>'') or (Trim(sF_AutIni)<>'')) Then Begin
            VLTitulo := VLTitulo + ' F Aut.: ';
            If Trim(sF_AutIni)<>'' Then
               VLTitulo := VLTitulo + sF_AutIni;
            If Trim(sF_AutIni)<>'' Then Begin
               If Trim(sF_AutIni)<>'' Then
                  VLTitulo := VLTitulo + ' al ';
                  VLTitulo := VLTitulo + sF_AutFin;
            end;
        end;

        If (Trim(sCveTramite)<>'') Then
            VLTitulo := VLTitulo + ' por Trámite';
        If (Trim(sAcreditado)<>'') Then
            VLTitulo := VLTitulo + ' por Acreditado';
        If (Trim(sAutoriza)<>'') Then
            VLTitulo := VLTitulo + ' por Autorización';
        If (Trim(sCveRiesgo)<>'') Then
            VLTitulo := VLTitulo + ' por Riesgo';
        If (Trim(sSituacion)<>'') Then
            VLTitulo := VLTitulo + ' por Situación';

        QrExcPen.QRInterEncabezado1.Titulo2 := VLTitulo;

        QrExcPen.qyExcep.DatabaseName := pApli.DataBaseName;
        QrExcPen.qyExcep.SessionName := pApli.SessionName;
        QrExcPen.qyExcep.Active:=False;
        QrExcPen.qyExcep.SQL.Text:= QrExcPen.FormaQuery(sF_OpeIni,sF_OpeFin,sF_RegIni,
                        sF_RegFin,sF_AutIni,sF_AutFin,sCveTramite,sAcreditado,sAutoriza,
                        sCveRiesgo,sSituacion);

        QrExcPen.qyExcep.Active:=True;

        If pPreview Then
            QrExcPen.Preview
        Else
            QrExcPen.Print;
    Finally
        QrExcPen.free;
    End;
End;

Function TQrExcPen.FormaQuery(sF_OpeIni,sF_OpeFin,sF_RegIni,sF_RegFin,sF_AutIni,sF_AutFin,
                         sCveTramite,sAcreditado,sAutoriza,sCveRiesgo,sSituacion:String):String;
Var
    sSQL:String;
Begin
    sSQL:=  ' SELECT EXC.ID_TRAMITE, '+
            '         EXC.F_ALTA, '+
            '         PER.NOMBRE, '+
            '         EXC.TXT_EXCEPCION, '+
            '         EXC.F_REGULARIZA, '+
            '         DECODE(EXC.SIT_RECEP_EXC,''AC'',''Activa'',''CA'',''Cancelada'',''AU'',''Autorizada'',''SO'',''Solventada'',''NA'')SITUACION, '+
            '         EXC.CVE_NVL_RIESGO, '+
            '         NVL.DESC_NVL_RIESGO, '+
            '         TRAM.ID_ACREDITADO, '+
            '         PERACRE.NOMBRE ACREDITADO, '+
            '         TRAM.CVE_TRAMITE, '+
            '         EXC.CVE_USU_AUTORIZA, '+
            '         EXC.F_AUTORIZA, '+
            '         DOC.DESC_DOCUMENTO '+
            '    FROM DO_RECEP_EXC EXC, DO_DOCUMENTO DOC, USUARIO USU, PERSONA PER, '+
            '         DO_NVL_RIESGO NVL, DO_RECEP_TRAM TRAM, CR_ACREDITADO ACRE, PERSONA PERACRE '+
            '   WHERE EXC.ID_EMPRESA = DOC.ID_EMPRESA '+
            '     AND EXC.CVE_DOCUMENTO  = DOC.CVE_DOCUMENTO '+
            '     AND EXC.CVE_USU_AUTORIZA = USU.CVE_USUARIO '+
            '     AND USU.ID_PERSONA       = PER.ID_PERSONA '+
            '     AND EXC.ID_EMPRESA = NVL.ID_EMPRESA '+
            '     AND EXC.CVE_NVL_RIESGO = NVL.CVE_NVL_RIESGO '+
            '     AND EXC.ID_EMPRESA = TRAM.ID_EMPRESA '+
            '     AND EXC.ID_TRAMITE = TRAM.ID_TRAMITE '+
            '     AND TRAM.ID_ACREDITADO = ACRE.ID_ACREDITADO '+
            '     AND ACRE.ID_ACREDITADO = PERACRE.ID_PERSONA ';

    If (Trim(sF_OpeIni)<>'')And(Trim(sF_OpeFin)<>'') Then Begin
        sSQL:= sSQL + ' AND EXC.F_ALTA BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_OpeIni))+
        ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_OpeFin))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(sF_OpeIni)<>'')And(Trim(sF_OpeFin)='') Then Begin
        sSQL:= sSQL + ' AND EXC.F_ALTA > TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_OpeIni))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(sF_OpeIni)='')And(Trim(sF_OpeFin)<>'') Then Begin
        sSQL:= sSQL + ' AND EXC.F_ALTA < TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_OpeFin))+
        ''',''DD/MM/YYYY'')';
    End;

    If (Trim(sF_RegIni)<>'')And(Trim(sF_RegFin)<>'') Then Begin
        sSQL:= sSQL + ' AND EXC.F_REGULARIZA BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_RegIni))+
        ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_RegFin))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(sF_RegIni)<>'')And(Trim(sF_RegFin)='') Then Begin
        sSQL:= sSQL + ' AND EXC.F_REGULARIZA > TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_RegIni))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(sF_RegIni)='')And(Trim(sF_RegFin)<>'') Then Begin
        sSQL:= sSQL + ' AND EXC.F_REGULARIZA < TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_RegFin))+
        ''',''DD/MM/YYYY'')';
    End;

    If (Trim(sF_AutIni)<>'')And(Trim(sF_AutFin)<>'') Then Begin
        sSQL:= sSQL + ' AND EXC.F_AUTORIZA BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_AutIni))+
        ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_AutFin))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(sF_AutIni)<>'')And(Trim(sF_AutFin)='') Then Begin
        sSQL:= sSQL + ' AND EXC.F_AUTORIZA > TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_AutIni))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(sF_AutIni)='')And(Trim(sF_AutFin)<>'') Then Begin
        sSQL:= sSQL + ' AND EXC.F_AUTORIZA < TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_AutFin))+
        ''',''DD/MM/YYYY'')';
    End;

   If (Trim(sCveTramite)<>'') Then
      sSQL:= sSQL + ' AND   TRAM.CVE_TRAMITE ='''+ sCveTramite +'''';
   If (Trim(sAcreditado)<>'') Then
      sSQL:= sSQL + ' AND   TRAM.ID_ACREDITADO = '+ sAcreditado;
   If (Trim(sAutoriza)<>'') Then
      sSQL:= sSQL + ' AND   EXC.CVE_USU_AUTORIZA ='''+ sAutoriza +'''';
   If (Trim(sCveRiesgo)<>'') Then
      sSQL:= sSQL + ' AND   EXC.CVE_NVL_RIESGO = '''+ sCveRiesgo +'''';
   If (Trim(sSituacion)<>'') Then
      sSQL:= sSQL + ' AND   EXC.SIT_RECEP_EXC ='''+ sSituacion+'''';

   sSQL:= sSQL + '   ORDER BY EXC.CVE_NVL_RIESGO, PERACRE.NOMBRE, EXC.ID_TRAMITE, DOC.DESC_DOCUMENTO';

   Result:= sSQL;
End;
End.
