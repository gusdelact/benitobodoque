unit IntMQrBitCh;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, Dialogs, IntGenCre, UnSQL2;
type
  TQrBitCh = class(TQuickRep)
    QyBitCh: TQuery;
    QRBand4: TQRBand;
    qrshpDiferencia: TQRShape;
    qrshpSaldoFinal: TQRShape;
    qrshpInteresesDevengados: TQRShape;
    qrshpAbonos: TQRShape;
    qrshpCargos: TQRShape;
    qrshpSaldoInicial: TQRShape;
    qrshpNombre: TQRShape;
    qrshpContrato: TQRShape;
    qrlblContrato: TQRLabel;
    qrlblNombre: TQRLabel;
    qrlblSaldoInicial: TQRLabel;
    qrlblCargos: TQRLabel;
    qrlblAbonos: TQRLabel;
    qrlblInteresesDevengados: TQRLabel;
    qrlblSaldoFinal: TQRLabel;
    qrlblDiferencia: TQRLabel;
    qrGrpNOMBRE: TQRGroup;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRBand1: TQRBand;
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRShape7: TQRShape;
    QRLabel11: TQRLabel;
    qrGrpChequera: TQRGroup;
    QyBitChCVE_USUARIO: TStringField;
    QyBitChFH_REGISTRO: TDateTimeField;
    QyBitChMOVTO: TMemoField;
    QyBitChK_ACREDITADO: TStringField;
    QyBitChK_CUENTABANCO: TStringField;
    QyBitChID_ACREDITADO: TMemoField;
    QyBitChCVE_TIPO_ACRED: TMemoField;
    QyBitChCVE_EMISOR_NAFIN: TMemoField;
    QyBitChCVE_TIPO_CHEQ: TMemoField;
    QyBitChID_CREDITO: TMemoField;
    QyBitChID_BANCO_CHQRA: TMemoField;
    QyBitChCUENTA_BANCO: TMemoField;
    QyBitChCVE_TIP_OPE_CHQ: TMemoField;
    QyBitChB_PREDETERMINADA: TMemoField;
    QyBitChSIT_CHEQUERA: TMemoField;
    QyBitChCVE_MONEDA: TMemoField;
    QyBitChB_REL_CREDITO: TMemoField;
    QyBitChB_CTA_TERCEROS: TMemoField;
    QyBitChID_TITULAR: TMemoField;
    QyBitChSECUENCIA: TMemoField;
    QyBitChNOM_ACRED_REG: TStringField;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
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
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel5: TQRLabel;
    QRShape4: TQRShape;
    QRDBText16: TQRDBText;
    QRLabel7: TQRLabel;
    QRShape6: TQRShape;
    QRDBText17: TQRDBText;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape9: TQRShape;
  private
  public
    Function FormaQuery(sIdAcreditado, sIdCredito, sCuentaBanco, sTipoAcred,
                        sTipoCheqra :String) : String;
  end;

var
  QrBitCh: TQrBitCh;

Procedure RepBitacoraCheq(sIdAcreditado, sNomAcreditado, sIdCredito, sCuentaBanco,
                          sTipoAcred, sTipoCheqra :String;
                          pAPli     : TInterApli;
                          pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepBitacoraCheq(sIdAcreditado, sNomAcreditado, sIdCredito, sCuentaBanco,
                          sTipoAcred, sTipoCheqra :String;
                          pAPli     : TInterApli;
                          pPreview  : Boolean);
Var
    QrBitCh     : TQrBitCh;
    Preview     : TIntQRPreview;
Begin
    QrBitCh:=TQrBitCh.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrBitCh);
    Try
        QrBitCh.QyBitCh.DatabaseName := pApli.DataBaseName;
        QrBitCh.QyBitCh.SessionName := pApli.SessionName;

        QrBitCh.QyBitCh.Active:=False;
        QrBitCh.QyBitCh.SQL.Text:= QrBitCh.FormaQuery(sIdAcreditado, sIdCredito, sCuentaBanco, sTipoAcred,
                                                      sTipoCheqra);

        QrBitCh.QRInterEncabezado1.Apli := pApli;
        QrBitCh.QRInterEncabezado1.Titulo1:='Reporte de Actualizaciones a Chequeras por Acreditado';
        QrBitCh.QRInterEncabezado1.Titulo2:= FormatDateTime('"MÉXICO D.F. A " dd " DE " mmmm " DEL " yyyy',
                                                pAPli.DameFechaEmpresaDia('D000'));

//        QrBitCh.QyBitCh.sql.savetofile('C:\SQL.TXT');

        QrBitCh.QyBitCh.Active:=True;

        If QrBitCh.QyBitCh.IsEmpty Then
         ShowMessage('No hay datos que mostrar')
        Else
         Begin
            If pPreview Then
                QrBitCh.Preview
            Else
                QrBitCh.Print;
         End;

    Finally
        QrBitCh.free;
        If Assigned(Preview) Then Preview.Free;
    End;
End;

Function TQrBitCh.FormaQuery(sIdAcreditado, sIdCredito, sCuentaBanco, sTipoAcred,
                             sTipoCheqra :String) : String;
Var
  sSQL : String;
Begin
  sSQL := ' SELECT CVE_USUARIO, FH_REGISTRO, SUBSTR(DESC_MODIF, 2, INSTR(DESC_MODIF,'']'',1,1)-2) MOVTO, ACRE.NOM_ACRED_REG, ' +coCRLF+
          ' (CASE WHEN INSTR(CAMPOSLLAVE, ''Id_Acreditado'')>0 THEN ' +coCRLF+
	  '            SUBSTR(CAMPOSLLAVE, (INSTR(CAMPOSLLAVE,''Id_Acreditado'')+14), (INSTR(CAMPOSLLAVE,'' '',INSTR(CAMPOSLLAVE,''Id_Acreditado''),1))-(INSTR(CAMPOSLLAVE,''Id_Acreditado'')+14)) ELSE '''' END) K_ACREDITADO, ' +coCRLF+
          ' (CASE WHEN INSTR(CAMPOSLLAVE, ''Cuenta_Banco'')>0 THEN ' +coCRLF+
	  '            SUBSTR(CAMPOSLLAVE, (INSTR(CAMPOSLLAVE,''Cuenta_Banco'')+13), (INSTR(CAMPOSLLAVE,'' '',INSTR(CAMPOSLLAVE,''Cuenta_Banco''),1))-(INSTR(CAMPOSLLAVE,''Cuenta_Banco'')+13)) ELSE '''' END) K_CUENTABANCO, ' +coCRLF+
          ' (CASE WHEN INSTR(DESC_MODIF, ''Id_Acreditado'')>0 THEN ' +coCRLF+
	  '            SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,''Id_Acreditado'')+14), (INSTR(DESC_MODIF,'']'',INSTR(DESC_MODIF,''Id_Acreditado''),1))-(INSTR(DESC_MODIF,''Id_Acreditado'')+14)) ELSE '''' END) ID_ACREDITADO, ' +coCRLF+
          ' (CASE WHEN INSTR(DESC_MODIF, ''Cve_Tipo_Acred'')>0 THEN ' +coCRLF+
	  '            SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,''Cve_Tipo_Acred'')+15), (INSTR(DESC_MODIF,'']'',INSTR(DESC_MODIF,''Cve_Tipo_Acred''),1))-(INSTR(DESC_MODIF,''Cve_Tipo_Acred'')+15)) ELSE '''' END) AS CVE_TIPO_ACRED, ' +coCRLF+
          ' (CASE WHEN INSTR(DESC_MODIF, ''Cve_Emisor_Nafin'')>0 THEN ' +coCRLF+
	  '            SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,''Cve_Emisor_Nafin'')+17), (INSTR(DESC_MODIF,'']'',INSTR(DESC_MODIF,''Cve_Emisor_Nafin''),1))-(INSTR(DESC_MODIF,''Cve_Emisor_Nafin'')+17)) ELSE '''' END) AS CVE_EMISOR_NAFIN, ' +coCRLF+
          ' (CASE WHEN INSTR(DESC_MODIF, ''Cve_Tipo_Cheq'')>0 THEN ' +coCRLF+
	  '            SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,''Cve_Tipo_Cheq'')+14), (INSTR(DESC_MODIF,'']'',INSTR(DESC_MODIF,''Cve_Tipo_Cheq''),1))-(INSTR(DESC_MODIF,''Cve_Tipo_Cheq'')+14)) ELSE '''' END) AS CVE_TIPO_CHEQ, ' +coCRLF+
          ' (CASE WHEN INSTR(DESC_MODIF, ''Id_Credito'')>0 THEN ' +coCRLF+
	  '            SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,''Id_Credito'')+11), (INSTR(DESC_MODIF,'']'',INSTR(DESC_MODIF,''Id_Credito''),1))-(INSTR(DESC_MODIF,''Id_Credito'')+11)) ELSE '''' END) AS ID_CREDITO, ' +coCRLF+
          ' (CASE WHEN INSTR(DESC_MODIF, ''Id_Banco_Chqra'')>0 THEN ' +coCRLF+
	  '            SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,''Id_Banco_Chqra'')+15), (INSTR(DESC_MODIF,'']'',INSTR(DESC_MODIF,''Id_Banco_Chqra''),1))-(INSTR(DESC_MODIF,''Id_Banco_Chqra'')+15)) ELSE '''' END) AS ID_BANCO_CHQRA, ' +coCRLF+
          ' (CASE WHEN INSTR(DESC_MODIF, ''Cuenta_Banco'')>0 THEN ' +coCRLF+
	  '            SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,''Cuenta_Banco'')+13), (INSTR(DESC_MODIF,'']'',INSTR(DESC_MODIF,''Cuenta_Banco''),1))-(INSTR(DESC_MODIF,''Cuenta_Banco'')+13)) ELSE '''' END) AS CUENTA_BANCO, ' +coCRLF+
          ' (CASE WHEN INSTR(DESC_MODIF, ''Cve_Tip_Ope_Chq'')>0 THEN ' +coCRLF+
	  '            SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,''Cve_Tip_Ope_Chq'')+16), (INSTR(DESC_MODIF,'']'',INSTR(DESC_MODIF,''Cve_Tip_Ope_Chq''),1))-(INSTR(DESC_MODIF,''Cve_Tip_Ope_Chq'')+16)) ELSE '''' END) AS CVE_TIP_OPE_CHQ, ' +coCRLF+
          ' (CASE WHEN INSTR(DESC_MODIF, ''B_Predeterminada'')>0 THEN ' +coCRLF+
	  '            SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,''B_Predeterminada'')+17), (INSTR(DESC_MODIF,'']'',INSTR(DESC_MODIF,''B_Predeterminada''),1))-(INSTR(DESC_MODIF,''B_Predeterminada'')+17)) ELSE '''' END) AS B_PREDETERMINADA, ' +coCRLF+
          ' (CASE WHEN INSTR(DESC_MODIF, ''Sit_Chequera'')>0 THEN ' +coCRLF+
	  '            SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,''Sit_Chequera'')+13), (INSTR(DESC_MODIF,'']'',INSTR(DESC_MODIF,''Sit_Chequera''),1))-(INSTR(DESC_MODIF,''Sit_Chequera'')+13)) ELSE '''' END) AS SIT_CHEQUERA, ' +coCRLF+
          ' (CASE WHEN INSTR(DESC_MODIF, ''Cve_Moneda'')>0 THEN ' +coCRLF+
	  '            SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,''Cve_Moneda'')+11), (INSTR(DESC_MODIF,'']'',INSTR(DESC_MODIF,''Cve_Moneda''),1))-(INSTR(DESC_MODIF,''Cve_Moneda'')+11)) ELSE '''' END) AS CVE_MONEDA, ' +coCRLF+
          ' (CASE WHEN INSTR(DESC_MODIF, ''B_Rel_Credito'')>0 THEN ' +coCRLF+
	  '            SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,''B_Rel_Credito'')+14), (INSTR(DESC_MODIF,'']'',INSTR(DESC_MODIF,''B_Rel_Credito''),1))-(INSTR(DESC_MODIF,''B_Rel_Credito'')+14)) ELSE '''' END) AS B_REL_CREDITO, ' +coCRLF+
          ' (CASE WHEN INSTR(DESC_MODIF, ''B_Cta_Terceros'')>0 THEN ' +coCRLF+
	  '            SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,''B_Cta_Terceros'')+15), (INSTR(DESC_MODIF,'']'',INSTR(DESC_MODIF,''B_Cta_Terceros''),1))-(INSTR(DESC_MODIF,''B_Cta_Terceros'')+15)) ELSE '''' END) AS B_CTA_TERCEROS, ' +coCRLF+
          ' (CASE WHEN INSTR(DESC_MODIF, ''Id_Titular'')>0 THEN ' +coCRLF+
	  '            SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,''Id_Titular'')+11), (INSTR(DESC_MODIF,'']'',INSTR(DESC_MODIF,''Id_Titular''),1))-(INSTR(DESC_MODIF,''Id_Titular'')+11)) ELSE '''' END) AS ID_TITULAR, ' +coCRLF+
          ' (CASE WHEN INSTR(DESC_MODIF, ''Secuencia'')>0 THEN ' +coCRLF+
	  '            SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,''Secuencia'')+10), (INSTR(DESC_MODIF,'']'',INSTR(DESC_MODIF,''Secuencia''),1))-(INSTR(DESC_MODIF,''Secuencia'')+10)) ELSE '''' END) AS SECUENCIA ' +coCRLF+
          ' FROM CR_BITACORA_UPD BIT, CR_ACREDITADO ACRE ' +coCRLF+
          ' WHERE 1 = 1 ' +coCRLF+
          '  AND (CASE WHEN INSTR(CAMPOSLLAVE, ''Id_Acreditado'')>0 THEN  SUBSTR(CAMPOSLLAVE, (INSTR(CAMPOSLLAVE,''Id_Acreditado'')+14), ' +coCRLF+
	  '		     (INSTR(CAMPOSLLAVE,'' '',INSTR(CAMPOSLLAVE,''Id_Acreditado''),1))-(INSTR(CAMPOSLLAVE,''Id_Acreditado'')+14)) ' +coCRLF+
	  '	       ELSE '''' END) = ACRE.ID_ACREDITADO ' +coCRLF+
          '  AND NOM_TABLA = ''CR_CRED_CHEQ'' ' +coCRLF;
  If  sIdAcreditado <> '' then
      sSql := sSql + '  AND CAMPOSLLAVE like ''%Id_Acreditado=' + sIdAcreditado + '%'' ' +coCRLF;
  If  sTipoAcred <> '' then
      sSql := sSql + '  AND CAMPOSLLAVE like ''%Cve_Tipo_Acred=' + sTipoAcred + '%'' ' +coCRLF;
  If  sTipoCheqra <> '' then
      sSql := sSql + '  AND CAMPOSLLAVE like ''%Cve_Tipo_Cheq=' + sTipoCheqra +'%'' ' +coCRLF;
  If  sIdCredito <> '' then
      sSql := sSql + '  AND CAMPOSLLAVE like ''%Id_Credito=' + sIdCredito + '%'' ' +coCRLF;
  If  sCuentaBanco <> '' then
      sSql := sSql + '  AND CAMPOSLLAVE like ''%Cuenta_Banco=' + sCuentaBanco + '%'' ' +coCRLF;

  sSql := sSql + ' ORDER BY K_ACREDITADO, K_CUENTABANCO, ID_BITACORA ';

  Result:= sSQL;
End;

End.
