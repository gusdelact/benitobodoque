unit IntMQrCtrlConc;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, unSQL2,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, Dialogs, IntGenCre, ComObj, IntXls;
                 
Const
   coCRLF      = #13#10;
                 
type
  TQrCtrlConceptos = class(TQuickRep)
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    qyCtrlConc: TQuery;
    qyCtrlConcCVE_MONEDA: TFloatField;
    qyCtrlConcDESC_MONEDA: TStringField;
    qyCtrlConcCVE_COMISION: TStringField;
    qyCtrlConcDESC_COMISION: TStringField;
    qyCtrlConcCVE_PRODUCTO_CRE: TStringField;
    qyCtrlConcDESC_L_PRODUCTO: TStringField;
    qyCtrlConcID_CREDITO: TFloatField;
    qyCtrlConcNOMBRE: TStringField;
    qyCtrlConcFECHA_ALTA: TDateTimeField;
    qyCtrlConcPLAZO: TFloatField;
    qyCtrlConcF_VENCIMIENTO: TDateTimeField;
    qyCtrlConcF_PROG_PAGO: TDateTimeField;
    qyCtrlConcNUM_PERIODO: TFloatField;
    qyCtrlConcIMP_BASE_CALCULO: TFloatField;
    qyCtrlConcPCT_COMISION: TFloatField;
    qyCtrlConcIMP_COMISION: TFloatField;
    qyCtrlConcIMP_IVA: TFloatField;
    qyCtrlConcTOT_COM: TFloatField;
    qyCtrlConcF_PAGO: TDateTimeField;
    qyCtrlConcIMP_PAGADO: TFloatField;
    qyCtrlConcIMP_IVA_PAGADO: TFloatField;
    qyCtrlConcSIT_COMISION: TStringField;
    ColumnHeaderBand1: TQRBand;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape14: TQRShape;
    QRShape25: TQRShape;
    QRShape24: TQRShape;
    QRShape22: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabelNOMBRE: TQRLabel;
    QRLabelID_CREDITO: TQRLabel;
    QRLabelDIASIMVE: TQRLabel;
    QRShape23: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabelIMPORTE: TQRLabel;
    QRGroupCont: TQRGroup;
    QRGroupMoneda: TQRGroup;
    QRShape12: TQRShape;
    QRLabelMoneda: TQRLabel;
    QRDB_CVE_MONEDA: TQRDBText;
    QRDB_DESC_MONEDA: TQRDBText;
    QRGroupComision: TQRGroup;
    QRShape9: TQRShape;
    QRLabelComision: TQRLabel;
    QRDB_CVE_COMISION: TQRDBText;
    QRDB_DESC_COMISION: TQRDBText;
    QRGroupProducto: TQRGroup;
    QRShape10: TQRShape;
    QRLabelProducto: TQRLabel;
    QRDB_CVE_PRODUCTO: TQRDBText;
    QRDB_DESC_PRODUCTO: TQRDBText;
    QRFooterMoneda: TQRBand;
    QRShape13: TQRShape;
    QRLabelTotalMoneda: TQRLabel;
    QRExpr_TOT_MON_IMP_PAGADO: TQRExpr;
    QRExpr_TOT_MON_IMP_COMISION: TQRExpr;
    QRExpr_TOT_MON_IMP_IVA: TQRExpr;
    QRExpr_TOT_MON_TOT_COM: TQRExpr;
    QRExpr_TOT_MON_IMP_IVA_PAGADO: TQRExpr;
    QRFooterProducto: TQRBand;
    QRShape11: TQRShape;
    QRLabelTotalProducto: TQRLabel;
    QRExpr_TOT_PR_IMP_PAGADO: TQRExpr;
    QRExpr_TOT_PR_IMP_COMISION: TQRExpr;
    QRExpr_TOT_PR_IMP_IVA: TQRExpr;
    QRExpr_TOT_PR_TOT_COM: TQRExpr;
    QRExpr_TOT_PR_IMP_IVA_PAGADO: TQRExpr;
    QRFooterComision: TQRBand;
    QRShape15: TQRShape;
    QRLabelTotalComision: TQRLabel;
    QRExpr_TOT_COM_IMP_PAGADO: TQRExpr;
    QRExpr_TOT_COM_IMP_COMISION: TQRExpr;
    QRExpr_TOT_COM_IMP_IVA: TQRExpr;
    QRExpr_TOT_COM_IMP_IVA_PAGADO: TQRExpr;
    QRLabelNumCrXMoneda: TQRLabel;
    QRLabelNumCrXComision: TQRLabel;
    QRLabelNumCrXProducto: TQRLabel;
    QRExprCountXMoneda: TQRExpr;
    QRExprCountXComision: TQRExpr;
    QRExprCountXProducto: TQRExpr;
    QRLabelALTA: TQRLabel;
    QRLabelF_PROG_PAGO: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDB_NOMBRE: TQRDBText;
    QRDB_ID_CREDITO: TQRDBText;
    QRDB_FECHA_ALTA: TQRDBText;
    QRDB_F_VENCIMIENTO: TQRDBText;
    QRDB_F_PROG_PAGO: TQRDBText;
    QRDB_NUM_PERIODO: TQRDBText;
    QRDB_IMP_BASE: TQRDBText;
    QRDB_PCT_COMISION: TQRDBText;
    QRDB_IMP_COMISION: TQRDBText;
    QRDB_IMP_IVA: TQRDBText;
    QRDB_TOT_COM: TQRDBText;
    QRDB_F_PAGO: TQRDBText;
    QRDB_IMP_PAGADO: TQRDBText;
    QRDB_IMP_IVA_PAGADO: TQRDBText;
    QRDB_SIT_COMISION: TQRDBText;
    QRExpr_TOT_COM_TOT_COM: TQRExpr;
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyCtrlConcF_TRASPASO_VENC: TDateTimeField;
    QRShape16: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
  private

  public

    function FormaQuery(sFecha_INICIO,  sFecha_FINAL ,
                        sGpoProd,       sPRODUCTO_CRE,
                        sID_ACREDITADO, sID_CREDITO,
                        sCVE_COMISION,  sSituacion,
                        sEmpresa,       sSucursal: String;
                        Tinfmost        : Integer
                        ): String;

  end;

var
  QrCtrlConceptos: TQrCtrlConceptos;

  bGenArch: Boolean;
  sArchivo:String;
  vgFechaHoy : TDateTime;
  Apli : TInterApli;
  vgnRowExcel : Integer;
  vgExcelApp  : OleVariant;

  procedure RepCtrlConceptos(sFecha_INICIO,  sFecha_FINAL ,
                             sGpoProd,       sPRODUCTO_CRE,
                             sID_ACREDITADO, sID_CREDITO,
                             sCVE_COMISION,  sSituacion,
                             sEmpresa,       sSucursal,
                             sNbrArch    : String;
                             Tinfmost    : Integer;
                             pPreview    : Boolean;
                             pAPli       : TInterApli);

  procedure EscribeInfoXLS(sF_Inicial,sF_Final, nomArchivo:String; lQuery:TQuery);

implementation

{$R *.DFM}

procedure RepCtrlConceptos(sFecha_INICIO,  sFecha_FINAL ,
                           sGpoProd,       sPRODUCTO_CRE,
                           sID_ACREDITADO, sID_CREDITO,
                           sCVE_COMISION,  sSituacion,
                           sEmpresa,       sSucursal,
                           sNbrArch  : String;
                           Tinfmost  : Integer;
                           pPreview  : Boolean;
                           pAPli     : TInterApli);
var
    QrCtrlConceptos: TQrCtrlConceptos;
    VLTitulo    : String;
    Preview     : TIntQRPreview;
begin
    //ShowMessage('Mostrar Reporte');
    VLTitulo := '';
    QrCtrlConceptos:= TQrCtrlConceptos.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrCtrlConceptos);
    Apli := pApli;


    Try
        vgFechaHoy  :=  pAPli.DameFechaEmpresa;
        bGenArch    :=  False;
        sArchivo    :=  sNbrArch;

        QrCtrlConceptos.QRInterEncabezado1.Apli := pApli;

        //QRDetApliVA.vgTipCambioDll:= ObtTipoCambio(pAPli.DameFechaEmpresaDia('D000'), IntToStr ( C_DLLS ),pAPli.DataBaseName, pAPli.SessionName);
        QrCtrlConceptos.QRInterEncabezado1.IdEmpresa  := pAPli.IdEmpresa;
        QrCtrlConceptos.QRInterEncabezado1.NomReporte := 'IntMQrCtrlConc';
        QrCtrlConceptos.QRInterEncabezado1.Titulo1    := 'Reporte de Control de Conceptos ' +
                                                         ' del: '+ sFecha_INICIO + ' al: ' + sFecha_FINAL;

        VLTitulo := '';

        If (Trim(sGpoProd)<>'') Then
            VLTitulo := VLTitulo + '  Grupo: ' + sGpoProd;

        If (Trim(sPRODUCTO_CRE)<>'') Then
            VLTitulo := VLTitulo + '  Producto: ' + sPRODUCTO_CRE ;

        If (Trim(sID_ACREDITADO)<>'') Then
            VLTitulo := VLTitulo + '  Acreditado: ' + sID_ACREDITADO ;

        If (Trim(sID_CREDITO)<>'') Then
            VLTitulo := VLTitulo + '  Crédito: ' + sID_CREDITO ;

        If (Trim(sCVE_COMISION)<>'') Then
            VLTitulo := VLTitulo + '  Comisión: ' + sCVE_COMISION ;

        If (Trim(sSituacion)<>'') Then
            VLTitulo := VLTitulo + '  Situación: ' + sSituacion ;

        QrCtrlConceptos.QRInterEncabezado1.Titulo2 := VLTitulo;
                                                                                        
        QrCtrlConceptos.qyCtrlConc.DatabaseName := pApli.DataBaseName;
        QrCtrlConceptos.qyCtrlConc.SessionName  := pApli.SessionName;
        QrCtrlConceptos.qyCtrlConc.Active:=False;

        QrCtrlConceptos.qyCtrlConc.SQL.Text:=
               QrCtrlConceptos.FormaQuery(sFecha_INICIO    , sFecha_FINAL ,
                                          sGpoProd,       sPRODUCTO_CRE,
                                          sID_ACREDITADO, sID_CREDITO,
                                          sCVE_COMISION, sSituacion,
                                          sEmpresa         , sSucursal, Tinfmost );

        QrCtrlConceptos.qyCtrlConc.SQL.SaveToFile('c:\qyCtrlConc.SQL');
        QrCtrlConceptos.qyCtrlConc.Active:=True;

        If Trim(sArchivo)<>'' Then
          EscribeInfoXLS(sFecha_INICIO,sFecha_FINAL,sArchivo,QrCtrlConceptos.qyCtrlConc);

        QrCtrlConceptos.qyCtrlConc.First;

        If pPreview Then
            QrCtrlConceptos.Preview
        Else
            QrCtrlConceptos.Print;

    Finally
     If Trim(sArchivo)<>'' Then Begin
        bGenArch:= True;
     End;
      QrCtrlConceptos.free;
      If Assigned(Preview) Then Preview.Free;
    End;

end;



{ TQrCtrlConceptos }

function TQrCtrlConceptos.FormaQuery( sFecha_INICIO , sFecha_FINAL ,
                                      sGpoProd,       sPRODUCTO_CRE,
                                      sID_ACREDITADO, sID_CREDITO,
                                      sCVE_COMISION,  sSituacion,
                                      sEmpresa      , sSucursal: String;
                                      Tinfmost        : Integer
                                      ): String;
var
    sSQL1         : String;
    sSQL2         : String;
begin

    sSQL1:= ' SELECT ' + coCRLF +
            ' CRC.CVE_MONEDA , MON.DESC_MONEDA,  '+ coCRLF +
            ' COM.CVE_COMISION, CVC.DESC_COMISION,  '+ coCRLF +
            ' CRC.CVE_PRODUCTO_CRE, PRO.DESC_L_PRODUCTO,  '+ coCRLF +
//            ' COM.ID_CREDITO, (PER_F.APELLIDO_PATERNO ||'' ''|| PER_F.APELLIDO_MATERNO ||'' ''|| PER_F.NOMBRE_PERSONA) AS NOMBRE,  '+ coCRLF +
            ' COM.ID_CREDITO, '+ coCRLF +
            ' PER_F.APELLIDO_PATERNO, PER_F.APELLIDO_MATERNO, PER_F.NOMBRE_PERSONA,  '+ coCRLF +
            ' (PER_F.APELLIDO_PATERNO ||'' ''|| PER_F.APELLIDO_MATERNO ||'' ''|| PER_F.NOMBRE_PERSONA) AS NOMBRE,  '+ coCRLF +
//
            ' (COM.F_VENCIMIENTO - COM.PLAZO) AS FECHA_ALTA, COM.PLAZO, COM.F_VENCIMIENTO, COM.F_PROG_PAGO,  '+ coCRLF +
            ' COM.NUM_PERIODO, COM.IMP_BASE_CALCULO, COM.PCT_COMISION, COM.IMP_COMISION, COM.IMP_IVA,  '+ coCRLF +
            ' (COM.IMP_COMISION + COM.IMP_IVA) AS TOT_COM,  '+ coCRLF +
            ' COM.F_PAGO, COM.IMP_PAGADO, COM.IMP_IVA_PAGADO, COM.SIT_COMISION,  '+ coCRLF +
            ' CRE.F_TRASPASO_VENC ' + coCRLF +
            ' FROM CR_COMISION COM  ' + coCRLF +
            ' LEFT JOIN CR_CREDITO CRE  ON COM.ID_CREDITO =  CRE.ID_CREDITO  '+ coCRLF +
            ' LEFT JOIN CR_CONTRATO CRC ON CRE.ID_CONTRATO = CRC.ID_CONTRATO  '+ coCRLF +
            ' LEFT JOIN CR_PRODUCTO PRO ON CRC.CVE_PRODUCTO_CRE =  PRO.CVE_PRODUCTO_CRE  '+ coCRLF +
            ' LEFT JOIN CR_PRODUCTO_GPO GPO ON PRO.CVE_PRODUCTO_GPO =  GPO.CVE_PRODUCTO_GPO '+ coCRLF +
            ' LEFT JOIN MONEDA MON ON CRC.CVE_MONEDA = MON.CVE_MONEDA  '+ coCRLF +
            ' LEFT JOIN CONTRATO CON ON CRC.ID_CONTRATO = CON.ID_CONTRATO  '+ coCRLF +
            ' LEFT JOIN PERSONA PER ON CON.ID_TITULAR = PER.ID_PERSONA  '+ coCRLF +
            ' LEFT JOIN CR_CAT_COMISION CVC ON COM.CVE_COMISION = CVC.CVE_COMISION  '+ coCRLF +
            ' LEFT JOIN PERSONA_FISICA PER_F ON PER_F.ID_PERSONA = PER.ID_PERSONA  '+ coCRLF +
            '  WHERE 1 =  1  '+ coCRLF +
            ' AND COM.F_VENCIMIENTO BETWEEN TO_DATE('''+sFecha_INICIO+''',''DD/MM/YYYY'')  AND TO_DATE('''+sFecha_FINAL+''',''DD/MM/YYYY'')  '+ coCRLF ;

     sSQL2 := '';

    //HERJA
//    If not( bSeguros ) then
    If (Tinfmost = 0 ) then
        sSQL2:= sSQL2 + ' AND CVC.CVE_TIPO_COMIS = ''CN''' + coCRLF;
    If (Tinfmost = 1 ) then
        sSQL2:= sSQL2 + ' AND CVC.CVE_TIPO_COMIS = ''SG''' + coCRLF;
    //FIN HERJA

     if Trim(sGpoProd) <> '' then
       sSQL2 :=  sSQL2 + ' AND GPO.CVE_PRODUCTO_GPO = ''' + Trim(sGpoProd) + ''' ' + coCRLF ;

     if Trim(sPRODUCTO_CRE) <> '' then
       sSQL2 :=  sSQL2 + ' AND PRO.CVE_PRODUCTO_CRE =  ''' + Trim(sPRODUCTO_CRE) + ''' ' + coCRLF ;

     if Trim(sID_ACREDITADO) <> '' then
       sSQL2 :=  sSQL2 + ' AND CON.ID_TITULAR = ' + sID_ACREDITADO + ' ' + coCRLF ;

     if Trim(sID_CREDITO) <> '' then
       sSQL2 :=  sSQL2 + ' AND CRE.ID_CREDITO = ' + sID_CREDITO + ' ' + coCRLF ;

     if Trim(sCVE_COMISION) <> '' then
       sSQL2 :=  sSQL2 + ' AND COM.CVE_COMISION IN ( ''' + Trim(sCVE_COMISION) + ''' ) ' + coCRLF ;

     if Trim(sSituacion) <> '' then
       sSQL2 :=  sSQL2 + ' AND COM.SIT_COMISION =  ''' + Trim(sSituacion) + ''' ' + coCRLF;


//     sSQL2 := sSQL2 + ' ORDER BY CRC.CVE_MONEDA, COM.CVE_COMISION,   CRC.CVE_PRODUCTO_CRE, NOMBRE, COM.ID_CREDITO ,  COM.NUM_PERIODO ';
     sSQL2 := sSQL2 + ' ORDER BY CRC.CVE_MONEDA, COM.CVE_COMISION,   CRC.CVE_PRODUCTO_CRE, PER_F.APELLIDO_PATERNO, PER_F.APELLIDO_MATERNO, PER_F.NOMBRE_PERSONA, COM.ID_CREDITO,  COM.NUM_PERIODO ';

   Result:= sSQL1 + sSQL2;
end;


procedure EscribeInfoXLS(sF_Inicial,sF_Final, nomArchivo:String; lQuery:TQuery);
var
   sFecInicial : String;
   sFecFinal   : String;
begin
   vgnRowExcel:=1;
   vgExcelApp := CreateOleObject('Excel.Application');
   vgExcelApp.Workbooks.Add;
   //EscribeEncabezado (fechaCierre);
     sFecInicial:=StringReplace(sF_Inicial ,'/','',[rfReplaceAll]);
     sFecFinal:=StringReplace(sF_Final ,'/','',[rfReplaceAll]);

      vgExcelApp.Workbooks[1].WorkSheets[1].Name := 'CC-'+sFecInicial+'-'+sFecFinal;

      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('A')].Value := 'CLAVE MONEDA';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('B')].Value := 'DESCR. MONEDA';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('C')].Value := 'CLAVE COMISION';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('D')].Value := 'DESCR. COMISION';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('E')].Value := 'CLAVE PRODUCTO';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('F')].Value := 'DESCR. PRODUCTO';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('G')].Value := 'CREDITO';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('H')].Value := 'NOMBRE';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('I')].Value := 'FECHA ALTA';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('J')].Value := 'PLAZO';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('K')].Value := 'FECHA VENCIMIENTO';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('L')].Value := 'FECHA PROG. PAGO';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('M')].Value := 'NUM. PERIODO';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('N')].Value := 'IMP. BASE CALCULO';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('O')].Value := 'PCT. COMISION';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('P')].Value := 'IMP. COMISION';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('Q')].Value := 'IMP. IVA';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('R')].Value := 'TOTAL COMISION';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('S')].Value := 'FECHA DE PAGO';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('T')].Value := 'IMPORTE PAGADO';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('U')].Value := 'IMPORTE IVA PAGADO';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('V')].Value := 'FECHA TRASPASO VENC.';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('W')].Value := 'SIT. COMISION';

     lQuery.First;

   while not(lQuery.Eof) do
   begin
     Inc(vgnRowExcel);

     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('A')].Value := lQuery.FieldByName('CVE_MONEDA').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('B')].Value := lQuery.FieldByName('DESC_MONEDA').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('C')].Value := lQuery.FieldByName('CVE_COMISION').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('D')].Value := lQuery.FieldByName('DESC_COMISION').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('E')].Value := lQuery.FieldByName('CVE_PRODUCTO_CRE').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('F')].Value := lQuery.FieldByName('DESC_L_PRODUCTO').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('G')].Value := lQuery.FieldByName('ID_CREDITO').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('H')].Value := lQuery.FieldByName('NOMBRE').AsString;

     if Trim(lQuery.FieldByName('FECHA_ALTA').AsString) <> '' then
       vgExcelApp.Cells[vgnRowExcel,ColumnXlS('I')].Value := lQuery.FieldByName('FECHA_ALTA').AsDateTime;

     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('J')].Value := lQuery.FieldByName('PLAZO').AsString;

     if Trim(lQuery.FieldByName('F_VENCIMIENTO').AsString) <> '' then
       vgExcelApp.Cells[vgnRowExcel,ColumnXlS('K')].Value := lQuery.FieldByName('F_VENCIMIENTO').AsDateTime;

     if Trim(lQuery.FieldByName('F_PROG_PAGO').AsString) <> '' then
       vgExcelApp.Cells[vgnRowExcel,ColumnXlS('L')].Value := lQuery.FieldByName('F_PROG_PAGO').AsDateTime;

     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('M')].Value := lQuery.FieldByName('NUM_PERIODO').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('N')].Value := lQuery.FieldByName('IMP_BASE_CALCULO').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('O')].Value := lQuery.FieldByName('PCT_COMISION').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('P')].Value := lQuery.FieldByName('IMP_COMISION').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('Q')].Value := lQuery.FieldByName('IMP_IVA').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('R')].Value := lQuery.FieldByName('TOT_COM').AsString;

     if Trim(lQuery.FieldByName('F_PAGO').AsString) <> '' then
       vgExcelApp.Cells[vgnRowExcel,ColumnXlS('S')].Value := lQuery.FieldByName('F_PAGO').AsDateTime;

     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('T')].Value := lQuery.FieldByName('IMP_PAGADO').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('U')].Value := lQuery.FieldByName('IMP_IVA_PAGADO').AsString;

     if Trim(lQuery.FieldByName('F_TRASPASO_VENC').AsString) <> '' then
       vgExcelApp.Cells[vgnRowExcel,ColumnXlS('V')].Value := lQuery.FieldByName('F_TRASPASO_VENC').AsDateTime;

     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('W')].Value := lQuery.FieldByName('SIT_COMISION').AsString;


     lQuery.Next;
   end;

   //Guarda archivo
   Inc(vgnRowExcel);
   vgnRowExcel:=vgnRowExcel+2;
   vgExcelApp.Cells[vgnRowExcel,ColumnXlS('A' )].Value := 'Se generaron : ' + IntToStr(vgnRowExcel-4) +  ' registros';

   vgExcelApp.ActiveWorkBook.SaveAs(nomArchivo);
   CloseExcelFile(vgExcelApp);
end;


end.
