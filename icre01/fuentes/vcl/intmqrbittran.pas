unit IntMQrBitTran;
interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, unSQL2, cOMoBJ, IntXls;
Const
   coCRLF      = #13#10;
type
  TQrBitTran = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyBitTran: TQuery;
    ColumnHeaderBand1: TQRBand;
    QRShape17: TQRShape;
    QRLabel20: TQRLabel;
    QRFooterUsu: TQRBand;
    QRLabel5: TQRLabel;
    QRExpr5: TQRExpr;
    QRDBText5: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel4: TQRLabel;
    QRShape6: TQRShape;
    QRLabel6: TQRLabel;
    QRShape7: TQRShape;
    QRLabel7: TQRLabel;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRShape9: TQRShape;
    QRLabel9: TQRLabel;
    QRShape11: TQRShape;
    QRLabel12: TQRLabel;
    QRShape12: TQRShape;
    QRLabel13: TQRLabel;
    qrbDETALLE: TQRBand;
    QRDBText23: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape2: TQRShape;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText13: TQRDBText;
    QRGroupAcre: TQRGroup;
    QRFooterAcre: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr1: TQRExpr;
    QRGroupUsu: TQRGroup;
    qyBitTranID_TITULAR: TFloatField;
    qyBitTranNOM_TITULAR: TStringField;
    qyBitTranCVE_USU_ALTA: TStringField;
    qyBitTranNOM_USU_ALTA: TStringField;
    qyBitTranCVE_OPERACION: TStringField;
    qyBitTranDESC_L_OPERACION: TStringField;
    qyBitTranTX_NOTA: TStringField;
    qyBitTranID_TRANSACCION: TFloatField;
    qyBitTranID_CONTRATO: TFloatField;
    qyBitTranID_CREDITO: TFloatField;
    qyBitTranIMP_NETO: TFloatField;
    qyBitTranID_CTO_LIQ: TStringField;
    qyBitTranFH_ALTA: TDateTimeField;
    qyBitTranHORA_ALTA: TStringField;
    qyBitTranSIT_TRANSACCION: TStringField;
    qyBitTranCVE_USU_CANC: TStringField;
    qyBitTranNOM_USU_CANC: TStringField;
    qyBitTranFH_CANCELA: TDateTimeField;
    qyBitTranHORA_CANC: TStringField;
    qyBitTranCVE_USU_AUTORIZA: TStringField;
    qyBitTranFH_AUTORIZA: TDateTimeField;
    qyBitTranHORA_AUTORIZA: TStringField;
    qyBitTranSIST_ORIGEN: TStringField;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbDETALLEBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupUsuBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterUsuBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbDETALLEAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

    Function FormaQuery(sF_Inicial, sF_Final,
                        sCVE_USUARIO, sACREDITADO, sID_CESION, soperador,
                        sImporte, vlsisticre,
                        vlsistint, vlsistliq,
                         vlsistcoi, vlsisttasa : String):String;


  end;

var
  QrBitTran: TQrBitTran;
  bGenArch: Boolean;
  F: TextFile;
  sArchivo : String;

  vgnRowExcel : Integer;
  vgB_SALIDA_EXCEL : Boolean;
  vgExcelApp : OleVariant;
  vgFileName : String;
  vgfinicial, vgffinal, vgcveusu : String;

  Procedure  BitTransac(sF_Inicial, sF_Final, sCVE_USUARIO, sACREDITADO, sID_CESION, soperador,
                        sImporte,vlsisticre,
                        vlsistint, vlsistliq,
                        vlsistcoi, vlsisttasa,
                        peFileName :String;
                        pAPli : TInterApli;
                        pPreview : Boolean);

  var
  vlcount : Integer;


Implementation
{$R *.DFM}

Procedure BitTransac(sF_Inicial, sF_Final, sCVE_USUARIO, sACREDITADO, sID_CESION, soperador,
                     sImporte,vlsisticre,
                     vlsistint, vlsistliq,
                     vlsistcoi, vlsisttasa,
                     peFileName :String;
                     pAPli : TInterApli;
                     pPreview : Boolean);
Var
   QrBitTran : TQrBitTran;
   Preview   : TIntQRPreview;
   VLTitulo  : String;

Begin
   QrBitTran:=TQrBitTran.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrBitTran);
   Try
      VLTitulo := '';

      vgfinicial := sF_Inicial;
      vgffinal  :=  sF_Final;
      vgcveusu := sCVE_USUARIO;

      bGenArch:= False;
      sArchivo:= peFileName;
      QrBitTran.QRInterEncabezado1.Apli:=pApli;
      QrBitTran.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrBitTran.QRInterEncabezado1.NomReporte:='IntMQrBitTran';
      QrBitTran.QRInterEncabezado1.Titulo1:='Bitácora de Transacciones con fecha del '+sF_Inicial+' al '+ sF_Final;

        If (Trim(sCVE_USUARIO)<>'') Then
            VLTitulo := VLTitulo + 'Por Usuario: '+sCVE_USUARIO;

      QrBitTran.QRInterEncabezado1.Titulo2:=VLTitulo;

      QrBitTran.qyBitTran.DatabaseName := pApli.DataBaseName;
      QrBitTran.qyBitTran.SessionName := pApli.SessionName;

      QrBitTran.qyBitTran.Active:=False;
      QrBitTran.qyBitTran.SQL.Text:= QrBitTran.FormaQuery(sF_Inicial, sF_Final, sCVE_USUARIO, sACREDITADO, sID_CESION, soperador, sImporte,vlsisticre,
                                                          vlsistint, vlsistliq,vlsistcoi,vlsisttasa) ;
      QrBitTran.qyBitTran.SQL.SaveToFile('C:\BitTransac.sql');
      QrBitTran.qyBitTran.Active:=True;


      // Válida la generación del Archivo Excel
        vgB_SALIDA_EXCEL :=(Trim(peFileName) <> '');
      If (vgB_SALIDA_EXCEL) Then
       Begin
        vgFileName := peFileName;
        vgExcelApp := CreateOleObject('Excel.Application');
        vgExcelApp.Workbooks.Add;
       End;

     { If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, 'BANCO INTERACCIONES, S.A.' + #09 );
         Writeln(F, 'Bitácora de Transacciones' + #09 );
         Writeln(F, 'Fecha del: ' +sF_Inicial+' al '+sF_Final+#09);
         Writeln(F, VLTitulo);         
         Writeln(F,  #09 );

      Writeln(F,
                'USUARIO' + #09 +
                'NOMBRE' + #09 +
                'CVE OPERACIÓN' + #09 +
                'DESCRIPCIÓN' + #09 +
                'TRANSACCION' + #09 +
                'CONTRATO' + #09 +
                'CREDITO' + #09 +
                'IMPORTE' + #09 +
                'CONTRATO LIQ' + #09 +
                'F. ALTA' + #09 +
                'HR. ALTA' + #09 +
                'SITUACION' + #09 +
                'USUARIO CANC' + #09 +
                'NOMBRE' + #09 +
                'F. CANCELA' + #09 +
                'HR. CANCELA' + #09 +
                'SISTEMA'
                 );
                 
         Writeln(F, '');
      End;    }

      If pPreview Then
         QrBitTran.Preview
      Else
         QrBitTran.Print;
   Finally
      If (vgB_SALIDA_EXCEL) Then Begin
         bGenArch:= True;
//         CloseFile(F);
        vgExcelApp.ActiveWorkBook.SaveAs(peFileName);
        CloseExcelFile(vgExcelApp);
      End;
      QrBitTran.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrBitTran.FormaQuery(sF_Inicial, sF_Final, sCVE_USUARIO, sACREDITADO, sID_CESION, soperador, sImporte,vlsisticre,
                               vlsistint, vlsistliq,vlsistcoi, vlsisttasa: String ):String;
Var
    sSQL:String;
Begin

    sSQL:= ' select * from' +coCRLF+
           '(' +coCRLF;

    if (vlsisticre = 'CRE') then //or (sistorig = 'AMB') then
     begin
      sSQL := sSQL+
           ///////////ICRE///////////
           ' SELECT CNT.ID_TITULAR,' +coCRLF+
 	   '        CAST(pkgcrconsolidado.fun_nom_tit_cred (CNT.id_titular) AS VARCHAR2 (100)) NOM_TITULAR,' +coCRLF+
           '        crt.cve_usu_alta,' +coCRLF+
           '        (SELECT pf.apellido_paterno||'' ''||pf.apellido_materno||'' ''||pf.nombre_persona as nombre' +coCRLF+
           '           FROM persona_fisica pf, usuario usu' +coCRLF+
           '          where pf.id_persona = usu.id_persona' +coCRLF+
           '            and usu.CVE_USUARIO = crt.cve_usu_alta) nom_usu_alta,' +coCRLF+
           '        crt.cve_operacion, CAST(cro.desc_l_operacion AS VARCHAR2(250 BYTE)) AS desc_l_operacion,' +coCRLF+
           '        CAST(crT.TX_NOTA AS VARCHAR2(250 BYTE)) AS tx_nota,' +coCRLF+
           '        crt.id_transaccion, crt.id_contrato, crt.id_credito, crt.imp_neto,' +coCRLF+
           '        cast(crt.id_cto_liq as Varchar2(20 byte)) as id_cto_liq, trunc(crt.fh_alta) as fh_alta, to_char(fh_alta,''HH:MI:SS pm'')hora_alta, crt.sit_transaccion,' +coCRLF+
           '        crt.cve_usu_canc,' +coCRLF+
           '        (SELECT pf.apellido_paterno||'' ''||pf.apellido_materno||'' ''||pf.nombre_persona as nombre' +coCRLF+
           '           FROM persona_fisica pf, usuario usu' +coCRLF+
           '          where pf.id_persona = usu.id_persona' +coCRLF+
           '            and usu.CVE_USUARIO = crt.cve_usu_canc) nom_usu_canc,' +coCRLF+
           '            trunc(crt.fh_cancela) as fh_cancela, to_char(fh_cancela,''HH:MI:SS pm'')hora_canc,' +coCRLF+
           '        '' '' as cve_usu_autoriza, CAST('''' AS DATE) as fh_autoriza, '' '' as hora_autoriza,' +coCRLF+
           '        ''ICRE'' AS sist_origen' +coCRLF+
           '   FROM cr_transaccion crt, cr_operacion cro, CR_CREDITO CR, CONTRATO CNT' +coCRLF+
           '  WHERE cro.cve_operacion = crt.cve_operacion' +coCRLF+
           '    AND CR.ID_CREDITO = CRT.ID_CREDITO' +coCRLF+
           '    AND CNT.ID_CONTRATO = CR.ID_CONTRATO' +coCRLF+
           '    AND trunc(crt.fh_alta) between '+SQLFecha(StrToDate(sF_Inicial))+' and '+SQLFecha(StrToDate(sF_Final))+ coCRLF;

       if Trim(sCVE_USUARIO) <> '' then
       sSQL:= sSQL + '    AND CRT.CVE_USU_ALTA = '''+sCVE_USUARIO+''''+coCRLF;

       if Trim(sImporte) <> '' then
       sSQL:= sSQL + '    AND crt.imp_neto '+soperador+ sImporte+coCRLF;

       if Trim(sACREDITADO) <> '' then
       sSQL:= sSQL + '    AND CNT.ID_TITULAR = '+ sACREDITADO+coCRLF;

       if Trim(sID_CESION) <> '' then
       sSQL:= sSQL + '    AND CRT.ID_CREDITO = '+ sID_CESION+coCRLF;

     end;


     if (vlsisticre = 'CRE') and (vlsistliq = 'LIQ') then
     sSQL:= sSQL + 'UNION ALL'+coCRLF;


     if (vlsistliq = 'LIQ') then //or (sistorig = 'AMB') then
     begin
     sSQL := sSQL+
           ///////////LIQUIDACIONES///////////
           ' SELECT CNT.ID_TITULAR,'+coCRLF+
           '	    CAST(pkgcrconsolidado.fun_nom_tit_cred (CNT.id_titular) AS VARCHAR2 (100)) NOM_TITULAR,'+coCRLF+
           '        crl.cve_usu_alta,'+coCRLF+
           '        (SELECT pf.apellido_paterno||'' ''||pf.apellido_materno||'' ''||pf.nombre_persona as nombre'+coCRLF+
           '           FROM persona_fisica pf, usuario usu'+coCRLF+
           '           where pf.id_persona = usu.id_persona'+coCRLF+
           '             and usu.CVE_USUARIO = crl.cve_usu_alta) nom_usu_alta,'+coCRLF+
           '        crl.cve_medio as cve_operacion, trim(CAST(crl.tx_desc_instruc AS VARCHAR2(250 BYTE))) AS desc_l_operacion, CAST('' '' AS VARCHAR2(250 BYTE)) AS tx_nota,'+coCRLF+
           '        crl.fol_movto as id_transaccion,'+coCRLF+
           '        (SELECT id_contrato'+coCRLF+
           '           FROM cr_credito'+coCRLF+
           '          WHERE id_credito = crl.id_credito) as ID_CONTRATO,'+coCRLF+
           '        crl.id_credito, crl.imp_movto as imp_neto,'+coCRLF+
           '        (SELECT cuenta_banco'+coCRLF+
           '           FROM cr_liq_che_recep'+coCRLF+
           '          WHERE cve_medio = crl.cve_medio'+coCRLF+
           '            AND ref_externa = crl.ref_externa'+coCRLF+
           '            AND id_credito = crl.id_credito) as id_cto_liq,'+coCRLF+
           '        trunc(crl.fh_captura) as fh_alta, to_char(fh_captura,''HH:MI:SS pm'')hora_alta, crl.sit_liq_movto as sit_transaccion, crl.cve_usuario_canc as cve_usu_canc,'+coCRLF+
           '        (SELECT pf.apellido_paterno||'' ''||pf.apellido_materno||'' ''||pf.nombre_persona as nombre'+coCRLF+
           '           FROM persona_fisica pf, usuario usu'+coCRLF+
           '          where pf.id_persona = usu.id_persona'+coCRLF+
           '            and usu.CVE_USUARIO = crl.cve_usuario_canc) nom_usu_canc,'+coCRLF+
           '        CASE WHEN crl.CVE_USUARIO_CANC <> '''' THEN TRUNC(crl.fh_captura) else NULL end as fh_cancela,'+coCRLF+
           '        to_char(to_date(crl.h_cancela,''HH24:MI:SS''),''HH24:MI:SS'') hora_canc,'+coCRLF+
           '        '' '' as cve_usu_autoriza, CAST('''' AS DATE) as fh_autoriza, '' '' as hora_autoriza,' +coCRLF+
           '        ''LIQ. CRED'' AS sist_origen'+coCRLF+
           '   FROM cr_liq_movto crl, CR_CREDITO CR, CONTRATO CNT'+coCRLF+
           '  WHERE 1=1'+coCRLF+
           '    AND CR.ID_CREDITO = CRL.ID_CREDITO'+coCRLF+
           '    AND CNT.ID_CONTRATO = CR.ID_CONTRATO'+coCRLF+
           '    and trunc(crl.fh_captura) between '+SQLFecha(StrToDate(sF_Inicial))+' and '+SQLFecha(StrToDate(sF_Final))+ coCRLF;

       if Trim(sCVE_USUARIO) <> '' then
       sSQL:= sSQL + '    AND crl.cve_usu_alta = '''+sCVE_USUARIO+''''+coCRLF;

       if Trim(sImporte) <> '' then
       sSQL:= sSQL + '    AND crl.imp_movto '+soperador+ sImporte+coCRLF;

       if Trim(sACREDITADO) <> '' then
       sSQL:= sSQL + '    AND CNT.ID_TITULAR = '+ sACREDITADO+coCRLF;

       if Trim(sID_CESION) <> '' then
       sSQL:= sSQL + '    AND CRL.ID_CREDITO = '+ sID_CESION+coCRLF;
     end;


     if ((vlsistliq = 'LIQ') and (vlsistint = 'INT')) or ((vlsisticre = 'CRE') and (vlsistint = 'INT')) then
     sSQL:= sSQL + 'UNION ALL'+coCRLF;


     if (vlsistint = 'INT') then
     begin
     sSQL := sSQL+
           ///////////INTERCREDITOS///////////
           ' SELECT cnt.id_titular,'+coCRLF+
           '        CAST(pkgcrconsolidado.fun_nom_tit_cred (cnt.id_titular) AS VARCHAR2 (100)) nom_titular,'+coCRLF+
           '        cve_usu_aplica AS cve_usu_alta,'+coCRLF+
           '        (CASE  WHEN cve_usu_aplica = ''CIERRE'''+coCRLF+
           '               THEN ''CIERRE'''+coCRLF+
           '            ELSE (SELECT pf.apellido_paterno ||'' ''|| pf.apellido_materno ||'' ''|| pf.nombre_persona AS nombre'+coCRLF+
           '                    FROM persona_fisica pf, usuario usu'+coCRLF+
           '                   WHERE pf.id_persona = usu.id_persona'+coCRLF+
           '                     AND usu.cve_usuario = crt.cve_usu_aplica)'+coCRLF+
           '         END'+coCRLF+
           '        ) nom_usu_alta,'+coCRLF+
           '        crt.cve_operacion,'+coCRLF+
           '        CAST (cro.desc_l_id_prim AS VARCHAR2 (250 BYTE)) AS desc_l_operacion,'+coCRLF+
           '        CAST (crt.tx_comentario AS VARCHAR2 (250 BYTE)) AS tx_nota,'+coCRLF+
           '        crt.folio_trans_cred as id_transaccion, crt.id_contrato, crt.id_credito, imp_operacion AS IMP_NETO,'+coCRLF+
           '        cast(ID_CONTRA_DV as Varchar2(20 byte)) as id_cto_liq,'+coCRLF+
           '        F_APLICACION AS  FH_ALTA,'+coCRLF+
           '        CASE WHEN h_liquidacion = 0 THEN ''12:00:00 PM'' ELSE ('+coCRLF+
           '        to_char(to_date(lpad(h_liquidacion,6, ''0''), ''hhmiss''), ''hh:mi:ss pm'')) END as HORA_ALTA,'+coCRLF+
           '        CRT.SIT_TRANSACCION, '' '' as cve_usu_canc, '' '' as nom_usu_canc,'+coCRLF+
           '        CAST('''' AS DATE) as fh_cancela, '' '' as hora_canc,'+coCRLF+
           '        '' '' as cve_usu_autoriza, CAST('''' AS DATE) as fh_autoriza, '' '' as hora_autoriza,'+coCRLF+
           '        ''CRED'' AS sist_origen'+coCRLF+
           '   FROM cre_transaccion crt, cre_operacion cro, cre_credito cre, contrato cnt'+coCRLF+
           '  WHERE cro.cve_operacion = crt.cve_operacion'+coCRLF+
           '    AND cre.id_credito = crt.id_credito'+coCRLF+
           '    AND cnt.id_contrato = cre.id_contrato'+coCRLF+
           '    AND CRE.SIT_CREDITO <> ''TA'''+coCRLF+
           '    AND f_aplicacion between '+SQLFecha(StrToDate(sF_Inicial))+' and '+SQLFecha(StrToDate(sF_Final))+ coCRLF;

       if Trim(sCVE_USUARIO) <> '' then
       sSQL:= sSQL + '    AND crt.cve_usu_aplica = '''+sCVE_USUARIO+''''+coCRLF;

       if Trim(sImporte) <> '' then
       sSQL:= sSQL + '    AND crt.imp_operacion '+soperador+ sImporte+coCRLF;

       if Trim(sACREDITADO) <> '' then
       sSQL:= sSQL + '    AND CNT.ID_TITULAR = '+ sACREDITADO+coCRLF;

       if Trim(sID_CESION) <> '' then
       sSQL:= sSQL + '    AND CRE.ID_CREDITO = '+ sID_CESION+coCRLF;

     end;


     if ((vlsistint = 'INT') and (vlsistcoi = 'COI')) or ((vlsistliq = 'LIQ') and (vlsistcoi = 'COI')) or ((vlsisticre = 'CRE') and (vlsistcoi = 'COI')) then
     sSQL:= sSQL + 'UNION ALL'+coCRLF;

     if (vlsistcoi = 'COI') then
     begin
     sSQL := sSQL+
           ///////////COINCRE///////////
           ' SELECT cnt.id_titular,'+coCRLF+
           '        CAST(pkgcrconsolidado.fun_nom_tit_cred (cnt.id_titular) AS VARCHAR2 (100)) nom_titular,'+coCRLF+
           '        cah.CVE_USU_MODIFICA AS cve_usu_alta,'+coCRLF+
           '        (SELECT pf.apellido_paterno ||'' ''|| pf.apellido_materno ||'' ''|| pf.nombre_persona AS nombre'+coCRLF+
           '           FROM persona_fisica pf, usuario usu'+coCRLF+
           '          WHERE pf.id_persona = usu.id_persona'+coCRLF+
           '            AND usu.cve_usuario = cah.CVE_USU_MODIFICA) as nom_usu_alta,'+coCRLF+
           '        '' '' as cve_operacion, CAST(cah.tx_motivo AS VARCHAR2(250 BYTE)) AS desc_l_operacion,'+coCRLF+
           '        case when IMP_CAP_VIG > 0 OR IMP_CAP_IMP > 0 OR IMP_CAP_VDO_EX > 0 OR IMP_CAP_VDO_NE > 0 OR IMP_INT_VIG > 0 OR IMP_INT_IMP > 0 OR IMP_INT_VDO_EX > 0 THEN'+coCRLF+
           '        (CAST(''CAP_VIG = ''|| IMP_CAP_VIG || '' / CAP_IMP = '' || IMP_CAP_IMP || '' / CAP_VDO_EX = '' || IMP_CAP_VDO_EX || '' / CAP_VDO_NE = '' || IMP_CAP_VDO_NE || '+coCRLF+
           '              '' / INT_VIG = '' || IMP_INT_VIG || '' / INT_IMP = '' || IMP_INT_IMP || '' / INT_VDO_EX = '' || IMP_INT_VDO_EX || '' / F.CIERRE: '' || cah.f_cierre AS VARCHAR2(250 BYTE))) ELSE cast('' '' as varchar(250 byte)) END AS tx_nota,'+coCRLF+
           '        0 as id_transaccion,'+coCRLF+
           '        crc.id_contrato, crc.id_credito, (imp_cap_vig + imp_cap_imp + imp_cap_vdo_ex + imp_cap_vdo_ne + imp_int_vig + imp_int_imp + imp_int_vdo_ex ) as imp_neto,'+coCRLF+
           '        '' '' as id_cto_liq, trunc(cah.fh_modificacion) as fh_alta, to_char(cah.fh_modificacion,''HH:MI:SS pm'') hora_alta,'+coCRLF+
           '        '' '' as sit_transaccion, '' '' as CVE_USU_CANC, '' '' as NOM_USU_CANC, CAST('''' AS DATE) as FH_CANCELA, '' '' as HORA_CANC,'+coCRLF+
           '        '' '' as cve_usu_autoriza, CAST('''' AS DATE) as fh_autoriza, '' '' as hora_autoriza,'+coCRLF+
           '        ''COIN'' as SIST_ORIGEN'+coCRLF+
           '   FROM cr_con_adeudo_his cah, cr_credito crc, contrato cnt'+coCRLF+
           '  WHERE 1=1'+coCRLF+
           '    and cnt.id_contrato = crc.id_contrato'+coCRLF+
           '    and crc.ID_CREDITO = cah.id_credito'+coCRLF+
           '    and trunc(cah.fh_modificacion) between '+SQLFecha(StrToDate(sF_Inicial))+' and '+SQLFecha(StrToDate(sF_Final))+ coCRLF;

       if Trim(sCVE_USUARIO) <> '' then
       sSQL:= sSQL + '    AND cah.CVE_USU_MODIFICA = '''+sCVE_USUARIO+''''+coCRLF;

       if Trim(sACREDITADO) <> '' then
       sSQL:= sSQL + '    AND CNT.ID_TITULAR = '+ sACREDITADO+coCRLF;

       if Trim(sID_CESION) <> '' then
       sSQL:= sSQL + '    AND CRC.ID_CREDITO = '+ sID_CESION+coCRLF;

     end;

     if ((vlsistcoi = 'COI') and (vlsisttasa = 'TAS')) or ((vlsistint = 'INT') and (vlsisttasa = 'TAS')) or ((vlsistliq = 'LIQ') and (vlsisttasa = 'TAS')) or
        ((vlsisticre = 'CRE') and (vlsisttasa = 'TAS'))then
     sSQL:= sSQL + 'UNION ALL'+coCRLF;

     if (vlsisttasa = 'TAS') then
     begin
     sSQL := sSQL+
           ///////////CAMBIO DE TASAS///////////
           ' select cnt.id_titular,'+coCRLF+
           '        CAST(pkgcrconsolidado.fun_nom_tit_cred (cnt.id_titular) AS VARCHAR2 (100)) nom_titular,'+coCRLF+
           '        ctc.cve_usu_alta,'+coCRLF+
           '        (SELECT pf.apellido_paterno ||'' ''|| pf.apellido_materno ||'' ''|| pf.nombre_persona AS nombre'+coCRLF+
           '           FROM persona_fisica pf, usuario usu'+coCRLF+
           '          WHERE pf.id_persona = usu.id_persona'+coCRLF+
           '            AND usu.cve_usuario = ctc.CVE_USU_ALTA ) as nom_usu_alta,'+coCRLF+
           '        '' '' as cve_operacion,'+coCRLF+
           '        CAST(''SOBRETASA_ANT = ''|| SOBRETASA_ANT || '' / CVE_TAS_REF_ANT = '' || CVE_TAS_REF_ANT AS VARCHAR2(250 BYTE)) AS desc_l_operacion,'+coCRLF+
           '        CAST(''SOBRETASA_NVA = ''|| SOBRETASA_NVA || '' / CVE_TAS_REF_NVA = '' || CVE_TAS_REF_NVA AS VARCHAR2(250 BYTE)) AS TX_NOTA,'+coCRLF+
           '        ctc.fol_cambio as id_transaccion, crc.id_contrato, ctc.id_credito, 0 as imp_neto, '' '' as id_cto_liq,'+coCRLF+
           '        TRUNC(FH_ALTA) AS FH_ALTA, to_char(FH_ALTA,''HH:MI:SS pm'') hora_alta, SIT_CAMBIO as sit_transaccion,'+coCRLF+
           '        ctc.cve_usu_cancela as cve_usu_canc,'+coCRLF+
           '        (SELECT pf.apellido_paterno||'' ''||pf.apellido_materno||'' ''||pf.nombre_persona as nombre'+coCRLF+
           '           FROM persona_fisica pf, usuario usu'+coCRLF+
           '          where pf.id_persona = usu.id_persona'+coCRLF+
           '            and usu.CVE_USUARIO = ctc.cve_usu_cancela) nom_usu_canc,'+coCRLF+
           '        trunc(ctc.fh_cancela) as fh_cancela, to_char(ctc.fh_cancela,''HH:MI:SS pm'') hora_canc,'+coCRLF+
           '        ctc.cve_usu_autoriza, trunc(ctc.fh_autoriza) as fh_autoriza, to_char(ctc.fh_autoriza,''HH:MI:SS pm'') hora_autoriza,'+coCRLF+
           '        ''CAMBTAS'' AS sist_origen'+coCRLF+
           '   from cr_tasa_cambio CTC, cr_credito crc, contrato cnt'+coCRLF+
           '  where 1=1'+coCRLF+
           '    and crc.id_credito = ctc.id_credito'+coCRLF+
           '    and cnt.id_contrato = crc.id_contrato'+coCRLF+
           '    and trunc(ctc.fh_alta) between '+SQLFecha(StrToDate(sF_Inicial))+' and '+SQLFecha(StrToDate(sF_Final))+ coCRLF;

       if Trim(sCVE_USUARIO) <> '' then
       sSQL:= sSQL + '    AND ctc.cve_usu_alta = '''+sCVE_USUARIO+''''+coCRLF;           

       if Trim(sACREDITADO) <> '' then
       sSQL:= sSQL + '    AND CNT.ID_TITULAR = '+ sACREDITADO+coCRLF;

       if Trim(sID_CESION) <> '' then
       sSQL:= sSQL + '    AND CRC.ID_CREDITO = '+ sID_CESION+coCRLF;

     end;

      sSQL:= sSQL +
          ')'+coCRLF+
          '    order by sist_origen, id_titular, cve_usu_alta, nom_usu_alta, id_credito, fh_alta, hora_alta, fh_cancela, hora_canc, fh_autoriza, hora_autoriza'+coCRLF;


    Result:= sSQL;
End;


procedure TQrBitTran.qrbDETALLEBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vlfechcanc : String;

begin

    vlcount := vlcount + 1;    

    if qyBitTran.FieldByName('FH_CANCELA').AsString = '' then
    begin
    QRLabel24.Caption := ' - ';
    QRLabel24.Alignment := taCenter;
    end
    else
    begin
    QRLabel24.Caption := qyBitTran.FieldByName('FH_CANCELA').AsString + ' ' + qyBitTran.FieldByName('HORA_CANC').AsString;
    QRLabel24.Alignment := taCenter;
    end;

    if qyBitTran.FieldByName('ID_CTO_LIQ').AsString = ' ' then
    begin
    QRLabel17.Caption := ' - ';
    QRLabel17.Alignment := taCenter;
    end
    else
    begin
    QRLabel17.Caption := qyBitTran.FieldByName('ID_CTO_LIQ').AsString;
    QRLabel17.Alignment := taLeftJustify;
    end;

    if qyBitTran.FieldByName('SIT_TRANSACCION').AsString = ' ' then                  
    begin
    QRLabel18.Caption := ' - ';
    QRLabel18.Alignment := taCenter;
    end
    else
    begin
    QRLabel18.Caption := qyBitTran.FieldByName('SIT_TRANSACCION').AsString;
    QRLabel18.Alignment := taCenter;
    end;



    if (qyBitTran.FieldByName('CVE_USU_CANC').AsString = '') or (qyBitTran.FieldByName('CVE_USU_CANC').AsString = ' ') then
    begin
    QRLabel15.Caption := ' - ';
    QRLabel15.Alignment := taCenter;
    end
    else begin
    QRLabel15.Caption := qyBitTran.FieldByName('CVE_USU_CANC').AsString;
    QRLabel15.Alignment := taLeftJustify;
    end;


    If qyBitTran.FieldByName('FH_CANCELA').asString <> '' Then
    begin
    vlfechcanc:= FormatDateTime('dd/mm/yyyy', qyBitTran.FieldByName('FH_CANCELA').AsDateTime);
    end
    else
    vlfechcanc := '';

  { If (sArchivo <>'') then
      Writeln(F, qyBitTran.FieldByName('CVE_USU_ALTA').AsString + #09 +
                 qyBitTran.FieldByName('NOM_USU_ALTA').AsString + #09 +
                 qyBitTran.FieldByName('CVE_OPERACION').AsString + #09 +
                 qyBitTran.FieldByName('DESC_L_OPERACION').AsString + #09 +
                 qyBitTran.FieldByName('ID_TRANSACCION').AsString + #09 +
                 qyBitTran.FieldByName('ID_CONTRATO').AsString + #09 +
                 qyBitTran.FieldByName('ID_CREDITO').AsString + #09 +
                 FormatFloat('###,###,###,##0.00',qyBitTran.FieldByName('IMP_NETO').AsFloat)+ #09+
                 qyBitTran.FieldByName('ID_CTO_LIQ').AsString + #09 +
                 FormatDateTime('DD/MM/YYYY',qyBitTran.FieldByName('FH_ALTA').AsDateTime) + #09 +
                 qyBitTran.FieldByName('HORA_ALTA').AsString + #09 +
                 qyBitTran.FieldByName('SIT_TRANSACCION').AsString + #09 +
                 qyBitTran.FieldByName('CVE_USU_CANC').AsString + #09 +
                 qyBitTran.FieldByName('NOM_USU_CANC').AsString + #09 +
                 vlfechcanc + #09 +
                 qyBitTran.FieldByName('HORA_CANC').AsString + #09 +
                 qyBitTran.FieldByName('SIST_ORIGEN').AsString + #09
               );     }
                     
end;

procedure TQrBitTran.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If qyBitTran.Eof Then Begin
      If Trim(sArchivo)<>'' Then
      Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

procedure TQrBitTran.QRGroupUsuBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
vlcount := 0;
end;

procedure TQrBitTran.QRFooterUsuBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If vgB_SALIDA_EXCEL then
     begin
//      Writeln(F, 'Total de Registros por usuario: ' + IntToStr(vlcount)+#09);
{      vgExcelApp.Cells[vgnRowExcel+1,ColumnXlS('A' )].Value := 'Total de Registros por usuario: ' + IntToStr(vlcount);
      vgExcelApp.Cells[vgnRowExcel+1,ColumnXlS('A' )].Font.Bold := True;
      Inc(vgnRowExcel);
      Inc(vgnRowExcel);}
     end;
end;

procedure TQrBitTran.qrbDETALLEAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  If vgB_SALIDA_EXCEL Then
   Begin
    Inc(vgnRowExcel);
    If Not (qyBitTran.FieldByName('ID_TITULAR').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('A' )].Value := qyBitTran.FieldByName('ID_TITULAR').AsString;
    If Not (qyBitTran.FieldByName('NOM_TITULAR').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('B' )].Value := qyBitTran.FieldByName('NOM_TITULAR').AsString;
    If Not (qyBitTran.FieldByName('CVE_USU_ALTA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('C' )].Value := qyBitTran.FieldByName('CVE_USU_ALTA').AsString;
    If Not (qyBitTran.FieldByName('NOM_USU_ALTA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('D' )].Value := qyBitTran.FieldByName('NOM_USU_ALTA').AsString;
    If Not (qyBitTran.FieldByName('CVE_OPERACION').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('E' )].Value := qyBitTran.FieldByName('CVE_OPERACION').AsString;
    If Not (qyBitTran.FieldByName('DESC_L_OPERACION').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('F' )].Value := qyBitTran.FieldByName('DESC_L_OPERACION').AsString;
    If Not (qyBitTran.FieldByName('TX_NOTA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('G' )].Value := qyBitTran.FieldByName('TX_NOTA').AsString;
    If Not (qyBitTran.FieldByName('ID_TRANSACCION').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('H' )].Value := qyBitTran.FieldByName('ID_TRANSACCION').AsString;
    If Not (qyBitTran.FieldByName('ID_CONTRATO').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('I' )].Value := qyBitTran.FieldByName('ID_CONTRATO').AsString;
    If Not (qyBitTran.FieldByName('ID_CREDITO').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('J' )].Value := qyBitTran.FieldByName('ID_CREDITO').AsString;
    If Not (qyBitTran.FieldByName('IMP_NETO').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('K' )].Value := FormatFloat('###,###,###,##0.00',qyBitTran.FieldByName('IMP_NETO').AsFloat);//qyBitTran.FieldByName('IMP_NETO').AsFloat;
    If Not (qyBitTran.FieldByName('ID_CTO_LIQ').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('L' )].Value := qyBitTran.FieldByName('ID_CTO_LIQ').AsString;
    If Not (qyBitTran.FieldByName('FH_ALTA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('M' )].Value := qyBitTran.FieldByName('FH_ALTA').AsDateTime;//FormatDateTime('DD/MM/YYYY',qyBitTran.FieldByName('FH_ALTA').AsDateTime);
    If Not (qyBitTran.FieldByName('HORA_ALTA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('N' )].Value := qyBitTran.FieldByName('HORA_ALTA').AsString;
    If Not (qyBitTran.FieldByName('SIT_TRANSACCION').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('O' )].Value := qyBitTran.FieldByName('SIT_TRANSACCION').AsString;
    If Not (qyBitTran.FieldByName('CVE_USU_CANC').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('P' )].Value := qyBitTran.FieldByName('CVE_USU_CANC').AsString;
    If Not (qyBitTran.FieldByName('NOM_USU_CANC').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('Q' )].Value := qyBitTran.FieldByName('NOM_USU_CANC').AsString;
    If Not (qyBitTran.FieldByName('FH_CANCELA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('R' )].Value := qyBitTran.FieldByName('FH_CANCELA').AsDateTime;//FormatDateTime('DD/MM/YYYY',qyBitTran.FieldByName('FH_CANCELA').AsDateTime);
    If Not (qyBitTran.FieldByName('HORA_CANC').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('S' )].Value := qyBitTran.FieldByName('HORA_CANC').AsString;
    If Not (qyBitTran.FieldByName('CVE_USU_AUTORIZA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('T' )].Value := qyBitTran.FieldByName('CVE_USU_AUTORIZA').AsString;
    If Not (qyBitTran.FieldByName('FH_AUTORIZA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('U' )].Value := qyBitTran.FieldByName('FH_AUTORIZA').AsDateTime;//FormatDateTime('DD/MM/YYYY',qyBitTran.FieldByName('FH_CANCELA').AsDateTime);
    If Not (qyBitTran.FieldByName('HORA_AUTORIZA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('V' )].Value := qyBitTran.FieldByName('HORA_AUTORIZA').AsString;
    If Not (qyBitTran.FieldByName('SIST_ORIGEN').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('W' )].Value := qyBitTran.FieldByName('SIST_ORIGEN').AsString;
   End;
end;

procedure TQrBitTran.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
    qyBitTran.First;
 If (vgB_SALIDA_EXCEL) Then
      Begin
      vgExcelApp.Cells[1,ColumnXlS('A' )].Value := 'BANCO INTERACCIONES, S.A.';
      vgExcelApp.Cells[2,ColumnXlS('A' )].Value := 'Bitácora de Transacciones';
      vgExcelApp.Cells[3,ColumnXlS('A' )].Value := 'Fecha del '+vgfinicial+' al '+vgffinal;
                                                                                           
      vgnRowExcel := 6;
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('A' )].Value := 'TITULAR';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('B' )].Value := 'NOM TITULAR';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('C' )].Value := 'USUARIO';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('D' )].Value := 'NOMBRE';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('E' )].Value := 'CVE OPERACIÓN';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('F' )].Value := 'DESCRIPCIÓN';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('G' )].Value := 'TX NOTA';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('H' )].Value := 'TRANSACCION';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('I' )].Value := 'CONTRATO';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('J' )].Value := 'CREDITO';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('K' )].Value := 'IMPORTE';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('L' )].Value := 'CONTRATO LIQ';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('M' )].Value := 'F. ALTA';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('N' )].Value := 'HR. ALTA';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('O' )].Value := 'SITUACIÓN';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('P' )].Value := 'USUARIO CANC';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('Q' )].Value := 'NOM USU CANC';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('R' )].Value := 'F. CANCELA';  
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('S' )].Value := 'HR. CANCELA';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('T' )].Value := 'USU. AUTORIZA';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('U' )].Value := 'F. AUTORIZA';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('V' )].Value := 'HR. AUTORIZA';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('W' )].Value := 'SISTEMA';


      vgExcelApp.Range['A1:A4'].Font.Bold := True;
      vgExcelApp.Range['A1:A4'].Font.Name := 'Verdana';
      vgExcelApp.Range['A1:A4'].Font.Size := 8;

      vgExcelApp.Range['A6:Z6'].Font.Bold := True;
      vgExcelApp.Range['A6:Z6'].VerticalAlignment   := xlVAlignCenter;
      vgExcelApp.Range['A6:Z6'].HorizontalAlignment := xlHAlignCenter;
      vgExcelApp.Range['A6:Z6'].Wraptext := True;
      vgExcelApp.Range['A6:Z6'].RowHeight := 24.75; // La medida esta en Pixeles
      vgExcelApp.Range['A6:Z6'].ColumnWidth := 15.14; // La medida esta en Pixeles

      vgExcelApp.Range['A6:Z65536'].Font.Name := 'Verdana';
      vgExcelApp.Range['A6:Z65536'].Font.Size := 8;

      vgExcelApp.Range['M7:N65536'].HorizontalAlignment := xlHAlignCenter;
      vgExcelApp.Range['O7:L65536'].HorizontalAlignment := xlHAlignCenter;
      vgExcelApp.Range['R7:Q65536'].HorizontalAlignment := xlHAlignCenter;

//      vgExcelApp.Range['H7:H65536'].Style := 'Currency';
      vgExcelApp.Range['L7:K65536'].NumberFormat := '@';

      End;
end;

End.
