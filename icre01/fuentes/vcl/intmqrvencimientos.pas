// Modificaciones : 04 10 2005    Reporte de Vencimientos .
unit IntMQrVencimientos;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, unSQL2,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, Dialogs, IntGenCre;
Const
   coCRLF      = #13#10;
type
  TQrVencimientos = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    qyVencimiento: TQuery;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRShape3: TQRShape;
    QRLabel15: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel18: TQRLabel;
    QRShape6: TQRShape;
    QRLabel20: TQRLabel;
    QRShape7: TQRShape;
    QRLabel22: TQRLabel;
    QRShape8: TQRShape;
    QRLabel24: TQRLabel;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape21: TQRShape;
    QRShape19: TQRShape;
    QRLabel28: TQRLabel;
    QRGroupNombre : TQRGroup;
    QRLabel30: TQRLabel;
    QRShape25: TQRShape;
    QRLabel45: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    qrTituloGrupo: TQRLabel;
    QRDBText1: TQRDBText;
    qrGpoAsoc: TQRGroup;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qrGpoAdm: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRGroup4: TQRGroup;
    QRLabel4: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRGroup5: TQRGroup;
    QRLabel5: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    qrGpoTitular: TQRGroup;
    qrGpoProv: TQRGroup;
    QRLabel6: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRGroup8: TQRGroup;
    QRGroup9: TQRGroup;
    qrOperando: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRBand2: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRBand3: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRBand4: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    SummaryBand1: TQRBand;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup8BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
      TipoFecha:String;
   public
   Function FormaQuery(
      pFECHA: TDateTime;pACREDITADO: Integer;pCFECHA: String;
      pF_FINAL: TDateTime;pF_INICIO: TDateTime;pGPOPROD: String;
      pID_CREDITO,pID_EMPRESA,pMONEDA: Integer;pOPERANAFIN,pORDEN,
      pPRODUCTO:String;pPROMADM,pPROMASOC,pPROVEEDOR:Integer;
      pMUESTRA_ADM,pMUESTRA_ASOC,pMUESTRA_ACRED,pMUESTRA_PROV:String):String;
   end;

var
  QrVencimientos: TQrVencimientos;
  bGenArch: Boolean;
  Apli : TInterApli;
  sArchivo:String;
  F: TextFile;

Procedure RepVencimientos(
      pFECHA: TDateTime;pACREDITADO: Integer;pCFECHA: String;
      pF_FINAL: TDateTime;pF_INICIO: TDateTime;pGPOPROD: String;
      pID_CREDITO,pID_EMPRESA,pMONEDA: Integer;pOPERANAFIN,pORDEN,
      pPRODUCTO:String;pPROMADM,pPROMASOC,pPROVEEDOR:Integer;
      pMUESTRA_ADM,pMUESTRA_ASOC,pMUESTRA_ACRED,pMUESTRA_PROV,NbrArch:String;
      pAPli     : TInterApli;pPreview  : Boolean);
Implementation
{$R *.DFM}

function  NvlStr( pStr, pStrNvl : String ) : String;
begin
   If pStr <> '' Then
      Result := pStr
   Else
      Result := pStrNvl;
end;

Procedure RepVencimientos(
      pFECHA: TDateTime;pACREDITADO: Integer;pCFECHA: String;
      pF_FINAL: TDateTime;pF_INICIO: TDateTime;pGPOPROD: String;
      pID_CREDITO,pID_EMPRESA,pMONEDA: Integer;pOPERANAFIN,pORDEN,
      pPRODUCTO:String;pPROMADM,pPROMASOC,pPROVEEDOR:Integer;
      pMUESTRA_ADM,pMUESTRA_ASOC,pMUESTRA_ACRED,pMUESTRA_PROV,NbrArch:String;
      pAPli     : TInterApli;pPreview  : Boolean);
Var
   QrVencimientos: TQrVencimientos;
   VLTitulo : String;
   Preview     : TIntQRPreview;
Begin
   VLTitulo := '';
   QrVencimientos:=TQrVencimientos.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrVencimientos);

   Try
      bGenArch:= False;
      Apli := pApli;
      sArchivo:= NbrArch;
      QrVencimientos.QRInterEncabezado1.Apli:=pApli;
      QrVencimientos.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrVencimientos.QRInterEncabezado1.Titulo1 := 'Vencimientos';
      qrVencimientos.TipoFecha:= pCFECHA;
      //Pone titulo
      If Trim(pCFECHA)='F_VENCIMIENTO' Then
         VLTitulo := VLTitulo + ' Por fecha de Vencimiento ';
      If Trim(pCFECHA)='F_PROG_PAGO' Then
         VLTitulo := VLTitulo + ' Por fecha de Programación ';

      VLTitulo := VLTitulo + ' Del: ' + FormatDateTime('dd/mm/yyyy',pF_INICIO);
      VLTitulo := VLTitulo + ' al: ' + FormatDateTime('dd/mm/yyyy',pF_FINAL);




      If (Trim(pGPOPROD)<>'') Then
         VLTitulo := VLTitulo + ' Por Gpo Prod';
      If (Trim(pPRODUCTO)<>'') Then
         VLTitulo := VLTitulo + ' Por Producto';
      If (pMONEDA>0) Then
         VLTitulo := VLTitulo + ' Por Moneda';
      If (pPROVEEDOR>0) Then
         VLTitulo := VLTitulo + ' Por Proveedor';
      If (pPROMASOC>0) Then
         VLTitulo := VLTitulo + ' Por Prom. Asoc.';
      If (pPROMADM>0) Then
         VLTitulo := VLTitulo + ' Por Prom. Adm.';
      If (pID_CREDITO>0) Then
         VLTitulo := VLTitulo + ' Por Disposición';

      QrVencimientos.QRInterEncabezado1.Titulo2 := VLTitulo;
      QrVencimientos.qyVencimiento.DatabaseName := pApli.DataBaseName;
      QrVencimientos.qyVencimiento.SessionName := pApli.SessionName;

      If Trim(pMUESTRA_ADM)='F' Then Begin
         QrVencimientos.qrGpoAdm.Enabled:=False;
      End;
      If Trim(pMUESTRA_ASOC)='F' Then Begin
         QrVencimientos.qrGpoAsoc.Enabled:=False;
      End;

      If (Trim(pMUESTRA_ACRED)='F') And (Trim(pMUESTRA_PROV)='F') Then Begin
         QrVencimientos.qrGpoTitular.Enabled:= False;
         QrVencimientos.qrGpoProv.Enabled:= False;
      End Else If (Trim(pMUESTRA_ACRED)='F') And (Trim(pMUESTRA_PROV)='V') Then Begin
         QrVencimientos.qrGpoTitular.Enabled:= False;
         QrVencimientos.qrGpoProv.Enabled:= True;
      End Else If (Trim(pMUESTRA_ACRED)='V') And (Trim(pMUESTRA_PROV)='F') Then Begin
         QrVencimientos.qrGpoTitular.Enabled:= True;
         QrVencimientos.qrGpoProv.Enabled:= False;
      End Else Begin
         QrVencimientos.qrGpoTitular.Enabled:= True;
         QrVencimientos.qrGpoProv.Enabled:= False;
      End;


      QrVencimientos.qyVencimiento.Active:=False;
      QrVencimientos.qyVencimiento.SQL.Text:= QrVencimientos.FormaQuery(
         pFECHA,pACREDITADO,pCFECHA,pF_FINAL,pF_INICIO,pGPOPROD,
         pID_CREDITO,pID_EMPRESA,pMONEDA,pOPERANAFIN,pORDEN,
         pPRODUCTO,pPROMADM,pPROMASOC,pPROVEEDOR,
         pMUESTRA_ADM,pMUESTRA_ASOC,pMUESTRA_ACRED,pMUESTRA_PROV);
      //QrVencimientos.qyVencimiento.SQL.SaveToFile('C:\QRY_FND_VENTTO.CHK.SQL');

      QrVencimientos.qyVencimiento.Active:=True;
      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrVencimientos.QRInterEncabezado1.Titulo1+ #09 );
         Writeln(F, VLTitulo+ #09 );
         Writeln(F,  #09 );
         Writeln(F,
             'Fecha'+ #09 +
             'Promotor Asociado'+ #09+ 'Nombre Promotor Asociado' +#09 +
             'Promotor Administrador'+#09 + 'Nombre Promotor Administrador' +#09 +
             'Moneda' + #09+'Descripción Moneda'+#09+
             'Producto' + #09+ 'Descripción Producto' +#09 +
             'Cliente' +  #09 + #09 +
             'Proveedor' +#09 + #09 +
             'Operado por Nafin'+ #09 +
             'Cesion/Crédito' +  #09+
             'Concepto' +  #09 +
             'Periodo/Documento '+ #09 +
             'Plazo' +  #09 +
             'Fecha Inicio' +#09 +
             'Fecha Vencimiento'+ #09+
             'Fecha Programada'+ #09 +
             'Fecha de Pago'+#09 +
             'Tasa Activa'+ #09 +
             'Tasa Pasiva'+ #09 +
             'Importe Nominal'+ #09 +
             'Importe Pasivo'+ #09 +
             'IVA Nominal'+ #09 +
             'IVA Pasivo'+ #09 +
             'Total Nominal'+ #09 +
             'Total Pasivo'+ #09 +
             'Situación'+ #09 );
      End;

      If pPreview Then
          QrVencimientos.Preview
      Else
          QrVencimientos.Print;
   Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrVencimientos.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrVencimientos.FormaQuery(
      pFECHA: TDateTime;pACREDITADO: Integer;pCFECHA: String;
      pF_FINAL: TDateTime;pF_INICIO: TDateTime;pGPOPROD: String;
      pID_CREDITO,pID_EMPRESA,pMONEDA: Integer;pOPERANAFIN,pORDEN,
      pPRODUCTO:String;pPROMADM,pPROMASOC,pPROVEEDOR:Integer;
      pMUESTRA_ADM,pMUESTRA_ASOC,pMUESTRA_ACRED,pMUESTRA_PROV:String):String;
Var
   sSQL:String; slSQL: TStringList;
Begin

   sSQL:= ' SELECT REG.*, CC.ID_PROM_ADM, PADM.NOMBRE AS PROM_ADM,'+
          '        CTO.ID_PERS_ASOCIAD, PASC.NOMBRE AS PROM_ASC,'+
          '        CCTO.CVE_MONEDA, MON.DESC_MONEDA,'+
          '        CCTO.CVE_PRODUCTO_CRE, CPR.DESC_L_PRODUCTO,'+
          '        CCN.ID_PROVEEDOR, PROV.NOMBRE AS NOM_PROV, CCN.B_OPERADO_NAFIN,'+
          '        CTO.ID_TITULAR, PTIT.NOMBRE AS TITULAR'+
          '   FROM (SELECT ''CAPITAL'' AS CONCEPTO, ID_CREDITO, PERDOC, PLAZO, F_INICIO,'+
          '                F_VENCIMIENTO, F_PROG_PAGO, F_PAGO, TACTIVA, TPASIVA, SIT_CAPITAL,'+
          '                IMP_NOMINAL, 0 AS IMP_PASIVO, 0 AS IMP_IVA_PASIVO,0 AS IMP_IVA_NOMINAL,'+
          '                IMP_NOMINAL AS T_NOMINAL, 0 AS T_IVA_NOMINAL'+
          '           FROM (SELECT CP.*, NVL2(CD.ID_DOCUMENTO,CD.ID_DOCUMENTO,CP.NUM_PERIODO) AS PERDOC,'+
          '                        (F_VENCIMIENTO-PLAZO) AS F_INICIO, 0 AS TACTIVA, 0 AS TPASIVA,'+
          '          		        NVL(CP.IMP_CAPITAL,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO,'+
          '       			        NUM_PERIODO,NULL,'+
                       ' TO_DATE('''+ FormatDateTime('dd/mm/yyyy',pF_INICIO) +''',''DD/MM/YYYY'')'+
//HERJA ENERO 2013
//          '                       ,''V''))AS IMP_NOMINAL'+
          '                       ,''V'')) + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) AS IMP_NOMINAL'+
//
          '                   FROM CR_CAPITAL CP, CR_DOCUMENTO CD'+
//HERJA ENERO 2013
	  '			   ,(  '+
	  '			     SELECT CT.ID_CREDITO, CT.ID_PERIODO, '+
	  '	                            NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_PGDMCP'+
	  '	                       FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT'+
	  '	                      WHERE 1=1'+
	  '	                        AND CT.SIT_TRANSACCION = ''AC'''+
	  '	                        AND CT.ID_TRANS_CANCELA IS NULL'+
	  '	                        AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION'+
	  '	                        AND CT.CVE_OPERACION IN (''PGDMCP'')'+
	  '			        AND CDT.CVE_CONCEPTO IN (''IMPBRU'')'+
	  '	                      GROUP BY CT.ID_CREDITO, CT.ID_PERIODO'+
	  '			    ) CA_HIST_PGDMCP'+
//FIN HERJA
          '                  WHERE '+ pCFECHA +
          '                    BETWEEN '+
                        'TO_DATE('''+ FormatDateTime('dd/mm/yyyy',pF_INICIO) +''',''DD/MM/YYYY'')'+
          '                    AND'+
                        ' TO_DATE('''+ FormatDateTime('dd/mm/yyyy',pF_FINAL) +''',''DD/MM/YYYY'')'+
          '                    AND CD.ID_CESION (+)= CP.ID_CREDITO'+
          '                    AND CD.NUM_PERIODO_DOC (+)= CP.NUM_PERIODO'+
//HERJA ENERO 2013
	  '		       AND CA_HIST_PGDMCP.ID_CREDITO (+)= CP.ID_CREDITO'+
	  '  	               AND CA_HIST_PGDMCP.ID_PERIODO (+)= CP.NUM_PERIODO'+
//FIN HERJA
          '                )CP'+
          '         UNION ALL'+
          '          SELECT ''INTERÉS'' AS CONCEPTO, CI.ID_CREDITO,'+
          '                 TO_CHAR(CI.NUM_PERIODO) AS PERDOC, PLAZO, F_INICIO, F_VENCIMIENTO, F_PROG_PAGO, F_PAGO,'+
          '                 TACTIVA, TPASIVA, SIT_INTERES, IMP_NOMINAL, CI.IMP_PASIVO, CI.IMP_IVA_PASIVO,'+
          '         		 CI.IMP_IVA_NOMINAL,(IMP_NOMINAL + CI.IMP_IVA_NOMINAL)AS T_NOMINAL,'+
          '                 (CI.IMP_PASIVO + CI.IMP_IVA_PASIVO)AS T_IVA_NOMINAL'+
          '            FROM (SELECT CI.*, CI.TASA_APLICADA AS TACTIVA, CFI.TASA_APLICADA AS TPASIVA,'+
          '                         (CI.F_VENCIMIENTO-CI.PLAZO) AS F_INICIO, NVL(CFI.IMP_PASIVO,0) AS IMP_PASIVO,'+
          '         	             NVL(CFI.IMP_IVA_PASIVO,0)AS IMP_IVA_PASIVO,'+
          '          		  	     (NVL(CI.IMP_INTERES_PROY,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPBRU'',CI.ID_CREDITO,'+
          '            	              CI.NUM_PERIODO,NULL,'+
                           ' TO_DATE('''+ FormatDateTime('dd/mm/yyyy',pF_INICIO) +''',''DD/MM/YYYY'')'+
          '                             ,''V'')))AS IMP_NOMINAL,'+
          '         		         (NVL(CI.IMP_IVA_PROY,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPIVA'',CI.ID_CREDITO,'+
          '           	              CI.NUM_PERIODO,NULL,'+
                          ' TO_DATE('''+ FormatDateTime('dd/mm/yyyy',pF_INICIO) +''',''DD/MM/YYYY'')'+
          '                          ,''V'')))AS IMP_IVA_NOMINAL'+
          '                    FROM CR_INTERES CI,'+
          '                         (SELECT ID_CREDITO, NUM_PERIODO,  MAX(TASA_APLICADA)AS TASA_APLICADA,'+
          '                                 SUM(IMP_INTERES_PROY)AS IMP_PASIVO, SUM(IMP_IVA_PROY)AS IMP_IVA_PASIVO'+
          '                            FROM CR_FND_INTERES CFI'+
          '                           GROUP BY ID_CREDITO, NUM_PERIODO'+
          '                         )CFI'+
          '                   WHERE '+ pCFECHA +' BETWEEN '+
                         ' TO_DATE('''+ FormatDateTime('dd/mm/yyyy',pF_INICIO) +''',''DD/MM/YYYY'')'+
          '                     AND'+
                         ' TO_DATE('''+ FormatDateTime('dd/mm/yyyy',pF_FINAL) +''',''DD/MM/YYYY'')'+
          '                     AND CFI.ID_CREDITO (+)= CI.ID_CREDITO'+
          '                     AND CFI.NUM_PERIODO (+)= CI.NUM_PERIODO'+
          '                 )CI'+
          '         UNION ALL'+
          '          SELECT ''FINANCIAMIENTO'' AS CONCEPTO, CFA.ID_CREDITO,'+
          '                 TO_CHAR(CFA.NUM_PERIODO) AS PERDOC, PLAZO, F_INICIO, F_VENCIMIENTO, F_PROG_PAGO, F_PAGO,'+
          '                 TACTIVA, TPASIVA, SIT_FINAN_ADIC, IMP_NOMINAL,'+
          '         		 0 AS IMP_PASIVO, 0 AS IMP_IVA_PASIVO, 0 AS IMP_IVA_NOMINAL,'+
          '         		 IMP_NOMINAL AS T_NOMINAL, 0 AS T_IVA_NOMINAL'+
          '            FROM (SELECT CFA.*, 0 AS TACTIVA, 0 AS TPASIVA,'+
          '                         (F_VENCIMIENTO-PLAZO) AS F_INICIO,'+
          '         		         NVL(CFA.IMP_FINAN_ADIC,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',CFA.ID_CREDITO,'+
          '           	             CFA.NUM_PERIODO,NULL,'+
                         ' TO_DATE('''+ FormatDateTime('dd/mm/yyyy',pF_INICIO) +''',''DD/MM/YYYY'')'+
          '                         ,''V''))AS IMP_NOMINAL'+
          '                    FROM CR_FINAN_ADIC CFA'+
          '                   WHERE '+ pCFECHA +' BETWEEN '+
                        ' TO_DATE('''+ FormatDateTime('dd/mm/yyyy',pF_INICIO) +''',''DD/MM/YYYY'')'+
          '                     AND'+
                        ' TO_DATE('''+ FormatDateTime('dd/mm/yyyy',pF_FINAL) +''',''DD/MM/YYYY'')'+
          '                 )CFA'+
          '         UNION ALL'+
          '          SELECT ''COMISIÓN'' AS CONCEPTO, CN.ID_CREDITO,'+
          '                 TO_CHAR(CN.NUM_PERIODO) AS PERDOC, PLAZO, F_INICIO, F_VENCIMIENTO, F_PROG_PAGO, F_PAGO,'+
          '                 TACTIVA, TPASIVA, SIT_COMISION, IMP_NOMINAL, 0 AS IMP_PASIVO, 0 AS IMP_IVA_PASIVO,'+
          '                 IMP_IVA_NOMINAL,(IMP_NOMINAL + IMP_IVA_NOMINAL)AS T_NOMINAL, 0 AS T_IVA_NOMINAL'+
          '            FROM (SELECT CN.* , 0 AS TACTIVA, 0 AS TPASIVA,'+
          '                         (F_VENCIMIENTO-PLAZO) AS F_INICIO,'+
          '         		         NVL(CN.IMP_COMISION,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPBRU'',CN.ID_CREDITO,'+
          '           	             CN.NUM_PERIODO,NULL,'+
                         ' TO_DATE('''+ FormatDateTime('dd/mm/yyyy',pF_INICIO) +''',''DD/MM/YYYY'')'+
          '                         ,''V''))AS IMP_NOMINAL,'+
          '         		         NVL(CN.IMP_IVA,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPIVA'',CN.ID_CREDITO,'+
          '           	             CN.NUM_PERIODO,NULL,'+
                         ' TO_DATE('''+ FormatDateTime('dd/mm/yyyy',pF_INICIO) +''',''DD/MM/YYYY'')'+
          '                         ,''V''))AS IMP_IVA_NOMINAL'+
          '                    FROM CR_COMISION CN'+
          '                   WHERE '+ pCFECHA +' BETWEEN'+
                         ' TO_DATE('''+ FormatDateTime('dd/mm/yyyy',pF_INICIO) +''',''DD/MM/YYYY'')'+
          '                     AND'+
                         ' TO_DATE('''+ FormatDateTime('dd/mm/yyyy',pF_FINAL) +''',''DD/MM/YYYY'')'+
          '                 )CN'+
          '        )REG, CR_CREDITO CC, CR_CONTRATO CCTO, CONTRATO CTO, MONEDA MON,'+
          '        CR_PRODUCTO CPR, CR_CESION CCN, PERSONA PADM, PERSONA PASC, PERSONA PROV,'+
          '        PERSONA PTIT'+
          '  WHERE CC.ID_CREDITO = REG.ID_CREDITO'+
          '    AND CCTO.ID_CONTRATO = CC.ID_CONTRATO'+
          '    AND CCTO.FOL_CONTRATO = CC.FOL_CONTRATO'+
          '    AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+
          '    AND MON.CVE_MONEDA = CTO.CVE_MONEDA'+
          '    AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE'+
          '    AND CCN.ID_CESION (+)= CC.ID_CREDITO'+
          '    AND PADM.ID_PERSONA = CC.ID_PROM_ADM'+
          '    AND PASC.ID_PERSONA = CTO.ID_PERS_ASOCIAD'+
          '    AND PROV.ID_PERSONA (+)= CCN.ID_PROVEEDOR'+
          '    AND PTIT.ID_PERSONA = CTO.ID_TITULAR';

   If pID_EMPRESA <> 0 Then
      sSQL:= sSQL + ' AND CTO.ID_EMPRESA ='+ IntToStr(pID_EMPRESA);
   If pGPOPROD <> '' Then
      sSQL:= sSQL + ' AND CPR.CVE_PRODUCTO_GPO = '''+ pGPOPROD +'''';
   If pPRODUCTO <> '' Then
      sSQL:= sSQL + ' AND CPR.CVE_PRODUCTO_CRE = '''+ pPRODUCTO +'''';
   If pMONEDA <> 0 Then
      sSQL:= sSQL + ' AND CTO.CVE_MONEDA = '+ IntToStr(pMONEDA);
   If pPROMASOC <> 0 Then
      sSQL:= sSQL + ' AND CTO.ID_PERS_ASOCIAD = '+ IntToStr(pPROMASOC);
   If pPROMADM <> 0 Then
      sSQL:= sSQL + ' AND CC.ID_PROM_ADM = '+ IntToStr(pPROMADM);
   If pACREDITADO <> 0 Then
      sSQL:= sSQL + ' AND CTO.ID_TITULAR = '+ IntToStr(pACREDITADO);
   If pPROVEEDOR <> 0 Then
      sSQL:= sSQL + ' AND CCN.ID_PROVEEDOR = '+ IntToStr(pPROVEEDOR);
   If pID_CREDITO <> 0 Then
      sSQL:= sSQL + ' AND REG.ID_CREDITO = '+ IntToStr(pID_CREDITO);
   If pOPERANAFIN <> '' Then
      sSQL:= sSQL + ' AND NVL(CCN.B_OPERADO_NAFIN,''F'') = '''+ pOPERANAFIN+'''';

   sSQL:= sSQL + ' ORDER BY REG.F_VENCIMIENTO, PASC.NOMBRE, PADM.NOMBRE, MON.DESC_MONEDA,'+
                 ' CPR.DESC_L_PRODUCTO, '+ pORDEN ;

   slSQL:= TStringList.Create;
   slSQL.Clear;
   slSQL.Add(sSQL);
   //slSQL.SaveToFile('c:\SQL.txt');
   slSQL.Free;
   Result:= sSQL;
End;

procedure TQrVencimientos.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If TipoFecha='F_VENCIMIENTO' Then
      qrTituloGrupo.Caption:='Fecha de Vencimiento: '
   Else qrTituloGrupo.Caption:='Fecha Programada: ';
end;

procedure TQrVencimientos.QRGroup8BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If qyVencimiento.FieldByName('B_OPERADO_NAFIN').AsString = 'V' Then
      qrOperando.Caption:= 'OPERADO NAFIN'
   ELSE
      qrOperando.Caption:= 'SIN OPERAR NAFIN';
end;

procedure TQrVencimientos.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

   If qyVencimiento.FieldByName('B_OPERADO_NAFIN').AsString = 'V' Then
      QRLabel11.Caption:= 'Total OPERADO NAFIN'
   ELSE
      QRLabel11.Caption:= 'Total SIN OPERAR NAFIN';

   If sArchivo <>'' Then Begin
      Writeln(F,
             QRLabel11.Caption + #09 +
             #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr7.Value.dblResult)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr8.Value.dblResult)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr9.Value.dblResult)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr10.Value.dblResult)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr11.Value.dblResult)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr12.Value.dblResult));
   End;

end;

procedure TQrVencimientos.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If qyVencimiento.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

procedure TQrVencimientos.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F,
             FormatDateTime('dd/mm/yyyy',qyVencimiento.FieldByName('F_VENCIMIENTO').AsDateTime)+ #09 +
             qyVencimiento.FieldByName('ID_PERS_ASOCIAD').AsString+ #09+
             qyVencimiento.FieldByName('PROM_ASC').AsString+#09 +
             qyVencimiento.FieldByName('ID_PROM_ADM').AsString+ #09+
             qyVencimiento.FieldByName('PROM_ADM').AsString+#09 +
             qyVencimiento.FieldByName('CVE_MONEDA').AsString+ #09+
             qyVencimiento.FieldByName('DESC_MONEDA').AsString+#09 +
             qyVencimiento.FieldByName('CVE_PRODUCTO_CRE').AsString+ #09+
             qyVencimiento.FieldByName('DESC_L_PRODUCTO').AsString+#09 +
             qyVencimiento.FieldByName('ID_TITULAR').AsString+ #09+
             qyVencimiento.FieldByName('TITULAR').AsString+#09 +
             qyVencimiento.FieldByName('ID_PROVEEDOR').AsString+ #09+
             qyVencimiento.FieldByName('NOM_PROV').AsString+#09 +
             qyVencimiento.FieldByName('B_OPERADO_NAFIN').AsString+#09 +
             qyVencimiento.FieldByName('ID_CREDITO').AsString+#09 +
             qyVencimiento.FieldByName('CONCEPTO').AsString+#09 +
             qyVencimiento.FieldByName('PERDOC').AsString+#09 +
             qyVencimiento.FieldByName('PLAZO').AsString+#09 +
             FormatDateTime('dd/mm/yyyy',qyVencimiento.FieldByName('F_INICIO').AsDateTime)+#09 +
             FormatDateTime('dd/mm/yyyy',qyVencimiento.FieldByName('F_VENCIMIENTO').AsDateTime)+#09 +
             FormatDateTime('dd/mm/yyyy',qyVencimiento.FieldByName('F_PROG_PAGO').AsDateTime)+#09 +
             FormatDateTime('dd/mm/yyyy',qyVencimiento.FieldByName('F_PAGO').AsDateTime)+#09 +
             qyVencimiento.FieldByName('TACTIVA').AsString+#09 +
             qyVencimiento.FieldByName('TPASIVA').AsString+#09 +
             FormatFloat('###,###,###,###,###,##0.00',qyVencimiento.FieldByName('IMP_NOMINAL').AsFloat)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',qyVencimiento.FieldByName('IMP_PASIVO').AsFloat)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',qyVencimiento.FieldByName('IMP_IVA_NOMINAL').AsFloat)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',qyVencimiento.FieldByName('IMP_IVA_PASIVO').AsFloat)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',qyVencimiento.FieldByName('T_NOMINAL').AsFloat)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',qyVencimiento.FieldByName('T_IVA_NOMINAL').AsFloat)+#09 +
             qyVencimiento.FieldByName('SIT_CAPITAL').AsString );
   End;
end;

procedure TQrVencimientos.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F,
             'Total de Crédito '+ #09 +
             #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr1.Value.dblResult)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr2.Value.dblResult)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr3.Value.dblResult)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr4.Value.dblResult)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr5.Value.dblResult)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr6.Value.dblResult));
   End;
end;

procedure TQrVencimientos.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F,
             'Total por Producto ' + #09 +
             #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr13.Value.dblResult)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr14.Value.dblResult)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr15.Value.dblResult)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr16.Value.dblResult)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr17.Value.dblResult)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr18.Value.dblResult));
   End;
end;

procedure TQrVencimientos.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F,
             'Total por Moneda ' + #09 +
             #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr19.Value.dblResult)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr20.Value.dblResult)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr21.Value.dblResult)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr22.Value.dblResult)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr23.Value.dblResult)+#09 +
             FormatFloat('###,###,###,###,###,##0.00',QRExpr24.Value.dblResult));
   End;
end;

End.
