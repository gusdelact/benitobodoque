unit IntMQrFiSoPa;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre, UnSQL2, Dialogs, IntXls;

type
  TQrFiSoPa = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    qryQrFiSoPa: TQuery;
    TitleBand1: TQRBand;
    SaveDialog: TSaveDialog;
    qryQrFiSoPaNOM_FIDEICOMISAR: TStringField;
    qryQrFiSoPaNOM_FIDEICOMISO: TStringField;
    qryQrFiSoPaNUM_FOL_ADHESION: TStringField;
    qryQrFiSoPaSDO_INSOLUTO: TFloatField;
    qryQrFiSoPaTASA_ESTIMADA: TFloatField;
    qryQrFiSoPaNUM_DIAS_PERIODO: TFloatField;
    qryQrFiSoPaCUENTA_BANCO: TStringField;
    qryQrFiSoPaID_INTERMEDIARIO: TFloatField;
    qryQrFiSoPaIMP_CAPITAL: TFloatField;
    qryQrFiSoPaIMP_INTERES: TFloatField;
    qryQrFiSoPaIMP_MORATORIO: TFloatField;
    qryQrFiSoPaIMP_FND_RESERVA: TFloatField;
    qryQrFiSoPaIMP_HONORARIOS: TFloatField;
    qryQrFiSoPaIMP_DIF_EXTEMP: TFloatField;
    qryQrFiSoPaIMP_CAP_ACEL: TFloatField;
    qryQrFiSoPaIMP_MOR_ACEL: TFloatField;
    qryQrFiSoPaIMP_SDO_INS_ACEL: TFloatField;
    qryQrFiSoPaF_VENCIMIENTO: TDateTimeField;
    qryQrFiSoPaNOM_INET: TStringField;
    qryQrFiSoPaTASA_TOTAL: TFloatField;
    qryQrFiSoPaTOTAL: TFloatField;
    qryQrFiSoPaINDICE: TFloatField;
    qryQrFiSoPaNOMBRE_1: TStringField;
    qryQrFiSoPaPUESTO_1: TStringField;
    qryQrFiSoPaNOMBRE_2: TStringField;
    qryQrFiSoPaPUESTO_2: TStringField;
    qryQrFiSoPaNOMBRE_3: TStringField;
    qryQrFiSoPaPUESTO_3: TStringField;
    qryQrFiSoPaNOMBRE_4: TStringField;
    qryQrFiSoPaPUESTO_4: TStringField;
    QRShape1: TQRShape;
    qrlbIMP_CAPITAL: TQRLabel;
    QRShape2: TQRShape;
    qrlblIMP_INTERES: TQRLabel;
    QRShape3: TQRShape;
    qrlblIMP_MORATORIO: TQRLabel;
    QRShape4: TQRShape;
    qrlblIMP_FND_RESERVA: TQRLabel;
    QRShape5: TQRShape;
    qrlblIMP_HONORARIOS: TQRLabel;
    QRShape6: TQRShape;
    QRLabel6: TQRLabel;
    QRShape7: TQRShape;
    qrlblTOTAL: TQRLabel;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    qrlblNOM_FIDEICOMISAR: TQRLabel;
    qrlblNOM_FIDEICOMISO: TQRLabel;
    qrlblSDO_INSOLUTO: TQRLabel;
    qrlblNUM_DIAS_PERIODO: TQRLabel;
    qrlblNOM_INET: TQRLabel;
    qrdbNOM_FIDEICOMISAR: TQRDBText;
    qrdbNOM_FIDEICOMISO: TQRDBText;
    qrdbSDO_INSOLUTO: TQRDBText;
    qrdbNUM_DIAS_PERIODO: TQRDBText;
    qrdbNOM_INET: TQRDBText;
    qrlblNUM_FOL_ADHESION: TQRLabel;
    qrlblTASA_TOTAL: TQRLabel;
    qrlblF_VENCIMIENTO: TQRLabel;
    QRLabel17: TQRLabel;
    qrdbNUM_FOL_ADHESION: TQRDBText;
    qrdbTASA_TOTAL: TQRDBText;
    qrdbF_VENCIMIENTO: TQRDBText;
    qrdbCUENTA_BANCO: TQRDBText;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape18: TQRShape;
    qrlbIMP_CAP_ACEL: TQRLabel;
    QRShape19: TQRShape;
    qrlbIMP_MOR_ACEL: TQRLabel;
    QRShape20: TQRShape;
    qrlbIMP_SDO_INS_ACEL: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    qrDetail: TQRBand;
    qrdbIMP_CAPITAL: TQRDBText;
    qrdbIMP_INTERES: TQRDBText;
    qrdbIMP_MORATORIO: TQRDBText;
    qrdbIMP_FND_RESERVA: TQRDBText;
    qrdbIMP_DIF_EXTEMP: TQRDBText;
    qrdbIMP_HONORARIOS: TQRDBText;
    qrdbTOTAL: TQRDBText;
    qrdbIMP_CAP_ACEL: TQRDBText;
    qrdbIMP_MOR_ACEL: TQRDBText;
    qrdbIMP_SDO_INS_ACEL: TQRDBText;
    qrGrpIndice1: TQRGroup;
    qrFootIndice2: TQRBand;
    qrFootIndice1: TQRBand;
    qrGrpIndice2: TQRGroup;
    qrdbNOMBRE_1: TQRDBText;
    qrdbNOMBRE_2: TQRDBText;
    qrdbNOMBRE_3: TQRDBText;
    qrdbNOMBRE_4: TQRDBText;
    qrdbPUESTO_1: TQRDBText;
    qrdbPUESTO_2: TQRDBText;
    qrdbPUESTO_3: TQRDBText;
    qrdbPUESTO_4: TQRDBText;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    procedure QuickRepAfterPrint(Sender: TObject);
  private
    vgID_FID_SOL_PAGO : Integer;
    vgB_IMPRESO : Boolean;    
  public
    Function FormaQuery(peID_EMPRESA, peID_FID_SOL_PAGO : Integer) : String;
  end;

var
  QrFiSoPa: TQrFiSoPa;

function RepFiSoPa( peID_EMPRESA, peID_FID_SOL_PAGO : Integer;
                     pAPli    : TInterApli;
                     pPreview : Boolean;
                     peB_SAVE_QRY_TO_FILE : Boolean) : Boolean;
Implementation
{$R *.DFM}

function RepFiSoPa( peID_EMPRESA, peID_FID_SOL_PAGO : Integer;
                     pAPli    : TInterApli;
                     pPreview : Boolean;
                     peB_SAVE_QRY_TO_FILE : Boolean) : Boolean;
Var
    QrFiSoPa : TQrFiSoPa;
    VLTitulo : String;
    Preview  : TIntQRPreview;
Begin
    Result := False; 
    VLTitulo := '';
    QrFiSoPa := TQrFiSoPa.Create(Nil);
    Preview  := TIntQRPreview.CreatePreview(Application, QrFiSoPa);
    If Assigned(QrFiSoPa) Then
     With QrFiSoPa Do
      Try
        vgB_IMPRESO := False;      
        vgID_FID_SOL_PAGO := peID_FID_SOL_PAGO;

        QRInterEncabezado1.Apli:=pApli;
        QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QRInterEncabezado1.NomReporte:= 'IntMQrFiSoPa';
        QRInterEncabezado1.Titulo1 := 'Anexo        del Contrato de Fideicomiso Irrevocable de Administración';
        QRInterEncabezado1.Titulo2 := 'Formato de Solicitud de Pago';

        qryQrFiSoPa.DatabaseName := pApli.DataBaseName;
        qryQrFiSoPa.SessionName  := pApli.SessionName;
        qryQrFiSoPa.Active   := False;
        qryQrFiSoPa.SQL.Text := FormaQuery(peID_EMPRESA, peID_FID_SOL_PAGO);

        If (peB_SAVE_QRY_TO_FILE) Then
         If SaveDialog.Execute Then
          qryQrFiSoPa.SQL.SaveToFile(SaveDialog.FileName);

        qryQrFiSoPa.Open;
        
        If pPreview Then
            QrFiSoPa.Preview
        Else
            QrFiSoPa.Print;
      Finally
        qryQrFiSoPa.Close;
        QrFiSoPa.Free;
        Result := vgB_IMPRESO;
      End;
End;

Function TQrFiSoPa.FormaQuery(peID_EMPRESA, peID_FID_SOL_PAGO : Integer) : String;
var
  vlID_EMPRESA, vlID_FID_SOL_PAGO, vlSQL : String;
Begin
  vlID_EMPRESA      := IntToStr(peID_EMPRESA);
  vlID_FID_SOL_PAGO := IntToStr(peID_FID_SOL_PAGO);
  vlSQL := '  SELECT DATOS.*,'+coCRLF+
           '       PER_INTERES.TASA_APLICADA + TASA_ESTIMADA AS TASA_TOTAL,'+coCRLF+
           '       (NVL(IMP_CAPITAL,0)+NVL(IMP_INTERES,0)+'+coCRLF+
           '        NVL(IMP_MORATORIO,0)+NVL(IMP_FND_RESERVA,0)+NVL(IMP_HONORARIOS,0)+NVL(IMP_DIF_EXTEMP,0))TOTAL,'+coCRLF+
           '       DELEGADOS.*'+coCRLF+
           '  FROM (SELECT SOLICITUD_PAGO.*, I.NOM_INET'+coCRLF+
           '          FROM (SELECT CFSP.NOM_FIDEICOMISAR, CFM.NUM_FOL_ADHESION AS NOM_FIDEICOMISO,'+coCRLF+
           '                       CFSP.NUM_FOL_FIDEICOM AS NUM_FOL_ADHESION,'+coCRLF+
           '                       CFSP.SDO_INSOLUTO    , CFSP.TASA_ESTIMADA   ,'+coCRLF+
           '                       CFSP.NUM_DIAS_PERIODO, CFM.CUENTA_BANCO     ,'+coCRLF+
           '                       CFSP.ID_INTERMEDIARIO, CFSP.IMP_CAPITAL     ,'+coCRLF+
           '                       (NVL(CFSP.IMP_INTERES,0) + NVL(CFSP.IMP_INTERES_EST,0)) AS IMP_INTERES,'+coCRLF+
           '                       CFSP.IMP_MORATORIO   , CFSP.IMP_FND_RESERVA ,'+coCRLF+
           '                       CFSP.IMP_HONORARIOS  , CFSP.IMP_DIF_EXTEMP  ,'+coCRLF+
           '                       CFSP.IMP_CAP_ACEL    , CFSP.IMP_MOR_ACEL    ,'+coCRLF+
           '                       CFSP.IMP_SDO_INS_ACEL, CFSP.F_VENCIMIENTO'+coCRLF+
           '                  FROM ( SELECT CR_FID_SOL_PAGO.*, CA.F_VENCIMIENTO, CC.NUM_FOL_FIDEICOM'+coCRLF+
           '                         FROM CR_FID_SOL_PAGO,'+coCRLF+
           '                              CR_CAPITAL CA,'+coCRLF+
           '                              CR_CREDITO CC,'+coCRLF+
           '                              CONTRATO CTO'+coCRLF+
           '                         WHERE CA.ID_CREDITO = CR_FID_SOL_PAGO.ID_CREDITO'+coCRLF+
           '                           AND CA.NUM_PERIODO = CR_FID_SOL_PAGO.NUM_PERIODO'+coCRLF+
           '                           AND CC.ID_CREDITO = CR_FID_SOL_PAGO.ID_CREDITO'+coCRLF+
           '                           AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
           '                           AND CTO.ID_EMPRESA = '+vlID_EMPRESA+') CFSP ,'+coCRLF+
           '                       CR_FID_REL_DISP CFRD,'+coCRLF+
           '                       CR_FID_MAESTRO CFM'+coCRLF+
           '                 WHERE CFSP.ID_FID_SOL_PAGO = '+vlID_FID_SOL_PAGO+coCRLF+
           '                   AND CFRD.ID_CREDITO = CFSP.ID_CREDITO'+coCRLF+
           '                   AND CFM.ID_FID_MAESTRO = CFRD.ID_FID_MAESTRO'+coCRLF+
           '               )SOLICITUD_PAGO, INTERMEDIARIO I'+coCRLF+
           '         WHERE I.ID_INTERMEDIARIO (+)= SOLICITUD_PAGO.ID_INTERMEDIARIO'+coCRLF+
           '       )DATOS,'+coCRLF+
           '       (   SELECT CI.ID_CREDITO, CI.TASA_APLICADA'+coCRLF+
           '           FROM CR_INTERES CI,'+coCRLF+
           '                ( SELECT CI.ID_CREDITO, MAX(CI.NUM_PERIODO) AS MAX_NUM_PERIODO'+coCRLF+
           '                  FROM CR_INTERES CI,'+coCRLF+
           '                       ( SELECT  CA.ID_CREDITO,'+coCRLF+
           '                               (F_VENCIMIENTO - PLAZO) AS F_INI,'+coCRLF+
           '                                F_VENCIMIENTO AS F_FIN'+coCRLF+
           '                         FROM CR_CAPITAL CA,'+coCRLF+
           '                           ( SELECT * FROM CR_FID_SOL_PAGO'+coCRLF+
           '                              WHERE ID_FID_SOL_PAGO = '+vlID_FID_SOL_PAGO+coCRLF+
           '                            ) CFSP'+coCRLF+
           '                         WHERE CA.ID_CREDITO = CFSP.ID_CREDITO'+coCRLF+
           '                          AND CA.NUM_PERIODO = CFSP.NUM_PERIODO'+coCRLF+
           '                      ) CA'+coCRLF+
           '                  WHERE CA.ID_CREDITO = CI.ID_CREDITO'+coCRLF+
           '                    AND CI.F_VENCIMIENTO BETWEEN CA.F_INI AND CA.F_FIN'+coCRLF+
           '                  GROUP BY CI.ID_CREDITO'+coCRLF+
           '                ) TEMP'+coCRLF+
           '          WHERE CI.ID_CREDITO = TEMP.ID_CREDITO'+coCRLF+
           '            AND CI.NUM_PERIODO = TEMP.MAX_NUM_PERIODO'+coCRLF+
           '       ) PER_INTERES,'+coCRLF+
           '       (SELECT TRUNC((REGISTRO+3)/4) INDICE,'+coCRLF+
           '               MAX(DECODE( MOD(REGISTRO,4) ,1, NOM_DELEGADO, '' '')) NOMBRE_1,'+coCRLF+
           '               MAX(DECODE( MOD(REGISTRO,4) ,1, TX_PUESTO, '' '')) PUESTO_1,'+coCRLF+
           '               MAX(DECODE( MOD(REGISTRO,4) ,2, NOM_DELEGADO, '' '')) NOMBRE_2,'+coCRLF+
           '               MAX(DECODE( MOD(REGISTRO,4) ,2, TX_PUESTO, '' '')) PUESTO_2,'+coCRLF+
           '               MAX(DECODE( MOD(REGISTRO,4) ,3, NOM_DELEGADO, '' '')) NOMBRE_3,'+coCRLF+
           '               MAX(DECODE( MOD(REGISTRO,4) ,3, TX_PUESTO, '' '')) PUESTO_3,'+coCRLF+
           '               MAX(DECODE( MOD(REGISTRO,4) ,0, NOM_DELEGADO, '' '')) NOMBRE_4,'+coCRLF+
           '               MAX(DECODE( MOD(REGISTRO,4) ,0, TX_PUESTO, '' '')) PUESTO_4'+coCRLF+
           '          FROM'+coCRLF+
           '       (SELECT ROWNUM AS REGISTRO,'+coCRLF+
           '               SUBSTR(PKGCRSICC.STP_OBT_NOM_TITULAR_2( NULL, NULL,'+coCRLF+
           '               CFD.ID_PERSONA), 1, 255) AS NOM_DELEGADO, ''DELEGADO FIDUCIARIO'' AS TX_PUESTO'+coCRLF+
           '          FROM CR_FID_SOL_PAGO CFSP,'+coCRLF+
           '               CR_FID_REL_DISP CFRDISP,'+coCRLF+
           '               ( SELECT * FROM CR_FID_REL_DEL'+coCRLF+
           '                 WHERE SIT_FID_REL_DEL <> ''CA'' )  CFRDEL,'+coCRLF+
           '               ( SELECT * FROM CR_FID_DELEGADO'+coCRLF+
           '                 WHERE SIT_FID_DELEGADO <> ''CA'' ) CFD'+coCRLF+
           '          WHERE CFSP.ID_FID_SOL_PAGO = '+vlID_FID_SOL_PAGO+coCRLF+
           '            AND CFRDISP.ID_CREDITO = CFSP.ID_CREDITO'+coCRLF+
           '            AND CFRDEL.ID_FID_MAESTRO = CFRDISP.ID_FID_MAESTRO'+coCRLF+
           '            AND CFD.ID_PERSONA = CFRDEL.ID_PERSONA'+coCRLF+
           '          ORDER BY NOM_DELEGADO'+coCRLF+
           '       )'+coCRLF+
           '         GROUP BY TRUNC((REGISTRO+3)/4)'+coCRLF+
           '        )DELEGADOS'+coCRLF
          ;
  Result := vlSQL;
End;

procedure TQrFiSoPa.QuickRepAfterPrint(Sender: TObject);
begin
  If (MessageDlg('¿La solicitud de pago se imprimió correctamente?',
                 mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
   Begin
   If RunSQL(' UPDATE CR_FID_SOL_PAGO'+coCRLF+
             ' SET B_IMPRESO = '+SQLStr(CVERDAD)+coCRLF+
             ' WHERE ID_FID_SOL_PAGO = '+IntToStr(vgID_FID_SOL_PAGO)+coCRLF,
             QRInterEncabezado1.Apli.DataBaseName, QRInterEncabezado1.Apli.SessionName, True) Then
      vgB_IMPRESO := True;
   End;
end;

End.
