unit IntMQrFmt8FIRA;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview,
  IntGenCre;

const
  CFORMAT_FECHA_FIRA = 'DD/MMM/YYYY';
  CFORMAT_PCT_FIRA = '%8.2n';

type
  TQrFmt8FIRA = class(TQuickRep)
    qyProxEmi: TQuery;
    PageHeaderBand1: TQRBand;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRBand2: TQRBand;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRMemo3: TQRMemo;
    qrlblNOMBRE_ACREDITADO1: TQRLabel;
    qrlblID_CONTROL_EXT: TQRLabel;
    qrlblDESC_SEGURO: TQRLabel;
    qrlblDESC_CON_INV: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    qrlblCVE_SITUACION_FI_VP1: TQRLabel;
    qrlblCVE_SITUACION_FI_VA1: TQRLabel;
    QRShape6: TQRShape;
    QRMemo7: TQRMemo;
    qrlblCVE_SITUACION_FI_DP1: TQRLabel;
    qrlblCVE_SITUACION_FI_EX1: TQRLabel;
    qrlblCVE_SITUACION_FI_JU1: TQRLabel;
    qrlblCVE_SITUACION_FI_IN1: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    qrlblCVE_CAUS_PAG: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape7: TQRShape;
    QRMemo4: TQRMemo;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRMemo5: TQRMemo;
    qrlblF1_RECUPERA: TQRLabel;
    qrlblIMP1_RECUPERA: TQRLabel;
    qrlblF2_RECUPERA: TQRLabel;
    qrlblIMP2_RECUPERA: TQRLabel;
    QRLabel32: TQRLabel;
    qrlblF_AUTORIZA: TQRLabel;
    qrlblNOMBRE_ACREDITADO2: TQRLabel;
    qrlblIMP_CREDITO: TQRLabel;
    qrlblIMP_AVALES: TQRLabel;
    qrlblPCT_GTIA_FEGA_NO: TQRLabel;
    qrlblIMP_SOLICITAR: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    qrlblTXT_UN: TQRLabel;
    QRLabel49: TQRLabel;
    qrlblMONEDA_PESOS: TQRLabel;
    QRLabel51: TQRLabel;
    qrlblCVE_SEGURO: TQRLabel;
    QRLabel53: TQRLabel;
    qrlblCVE_CONT_INV: TQRLabel;
    qrlblMONEDA_DOLAR: TQRLabel;
    qrlblCVE_SITUACION_FI_VP: TQRLabel;
    qrlblCVE_SITUACION_FI_DP: TQRLabel;
    qrlblCVE_SITUACION_FI_JU: TQRLabel;
    qrlblCVE_SITUACION_FI_VA: TQRLabel;
    qrlblCVE_SITUACION_FI_EX: TQRLabel;
    qrlblCVE_SITUACION_FI_IN: TQRLabel;
    qrlblF_VENCIMIENTO1: TQRLabel;
    qrlblF_VENCIMIENTO2: TQRLabel;
    qrmemDESC_CAUS_PAG: TQRMemo;
    QRLabel3: TQRLabel;
    qrMemCancelado: TQRMemo;
  private
  public
    function FormaQuery(pID_SOLICITUD : Integer) :String;
  end;

var
  QrFmt8FIRA: TQrFmt8FIRA;

procedure Formato8FIRA( pApli : TInterApli; pID_SOLICITUD : Integer );

Implementation
{$R *.DFM}

procedure Formato8FIRA( pApli : TInterApli; pID_SOLICITUD : Integer );
var  Qry         : TQuery;
     QrFmt8FIRA  : TQrFmt8FIRA;
     Preview     : TIntQRPreview;
begin
 QrFmt8FIRA  := TQrFmt8FIRA.Create(Nil);
 Preview     := TIntQRPreview.CreatePreview(Application, QrFmt8FIRA);
 Qry := TQuery.Create(Nil);

 If Assigned(Qry) Then
  With (Qry) Do
   Try
    DatabaseName := pApli.DatabaseName;
    SessionName := pApli.SessionName;

    SQL.Clear;
    SQL.Add( QrFmt8FIRA.FormaQuery(pID_SOLICITUD) );
    Open;

    QrFmt8FIRA.qrlblCVE_CAUS_PAG.Caption       := FieldByName('CVE_CAUS_PAG').AsString;
    QrFmt8FIRA.qrmemDESC_CAUS_PAG.Lines.Clear;
    QrFmt8FIRA.qrmemDESC_CAUS_PAG.Lines.Add(FieldByName('DESC_CAUS_PAG').AsString);

    QrFmt8FIRA.qrlblNOMBRE_ACREDITADO1.Caption := FieldByName('NOMBRE_ACREDITADO').AsString;
    QrFmt8FIRA.qrlblNOMBRE_ACREDITADO2.Caption := FieldByName('NOMBRE_ACREDITADO').AsString;
    QrFmt8FIRA.qrlblF_VENCIMIENTO1.Caption     := FieldByName('F_VENCIMIENTO').AsString;
    QrFmt8FIRA.qrlblF_VENCIMIENTO2.Caption     := FieldByName('F_VENCIMIENTO').AsString;
    QrFmt8FIRA.qrlblID_CONTROL_EXT.Caption     := FieldByName('ID_CONTROL_EXT').AsString;
    QrFmt8FIRA.qrlblIMP_CREDITO.Caption        := Format(CFORMAT_DINERO, [FieldByName('IMP_CREDITO').AsFloat]);
    QrFmt8FIRA.qrlblDESC_SEGURO.Caption        := FieldByName('DESC_SEGURO').AsString;
    QrFmt8FIRA.qrlblDESC_CON_INV.Caption       := FieldByName('DESC_CON_INV').AsString;
    QrFmt8FIRA.qrlblCVE_SEGURO.Caption         := FieldByName('CVE_SEGURO').AsString;
    QrFmt8FIRA.qrlblCVE_CONT_INV.Caption       := FieldByName('CVE_CONT_INV').AsString;
    QrFmt8FIRA.qrlblTXT_UN.Caption             := FieldByName('TXT_UN').AsString;
    QrFmt8FIRA.qrlblIMP_AVALES.Caption         := Format(CFORMAT_DINERO, [FieldByName('IMP_AVALES').AsFloat]);
    QrFmt8FIRA.qrlblPCT_GTIA_FEGA_NO.Caption   := Format(CFORMAT_PCT_FIRA, [FieldByName('PCT_GTIA_FEGA_NO').AsFloat]) + '%';

    If (FieldByName('SIT_GAR_SOL_FEG').AsString <> CSIT_CA) Then
      QrFmt8FIRA.qrMemCancelado.Lines.Clear;

    If FieldByName('F1_RECUPERA').IsNull Then
      Begin
      QrFmt8FIRA.qrlblF1_RECUPERA.Caption := '';
      QrFmt8FIRA.qrlblIMP1_RECUPERA.Caption := '';
      End
    Else
      Begin
      QrFmt8FIRA.qrlblF1_RECUPERA.Caption := FormatDateTime(CFORMAT_FECHA_FIRA, FieldByName('F1_RECUPERA').AsDateTime);
      QrFmt8FIRA.qrlblIMP1_RECUPERA.Caption := Format(CFORMAT_DINERO, [FieldByName('IMP1_RECUPERA').AsFloat]);
      End;

    If FieldByName('F2_RECUPERA').IsNull Then
      Begin
      QrFmt8FIRA.qrlblF2_RECUPERA.Caption := '';
      QrFmt8FIRA.qrlblIMP2_RECUPERA.Caption := '';
      End
    Else
      Begin
      QrFmt8FIRA.qrlblF2_RECUPERA.Caption := FormatDateTime(CFORMAT_FECHA_FIRA, FieldByName('F2_RECUPERA').AsDateTime);
      QrFmt8FIRA.qrlblIMP2_RECUPERA.Caption := Format(CFORMAT_DINERO, [FieldByName('IMP2_RECUPERA').AsFloat]);
      End;

    If FieldByName('F_AUTORIZA').IsNull Then QrFmt8FIRA.qrlblF_AUTORIZA.Caption := ''
    Else QrFmt8FIRA.qrlblF_AUTORIZA.Caption := FormatDateTime(CFORMAT_FECHA_FIRA, FieldByName('F_AUTORIZA').AsDateTime);

    QrFmt8FIRA.qrlblMONEDA_PESOS.Caption       := FieldByName('MONEDA_PESOS').AsString;
    QrFmt8FIRA.qrlblMONEDA_DOLAR.Caption       := FieldByName('MONEDA_DOLAR').AsString;
    QrFmt8FIRA.qrlblIMP_SOLICITAR.Caption     := Format(CFORMAT_DINERO, [FieldByName('IMP_SOLICITAR').AsFloat]);

    QrFmt8FIRA.qrlblCVE_SITUACION_FI_VP.Caption := '';
    QrFmt8FIRA.qrlblCVE_SITUACION_FI_VA.Caption := '';
    QrFmt8FIRA.qrlblCVE_SITUACION_FI_DP.Caption := '';
    QrFmt8FIRA.qrlblCVE_SITUACION_FI_EX.Caption := '';
    QrFmt8FIRA.qrlblCVE_SITUACION_FI_JU.Caption := '';
    QrFmt8FIRA.qrlblCVE_SITUACION_FI_IN.Caption := '';

    If FieldByName('CVE_SITUACION_FI').AsString = 'VP' Then QrFmt8FIRA.qrlblCVE_SITUACION_FI_VP.Caption := 'X'
    Else If FieldByName('CVE_SITUACION_FI').AsString = 'VA' Then QrFmt8FIRA.qrlblCVE_SITUACION_FI_VA.Caption := 'X'
    Else If FieldByName('CVE_SITUACION_FI').AsString = 'DP' Then QrFmt8FIRA.qrlblCVE_SITUACION_FI_DP.Caption := 'X'
    Else If FieldByName('CVE_SITUACION_FI').AsString = 'EX' Then QrFmt8FIRA.qrlblCVE_SITUACION_FI_EX.Caption := 'X'
    Else If FieldByName('CVE_SITUACION_FI').AsString = 'JU' Then QrFmt8FIRA.qrlblCVE_SITUACION_FI_JU.Caption := 'X'
    Else If FieldByName('CVE_SITUACION_FI').AsString = 'IN' Then QrFmt8FIRA.qrlblCVE_SITUACION_FI_IN.Caption:= 'X';

    QrFmt8FIRA.Preview;
   Finally
    Qry.Free;
   End;

   If Assigned(Preview) Then Preview.Free;
   If Assigned(QrFmt8FIRA) Then QrFmt8FIRA.Free;   
end;

function TQrFmt8FIRA.FormaQuery(pID_SOLICITUD : Integer) :String;
Begin
 Result :=
          'SELECT'+coCRLF+
          '  CGSF.ID_SOLICITUD,'+coCRLF+
          '  CGSF.ID_SOLIC_LIQ,'+coCRLF+
          '  CGSF.ID_CREDITO,'+coCRLF+
          '  CGSF.NUM_PERIODO,'+coCRLF+
          '  CGSF.IMP_SOLICITAR,'+coCRLF+
          '  CGSF.IMP_APLICADO,'+coCRLF+
          '  CGSF.CVE_CAUS_PAG,'+coCRLF+
          '  CGSF.CVE_SEGURO,'+coCRLF+
          '  CGSF.CVE_CONT_INV,'+coCRLF+
          '  CGSF.TXT_UN,'+coCRLF+
          '  CGSF.IMP_PRODUCTOS,'+coCRLF+
          '  CGSF.IMP_SEGUROS,'+coCRLF+
          '  CGSF.IMP_FINCAS,'+coCRLF+
          '  CGSF.IMP_AVALES,'+coCRLF+
          '  CGSF.IMP_GTIA_GRAVAD,'+coCRLF+
          '  CGSF.IMP_OTROS,'+coCRLF+
          '  CGSF.CVE_SITUACION_FI,'+coCRLF+
          '  CGSF.F1_RECUPERA,'+coCRLF+
          '  CGSF.IMP1_RECUPERA,'+coCRLF+
          '  CGSF.F2_RECUPERA,'+coCRLF+
          '  CGSF.IMP2_RECUPERA,'+coCRLF+
          '  CGSF.IMP_SDO_VENCIDO,'+coCRLF+
          '  CGSF.SIT_GAR_SOL_FEG,'+coCRLF+
          '  CGSF.F_ALTA,'+coCRLF+
          '  CGSF.CVE_USU_ALTA,'+coCRLF+
          '  CGSF.F_MODIFICA,'+coCRLF+
          '  CGSF.CVE_USU_MODIFICA,'+coCRLF+
          '  DECODE(P.CVE_PER_JURIDICA, ''PF'', PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO || '' '' ||PF.NOMBRE_PERSONA, PM.NOM_RAZON_SOCIAL)  AS NOMBRE_ACREDITADO,'+coCRLF+
          '  CC.F_VENCIMIENTO,'+coCRLF+
          '  CC.IMP_CREDITO,'+coCRLF+
          '  CC.F_AUTORIZA,'+coCRLF+
          '  CC.ID_CONTROL_EXT,'+coCRLF+
          '  CFCP.DESC_CAUS_PAG,'+coCRLF+
          '  CFCS.DESC_SEGURO,'+coCRLF+
          '  CFCI.DESC_CON_INV,'+coCRLF+
          '  CGSF.PCT_GTIA_FEGA_NO,'+coCRLF+
          '  DECODE(CTO.CVE_MONEDA,484,''X'','' '') AS MONEDA_PESOS,'+coCRLF+
          '  DECODE(CTO.CVE_MONEDA,840,''X'','' '') AS MONEDA_DOLAR'+coCRLF+
          'FROM CR_GA_SOL_FEGA CGSF,'+coCRLF+
          '     CR_CREDITO CC,'+coCRLF+
          '     CONTRATO CTO,'+coCRLF+
          '     PERSONA P,'+coCRLF+
          '     PERSONA_FISICA PF,'+coCRLF+
          '     PERSONA_MORAL PM,'+coCRLF+
          '     CR_FIRA_CAUS_PAG CFCP,'+coCRLF+
          '     CR_FIRA_CAUS_SEG CFCS,'+coCRLF+
          '     CR_FIRA_CON_INV CFCI'+coCRLF+
          'WHERE CGSF.ID_SOLICITUD = '+IntToStr(pID_SOLICITUD)+coCRLF+
          ' AND CC.ID_CREDITO = CGSF.ID_CREDITO'+coCRLF+
          ' AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
          ' AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
          ' AND PM.ID_PERSONA (+)= P.ID_PERSONA'+coCRLF+
          ' AND PF.ID_PERSONA (+)= P.ID_PERSONA'+coCRLF+
          ' AND CFCP.CVE_CAUS_PAG (+)= CGSF.CVE_CAUS_PAG'+coCRLF+
          ' AND CFCS.CVE_SEGURO (+)= CGSF.CVE_SEGURO'+coCRLF+
          ' AND CFCI.CVE_CONT_INV (+)= CGSF.CVE_CONT_INV'+coCRLF;
End;

End.
