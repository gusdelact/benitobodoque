Unit IntQrResumCr;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport, U_InterCustomStar,
  U_InterDigDoc, IntBlqCtos;
Type
  TQrResumCR = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qyResum: TQuery;
    QRSHPTCredito: TQRShape;
    QRLabel9: TQRLabel;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRGroupContador: TQRGroup;
    QRDBText16: TQRDBText;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRShape10: TQRShape;
    QRLabel11: TQRLabel;
    QRShape20: TQRShape;
    QRLabel25: TQRLabel;
    qrfModulo: TQRBand;
    QRShape25: TQRShape;
    QRLabel17: TQRLabel;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    QRLabel5: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    qyResumMODULO: TStringField;
    qyResumCREDITO: TFloatField;
    qyResumNOMBRE: TStringField;
    qyResumPROG: TFloatField;
    qyResumVDOS: TFloatField;
    qyResumCAPITAL: TFloatField;
    qyResumINTERES: TFloatField;
    qyResumIVA_INTERES: TFloatField;
    qyResumCOMISION: TFloatField;
    qyResumIVA_COMISION: TFloatField;
    qyResumMORAS: TFloatField;
    qyResumDIR_CTE: TStringField;
    qyResumTEL_CASA: TStringField;
    qyResumAVAL: TStringField;
    qyResumTEL_AVAL: TStringField;
    qyResumDOM_AVAL: TStringField;
    qyResumJOB: TStringField;
    qyResumDOM_JOB: TStringField;
    qyResumTEL_JOB: TStringField;
    qyResumSUPERV: TStringField;
    qyResumREF_1: TStringField;
    qyResumTEL_REF1: TStringField;
    qyResumREF_2: TStringField;
    qyResumTEL_REF2: TStringField;
    qrlTOTAL_CICLO: TQRLabel;
    QRShape4: TQRShape;
    QRLabel24: TQRLabel;
    QRShape11: TQRShape;
    QRLabel26: TQRLabel;
    QRDBText9: TQRDBText;
    qyResumNUM_PAGOS: TFloatField;
    qyResumFREC_PAGO: TStringField;
    QRDBText27: TQRDBText;
    ADEUDO: TQRLabel;
    qyResumPAG: TFloatField;
    QRSHPTChequera: TQRShape;
    QRLabel30: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText15: TQRDBText;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText4: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    qrfempresa: TQRBand;
    qrMODULO: TQRGroup;
    QRShape18: TQRShape;
    QRDBText28: TQRDBText;
    QRLabel28: TQRLabel;
    ADEUDO_MOD: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    qyResumID_EMPRESA: TFloatField;
    ADEUDO_TOT: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRShape19: TQRShape;
    QRShape21: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText21: TQRDBText;
    QRShape22: TQRShape;
    QRLabel22: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrfModuloBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrfempresaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  Private
  Public
    Function FormaQuery(sFecha, sEmpresa: String ): String;
  end;
Var
  QrResumCR: TQrResumCR;
  Apli : TInterApli;
  sArchivo:String;
  bGenArch: Boolean;
  F: TextFile;

Procedure RepResumCr( sFecha, sEmpresa, sNbrArch : String;
                      pAPli : TInterApli; pPreview : Boolean
                    );
Implementation
{$R *.DFM}

Procedure RepResumCr( sFecha, sEmpresa, sNbrArch : String;
                      pAPli : TInterApli; pPreview : Boolean
                    );
Var
   QrResumCR: TQrResumCR;
   Preview     : TIntQRPreview;
   sFileName   : String;

Begin
   QrResumCR:=TQrResumCR.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrResumCR);
   Try
      bGenArch:= False;
      Apli := pApli;
      sArchivo:= sNbrArch;
      QrResumCR.QRInterEncabezado1.Apli:=pApli;
      QrResumCR.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrResumCR.QRInterEncabezado1.NomReporte:='IntMQrResumCR';
      QrResumCR.QRInterEncabezado1.Titulo1:='Reporte de la Cartera CrediVa al ' + sFecha;

      QrResumCR.qyResum.DatabaseName := pApli.DataBaseName;
      QrResumCR.qyResum.SessionName := pApli.SessionName;

      QrResumCR.qyResum.Active:=False;
      QrResumCR.qyResum.SQL.Text:= QrResumCR.FormaQuery(sFecha, sEmpresa );
//      QrResumCR.qyResum.SQL.SaveToFile('c:\ResumCR.txt');
      QrResumCR.qyResum.Active:=True;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrResumCR.QRInterEncabezado1.Titulo1 + #09 );
         Writeln(F,
                'MODULO'+ #09 +
                'CREDITO'+ #09 +
                'NOMBRE'+ #09 +
                'TOTALES'+ #09 +
                'PROGRAMADOS'+ #09 +
                'REALIZADOS'+ #09 +
                'VENCIDOS'+ #09 +
                'PAGO TOTAL'+ #09 +
                'CAPITAL'+ #09 +
                'INTERES'+ #09 +
                'IVA INTERES'+ #09 +
                'COMISION'+ #09 +
                'IVA COMISION'+ #09 +
                'MORAS'+ #09 +
                'FRECUENCIA DE PAGO'+ #09 +
                'NUM. PAGOS'+ #09 +
                'DIRECCION DEL CLIENTE'+ #09 +
                'TELEFONO CLIENTE'+ #09 +
                'NOMBRE DEL AVAL'+ #09 +
                'DIRECCION AVAL'+ #09 +
                'TELEFONO AVAL'+ #09 +
                'NOMBRE DEL TRABAJO'+ #09 +
                'DIRECCION TRABAJO'+ #09 +
                'TELEFONO TRABAJO'+ #09 +
                'PERSONA A QUIEN REPORTA'+ #09 +
                'NOMBRE REFERENCIA 1'+ #09 +
                'TELEFONO '+ #09 +
                'NOMBRE REFERENCIA 2'+ #09 +
                'TELEFONO '+ #09
              );
      End;

      If pPreview Then
         QrResumCR.Preview
      Else
         QrResumCR.Print;
   Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrResumCR.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrResumCR.FormaQuery(sFecha,sEmpresa: String): String;
Var
    sSQL :String;
Begin

    //CONCULTA GENERAL
    sSQL:= '  SELECT CTO.ID_EMPRESA, UNI.DESC_ENTIDAD MODULO,  ' + coCRLF +
           '         CR.ID_CREDITO CREDITO, ' + coCRLF +
           '         P.NOMBRE, ' + coCRLF +
           '         ( SELECT COUNT(*) FROM CR_CAPITAL ' + coCRLF +
           '           WHERE ID_CREDITO = CR.ID_CREDITO AND SIT_CAPITAL IN ( ''AC'', ''PA'' ) ) PROG, ' + coCRLF +
           '         ( SELECT COUNT(*) FROM CR_CAPITAL ' + coCRLF +
           '           WHERE ID_CREDITO = CR.ID_CREDITO AND SIT_CAPITAL = ''LQ'' ) PAG, ' + coCRLF +
           '         ( SELECT COUNT(*) FROM CR_CAPITAL ' + coCRLF +
           '           WHERE ID_CREDITO = CR.ID_CREDITO AND SIT_CAPITAL = ''IM'' ) VDOS, ' + coCRLF +
           '       FREC_PAGO, ' + coCRLF +
           '       NUM_PAGOS, ' + coCRLF +
           '       ( SELECT SUM( IMP_CAPITAL - IMP_PAGADO ) ' + coCRLF +
           '         FROM CR_CAPITAL ' + coCRLF +
           '         WHERE ID_CREDITO = CR.ID_CREDITO ' + coCRLF +
           '           AND SIT_CAPITAL NOT IN ( ''LQ'', ''CA'' )) CAPITAL, ' + coCRLF +
           '       ( SELECT SUM( IMP_INTERES - IMP_PAGADO ) ' + coCRLF +
           '         FROM CR_INTERES ' + coCRLF +
           '         WHERE ID_CREDITO = CR.ID_CREDITO ' + coCRLF +
           '           AND SIT_INTERES  NOT IN ( ''LQ'', ''CA'' )) INTERES, ' + coCRLF +
           '       ( SELECT SUM( IMP_IVA - IMP_IVA_PAGADO ) ' + coCRLF +
           '         FROM CR_INTERES ' + coCRLF +
           '         WHERE ID_CREDITO = CR.ID_CREDITO ' + coCRLF +
           '           AND SIT_INTERES  NOT IN ( ''LQ'', ''CA'' )) IVA_INTERES, ' + coCRLF +
           '       ( SELECT SUM( IMP_COMISION - IMP_PAGADO ) ' + coCRLF +
           '         FROM CR_COMISION ' + coCRLF +
           '         WHERE ID_CREDITO = CR.ID_CREDITO ' + coCRLF +
           '           AND SIT_COMISION NOT IN ( ''LQ'', ''CA'' )) COMISION, ' + coCRLF +
           '       ( SELECT SUM( IMP_IVA -IMP_IVA_PAGADO ) ' + coCRLF +
           '         FROM CR_COMISION ' + coCRLF +
           '         WHERE ID_CREDITO = CR.ID_CREDITO ' + coCRLF +
           '           AND SIT_COMISION NOT IN ( ''LQ'', ''CA'' )) IVA_COMISION, ' + coCRLF +
           '       ( SELECT SUM(IMPORTE) ' + coCRLF +
           '         FROM ( ' + coCRLF +
           '             SELECT ID_CREDITO, SUM( IMP_MORATORIO - IMP_PAGADO_MORA + IMP_IVA_MORA -IMP_PAG_IVA_MORA ) IMPORTE ' + coCRLF +
           '             FROM CR_CAPITAL WHERE SIT_CAPITAL NOT IN ( ''LQ'', ''CA'' ) ' + coCRLF +
           '             GROUP BY ID_CREDITO ' + coCRLF +
           '            UNION ' + coCRLF +
           '    		SELECT ID_CREDITO, SUM(IMP_MORATORIO - IMP_PAGADO_MORA + IMP_IVA_MORA -IMP_PAG_IVA_MORA ) IMPORTE ' + coCRLF +
           '             FROM CR_INTERES WHERE SIT_INTERES NOT IN ( ''LQ'', ''CA'' ) ' + coCRLF +
           '             GROUP BY ID_CREDITO ' + coCRLF +
           '            UNION ' + coCRLF +
           '     		 SELECT ID_CREDITO, SUM(IMP_MORATORIO - IMP_PAGADO_MORA + IMP_IVA_MORA -IMP_PAG_IVA_MORA ) IMPORTE ' + coCRLF +
           '             FROM CR_COMISION WHERE SIT_COMISION NOT IN ( ''LQ'', ''CA'' ) ' + coCRLF +
           '             GROUP BY ID_CREDITO ' + coCRLF +
           '               ) ' + coCRLF +
           '         WHERE ID_CREDITO = CR.ID_CREDITO ' + coCRLF +
           '       ) MORAS, ' + coCRLF +
           '	   SUBSTR(DOM.CALLE_NUMERO||'', COL. ''||DOM.COLONIA||'', DEL. ''||CD.DESC_POBLACION||'', ''|| ' + coCRLF +
           '       EDO.DESC_POBLACION||''. C.P. ''||DOM.CODIGO_POSTAL,1,250) DIR_CTE, ' + coCRLF +
           '       P.TELEF_CASA TEL_CASA, ' + coCRLF +
           '       CBS.AVAL, ' + coCRLF +
           '       CBS.TEL_AVAL, ' + coCRLF +
           '       CBS.DOMICILIO    AS DOM_AVAL, ' + coCRLF +
           '       CBS.JOB, ' + coCRLF +
           '       CBS.DOM_JOB, ' + coCRLF +
           '       CBS.TEL_JOB, ' + coCRLF +
           '	   CBS.INM_SUP_NOMBRE SUPERV, ' + coCRLF +
           '       CBS.NOM_1 REF_1, ' + coCRLF +
           '       CBS.TEL_1 TEL_REF1, ' + coCRLF +
           '       CBS.NOM_2 REF_2, ' + coCRLF +
           '       CBS.TEL_2 TEL_REF2 ' + coCRLF +
           'FROM CR_CREDITO CR, ' + coCRLF +
           '     CONTRATO CTO, ' + coCRLF +
           '     UNIDAD_NEGOCIO UNI, ' + coCRLF +
           '     PERSONA P, DOMICILIO DOM, ' + coCRLF +
           '     ( SELECT CBA.AVAL, ' + coCRLF +
           '              CBA.TEL_AVAL, CBS.ID_CREDITO, CBS.NUM_PAGOS, ' + coCRLF +
           '              DECODE(CBS.CVE_UNIDAD_TIEMP,''SE'',''SEMANAL'', ''QUINCENAL'') FREC_PAGO, ' + coCRLF +
           '		  CBA.DOMICILIO, ' + coCRLF +
           '              CBS.NOMBRE_EMPRESA JOB, CBS.TELEF_EMPRESA||'' ''|| CBS.EXT_TEL_EMP TEL_JOB, CBS.INM_SUP_NOMBRE, ' + coCRLF +
           '		  CBS.CALLE_EMP||'' ''||CBS.NUM_EXT_EMP||'' INT. ''||CBS.NUM_INT_EMP||'', C.P.''||CBS.COD_POSTAL_EMP|| '', ''|| ' + coCRLF +
           '              MEMP.DESC_MUNICIPIO||'', EDO. ''||EEMP.DESC_ESTADO DOM_JOB, ' + coCRLF +
           '		  REFER.NOM_1, REFER.TEL_1, REFER.NOM_2, REFER.TEL_2 ' + coCRLF +
           '       FROM CR_BB_SOLICITUD CBS, ' + coCRLF +
           '            ( SELECT A.ID_SOLICITUD, ' + coCRLF +
           '                     A.NOMBRE_PERSONA||'' ''||A.APELLIDO_PATERNO||'' ''||A.APELLIDO_MATERNO AVAL, ' + coCRLF +
           '                     A.TELEF_CASA TEL_AVAL, ' + coCRLF +
           '        	         A.CALLE||'' ''||A.NUM_EXT||'' INT. ''||A.NUM_INT||'', C.P.''||A.CODIGO_POSTAL|| '', ''||' + coCRLF +
           '                     M.DESC_MUNICIPIO||'', EDO. ''||E.DESC_ESTADO DOMICILIO ' + coCRLF +
           '              FROM CR_BB_SOL_AVAL A, ' + coCRLF +
           '                   BC_MUNICIPIO M, ' + coCRLF +
           '                   BC_ESTADO   E ' + coCRLF +
           '              WHERE A.CVE_MUNICIPIO = M.CVE_MUNICIPIO ' + coCRLF +
           '                AND A.CVE_ESTADO = M.CVE_ESTADO ' + coCRLF +
           '                AND A.CVE_ESTADO = E.CVE_ESTADO ' + coCRLF +
           '            ) CBA, ' + coCRLF +
           '            BC_MUNICIPIO MEMP, ' + coCRLF +
           '            BC_ESTADO    EEMP, ' + coCRLF +
           '            (SELECT R1.ID_SOLICITUD, R1.NOMBRE NOM_1, R1.TELEFONO TEL_1, R2.NOMBRE NOM_2, R2.TELEFONO TEL_2 ' + coCRLF +
           '             FROM(SELECT ID_SOLICITUD, CVE_TIPO_REFER, ' + coCRLF +
           '                         NOMBRE_PERSONA||'' ''||APELLIDO_PATERNO||'' ''||APELLIDO_MATERNO NOMBRE, TELEFONO ' + coCRLF +
           '                  FROM CR_BB_SOL_REFER ' + coCRLF +
           '                  WHERE CVE_TIPO_REFER = ''RF_1'')R1, ' + coCRLF +
           '                 (SELECT ID_SOLICITUD, CVE_TIPO_REFER, ' + coCRLF +
           '                         NOMBRE_PERSONA||'' ''||APELLIDO_PATERNO||'' ''||APELLIDO_MATERNO NOMBRE, TELEFONO ' + coCRLF +
           '                  FROM CR_BB_SOL_REFER ' + coCRLF +
           '                  WHERE CVE_TIPO_REFER = ''RF_2'')R2 ' + coCRLF +
           '             WHERE R1.ID_SOLICITUD = R2.ID_SOLICITUD ' + coCRLF +
           '            )REFER ' + coCRLF +
           '       WHERE CBA.ID_SOLICITUD(+) = CBS.ID_SOLICITUD ' + coCRLF +
           '         AND CBS.CVE_MUNIC_EMP = MEMP.CVE_MUNICIPIO ' + coCRLF +
           '         AND CBS.CVE_ESTADO_EMP = MEMP.CVE_ESTADO ' + coCRLF +
           '         AND CBS.CVE_ESTADO_EMP = EEMP.CVE_ESTADO ' + coCRLF +
           '         AND REFER.ID_SOLICITUD(+) = CBS.ID_SOLICITUD ' + coCRLF +
           '      ) CBS, ' + coCRLF +
           '	  POBLACION EDO, POBLACION CD ' + coCRLF +
           'WHERE CR.SIT_CREDITO  = ''AC'' ' + coCRLF +
           '  AND CTO.ID_EMPRESA  = '+ sEmpresa + coCRLF +
           '  AND CTO.ID_CONTRATO = CR.ID_CONTRATO ' + coCRLF +
           '  AND UNI.ID_ENTIDAD  = CTO.ID_ENTIDAD ' + coCRLF +
           '  AND P.ID_PERSONA    = CTO.ID_TITULAR ' + coCRLF +
           '  AND CR.ID_CREDITO   = CBS.ID_CREDITO(+) ' + coCRLF +
           '  AND P.ID_DOMICILIO  = DOM.ID_DOMICILIO ' + coCRLF +
           '  AND EDO.CVE_POBLACION = DOM.CVE_ESTADO ' + coCRLF +
           '  AND CD.CVE_POBLACION = DOM.CVE_CIUDAD ' + coCRLF +
           'ORDER BY UNI.DESC_ENTIDAD, CR.ID_CREDITO ' + coCRLF;

   Result:= sSQL;
End;

procedure TQrResumCR.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var vlAdeudo : Double;
begin

   qrlTOTAL_CICLO.Caption := FloatToStr(qyResum.FieldByName('PROG').AsFloat +
               qyResum.FieldByName('PAG').AsFloat +
               qyResum.FieldByName('VDOS').AsFloat) ;

   vlAdeudo := qyResum.FieldByName('CAPITAL').AsFloat +
               qyResum.FieldByName('INTERES').AsFloat +
               qyResum.FieldByName('COMISION').AsFloat +
               qyResum.FieldByName('IVA_INTERES').AsFloat +
               qyResum.FieldByName('IVA_COMISION').AsFloat +
               qyResum.FieldByName('MORAS').AsFloat ;
   ADEUDO.Caption := FormatFloat('###,###,###,###,##0.00',vlAdeudo);

   If Trim(sArchivo)<>'' Then Begin
      Writeln(F,
                qyResum.FieldByName('MODULO').AsString + #09 +
                qyResum.FieldByName('CREDITO').AsString + #09 +
                qyResum.FieldByName('NOMBRE').AsString + #09 +
                qrlTOTAL_CICLO.Caption + #09 +
                qyResum.FieldByName('PROG').AsString + #09 +
                qyResum.FieldByName('PAG').AsString + #09 +
                qyResum.FieldByName('VDOS').AsString + #09 +
                FormatFloat('###,###,###,###,##0.00',vlAdeudo) + #09+
                FormatFloat('###,###,###,###,##0.00',qyResum.FieldByName('CAPITAL').AsFloat) + #09+
                FormatFloat('###,###,###,###,##0.00',qyResum.FieldByName('INTERES').AsFloat) + #09+
                FormatFloat('###,###,###,###,##0.00',qyResum.FieldByName('IVA_INTERES').AsFloat) + #09+
                FormatFloat('###,###,###,###,##0.00',qyResum.FieldByName('COMISION').AsFloat) + #09+
                FormatFloat('###,###,###,###,##0.00',qyResum.FieldByName('IVA_COMISION').AsFloat) + #09+
                FormatFloat('###,###,###,###,##0.00',qyResum.FieldByName('MORAS').AsFloat) + #09+
                qyResum.FieldByName('FREC_PAGO').AsString + #09 +
                qyResum.FieldByName('NUM_PAGOS').AsString + #09 +
                qyResum.FieldByName('DIR_CTE').AsString + #09 +
                qyResum.FieldByName('TEL_CASA').AsString + #09 +
                qyResum.FieldByName('AVAL').AsString + #09 +
                qyResum.FieldByName('DOM_AVAL').AsString + #09 +
                qyResum.FieldByName('TEL_AVAL').AsString + #09 +
                qyResum.FieldByName('JOB').AsString + #09 +
                qyResum.FieldByName('DOM_JOB').AsString + #09 +
                qyResum.FieldByName('TEL_JOB').AsString + #09 +
                qyResum.FieldByName('SUPERV').AsString + #09 +
                qyResum.FieldByName('REF_1').AsString + #09 +
                qyResum.FieldByName('TEL_REF1').AsString + #09 +
                qyResum.FieldByName('REF_2').AsString + #09 +
                qyResum.FieldByName('TEL_REF2').AsString + #09
             );
   End;

end;

procedure TQrResumCR.qrfModuloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var vlAdeudo: Double;
begin
   vlAdeudo := QRExpr1.Value.dblResult + QRExpr2.Value.dblResult + QRExpr3.Value.dblResult +
               QRExpr4.Value.dblResult + QRExpr5.Value.dblResult + QRExpr6.Value.dblResult;
   ADEUDO_MOD.Caption := FormatFloat('###,###,###,###,##0.00',vlAdeudo);

   If sArchivo <>'' Then Begin
      Writeln(F, #09);
      Writeln(F, #09+'TOTAL MODULO:' + #09+ #09 +#09 +#09 +#09 +#09 +
                 FormatFloat('###,###,###,###,###,##0',vlAdeudo) + #09+
                 FormatFloat('###,###,###,###,###,##0.00',QRExpr1.Value.dblResult)+#09+
                 FormatFloat('###,###,###,###,###,##0.00',QRExpr2.Value.dblResult)+#09+
                 FormatFloat('###,###,###,###,###,##0.00',QRExpr4.Value.dblResult)+#09+
                 FormatFloat('###,###,###,###,###,##0.00',QRExpr3.Value.dblResult)+#09+
                 FormatFloat('###,###,###,###,###,##0.00',QRExpr5.Value.dblResult)+#09+
                 FormatFloat('###,###,###,###,###,##0.00',QRExpr6.Value.dblResult)+#09
              );
      Writeln(F, #09);
   End;
end;

procedure TQrResumCR.qrfempresaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var vlAdeudo: Double;
begin
   vlAdeudo := QRExpr7.Value.dblResult  + QRExpr8.Value.dblResult  + QRExpr9.Value.dblResult +
               QRExpr10.Value.dblResult + QRExpr11.Value.dblResult + QRExpr12.Value.dblResult;
   ADEUDO_TOT.Caption := FormatFloat('###,###,###,###,##0.00',vlAdeudo);

   If sArchivo <>'' Then Begin
      Writeln(F, #09);
      Writeln(F, #09+'GRAN TOTAL:' + #09+ #09 +#09 +#09 +#09 +#09 +
                 FormatFloat('###,###,###,###,###,##0',vlAdeudo) + #09+
                 FormatFloat('###,###,###,###,###,##0.00',QRExpr7.Value.dblResult)+#09+
                 FormatFloat('###,###,###,###,###,##0.00',QRExpr8.Value.dblResult)+#09+
                 FormatFloat('###,###,###,###,###,##0.00',QRExpr10.Value.dblResult)+#09+
                 FormatFloat('###,###,###,###,###,##0.00',QRExpr9.Value.dblResult)+#09+
                 FormatFloat('###,###,###,###,###,##0.00',QRExpr11.Value.dblResult)+#09+
                 FormatFloat('###,###,###,###,###,##0.00',QRExpr12.Value.dblResult)+#09
              );
   End;
end;

End.
