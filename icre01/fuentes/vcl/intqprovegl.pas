unit IntQProVeGl;

interface     

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, Dialogs,
     StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead,IntQRPreview,InterApl,
     Db, DBTables,IntGenCre,unSQL2, Psock, NMFtp, U_InterCustomStar,
  U_InterDigDoc;

type
  TQRProVegl = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRShape26: TQRShape;
    QRShape22: TQRShape;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRShape8: TQRShape;
    QRLabel6: TQRLabel;
    QRShape11: TQRShape;
    qyProgVen: TQuery;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDB_IMP_IVA: TQRDBText;
    QRShape12: TQRShape;
    dbNombre_Promotor: TQRDBText;
    dbNom_Promotor: TQRDBText;
    qrlPromotor: TQRLabel;
    QRShape14: TQRShape;
    QRDBText15: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel23: TQRLabel;
    QRShape15: TQRShape;
    dbProducto: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText23: TQRDBText;
    QRShape17: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText10: TQRDBText;
    QRFooterCliente: TQRBand;
    QRLabel27: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel24: TQRLabel;
    QRDBText2: TQRDBText;
    QRExpr11: TQRExpr;
    QRFooterPromotor: TQRBand;
    QRExpr49: TQRExpr;
    QRLabel16: TQRLabel;
    QRExpr12: TQRExpr;
    QRLabel1: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr14: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape2: TQRShape;
    QRLabel12: TQRLabel;
    QRShape3: TQRShape;
    QRLabel13: TQRLabel;
    QRShape6: TQRShape;
    QRLabel15: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText22: TQRDBText;
    QRFooterCesion: TQRBand;
    QRExpr24: TQRExpr;
    QRLabel11: TQRLabel;
    QRExpr10: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr28: TQRExpr;
    QRExpr30: TQRExpr;
    QRExpr31: TQRExpr;
    QRExpr33: TQRExpr;
    QRExpr35: TQRExpr;
    QRExpr36: TQRExpr;
    QRExpr38: TQRExpr;
    QRExpr40: TQRExpr;
    QRExpr41: TQRExpr;
    qyProgVenID_CREDITO: TFloatField;
    qyProgVenACCESORIO: TStringField;
    qyProgVenMORATORIOS: TFloatField;
    qyProgVenIVA_MORAS: TFloatField;
    qyProgVenIMP_TOTAL_VDO: TFloatField;
    qyProgVenIMP_IVA_VDO: TFloatField;
    qyProgVenIMP_IVA_VIG: TFloatField;
    qyProgVenIMPORTE_VIG: TFloatField;
    qyProgVenID_PROM_ADM: TFloatField;
    qyProgVenNOM_PROMOTOR_ADM: TStringField;
    qyProgVenID_PERS_ASOCIAD: TFloatField;
    qyProgVenNOM_PROMOTOR_ASO: TStringField;
    qyProgVenF_INICIO: TDateTimeField;
    qyProgVenF_VENCIMIENTO: TDateTimeField;
    qyProgVenID_CONTRATO: TFloatField;
    qyProgVenSDO_INSOLUTO: TFloatField;
    qyProgVenSDO_VIG_TOTAL: TFloatField;
    qyProgVenIMP_CREDITO: TFloatField;
    qyProgVenTASA_CREDITO: TFloatField;
    qyProgVenCVE_MONEDA: TFloatField;
    qyProgVenDESC_MONEDA: TStringField;
    qyProgVenCVE_PRODUCTO_CRE: TStringField;
    qyProgVenDESC_L_PRODUCTO: TStringField;
    qyProgVenCUENTA_BANCO: TStringField;
    qyProgVenSALDO_AL: TFloatField;
    qyProgVenCUENTA_BANCO_1: TStringField;
    qyProgVenSALDO_AL_1: TFloatField;
    qyProgVenID_TITULAR: TFloatField;
    qyProgVenNOMBRE: TStringField;
    qyProgVenDIRECCION: TStringField;
    qyProgVenCOLONIA: TStringField;
    qyProgVenCIUDAD: TStringField;
    qyProgVenESTADO: TStringField;
    qyProgVenPAIS: TStringField;
    qyProgVenCP: TStringField;
    qyProgVenTEL_CASA: TStringField;
    qyProgVenFAX: TStringField;
    qyProgVenTEL_OFNA: TStringField;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr21: TQRExpr;
    QRShape13: TQRShape;
    FooterMoneda: TQRBand;
    QRExpr6: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr29: TQRExpr;
    QRExpr32: TQRExpr;
    qyProgVenSDO_COMP: TFloatField;
    qyProgVenTIPO_DISPOSICION: TStringField;
    qyProgVenB_APLICA_IVA: TStringField;
    qyProgVenPROVEEDOR: TFloatField;
    qyProgVenCVE_TASA_REFER: TStringField;
    qyProgVenB_FINANC_ADIC: TStringField;
    qyProgVenNUM_DIAS_VENCIDO: TFloatField;
    SummaryBand1: TQRBand;
    QRLabel22: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel17: TQRLabel;
    QRLTot_ImpVig: TQRLabel;
    QRLTot_IvaVig: TQRLabel;
    QRLTot_TotVig: TQRLabel;
    QRLTot_ImpVen: TQRLabel;
    QRLTot_IvaVen: TQRLabel;
    QRLTot_Moras: TQRLabel;
    QRLTot_IvaMor: TQRLabel;
    QRLTot_TotVen: TQRLabel;
    QRLTot_VigVen: TQRLabel;
    qyProgVenB_OPERADO_NAFIN: TStringField;
    qyProgVenF_AUTORIZA: TDateTimeField;
    qyProgVenSDO_COMP_BLOQ: TFloatField;
    QRShape7: TQRShape;
    QRLabel25: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape18: TQRShape;
    QRLabel32: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel40: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel41: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText30: TQRDBText;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRGroupMoneda : TQRGroup;
    QRGroupPromotor1 : TQRGroup;
    QRGroupProducto : TQRGroup;
    QRGroup1 : TQRGroup;
    QRGroupProveedor : TQRGroup;
    QRGroupCesion1 : TQRGroup;
    qyProgVenNOM_PROVEEDOR: TStringField;
    QRDBText3: TQRDBText;
    InterDigDoc1: TInterDigDoc;
    NMFTP1: TNMFTP;


    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterCesionBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterClienteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterPromotorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBPromAsocBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

    Function QuitaComas(PPCadena : String):String;
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FooterMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRGroupMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupProveedorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private



    //para el footer de Credito
    VL_C_Imp_Vig    : Double;
    VL_C_Iva_Vig    : Double;
    VL_C_Tot_Vig    : Double;
    VL_C_Imp_Venc   : Double;
    VL_C_Iva_Venc   : Double;
    VL_C_Moras      : Double;
    VL_C_Iva_Mor    : Double;
    VL_C_Tot_Venc   : Double;
    VL_C_Total      : Double;

    //para el footer de Cliente
    VL_CL_Imp_Vig    : Double;
    VL_CL_Iva_Vig    : Double;
    VL_CL_Tot_Vig    : Double;
    VL_CL_Imp_Venc   : Double;
    VL_CL_Iva_Venc   : Double;
    VL_CL_Moras      : Double;
    VL_CL_Iva_Mor    : Double;
    VL_CL_Tot_Venc   : Double;
    VL_CL_Total      : Double;

    //para el footer de P Asociado
    VL_PAS_Imp_Vig    : Double;
    VL_PAS_Iva_Vig    : Double;
    VL_PAS_Tot_Vig    : Double;
    VL_PAS_Imp_Venc   : Double;
    VL_PAS_Iva_Venc   : Double;
    VL_PAS_Moras      : Double;
    VL_PAS_Iva_Mor    : Double;
    VL_PAS_Tot_Venc   : Double;
    VL_PAS_Total      : Double;

    //para el footer de P Administrador
    VL_PAD_Imp_Vig    : Double;
    VL_PAD_Iva_Vig    : Double;
    VL_PAD_Tot_Vig    : Double;
    VL_PAD_Imp_Venc   : Double;
    VL_PAD_Iva_Venc   : Double;
    VL_PAD_Moras      : Double;
    VL_PAD_Iva_Mor    : Double;
    VL_PAD_Tot_Venc   : Double;
    VL_PAD_Total      : Double;

    //para armar el archivo de Excel
    vlimp_vig_cap     : string;
    vlimp_iva_vig_cap : string;
    vlimp_vdo_cap     : string;
    vlimp_iva_vdo_cap : string;
    vlmoras_cap       : string;
    vliva_moras_cap   : string;
    vlimp_vig_fin     : string;
    vlimp_iva_vig_fin : string;
    vlimp_vdo_finan   : string;
    vlimp_iva_vdo_fin : string;
    vlmoras_finan     : string;
    vliva_moras_fin   : string;
    vlimp_vig_int     : string;
    vlimp_iva_vig_int : string;
    vlimp_vdo_int     : string;
    vlimp_iva_vdo_int : string;
    vlmoras_int       : string;
    vliva_moras_int   : string;
    vlimp_vig_conc    : string;
    vlimp_iva_vig_con : string;
    vlimp_vdo_conc    : string;
    vlimp_iva_vdo_con : string;
    vlmoras_conc      : string;
    vliva_moras_con   : string;

    vlSdoTotalVig     : String;
    vlSdoTotalVdo     : String;
    vlSaldoTotal      : String;
    vlTipoCambio      : String;  

    tc : Double;

  public
     VLF_Vencimiento : String;
     Apli : TInterApli;

     Function FormaQuery(sF_Vencimiento,sProducto,sMoneda,
                         sAcreditado,  sPromAsoc,sPromAdmon,
                         sCesion,sGpoProd, sIdContrato : String
                         ) : String;
  end;


var
  QRProVegl: TQRProVegl;
  sArchivo:String;
  F: TextFile;
  B_1ARCH:BOOLEAN;
  vlmaxlin, vlinclin:word;
  vltotcred : integer;
  vltmpcred : integer;
  VGInteresProy, VGInteresIvaProy, VGTasaProy : single;
  vlF_Vencimiento:string;
  vlFecha   : String;

  Vsumpesos_Imp_Vig,
  Vsumpesos_Iva_Vig,
  Vsumpesos_Tot_Vig,
  Vsumpesos_Imp_Venc,
  Vsumpesos_Iva_Venc,
  Vsumpesos_Moras,
  Vsumpesos_Iva_Mor,
  Vsumpesos_Tot_Venc,
  Vsumpesos_Total : Double;
  vlproveedor : String;


Procedure RepProgVenGl(sF_Vencimiento,
                       sProducto,sMoneda,
                       sAcreditado, sPromAsoc,sPromAdmon,
                       sCesion,sGpoProd,sIdContrato,
                       sNbrArch:String;
                       pAPli     : TInterApli;
                       grOpcion  : TGenRepOption; //parametro para Digitalización JFOF 17/02/2012
                       sArchivoDig : String
//                       pPreview  : Boolean
                       );


Implementation

{$R *.DFM}

Procedure RepProgVenGl(sF_Vencimiento,
                       sProducto,sMoneda,
                       sAcreditado, sPromAsoc,sPromAdmon,
                       sCesion,sGpoProd,sIdContrato,
                       sNbrArch:String;
                       pAPli     : TInterApli;
                       grOpcion  : TGenRepOption; //parametro para Digitalización JFOF 17/02/2012
                       sArchivoDig : String
//                       pPreview  : Boolean
                       );
Var
    QRProVegl: TQRProVegl;
    VLTitulo : String;
    Preview     : TIntQRPreview;
Begin
    vlF_Vencimiento:=sF_Vencimiento;
    VLTitulo := '';
    QRProVegl:=TQRProVegl.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QRProVegl);
    Try

        vlFecha := sF_Vencimiento;
        QRProVegl.QRInterEncabezado1.Apli:=pApli;
        QRProVegl.Apli := pAPli;

        QRProVegl.VLF_Vencimiento := sF_Vencimiento;

        sArchivo:= sNbrArch;

        QRProVegl.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QRProVegl.QRInterEncabezado1.NomReporte:='IntQProVegl';
        QRProVegl.QRInterEncabezado1.Titulo1:='Reporte de Adeudos al '+ sF_Vencimiento + coCRLF + VLTitulo ;


        If (Trim(sProducto)<>'') Then
            VLTitulo := VLTitulo + ' Por Producto';
        If (Trim(sMoneda)<>'') Then
            VLTitulo := VLTitulo + ' Por Moneda';
        If (Trim(sAcreditado)<>'') Then
            VLTitulo := VLTitulo + ' Por Acreditado';
        If (Trim(sPromAsoc)<>'') Then
            VLTitulo := VLTitulo + ' Por Prom. Asoc.';
        If (Trim(sPromAdmon)<>'') Then
            VLTitulo := VLTitulo + ' Por Prom. Adm.';
        If (Trim(sCesion)<>'') Then
            VLTitulo := VLTitulo + ' Por Disposición';

        QRProVegl.QRInterEncabezado1.Titulo2 := VLTitulo;

        QRProVegl.qyProgVen.DatabaseName := pApli.DataBaseName;
        QRProVegl.qyProgVen.SessionName := pApli.SessionName;

        QRProVegl.qyProgVen.Active:=False;
        QRProVegl.qyProgVen.SQL.Text:= QRProVegl.FormaQuery(sF_Vencimiento,sProducto,sMoneda,
                                                            sAcreditado,  sPromAsoc,sPromAdmon,
                                                            sCesion,sGpoProd,sIdContrato);
        QRProVegl.qyProgVen.SQL.SaveToFile('c:\IntQProVegl.txt');
        QRProVegl.qyProgVen.Active:=True;

        vlmaxlin  := 0;
        vlinclin  := 0;
        vltotcred := 0;
        vlmaxlin  := QRProVegl.qyProgVen.RecordCount;

        vltmpcred := 0;

        B_1ARCH := False;

         If Trim(sArchivo)<>'' Then
         Begin
            B_1ARCH:=FALSE;
            AssignFile(F, sArchivo);
            Rewrite(F);
            Writeln(F, QRProVegl.QRInterEncabezado1.Titulo1+ #09 );
            Writeln(F,  #09 );
            Writeln(F,
              'CVE_MONEDA'  + #09 +
              'DESC_MONEDA'  + #09 +
              'TIPO_CAMBIO' + #09# +
              'ID_PERS_ASOCIAD'  + #09 +
              'NOM_PROMOTOR_ASO'  + #09 +
              'ID_PROM_ADM'  + #09 +
              'NOM_PROMOTOR_ADM'  + #09 +
              'CVE_PRODUCTO_CRE'  + #09 +
              'DESC_L_PRODUCTO'  + #09 +
              'ID_TITULAR'  + #09 +
              'NOMBRE'  + #09 +
              'PROVEEDOR'  + #09 +
              'NOM_PROVEEDOR'  + #09 +
              'B_OPERADO_NAFIN'  + #09 +
              'ID_CONTRATO'  + #09 +
              'ID_CREDITO'  + #09 +
              'IMP_CREDITO'  + #09 +
              'TASA_REFER'  + #09 +
              'TASA_CREDITO'  + #09 +
              'F_INICIO'  + #09 +
              'F_VENCIMIENTO'  + #09 +
              'F_AUTORIZA'  + #09 +
              'CUENTA_BANCO'  + #09 +
              'SALDO_AL' + #09 +
              'SDO_COMP' + #09 +
              'SDO_COMP_BLOQ'  + #09 +
              'TIPO_DISPOSICION'  + #09 +
              'APLICA_IVA'  + #09 +
              'B_FINANC_ADIC' + #09 +
              'DIAS_VENCIDO' + #09 +
              'IMP_VIG_CAP' + #09 +
              'IMP_IVA_VIG_CAP' + #09 +
              'IMP_VIG_FINAN' + #09 +
              'IMP_IVA_VIG_FINAN' + #09 +
              'IMP_VIG_INT'  + #09 +
              'IMP_IVA_VIG_INT'  + #09 +
              'IMP_VIG_CONC'  + #09 +
              'IMP_IVA_VIG_CONC'  + #09 +
              'SDO_VIG_TOTAL'  + #09 +
              'IMP_VDO_CAP'  + #09 +
              'IMP_IVA_VDO_CAP'  + #09 +
              'MORAS_CAP'  + #09 +
              'IVA_MORAS_CAP' + #09 +
              'IMP_VDO_FINAN' + #09 +
              'IMP_IVA_VDO_FINAN'  + #09 +
              'MORAS_FINAN'  + #09 +
              'IVA_MORAS_FINAN' + #09 +
              'IMP_VDO_INT'  + #09 +
              'IMP_IVA_VDO_INT'  + #09 +
              'MORAS_INT'  + #09 +
              'IVA_MORAS_INT'   + #09 +
              'IMP_VDO_CONC'   + #09 +
              'IMP_IVA_VDO_CONC'  + #09 +
              'MORAS_CONC'     + #09 +
              'IVA_MORAS_CONC' + #09 +
              'TOTAL_SDO_VDO'  + #09 +
              'SALDO_TOTAL'
              );
      End;
//        If pPreview Then
//            QRProVegl.Preview
//        Else
//            QRProVegl.Print;

          // INICIO OPCION DE DIGITALIZACION 17/02/2012 JFOF
           If grOpcion = grPreview Then
         QRProVegl.Preview
      Else if grOpcion = grPrint Then
         QRProVegl.Print
      Else if grOpcion = grDigitaliza Then
      Begin
            QRProVegl.InterDigDoc1.RootDir  := obtValorGpoCve( 'ADGLOB', 'ROOTDIR',   pApli);
            QRProVegl.InterDigDoc1.HostName := obtValorGpoCve( 'CONFRH', 'FTPSERVER', pApli);
            QRProVegl.InterDigDoc1.UserName := obtValorGpoCve( 'CONFRH', 'USERNAME',  pApli);
            QRProVegl.InterDigDoc1.Password := HexToStr( obtValorGpoCve( 'CONFRH', 'PASSWORD',  pApli) );
            QRProVegl.InterDigDoc1.SendTo   := ObtSendTo(sF_Vencimiento); // '/2012/01' prueba desarrollo
            QRProVegl.InterDigDoc1.FileName := sArchivoDig + '.pdf';
            QRProVegl.PrinterSettings.PrinterIndex := QRProVegl.InterDigDoc1.SetPrinter;
            QRProVegl.Print;
            QRProVegl.InterDigDoc1.Compress;
            QRProVegl.InterDigDoc1.SendFile;
            QRProVegl.PrinterSettings.PrinterIndex := QRProVegl.InterDigDoc1.RestorePrinter;

       End;


    Finally

      If Trim(sArchivo)<> '' Then Begin    
         CloseFile(F);
      End;

      if (B_1ARCH = true) and (grOpcion <> grDigitaliza) then
      ShowMessage('    ¡ Archivo Generado !');
      QRProVegl.free;
      If Assigned(Preview) Then Preview.Free;
    End;
end;

Function TQRProVegl.QuitaComas(PPCadena : String):String;
var
   vlIndex, vlTotal : Integer;
   vlCar,vlRenglon: String;
begin
   vlTotal:= Length (Trim(PPCadena));
   vlRenglon:='';

   for vlIndex := 1 to vlTotal do
   begin
      vlCar:= Copy(PPCadena, vlIndex, 1);
      if  vlCar <> ',' then vlRenglon:=vlRenglon+vlCar;
   end;
   QuitaComas:=vlRenglon;
end;

Function TQRProVegl.FormaQuery(sF_Vencimiento,sProducto,sMoneda,
                               sAcreditado,  sPromAsoc,sPromAdmon,
                               sCesion,sGpoProd, sIdContrato : String
                               ) : String;


Var
    sSQL         : String;
    sSQL1        : String;
    VlSituacion  : String;
    VLBFechaTras : Boolean;
    VLDiaHoy     : String;
    VLComparador : String;
    VLTipoRep    : String;
    sF_Calculo   : String;

begin

   sF_Calculo := Trim(sF_Vencimiento);
   VLTipoRep := '';

           sSQL:=  ' SELECT GENERAL.*, ' + coCRLF +
                         '  (select NVL(ID_PROVEEDOR,0) from cr_cesion WHERE ID_CESION = CC.ID_CREDITO) as PROVEEDOR, ' + coCRLF +
                         '  (select NOMBRE from persona where id_persona = (select NVL(ID_PROVEEDOR,0) from cr_cesion WHERE ID_CESION = CC.ID_CREDITO)) as NOM_PROVEEDOR,' + coCRLF +
                         '  (select NVL(B_OPERADO_NAFIN,''F'') from cr_cesion WHERE ID_CESION = CC.ID_CREDITO) as B_OPERADO_NAFIN, ' + coCRLF +
                         '  PPR.ID_PERSONA AS ID_PROM_ADM, ' + coCRLF +
                         '  PPR.NOMBRE AS NOM_PROMOTOR_ADM, ' + coCRLF +
                         '  CTO.ID_PERS_ASOCIAD, ' + coCRLF +
                         '  PPRC.NOMBRE NOM_PROMOTOR_ASO, ' + coCRLF +
                         '  CC.F_INICIO, ' + coCRLF +
                         '  CC.F_VENCIMIENTO, ' + coCRLF +
                         '  CC.F_AUTORIZA, ' + coCRLF +
                         '  CC.ID_CONTRATO, ' + coCRLF +
                         '  CC.TIPO_DISPOSICION, ' + coCRLF +
                         '  CC.B_APLICA_IVA,' + coCRLF +
                         '  CC.CVE_TASA_REFER,' + coCRLF +
                         '  CC.B_FINANC_ADIC,' + coCRLF +
                         '  CC.SDO_INSOLUTO, ' + coCRLF +
                         '  CC.SDO_VIG_TOTAL, ' + coCRLF +
                         '  (SELECT SDO_COMP_VIRT FROM DV_CONTRATO WHERE ID_CONTRATO IN (PKGCRPERIODO.STPObtChqCte(NULL,NULL,CC.ID_CREDITO,''AC'',''AD'',''CR''))) as SDO_COMP,' + coCRLF +
                         '  (SELECT SDO_BLOQ_VIRT FROM DV_CONTRATO WHERE ID_CONTRATO IN (PKGCRPERIODO.STPObtChqCte(NULL,NULL,CC.ID_CREDITO,''AC'',''AD'',''CR''))) as SDO_COMP_BLOQ,' + coCRLF +
                         '  CC.IMP_CREDITO, ' + coCRLF +
                         '  (SELECT NVL(TASA_APLICADA,CC.TASA_CREDITO) FROM CRE_PROV_DIARIA WHERE ID_CREDITO = CC.ID_CREDITO AND F_PROVISION = ('+ SQLFecha( StrToDate(sF_Vencimiento) )+ '-1)) AS TASA_CREDITO,' + coCRLF +
                         '  M.CVE_MONEDA, ' + coCRLF +
                         '  M.DESC_MONEDA, ' + coCRLF +
                         '  CCTO.CVE_PRODUCTO_CRE, ' + coCRLF +
                         '  (SELECT DESC_L_PRODUCTO FROM CR_PRODUCTO WHERE CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE) DESC_L_PRODUCTO, ' + coCRLF +
                         '  SUBSTR(PKGCRPERIODO.STPObtChqCte(PCE.ID_PERSONA,0,GENERAL.ID_CREDITO,''AC'',''AD'',''CR''),1,20) CUENTA_BANCO, ' + coCRLF +
                         '  PKGDPVISTASERV.SPTObtSaldo(PKGCRPERIODO.STPObtChqCte(PCE.ID_PERSONA,0,GENERAL.ID_CREDITO,''AC'',''AD'',''CR''),''D000'') SALDO_AL, ' + coCRLF +
                         '  SUBSTR(PKGCRPERIODO.STPObtChqCte(PCE.ID_PERSONA,0,CC.ID_CREDITO,''AC'',''AD'',''CR''),1,20) CUENTA_BANCO, ' + coCRLF +
                         '  PKGDPVISTASERV.SPTObtSaldo(PKGCRPERIODO.STPObtChqCte(PCE.ID_PERSONA,0,CC.ID_CREDITO,''AC'',''AD'',''CR''),''D000'') SALDO_AL, ' + coCRLF +
                         '  PCE.ID_PERSONA AS ID_TITULAR, ' + coCRLF +
                         '  PCE.NOMBRE, ' + coCRLF +
                         '  D.CALLE_NUMERO||''  Ext. ''||D.NUM_EXTERIOR||''  Int. ''||D.NUM_INTERIOR AS DIRECCION, ' + coCRLF +
                         '  D.COLONIA AS COLONIA, ' + coCRLF +
                         '  (SELECT DESC_POBLACION FROM POBLACION WHERE CVE_POBLACION=D.CVE_CIUDAD) AS CIUDAD, ' + coCRLF +
                         '  (SELECT DESC_POBLACION FROM POBLACION WHERE CVE_POBLACION=D.CVE_ESTADO) AS ESTADO, ' + coCRLF +
                         '  (SELECT DESC_POBLACION FROM POBLACION WHERE CVE_POBLACION=D.CVE_PAIS) AS PAIS, ' + coCRLF +
                         '  D.CODIGO_POSTAL AS CP, ' + coCRLF +
                         '  PCE.TELEF_CASA AS TEL_CASA, ' + coCRLF +
                         '  PCE.TELEF_FAX AS FAX, ' + coCRLF +
                         '  PCE.TELEF_OFICINA AS TEL_OFNA ' + coCRLF +
                     ' FROM ( ' + coCRLF +
                            'SELECT ID_CREDITO, ' + coCRLF +
                            '       ''CAPITAL'' AS ACCESORIO, ' + coCRLF +
                            '       SUM(MORATORIOS) AS MORATORIOS, ' + coCRLF +
                            '       SUM(IVA_MORAS) AS IVA_MORAS, ' + coCRLF +
                            '       SUM(IMP_TOTAL_VDO) AS IMP_TOTAL_VDO, ' + coCRLF +
                            '       SUM(IMP_IVA_VDO) AS IMP_IVA_VDO, ' + coCRLF +
                            '       SUM(IMP_IVA_VIG) AS IMP_IVA_VIG, ' + coCRLF +
                            '       SUM(IMPORTE_VIG) AS IMPORTE_VIG, ' + coCRLF +
                            '       MAX(NUM_DIAS_VENCIDO) AS NUM_DIAS_VENCIDO ' + coCRLF +
                            '  FROM ( ' + coCRLF +
                            '        SELECT ID_CREDITO, ' + coCRLF +
                            '               SUM(MORATORIOS) MORATORIOS, ' + coCRLF +
                            '               SUM(IMP_IVA_MORAS)   IVA_MORAS, ' + coCRLF +
// HERJA ENERO 2013
//                            '               SUM(IMP_CAPITAL  - IMP_PAGADO_HIST ) IMP_TOTAL_VDO, ' + coCRLF +
                            '               SUM(IMP_CAPITAL  - IMP_PAGADO_HIST + PAGOSANT ) IMP_TOTAL_VDO, ' + coCRLF +
//
                            '               0 AS IMP_IVA_VDO, ' + coCRLF +
                            '               0 AS IMP_IVA_VIG, ' + coCRLF +
                            '               0 AS IMPORTE_VIG, ' + coCRLF +
                            '               MAX(NUM_DIAS_VENCIDO) AS NUM_DIAS_VENCIDO ' + coCRLF +
                            '          FROM (SELECT CCA.ID_CREDITO, CCA.IMP_CAPITAL, ' + coCRLF +
                            '                       NVL( (CCA.IMP_MORATORIO - CCA.IMP_PAGADO_MORA - CCA.IMP_COND_MORA), 0) AS MORATORIOS, ' + coCRLF +
                            '                       NVL( (CCA.IMP_IVA_MORA - CCA.IMP_PAG_IVA_MORA - CCA.IMP_IVA_COND_MOR) ,0) AS IMP_IVA_MORAS, ' + coCRLF +
                            '                       NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''CP'', ''IMPBRU'',CCA.ID_CREDITO, CCA.NUM_PERIODO,NULL,' + SQLFecha( StrToDate( sF_Calculo ) ) + ',''V'' ), 0 ) AS IMP_PAGADO_HIST, ' + coCRLF +
                            '                       CCA.NUM_DIAS_VENCIDO ' + coCRLF +
                            '                        ,NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) PAGOSANT ' + coCRLF +  //HERJA ENERO 2013
                            '                  FROM ( ' + coCRLF +
                            '                        SELECT CCA.* FROM CR_CAPITAL CCA ' + coCRLF +
                            '                         WHERE 1 = 1 ' + coCRLF +
                            '                           AND CCA.F_VENCIMIENTO < '+ SQLFecha( StrToDate(sF_Vencimiento)) + coCRLF +
                            '                           AND ((CCA.F_PROG_PAGO < CCA.F_PAGO AND CCA.SIT_CAPITAL NOT IN (''CA'',''LQ'') AND CCA.F_PAGO > ' + SQLFecha( StrToDate( sF_Vencimiento ) ) + ')' + coCRLF +
                            '                            OR (CCA.SIT_CAPITAL = ''IM'' )) ' + coCRLF +
                            '                 ) CCA ' + coCRLF +
//HERJA ENERO 2013
			    '		    ,( ' + coCRLF +
			    '		      SELECT CT.ID_CREDITO, CT.ID_PERIODO, ' + coCRLF +
			    '	                     NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_PGDMCP ' + coCRLF +
			    '	                FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT ' + coCRLF +
			    '	               WHERE 1=1 ' + coCRLF +
			    '	                 AND CT.SIT_TRANSACCION = ''AC'' ' + coCRLF +
			    '	                 AND CT.ID_TRANS_CANCELA IS NULL ' + coCRLF +
			    '	                 AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION ' + coCRLF +
			    '	                 AND CT.CVE_OPERACION IN (''PGDMCP'') ' + coCRLF +
			    '		         AND CDT.CVE_CONCEPTO IN (''IMPBRU'') ' + coCRLF +
			    '	               GROUP BY CT.ID_CREDITO, CT.ID_PERIODO ' + coCRLF +
			    '		     ) CA_HIST_PGDMCP ' + coCRLF +
                            '            WHERE 1=1 ' + coCRLF +
            	  	    '	           AND CA_HIST_PGDMCP.ID_CREDITO (+)= CCA.ID_CREDITO ' + coCRLF +
		            '              AND CA_HIST_PGDMCP.ID_PERIODO (+)= CCA.NUM_PERIODO ' + coCRLF +
//
                            '          ) VECA ' + coCRLF +
                            '   GROUP BY ID_CREDITO ' + coCRLF +
                            '   UNION ALL ' + coCRLF +
                            '        SELECT ID_CREDITO,  ' + coCRLF +
                            '               0 AS MORATORIOS, ' + coCRLF +
                            '               0 AS IMP_IVA_MORAS, ' + coCRLF +
                            '               0 AS IMP_TOTAL_VDO, ' + coCRLF +
                            '               0 AS IMP_IVA_VDO, ' + coCRLF +
                            '               0 AS IMP_IVA_VIG, ' + coCRLF +
// HERJA ENERO 2013
//                            '               SUM(IMP_CAPITAL - IMP_PAGADO_HIST ) IMPORTE_VIG, ' + coCRLF +
                            '               SUM(IMP_CAPITAL - IMP_PAGADO_HIST + PAGOSANT ) IMPORTE_VIG, ' + coCRLF +
//
                            '               0 AS NUM_DIAS_VENCIDO ' + coCRLF +
                            '          FROM ( ' + coCRLF +
                            '                SELECT CCA.ID_CREDITO, CCA.IMP_CAPITAL, ' + coCRLF +
                            '                       0 AS MORATORIOS, ' + coCRLF +
                            '                       NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''CP'', ''IMPBRU'', CCA.ID_CREDITO, CCA.NUM_PERIODO,NULL,' + SQLFecha( StrToDate( sF_Calculo ) ) + ',''V'' ), 0 ) AS IMP_PAGADO_HIST ' + coCRLF +
                            '                       ,NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) PAGOSANT ' + coCRLF + //HERJA ENERO 2013
                            '                  FROM CR_CAPITAL CCA ' + coCRLF +
//HERJA ENERO 2013
			    '	  	   ,( ' + coCRLF +
			    '	  	     SELECT CT.ID_CREDITO, CT.ID_PERIODO, ' + coCRLF +
			    '	                    NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_PGDMCP ' + coCRLF +
			    '	               FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT ' + coCRLF +
			    '	              WHERE 1=1 ' + coCRLF +
			    '	                AND CT.SIT_TRANSACCION = ''AC'' ' + coCRLF +
			    '	                AND CT.ID_TRANS_CANCELA IS NULL ' + coCRLF +
			    '	                AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION ' + coCRLF +
			    '	                AND CT.CVE_OPERACION IN (''PGDMCP'') ' + coCRLF +
			    '	  	        AND CDT.CVE_CONCEPTO IN (''IMPBRU'') ' + coCRLF +
			    '	              GROUP BY CT.ID_CREDITO, CT.ID_PERIODO ' + coCRLF +
			    '	   	    ) CA_HIST_PGDMCP ' + coCRLF +
//
                            '                 WHERE 1 = 1 ' + coCRLF +
                            '                   AND CCA.SIT_CAPITAL NOT IN (''CA'',''LQ'',''IM'') ' + coCRLF +
//HERJA ENERO 2013
            	  	    '        	        AND CA_HIST_PGDMCP.ID_CREDITO (+)= CCA.ID_CREDITO ' + coCRLF +
		            '                   AND CA_HIST_PGDMCP.ID_PERIODO (+)= CCA.NUM_PERIODO ' + coCRLF +
//                            
                            '               ) PRCA ' + coCRLF +
                            '        GROUP BY ID_CREDITO ' + coCRLF +
                            ') CAPITAL ' + coCRLF +
                            'GROUP BY ID_CREDITO ' + coCRLF +
                       ' UNION ' + coCRLF +
                            'SELECT ID_CREDITO, ' + coCRLF +
                            '       ''FINAN'' AS ACCESORIO, ' + coCRLF +
                            '       SUM(MORATORIOS) AS MORATORIOS, ' + coCRLF +
                            '       SUM(IVA_MORAS) AS IVA_MORAS, ' + coCRLF +
                            '       SUM(IMP_TOTAL_VDO) AS IMP_TOTAL_VDO, ' + coCRLF +
                            '       SUM(IMP_IVA_VDO) AS IMP_IVA_VDO, ' + coCRLF +
                            '       SUM(IMP_IVA_VIG) AS IMP_IVA_VIG, ' + coCRLF +
                            '       SUM(IMPORTE_VIG) AS IMPORTE_VIG, ' + coCRLF +
                            '       MAX(NUM_DIAS_VENCIDO) AS NUM_DIAS_VENCIDO ' + coCRLF +
                            '  FROM ( ' + coCRLF +
                            '        SELECT ID_CREDITO, ' + coCRLF +
                            '               SUM(MORATORIOS) MORATORIOS, ' + coCRLF +
                            '               SUM(IMP_IVA_MORAS)   IVA_MORAS, ' + coCRLF +
                            '               SUM(IMP_FINAN_ADIC  - IMP_PAGADO_HIST ) IMP_TOTAL_VDO, ' + coCRLF +
                            '               0 AS IMP_IVA_VDO, ' + coCRLF +
                            '               0 AS IMP_IVA_VIG, ' + coCRLF +
                            '               0 AS IMPORTE_VIG, ' + coCRLF +
                            '               MAX(NUM_DIAS_VENCIDO) AS NUM_DIAS_VENCIDO ' + coCRLF +
                            '          FROM (SELECT CCF.ID_CREDITO, CCF.IMP_FINAN_ADIC, ' + coCRLF +
                            '                       NVL( (CCF.IMP_MORATORIO - CCF.IMP_PAGADO_MORA - CCF.IMP_COND_MORA), 0) AS MORATORIOS, ' + coCRLF +
                            '                       NVL( (CCF.IMP_IVA_MORA - CCF.IMP_PAG_IVA_MORA - CCF.IMP_IVA_COND_MOR) ,0) AS IMP_IVA_MORAS, ' + coCRLF +
                            '                       NVL(  PKGCRCOMUN.STPOBTIMPPAGADO( ''FN'', ''IMPBRU'',CCF.ID_CREDITO, CCF.NUM_PERIODO,NULL,' + SQLFecha( StrToDate( sF_Calculo ) ) + ',''V'' ), 0 ) AS IMP_PAGADO_HIST, ' + coCRLF +
                            '                       CCF.NUM_DIAS_VENCIDO ' + coCRLF +
                            '                  FROM ( ' + coCRLF +
                            '                        SELECT CCF.* FROM CR_FINAN_ADIC CCF ' + coCRLF +
                            '                         WHERE 1 = 1 ' + coCRLF +
                            '                           AND CCF.F_VENCIMIENTO < '+ SQLFecha( StrToDate(sF_Vencimiento)) + coCRLF +
                            '                           AND ((CCF.F_PROG_PAGO < CCF.F_PAGO ' + coCRLF +
                            '                           AND CCF.SIT_FINAN_ADIC NOT IN (''CA'',''LQ'') ' + coCRLF +
                            '                           AND CCF.F_PAGO > ' + SQLFecha( StrToDate( sF_Vencimiento ) ) + ')' + coCRLF +
                            '                            OR (CCF.SIT_FINAN_ADIC = ''IM'' )) ' + coCRLF +
                            '                        ) CCF ' + coCRLF +
                            '                ) VEFA ' + coCRLF +
                            '       GROUP BY ID_CREDITO ' + coCRLF +
                            '    UNION ALL' + coCRLF +
                            '        SELECT ID_CREDITO, ' + coCRLF +
                            '               0 AS MORATORIOS, ' + coCRLF +
                            '               0 AS IMP_IVA_MORAS, ' + coCRLF +
                            '               0 AS IMP_TOTAL_VDO, ' + coCRLF +
                            '               0 AS IMP_IVA_VDO, ' + coCRLF +
                            '               0 AS IMP_IVA_VIG, ' + coCRLF +
                            '               SUM(IMP_FINAN_ADIC - IMP_PAGADO_HIST ) IMPORTE_VIG, ' + coCRLF +
                            '               0 AS NUM_DIAS_VENCIDO ' + coCRLF +
                            '          FROM ( ' + coCRLF +
                            '                SELECT CCF.ID_CREDITO, CCF.IMP_FINAN_ADIC, ' + coCRLF +
                            '                0 AS MORATORIOS, ' + coCRLF +
                            '                NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''FN'', ''IMPBRU'', CCF.ID_CREDITO, CCF.NUM_PERIODO,NULL,' + SQLFecha( StrToDate( sF_Calculo ) ) + ',''V'' ), 0 ) AS IMP_PAGADO_HIST ' + coCRLF +
                            '                FROM CR_FINAN_ADIC CCF ' + coCRLF +
                            '               WHERE 1 = 1 ' + coCRLF +
                            '                 AND CCF.SIT_FINAN_ADIC NOT IN (''CA'',''LQ'',''IM'') ' + coCRLF +
                            '             ) PRFA ' + coCRLF +
                            '    GROUP BY ID_CREDITO ' + coCRLF +
                            '    ) FINANADIC ' + coCRLF +
                            '    GROUP BY ID_CREDITO ' + coCRLF +
                       ' UNION ' + coCRLF +
                            'SELECT ID_CREDITO, ' + coCRLF +
                            '       ''INTERES'' AS ACCESORIO, ' + coCRLF +
                            '       SUM(MORATORIOS) AS MORATORIOS, ' + coCRLF +
                            '       SUM(IVA_MORAS) AS IVA_MORAS, ' + coCRLF +
                            '       SUM(IMP_TOTAL_VDO) AS IMP_TOTAL_VDO, ' + coCRLF +
                            '       SUM(IMP_IVA_VDO) AS IMP_IVA_VDO, ' + coCRLF +
                            '       SUM(IMP_IVA_VIG) AS IMP_IVA_VIG, ' + coCRLF +
                            '       SUM(IMPORTE_VIG) AS IMPORTE_VIG, ' + coCRLF +
                            '       MAX(NUM_DIAS_VENCIDO) AS NUM_DIAS_VENCIDO ' + coCRLF +
                            '  FROM ( ' + coCRLF +
                            '        SELECT ID_CREDITO, ' + coCRLF +
                            '               0 AS MORATORIOS, ' + coCRLF +
                            '               SUM(IMP_IVA_MORAS)   IVA_MORAS, ' + coCRLF +
                            '               SUM(IMP_INTERES  - IMP_PAGADO_HIST ) IMP_TOTAL_VDO, ' + coCRLF +
                            '               SUM(IMP_IVA) AS IMP_IVA_VDO, ' + coCRLF +
                            '               0 AS IMP_IVA_VIG, ' + coCRLF +
                            '               0 AS IMPORTE_VIG, ' + coCRLF +
                            '               MAX(NUM_DIAS_VENCIDO) AS NUM_DIAS_VENCIDO ' + coCRLF +
                            '           FROM (SELECT CCI.ID_CREDITO, CCI.IMP_INTERES, ' + coCRLF +
                            '                        0 AS MORATORIOS, ' + coCRLF +
                            '                        NVL( (CCI.IMP_IVA_MORA - CCI.IMP_PAG_IVA_MORA - CCI.IMP_IVA_COND_MOR) ,0) AS IMP_IVA_MORAS, ' + coCRLF +
                            '                        NVL( (CCI.IMP_IVA - CCI.IMP_IVA_PAGADO) ,0) AS IMP_IVA, ' + coCRLF +
                            '                        NVL(  PKGCRCOMUN.STPOBTIMPPAGADO( ''IN'', ''IMPBRU'',CCI.ID_CREDITO, CCI.NUM_PERIODO,NULL,' + SQLFecha( StrToDate( sF_Calculo ) ) + ',''V'' ), 0 ) AS IMP_PAGADO_HIST, ' + coCRLF +
                            '                        CCI.NUM_DIAS_VENCIDO ' + coCRLF +
                            '                   FROM ( ' + coCRLF +
                            '                         SELECT CCI.* FROM CR_INTERES CCI ' + coCRLF +
                            '                          WHERE 1 = 1 ' + coCRLF +
                            '                            AND CCI.F_VENCIMIENTO < '+ SQLFecha( StrToDate(sF_Vencimiento)) + coCRLF +
                            '                            AND ((CCI.F_PROG_PAGO < CCI.F_PAGO ' + coCRLF +
                            '                            AND CCI.SIT_INTERES NOT IN (''CA'',''LQ'') ' + coCRLF +
                            '                            AND CCI.F_PAGO > ' + SQLFecha( StrToDate( sF_Vencimiento ) ) + ')' + coCRLF +
                            '                             OR (CCI.SIT_INTERES = ''IM'' )) ' + coCRLF +
                            '                        ) CCI ' + coCRLF +
                            '                ) VEIN ' + coCRLF +
                            '    GROUP BY ID_CREDITO ' + coCRLF +
                            '    UNION ALL ' + coCRLF +
                            '      SELECT ID_CREDITO, ' + coCRLF +
                            '             0 AS MORATORIOS, ' + coCRLF +
                            '             0 AS IMP_IVA_MORAS, ' + coCRLF +
                            '             0 AS IMP_TOTAL_VDO, ' + coCRLF +
                            '             0 AS IMP_IVA_VDO, ' + coCRLF +
                            '             SUM(IMP_IVA) AS IMP_IVA_VIG, ' + coCRLF +
                            '             SUM(IMP_INTERES - IMP_PAGADO_HIST ) IMPORTE_VIG, ' + coCRLF +
                            '             0 AS NUM_DIAS_VENCIDO ' + coCRLF +
                            '      FROM  (SELECT CCI.ID_CREDITO, CCI.IMP_INTERES, ' + coCRLF +
                            '                    0 AS MORATORIOS, ' + coCRLF +
                            '                    NVL( (CCI.IMP_IVA - CCI.IMP_IVA_PAGADO) ,0) AS IMP_IVA, ' + coCRLF +
                            '                    NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''IN'', ''IMPBRU'', CCI.ID_CREDITO, CCI.NUM_PERIODO,NULL,' + SQLFecha( StrToDate( sF_Calculo ) ) + ',''V'' ), 0 ) AS IMP_PAGADO_HIST ' + coCRLF +
                            '               FROM CR_INTERES CCI ' + coCRLF +
                            '              WHERE 1 = 1 ' + coCRLF +
                            '                AND CCI.SIT_INTERES NOT IN (''CA'',''LQ'',''IM'') ' + coCRLF +
                            '            ) PRIN ' + coCRLF +
                            '    GROUP BY ID_CREDITO ' + coCRLF +
                            '    ) INTERES ' + coCRLF +
                            '  GROUP BY ID_CREDITO ' + coCRLF +
                       ' UNION ' + coCRLF +
                            'SELECT ID_CREDITO, ' + coCRLF +
                            '       ''CONCEPTOS'' AS ACCESORIO,--DESC_COMISION AS ACCESORIO, ' + coCRLF +
                            '       SUM(MORATORIOS) AS MORATORIOS, ' + coCRLF +
                            '       SUM(IVA_MORAS) AS IVA_MORAS, ' + coCRLF +
                            '       SUM(IMP_TOTAL_VDO) AS IMP_TOTAL_VDO, ' + coCRLF +
                            '       SUM(IMP_IVA_VDO) AS IMP_IVA_VDO, ' + coCRLF +
                            '       SUM(IMP_IVA_VIG) AS IMP_IVA_VIG, ' + coCRLF +
                            '       SUM(IMPORTE_VIG) AS IMPORTE_VIG, ' + coCRLF +
                            '       MAX(NUM_DIAS_VENCIDO) AS NUM_DIAS_VENCIDO ' + coCRLF +
                            '  FROM ( ' + coCRLF +
                            '        SELECT ID_CREDITO, ' + coCRLF +
                            '               SUM(MORATORIOS) MORATORIOS, ' + coCRLF +
                            '               SUM(IMP_IVA_MORAS)   IVA_MORAS, ' + coCRLF +
                            '               SUM(IMP_COMISION  - IMP_PAGADO_HIST ) IMP_TOTAL_VDO, ' + coCRLF +
                            '               SUM(IMP_IVA) AS IMP_IVA_VDO, ' + coCRLF +
                            '               0 AS IMP_IVA_VIG, ' + coCRLF +
                            '               0 AS IMPORTE_VIG, ' + coCRLF +
                            '               MAX(NUM_DIAS_VENCIDO) AS NUM_DIAS_VENCIDO ' + coCRLF +
                            '          FROM ( ' + coCRLF +
                            '                SELECT CCC.ID_CREDITO, CCC.IMP_COMISION, ' + coCRLF +
                            '                       NVL( (CCC.IMP_MORATORIO - CCC.IMP_PAGADO_MORA - CCC.IMP_COND_MORA), 0) AS MORATORIOS, ' + coCRLF +
                            '                       NVL( (CCC.IMP_IVA_MORA - CCC.IMP_PAG_IVA_MORA - CCC.IMP_IVA_COND_MOR) ,0) AS IMP_IVA_MORAS, ' + coCRLF +
                            '                       NVL( (CCC.IMP_IVA - CCC.IMP_IVA_PAGADO) ,0) AS IMP_IVA, ' + coCRLF +
                            '                       NVL(  PKGCRCOMUN.STPOBTIMPPAGADO( ''CN'', ''IMPBRU'',CCC.ID_CREDITO, CCC.NUM_PERIODO,NULL,' + SQLFecha( StrToDate( sF_Calculo ) ) + ',''V'' ), 0 ) AS IMP_PAGADO_HIST, ' + coCRLF +
                            '                       CCC.NUM_DIAS_VENCIDO ' + coCRLF +
                            '                  FROM ( ' + coCRLF +
                            '                        SELECT CCC.* FROM CR_COMISION CCC ' + coCRLF +
                            '                         WHERE 1 = 1 ' + coCRLF +
                            '                           AND CCC.F_VENCIMIENTO < '+ SQLFecha( StrToDate(sF_Vencimiento)) + coCRLF +
                            '                           AND ((CCC.F_PROG_PAGO < CCC.F_PAGO ' + coCRLF +
                            '                           AND CCC.SIT_COMISION NOT IN (''CA'',''LQ'') ' + coCRLF +
                            '                           AND CCC.F_PAGO > ' + SQLFecha( StrToDate( sF_Vencimiento ) ) + ')' + coCRLF +
                            '                            OR (CCC.SIT_COMISION = ''IM'' )) ' + coCRLF +
                            '                        ) CCC ' + coCRLF +
                            '                 ) VECC ' + coCRLF +
                            '    GROUP BY ID_CREDITO ' + coCRLF +
                            '    UNION ALL ' + coCRLF +
                            '      SELECT ID_CREDITO, ' + coCRLF +
                            '             0 AS MORATORIOS, ' + coCRLF +
                            '             0 AS IMP_IVA_MORAS, ' + coCRLF +
                            '             0 AS IMP_TOTAL_VDO, ' + coCRLF +
                            '             0 AS IMP_IVA_VDO, ' + coCRLF +
                            '             SUM(IMP_IVA) AS IMP_IVA_VIG, ' + coCRLF +
                            '             SUM(IMP_COMISION - IMP_PAGADO_HIST ) IMPORTE_VIG, ' + coCRLF +
                            '             0 AS NUM_DIAS_VENCIDO ' + coCRLF +
                            '        FROM ( ' + coCRLF +
                            '              SELECT CCC.ID_CREDITO, CCC.IMP_COMISION, ' + coCRLF +
                            '                     0 AS MORATORIOS, ' + coCRLF +
                            '                     NVL( (CCC.IMP_IVA - CCC.IMP_IVA_PAGADO) ,0) AS IMP_IVA, ' + coCRLF +
                            '                     NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''CN'', ''IMPBRU'', CCC.ID_CREDITO, CCC.NUM_PERIODO,NULL,' + SQLFecha( StrToDate( sF_Calculo ) ) + ',''V'' ), 0 ) AS IMP_PAGADO_HIST ' + coCRLF +
                            '                FROM CR_COMISION CCC ' + coCRLF +
                            '               WHERE 1 = 1 ' + coCRLF +
                            '                 AND CCC.SIT_COMISION NOT IN (''CA'',''LQ'',''IM'') ' + coCRLF +
                            '             ) PRCC ' + coCRLF +
                            '    GROUP BY ID_CREDITO ' + coCRLF +
                            '   ) COMIS ' + coCRLF +
                            '    GROUP BY ID_CREDITO ' + coCRLF +
                         ' ) GENERAL,';

                   sSQL := sSQL +

                    '     CR_CREDITO CC,'+  coCRLF;

                  If (Trim(sProducto)<>'')OR(Trim(sGpoProd)<>'') Then
                  begin
                     If (Trim(sProducto)<>'') Then
                     begin
                        sSQL:= sSQL +
                        ' (SELECT ID_CONTRATO, FOL_CONTRATO, ID_PROM_ADMON, CVE_PRODUCTO_CRE FROM CR_CONTRATO '+  coCRLF +
                        ' WHERE CVE_PRODUCTO_CRE IN ('''+sProducto+''')'+  coCRLF +
                        ' ) CCTO, '+  coCRLF;
                     end;
                     If (Trim(sGpoProd)<>'') Then
                     begin
                        sSQL:= sSQL +
                        ' (SELECT ID_CONTRATO, FOL_CONTRATO, ID_PROM_ADMON, CVE_PRODUCTO_CRE FROM CR_CONTRATO '+  coCRLF +
                        ' WHERE CVE_PRODUCTO_CRE IN ( SELECT CVE_PRODUCTO_CRE FROM CR_PRODUCTO WHERE CVE_PRODUCTO_GPO ='+ SQLStr( sGpoProd )+ ')'+ coCRLF +
                        ' ) CCTO, '+  coCRLF;
                     end;
                  end
                  else
                     sSQL  := sSQL + ' CR_CONTRATO CCTO, '+  coCRLF;

                sSQL := sSQL +
                    ' CONTRATO CTO, MONEDA M, PERSONA PPR, PERSONA PPRC, PERSONA PCE, DOMICILIO D ' + coCRLF +
                    ' WHERE 1 = 1 ' + coCRLF +
                    ' AND CC.ID_CONTRATO      = CCTO.ID_CONTRATO ' + coCRLF +
                    ' AND CC.FOL_CONTRATO     = CCTO.FOL_CONTRATO ' + coCRLF +
                    ' AND CC.SIT_CREDITO      NOT IN (''LQ'',''CA'') ' + coCRLF +
                    ' AND CTO.ID_CONTRATO     = CCTO.ID_CONTRATO ' + coCRLF +
                    ' AND CTO.ID_EMPRESA      = 2 ' + coCRLF +
                    ' AND CC.ID_CONTRATO      = CTO.ID_CONTRATO ' + coCRLF +
                    ' AND GENERAL.ID_CREDITO  = CC.ID_CREDITO ' + coCRLF +
                    ' AND M.CVE_MONEDA        = CTO.CVE_MONEDA ' + coCRLF +
                    ' AND PPR.ID_PERSONA      = CC.ID_PROM_ADM ' + coCRLF +
                    ' AND PPRC.ID_PERSONA     = CTO.ID_PERS_ASOCIAD ' + coCRLF +
                    ' AND PCE.ID_PERSONA   (+)= CTO.ID_TITULAR ' + coCRLF +
                    ' AND CC.SIT_CREDITO   NOT IN (''NA'')' + coCRLF +
                    ' AND D.ID_DOMICILIO      = PCE.ID_DOM_FISCAL ' + coCRLF;

            If (Trim(sPromAdmon)<>'') Then
               sSQL:= sSQL + ' AND CC.ID_PROM_ADM = '+ sPromAdmon +  coCRLF;
            If (Trim(sCesion)<>'') Then
               sSQL:= sSQL + ' AND CC.ID_CREDITO = '+ sCesion  +  coCRLF;
            If (Trim(sMoneda)<>'') Then
               sSQL:= sSQL + ' AND CTO.CVE_MONEDA = '+ sMoneda +  coCRLF;
            If (Trim(sAcreditado)<>'') Then
               sSQL:= sSQL + ' AND CTO.ID_TITULAR = '+  sAcreditado +  coCRLF;
            If (Trim(sPromAsoc)<>'') Then
               sSQL:= sSQL + ' AND CTO.ID_PERS_ASOCIAD = '+ sPromAsoc  +  coCRLF;
            If (Trim(sIdContrato)<>'') Then
               sSQL:= sSQL + ' AND CC.ID_CONTRATO = '+ sIdContrato  +  coCRLF;


   sSQL:= sSQL + ' ORDER BY DESC_MONEDA, CTO.ID_PERS_ASOCIAD, PPR.ID_PERSONA, CCTO.CVE_PRODUCTO_CRE, PCE.NOMBRE, CC.ID_CREDITO, GENERAL.ACCESORIO';

   Result:= sSQL;




end;



procedure TQRProVegl.QRBand1BeforePrint(Sender: TQRCustomBand;
 var PrintBand: Boolean);
begin

    tc := ObtTipoCambio( StrToDate(vlFecha),qyProgVen.FieldByName('CVE_MONEDA').AsString,APli.DataBaseName,APli.SessionName);
//       QRLTipoCambio.caption := FormatFloat('###,##0.0000',tc);

    vlTipoCambio := FloattoStr(tc);

    
    With qyProgVen do begin
        Vsumpesos_Imp_Vig  := Vsumpesos_Imp_Vig + FieldByName('IMPORTE_VIG').AsFloat*tc;
        Vsumpesos_Iva_Vig  := Vsumpesos_Iva_Vig + FieldByName('IMP_IVA_VIG').AsFloat*tc;
        Vsumpesos_Tot_Vig  := Vsumpesos_Tot_Vig + (FieldByName('IMPORTE_VIG').AsFloat +
                                                  FieldByName('IMP_IVA_VIG').AsFloat)*tc;
        Vsumpesos_Imp_Venc := Vsumpesos_Imp_Venc+ FieldByName('IMP_TOTAL_VDO').AsFloat*tc;
        Vsumpesos_Iva_Venc := Vsumpesos_Iva_Venc+ FieldByName('IMP_IVA_VDO').AsFloat*tc;
        Vsumpesos_Moras    := Vsumpesos_Moras   + FieldByName('MORATORIOS').AsFloat*tc;
        Vsumpesos_Iva_Mor  := Vsumpesos_Iva_Mor + FieldByName('IVA_MORAS').AsFloat*tc;
        Vsumpesos_Tot_Venc := Vsumpesos_Tot_Venc+ (FieldByName('IMP_TOTAL_VDO').AsFloat+
                                                  FieldByName('IMP_IVA_VDO').AsFloat+
                                                  FieldByName('MORATORIOS').AsFloat+
                                                  FieldByName('IVA_MORAS').AsFloat)*tc;
        Vsumpesos_Total    := Vsumpesos_Tot_Vig + Vsumpesos_Tot_Venc;
      end;


   If (sArchivo <>'') AND (B_1ARCH=FALSE) Then
   Begin
      if vltmpcred <>  StrToInt(qyProgVen.FieldByName('ID_CREDITO').AsString) then
      begin
          vltmpcred :=  StrToInt(qyProgVen.FieldByName('ID_CREDITO').AsString);

          vlimp_vig_cap     := '0.00';
          vlimp_iva_vig_cap := '0.00';
          vlimp_vdo_cap     := '0.00';
          vlimp_iva_vdo_cap := '0.00';
          vlmoras_cap       := '0.00';
          vliva_moras_cap   := '0.00';
          vlimp_vig_fin     := '0.00';
          vlimp_iva_vig_fin := '0.00';
          vlimp_vdo_finan   := '0.00';
          vlimp_iva_vdo_fin := '0.00';
          vlmoras_finan     := '0.00';
          vliva_moras_fin   := '0.00';
          vlimp_vig_int     := '0.00';
          vlimp_iva_vig_int := '0.00';
          vlimp_vdo_int     := '0.00';
          vlimp_iva_vdo_int := '0.00';
          vlmoras_int       := '0.00';
          vliva_moras_int   := '0.00';
          vlimp_vig_conc    := '0.00';
          vlimp_iva_vig_con := '0.00';
          vlimp_vdo_conc    := '0.00';
          vlimp_iva_vdo_con := '0.00';
          vlmoras_conc      := '0.00';
          vliva_moras_con   := '0.00';
          vlSdoTotalVig     := '0.00';
          vlSdoTotalVdo     := '0.00';
          vlSaldoTotal      := '0.00';

      end;

         if qyProgVen.FieldByName('ACCESORIO').AsString='CAPITAL' then
         begin
            vlimp_vig_cap     := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMPORTE_VIG').AsFloat);
            vlimp_iva_vig_cap := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_IVA_VIG').AsFloat);
            vlimp_vdo_cap     := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_TOTAL_VDO').AsFloat);
            vlimp_iva_vdo_cap := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_IVA_VDO').AsFloat);
            vlmoras_cap       := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('MORATORIOS').AsFloat);
            vliva_moras_cap   := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IVA_MORAS').AsFloat);

         end;

         if qyProgVen.FieldByName('ACCESORIO').AsString='FINAN' then
         begin
            vlimp_vig_fin     := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMPORTE_VIG').AsFloat);
            vlimp_iva_vig_fin := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_IVA_VIG').AsFloat);
            vlimp_vdo_finan   := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_TOTAL_VDO').AsFloat);
            vlimp_iva_vdo_fin := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_IVA_VDO').AsFloat);
            vlmoras_finan     := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('MORATORIOS').AsFloat);
            vliva_moras_fin   := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IVA_MORAS').AsFloat);
         end;

         if qyProgVen.FieldByName('ACCESORIO').AsString='INTERES' then
         begin
            vlimp_vig_int     := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMPORTE_VIG').AsFloat);
            vlimp_iva_vig_int := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_IVA_VIG').AsFloat);
            vlimp_vdo_int     := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_TOTAL_VDO').AsFloat);
            vlimp_iva_vdo_int := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_IVA_VDO').AsFloat);
            vlmoras_int       := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('MORATORIOS').AsFloat);
            vliva_moras_int   := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IVA_MORAS').AsFloat);
         end;

         if qyProgVen.FieldByName('ACCESORIO').AsString='CONCEPTOS' then
         begin
            vlimp_vig_conc    := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMPORTE_VIG').AsFloat);
            vlimp_iva_vig_con := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_IVA_VIG').AsFloat);
            vlimp_vdo_conc    := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_TOTAL_VDO').AsFloat);
            vlimp_iva_vdo_con := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_IVA_VDO').AsFloat);
            vlmoras_conc      := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('MORATORIOS').AsFloat);
            vliva_moras_con   := FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IVA_MORAS').AsFloat);
         end;

      IF vlinclin=vlmaxlin THEN B_1ARCH:=TRUE;
   end;
end;

procedure TQRProVegl.QRGroupMonedaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 tc := ObtTipoCambio( StrToDate(vlFecha),qyProgVen.FieldByName('CVE_MONEDA').AsString,APli.DataBaseName,APli.SessionName);
       //ObtTipoCambio( StrToDate(vlFecha),qyProgVen.FieldByName('CVE_MONEDA').AsString,APli.DataBaseName,APli.SessionName);
       QRLabel28.caption:=FormatFloat('###,##0.0000',tc);
end;


procedure TQRProVegl.QRFooterCesionBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
        VL_C_Imp_Vig  := 0;
        VL_C_Iva_Vig  := 0;
        VL_C_Tot_Vig  := 0;
        VL_C_Imp_Venc := 0;
        VL_C_Iva_Venc := 0;
        VL_C_Moras    := 0;
        VL_C_Iva_Mor  := 0;
        VL_C_Tot_Venc := 0;
        VL_C_Total    := 0;


        If (sArchivo <>'') AND (B_1ARCH=FALSE) Then
        Begin
           vltmpcred:=0;

           vlSdoTotalVig := floattostr(
                            strtofloat(QuitaComas(vlimp_vig_cap)) + strtofloat(QuitaComas(vlimp_iva_vig_cap))  + strtofloat(QuitaComas(vlimp_vig_fin))   + strtofloat(QuitaComas(vlimp_iva_vig_fin)) + strtofloat(QuitaComas(vlimp_vig_int)) + strtofloat(QuitaComas(vlimp_iva_vig_int)) +
                            strtofloat(QuitaComas(vlimp_vig_conc)) + strtofloat(QuitaComas(vlimp_iva_vig_con))
                            );


           vlSdoTotalVdo := floattostr(
                            strtofloat(QuitaComas(vlimp_vdo_cap)) + strtofloat(QuitaComas(vlimp_iva_vdo_cap))  + strtofloat(QuitaComas(vlmoras_cap))   + strtofloat(QuitaComas(vliva_moras_cap)) + strtofloat(QuitaComas(vlimp_vdo_finan)) + strtofloat(QuitaComas(vlimp_iva_vdo_fin)) +
                            strtofloat(QuitaComas(vlmoras_finan)) + strtofloat(QuitaComas(vliva_moras_fin))    + strtofloat(QuitaComas(vlimp_vdo_int)) + strtofloat(QuitaComas(vlimp_iva_vdo_int)) + strtofloat(QuitaComas(vlmoras_int)) + strtofloat(QuitaComas(vliva_moras_int)) +
                            strtofloat(QuitaComas(vlimp_vdo_conc)) + strtofloat(QuitaComas(vlimp_iva_vdo_con)) + strtofloat(QuitaComas(vlmoras_conc))  + strtofloat(QuitaComas(vliva_moras_con))
                            );

           vlSaldoTotal  := floattostr(
                            strtofloat(QuitaComas(vlimp_vig_cap)) + strtofloat(QuitaComas(vlimp_iva_vig_cap)) + strtofloat(QuitaComas(vlimp_vdo_cap)) + strtofloat(QuitaComas(vlimp_iva_vdo_cap)) + strtofloat(QuitaComas(vlmoras_cap)) + strtofloat(QuitaComas(vliva_moras_cap)) +
                            strtofloat(QuitaComas(vlimp_vig_fin)) + strtofloat(QuitaComas(vlimp_iva_vig_fin)) + strtofloat(QuitaComas(vlimp_vdo_finan)) + strtofloat(QuitaComas(vlimp_iva_vdo_fin)) + strtofloat(QuitaComas(vlmoras_finan)) + strtofloat(QuitaComas(vliva_moras_fin)) +
                            strtofloat(QuitaComas(vlimp_vig_int)) + strtofloat(QuitaComas(vlimp_iva_vig_int)) + strtofloat(QuitaComas(vlimp_vdo_int)) + strtofloat(QuitaComas(vlimp_iva_vdo_int)) + strtofloat(QuitaComas(vlmoras_int)) + strtofloat(QuitaComas(vliva_moras_int)) +
                            strtofloat(QuitaComas(vlimp_vig_conc)) + strtofloat(QuitaComas(vlimp_iva_vig_con)) + strtofloat(QuitaComas(vlimp_vdo_conc)) + strtofloat(QuitaComas(vlimp_iva_vdo_con)) + strtofloat(QuitaComas(vlmoras_conc)) + strtofloat(QuitaComas(vliva_moras_con))
                            );


         Writeln(F,
              qyProgVen.FieldByName('CVE_MONEDA').AsString + #09 +
              qyProgVen.FieldByName('DESC_MONEDA').AsString + #09 +
              vlTipoCambio + #09 +
              qyProgVen.FieldByName('ID_PERS_ASOCIAD').AsString + #09 +
              qyProgVen.FieldByName('NOM_PROMOTOR_ASO').AsString + #09 +
              qyProgVen.FieldByName('ID_PROM_ADM').AsString + #09 +
              qyProgVen.FieldByName('NOM_PROMOTOR_ADM').AsString + #09 +
              qyProgVen.FieldByName('CVE_PRODUCTO_CRE').AsString + #09 +
              qyProgVen.FieldByName('DESC_L_PRODUCTO').AsString + #09 +
              qyProgVen.FieldByName('ID_TITULAR').AsString + #09 +
              qyProgVen.FieldByName('NOMBRE').AsString + #09 +
              qyProgVen.FieldByName('PROVEEDOR').AsString + #09 +
              qyProgVen.FieldByName('NOM_PROVEEDOR').AsString + #09 +
              qyProgVen.FieldByName('B_OPERADO_NAFIN').AsString + #09 +
              qyProgVen.FieldByName('ID_CONTRATO').AsString + #09 +
              qyProgVen.FieldByName('ID_CREDITO').AsString + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_CREDITO').AsFloat) + #09 +
              qyProgVen.FieldByName('CVE_TASA_REFER').AsString + #09 +
              FormatFloat('0.0000',qyProgVen.FieldByName('TASA_CREDITO').AsFloat) + #09 +
              qyProgVen.FieldByName('F_INICIO').AsString + #09 +
              qyProgVen.FieldByName('F_VENCIMIENTO').AsString + #09 +
              qyProgVen.FieldByName('F_AUTORIZA').AsString + #09 +
              qyProgVen.FieldByName('CUENTA_BANCO').AsString + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('SALDO_AL').AsFloat) + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('SDO_COMP').AsFloat)+ #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('SDO_COMP_BLOQ').AsFloat)+ #09 +
              qyProgVen.FieldByName('TIPO_DISPOSICION').AsString + #09 +
              qyProgVen.FieldByName('B_APLICA_IVA').AsString + #09 +
              qyProgVen.FieldByName('B_FINANC_ADIC').AsString + #09 +
              qyProgVen.FieldByName('NUM_DIAS_VENCIDO').AsString + #09 +
              vlimp_vig_cap     + #09 +
              vlimp_iva_vig_cap + #09 +
              vlimp_vig_fin     + #09 +
              vlimp_iva_vig_fin + #09 +
              vlimp_vig_int     + #09 +
              vlimp_iva_vig_int + #09 +
              vlimp_vig_conc    + #09 +
              vlimp_iva_vig_con + #09 +
              vlSdoTotalVig     + #09 +
              //FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('SDO_VIG_TOTAL').AsFloat)+ #09 +
              vlimp_vdo_cap     + #09 +
              vlimp_iva_vdo_cap + #09 +
              vlmoras_cap       + #09 +
              vliva_moras_cap   + #09 +
              vlimp_vdo_finan   + #09 +
              vlimp_iva_vdo_fin + #09 +
              vlmoras_finan     + #09 +
              vliva_moras_fin   + #09 +
              vlimp_vdo_int     + #09 +
              vlimp_iva_vdo_int + #09 +
              vlmoras_int       + #09 +
              vliva_moras_int   + #09 +
              vlimp_vdo_conc    + #09 +
              vlimp_iva_vdo_con + #09 +
              vlmoras_conc      + #09 +
              vliva_moras_con   + #09 +
              vlSdoTotalVdo     + #09 +
              vlSaldoTotal
              );

        end;

        vlproveedor := qyProgVen.FieldByName('PROVEEDOR').AsString;
        vltotcred := vltotcred + 1;
//        QRLabel21.Caption := IntToStr(vltotcred);

end;

procedure TQRProVegl.QRFooterClienteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

        VL_CL_Imp_Vig  := 0;
        VL_CL_Iva_Vig  := 0;
        VL_CL_Tot_Vig  := 0;
        VL_CL_Imp_Venc := 0;
        VL_CL_Iva_Venc := 0;
        VL_CL_Moras    := 0;
        VL_CL_Iva_Mor  := 0;
        VL_CL_Tot_Venc := 0;
        VL_CL_Total    := 0;

end;

procedure TQRProVegl.QRFooterPromotorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
        VL_PAD_Imp_Vig  := 0;
        VL_PAD_Iva_Vig  := 0;
        VL_PAD_Tot_Vig  := 0;
        VL_PAD_Imp_Venc := 0;
        VL_PAD_Iva_Venc := 0;
        VL_PAD_Moras    := 0;
        VL_PAD_Iva_Mor  := 0;
        VL_PAD_Tot_Venc := 0;
        VL_PAD_Total    := 0;
end;


procedure TQRProVegl.QRBPromAsocBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
        VL_PAS_Imp_Vig  := 0;
        VL_PAS_Iva_Vig  := 0;
        VL_PAS_Tot_Vig  := 0;
        VL_PAS_Imp_Venc := 0;
        VL_PAS_Iva_Venc := 0;
        VL_PAS_Moras    := 0;
        VL_PAS_Iva_Mor  := 0;
        VL_PAS_Tot_Venc := 0;
        VL_PAS_Total    := 0;

end;


procedure TQRProVegl.FooterMonedaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

//        VL_MON_Imp_Vig  := 0;
//        VL_MON_Iva_Vig  := 0;
//        VL_MON_Tot_Vig  := 0;
//        VL_MON_Imp_Venc := 0;
//        VL_MON_Iva_Venc := 0;
//        VL_MON_Moras    := 0;
//        VL_MON_Iva_Mor  := 0;
//        VL_MON_Tot_Venc := 0;
//        VL_MON_Total    := 0;
end;


procedure TQRProVegl.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
        QRLTot_ImpVig.caption := FormatFloat('###,###,###,###,###,##0.00',Vsumpesos_Imp_Vig);
        QRLTot_IvaVig.caption := FormatFloat('###,###,###,###,###,##0.00',Vsumpesos_Iva_Vig);
        QRLTot_TotVig.caption := FormatFloat('###,###,###,###,###,##0.00',Vsumpesos_Tot_Vig);
        QRLTot_ImpVen.caption := FormatFloat('###,###,###,###,###,##0.00',Vsumpesos_Imp_Venc);
        QRLTot_IvaVen.caption := FormatFloat('###,###,###,###,###,##0.00',Vsumpesos_Iva_Venc);
        QRLTot_Moras.caption  := FormatFloat('###,###,###,###,###,##0.00',Vsumpesos_Moras);
        QRLTot_IvaMor.caption := FormatFloat('###,###,###,###,###,##0.00',Vsumpesos_Iva_Mor);
        QRLTot_TotVen.caption := FormatFloat('###,###,###,###,###,##0.00',Vsumpesos_Tot_Venc);
        QRLTot_VigVen.caption := FormatFloat('###,###,###,###,###,##0.00',Vsumpesos_Total);
        QRLabel21.Caption     := IntToStr(vltotcred);

      If Trim(sArchivo)<> '' Then
      Begin
         sArchivo:='';
         CloseFile(F);
         B_1ARCH:=true;
      End;  

end;

procedure TQRProVegl.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
      vltotcred          := 0;
      Vsumpesos_Imp_Vig  := 0;
      Vsumpesos_Iva_Vig  := 0;
      Vsumpesos_Tot_Vig  := 0;
      Vsumpesos_Imp_Venc := 0;
      Vsumpesos_Iva_Venc := 0;
      Vsumpesos_Moras    := 0;
      Vsumpesos_Iva_Mor  := 0;
      Vsumpesos_Tot_Venc := 0;
      Vsumpesos_Total    := 0;

end;

procedure TQRProVegl.QRGroupProveedorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 if (vlproveedor = '') OR (vlproveedor = '0')
  then
     QRGroupProveedor.visible := False;
end;

end.
