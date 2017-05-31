unit IntCrQRCtaAcr;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Dialogs,
  IntFrm, InterApl, UnSQL2, UnGene, UnSubGen,IntTraduce, IntHead, Db,
  DBTables,IntGenCre,
  IntQRPreview;

CONST
        TIT_ACRED  = 'Acreditado / Emisor';
        TIT_PROV   = 'Proveedor';
        TIT_PROCAM = 'Acreditado / Procampo';
        coCRLF     = #13#10;

type
  TWCrQRCtaAcred = class(TQuickRep)
    DetailBand1: TQRBand;
    QCtaAcred: TQuery;
    QRGAcred: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRShape8: TQRShape;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel8: TQRLabel;
    QRShape4: TQRShape;
    QRLabel10: TQRLabel;
    QRShape5: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape6: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel4: TQRLabel;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QCtaAcredID_BANCO_CHQRA: TFloatField;
    QCtaAcredID_ACREDITADO: TFloatField;
    QCtaAcredID_CREDITO: TFloatField;
    QCtaAcredCVE_EMISOR_NAFIN: TStringField;
    QCtaAcredSIT_CHEQUERA: TStringField;
    QCtaAcredTIPO_CHEQUERA: TStringField;
    QCtaAcredCUENTA_BANCO: TStringField;
    QCtaAcredPREDETERMINADA: TStringField;
    QCtaAcredSITUACION: TStringField;
    QCtaAcredBANCO: TStringField;
    QCtaAcredACREDITADO: TStringField;
    QCtaAcredSUCURSAL: TStringField;
    QCtaAcredID_PLAZA: TStringField;
    QCtaAcredB_DEPURADO: TStringField;
    QRShape11: TQRShape;
    QRLabel9: TQRLabel;
    QCtaAcredTIPO_CUENTA: TStringField;
    QRShape12: TQRShape;
    QRLabel12: TQRLabel;
    QRDBText13: TQRDBText;
    QRShape13: TQRShape;
    QRLabel13: TQRLabel;
    QCtaAcredMONEDA: TStringField;
    QRDBText14: TQRDBText;
    QCtaAcredBANXICO: TStringField;
    QRShape14: TQRShape;
    QRLabel14: TQRLabel;
    QRDBText15: TQRDBText;
    QCtaAcredTITULAR: TStringField;
  private

  public
    cadenSQL      : String;
    FApli         : TInterApli;          //Corresponde al Objeto Apli
    VLCAD :STRING;
  end;

var
  WCrQRCtaAcred: TWCrQRCtaAcred;

  procedure Execute_RepCtasAcred(ShowPreview: Boolean; Padre: TInterFrame);

implementation

{$R *.DFM}
procedure Execute_RepCtasAcred(ShowPreview: Boolean; Padre: TInterFrame);
VAR     vlOper          : String;
        vlSit           : String;
        vlTipoAcred     : String;
        vlTipoCheq      : String;
        vlTitulo1       : String;
        vlTitulo2       : String;
        vlTitulo3       : String;
        vlEtiqueta      : String;
        Preview         : TIntQRPreview;
begin
     vlTitulo1 := 'Reporte de cuentas por ';
     vlEtiqueta := '';
     try
        if Padre.FieldByName('CVE_TIPO_ACRED').AsSQL = C_ACRED then
        Begin
          vlEtiqueta := TIT_ACRED;
          vlTitulo1 := vlTitulo1 + TIT_ACRED;
        end
        else if Padre.FieldByName('CVE_TIPO_ACRED').AsSQL = C_PROVE then
        begin
          vlEtiqueta := TIT_PROV;
          vlTitulo1 := vlTitulo1 + TIT_PROV;
        end
        else if Padre.FieldByName('CVE_TIPO_ACRED').AsSQL = C_PROCA then
        begin
          vlEtiqueta := TIT_PROCAM;
          vlTitulo1 := vlTitulo1 + TIT_PROCAM;
        end
        else
        begin
          vlTitulo1 := 'Acreditados / Proveedores';
        end;



        if Padre.FieldByName('CVE_TIPO_CHEQ').AsSQL = C_ADMIN then
          vlTitulo2 := 'Chequeras Administrativas '
        else if Padre.FieldByName('CVE_TIPO_CHEQ').AsSQL = C_LIQUI then
          vlTitulo2 := 'Chequeras de Liquidación '
        else if Padre.FieldByName('CVE_TIPO_CHEQ').AsSQL = C_CHQIND then
          vlTitulo2 := 'Chequeras Admón y Liq';

        if Padre.FieldByName('CVE_TIP_OPE_CHQ').AsSQL = C_CARGO then
          vlTitulo2 := vlTitulo2 + ', de cargo '
        else if Padre.FieldByName('CVE_TIP_OPE_CHQ').AsSQL = C_ABONO then
          vlTitulo2 := vlTitulo2 + ', de abono '
        else if Padre.FieldByName('CVE_TIP_OPE_CHQ').AsSQL = C_AMBOS then
          vlTitulo2 := vlTitulo2 + ', Cargo y Abono ';

        if Padre.FieldByName('SIT_CHEQUERA').AsSQL = CSIT_AC then
          vlTitulo2:= vlTitulo2 + ', Sit: Activas'
        else if Padre.FieldByName('SIT_CHEQUERA').AsSQL = CSIT_CA then
          vlTitulo2:= vlTitulo2 + ', Sit: Canceladas'
        else if Padre.FieldByName('SIT_CHEQUERA').AsSQL = C_AMBOS then
          vlTitulo2 := vlTitulo2 + 'Activas y Canceladas';

          WCrQRCtaAcred := TWCrQRCtaAcred.Create(Padre);
          Preview := TIntQRPreview.CreatePreview(Application, WCrQRCtaAcred);
          WCrQRCtaAcred.QCtaAcred.Active:=False;
          WCrQRCtaAcred.QCtaAcred.Close;
          WCrQRCtaAcred.QCtaAcred.SQL.Clear;

          WCrQRCtaAcred.FApli := Padre.Apli;

          WCrQRCtaAcred.QRInterEncabezado1.Titulo1 := vlTitulo1;
          WCrQRCtaAcred.QRInterEncabezado1.Titulo2 := vlTitulo2;

          WCrQRCtaAcred.cadenSQL:=

                ' SELECT  CTE.ID_BANCO_CHQRA  ,  CTE.ID_ACREDITADO, ' + coCRLF +
                '         PA.NOMBRE ACREDITADO,  CTE.ID_CREDITO, ' + coCRLF +
                '         CTE.CVE_EMISOR_NAFIN,  CTE.SIT_CHEQUERA, ' + coCRLF +
                '         DECODE(CTE.CVE_TIPO_CHEQ,''AD'',''ADMIN.'',''LIQ.   '') || ' + coCRLF +
                '         DECODE(CTE.CVE_TIP_OPE_CHQ,''AM'','' (CARGO Y ABONO)'',''CR'','' (CARGO)'','' (ABONO)'') TIPO_CHEQUERA, ' + coCRLF +
                '         CTE.CUENTA_BANCO    ,  PT.NOMBRE TITULAR, ' + coCRLF +
                '         DECODE(CTE.B_PREDETERMINADA,''V'',''*'') PREDETERMINADA, ' + coCRLF +
                '         DECODE(CTE.SIT_CHEQUERA,''AC'',''ACTIVA'',''CANCELADA'') SITUACION, ' + coCRLF +
                '         PB.NOMBRE BANCO     ,   CTE.SUCURSAL, ' + coCRLF +
                '         CTE.ID_PLAZA        ,   CTE.B_DEPURADO, ' + coCRLF +
                '         CTE.TIPO_CUENTA     ,   CTE.BANXICO, ' + coCRLF +
                '         M.CVE_MONEDA||'' - ''||M.DESC_MONEDA MONEDA, ' + coCRLF +
                '         PT.NOMBRE TITULAR ' + coCRLF +
                ' FROM ( SELECT * FROM ' + coCRLF +
                '        ( SELECT C.CVE_SUC_BANCO || '' - '' || C.NOM_SUC_BANCO  SUCURSAL,CCC.B_CTA_TERCEROS, ' + coCRLF +
                '                 C.ID_PLAZA ,                 C.B_DEPURADO, ' + coCRLF +
                '                 C.TIPO_CUENTA,               TO_CHAR(C.ID_PZA_BANXICO) BANXICO, ' + coCRLF +
                '                 C.ID_PERSONA,                C.ID_BANCO_CHQRA, ' + coCRLF +
                '                 C.CUENTA_BANCO,              CCC.ID_ACREDITADO, CCC.ID_CREDITO, ' + coCRLF +
                '                 CCC.CVE_EMISOR_NAFIN,  CCC.SIT_CHEQUERA, CCC.CVE_TIPO_CHEQ, CCC.CVE_TIP_OPE_CHQ, ' + coCRLF +
                '                 CCC.B_PREDETERMINADA, CCC.CVE_MONEDA, CCC.CVE_TIPO_ACRED ' + coCRLF +
                '          FROM CHEQUERA_CTE C, CR_CRED_CHEQ CCC ' + coCRLF +
                '          WHERE CCC.ID_TITULAR = C.ID_PERSONA ' + coCRLF +
                '            AND CCC.ID_BANCO_CHQRA = C.ID_BANCO_CHQRA ' + coCRLF +
                '            AND CCC.CUENTA_BANCO = C.CUENTA_BANCO ' + coCRLF +
                '        UNION ' + coCRLF +
                '          SELECT I.CVE_BANXICO || '' - '' || I.NOM_INET  SUCURSAL, CCC.B_CTA_TERCEROS, ' + coCRLF +
                '                 I.CVE_BANXICO ID_PLAZA , '''' B_DEPURADO, ' + coCRLF +
                '                 '''' TIPO_CUENTA,        I.CVE_BANXICO BANXICO, ' + coCRLF +
                '                 C.ID_TITULAR ID_PERSONA, C.ID_EMPRESA ID_BANCO_CHQRA, ' + coCRLF +
                '                 TO_CHAR(C.ID_CONTRATO)   CUENTA_BANCO,              CCC.ID_ACREDITADO, CCC.ID_CREDITO, ' + coCRLF +
                '                 CCC.CVE_EMISOR_NAFIN,  CCC.SIT_CHEQUERA, CCC.CVE_TIPO_CHEQ, CCC.CVE_TIP_OPE_CHQ, ' + coCRLF +
                '                 CCC.B_PREDETERMINADA, CCC.CVE_MONEDA, CCC.CVE_TIPO_ACRED ' + coCRLF +
                '          FROM INTERMEDIARIO I, CONTRATO C, CR_CRED_CHEQ CCC ' + coCRLF +
                '          WHERE I.ID_INTERMEDIARIO = C.ID_EMPRESA ' + coCRLF +
                '            AND CCC.ID_TITULAR = C.ID_TITULAR ' + coCRLF +
                '            AND CCC.ID_BANCO_CHQRA = C.ID_EMPRESA ' + coCRLF +
                '            AND CCC.CUENTA_BANCO = C.ID_CONTRATO ' + coCRLF +
                '        UNION ' + coCRLF +
                '          SELECT C.PLAZA || '' - '' || C.NOMBRE_PLAZA SUCURSAL,CCC.B_CTA_TERCEROS, ' + coCRLF +
                '                 C.PLAZA ,           '''' B_DEPURADO, ' + coCRLF +
                '                 '''' TIPO_CUENTA,     C.ABA BANXICO, ' + coCRLF +
                '                 C.ID_PERSONA,       C.ID_BANCO_CHQRA, ' + coCRLF +
                '                 C.CUENTA_BANCO,              CCC.ID_ACREDITADO, CCC.ID_CREDITO, ' + coCRLF +
                '                 CCC.CVE_EMISOR_NAFIN,  CCC.SIT_CHEQUERA, CCC.CVE_TIPO_CHEQ, CCC.CVE_TIP_OPE_CHQ, ' + coCRLF +
                '                 CCC.B_PREDETERMINADA, CCC.CVE_MONEDA, CCC.CVE_TIPO_ACRED ' + coCRLF +
                '          FROM CR_CHQRA_DLLS C, CR_CRED_CHEQ CCC ' + coCRLF +
                '          WHERE CCC.ID_TITULAR = C.ID_PERSONA ' + coCRLF +
                '            AND CCC.ID_BANCO_CHQRA = C.ID_BANCO_CHQRA ' + coCRLF +
                '            AND CCC.CUENTA_BANCO = C.CUENTA_BANCO ' + coCRLF +
                '        ) ' + coCRLF +
                '      ) CTE, ' + coCRLF +
                '      MONEDA M, PERSONA PB , PERSONA PA, PERSONA PT ' + coCRLF +
                ' WHERE PT.ID_PERSONA      = CTE.ID_PERSONA ' + coCRLF +
                '   AND PA.ID_PERSONA      = CTE.ID_ACREDITADO ' + coCRLF +
                '   AND PB.ID_PERSONA      = CTE.ID_BANCO_CHQRA ' + coCRLF +
                '   AND M.CVE_MONEDA       = CTE.CVE_MONEDA ' + coCRLF;

          if Padre.FieldByName('UTIL_ID_ACRED').AsString = 'V' then
             WCrQRCtaAcred.cadenSQL:=WCrQRCtaAcred.cadenSQL + ' AND ( CTE.ID_ACREDITADO = ' +
                                        Padre.FieldByName('ID_ACREDITADO').AsSQL + ')'+ coCRLF;
          //end if
               //FALTA LINEAS  **************
          if Padre.FieldByName('UTIL_ID_CREDITO').AsString = 'V' then
             WCrQRCtaAcred.cadenSQL:=WCrQRCtaAcred.cadenSQL + ' AND ( CTE.ID_CREDITO = '     +
                                        Padre.FieldByName('ID_CREDITO').AsSQL + ')'+ coCRLF;
          //end if

          if Padre.FieldByName('UTIL_ID_BANCO').AsString = 'V' then
             WCrQRCtaAcred.cadenSQL:=WCrQRCtaAcred.cadenSQL + ' AND ( CTE.ID_BANCO_CHQRA = ' +
                                        Padre.FieldByName('ID_BANCO').AsSQL   + ')'+ coCRLF;
          //end if
          if Padre.FieldByName('UTIL_MONEDA').AsString = 'V' then
             WCrQRCtaAcred.cadenSQL:=WCrQRCtaAcred.cadenSQL + ' AND ( CTE.CVE_MONEDA = '     +
                                        Padre.FieldByName('CVE_MONEDA').AsSQL + ')'+ coCRLF;
          //end if

          if Padre.FieldByName('B_CTA_TERCEROS').AsString = 'V' then
             WCrQRCtaAcred.cadenSQL:=WCrQRCtaAcred.cadenSQL + ' AND ( CTE.B_CTA_TERCEROS = ' +
                                        SQLStr( Padre.FieldByName('B_CTA_TERCEROS').AsSQL) + ')'+ coCRLF;
          //end if

          vlTipoAcred := Padre.FieldByName('CVE_TIPO_ACRED').AsSQL;
          vlTipoCheq  := Padre.FieldByName('CVE_TIPO_CHEQ').AsSQL;
          vlOper := Padre.FieldByName('CVE_TIP_OPE_CHQ').AsSQL;
          IF ( Padre.FieldByName('SIT_CHEQUERA').AsSQL = C_AMBOS )then
             vlSit  := ''
          ELSE
             vlSit  := Padre.FieldByName('SIT_CHEQUERA').AsSQL;

          if vlTipoAcred <> '' then
             WCrQRCtaAcred.cadenSQL:=WCrQRCtaAcred.cadenSQL + ' AND ( CTE.CVE_TIPO_ACRED = ' + #39 +
                                        Padre.FieldByName('CVE_TIPO_ACRED').AsSQL + #39 + ')';
          //end if
          if ((vlTipoCheq <> '') and (vlTipoCheq <> C_CHQIND)) then
             WCrQRCtaAcred.cadenSQL:=WCrQRCtaAcred.cadenSQL + ' AND ( CTE.CVE_TIPO_CHEQ = ' + #39 +
                                        Padre.FieldByName('CVE_TIPO_CHEQ').AsSQL + #39 + ')';
          //end if
           if vlOper <> '' then
             WCrQRCtaAcred.cadenSQL:=WCrQRCtaAcred.cadenSQL + ' AND ( CTE.CVE_TIP_OPE_CHQ = ' + #39 +
                                        Padre.FieldByName('CVE_TIP_OPE_CHQ').AsSQL + #39 + ')';
          //end if

          if ( vlSit <> '' ) THEN
                WCrQRCtaAcred.cadenSQL:=WCrQRCtaAcred.cadenSQL + ' AND ( CTE.SIT_CHEQUERA = ' + #39 +
                                        Padre.FieldByName('SIT_CHEQUERA').AsSQL + #39 + ')';
          //end if


          WCrQRCtaAcred.cadenSQL:=WCrQRCtaAcred.cadenSQL +
                        ' ORDER BY PA.NOMBRE,M.CVE_MONEDA, CTE.CVE_EMISOR_NAFIN, CTE.ID_CREDITO ';

          WCrQRCtaAcred.QCtaAcred.SQL.Add(WCrQRCtaAcred.cadenSQL);
          WCrQRCtaAcred.QCtaAcred.DatabaseName:=Padre.Apli.DataBaseName;
          WCrQRCtaAcred.QCtaAcred.SessionName:=Padre.Apli.SessionName;
          WCrQRCtaAcred.QRInterEncabezado1.Apli := Padre.Apli;

          WCrQRCtaAcred.QCtaAcred.Open;

          if WCrQRCtaAcred.QCtaAcred.IsEmpty then
              ShowMessage('No Existen Datos para el Reporte,  Reintente mas tarde.  Gracias !!')
          else
          begin
               if ShowPreview then
                  WCrQRCtaAcred.Preview
               else
                   WCrQRCtaAcred.Print;
               //end if
          end;
     finally
            WCrQRCtaAcred.Free;
     end;
end;

end.
