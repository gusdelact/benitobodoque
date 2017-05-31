unit IntMQrFmt9FIRA;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview,

  IntGenCre;

type
  TQrFmt9FIRA = class(TQuickRep)
    qyProxEmi: TQuery;
    PageHeaderBand1: TQRBand;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRBand2: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRMemo4: TQRMemo;
    qrlblIMP_PRODUCTOS: TQRLabel;
    qrlblIMP_SEGUROS: TQRLabel;
    qrlblIMP_FINCAS: TQRLabel;
    qrlblIMP_AVALES: TQRLabel;
    qrlblIMP_GTIA_GRAVAD: TQRLabel;
    qrlblIMP_OTROS: TQRLabel;
    qrlblIMPCAUSCOB: TQRLabel;
    qrlblIMPAPLCOB: TQRLabel;
    qrlblIMPSALDOCOB: TQRLabel;
    qrlblIMPCAUSGST: TQRLabel;
    qrlblIMPAPLGST: TQRLabel;
    qrlblIMPSALDOGST: TQRLabel;
    qrlblIMPCAUSCOS: TQRLabel;
    qrlblIMPAPLCOS: TQRLabel;
    qrlblIMPSALDOCOS: TQRLabel;
    qrlblIMPCAUSMOR: TQRLabel;
    qrlblIMPAPLMOR: TQRLabel;
    qrlblIMPSALDOMOR: TQRLabel;
    QRShape2: TQRShape;
    QRLabel29: TQRLabel;
    qrlblNOMBRE_ACREDITADO: TQRLabel;
    qrlblID_CONTROL_EXT: TQRLabel;
    QRLabel32: TQRLabel;
    qrlblIMPCAUSVEN: TQRLabel;
    qrlblIMPAPLVEN: TQRLabel;
    qrlblIMPSALDOVEN: TQRLabel;
    qrlblIMPCAUSVIG: TQRLabel;
    qrlblIMPAPLVIG: TQRLabel;
    qrlblIMPSALDOVIG: TQRLabel;
    qrlblIMPCAUSADC: TQRLabel;
    qrlblIMPAPLADC: TQRLabel;
    qrlblIMPSALDOADC: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRMemo5: TQRMemo;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    qrlblDia: TQRLabel;
    qrlblMes: TQRLabel;
    qrlblAnio: TQRLabel;
    QRLabel47: TQRLabel;
    qrlblSUBTOTALCAUS: TQRLabel;
    QRLabel49: TQRLabel;
    qrlblSUBTOTALAPL: TQRLabel;
    qrlblSUBTOTALSDO: TQRLabel;
    qrlblMONEDA_PESOS: TQRLabel;
    qrlblIMP_TOTAL: TQRLabel;
    qrlblIMP_TOTAL2: TQRLabel;
    QRLabel55: TQRLabel;
    qrlblMONEDA_DOLAR: TQRLabel;
    qrMemCancelado: TQRMemo;
  private
  public
    function FormaQuery(pID_SOLICITUD : Integer) :String;
    function FormaQuery1(pID_SOLICITUD : Integer) :String;
  end;

var
  QrFmt9FIRA: TQrFmt9FIRA;

procedure Formato9FIRA( pApli : TInterApli; pID_SOLICITUD : Integer );

Implementation
{$R *.DFM}

procedure Formato9FIRA( pApli : TInterApli; pID_SOLICITUD : Integer );
var  Qry,
     QryAplicado : TQuery;
     QrFmt9FIRA  : TQrFmt9FIRA;
     Preview     : TIntQRPreview;
     vldFecha    : TDateTime;
     vlIMPAPLCOB, vlIMPAPLGST, vlIMPAPLCOS, vlIMPAPLMOR,
     vlIMPAPLVEN, vlIMPAPLVIG, vlIMPAPLADC, vldSUM_IMP_NETO : Double;
     vlstrCVE_ACCESORIO : String;
begin
 QrFmt9FIRA     := TQrFmt9FIRA.Create(Nil);
 Preview        := TIntQRPreview.CreatePreview(Application, QrFmt9FIRA);
 Qry            := TQuery.Create(Nil);
 QryAplicado    := TQuery.Create(Nil);

 If Assigned(Qry) And Assigned(QryAplicado) Then
  With (Qry) Do
   Try
    DatabaseName := pApli.DatabaseName;
    SessionName := pApli.SessionName;

    SQL.Clear;
    SQL.Add( QrFmt9FIRA.FormaQuery(pID_SOLICITUD) );
    Open;


    vlIMPAPLCOB := 0;    vlIMPAPLGST := 0;    vlIMPAPLCOS := 0;
    vlIMPAPLMOR := 0;    vlIMPAPLVEN := 0;    vlIMPAPLVIG := 0;
    vlIMPAPLADC := 0;

    QryAplicado.DatabaseName := pApli.DatabaseName;
    QryAplicado.SessionName := pApli.SessionName;
    QryAplicado.SQL.Clear;
    QryAplicado.SQL.Add( QrFmt9FIRA.FormaQuery1(FieldByName('ID_SOLIC_LIQ').AsInteger) );
    QryAplicado.Open;

    While Not QryAplicado.Eof Do
     Begin
      vlstrCVE_ACCESORIO := QryAplicado.FieldByName('CVE_ACCESORIO').AsString;
      vldSUM_IMP_NETO := QryAplicado.FieldByName('SUM_IMP_NETO').AsFloat;

      If QryAplicado.FieldByName('CVE_CONCEPTO').AsString  = 'IMPMOR' Then
        vlIMPAPLMOR := vlIMPAPLMOR + vldSUM_IMP_NETO
      Else
       Begin
             If (vlstrCVE_ACCESORIO = 'CP') Then vlIMPAPLADC := vlIMPAPLADC + vldSUM_IMP_NETO // Capital
        Else If (vlstrCVE_ACCESORIO = 'FN') Then vlIMPAPLADC := vlIMPAPLADC + vldSUM_IMP_NETO // Financiamiento
        Else If (vlstrCVE_ACCESORIO = 'IN') Then vlIMPAPLVEN := vlIMPAPLVEN + vldSUM_IMP_NETO // Interes
        Else If (vlstrCVE_ACCESORIO = 'CN') Then vlIMPAPLCOS := vlIMPAPLCOS + vldSUM_IMP_NETO // Comisión
       End;
      ;
      QryAplicado.Next;
     End;

    QrFmt9FIRA.qrlblID_CONTROL_EXT.Caption    := FieldByName('ID_CONTROL_EXT').AsString;
    QrFmt9FIRA.qrlblNOMBRE_ACREDITADO.Caption := FieldByName('NOMBRE_ACREDITADO').AsString;
    QrFmt9FIRA.qrlblMONEDA_PESOS.Caption      := FieldByName('MONEDA_PESOS').AsString;
    QrFmt9FIRA.qrlblMONEDA_DOLAR.Caption      := FieldByName('MONEDA_DOLAR').AsString;
    QrFmt9FIRA.qrlblIMP_PRODUCTOS.Caption     := Format(CFORMAT_DINERO,[FieldByName('IMP_PRODUCTOS').AsFloat]);
    QrFmt9FIRA.qrlblIMP_SEGUROS.Caption       := Format(CFORMAT_DINERO,[FieldByName('IMP_SEGUROS').AsFloat]);
    QrFmt9FIRA.qrlblIMP_FINCAS.Caption        := Format(CFORMAT_DINERO,[FieldByName('IMP_FINCAS').AsFloat]);
    QrFmt9FIRA.qrlblIMP_AVALES.Caption        := Format(CFORMAT_DINERO,[FieldByName('IMP_AVALES').AsFloat]);
    QrFmt9FIRA.qrlblIMP_GTIA_GRAVAD.Caption   := Format(CFORMAT_DINERO,[FieldByName('IMP_GTIA_GRAVAD').AsFloat]);
    QrFmt9FIRA.qrlblIMP_OTROS.Caption         := Format(CFORMAT_DINERO,[FieldByName('IMP_OTROS').AsFloat]);
    QrFmt9FIRA.qrlblIMP_TOTAL.Caption         := Format(CFORMAT_DINERO,[FieldByName('IMP_TOTAL').AsFloat]);

    QrFmt9FIRA.qrlblIMPCAUSCOB.Caption := Format(CFORMAT_DINERO,[FieldByName('IMPCAUSCOB').AsFloat]);
    QrFmt9FIRA.qrlblIMPCAUSGST.Caption := Format(CFORMAT_DINERO,[FieldByName('IMPCAUSGST').AsFloat]);
    QrFmt9FIRA.qrlblIMPCAUSCOS.Caption := Format(CFORMAT_DINERO,[FieldByName('IMPCAUSCOS').AsFloat]);
    QrFmt9FIRA.qrlblIMPCAUSMOR.Caption := Format(CFORMAT_DINERO,[FieldByName('IMPCAUSMOR').AsFloat]);
    QrFmt9FIRA.qrlblIMPCAUSVEN.Caption := Format(CFORMAT_DINERO,[FieldByName('IMPCAUSVEN').AsFloat]);
    QrFmt9FIRA.qrlblIMPCAUSVIG.Caption := Format(CFORMAT_DINERO,[FieldByName('IMPCAUSVIG').AsFloat]);
    QrFmt9FIRA.qrlblIMPCAUSADC.Caption := Format(CFORMAT_DINERO,[FieldByName('IMPCAUSADC').AsFloat]);

    QrFmt9FIRA.qrlblIMPAPLCOB.Caption  := Format(CFORMAT_DINERO,[vlIMPAPLCOB]);
    QrFmt9FIRA.qrlblIMPAPLGST.Caption  := Format(CFORMAT_DINERO,[vlIMPAPLGST]);
    QrFmt9FIRA.qrlblIMPAPLCOS.Caption  := Format(CFORMAT_DINERO,[vlIMPAPLCOS]);
    QrFmt9FIRA.qrlblIMPAPLMOR.Caption  := Format(CFORMAT_DINERO,[vlIMPAPLMOR]);
    QrFmt9FIRA.qrlblIMPAPLVEN.Caption  := Format(CFORMAT_DINERO,[vlIMPAPLVEN]);
    QrFmt9FIRA.qrlblIMPAPLVIG.Caption  := Format(CFORMAT_DINERO,[vlIMPAPLVIG]);
    QrFmt9FIRA.qrlblIMPAPLADC.Caption  := Format(CFORMAT_DINERO,[vlIMPAPLADC]);

    QrFmt9FIRA.qrlblIMPSALDOCOB.Caption := Format(CFORMAT_DINERO,[FieldByName('IMPCAUSCOB').AsFloat - vlIMPAPLCOB]);
    QrFmt9FIRA.qrlblIMPSALDOGST.Caption := Format(CFORMAT_DINERO,[FieldByName('IMPCAUSGST').AsFloat - vlIMPAPLGST]);
    QrFmt9FIRA.qrlblIMPSALDOCOS.Caption := Format(CFORMAT_DINERO,[vlIMPAPLCOS - vlIMPAPLCOS]);
    QrFmt9FIRA.qrlblIMPSALDOMOR.Caption := Format(CFORMAT_DINERO,[FieldByName('IMPCAUSMOR').AsFloat - vlIMPAPLMOR]);
    QrFmt9FIRA.qrlblIMPSALDOVEN.Caption := Format(CFORMAT_DINERO,[FieldByName('IMPCAUSVEN').AsFloat - vlIMPAPLVEN]);
    QrFmt9FIRA.qrlblIMPSALDOVIG.Caption := Format(CFORMAT_DINERO,[FieldByName('IMPCAUSVIG').AsFloat - vlIMPAPLVIG]);
    QrFmt9FIRA.qrlblIMPSALDOADC.Caption := Format(CFORMAT_DINERO,[FieldByName('IMPCAUSADC').AsFloat - vlIMPAPLADC]);

    QrFmt9FIRA.qrlblSUBTOTALCAUS.Caption := Format(CFORMAT_DINERO,[ FieldByName('IMPCAUSCOB').AsFloat +
                                                                    FieldByName('IMPCAUSGST').AsFloat +
                                                                    FieldByName('IMPCAUSCOS').AsFloat +
                                                                    FieldByName('IMPCAUSMOR').AsFloat +
                                                                    FieldByName('IMPCAUSVEN').AsFloat +
                                                                    FieldByName('IMPCAUSVIG').AsFloat +
                                                                    FieldByName('IMPCAUSADC').AsFloat]) ;

    QrFmt9FIRA.qrlblSUBTOTALAPL.Caption := Format(CFORMAT_DINERO,[ vlIMPAPLCOB +
                                                                   vlIMPAPLGST +
                                                                   vlIMPAPLCOS +
                                                                   vlIMPAPLMOR +
                                                                   vlIMPAPLVEN +
                                                                   vlIMPAPLVIG +
                                                                   vlIMPAPLADC ]) ;

    QrFmt9FIRA.qrlblSUBTOTALSDO.Caption := Format(CFORMAT_DINERO,[
                              (FieldByName('IMPCAUSCOB').AsFloat - vlIMPAPLCOB) +
                              (FieldByName('IMPCAUSGST').AsFloat - vlIMPAPLGST) +
                              (FieldByName('IMPCAUSCOS').AsFloat - vlIMPAPLCOS) +
                              (FieldByName('IMPCAUSMOR').AsFloat - vlIMPAPLMOR) +
                              (FieldByName('IMPCAUSVEN').AsFloat - vlIMPAPLVEN) +
                              (FieldByName('IMPCAUSVIG').AsFloat - vlIMPAPLVIG) +
                              (FieldByName('IMPCAUSADC').AsFloat - vlIMPAPLADC) ]) ;

    QrFmt9FIRA.qrlblIMP_TOTAL2.Caption := Format(CFORMAT_DINERO,[FieldByName('IMP_SOLICITAR').AsFloat]);

    If (FieldByName('SIT_GAR_SOL_FEG').AsString <> CSIT_CA) Then
     QrFmt9FIRA.qrMemCancelado.Lines.Clear;

    vldFecha := FieldByName('F_ALTA').AsFloat;
    QrFmt9FIRA.qrlblDia.Caption  := FormatDateTime('DD'  ,vldFecha);
    QrFmt9FIRA.qrlblMes.Caption  := FormatDateTime('MMMM' ,vldFecha);
    QrFmt9FIRA.qrlblAnio.Caption := FormatDateTime('YYYY',vldFecha);

    QrFmt9FIRA.Preview;

   Finally
    Close;
    QryAplicado.Close;
    QryAplicado.Free;
    Qry.Close;
    Qry.Free;
   End;
   If Assigned(Preview)Then Preview.Free;
end;

function TQrFmt9FIRA.FormaQuery(pID_SOLICITUD : Integer) :String;
begin
 Result :=
          ' SELECT'+coCRLF+
          '       CC.ID_CONTROL_EXT,'+coCRLF+
          '       DECODE(P.CVE_PER_JURIDICA, ''PF'', PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO || '' '' ||PF.NOMBRE_PERSONA, PM.NOM_RAZON_SOCIAL)  AS NOMBRE_ACREDITADO,'+coCRLF+
          '       DECODE(CTO.CVE_MONEDA,484,''X'','' '') AS MONEDA_PESOS,'+coCRLF+
          '       DECODE(CTO.CVE_MONEDA,840,''X'','' '') AS MONEDA_DOLAR,'+coCRLF+
          '       CGSF.IMP_PRODUCTOS,'+coCRLF+
          '       CGSF.IMP_SEGUROS,'+coCRLF+
          '       CGSF.IMP_FINCAS,'+coCRLF+
          '       CGSF.IMP_AVALES,'+coCRLF+
          '       CGSF.IMP_GTIA_GRAVAD,'+coCRLF+
          '       CGSF.IMP_OTROS,'+coCRLF+
          '       (CGSF.IMP_PRODUCTOS + CGSF.IMP_SEGUROS + CGSF.IMP_FINCAS +'+coCRLF+
          '       CGSF.IMP_AVALES + CGSF.IMP_GTIA_GRAVAD + CGSF.IMP_OTROS) AS IMP_TOTAL,'+coCRLF+
          '       CGSF.IMP_SOLICITAR,'+coCRLF+
          '       CGSF.F_ALTA,'+coCRLF+
          '       0 AS IMPCAUSCOB,'+coCRLF+
          '       0 AS IMPCAUSGST,'+coCRLF+
          '       CGSL.IMP_ADEUDO_COM AS IMPCAUSCOS,'+coCRLF+
          '       CGSF.ID_SOLIC_LIQ,'+coCRLF+
          '       (CGSL.IMP_ADEUDO_MOR + CGSF.IMP_MORAS_PROY) AS IMPCAUSMOR,'+coCRLF+
          '       CGSL.IMP_ADEUDO_INT AS IMPCAUSVEN,'+coCRLF+
          '       0 AS IMPCAUSVIG,'+coCRLF+
          '       CGSL.IMP_ADEUDO_CAP + CGSL.IMP_ADEUDO_FIN AS IMPCAUSADC,'+coCRLF+
          '       CGSF.SIT_GAR_SOL_FEG'+coCRLF+
          ' FROM CR_GA_SOL_FEGA CGSF,'+coCRLF+
          '      CR_GA_SOL_LIQ CGSL,'+coCRLF+
          '      CR_CREDITO CC,'+coCRLF+
          '      CONTRATO CTO,'+coCRLF+
          '      PERSONA P,'+coCRLF+
          '      PERSONA_FISICA PF,'+coCRLF+
          '      PERSONA_MORAL PM'+coCRLF+
          ' WHERE CGSF.ID_SOLICITUD = '+IntToStr(pID_SOLICITUD)+coCRLF+
          '   AND CGSL.ID_SOLICITUD = CGSF.ID_SOLIC_LIQ'+coCRLF+
          '   AND CC.ID_CREDITO = CGSF.ID_CREDITO'+coCRLF+
          '   AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
          '   AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
          '   AND PM.ID_PERSONA (+)= P.ID_PERSONA'+coCRLF+
          '   AND PF.ID_PERSONA (+)= P.ID_PERSONA';
end;

function TQrFmt9FIRA.FormaQuery1(pID_SOLICITUD : Integer) :String;
begin
 Result :=
           ' SELECT CT.CVE_OPERACION, CDT.CVE_CONCEPTO, CO.CVE_ACCESORIO, '+coCRLF+
           '        SUM(CDT.IMP_CONCEPTO) AS SUM_IMP_NETO'+coCRLF+
           ' FROM CR_XTRANSACCION CXT,'+coCRLF+
           '      CR_TRANSACCION CT,'+coCRLF+
           '      CR_DET_TRANSAC CDT,'+coCRLF+
           '      CR_OPERACION CO '+coCRLF+
           ' WHERE CXT.ID_SOLICITUD = '+IntToStr(pID_SOLICITUD)+coCRLF+
           '   AND CT.ID_TRANSACCION = CXT.ID_TRANSACCION'+coCRLF+
           '   AND CT.SIT_TRANSACCION <> '#39'CA'#39+coCRLF+
           '   AND CT.ID_TRANS_CANCELA IS NULL'+coCRLF+
           '   AND CT.CVE_OPERACION IN ('+coCRLF+
           '                            SELECT CVE_OPE_CN_GL FROM CR_PARAM_AGRO'+coCRLF+
           '                             UNION'+coCRLF+
           '                            SELECT CVE_OPE_IN_GL FROM CR_PARAM_AGRO'+coCRLF+
           '                             UNION'+coCRLF+
           '                            SELECT CVE_OPE_FN_GL FROM CR_PARAM_AGRO'+coCRLF+
           '                             UNION'+coCRLF+
           '                            SELECT CVE_OPE_CP_GL FROM CR_PARAM_AGRO'+coCRLF+
           '                            )'+coCRLF+
           '   AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION'+coCRLF+
           '   AND CO.CVE_OPERACION = CT.CVE_OPERACION'+coCRLF+
           ' GROUP BY CT.CVE_OPERACION, CDT.CVE_CONCEPTO, CO.CVE_ACCESORIO'+coCRLF
           ;
end;

End.
