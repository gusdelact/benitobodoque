unit IntQrCobCom;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2;
               
type
  TQrCobCom = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    qrsCRED: TQRShape;
    qrlCRED: TQRLabel;
    qrsPER: TQRShape;
    qrsCONCEPTO: TQRShape;
    qrlCONCEPTO: TQRLabel;
    QRShape7: TQRShape;
    QRLabel22: TQRLabel;
    QRShape8: TQRShape;
    QRLabel24: TQRLabel;
    QRShape9: TQRShape;
    QRLabel25: TQRLabel;
    qrsTOTAL: TQRShape;
    qrlTOTAL: TQRLabel;
    qyCobCom: TQuery;
    qrsSIT: TQRShape;
    qrlSIT: TQRLabel;
    QRChildBand1: TQRChildBand;
    qrDetalle: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    qrsFVTO: TQRShape;
    qrlFVTO: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    FooAcred: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    qrlPER: TQRLabel;
    QRDBText1: TQRDBText;
    qyCobComID_CREDITO: TFloatField;
    qyCobComID_TITULAR: TFloatField;
    qyCobComNOMBRE: TStringField;
    QRExpr6: TQRExpr;
    QRDBText18: TQRDBText;
    qyCobComIMP_COMISION: TFloatField;
    qyCobComIMP_IVA: TFloatField;
    qyCobComTOTAL: TFloatField;
    qyCobComSIT_COMISION: TStringField;
    QRGroupMoneda: TQRGroup;
    QRGroupGpoProducto: TQRGroup;
    FooterGPOPROD: TQRBand;
    QRLabel11: TQRLabel;
    qrlTOT_ACRED: TQRLabel;
    qrsFACTURA: TQRShape;
    qrlFACTURA: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    qyCobComCVE_PRODUCTO_CRE: TStringField;
    qyCobComNUM_PERIODO: TFloatField;
    qyCobComDESC_COMISION: TStringField;
    qyCobComIMP_BASE_CALCULO: TFloatField;
    qyCobComNUM_FACTURA: TFloatField;
    qyCobComPCT_COMISION: TFloatField;
    qyCobComDESC_L_PRODUCTO: TStringField;
    QRShape14: TQRShape;
    QRLabel8: TQRLabel;
    qrbTOTAL: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    qrsFPROGPAGO: TQRShape;
    qrsFPAGO: TQRShape;
    qrlFPROGPAGO: TQRLabel;
    qrlFPAGO: TQRLabel;
    qyCobComIMP_CREDITO: TFloatField;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    qyCobComF_VENCIMIENTO: TDateTimeField;
    qyCobComF_PROG_PAGO: TDateTimeField;
    qyCobComF_PAGO: TDateTimeField;
    qrgPRODUCTO: TQRGroup;
    qyCobComCVE_PRODUCTO_GPO: TStringField;
    qyCobComDESC_PROD_GPO: TStringField;
    FooPROD: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRShape18: TQRShape;
    QRLabel17: TQRLabel;
    QRShape19: TQRShape;
    QRLabel18: TQRLabel;
    QRShape20: TQRShape;
    QRLabel19: TQRLabel;
    QRShape21: TQRShape;
    QRLabel21: TQRLabel;
    QRShape22: TQRShape;
    QRLabel23: TQRLabel;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    qyCobComF_INICIO: TDateTimeField;
    qyCobComF_VTO_CRED: TDateTimeField;
    qyCobComSOBRETASA: TFloatField;
    qyCobComSDO_INSOLUTO: TFloatField;
    qyCobComCVE_TASA_REFER: TStringField;
    qrdbTITULAR: TQRDBText;
    qrdbSPD: TQRDBText;
    qrdbCVE_TASA_REF: TQRDBText;
    qrdbFINICIO: TQRDBText;
    qrdbFVTO: TQRDBText;
    qrdbPCT_COMIS: TQRDBText;
    QRShape1: TQRShape;
    QRExpr9: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr10: TQRExpr;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    qrgACRED: TQRGroup;
    QRLabel15: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    qrsPROD: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    qrsGRUOP: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    qyCobComCVE_MONEDA: TFloatField;
    qyCobComMONEDA: TStringField;
    QRBand1: TQRBand;
    qrgCRED: TQRGroup;
    qrlImpCredAcr: TQRLabel;
    qrlSdoInsAcr: TQRLabel;
    qrlImpCredProd: TQRLabel;
    qrlSdoInsProd: TQRLabel;
    qrlImpCredGpo: TQRLabel;
    qrlSdoInsGpo: TQRLabel;
    qrlImpCredMon: TQRLabel;
    qrlSdoInsMon: TQRLabel;
    procedure qrDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbTOTALBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgPRODUCTOBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FooAcredBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FooterGPOPRODBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupGpoProductoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgACREDBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgCREDBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FooPRODBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);


  private
  public
    Function FormaQuery(sFIni, sFFin,sGpoProducto, sProducto, sAcreditado,
                        sDisposicion, sComision,sSituacion,
                        sEmpresa, sSucursal:String;
                        bFega, bSucursales : Boolean;
                        Tinfmost  : Integer):String;
  end;
var
  QrCobCom: TQrCobCom;
  bGenArch: Boolean;
  bShow: Boolean;
  sArchivo:String;
  sTitulo1, sTitulo2:String;
  F: TextFile;

  vgImpCrAcr: Double;
  vgImpCrPro: Double;
  vgImpCrGpo: Double;
  vgImpCrMon: Double;

  vgSdoInAcr: Double;
  vgSdoInPro: Double;
  vgSdoInGpo: Double;
  vgSdoInMon: Double;

Procedure RepCobComision( sFIni, sFFin, sGpoProducto, sProducto,
                           sAcreditado, sDisposicion, sComision,sSituacion,
                           sEmpresa, sSucursal :String;
                           pPreview, bFega, bResumen, bProd, bSucursales : Boolean;
                           Tinfmost  : Integer;
                           pAPli     : TInterApli;
                           sNbrArch:String);

Implementation
{$R *.DFM}

Procedure RepCobComision( sFIni, sFFin,sGpoProducto, sProducto,
                           sAcreditado, sDisposicion, sComision,sSituacion,
                           sEmpresa, sSucursal :String;
                           pPreview, bFega, bResumen, bProd, bSucursales : Boolean;
                           Tinfmost        : Integer;
                           pAPli     : TInterApli;
                           sNbrArch:String);
Var
   QrCobCom: TQrCobCom;
   VLTitulo : String;
   Preview     : TIntQRPreview;
   bGenArch: Boolean;
Begin
   VLTitulo := '';
   QrCobCom:=TQrCobCom.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrCobCom);

   Try

      sArchivo:= sNbrArch;
      QrCobCom.QRInterEncabezado1.Apli:=pAPli;
      QrCobCom.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrCobCom.QRInterEncabezado1.NomReporte:='IntQrCobCom';
      IF bResumen THEN
         sTitulo1 := ' Resumen Cobro de Comisiones'
      ELSE
         sTitulo1 := ' Reporte Cobro de Comisiones';

      QrCobCom.QRInterEncabezado1.Titulo1:=sTitulo1;

      If sSituacion = 'AC' then
         QrCobCom.QRInterEncabezado1.Titulo1:= QrCobCom.QRInterEncabezado1.Titulo2 + ' Activos '
      else If sSituacion = 'PA' then
         QrCobCom.QRInterEncabezado1.Titulo1:= QrCobCom.QRInterEncabezado1.Titulo2 + ' Pendientes de Activar '
      else If sSituacion = 'LQ' then
         QrCobCom.QRInterEncabezado1.Titulo1:= QrCobCom.QRInterEncabezado1.Titulo2 + ' Liquidados '
      else If sSituacion = 'IM' then
         QrCobCom.QRInterEncabezado1.Titulo1:= QrCobCom.QRInterEncabezado1.Titulo2 + ' Impagados ';

      QrCobCom.QRInterEncabezado1.Titulo2:=' Periodo del '+  sFIni + ' al ' + sFFin;
      sTitulo2 :=' Periodo del '+  sFIni + ' al ' + sFFin;
      QrCobCom.qyCobCom.Active:=False;
      QrCobCom.qyCobCom.DatabaseName := pApli.DataBaseName;
      QrCobCom.qyCobCom.SessionName := pApli.SessionName;
      QrCobCom.qyCobCom.SQL.Text:= QrCobCom.FormaQuery( sFIni, sFFin, sGpoProducto, sProducto,
                                                        sAcreditado, sDisposicion, sComision,sSituacion,
                                                        sEmpresa,    sSucursal, bFega, bSucursales, Tinfmost);
      {EMH Salida a Excel}
      QrCobCom.qyCobCom.SQL.SaveToFile('c:\comision.txt');
      QrCobCom.qyCobCom.Active:=True;

      vgImpCrAcr:= 0;
      vgImpCrPro:= 0;
      vgImpCrGpo:= 0;
      vgImpCrMon:= 0;

      vgSdoInAcr:= 0;
      vgSdoInPro:= 0;
      vgSdoInGpo:= 0;
      vgSdoInMon:= 0;

      {/< EASA4011 30/10/2006      SOLO RESUMEN}
      IF bProd  THEN BEGIN
         QrCobCom.qrgPRODUCTO.Enabled  := True;
         QrCobCom.FooPROD.Enabled      := True;
      END
      ELSE BEGIN
         QrCobCom.qrgPRODUCTO.Enabled  := False;
         QrCobCom.FooPROD.Enabled      := False;
      END;

      bShow:= bResumen;
      IF bResumen THEN BEGIN
         QrCobCom.qrDetalle.Enabled    := False;
         QrCobCom.qrgACRED.Height := 0;
         QrCobCom.qrlTOT_ACRED.Enabled := False;
         QrCobCom.qrlFVTO.Enabled := False;
         QrCobCom.qrsFVTO.Enabled := False;
         QrCobCom.qrlFPROGPAGO.Enabled := False;
         QrCobCom.qrsFPROGPAGO.Enabled := False;
         QrCobCom.qrlFPAGO.Enabled := False;
         QrCobCom.qrsFPAGO.Enabled := False;
         QrCobCom.qrlCRED.Enabled := False;
         QrCobCom.qrsCRED.Enabled := False;
         QrCobCom.qrlPER.Enabled := False;
         QrCobCom.qrsPER.Enabled := False;
         QrCobCom.qrlFACTURA.Enabled := False;
         QrCobCom.qrsFACTURA.Enabled := False;
         QrCobCom.qrlSIT.Enabled := False;
         QrCobCom.qrsSIT.Enabled := False;
         QrCobCom.qrdbTITULAR.Enabled  := True;
         QrCobCom.qrdbCVE_TASA_REF.Enabled  := True;
         QrCobCom.qrdbSPD.Enabled  := True;
         QrCobCom.qrdbFINICIO.Enabled  := True;
         QrCobCom.qrdbFVTO.Enabled  := True;
         QrCobCom.qrsGRUOP.Enabled  := False;
         QrCobCom.qrsPROD.Enabled  := False;

         QrCobCom.qrsCONCEPTO.Width := 316;
         QrCobCom.qrsCONCEPTO.Left  := 1;
         QrCobCom.qrlCONCEPTO.Width := 314;
         QrCobCom.qrlCONCEPTO.Left  := 2;
         QrCobCom.qrlCONCEPTO.Caption := 'Acreditado';

         QrCobCom.qrsTOTAL.Width   := 75;
         QrCobCom.qrsTOTAL.Left    := 689;
         QrCobCom.qrlTOTAL.Width   := 70;
         QrCobCom.qrsTOTAL.Left    := 692;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, sTitulo1+ #09 );
         Writeln(F, sTitulo2+ #09 );
         Writeln(F,  #09 );
         Writeln(F,'Clave Moneda'+ #09 +
                   'Moneda'+ #09 +
                   'Grupo Producto'+ #09 +
                   'Desc. Grupo Prod.'+ #09 +
                   'Acreditado'+ #09 +
                   'F. Inicio'+ #09 +
                   'F. Vencimiento'+ #09 +
                   'Cve Tasa Refer'+ #09 +
                   'SPD'+ #09 +
                   'Imp. Disposición'+ #09 +
                   'Sdo. Insoluto'+ #09 +
                   'Importe Base Calculo'+ #09 +
                   '% Comision'+ #09 +
                   'Importe Comision'+ #09 +
                   'Importe IVA'+ #09 +
                   'Total');
      End;

      END
      ELSE BEGIN
         QrCobCom.qrDetalle.Enabled    := True;
         QrCobCom.qrgACRED.Height := 12;
         QrCobCom.qrlTOT_ACRED.Enabled := True;
         QrCobCom.qrlFVTO.Enabled := True;
         QrCobCom.qrsFVTO.Enabled := True;
         QrCobCom.qrlFPROGPAGO.Enabled := True;
         QrCobCom.qrsFPROGPAGO.Enabled := True;
         QrCobCom.qrlFPAGO.Enabled := True;
         QrCobCom.qrsFPAGO.Enabled := True;
         QrCobCom.qrlCRED.Enabled  := True;
         QrCobCom.qrsCRED.Enabled  := True;
         QrCobCom.qrlPER.Enabled   := True;
         QrCobCom.qrsPER.Enabled   := True;
         QrCobCom.qrlFACTURA.Enabled := True;
         QrCobCom.qrsFACTURA.Enabled := True;
         QrCobCom.qrlSIT.Enabled := True;
         QrCobCom.qrsSIT.Enabled := True;
         QrCobCom.qrdbTITULAR.Enabled      := False;
         QrCobCom.qrdbCVE_TASA_REF.Enabled := False;
         QrCobCom.qrdbSPD.Enabled          := False;
         QrCobCom.qrdbFINICIO.Enabled      := False;
         QrCobCom.qrdbFVTO.Enabled         := False;
         QrCobCom.qrsGRUOP.Enabled         := True;
         QrCobCom.qrsPROD.Enabled  := True;

         QrCobCom.qrsCONCEPTO.Width   := 145;
         QrCobCom.qrsCONCEPTO.Left    := 173;
         QrCobCom.qrlCONCEPTO.Width   := 142;
         QrCobCom.qrlCONCEPTO.Left    := 176;
         QrCobCom.qrlCONCEPTO.Caption := 'Conceptos';

         QrCobCom.qrsTOTAL.Width   := 40;
         QrCobCom.qrsTOTAL.Left    := 689;
         QrCobCom.qrlTOTAL.Width   := 37;
         QrCobCom.qrlTOTAL.Left    := 692;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, sTitulo1+ #09 );
         Writeln(F, sTitulo2+ #09 );
         Writeln(F,  #09 );
         Writeln(F,'Clave Moneda'+ #09 +
                   'Moneda'+ #09 +
                   'Grupo Producto'+ #09 +
                   'Desc. Grupo Prod.'+ #09 +
                   'Clave Producto'+ #09 +
                   'Desc. Producto'+ #09 +
                   'Fecha Vto. Comisión'+ #09 +
                   'Fecha Prog. Pago Comisión'+ #09 +
                   'Fecha Pago Comisión'+ #09 +
                   'Credito'+ #09 +
                   'Periodo'+ #09 +
                   'Titular'+ #09 +
                   'Nombre'+ #09 +
                   'Descripcion_Comision'+ #09 +
                   'Importe Credito'+ #09 +
                   'Cve Tasa Refer'+ #09 +
                   'SPD'+ #09 +
                   'Sdo. Insoluto'+ #09 +
                   'F. Inicio'+ #09 +
                   'F. Vencimiento'+ #09 +
                   'Importe Base Calculo'+ #09 +
                   'Porcentaje Comision'+ #09 +
                   'Importe Comision'+ #09 +
                   'Importe IVA'+ #09 +
                   'Total'+ #09 +
                   'Numero Factura'+ #09 +
                   'Situacion Comision');

      End;
      END;
      {EASA4011 >/}

      {EMH Salida a Excel}


      If pPreview Then
         QrCobCom.Preview
      Else
         QrCobCom.Print;
    Finally
      QrCobCom.free;
      If Assigned(Preview) Then Preview.Free;
    End;
end;

procedure TQrCobCom.qrbTOTALBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrlImpCredMon.Caption:= FormatFloat('###,###,###,###,###,##0.00',vgImpCrMon);
   qrlSdoInsMon.Caption := FormatFloat('###,###,###,###,###,##0.00',vgSdoInMon);

   If Trim(sArchivo)<>'' Then Begin
         Writeln(F, 'Total Moneda ' +#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',vgImpCrMon)+ #09+
                  FormatFloat('###,###,###,###,###,##0.00',vgSdoInMon)+ #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr12.Value.dblResult)+ #09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr8.Value.dblResult)+ #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr3.Value.dblResult)+ #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr11.Value.dblResult)
                  );
         Writeln(F,  #09 );
         Writeln(F,  #09 );
   End;
end;

Function TQrCobCom.FormaQuery( sFIni, sFFin,sGpoProducto, sProducto,
                               sAcreditado, sDisposicion, sComision,sSituacion,
                               sEmpresa, sSucursal:String; bFega, bSucursales:Boolean;
                               Tinfmost  : Integer):String;
Var
    sSQLInter, sSQL:String;
Begin
   sSQLInter:=
           '    SELECT  CTO.ID_EMPRESA, CP.CVE_GPO_INGRESO      AS CVE_PRODUCTO_GPO, ' + coCRLF +
           '            CPG.DESC_CARTERA		        AS DESC_PROD_GPO, ' + coCRLF +
           '            SUBSTR(CCTO.CVE_SUB_TIP_BCO,1,6)        AS CVE_PRODUCTO_CRE, ' + coCRLF +
           '            CSB.DESC_SUB_TIPO		        AS DESC_L_PRODUCTO, ' + coCRLF +
           '            NVL(CO.F_VENCIMIENTO, CR.F_AUT_OPERACION) AS F_VENCIMIENTO, ' + coCRLF +
           '            NVL(CO.F_PROG_PAGO, CR.F_AUT_OPERACION	) AS F_PROG_PAGO, ' + coCRLF +
           '            NVL(CO.F_PAGO, CR.F_AUT_OPERACION		) AS F_PAGO, ' + coCRLF +
           '            CR.ID_CREDITO, ' + coCRLF +
           '            CO.NUM_PERIODO, ' + coCRLF +
           '            CTO.ID_TITULAR, ' + coCRLF +
           '            P.NOMBRE, ' + coCRLF +
           '            CO.CVE_COMISION, ' + coCRLF +
           '            CO.DESC_COMISION, ' + coCRLF +
           '            CR.IMP_CREDITO, ' + coCRLF +
           '            CO.IMP_BASE_CALCULO, ' + coCRLF +
           '            CO.PCT_COMISION, ' + coCRLF +
           '            CO.IMP_COMISION, ' + coCRLF +
           '            CO.IMP_IVA, ' + coCRLF +
           '            CO.IMP_COMISION + CO.IMP_IVA    AS TOTAL, ' + coCRLF +
           '            0 NUM_FACTURA, ' + coCRLF +
           '            CO.SIT_COMISION, ' + coCRLF +
           '            NVL(CO.F_ALTA, CR.F_AUT_OPERACION)       AS F_AUTORIZACION, ' + coCRLF +
           '            CR.CVE_TASA_REFER, ' + coCRLF +
           '            CR.SOBRETASA, ' + coCRLF +
           '            CR.SDO_INSOLUTO, ' + coCRLF +
           '            CR.F_VALOR_CRED         AS F_INICIO, ' + coCRLF +
           '            CR.F_VALOR_CRED + CR.DIAS_PLAZO AS F_VTO_CRED, ' + coCRLF +
           '            CTO.CVE_MONEDA, ' + coCRLF +
           '            M.DESC_MONEDA AS MONEDA ' + coCRLF +
           '    FROM ( SELECT CCC.ID_CREDITO,  CC.B_INGRESO, ' + coCRLF +
           '                  CCC.CVE_COMISION, ' + coCRLF +
           '                  CC.DESC_COMISION, ' + coCRLF +
           '                  CDC.F_VENCIMIENTO, ' + coCRLF +
           '                  CDC.F_PROG_PAGO, ' + coCRLF +
           '                  CDC.F_PAGO, ' + coCRLF +
           '                  NVL(CDC.NUM_PERIODO, 1)                  AS NUM_PERIODO, ' + coCRLF +
           '                  NVL(CDC.IMP_BASE_CALC,0)                 AS IMP_BASE_CALCULO, ' + coCRLF +
           '                  NVL(CDC.TASA_APLICADA,CCC.PCT_COMISION)  AS PCT_COMISION, ' + coCRLF +
           '                  NVL(CDC.IMP_COMISION, CCC.IMP_COMISION)  AS IMP_COMISION, ' + coCRLF +
           '                  NVL(CDC.IMP_IVA,CCC.IMP_IVA_COMISION)    AS IMP_IVA, ' + coCRLF +
           '                  NVL(CDC.SIT_COMISION,''LQ'')               AS SIT_COMISION, ' + coCRLF +
           '                  CDC.F_ALTA ' + coCRLF +
           '           FROM CRE_CRED_COMIS CCC, ' + coCRLF +
           '                CRE_DET_COMISION CDC, ' + coCRLF +
           '                CRE_COMISION CC ' + coCRLF +
           '           WHERE CCC.ID_CREDITO    = CDC.ID_CREDITO(+) ' + coCRLF +
           '             AND CCC.CVE_COMISION  = CC.CVE_COMISION ' + coCRLF +
           '         ) CO, ' + coCRLF +
           '         CRE_CREDITO CR, ' + coCRLF +
           '         CRE_CONTRATO CCTO, ' + coCRLF +
           '         CRE_SUB_TIP_BCO CSB, ' + coCRLF +
           '         CONTRATO    CTO, ' + coCRLF +
           '         PERSONA     P, ' + coCRLF +
           '         CRE_GPO_INGRESO CPG, ' + coCRLF +
           '         CRE_PRESUPUESTO CP, ' + coCRLF +
           '         MONEDA M ' + coCRLF +
           '    WHERE 1 = 1 ' + coCRLF;

//    If not( bSeguros ) then
   If (Tinfmost = 0 ) then
        sSQLInter:= sSQLInter + ' AND CO.B_INGRESO = ''V''' + coCRLF;

   sSQLInter:= sSQLInter +
           '      AND CR.ID_CREDITO       = CO.ID_CREDITO ' + coCRLF +
           '      AND CCTO.ID_CONTRATO    = CR.ID_CONTRATO ' + coCRLF +
           '      AND CSB.CVE_SUB_TIP_BCO = CCTO.CVE_SUB_TIP_BCO ' + coCRLF +
           '      AND CP.CVE_PRESUPUESTO  = CR.CVE_PRESUPUESTO ' + coCRLF +
           '      AND CPG.CVE_GPO_INGRESO = CP.CVE_GPO_INGRESO ' + coCRLF +
           '      AND CTO.ID_CONTRATO     = CR.ID_CONTRATO ' + coCRLF +
           '      AND P.ID_PERSONA        = CTO.ID_TITULAR ' + coCRLF +
           '      AND M.CVE_MONEDA        = CTO.CVE_MONEDA ' + coCRLF;

    sSQL:= ' SELECT * FROM ( ' + coCRLF + sSQLInter  + coCRLF + '  UNION ' + coCRLF +

           ' SELECT CTO.ID_EMPRESA, ' + coCRLF +
           '        CP.CVE_PRODUCTO_GPO, ' + coCRLF +
           '        CPG.DESC_C_PROD_GPO AS DESC_PROD_GPO, ' + coCRLF +
           '        CCTO.CVE_PRODUCTO_CRE, ' + coCRLF +
           '        CP.DESC_L_PRODUCTO, ' + coCRLF +
           '        CC.F_VENCIMIENTO, ' + coCRLF +
           '        CC.F_PROG_PAGO, ' + coCRLF +
           '        CC.F_PAGO, ' + coCRLF +
           '        CC.ID_CREDITO, ' + coCRLF +
           '        CC.NUM_PERIODO, ' + coCRLF +
           '        CTO.ID_TITULAR, ' + coCRLF +
           '        P.NOMBRE, ' + coCRLF +
           '        CC.CVE_COMISION, ' + coCRLF +
           '        CCC.DESC_COMISION, ' + coCRLF +
           '        CR.IMP_CREDITO, ' + coCRLF +
           '        CC.IMP_BASE_CALCULO, ' + coCRLF +
           '        CC.PCT_COMISION, ' + coCRLF +
           '        CC.IMP_COMISION, ' + coCRLF +
           '        CC.IMP_IVA, ' + coCRLF +
           '        CC.IMP_COMISION + CC.IMP_IVA TOTAL, ' + coCRLF +
           '        CC.NUM_FACTURA, ' + coCRLF +
           '        CC.SIT_COMISION, ' + coCRLF +
           '        CR.F_AUTORIZA AS F_AUTORIZACION, ' + coCRLF +
           '        CR.CVE_TASA_REFER, ' + coCRLF +
           '        CR.SOBRETASA,      ' + coCRLF +
           '        CR.SDO_INSOLUTO, ' + coCRLF +
           '        CR.F_INICIO, ' + coCRLF +
           '        CR.F_VENCIMIENTO AS F_VTO_CRED, ' + coCRLF +
           '        CTO.CVE_MONEDA, ' + coCRLF +
           '        M.DESC_MONEDA AS MONEDA ' + coCRLF +
           ' FROM (SELECT * FROM CR_CREDITO) CR, ' + coCRLF +
           '      CR_COMISION CC, ' + coCRLF +
           '      CR_CONTRATO CCTO, ' + coCRLF +
           '      CR_PRODUCTO CP, ' + coCRLF +
           '      CONTRATO    CTO, ' + coCRLF +
           '      PERSONA     P, ' + coCRLF +
           '      CR_CAT_COMISION CCC, ' + coCRLF +
           '      CR_PRODUCTO_GPO CPG, ' + coCRLF +
           '      MONEDA M ' + coCRLF +
           ' WHERE CC.ID_CREDITO     = CR.ID_CREDITO ' + coCRLF +
           '   AND CCTO.ID_CONTRATO  = CR.ID_CONTRATO ' + coCRLF +
           '   AND CCTO.FOL_CONTRATO = CR.FOL_CONTRATO ' + coCRLF +
           '   AND CP.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE ' + coCRLF +
           '   AND CPG.CVE_PRODUCTO_GPO = CP.CVE_PRODUCTO_GPO ' + coCRLF +
           '   AND CTO.ID_CONTRATO   = CR.ID_CONTRATO ' + coCRLF +
           '   AND P.ID_PERSONA      = CTO.ID_TITULAR ' + coCRLF +
           '   AND CCC.CVE_COMISION  = CC.CVE_COMISION ' + coCRLF +
           '   AND M.CVE_MONEDA      = CTO.CVE_MONEDA ' + coCRLF;

    //HERJA
    //If not( bSeguros ) then
    If (Tinfmost = 0 ) then
        sSQL:= sSQL + ' AND CCC.CVE_TIPO_COMIS = ''CN''' + coCRLF;
    If (Tinfmost = 1 ) then
        sSQL:= sSQL + ' AND CCC.CVE_TIPO_COMIS = ''SG''' + coCRLF;
    //FIN HERJA

    If not( bFega ) then
        sSQL:= sSQL + '   AND CVE_APLIC_COM NOT IN '+ SQLStr('CF')+ coCRLF;

    sSQL:= sSQL + ' ) WHERE ID_EMPRESA = ' + Trim(sEmpresa)+ coCRLF;

    If (Trim( sFIni ) <> '' ) Then Begin
        sSQL:= sSQL + '  AND F_AUTORIZACION >= ' + SQLFecha( StrToDateTime( sFIni ) ) + coCRLF;
    End;

    If (Trim( sFFin ) <> '' ) Then Begin
        sSQL:= sSQL + '  AND F_AUTORIZACION <= ' + SqlFecha( StrToDateTime( sFFin ) ) + coCRLF;
    End;

    If (Trim( sGpoProducto)<>'') Then
        sSQL:= sSQL + '  AND CVE_PRODUCTO_GPO = '+ SQLStr(sGpoProducto)+ coCRLF;

    IF not( bSucursales ) Then
        sSQL:= sSQL + '  AND CVE_PRODUCTO_GPO <> ''PERCON''' + coCRLF;

    If (Trim( sProducto)<>'') Then
        sSQL:= sSQL + '  AND CVE_PRODUCTO_CRE = '+ SQLStr(sProducto)+ coCRLF;


    If (Trim( sComision)<>'') Then
        sSQL:= sSQL + '  AND CVE_COMISION IN ( '+ SQLStr(sComision)+ ' ) ' +coCRLF;

    If (Trim(sAcreditado)<>'') Then
        sSQL:= sSQL + '  AND  ID_TITULAR ='+ sAcreditado+ coCRLF;

    If (Trim(sDisposicion)<>'') Then
        sSQL:= sSQL + '  AND ID_CREDITO ='+ sDisposicion+ coCRLF;
    {EMH Todas sin Canceladas }
    If (Trim(sSituacion)<>'') Then
      sSQL:= sSQL + '  AND SIT_COMISION ='+ SQLStr( sSituacion )+ coCRLF
    else
      sSQL:= sSQL + '  AND SIT_COMISION <> ''CA'' '+ coCRLF;


    sSQL:= sSQL + ' ORDER BY MONEDA, CVE_PRODUCTO_GPO, DESC_PROD_GPO, CVE_PRODUCTO_CRE, DESC_L_PRODUCTO,ID_TITULAR, NOMBRE';

    Result:= sSQL;
End;

procedure TQrCobCom.qrDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     If sArchivo <>'' Then Begin
         Writeln(F,
                qyCobCom.FieldByName('CVE_MONEDA').AsString + #09 +
                qyCobCom.FieldByName('MONEDA').AsString + #09 +
                qyCobCom.FieldByName('CVE_PRODUCTO_GPO').AsString + #09 +
                qyCobCom.FieldByName('DESC_PROD_GPO').AsString + #09 +
                qyCobCom.FieldByName('CVE_PRODUCTO_CRE').AsString + #09 +
                qyCobCom.FieldByName('DESC_L_PRODUCTO').AsString + #09 +
                qyCobCom.FieldByName('F_VENCIMIENTO').AsString + #09 +
                qyCobCom.FieldByName('F_PROG_PAGO').AsString + #09 +
                qyCobCom.FieldByName('F_PAGO').AsString + #09 +
                qyCobCom.FieldByName('ID_CREDITO').AsString + #09+
                qyCobCom.FieldByName('NUM_PERIODO').AsString + #09 +
                qyCobCom.FieldByName('ID_TITULAR').AsString + #09 +
                qyCobCom.FieldByName('NOMBRE').AsString + #09 +
                qyCobCom.FieldByName('DESC_COMISION').AsString + #09 +
                FormatFloat('###,###,###,###,###,##0.00',qyCobCom.FieldByName('IMP_CREDITO').AsFloat)+ #09+
                qyCobCom.FieldByName('CVE_TASA_REFER').AsString + #09 +
                FormatFloat('###0.0000',qyCobCom.FieldByName('SOBRETASA').AsFloat)+ #09+
                FormatFloat('###,###,###,###,###,##0.00',qyCobCom.FieldByName('SDO_INSOLUTO').AsFloat)+ #09+
                qyCobCom.FieldByName('F_INICIO').AsString + #09 +
                qyCobCom.FieldByName('F_VTO_CRED').AsString + #09 +
                FormatFloat('###,###,###,###,###,##0.00',qyCobCom.FieldByName('IMP_BASE_CALCULO').AsFloat)+ #09+
                FormatFloat('###0.0000',qyCobCom.FieldByName('PCT_COMISION').AsFloat)+ #09+
                FormatFloat('###,###,###,###,###,##0.00',qyCobCom.FieldByName('IMP_COMISION').AsFloat)+ #09+
                FormatFloat('###,###,###,###,###,##0.00',qyCobCom.FieldByName('IMP_IVA').AsFloat)+ #09+
                FormatFloat('###,###,###,###,###,##0.00',qyCobCom.FieldByName('TOTAL').AsFloat)+ #09+
                qyCobCom.FieldByName('NUM_FACTURA').AsString + #09 +
                qyCobCom.FieldByName('SIT_COMISION').AsString);
     end;

end;

procedure TQrCobCom.qrgPRODUCTOBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrdbCVE_TASA_REF.Enabled := bShow;
  qrdbSPD.Enabled := bShow;
  vgImpCrPro:= 0;
  vgSdoInPro:= 0;
end;

procedure TQrCobCom.FooAcredBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrlImpCredAcr.Caption:= FormatFloat('###,###,###,###,###,##0.00',vgImpCrAcr);
   qrlSdoInsAcr.Caption := FormatFloat('###,###,###,###,###,##0.00',vgSdoInAcr);

   IF bShow THEN BEGIN
      If sArchivo <>'' Then Begin
         Writeln(F,
                qyCobCom.FieldByName('CVE_MONEDA').AsString + #09 +
                qyCobCom.FieldByName('MONEDA').AsString + #09 +
                qyCobCom.FieldByName('CVE_PRODUCTO_GPO').AsString + #09 +
                qyCobCom.FieldByName('DESC_PROD_GPO').AsString + #09 +
                qyCobCom.FieldByName('NOMBRE').AsString + #09 +
                qyCobCom.FieldByName('F_INICIO').AsString + #09 +
                qyCobCom.FieldByName('F_VTO_CRED').AsString + #09 +
                qyCobCom.FieldByName('CVE_TASA_REFER').AsString + #09 +
                FormatFloat('###0.0000',qyCobCom.FieldByName('SOBRETASA').AsFloat)+ #09+
                FormatFloat('###,###,###,###,###,##0.00',vgImpCrAcr) + #09+
                FormatFloat('###,###,###,###,###,##0.00',vgSdoInAcr)+ #09+
                FormatFloat('###,###,###,###,###,##0.00',QRExpr2.Value.dblResult)+ #09+
                FormatFloat('###0.0000',qyCobCom.FieldByName('PCT_COMISION').AsFloat)+ #09+
                FormatFloat('###,###,###,###,###,##0.00',QRExpr4.Value.dblResult)+ #09+
                FormatFloat('###,###,###,###,###,##0.00',QRExpr6.Value.dblResult)+ #09+
                FormatFloat('###,###,###,###,###,##0.00',QRExpr5.Value.dblResult));
      end;
   END;
end;

procedure TQrCobCom.FooterGPOPRODBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrlImpCredGpo.Caption:= FormatFloat('###,###,###,###,###,##0.00',vgImpCrGpo);
   qrlSdoInsGpo.Caption := FormatFloat('###,###,###,###,###,##0.00',vgSdoInGpo);

   If sArchivo <>'' Then Begin
      Writeln(F, #09#09+'Total por Grupo' +#09#09#09#09#09#09#09+
                FormatFloat('###,###,###,###,###,##0.00',vgImpCrGpo)+ #09+
                FormatFloat('###,###,###,###,###,##0.00',vgSdoInGpo)+ #09+
                FormatFloat('###,###,###,###,###,##0.00',QRExpr10.Value.dblResult)+ #09#09+
                FormatFloat('###,###,###,###,###,##0.00',QRExpr7.Value.dblResult )+ #09+
                FormatFloat('###,###,###,###,###,##0.00',QRExpr1.Value.dblResult )+ #09+
                FormatFloat('###,###,###,###,###,##0.00',QRExpr9.Value.dblResult )
             );
         Writeln(F,  #09 );
   end;
end;

procedure TQrCobCom.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If qyCobCom.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

procedure TQrCobCom.QRGroupMonedaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  vgImpCrMon:= 0;
  vgSdoInMon:= 0;
end;

procedure TQrCobCom.QRGroupGpoProductoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  vgImpCrGpo:= 0;
  vgSdoInGpo:= 0;
end;

procedure TQrCobCom.qrgACREDBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  vgImpCrAcr:= 0;
  vgSdoInAcr:= 0;
end;

procedure TQrCobCom.qrgCREDBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var vlImpCredito: Double;
    vlSdoInsolut: Double;
    vlIdCredito : Integer;
begin

  if qyCobCom.FieldByName('ID_CREDITO').AsInteger = vlIdCredito then begin
     vlImpCredito:= 0;
     vlSdoInsolut:= 0;
  end

  else Begin
     vlImpCredito:= qyCobCom.FieldByName('IMP_CREDITO').AsFloat;
     vlSdoInsolut:= qyCobCom.FieldByName('SDO_INSOLUTO').AsFloat;

     vgImpCrAcr:= vgImpCrAcr + vlImpCredito;
     vgImpCrPro:= vgImpCrPro + vlImpCredito;
     vgImpCrGpo:= vgImpCrGpo + vlImpCredito;
     vgImpCrMon:= vgImpCrMon + vlImpCredito;

     vgSdoInAcr:= vgSdoInAcr + vlSdoInsolut;
     vgSdoInPro:= vgSdoInPro + vlSdoInsolut;
     vgSdoInGpo:= vgSdoInGpo + vlSdoInsolut;
     vgSdoInMon:= vgSdoInMon + vlSdoInsolut;

  end;

  vlIdCredito:= qyCobCom.FieldByName('ID_CREDITO').AsInteger;
end;

procedure TQrCobCom.FooPRODBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrlImpCredProd.Caption:= FormatFloat('###,###,###,###,###,##0.00',vgImpCrPro);
   qrlSdoInsProd.Caption := FormatFloat('###,###,###,###,###,##0.00',vgSdoInPro);
end;

End.
