unit IntMQrCostAmrt;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2;

type
  TQrCostAmrt = class(TQuickRep)
    qyConsulta: TQuery;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRShape6: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;        
    QRLabel12: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText15: TQRDBText;
    QRShape5: TQRShape;
    QRShape4: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape15: TQRShape;
    QRLabel14: TQRLabel;
    QRShape16: TQRShape;
    QRMemo2: TQRMemo;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape114: TQRShape;
    lbCVE_AMORTIZACION_0: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRLabel43: TQRLabel;
    QRShape25: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel42: TQRLabel;
    QRShape29: TQRShape;
    lbCVE_AMORTIZACION_1: TQRLabel;
    QRShape30: TQRShape;
    lbUNIDAD_TIEMPO_CP_0: TQRLabel;
    QRShape31: TQRShape;
    lbUNIDAD_TIEMPO_CP_3: TQRLabel;
    QRShape32: TQRShape;
    lbUNIDAD_TIEMPO_CP_6: TQRLabel;
    QRShape33: TQRShape;
    lbUNIDAD_TIEMPO_CP_1: TQRLabel;
    QRShape34: TQRShape;
    lbUNIDAD_TIEMPO_CP_4: TQRLabel;
    QRShape35: TQRShape;
    lbUNIDAD_TIEMPO_CP_2: TQRLabel;
    QRShape36: TQRShape;
    lbUNIDAD_TIEMPO_CP_5: TQRLabel;
    QRShape12: TQRShape;
    QRMemo1: TQRMemo;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape38: TQRShape;
    QRShape3: TQRShape;
    QRLabel31: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape45: TQRShape;
    QRLabel93: TQRLabel;
    QRShape46: TQRShape;
    lbCVE_TIPO_TASA_1: TQRLabel;
    QRShape47: TQRShape;
    QRLabel95: TQRLabel;
    QRShape48: TQRShape;
    lbCVE_TIPO_TASA_2: TQRLabel;
    QRLabel97: TQRLabel;
    QRShape49: TQRShape;
    QRDBText5: TQRDBText;
    QRLabel98: TQRLabel;
    QRShape50: TQRShape;
    lbUNIDAD_TIEMPO_CP_7: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel102: TQRLabel;
    QRShape52: TQRShape;
    lbPER_PAGO_COM_0: TQRLabel;
    QRShape53: TQRShape;
    lbPER_PAGO_COM_3: TQRLabel;
    QRShape54: TQRShape;
    lbPER_PAGO_COM_6: TQRLabel;
    QRShape55: TQRShape;
    lbPER_PAGO_COM_1: TQRLabel;
    QRShape56: TQRShape;
    lbPER_PAGO_COM_4: TQRLabel;
    QRShape57: TQRShape;
    lbPER_PAGO_COM_2: TQRLabel;
    QRShape58: TQRShape;
    lbPER_PAGO_COM_5: TQRLabel;
    QRLabel110: TQRLabel;
    QRShape59: TQRShape;
    lbPER_PAGO_COM_7: TQRLabel;
    QRShape60: TQRShape;
    lbPCT_COMAPE: TQRLabel;
    QRShape61: TQRShape;
    lbTIPO_PAGO_COM_0: TQRLabel;
    QRShape62: TQRShape;
    lbTIPO_PAGO_COM_1: TQRLabel;
    QRShape63: TQRShape;
    lbTIPO_PAGO_COM_2: TQRLabel;
    QRShape64: TQRShape;
    lbPCT_COMDIS: TQRLabel;
    QRShape65: TQRShape;
    lbPCT_COMANI: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRShape66: TQRShape;
    lbCVE_PAGO_INTERES_0: TQRLabel;
    QRShape67: TQRShape;
    lbCVE_PAGO_INTERES_1: TQRLabel;
    QRShape68: TQRShape;
    lbCVE_PAGO_INTERES_2: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel47: TQRLabel;
    QRShape37: TQRShape;
    lbUNIDAD_TIEMPO_IN_0: TQRLabel;
    QRShape39: TQRShape;
    lbUNIDAD_TIEMPO_IN_3: TQRLabel;
    QRShape40: TQRShape;
    lbUNIDAD_TIEMPO_IN_6: TQRLabel;
    QRShape41: TQRShape;
    lbUNIDAD_TIEMPO_IN_1: TQRLabel;
    QRShape42: TQRShape;
    lbUNIDAD_TIEMPO_IN_4: TQRLabel;
    QRShape51: TQRShape;
    lbUNIDAD_TIEMPO_IN_7: TQRLabel;
    QRShape43: TQRShape;
    lbUNIDAD_TIEMPO_IN_2: TQRLabel;
    QRShape44: TQRShape;
    lbUNIDAD_TIEMPO_IN_5: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel62: TQRLabel;
    QRShape18: TQRShape;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRShape69: TQRShape;
    QRLabel80: TQRLabel;
    QRShape70: TQRShape;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    lbTIPO_PAGO_FEGA_0: TQRLabel;
    QRShape71: TQRShape;
    lbTIPO_PAGO_OTROS_0: TQRLabel;
    QRLabel88: TQRLabel;
    lbTIPO_PAGO_OTROS_1: TQRLabel;
    QRLabel90: TQRLabel;
    lbTIPO_PAGO_OTROS_2: TQRLabel;
    QRLabel92: TQRLabel;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRShape72: TQRShape;
    QRDBText22: TQRDBText;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRShape76: TQRShape;
    QRDBText23: TQRDBText;
    QRLabel89: TQRLabel;
    QRLabel91: TQRLabel;
    QRShape77: TQRShape;
    QRDBText24: TQRDBText;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  public
     Apli : TInterApli;
     Function FormaQuery(sFolio: String; pAPli: TInterApli): String;
  end;

var
    QrCostAmrt: TQrCostAmrt;

Procedure RepCostAmrt( sFolio: String;
                       pAPli: TInterApli; pPreview: Boolean );
Implementation
{$R *.DFM}

Procedure RepCostAmrt( sFolio: String;
                       pAPli: TInterApli; pPreview: Boolean );
Var
    QrCostAmrt  : TQrCostAmrt;
    Preview     : TIntQRPreview;
Begin
    QrCostAmrt   := TQrCostAmrt.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrCostAmrt);
    QrCostAmrt.Apli := pAPli;

    Try
        QrCostAmrt.qyConsulta.DatabaseName := pApli.DataBaseName;
        QrCostAmrt.qyConsulta.SessionName := pApli.SessionName;
        QrCostAmrt.qyConsulta.Active := False;

        QrCostAmrt.qyConsulta.SQL.Text := QrCostAmrt.FormaQuery(sFolio,pAPli);
        QrCostAmrt.qyConsulta.SQL.SaveToFile('C:\Consulta.txt');
        QrCostAmrt.qyConsulta.Active := True;

        If pPreview Then
            QrCostAmrt.Preview
        Else
            QrCostAmrt.Print;
    Finally
        QrCostAmrt.free;
        If Assigned(Preview) Then Preview.Free;
    End;
End;

Function TQrCostAmrt.FormaQuery(sFolio: String; pAPli: TInterApli): String;
Var
    sSQL:         String;
    sFiltros:     String;
Begin
    sFiltros := ' AND CCS.ID_SOL_CAT = ' + sFolio;

    sSQL := ' SELECT ' + coCRLF +
            '    DATOS.ID_SOL_CAT, DATOS.F_SOLICITUD, ' + coCRLF +
            '    DATOS.NOMBRE, DATOS.DESC_L_PRODUCTO, ' + coCRLF +
            '    DATOS.IMP_SOLICITUD, DATOS.DESC_MONEDA, ' + coCRLF +
            '    DATOS.CVE_TASA_REFER, DATOS.TASA_REFERENCIA, ' + coCRLF +
            '    DATOS.SOBRETASA, DATOS.TASA_ANUALIZADA, ' + coCRLF +
            '    DATOS.CVE_TIPO_TASA, DATOS.PLAZO_GRACIA_CAP, ' + coCRLF +
            '    DATOS.PLAZO_GRACIA_INT, DATOS.CVE_AMORTIZACION, ' + coCRLF +
            '    DATOS.CVE_PAGO_INTERES, DATOS.UNIDAD_TIEMPO_CP, ' + coCRLF +
            '    DATOS.UNIDAD_TIEMPO_IN, DATOS.PCT_CAT, ' + coCRLF +
            '    MAX(DECODE(CVE_COMIS_GPO,''COMAPE'',PCT_COMISION,NULL)) AS PCT_COMAPE, ' + coCRLF +
            '    MAX(DECODE(CVE_COMIS_GPO,''COMEST'',PCT_COMISION,NULL)) AS PCT_COMEST, ' + coCRLF +
            '    MAX(DECODE(CVE_COMIS_GPO,''COMDIS'',PCT_COMISION,NULL)) AS PCT_COMDIS, ' + coCRLF +
            '    MAX(DECODE(CVE_COMIS_GPO,''COMANI'',PCT_COMISION,NULL)) AS PCT_COMANI, ' + coCRLF +
            '    MAX(DECODE(CVE_COMIS_GPO,''COMFEG'',PCT_COMISION,NULL)) AS PCT_COMFEG, ' + coCRLF +
            '    MAX(DECODE(CVE_COMIS_GPO,''COMOTR'',PCT_COMISION,NULL)) AS PCT_COMOTR, ' + coCRLF +
            '    MAX(DECODE(CVE_COMIS_GPO,''SEGVID'',IMP_COMISION,NULL)) AS IMP_SEGVID, ' + coCRLF +
            '    MAX(DECODE(CVE_COMIS_GPO,''SEGDAN'',IMP_COMISION,NULL)) AS IMP_SEGDAN, ' + coCRLF +


            '    MAX(DECODE(CVE_COMIS_GPO,''SEGANU'',IMP_COMISION,NULL)) AS IMP_SEGANU, ' + coCRLF +
            '    MAX(DECODE(CVE_COMIS_GPO,''ESPRIN'',IMP_COMISION,NULL)) AS IMP_ESPRIN, ' + coCRLF +
            '    MAX(DECODE(CVE_COMIS_GPO,''IMOTCO'',IMP_COMISION,NULL)) AS IMP_IMOTCO ' + coCRLF +

            ' FROM ' + coCRLF +
            '    ( ' + coCRLF +
            '     SELECT ' + coCRLF +
            '        CCS.ID_SOL_CAT, ' + coCRLF +
            '        TO_CHAR(CCS.F_SOLICITUD,''DD/MM/YYYY'') AS F_SOLICITUD, ' + coCRLF +
            '        CCS.NOMBRE, ' + coCRLF +
            '        NVL(CP.DESC_L_PRODUCTO,CSTB.DESC_SUB_TIPO) DESC_L_PRODUCTO, ' + coCRLF +
            '        CCS.IMP_SOLICITUD, ' + coCRLF +
            '        MON.DESC_MONEDA, ' + coCRLF +
            '        CCS.CVE_TASA_REFER, ' + coCRLF +
            '        ''('' || TRIM(TO_CHAR(CCS.TASA_REFERENCIA,''99990.0000'')) || '' %)'' AS TASA_REFERENCIA, ' + coCRLF +
            '        CCS.SOBRETASA, ' + coCRLF +
            '        CCS.TASA_ANUALIZADA, ' + coCRLF +
{            '        NVL(CCS.CVE_TIPO_TASA,-1) AS CVE_TIPO_TASA, ' + coCRLF +}
            '        DECODE(CCS.CVE_TIPO_TASA,''VA'',2,1) AS CVE_TIPO_TASA, ' + coCRLF +
            '        CCS.PLAZO_GRACIA_CAP, ' + coCRLF +
            '        CCS.PLAZO_GRACIA_INT, ' + coCRLF +
            '        NVL(CCS.CVE_AMORTIZACION,-1) AS CVE_AMORTIZACION, ' + coCRLF +
            '        NVL(CCS.CVE_PAGO_INTERES,-1) AS CVE_PAGO_INTERES, ' + coCRLF +
            '        NVL(CCS.UNIDAD_TIEMPO_CP,-1) AS UNIDAD_TIEMPO_CP, ' + coCRLF +
            '        NVL(CCS.UNIDAD_TIEMPO_IN,-1) AS UNIDAD_TIEMPO_IN, ' + coCRLF +
            '        CCS.PCT_CAT, ' + coCRLF +
            '        CCSC.CVE_COMISION, ' + coCRLF +
            '        CCRC.CVE_COMIS_GPO, ' + coCRLF +
            '        CCSC.IMP_COMISION, ' + coCRLF +
            '        CCSC.PCT_COMISION ' + coCRLF +
            '     FROM CR_CAT_SOL CCS, ' + coCRLF +
            '        MONEDA MON, ' + coCRLF +
            '        CR_PRODUCTO CP, ' + coCRLF +
            '       (SELECT TO_CHAR(CVE_SUB_TIP_BCO) AS CVE_SUB_TIP_BCO, DESC_SUB_TIPO FROM  CRE_SUB_TIP_BCO) CSTB, ' + coCRLF +
            '        CR_CAT_SOL_COM CCSC, ' + coCRLF +
            '        CR_CAT_REL_COM CCRC ' + coCRLF +
            '     WHERE ' + coCRLF +
            '        CCS.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE (+) AND ' + coCRLF +
            '        CCS.CVE_PRODUCTO_CRE = CSTB.CVE_SUB_TIP_BCO (+) AND ' + coCRLF +
            '        CCS.CVE_MONEDA = MON.CVE_MONEDA AND ' + coCRLF +
            '        CCS.ID_SOL_CAT = CCSC.ID_SOL_CAT (+) AND ' + coCRLF +
            '        CCSC.CVE_COMISION = CCRC.CVE_COMISION (+) AND ' + coCRLF +
            '        CCRC.SIT_COMIS_GPO (+) = ''AC'' ' + coCRLF +
            sFiltros +
            '    ) DATOS ' + coCRLF +
            ' GROUP BY DATOS.ID_SOL_CAT, DATOS.F_SOLICITUD, ' + coCRLF +
            '    DATOS.NOMBRE, DATOS.DESC_L_PRODUCTO, ' + coCRLF +
            '    DATOS.IMP_SOLICITUD, DATOS.DESC_MONEDA, ' + coCRLF +
            '    DATOS.CVE_TASA_REFER, DATOS.TASA_REFERENCIA, ' + coCRLF +
            '    DATOS.SOBRETASA, DATOS.TASA_ANUALIZADA, ' + coCRLF +
            '    DATOS.CVE_TIPO_TASA, DATOS.PLAZO_GRACIA_CAP, ' + coCRLF +
            '    DATOS.PLAZO_GRACIA_INT, DATOS.CVE_AMORTIZACION, ' + coCRLF +
            '    DATOS.CVE_PAGO_INTERES, DATOS.UNIDAD_TIEMPO_CP, ' + coCRLF +
            '    DATOS.UNIDAD_TIEMPO_IN, DATOS.PCT_CAT ';

    Result := sSQL;
End;

procedure TQrCostAmrt.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    lbCVE_TIPO_TASA_1.Caption := '';
    lbCVE_TIPO_TASA_2.Caption := '';

    lbCVE_AMORTIZACION_0.Caption := '';
    lbCVE_AMORTIZACION_1.Caption := '';

    lbUNIDAD_TIEMPO_CP_0.Caption := '';
    lbUNIDAD_TIEMPO_CP_1.Caption := '';
    lbUNIDAD_TIEMPO_CP_2.Caption := '';
    lbUNIDAD_TIEMPO_CP_3.Caption := '';
    lbUNIDAD_TIEMPO_CP_4.Caption := '';
    lbUNIDAD_TIEMPO_CP_5.Caption := '';
    lbUNIDAD_TIEMPO_CP_6.Caption := '';
    lbUNIDAD_TIEMPO_CP_7.Caption := '';

    lbCVE_PAGO_INTERES_0.Caption := '';
    lbCVE_PAGO_INTERES_1.Caption := '';
    lbCVE_PAGO_INTERES_2.Caption := '';
    lbTIPO_PAGO_COM_0.Caption := '';
    lbTIPO_PAGO_COM_1.Caption := '';
    lbTIPO_PAGO_COM_2.Caption := '';

    lbTIPO_PAGO_FEGA_0.Caption := '';

    lbTIPO_PAGO_OTROS_0.Caption := '';
    lbTIPO_PAGO_OTROS_1.Caption := '';
    lbTIPO_PAGO_OTROS_2.Caption := '';

    lbUNIDAD_TIEMPO_IN_0.Caption := '';
    lbUNIDAD_TIEMPO_IN_1.Caption := '';
    lbUNIDAD_TIEMPO_IN_2.Caption := '';
    lbUNIDAD_TIEMPO_IN_3.Caption := '';
    lbUNIDAD_TIEMPO_IN_4.Caption := '';
    lbUNIDAD_TIEMPO_IN_5.Caption := '';
    lbUNIDAD_TIEMPO_IN_6.Caption := '';
    lbUNIDAD_TIEMPO_IN_7.Caption := '';

    lbPER_PAGO_COM_0.Caption := '';
    lbPER_PAGO_COM_1.Caption := '';
    lbPER_PAGO_COM_2.Caption := '';
    lbPER_PAGO_COM_3.Caption := '';
    lbPER_PAGO_COM_4.Caption := '';
    lbPER_PAGO_COM_5.Caption := '';
    lbPER_PAGO_COM_6.Caption := '';
    lbPER_PAGO_COM_7.Caption := '';

    lbPCT_COMAPE.Caption := '';
    lbPCT_COMDIS.Caption := '';
    lbPCT_COMANI.Caption := '';



    If Not qyConsulta.Eof Then Begin
        If qyConsulta.FieldByName('CVE_TIPO_TASA').AsInteger = 1 Then
           lbCVE_TIPO_TASA_1.Caption := 'X'
        Else
           lbCVE_TIPO_TASA_2.Caption := 'X';

        If qyConsulta.FieldByName('CVE_AMORTIZACION').AsInteger = 0 Then
           lbCVE_AMORTIZACION_0.Caption := 'X'
        Else
           lbCVE_AMORTIZACION_1.Caption := 'X';

        Case qyConsulta.FieldByName('UNIDAD_TIEMPO_CP').AsInteger Of
            0: lbUNIDAD_TIEMPO_CP_0.Caption := 'X';
            1: lbUNIDAD_TIEMPO_CP_1.Caption := 'X';
            2: lbUNIDAD_TIEMPO_CP_2.Caption := 'X';
            3: lbUNIDAD_TIEMPO_CP_3.Caption := 'X';
            4: lbUNIDAD_TIEMPO_CP_4.Caption := 'X';
            5: lbUNIDAD_TIEMPO_CP_5.Caption := 'X';
            6: lbUNIDAD_TIEMPO_CP_6.Caption := 'X';
            7: lbUNIDAD_TIEMPO_CP_7.Caption := 'X';
        End;

        Case qyConsulta.FieldByName('CVE_PAGO_INTERES').AsInteger Of
            0: Begin
                 lbCVE_PAGO_INTERES_0.Caption := 'X';
                 if qyConsulta.FieldByName('PCT_COMOTR').AsFloat <> 0 then
                    lbTIPO_PAGO_OTROS_0.Caption := 'X';
                 //end if
               End;
            1: Begin
                 lbCVE_PAGO_INTERES_1.Caption := 'X';
                 if qyConsulta.FieldByName('PCT_COMOTR').AsFloat <> 0 then
                    lbTIPO_PAGO_OTROS_1.Caption := 'X';
                 //end if
               End;
            2: Begin
                 lbCVE_PAGO_INTERES_2.Caption := 'X';
                 if qyConsulta.FieldByName('PCT_COMOTR').AsFloat <> 0 then
                    lbTIPO_PAGO_COM_2.Caption := 'X';
                 //end if
               End;
        End;

        Case qyConsulta.FieldByName('UNIDAD_TIEMPO_IN').AsInteger Of
            0: Begin
                 lbUNIDAD_TIEMPO_IN_0.Caption := 'X';
                 if qyConsulta.FieldByName('PCT_COMEST').AsFloat <> 0 then
                    lbPER_PAGO_COM_0.Caption := 'X';
                 //end if
               End;
            1: Begin
                 lbUNIDAD_TIEMPO_IN_1.Caption := 'X';
                 if qyConsulta.FieldByName('PCT_COMEST').AsFloat <> 0 then
                    lbPER_PAGO_COM_1.Caption := 'X';
                 //end if
               End;
            2: Begin
                 lbUNIDAD_TIEMPO_IN_2.Caption := 'X';
                 if qyConsulta.FieldByName('PCT_COMEST').AsFloat <> 0 then
                    lbPER_PAGO_COM_2.Caption := 'X';
                 //end if
               End;
            3: Begin
                 lbUNIDAD_TIEMPO_IN_3.Caption := 'X';
                 if qyConsulta.FieldByName('PCT_COMEST').AsFloat <> 0 then
                   lbPER_PAGO_COM_3.Caption := 'X';
                 //end if
               End;
            4: Begin
                 lbUNIDAD_TIEMPO_IN_4.Caption := 'X';
                 if qyConsulta.FieldByName('PCT_COMEST').AsFloat <> 0 then
                    lbPER_PAGO_COM_4.Caption := 'X';
                 //end if
               End;
            5: Begin
                 lbUNIDAD_TIEMPO_IN_5.Caption := 'X';
                 if qyConsulta.FieldByName('PCT_COMEST').AsFloat <> 0 then
                    lbPER_PAGO_COM_5.Caption := 'X';
                 //end if
               End;
            6: Begin
                 lbUNIDAD_TIEMPO_IN_6.Caption := 'X';
                 if qyConsulta.FieldByName('PCT_COMEST').AsFloat <> 0 then
                    lbPER_PAGO_COM_6.Caption := 'X';
                 //end if
               End;
            7: Begin
                 lbUNIDAD_TIEMPO_IN_7.Caption := 'X';
                 if qyConsulta.FieldByName('PCT_COMEST').AsFloat <> 0 then
                    lbPER_PAGO_COM_7.Caption := 'X';
                 //end if
               End;
        End;

        if qyConsulta.FieldByName('PCT_COMEST').AsFloat <> 0 then
           lbTIPO_PAGO_COM_0.Caption := 'X';
        //end if

        If qyConsulta.FieldByName('PCT_COMAPE').AsString <> '' Then
           lbPCT_COMAPE.Caption := 'X';
        //end if

        If qyConsulta.FieldByName('PCT_COMDIS').AsString <> '' Then
           lbPCT_COMDIS.Caption := 'X';
        //end if

        If qyConsulta.FieldByName('PCT_COMANI').AsString <> '' Then
           lbPCT_COMANI.Caption := 'X';
        //end if

        If qyConsulta.FieldByName('PCT_COMFEG').AsString <> '' Then
           lbTIPO_PAGO_FEGA_0.Caption := 'X';
        //end if
    End;
end;

End.

