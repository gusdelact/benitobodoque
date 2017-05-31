
{
*************************************************************
*********************REGISTRO DE CAMBIOS*********************

HERJA 26.08.2010  .
Juan Aaron Hernandez Rodriguez
1. Se modifica Reporte para la funcionalidad Mostrar Impagados sin tomar en cuenta Amortizaciones de Capital
2. Se agrega la opcion de Grupo Producto
3. Se agrega codigo para que que en caso de que el usuario seleccione una fecha a futuro y existan periodos Intermedios
   de cualquier concentp AC o PA, no se muestre la información ya que los calculos a futuro requieren validaciones
   que se necesitan revisar con el usuario
4. Se anexa procedimiento para calcular Tasa de Interes al día para el cualculo de Financiamientos Adicionales
5. Se agrega procedimiento para que calcule el interes via StoreProcedure y este unificado con el Reporte de Pronostico de Adeudo
6. Se corrige el Query para mostrar IVA en Intereses

*************************************************************
}

unit IntQProVeMa;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead,IntQRPreview,InterApl,
  Db, DBTables,IntGenCre,unSQL2;   

type
  TQRProVema = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRShape26: TQRShape;
    QRShape22: TQRShape;
    QRShape21: TQRShape;
    QRShape1: TQRShape;                         
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;                            
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel18: TQRLabel;
    QRShape6: TQRShape;
    QRLabel20: TQRLabel;
    QRShape7: TQRShape;
    QRLabel22: TQRLabel;
    QRShape8: TQRShape;
    QRLabel24: TQRLabel;
    QRShape9: TQRShape;
    QRLabel6: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape19: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel43: TQRLabel;
    qyProgVen: TQuery;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRDB_IMP_IVA: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText27: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText3: TQRDBText;
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
    QRLImporte: TQRLabel;
    qyProgVenID_CREDITO: TFloatField;
    qyProgVenACCESORIO: TStringField;
    qyProgVenNUM_PERIODO: TFloatField;
    qyProgVenF_INICIO: TDateTimeField;
    qyProgVenF_VENCIMIENTO: TDateTimeField;
    qyProgVenF_PROG_PAGO: TDateTimeField;
    qyProgVenF_PAGO: TDateTimeField;
    qyProgVenNUM_PERIODO_PER: TFloatField;
    qyProgVenPLAZO: TFloatField;
    qyProgVenTASA_APLICADA: TFloatField;
    qyProgVenIMPORTE: TFloatField;
    qyProgVenIMP_IVA: TFloatField;
    qyProgVenSIT_PERIODO: TStringField;
    qyProgVenIMP_BINTER: TFloatField;
    qyProgVenIMP_FEGA: TFloatField;
    qyProgVenIMP_TOTAL: TFloatField;
    qyProgVenMORATORIOS: TFloatField;
    qyProgVenID_PROM_ADM: TFloatField;
    qyProgVenNOM_PROMOTOR_ADM: TStringField;
    qyProgVenCVE_MONEDA: TFloatField;
    qyProgVenDESC_MONEDA: TStringField;
    qyProgVenCVE_PRODUCTO_CRE: TStringField;
    qyProgVenDESC_L_PRODUCTO: TStringField;
    qyProgVenID_TITULAR: TFloatField;
    qyProgVenNOMBRE: TStringField;
    QRLFegaBinter: TQRLabel;
    QRLTotal: TQRLabel;
    QRFooterCesion: TQRBand;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRLabel11: TQRLabel;
    QRExpr16: TQRExpr;
    QRFooterCliente: TQRBand;
    QRLabel27: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr17: TQRExpr;
    QRFooterPromotor: TQRBand;
    QRExpr49: TQRExpr;
    QRExpr50: TQRExpr;
    QRLabel16: TQRLabel;
    QRExpr21: TQRExpr;
    QRShape16: TQRShape;
    QRLabel4: TQRLabel;
    dbMoneda: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel25: TQRLabel;
    qyProgVenTIPO_CARTERA: TStringField;
    QRBFTIPO_CARTERA: TQRBand;
    QRShape18: TQRShape;
    QRLabel26: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel29: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel34: TQRLabel;
    QRShape20: TQRShape;
    QRShape23: TQRShape;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel36: TQRLabel;
    qyProgVenID_PERS_ASOCIAD: TFloatField;
    qyProgVenNOM_PROMOTOR_ASO: TStringField;
    QRLabel37: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText28: TQRDBText;
    qyProgVenID_CONTRATO: TFloatField;
    qyProgVenSDO_INSOLUTO: TFloatField;
    qyProgVenSDO_VIG_TOTAL: TFloatField;
    qyProgVenIMP_CREDITO: TFloatField;
    QRGroupMoneda : TQRGroup;
    QRGroup2 : TQRGroup;
    QRGroupPromotor1 : TQRGroup;
    QRGroupProducto : TQRGroup;
    QRGroup1 : TQRGroup;
    QRGroupCesion : TQRGroup;
    QRGTIPO_CARTERA : TQRGroup;
    QRBPromAsoc: TQRBand;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRLabel39: TQRLabel;
    QRExpr8: TQRExpr;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel44: TQRLabel;
    QRDBText13: TQRDBText;
    qyProgVenCUENTA_BANCO: TStringField;
    qyProgVenSALDO_AL: TFloatField;
    QRLabel45: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText16: TQRDBText;
    qyProgVenDIRECCION: TStringField;
    qyProgVenCOLONIA: TStringField;
    qyProgVenCIUDAD: TStringField;
    qyProgVenESTADO: TStringField;
    qyProgVenPAIS: TStringField;
    qyProgVenCP: TStringField;
    qyProgVenTEL_CASA: TStringField;
    qyProgVenFAX: TStringField;
    qyProgVenTEL_OFNA: TStringField;
    qyProgVenE_MAIL: TStringField;
    QRLabel47: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel49: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText30: TQRDBText;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel52: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel53: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel54: TQRLabel;
    QRDBText34: TQRDBText;

    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRFooterCesionBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterClienteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterPromotorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBFTIPO_CARTERABeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBPromAsocBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
     VLF_Vencimiento : String;
     Apli : TInterApli;

     VLImporte : Double;
     VLImporteBinter : Double;
     VLImporteFEGA : Double;

     VLImporteCte : Double;
     VLImporteBinterCte : Double;
     VLImporteFEGACte : Double;

     VLImporteProm : Double;
     VLImporteBinterProm : Double;
     VLImporteFEGAProm : Double;

     VLImportePromAs : Double;
     VLImporteBinterPromAs : Double;
     VLImporteFEGAPromAs : Double;

     VLImporteTS : Double;
     VLImporteBinterTS : Double;
     VLImporteFEGATS : Double;

     Procedure Intereses(vlidcredito, vlperiodo:integer; vlfcalculo:string);

     Function CalculoTasa(vlidcredito, vlperiodo:integer):single;

     Function FormaQuery(  sF_Vencimiento,sProducto,sMoneda,
                           sAcreditado,  sPromAsoc,sPromAdmon,
                           sCesion,sGpoProd : String;
                           bVENC : Boolean) : String; //HERJA 25.08.2010
  end;

var
  QRProVema: TQRProVema;
  sArchivo:String;
  F: TextFile;
  //HERJA
  B_1ARCH:BOOLEAN;
  vlmaxlin, vlinclin:word;
  VGInteresProy, VGInteresIvaProy, VGTasaProy : single;
  vlF_Vencimiento:string;

Procedure RepProgVenMa(sF_Vencimiento,
                       sProducto,sMoneda,
                       sAcreditado, sPromAsoc,sPromAdmon,
                       sCesion,sGpoProd,sNbrArch:String;
                       pAPli     : TInterApli;
                       pPreview  : Boolean;
                       bVENC     : Boolean //HERJA 25.08.2010
                       );


Implementation

{$R *.DFM}

//HERJA 26.08.2010
Procedure TQRProVema.Intereses(vlidcredito, vlperiodo:integer; vlfcalculo:string);
var stpDigVer : TStoredProc;
begin
   VGInteresProy := 0;
   VGInteresIvaProy := 0;
   VGTasaProy := 0;

   //INTERES PROYECTADO
   stpDigVer := TStoredProc.Create(Nil);
   If Assigned(stpDigVer) Then
   begin
      With stpDigVer Do
      Try
         DatabaseName := Apli.DataBaseName;
         SessionName  := Apli.SessionName;
         StoredProcName := 'PKGCRCOMUN.STPINTERES';
         Params.CreateParam(ftFloat,'PEIDCREDITO',ptInput);
         Params.CreateParam(ftFloat,'PENUMPERIODO',ptInput);
         Params.CreateParam(ftDate,'PEFREFERENCIA',ptInput);
         Params.CreateParam(ftDate,'PEFCALCULO',ptInput);
         Params.CreateParam(ftString,'PEBFINDIA',ptInput);
         Params.CreateParam(ftString,'PEBSOLOFONDEO',ptInput);
         Params.CreateParam(ftFloat,'PSTASA',ptOutput);
         Params.CreateParam(ftFloat,'PSINTDIA',ptOutput);
         Params.CreateParam(ftFloat,'PSINTERES',ptOutput);
         Params.CreateParam(ftFloat,'PSINTPROY',ptOutput);
         Params.CreateParam(ftFloat,'PSIMPIVA',ptOutput);
         Params.CreateParam(ftFloat,'PSIVAPROY',ptOutput);
         Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
         Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
         Prepare;
         ParamByName('PEIDCREDITO').AsInteger := vlidcredito;
         ParamByName('PENUMPERIODO').AsInteger := vlperiodo;
         ParamByName('PEFREFERENCIA').AsDateTime := Apli.DameFechaEmpresa;
         ParamByName('PEFCALCULO').AsDateTime :=  StrToDateTime(vlfcalculo);
         ParamByName('PEBFINDIA').AsString := 'F';
         ParamByName('PEBSOLOFONDEO').AsString := 'F';
         ExecProc;
         VGInteresProy := ParamByName('PSINTPROY').AsFloat;
         VGInteresIvaProy := ParamByName('PSIVAPROY').AsFloat;
         VGTasaProy :=  ParamByName('PSTASA').AsFloat;

      Finally
         Close;
         Params.Clear;
         Free;
      End;
   end;
End;

Function TQRProVema.CalculoTasa(vlidcredito, vlperiodo:integer):single;
var stpObtTasa : TStoredProc;
    Qry       : Tquery;
    vlStrSql  : String;
begin
   CalculoTasa:=0;
   vlStrSql := ' SELECT (F_VENCIMIENTO - PLAZO) AS F_INICIO '+
               ' FROM   CR_INTERES '+
               ' WHERE ID_CREDITO='+IntToStr(vlidcredito)+' AND NUM_PERIODO='+IntToStr(vlperiodo);

   Qry := GetSQLQueryNoNil(vlStrSql, Apli.DataBaseName,  Apli.SessionName, False );
   if Assigned(Qry) and not( Qry.IsEmpty ) then
   begin

      stpObtTasa := TStoredProc.Create(Nil);
      If Assigned(stpObtTasa) Then
      begin
         With stpObtTasa Do
         Try
            DatabaseName := Apli.DataBaseName;
            SessionName  := Apli.SessionName;
            StoredProcName := 'PKGCRCOMUN.STPOBTENTASAINT';
            Params.CreateParam(ftString, 'PECVEACCESORIO',ptInput);
            Params.CreateParam(ftInteger, 'PEIDCREDITO',ptInput);
            Params.CreateParam(ftInteger,  'PENUMPERIODO',ptInput);
            Params.CreateParam(ftDate,  'PEFECHATASA',ptInput);
            Params.CreateParam(ftString,'PEBSOLOFONDEO',ptInput);
            Params.CreateParam(ftString,'PEBTASAGTIA',ptInput);
            // RABA DIC 2013 PROYECTO CAMBIO DE TASAS
            Params.CreateParam(ftString,'PEBAPLICACT',ptInput);
            Params.CreateParam(ftString,'PEBREINICIAPER',ptInput);
            // FIN RABA
            //
            Params.CreateParam(ftFloat, 'PSVALTASA',ptOutput);
            // RABA DIC 2013 PROYECTO CAMBIO DE TASAS
            Params.CreateParam(ftFloat, 'PSTASABASE',ptOutput);
            Params.CreateParam(ftFloat, 'PSSOBRETASA',ptOutput);
            // FIN RABA
            Params.CreateParam(ftFloat, 'PSRESULTADO',ptOutput);
            Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
            Prepare;
            ParamByName('PECVEACCESORIO').AsString := 'IN';
            ParamByName('PEIDCREDITO').AsInteger := vlidcredito;
            ParamByName('PENUMPERIODO').AsInteger := vlperiodo;
            ParamByName('PEFECHATASA').AsDateTime :=  StrToDateTime(Qry.FieldByName('F_INICIO').AsString);
            ParamByName('PEBSOLOFONDEO').AsString := 'F';
            ParamByName('PEBTASAGTIA').AsString := 'F';
            // RABA DIC 2013 PROYECTO CAMBIO DE TASAS
            ParamByName('PEBAPLICACT').AsString := 'V';
            ParamByName('PEBREINICIAPER').AsString := 'F';
            // FIN RABA
            ExecProc;
            if ParamByName('PSRESULTADO').AsFloat = 0 then
               CalculoTasa:= ParamByName('PSVALTASA').AsFloat;
         Finally
            Close;
            Params.Clear;
            Free;
         End;
      end;
   end;

   if Assigned(Qry) then
   begin
      Qry.Close;        Qry.Free;
   end;
End;
//FIN HERJA 26.08.2010

Procedure RepProgVenMa(sF_Vencimiento,
                       sProducto,sMoneda,
                       sAcreditado, sPromAsoc,sPromAdmon,
                       sCesion,sGpoProd,sNbrArch:String;
                       pAPli     : TInterApli;
                       pPreview  : Boolean;
                       bVENC     : Boolean //HERJA 25.08.2010
                       );
Var
    QRProVema: TQRProVema;
    VLTitulo : String;
    Preview     : TIntQRPreview;
Begin
    vlF_Vencimiento:=sF_Vencimiento;
    VLTitulo := '';
    QRProVema:=TQRProVema.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QRProVema);
    Try
        QRProVema.QRInterEncabezado1.Apli:=pApli;
        QRProVema.Apli := pAPli;

        QRProVema.VLF_Vencimiento := sF_Vencimiento;

        sArchivo:= sNbrArch;

        QRProVema.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QRProVema.QRInterEncabezado1.NomReporte:='IntQProVeMa';
        QRProVema.QRInterEncabezado1.Titulo1:='Vencimientos al '+ sF_Vencimiento;

        QRProVema.VLImporte := 0;
        QRProVema.VLImporteBinter := 0;
        QRProVema.VLImporteFEGA := 0;

        QRProVema.VLImporteCte := 0;
        QRProVema.VLImporteBinterCte := 0;
        QRProVema.VLImporteFEGACte := 0;

        QRProVema.VLImporteProm := 0;
        QRProVema.VLImporteBinterProm := 0;
        QRProVema.VLImporteFEGAProm := 0;

        QRProVema.VLImportePromAs := 0;
        QRProVema.VLImporteBinterPromAs := 0;
        QRProVema.VLImporteFEGAPromAs := 0;

        QRProVema.VLImporteTS := 0;
        QRProVema.VLImporteBinterTS := 0;
        QRProVema.VLImporteFEGATS := 0;

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

        QRProVema.QRInterEncabezado1.Titulo2 := VLTitulo;

        QRProVema.qyProgVen.DatabaseName := pApli.DataBaseName;
        QRProVema.qyProgVen.SessionName := pApli.SessionName;

        QRProVema.qyProgVen.Active:=False;
        QRProVema.qyProgVen.SQL.Text:= QRProVema.FormaQuery(sF_Vencimiento,sProducto,sMoneda,
                                                            sAcreditado,  sPromAsoc,sPromAdmon,
                                                            sCesion,sGpoProd, bVENC);
        QRProVema.qyProgVen.SQL.SaveToFile('c:\IntQProVeMa.txt');
        QRProVema.qyProgVen.Active:=True;

        //HERJA
        vlmaxlin:=0;
        vlinclin:=0;
        vlmaxlin:=QRProVema.qyProgVen.RecordCount;

         If Trim(sArchivo)<>'' Then
         Begin
            B_1ARCH:=FALSE;
            AssignFile(F, sArchivo);
            Rewrite(F);
            Writeln(F, QRProVema.QRInterEncabezado1.Titulo1+ #09 );
            Writeln(F,  #09 );
            Writeln(F,
              'ID_CREDITO'+ #09 +
              'ACCESORIO'+ #09 +
              'NUM_PERIODO'+ #09 +
              'F_INICIO'+ #09 +
              'F_VENCIMIENTO'+ #09 +
              'F_PROG_PAGO'+ #09 +
              'F_PAGO'+ #09 +
              'NUM_PERIODO_PER'+ #09 +
              'PLAZO'+ #09 +
              'TASA_APLICADA'+ #09 +
              'SIT_PERIODO'+ #09 +
              'IMP_BINTER'+ #09 +
              'IMP_FEGA'+ #09 +
              'IMP_BINTER_FEGA'+ #09 +
              'IMP_TOTAL'+ #09 +
              'IMP_IVA'+ #09 +
              'MORATORIOS'+ #09 +
              //
              'ID_PROM_ADM'+ #09 +
              'NOM_PROMOTOR_ADM'+ #09 +
              'ID_PERS_ASOCIAD'+ #09 +
              'NOM_PROMOTOR_ASO'+ #09 +
              'ID_CONTRATO'+ #09 +
              'SDO_INSOLUTO'+ #09 +
              'SDO_VIG_TOTAL'+ #09 +
              'IMP_CREDITO'+ #09 +
              'CVE_MONEDA'+ #09 +
              'DESC_MONEDA'+ #09 +
              'CVE_PRODUCTO_CRE'+ #09 +
              'DESC_L_PRODUCTO'+ #09 +
              'CUENTA_BANCO'+ #09 +
              'SALDO_AL'+ #09 +
              'ID_TITULAR'+ #09 +
//              'DESC_POBLAC_EDO'+ #09 +
              'NOMBRE'+ #09 +
              //HERJA 07/05/2010
              'DIRECCION'+ #09 +
              'COLONIA'+ #09 +
              'CIUDAD'+ #09 +
              'ESTADO'+ #09 +
              'PAIS'+ #09 +
              'CP'+ #09 +
              'TEL_CASA'+ #09 +
              'FAX'+ #09 +
              'TEL_OFNA'+ #09 +
              'E_MAIL'
              );
      End;

        If pPreview Then
            QRProVema.Preview
        Else
            QRProVema.Print;

    Finally

      If Trim(sArchivo)<>'' Then Begin
         CloseFile(F);
      End;
    
      QRProVema.free;
      If Assigned(Preview) Then Preview.Free;
    End;
end;

Function TQRProVema.FormaQuery(  sF_Vencimiento,sProducto,sMoneda,
                           sAcreditado,  sPromAsoc,sPromAdmon,
                           sCesion,sGpoProd : String;
                           bVENC     : Boolean) : String; //HERJA 25.08.2010


Var
    sSQL         : String;
    sSQL1        : String;
    sSQL2        : String;
    sSQL3        : String;
    sSQL4        : String;
    sSQL5        : String;
    sSQL6        : String;

    VlSituacion  : String;
    VLBFechaTras : Boolean;
    VLDiaHoy     : String;
    VLComparador : String;
    VLTipoRep    : String;
    sF_Calculo   : String;

begin

   sF_Calculo := Trim(sF_Vencimiento);
   VLTipoRep := '';
     {
            sSQL1:= sSQL1 + ' SELECT GENERAL.*, PPR.ID_PERSONA AS ID_PROM_ADM, '+ coCRLF +
                            ' PPR.NOMBRE AS NOM_PROMOTOR_ADM, '+ coCRLF +
                            ' CTO.ID_PERS_ASOCIAD     ,       PPRC.NOMBRE NOM_PROMOTOR_ASO    , '+ coCRLF +
                            ' CC.ID_CONTRATO  , CC.SDO_INSOLUTO   , CC.SDO_VIG_TOTAL   , CC.IMP_CREDITO , '+ coCRLF +
                            ' M.CVE_MONEDA, '+ coCRLF +
                            ' M.DESC_MONEDA, '+ coCRLF +
                            ' CPR.CVE_PRODUCTO_CRE, '+ coCRLF +
                            ' CPR.DESC_L_PRODUCTO, '+ coCRLF +
                            ' SUBSTR(PKGCRPERIODO.STPObtChqCte(PCE.ID_PERSONA,0,GENERAL.ID_CREDITO,''AC'',''AD'',''CR''),1,20) CUENTA_BANCO,'+ coCRLF +
                            ' PKGDPVISTASERV.SPTObtSaldo(PKGCRPERIODO.STPObtChqCte(PCE.ID_PERSONA,0,GENERAL.ID_CREDITO,''AC'',''AD'',''CR''),''D000'') SALDO_AL,'+
                            ' PCE.ID_PERSONA AS ID_TITULAR, '+ coCRLF +
                            ' CCAC.DESC_POBLAC_EDO, '+ coCRLF +
                            ' PCE.NOMBRE FROM ( ';
      }

   //HERJA 07/05/2010
   sSQL1:= sSQL1 + ' SELECT GENERAL.*, '+ coCRLF +
                   ' PPR.ID_PERSONA AS ID_PROM_ADM, '+ coCRLF +
                   ' PPR.NOMBRE AS NOM_PROMOTOR_ADM, '+ coCRLF +
                   ' CTO.ID_PERS_ASOCIAD, '+ coCRLF +
                   ' PPRC.NOMBRE NOM_PROMOTOR_ASO, '+ coCRLF +
                   ' CC.ID_CONTRATO, '+ coCRLF +
                   ' CC.SDO_INSOLUTO, '+ coCRLF +
                   ' CC.SDO_VIG_TOTAL, '+ coCRLF +
                   ' CC.IMP_CREDITO, '+ coCRLF +
                   ' M.CVE_MONEDA, '+ coCRLF +
                   ' M.DESC_MONEDA, '+ coCRLF +
                   ' CCTO.CVE_PRODUCTO_CRE, '+ coCRLF +
                   ' (SELECT DESC_L_PRODUCTO FROM CR_PRODUCTO WHERE CVE_PRODUCTO_CRE=CCTO.CVE_PRODUCTO_CRE) DESC_L_PRODUCTO, '+ coCRLF +
                   ' SUBSTR(PKGCRPERIODO.STPObtChqCte(PCE.ID_PERSONA,0,GENERAL.ID_CREDITO,''AC'',''AD'',''CR''),1,20) CUENTA_BANCO, '+ coCRLF +
                   ' PKGDPVISTASERV.SPTObtSaldo(PKGCRPERIODO.STPObtChqCte(PCE.ID_PERSONA,0,GENERAL.ID_CREDITO,''AC'',''AD'',''CR''),''D000'') SALDO_AL, '+ coCRLF +
                   ' SUBSTR(PKGCRPERIODO.STPObtChqCte(PCE.ID_PERSONA,0,CC.ID_CREDITO,''AC'',''AD'',''CR''),1,20) CUENTA_BANCO, '+ coCRLF +
                   ' PKGDPVISTASERV.SPTObtSaldo(PKGCRPERIODO.STPObtChqCte(PCE.ID_PERSONA,0,CC.ID_CREDITO,''AC'',''AD'',''CR''),''D000'') SALDO_AL, '+ coCRLF +
                   ' PCE.ID_PERSONA AS ID_TITULAR, '+ coCRLF +
                   ' PCE.NOMBRE, '+ coCRLF +
                   ' D.CALLE_NUMERO||''  Ext. ''||D.NUM_EXTERIOR||''  Int. ''||D.NUM_INTERIOR AS DIRECCION, '+ coCRLF +
                   ' D.COLONIA AS COLONIA, '+ coCRLF +
                   ' (SELECT DESC_POBLACION FROM POBLACION WHERE CVE_POBLACION=D.CVE_CIUDAD) AS CIUDAD, '+ coCRLF +
                   ' (SELECT DESC_POBLACION FROM POBLACION WHERE CVE_POBLACION=D.CVE_ESTADO) AS ESTADO, '+ coCRLF +
                   ' (SELECT DESC_POBLACION FROM POBLACION WHERE CVE_POBLACION=D.CVE_PAIS) AS PAIS, '+ coCRLF +
                   ' D.CODIGO_POSTAL AS CP, '+ coCRLF +
                   ' PCE.TELEF_CASA AS TEL_CASA, '+ coCRLF +
                   ' PCE.TELEF_FAX AS FAX, '+ coCRLF +
                   ' PCE.TELEF_OFICINA AS TEL_OFNA, '+ coCRLF +
                   ' PCE.E_MAIL AS E_MAIL FROM (';


//IMPAGADO CAPITAL
   sSQL1:= sSQL1 +
            '  SELECT ID_CREDITO, ''AA'' AS TIPO_CARTERA, ''A'' AS SUB_ORDEN, ''CAPITAL'' ACCESORIO,NUM_PERIODO,(F_VENCIMIENTO - PLAZO) F_INICIO, '+ coCRLF +
            '         F_VENCIMIENTO,F_PROG_PAGO,F_PAGO,' + coCRLF +
            '         NUM_PERIODO AS NUM_PERIODO_PER, PLAZO,' + coCRLF +
            '         PKGCRCOMUN.FUNOBTENTASA(''CP'',ID_CREDITO,NUM_PERIODO,F_VENCIMIENTO-1)TASA_APLICADA,' + coCRLF +
//HERJA ENERO 2013
//            '        (IMP_CAPITAL - IMP_PAGADO_HIST ) IMPORTE,0 IMP_IVA,SIT_CAPITAL AS SIT_PERIODO, '+ coCRLF +
//            '        (IMP_CAPITAL - IMP_PAGADO_HIST - IMP_CONCEPTO) IMP_BINTER, '+ coCRLF +
//            '        IMP_CONCEPTO IMP_FEGA, '+ coCRLF +
//            '        (IMP_CAPITAL + MORATORIOS  - IMP_PAGADO_HIST ) IMP_TOTAL, MORATORIOS'+ coCRLF +

            '        (IMP_CAPITAL - IMP_PAGADO_HIST + PAGOSANT ) IMPORTE,0 IMP_IVA,SIT_CAPITAL AS SIT_PERIODO, '+ coCRLF +
            '        (IMP_CAPITAL - IMP_PAGADO_HIST - IMP_CONCEPTO + PAGOSANT ) IMP_BINTER, '+ coCRLF +
            '        IMP_CONCEPTO IMP_FEGA, '+ coCRLF +
            '        (IMP_CAPITAL + MORATORIOS  - IMP_PAGADO_HIST + PAGOSANT ) IMP_TOTAL, MORATORIOS'+ coCRLF +
//
            '  FROM  (SELECT CCA.*, ' + coCRLF +
            '                PKGCRCOMUN.FUNOBTENIMPGTIA( 3, ''CP'', ''IMPBRU'', CCA.ID_CREDITO, ' + coCRLF +
            '                CCA.NUM_PERIODO, NULL, ' + SQLFecha( StrToDate( sF_Calculo ) ) + ', ''V'' ) IMP_CONCEPTO, ' + coCRLF +
            '                NVL( PKGCRPERIODO.FUNOBTENMORA( 1,''V'',CCA.ID_CREDITO,CCA.NUM_PERIODO,NULL,NULL,' + coCRLF +
                             SQLFecha( StrToDate( sF_Calculo ) ) + VLTipoRep + ',NULL), 0 ) AS MORATORIOS, '+ coCRLF +
            '                NVL(  PKGCRCOMUN.STPOBTIMPPAGADO( ''CP'', ''IMPBRU'',CCA.ID_CREDITO, CCA.NUM_PERIODO,NULL,' + coCRLF +
                             SQLFecha(StrToDate(sF_Calculo )) + ',''V'' ), 0 ) AS IMP_PAGADO_HIST '+ coCRLF +
            '               ,NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) PAGOSANT '+ coCRLF +  //HERJA ENERO 2013
            '         FROM ' + coCRLF ;

      if bVENC=false then
      begin
            sSQL1 := sSQL1 +
            ' (SELECT CCA.* FROM CR_CAPITAL CCA, CR_CAPITAL CCAF ' + coCRLF +
            '                 WHERE 1 = 1'+ coCRLF +
            '                 AND   CCAF.ID_CREDITO = CCA.ID_CREDITO ' + coCRLF;
           //FILTRA CREDITOS PROGRAMADOS PROGRAMADO
           VLComparador := '=';
           sSQL1 := sSQL1 + ' AND  CCAF.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
           If (Trim(sCesion)<>'') Then
           sSQL1 := sSQL1 + ' AND   CCAF.ID_CREDITO = '+ sCesion  +  coCRLF;
           If Trim(sF_Vencimiento)<>'' Then
           begin
              //IMPAGADO
              VLComparador := '<';
           sSQL1 := sSQL1 + ' AND  CCA.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
           end;
           //HERJA 07/05/2010
           // sSQL1 := sSQL1 + ' AND  ((CCA.F_PROG_PAGO < CCA.F_PAGO AND CCA.SIT_CAPITAL <> ''CA'''  + coCRLF +
           sSQL1 := sSQL1 + ' AND  ((CCA.F_PROG_PAGO < CCA.F_PAGO AND CCA.SIT_CAPITAL NOT IN (''CA'',''LQ'')'  + coCRLF +
                            ' AND   CCA.F_PAGO > ' + SQLFecha( StrToDate( sF_Vencimiento ) ) + ')' + coCRLF +
                            ' OR   (CCA.SIT_CAPITAL = ''IM'' ))' + coCRLF ;

//HERJA ENERO 2013
// sSQL1 := sSQL1 + ' ) CCA ) VECA' + coCRLF ;
sSQL1 := sSQL1 +
                            '    ) CCA  ' + coCRLF +
			    '	 ,(' + coCRLF +
			    '	   SELECT CT.ID_CREDITO, CT.ID_PERIODO,' + coCRLF +
		            '             NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_PGDMCP' + coCRLF +
		            '        FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT' + coCRLF +
		            '       WHERE 1=1' + coCRLF +
		            '         AND CT.SIT_TRANSACCION = ''AC''' + coCRLF +
		            '         AND CT.ID_TRANS_CANCELA IS NULL' + coCRLF +
		            '         AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION' + coCRLF +
		            '         AND CT.CVE_OPERACION IN (''PGDMCP'')' + coCRLF +
			    '	      AND CDT.CVE_CONCEPTO IN (''IMPBRU'')' + coCRLF +
		            '       GROUP BY CT.ID_CREDITO, CT.ID_PERIODO' + coCRLF +
			    '	  ) CA_HIST_PGDMCP' + coCRLF +
                            ' WHERE 1=1' + coCRLF +
            	            '   AND CA_HIST_PGDMCP.ID_CREDITO (+)= CCA.ID_CREDITO' + coCRLF +
                            '   AND CA_HIST_PGDMCP.ID_PERIODO (+)= CCA.NUM_PERIODO' + coCRLF +
                            ') VECA '+ coCRLF;
// FIN HERJA

    end;

      //HERJA 26.08.2010
      if bVENC=true then
      begin
            sSQL1 := sSQL1 +
            ' (SELECT CCA.* FROM CR_CAPITAL CCA ' + coCRLF +
            '                 WHERE 1 = 1'+ coCRLF ;
           If (Trim(sCesion)<>'') Then
              sSQL1 := sSQL1 + ' AND   CCA.ID_CREDITO = '+ sCesion  +  coCRLF;
           If Trim(sF_Vencimiento)<>'' Then
           begin
              VLComparador := '<';
              sSQL1 := sSQL1 + ' AND  CCA.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
           end;
           sSQL1 := sSQL1 + ' AND  ((CCA.F_PROG_PAGO < CCA.F_PAGO AND CCA.SIT_CAPITAL NOT IN (''CA'',''LQ'')'  + coCRLF +
                            ' AND   CCA.F_PAGO > ' + SQLFecha( StrToDate( sF_Vencimiento ) ) + ')' + coCRLF +
                            ' OR   (CCA.SIT_CAPITAL = ''IM'' ))' + coCRLF ;
           sSQL1 := sSQL1 + ' ) CCA ) VECA' + coCRLF ;
    end;
    //FIN HERJA 26.08.2010


//IMPAGADO INTERES
           sSQL1 := sSQL1 + ' UNION ALL '+ coCRLF ;
           sSQL1 := sSQL1 +
            '  SELECT ID_CREDITO,''AA'' AS TIPO_CARTERA, ''C'' AS SUB_ORDEN,  ''INTERES'' ACCESORIO,NUM_PERIODO,(F_VENCIMIENTO - PLAZO) F_INICIO, '+ coCRLF +
            '         F_VENCIMIENTO,F_PROG_PAGO,F_PAGO,' + coCRLF +
            '         NUM_PERIODO AS NUM_PERIODO_PER, PLAZO,' + coCRLF +
            '         TASA_APLICADA,' + coCRLF +
//HERJA 06.09.2010 SE LEE EL IVA
//            '        (IMP_INTERES_PROY - IMP_PAGADO_HIST ) IMPORTE,0 IMP_IVA,SIT_INTERES AS SIT_PERIODO, '+ coCRLF +
            '        (IMP_INTERES_PROY - IMP_PAGADO_HIST ) IMPORTE, '+ coCRLF +
            '        (IMP_IVA_PROY - IMP_IVA_PAG_HIST) IMP_IVA, SIT_INTERES AS SIT_PERIODO, '+ coCRLF +
//FIN HERJA 06.09.2010 SE LEE EL IVA
            '        (IMP_INTERES_PROY - IMP_PAGADO_HIST - IMP_CONCEPTO) IMP_BINTER, '+ coCRLF +
            '         IMP_CONCEPTO IMP_FEGA, '+ coCRLF +

//HERJA 06.09.2010 SE LEE EL IVA
//            '         (IMP_INTERES_PROY + MORATORIOS  - IMP_PAGADO_HIST ) IMP_TOTAL, MORATORIOS'+ coCRLF +
            '         (IMP_INTERES_PROY + IMP_IVA_PROY + MORATORIOS  - IMP_PAGADO_HIST - IMP_IVA_PAG_HIST) IMP_TOTAL, MORATORIOS'+ coCRLF +
//FIN HERJA 06.09.2010 SE LEE EL IVA
            '  FROM  (SELECT CCI.*, ' + coCRLF +
            '                PKGCRCOMUN.FUNOBTENIMPGTIA( 3, ''IN'', ''IMPBRU'', CCI.ID_CREDITO, ' + coCRLF +
            '                CCI.NUM_PERIODO, NULL, ' + SQLFecha( StrToDate( sF_Calculo ) ) + ', ''V'' ) IMP_CONCEPTO, ' + coCRLF +
            '                NVL( PKGCRPERIODO.FUNOBTENMORA( 4,''V'',CCI.ID_CREDITO,CCI.NUM_PERIODO,NULL,NULL,' + coCRLF +
                             SQLFecha( StrToDate( sF_Calculo ) ) + VLTipoRep + ',NULL), 0 ) AS MORATORIOS, '+ coCRLF +

            '                NVL(  PKGCRCOMUN.STPOBTIMPPAGADO( ''IN'', ''IMPBRU'',CCI.ID_CREDITO, CCI.NUM_PERIODO,NULL,' + coCRLF +
                             SQLFecha(StrToDate(sF_Calculo )) + ',''V'' ), 0 ) AS IMP_PAGADO_HIST '+ coCRLF +
            //IVA HERJA 06.09.2010
            '               , NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''IN'', ''IMPIVA'',CCI.ID_CREDITO, CCI.NUM_PERIODO,NULL,' + coCRLF +
                            SQLFecha(StrToDate(sF_Calculo )) + ',''V'' ), 0 ) AS IMP_IVA_PAG_HIST '+ coCRLF +
            //FIN IVA HERJA 06.09.2010
            '         FROM ' + coCRLF ;

      if bVENC=false then
      begin
            sSQL1 := sSQL1 +
            '(SELECT CCI.* FROM CR_INTERES CCI, CR_INTERES CCIF ' + coCRLF +
            '                 WHERE 1 = 1'+ coCRLF +
            '                 AND   CCIF.ID_CREDITO = CCI.ID_CREDITO ' + coCRLf;
           //FILTRA CREDITOS PROGRAMADOS PROGRAMADO
           VLComparador := '=';
           sSQL1 := sSQL1 + ' AND  CCIF.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF +
          //HERJA 19.08.2010
         // ' AND  CCIF.B_FINAN_ADIC NOT IN (''V'')';
                           ' AND  ( (CCIF.B_FINAN_ADIC NOT IN (''V'')) OR (CCIF.B_FINAN_ADIC IS NULL) )';
         //FIN HERJA
           If (Trim(sCesion)<>'') Then
           sSQL1 := sSQL1 + ' AND   CCIF.ID_CREDITO = '+ sCesion  +  coCRLF;
           If Trim(sF_Vencimiento)<>'' Then
           begin
              //IMPAGADO
              VLComparador := '<';
           sSQL1 := sSQL1 + ' AND  CCI.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
           end;
          //HERJA 07/05/2010
         // sSQL1 := sSQL1 + ' AND  ((CCI.F_PROG_PAGO < CCI.F_PAGO AND CCI.SIT_INTERES <> ''CA'''  + coCRLF +
           sSQL1 := sSQL1 + ' AND  ((CCI.F_PROG_PAGO < CCI.F_PAGO AND CCI.SIT_INTERES NOT IN (''CA'',''LQ'')'  + coCRLF +
                            ' AND   CCI.F_PAGO > ' + SQLFecha( StrToDate( sF_Vencimiento ) ) + ')' + coCRLF +
                            ' OR   (CCI.SIT_INTERES = ''IM'' ))' + coCRLF ;
           sSQL1 := sSQL1 + ' ) CCI '+ coCRLF;
      end;

      if bVENC=true then
      begin                         
            sSQL1 := sSQL1 +
            '(SELECT CCI.* FROM CR_INTERES CCI ' + coCRLF +
            '                 WHERE 1 = 1'+ coCRLF;
           If (Trim(sCesion)<>'') Then
           sSQL1 := sSQL1 + ' AND   CCI.ID_CREDITO = '+ sCesion  +  coCRLF;
           If Trim(sF_Vencimiento)<>'' Then
           begin
              //IMPAGADO
              VLComparador := '<';
              sSQL1 := sSQL1 + ' AND  CCI.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
           end;
           sSQL1 := sSQL1 + ' AND  ((CCI.F_PROG_PAGO < CCI.F_PAGO AND CCI.SIT_INTERES NOT IN (''CA'',''LQ'')'  + coCRLF +
                            ' AND   CCI.F_PAGO > ' + SQLFecha( StrToDate( sF_Vencimiento ) ) + ')' + coCRLF +
                            ' OR   (CCI.SIT_INTERES = ''IM'' ))' + coCRLF ;
           sSQL1 := sSQL1 + ' ) CCI '+ coCRLF;
      end;

      //HERJA 26.08.2010
      if bVENC=false then
      begin
//--FILTRO PARA QUE SOLAMENTE MUESTRE PERIODOS DE INTERES DONDE EXISTA AMORTIZACION DE CAPITAL
           sSQL1 := sSQL1 + ','+ coCRLF +

{                            ' (SELECT * FROM CR_CAPITAL CCA ' + coCRLF +
                            '  WHERE 1 = 1 ' + coCRLF +
//HERJA 07/05/2010
                            ' AND CCA.SIT_CAPITAL NOT IN (''CA'',''LQ'')'+ coCRLF ;
//                            ' AND CCA.SIT_CAPITAL NOT IN (''CA'',''LQ'')'+ coCRLF ;
//
                            If (Trim(sCesion)<>'') Then
                               sSQL1 := sSQL1 + ' AND   CCA.ID_CREDITO = '+ sCesion  +  coCRLF;
//            sSQL1 := sSQL1 + ' AND  CCA.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
            sSQL1 := sSQL1 + ' AND  CCA.F_VENCIMIENTO = ' + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;

            sSQL1 := sSQL1 + ' ) CCA2 ' + coCRLF +
			    '	 WHERE CCI.F_VENCIMIENTO = CCA2.F_VENCIMIENTO  ' + coCRLF +
			    '	 AND   CCI.ID_CREDITO    = CCA2.ID_CREDITO ' + coCRLF ;
//
}

//HERJA 29.08.2010
                            ' (SELECT CCA.F_VENCIMIENTO, CCA.ID_CREDITO ' + coCRLF +
                            ' FROM CR_CAPITAL CCA ' + coCRLF +
                            '  WHERE 1 = 1 ' + coCRLF +
                            ' AND CCA.SIT_CAPITAL NOT IN (''CA'')'+ coCRLF ;
                            If (Trim(sCesion)<>'') Then
                               sSQL1 := sSQL1 + ' AND   CCA.ID_CREDITO = '+ sCesion  +  coCRLF;
            sSQL1 := sSQL1 + ' AND  CCA.F_VENCIMIENTO = ' + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
            sSQL1 := sSQL1 + ' ) CCA2 ' + coCRLF +
			    '	 WHERE 1=1 ' + coCRLF +
                            '    AND CCI.F_VENCIMIENTO <= CCA2.F_VENCIMIENTO  ' + coCRLF +
  			    '	 AND  CCI.ID_CREDITO = CCA2.ID_CREDITO  ' + coCRLF ;
//FIN HERJA 29.08.2010

      end;

      //FIN HERJA 26.08.2010
      sSQL1 := sSQL1 + ' ) VEIN' + coCRLF ;

//IMPAGADO FINAN ADIC
           sSQL1 := sSQL1 + ' UNION ALL '+ coCRLF ;
           sSQL1:= sSQL1 +
            '  SELECT ID_CREDITO,''AA'' AS TIPO_CARTERA, ''B'' AS SUB_ORDEN,  ''FINAN'' ACCESORIO,NUM_PERIODO,(F_VENCIMIENTO - PLAZO) F_INICIO, '+ coCRLF +
            '         F_VENCIMIENTO,F_PROG_PAGO,F_PAGO,' + coCRLF +
            '         NUM_PERIODO AS NUM_PERIODO_PER, PLAZO,' + coCRLF +
            '         PKGCRCOMUN.FUNOBTENTASA(''FN'',ID_CREDITO,NUM_PERIODO,F_VENCIMIENTO-1)TASA_APLICADA,' + coCRLF +
            '        (IMP_FINAN_ADIC - IMP_PAGADO_HIST ) IMPORTE,0 IMP_IVA,SIT_FINAN_ADIC AS SIT_PERIODO, '+ coCRLF +
            '        (IMP_FINAN_ADIC - IMP_PAGADO_HIST - IMP_CONCEPTO) IMP_BINTER, '+ coCRLF +
            '         IMP_CONCEPTO IMP_FEGA, '+ coCRLF +
            '         (IMP_FINAN_ADIC + MORATORIOS  - IMP_PAGADO_HIST ) IMP_TOTAL, MORATORIOS'+ coCRLF +
            '  FROM  (SELECT CCF.*, ' + coCRLF +
            '                PKGCRCOMUN.FUNOBTENIMPGTIA( 3, ''FN'', ''IMPBRU'', CCF.ID_CREDITO, ' + coCRLF +
            '                CCF.NUM_PERIODO, NULL, ' + SQLFecha( StrToDate( sF_Calculo ) ) + ', ''V'' ) IMP_CONCEPTO, ' + coCRLF +
            '                NVL( PKGCRPERIODO.FUNOBTENMORA( 3,''V'',CCF.ID_CREDITO,CCF.NUM_PERIODO,NULL,NULL,' + coCRLF +
                             SQLFecha( StrToDate( sF_Calculo ) ) + VLTipoRep + ',NULL), 0 ) AS MORATORIOS, '+ coCRLF +
            '                NVL(  PKGCRCOMUN.STPOBTIMPPAGADO( ''FN'', ''IMPBRU'',CCF.ID_CREDITO, CCF.NUM_PERIODO,NULL,' + coCRLF +
                             SQLFecha(StrToDate(sF_Calculo )) + ',''V'' ), 0 ) AS IMP_PAGADO_HIST '+ coCRLF +
//            '         FROM   (SELECT CCF.* FROM CR_FINAN_ADIC CCF, CR_FINAN_ADIC CCFF ' + coCRLF +
//HERJA 17/05/2010 CORRECCION PARA SIMULAR EL PERIODO DE FA EN CASO DE QUE NO EXISTA EN LA TABLA
            '         FROM '+ coCRLF ;

      if bVENC=false then
      begin
            sSQL1 := sSQL1 +
            '(SELECT CCF.* FROM CR_FINAN_ADIC CCF, ' + coCRLF +
            '	                               (SELECT ID_CREDITO, F_VENCIMIENTO FROM CR_FINAN_ADIC ' + coCRLF +
	    '				        WHERE F_VENCIMIENTO =' + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF+
	    '				        UNION ' + coCRLF +
	    '				        SELECT ID_CREDITO, F_VENCIMIENTO FROM CR_CAPITAL ' + coCRLF +
	    ' 				        WHERE F_VENCIMIENTO =' + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF+
	    '			     	       )CCFF ' + coCRLF +

            '                 WHERE 1 = 1'+ coCRLF +
            '                 AND   CCFF.ID_CREDITO = CCF.ID_CREDITO ' + coCRLf;
            //FILTRA CREDITOS PROGRAMADOS PROGRAMADO
            VLComparador := '=';
            sSQL1 := sSQL1 + ' AND  CCFF.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
            If (Trim(sCesion)<>'') Then
            sSQL1 := sSQL1 + ' AND   CCFF.ID_CREDITO = '+ sCesion  +  coCRLF;
            If Trim(sF_Vencimiento)<>'' Then
            begin
               //IMPAGADO
               VLComparador := '<';
            sSQL1 := sSQL1 + ' AND  CCF.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
            end;
            //HERJA 07/05/2010
           // sSQL1 := sSQL1 + ' AND  ((CCF.F_PROG_PAGO < CCF.F_PAGO AND CCF.SIT_FINAN_ADIC <> ''CA'''  + coCRLF +
            sSQL1 := sSQL1 + ' AND  ((CCF.F_PROG_PAGO < CCF.F_PAGO AND CCF.SIT_FINAN_ADIC NOT IN (''CA'',''LQ'')'  + coCRLF +
           //
                             ' AND   CCF.F_PAGO > ' + SQLFecha( StrToDate( sF_Vencimiento ) ) + ')' + coCRLF +
                             ' OR   (CCF.SIT_FINAN_ADIC = ''IM'' ))' + coCRLF ;
            sSQL1 := sSQL1 + ' ) CCF ) VEFN' + coCRLF ;
     end;

      //HERJA 26.08.2010
      if bVENC=true then
      begin
            sSQL1 := sSQL1 +
            '(SELECT CCF.* FROM CR_FINAN_ADIC CCF ' + coCRLF +
            '                 WHERE 1 = 1'+ coCRLF ;
            If (Trim(sCesion)<>'') Then
            sSQL1 := sSQL1 + ' AND   CCF.ID_CREDITO = '+ sCesion  +  coCRLF;
            If Trim(sF_Vencimiento)<>'' Then
            begin
               //IMPAGADO
               VLComparador := '<';
            sSQL1 := sSQL1 + ' AND  CCF.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
            end;
            sSQL1 := sSQL1 + ' AND  ((CCF.F_PROG_PAGO < CCF.F_PAGO AND CCF.SIT_FINAN_ADIC NOT IN (''CA'',''LQ'')'  + coCRLF +
                             ' AND   CCF.F_PAGO > ' + SQLFecha( StrToDate( sF_Vencimiento ) ) + ')' + coCRLF +
                             ' OR   (CCF.SIT_FINAN_ADIC = ''IM'' ))' + coCRLF ;
            sSQL1 := sSQL1 + ' ) CCF ) VEFN' + coCRLF ;
     end;
     //FIN HERJA 26.08.2010

 //IMPAGADO COMISIONES
            sSQL1 := sSQL1 + ' UNION ALL '+ coCRLF ;
            sSQL1:= sSQL1 +
            '  SELECT ID_CREDITO,''AA'' AS TIPO_CARTERA, ''D'' AS SUB_ORDEN,  DESC_COMISION,NUM_PERIODO,(F_VENCIMIENTO - PLAZO) F_INICIO, '+  coCRLF +
            '         F_VENCIMIENTO,F_PROG_PAGO,F_PAGO,     ' + coCRLF +
            '         NUM_PERIODO AS NUM_PERIODO_PER, PLAZO,' + coCRLF +
            '         TASA_APLICADA,'+ coCRLF +
            '         (IMP_COMISION - IMP_PAGADO_HIST) IMPORTE,'+ coCRLF +
            '         IMP_IVA-IMP_IVA_PAG_HIST AS IMP_IVA,SIT_COMISION AS SIT_PERIODO, '+ coCRLF +
            '         (IMP_COMISION - IMP_PAGADO_HIST - NVL(IMP_CONCEPTO,0)) IMP_BINTER, '+ coCRLF +
            '         NVL(IMP_CONCEPTO,0) IMP_FEGA, '+ coCRLF +
            '         (IMP_COMISION  + IMP_IVA + MORATORIOS - IMP_PAGADO_HIST -IMP_IVA_PAG_HIST) IMP_TOTAL, '+ coCRLF +
            '         MORATORIOS'+  coCRLF +
            '  FROM ( SELECT CCC.*, '+ coCRLF +
            '                PKGCRCOMUN.FUNOBTENIMPGTIA( 3, ''CN'', ''IMPBRU'', CCC.ID_CREDITO, ' +
            '                CCC.NUM_PERIODO, CCC.CVE_COMISION, ' + SQLFecha( StrToDate( sF_Calculo ) ) + ', ''V'' ) IMP_CONCEPTO, ' + coCRLF +
            '                CCCO.DESC_COMISION,'+ coCRLF +
            '                NVL( PKGCRPERIODO.FUNOBTENMORA( 2 ,''V'' ,CCC.ID_CREDITO ,CCC.NUM_PERIODO , CCC.CVE_COMISION ,'+ coCRLF +
            '                NULL,TO_DATE('#39+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Calculo))+#39',''DD/MM/YYYY'')' + VLTipoRep + ','+
            '                NULL), 0 ) AS MORATORIOS, '+ coCRLF +
            '                NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''CN'', ''IMPBRU'', '      +
            '                CCC.ID_CREDITO,  CCC.NUM_PERIODO, CCC.CVE_COMISION,' +  SQLFecha(StrToDate(sF_Calculo )) + ','   + coCRLF +
            '                ''V'' ), 0 ) AS IMP_PAGADO_HIST, '+ coCRLF +
            '                NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''CN'', ''IMPIVA'', '      + coCRLF +
            '                CCC.ID_CREDITO,  CCC.NUM_PERIODO, CCC.CVE_COMISION,' +  SQLFecha(StrToDate(sF_Calculo )) + ','   + coCRLF +
            '                ''V'' ), 0 ) AS IMP_IVA_PAG_HIST '+ coCRLF +
            '         FROM '+ coCRLF ;

      if bVENC=false then
      begin
            sSQL1 := sSQL1 +
            ' (SELECT CCC.* FROM CR_COMISION CCC, CR_COMISION CCCF ' + coCRLF +
            '                WHERE 1 = 1'+ coCRLF +
            '                AND   CCCF.ID_CREDITO = CCC.ID_CREDITO ' + coCRLf;
            //FILTRA CREDITOS PROGRAMADOS PROGRAMADO
            VLComparador := '=';
            sSQL1 := sSQL1 + ' AND  CCCF.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
            If (Trim(sCesion)<>'') Then
                sSQL1 := sSQL1 + ' AND   CCCF.ID_CREDITO = '+ sCesion  +  coCRLF;
            //IMPAGADO
            VLComparador := '<';
            sSQL1 := sSQL1 + ' AND CCC.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF +
           //HERJA 07/05/2010
          // ' AND  ((CCC.F_PROG_PAGO < CCC.F_PAGO AND ' +  coCRLF + '  CCC.SIT_COMISION <> ''CA''' +  coCRLF +
                             ' AND  ((CCC.F_PROG_PAGO < CCC.F_PAGO AND ' +  coCRLF + '  CCC.SIT_COMISION NOT IN (''CA'',''LQ'')' +  coCRLF +
          //
                             ' AND   CCC.F_PAGO > ' + SQLFecha( StrToDate( sF_Vencimiento ) ) + ')' + coCRLF +
                             ' OR   (CCC.SIT_COMISION = ''IM'' ))'+  coCRLF +
                             ' ) CCC, CR_CAT_COMISION CCCO  ' + coCRLF +
                             ' WHERE  CCCO.CVE_COMISION = CCC.CVE_COMISION  ) VECN' + coCRLF ;
     end;

      //HERJA 26.08.2010
      if bVENC=true then
      begin
            sSQL1 := sSQL1 +      
            ' (SELECT CCC.* FROM CR_COMISION CCC ' + coCRLF +
            '                WHERE 1 = 1'+ coCRLF ;
            If (Trim(sCesion)<>'') Then
                sSQL1 := sSQL1 + ' AND   CCC.ID_CREDITO = '+ sCesion  +  coCRLF;
            //IMPAGADO
            VLComparador := '<';
            sSQL1 := sSQL1 + ' AND CCC.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF +
                             ' AND  ((CCC.F_PROG_PAGO < CCC.F_PAGO AND ' +  coCRLF + '  CCC.SIT_COMISION NOT IN (''CA'',''LQ'')' +  coCRLF +
                             ' AND   CCC.F_PAGO > ' + SQLFecha( StrToDate( sF_Vencimiento ) ) + ')' + coCRLF +
                             ' OR   (CCC.SIT_COMISION = ''IM'' ))'+  coCRLF +
                             ' ) CCC, CR_CAT_COMISION CCCO  ' + coCRLF +
                             ' WHERE  CCCO.CVE_COMISION = CCC.CVE_COMISION  ) VECN' + coCRLF ;
      end;
      //FIN HERJA 26.08.2010

//PROGRAMADO CAPITAL
            VLComparador := '=';

            sSQL2 := sSQL2 + ' UNION ALL '+ coCRLF ;
            sSQL2:= sSQL2 +
            '  SELECT ID_CREDITO,''BB'' AS TIPO_CARTERA, ''A'' AS SUB_ORDEN,  ''CAPITAL'' ACCESORIO,NUM_PERIODO,(F_VENCIMIENTO - PLAZO) F_INICIO, '+ coCRLF +
            '         F_VENCIMIENTO,F_PROG_PAGO,F_PAGO,' + coCRLF +
            '         NUM_PERIODO AS NUM_PERIODO_PER, PLAZO,' + coCRLF +
            '         PKGCRCOMUN.FUNOBTENTASA(''CP'',ID_CREDITO,NUM_PERIODO,F_VENCIMIENTO-1)TASA_APLICADA,' + coCRLF +
// HERJA ENERO 2013
//            '        (IMP_CAPITAL - IMP_PAGADO_HIST ) IMPORTE,0 IMP_IVA,SIT_CAPITAL AS SIT_PERIODO, '+ coCRLF +
//            '        (IMP_CAPITAL - IMP_PAGADO_HIST - IMP_CONCEPTO) IMP_BINTER, '+ coCRLF +
//            '         IMP_CONCEPTO IMP_FEGA, '+ coCRLF +
//            '         (IMP_CAPITAL + MORATORIOS  - IMP_PAGADO_HIST ) IMP_TOTAL, MORATORIOS'+ coCRLF +

            '        (IMP_CAPITAL - IMP_PAGADO_HIST + PAGOSANT ) IMPORTE,0 IMP_IVA,SIT_CAPITAL AS SIT_PERIODO, '+ coCRLF +
            '        (IMP_CAPITAL - IMP_PAGADO_HIST - IMP_CONCEPTO + PAGOSANT ) IMP_BINTER, '+ coCRLF +
            '         IMP_CONCEPTO IMP_FEGA, '+ coCRLF +
            '         (IMP_CAPITAL + MORATORIOS  - IMP_PAGADO_HIST + PAGOSANT ) IMP_TOTAL, MORATORIOS'+ coCRLF +
// FIN HERJA
            '  FROM  (SELECT CCA.*, ' + coCRLF +
            '                PKGCRCOMUN.FUNOBTENIMPGTIA( 3, ''CP'', ''IMPBRU'', CCA.ID_CREDITO, ' + coCRLF +
            '                CCA.NUM_PERIODO, NULL, ' + SQLFecha( StrToDate( sF_Calculo ) ) + ', ''V'' ) IMP_CONCEPTO, ' + coCRLF +
            '                0 AS MORATORIOS, '+ coCRLF +
            '                NVL(  PKGCRCOMUN.STPOBTIMPPAGADO( ''CP'', ''IMPBRU'',CCA.ID_CREDITO, CCA.NUM_PERIODO,NULL,' + coCRLF +
                             SQLFecha(StrToDate(sF_Calculo )) + ',''V'' ), 0 ) AS IMP_PAGADO_HIST '+ coCRLF +
            '                ,NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) PAGOSANT '+ coCRLF +  //HERJA ENERO 2013
            '         FROM   (SELECT * FROM CR_CAPITAL CCA ' + coCRLF +
            '                 WHERE 1 = 1 ' + coCRLF +
//HERJA 07/05/2010
//            '                 AND CCA.SIT_CAPITAL <> ''CA'''+ coCRLF ;
            '                 AND CCA.SIT_CAPITAL NOT IN (''CA'',''LQ'')'+ coCRLF ;
//
            If (Trim(sCesion)<>'') Then
                sSQL2 := sSQL2 + ' AND   CCA.ID_CREDITO = '+ sCesion  +  coCRLF;
            sSQL2 := sSQL2 + ' AND  CCA.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF +
//HERJA 26/08/2010
                             ' AND (SELECT COUNT(*) ' + coCRLF +
			     '        FROM CR_CAPITAL CCA1 ' + coCRLF +
			     '       WHERE 1=1 ' + coCRLF +
			     '         AND CCA1.ID_CREDITO = CCA.ID_CREDITO ' + coCRLF +
	                     '         AND CCA1.F_VENCIMIENTO >= ' + SQLFecha(Apli.DameFechaEmpresa) + coCRLF +
			     '	       AND CCA1.F_VENCIMIENTO <  ' + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF +
                             '         AND CCA1.SIT_CAPITAL NOT IN (''CA'',''LQ'') '+ coCRLF +
			     '		 ) = 0 ' + coCRLF +
//FIN HERJA 26/08/2010

//HERJA ENERO 2013
//                             '       ) CCA ) PRCA' + coCRLF ;
                            '    ) CCA  ' + coCRLF +
			    '	 ,(' + coCRLF +
			    '	   SELECT CT.ID_CREDITO, CT.ID_PERIODO,' + coCRLF +
		            '             NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_PGDMCP' + coCRLF +
		            '        FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT' + coCRLF +
		            '       WHERE 1=1' + coCRLF +
		            '         AND CT.SIT_TRANSACCION = ''AC''' + coCRLF +
		            '         AND CT.ID_TRANS_CANCELA IS NULL' + coCRLF +
		            '         AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION' + coCRLF +
		            '         AND CT.CVE_OPERACION IN (''PGDMCP'')' + coCRLF +
			    '	      AND CDT.CVE_CONCEPTO IN (''IMPBRU'')' + coCRLF +
		            '       GROUP BY CT.ID_CREDITO, CT.ID_PERIODO' + coCRLF +
			    '	  ) CA_HIST_PGDMCP' + coCRLF +
                            ' WHERE 1=1' + coCRLF +
            	            '   AND CA_HIST_PGDMCP.ID_CREDITO (+)= CCA.ID_CREDITO' + coCRLF +
                            '   AND CA_HIST_PGDMCP.ID_PERIODO (+)= CCA.NUM_PERIODO' + coCRLF +
                            ') PRCA '+ coCRLF;
// FIN HERJA


//PROGRAMADO FINAN ADIC
            VLComparador := '=';

            sSQL2 := sSQL2 + ' UNION ALL '+ coCRLF ;
            sSQL2:= sSQL2 +
            '  SELECT ID_CREDITO,''BB'' AS TIPO_CARTERA, ''B'' AS SUB_ORDEN,  ''FINAN'' ACCESORIO,NUM_PERIODO,(F_VENCIMIENTO - PLAZO) F_INICIO, '+ coCRLF +
            '         F_VENCIMIENTO,F_PROG_PAGO,F_PAGO,' + coCRLF +
            '         NUM_PERIODO AS NUM_PERIODO_PER, PLAZO,' + coCRLF +
            '         PKGCRCOMUN.FUNOBTENTASA(''FN'',ID_CREDITO,NUM_PERIODO,F_VENCIMIENTO-1)TASA_APLICADA,' + coCRLF +
            '        (IMP_FINAN_ADIC - IMP_PAGADO_HIST ) IMPORTE,0 IMP_IVA,SIT_FINAN_ADIC AS SIT_PERIODO, '+ coCRLF +
            '        (IMP_FINAN_ADIC - IMP_PAGADO_HIST - IMP_CONCEPTO) IMP_BINTER, '+ coCRLF +
            '         IMP_CONCEPTO IMP_FEGA, '+ coCRLF +
            '         (IMP_FINAN_ADIC + MORATORIOS  - IMP_PAGADO_HIST ) IMP_TOTAL, MORATORIOS'+ coCRLF +
            '  FROM  (SELECT CCF.*, ' + coCRLF +
            '                PKGCRCOMUN.FUNOBTENIMPGTIA( 3, ''FN'', ''IMPBRU'', CCF.ID_CREDITO, ' + coCRLF +
            '                CCF.NUM_PERIODO, NULL, ' + SQLFecha( StrToDate( sF_Calculo ) ) + ', ''V'' ) IMP_CONCEPTO, ' + coCRLF +
            '                0 AS MORATORIOS, '+ coCRLF +
            '                NVL(  PKGCRCOMUN.STPOBTIMPPAGADO( ''FN'', ''IMPBRU'',CCF.ID_CREDITO, CCF.NUM_PERIODO,NULL,' + coCRLF +
                             SQLFecha(StrToDate(sF_Calculo )) + ',''V'' ), 0 ) AS IMP_PAGADO_HIST '+ coCRLF +
            '         FROM   (SELECT * FROM CR_FINAN_ADIC CCF ' + coCRLF +
            '                 WHERE 1 = 1 ' + coCRLF +
//HERJA 07/05/2010
//            '                 AND CCF.SIT_FINAN_ADIC <> ''CA'''+ coCRLF ;
            '                 AND CCF.SIT_FINAN_ADIC NOT IN (''CA'',''LQ'')'+ coCRLF ;
//
            If (Trim(sCesion)<>'') Then
                sSQL2 := sSQL2 + ' AND   CCF.ID_CREDITO = '+ sCesion  +  coCRLF;
            sSQL2 := sSQL2 + ' AND  CCF.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF +
//HERJA 26/08/2010
                             ' AND (SELECT COUNT(*) ' + coCRLF +
			     '        FROM CR_FINAN_ADIC CCF1 ' + coCRLF +
			     '       WHERE 1=1 ' + coCRLF +
			     '         AND CCF1.ID_CREDITO = CCF.ID_CREDITO ' + coCRLF +
	                     '         AND CCF1.F_VENCIMIENTO >= ' + SQLFecha(Apli.DameFechaEmpresa) + coCRLF +
			     '	       AND CCF1.F_VENCIMIENTO <  ' + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF +
                             '         AND CCF1.SIT_FINAN_ADIC NOT IN (''CA'',''LQ'') '+ coCRLF +
			     '		 ) = 0 ' + coCRLF +
//FIN HERJA 26/08/2010
                             '       ) CCF ) PRFN' + coCRLF ;
                      
//PROGRAMADO INTERES
            VLComparador := '=';

            sSQL2 := sSQL2 + ' UNION ALL '+ coCRLF ;
            sSQL2:= sSQL2 +
            '  SELECT PRIN.ID_CREDITO,''BB'' AS TIPO_CARTERA, ''C'' AS SUB_ORDEN,  ''INTERES'' ACCESORIO,NUM_PERIODO,(F_VENCIMIENTO - PLAZO) F_INICIO, '+ coCRLF +
            '         F_VENCIMIENTO,F_PROG_PAGO,F_PAGO,' + coCRLF +
            '         NUM_PERIODO AS NUM_PERIODO_PER, PLAZO,' + coCRLF +
            '         DECODE(TASA_APLICADA,NULL,TASA_CREDITO,0,TASA_CREDITO,TASA_APLICADA) AS TASA_APLICADA,' + coCRLF +
//HERJA 07/09/2010
//            '        (0 - IMP_PAGADO_HIST ) IMPORTE, IMP_IVA, SIT_INTERES AS SIT_PERIODO, '+ coCRLF +
            '        (0 - IMP_PAGADO_HIST ) IMPORTE, (IMP_IVA_PROY) IMP_IVA, SIT_INTERES AS SIT_PERIODO, '+ coCRLF +
//FIN HERJA 07/09/2010            
            '        (0 - IMP_PAGADO_HIST - IMP_CONCEPTO) IMP_BINTER, '+ coCRLF +
            '         IMP_CONCEPTO IMP_FEGA, '+ coCRLF +

//HERJA 07/09/2010       
//            '         (0 + MORATORIOS  - IMP_PAGADO_HIST ) IMP_TOTAL, MORATORIOS'+ coCRLF +
            '         (0 + IMP_IVA_PROY + MORATORIOS  - IMP_PAGADO_HIST ) IMP_TOTAL, MORATORIOS'+ coCRLF +
//FIN HERJA 07/09/2010
            '  FROM  (SELECT CCI.*, ' + coCRLF +
            '                PKGCRCOMUN.FUNOBTENIMPGTIA( 3, ''IN'', ''IMPBRU'', CCI.ID_CREDITO, ' + coCRLF +
            '                CCI.NUM_PERIODO, NULL, ' + SQLFecha( StrToDate( sF_Calculo ) ) + ', ''V'' ) IMP_CONCEPTO, ' + coCRLF +
            '                0 AS MORATORIOS, '+ coCRLF +
            '                NVL(  PKGCRCOMUN.STPOBTIMPPAGADO( ''IN'', ''IMPBRU'',CCI.ID_CREDITO, CCI.NUM_PERIODO,NULL,' + coCRLF +
                           SQLFecha(StrToDate(sF_Calculo )) + ',''V'' ), 0 ) AS IMP_PAGADO_HIST '+ coCRLF +
            '         FROM   (SELECT * FROM CR_INTERES CCI ' + coCRLF +
            '                 WHERE 1 = 1' + coCRLF +
//HERJA 07/05/2010
//            '                 AND CCI.SIT_INTERES <> ''CA'''+ coCRLF +
            '                 AND CCI.SIT_INTERES NOT IN (''CA'',''LQ'')'+ coCRLF +
//
//HERJA 19.08.2010        
//            '                 AND   CCI.B_FINAN_ADIC NOT IN (''V'')';
            '                 AND   ((CCI.B_FINAN_ADIC NOT IN (''V'')) OR (CCI.B_FINAN_ADIC IS NULL) )';
//FIN HERJA
            If (Trim(sCesion)<>'') Then
                sSQL2 := sSQL2 + ' AND   CCI.ID_CREDITO = '+ sCesion  +  coCRLF;
            sSQL2 := sSQL2 + ' AND  CCI.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF +
//HERJA 26/08/2010
{                             ' AND (SELECT COUNT(*) ' + coCRLF +
			     '        FROM CR_INTERES CCI1 ' + coCRLF +
			     '       WHERE 1=1 ' + coCRLF +
			     '         AND CCI1.ID_CREDITO = CCI.ID_CREDITO ' + coCRLF +
	                     '         AND CCI1.F_VENCIMIENTO >= ' + SQLFecha(Apli.DameFechaEmpresa) + coCRLF +
			     '	       AND CCI1.F_VENCIMIENTO <  ' + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF +
                             '         AND CCI1.SIT_INTERES NOT IN (''CA'',''LQ'') '+ coCRLF +
			     '		 ) = 0 ' + coCRLF +
 }
//FIN HERJA 26/08/2010
                             '       ) CCI '+coCRLF;

//--FILTRO PARA QUE SOLAMENTE MUESTRE PERIODOS DE INTERES DONDE EXISTA AMORTIZACION DE CAPITAL
           sSQL2 := sSQL2 + ','+ coCRLF +
                            ' (SELECT * FROM CR_CAPITAL CCA ' + coCRLF +
                            '  WHERE 1 = 1 ' + coCRLF +
//HERJA 07/05/2010
                            ' AND CCA.SIT_CAPITAL NOT IN (''CA'',''LQ'')'+ coCRLF ;
//                            ' AND CCA.SIT_CAPITAL NOT IN (''CA'',''LQ'')'+ coCRLF ;
//
                            If (Trim(sCesion)<>'') Then
                               sSQL2 := sSQL2 + ' AND   CCA.ID_CREDITO = '+ sCesion  +  coCRLF;
//            sSQL2 := sSQL2 + ' AND  CCA.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
            sSQL2 := sSQL2 + ' AND  CCA.F_VENCIMIENTO = ' + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;

            sSQL2 := sSQL2 + ' ) CCA2 ' + coCRLF +
			    '	 WHERE CCI.F_VENCIMIENTO = CCA2.F_VENCIMIENTO  ' + coCRLF +
			    '	 AND   CCI.ID_CREDITO    = CCA2.ID_CREDITO ' + coCRLF +
//
                            '  ) PRIN, (SELECT ID_CREDITO, TASA_CREDITO FROM CR_CREDITO) CCRE WHERE PRIN.ID_CREDITO = CCRE.ID_CREDITO ' + coCRLF ;

 //PROGRAMADO COMISIONES
            VLComparador := '=';
            sSQL2 := sSQL2 + ' UNION ALL '+ coCRLF ;
            sSQL2:= sSQL2 +
            '  SELECT ID_CREDITO,''BB'' AS TIPO_CARTERA, ''D'' AS SUB_ORDEN,  DESC_COMISION AS ACCESORIO,NUM_PERIODO,(F_VENCIMIENTO - PLAZO) F_INICIO, '+  coCRLF +
            '         F_VENCIMIENTO,F_PROG_PAGO,F_PAGO,     ' + coCRLF +
            '         NUM_PERIODO AS NUM_PERIODO_PER, PLAZO,' + coCRLF +
            '         TASA_APLICADA,'+ coCRLF +
            '         (IMP_COMISION - IMP_PAGADO_HIST) IMPORTE,'+ coCRLF +
            '         IMP_IVA-IMP_IVA_PAG_HIST AS IMP_IVA,SIT_COMISION AS SIT_PERIODO, '+ coCRLF +
            '         (IMP_COMISION - IMP_PAGADO_HIST - NVL(IMP_CONCEPTO,0)) IMP_BINTER, '+ coCRLF +
            '         NVL(IMP_CONCEPTO,0) IMP_FEGA, '+ coCRLF +
            '         (IMP_COMISION  + IMP_IVA + MORATORIOS - IMP_PAGADO_HIST -IMP_IVA_PAG_HIST) IMP_TOTAL, '+ coCRLF +
            '         MORATORIOS'+  coCRLF +
            '  FROM ( SELECT CCC.*, '+ coCRLF +
            '                PKGCRCOMUN.FUNOBTENIMPGTIA( 3, ''CN'', ''IMPBRU'', CCC.ID_CREDITO, ' +
            '                CCC.NUM_PERIODO, CCC.CVE_COMISION, ' + SQLFecha( StrToDate( sF_Calculo ) ) + ', ''V'' ) IMP_CONCEPTO, ' + coCRLF +
            '                CCCO.DESC_COMISION,'+ coCRLF +
            '                0 AS MORATORIOS, '+ coCRLF +
            '                NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''CN'', ''IMPBRU'', '      +
            '                CCC.ID_CREDITO,  CCC.NUM_PERIODO, CCC.CVE_COMISION,' +  SQLFecha(StrToDate(sF_Calculo )) + ','   + coCRLF +
            '                ''V'' ), 0 ) AS IMP_PAGADO_HIST, '+ coCRLF +
            '                NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''CN'', ''IMPIVA'', '      + coCRLF +
            '                CCC.ID_CREDITO,  CCC.NUM_PERIODO, CCC.CVE_COMISION,' +  SQLFecha(StrToDate(sF_Calculo )) + ','   + coCRLF +
            '                ''V'' ), 0 ) AS IMP_IVA_PAG_HIST '+ coCRLF +
            '         FROM  (SELECT CCC.* FROM CR_COMISION CCC ' + coCRLF +
            '                WHERE 1 = 1' + coCRLF +
//HERJA 07/05/2010
//            '                AND   CCC.SIT_COMISION <> ''CA'''+ coCRLF ;
            '                AND   CCC.SIT_COMISION NOT IN (''CA'',''LQ'')'+ coCRLF ;
//
            If (Trim(sCesion)<>'') Then
                sSQL2 := sSQL2 + ' AND   CCC.ID_CREDITO = '+ sCesion  +  coCRLF;
            sSQL2 := sSQL2 + ' AND CCC.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF +
//HERJA 26/08/2010
                             ' AND (SELECT COUNT(*) ' + coCRLF +
			     '        FROM CR_COMISION CCC1 ' + coCRLF +
			     '       WHERE 1=1 ' + coCRLF +
			     '         AND CCC1.ID_CREDITO = CCC.ID_CREDITO ' + coCRLF +
	                     '         AND CCC1.F_VENCIMIENTO >= ' + SQLFecha(Apli.DameFechaEmpresa) + coCRLF +
			     '	       AND CCC1.F_VENCIMIENTO <  ' + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF +
                             '         AND CCC1.SIT_COMISION NOT IN (''CA'',''LQ'') '+ coCRLF +
			     '		 ) = 0 ' + coCRLF +
//FIN HERJA 26/08/2010
                             '             ) CCC, CR_CAT_COMISION CCCO  ' + coCRLF +
                             ' WHERE  CCCO.CVE_COMISION = CCC.CVE_COMISION  ) PRCN' + coCRLF ;

            sSQL3:= sSQL3 + ' ) GENERAL, ';

//HERJA 07/05/2010
{
            sSQL3:= sSQL3 +
            ' CR_CREDITO        CC, '+  coCRLF +
            ' (SELECT * FROM CONTRATO WHERE ID_CONTRATO IN (SELECT ID_CONTRATO FROM CR_CREDITO))         CTO, '+  coCRLF +
            ' MONEDA            M, '+ coCRLF +
            ' PERSONA           PPR, '+ coCRLF +
            ' PERSONA           PPRC, '+ coCRLF +
            ' (SELECT CCTO.*, CPRO.ID_EMPRESA FROM   CR_PRODUCTO CPRO, CR_CONTRATO CCTO WHERE  CPRO.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE) CCTO,'+ coCRLF +
            ' CR_PRODUCTO       CPR, '+ coCRLF +
            ' PERSONA           PCE, '+ coCRLF +
            ' CR_CON_ADEU_CLTV CCAC '+ coCRLF +
            ' WHERE 1 = 1 '+ coCRLF ;
}

//HERJA 07/05/2010
            sSQL3:= sSQL3 +
	    ' CR_CREDITO CC, '+  coCRLF;

            If (Trim(sProducto)<>'')OR(Trim(sGpoProd)<>'') Then
            begin
               If (Trim(sProducto)<>'') Then
               begin
                  sSQL3:= sSQL3 +
                  ' (SELECT ID_CONTRATO, FOL_CONTRATO, ID_PROM_ADMON, CVE_PRODUCTO_CRE FROM CR_CONTRATO '+  coCRLF +
                  ' WHERE CVE_PRODUCTO_CRE IN ('''+sProducto+''')'+  coCRLF +
                  ' ) CCTO, '+  coCRLF;
               end;
               If (Trim(sGpoProd)<>'') Then
               begin
                  sSQL3:= sSQL3 +
                  ' (SELECT ID_CONTRATO, FOL_CONTRATO, ID_PROM_ADMON, CVE_PRODUCTO_CRE FROM CR_CONTRATO '+  coCRLF +
                  //HERJA 26.08.2010
                  // ' WHERE CVE_PRODUCTO_GPO ='+ SQLStr( sGpoProd )+  coCRLF +
                  ' WHERE CVE_PRODUCTO_CRE IN ( SELECT CVE_PRODUCTO_CRE FROM CR_PRODUCTO WHERE CVE_PRODUCTO_GPO ='+ SQLStr( sGpoProd )+ ')'+ coCRLF +
                  //FIN HERJA 26.08.2010
                  ' ) CCTO, '+  coCRLF;
               end;
            end
            else
               sSQL3:= sSQL3 + ' CR_CONTRATO CCTO, '+  coCRLF;

            sSQL3:= sSQL3 +               
            ' CONTRATO          CTO, '+  coCRLF +
            ' MONEDA            M, '+  coCRLF +
            ' PERSONA           PPR, '+  coCRLF +
            ' PERSONA           PPRC, '+  coCRLF +
            ' PERSONA           PCE, '+  coCRLF +
       	    ' DOMICILIO         D '+  coCRLF +
            ' WHERE 1 = 1 '+  coCRLF;

          //If (Trim(sProducto)<>'') Then
         //    sSQL3:= sSQL3 + ' AND   CPR.CVE_PRODUCTO_CRE ='''+sProducto+''''+  coCRLF ;

        sSQL3:= sSQL3 +
            ' AND CC.ID_CONTRATO         = CCTO.ID_CONTRATO '+  coCRLF +
            ' AND CC.FOL_CONTRATO        = CCTO.FOL_CONTRATO '+  coCRLF +
            ' AND CC.SIT_CREDITO         NOT IN (''LQ'',''CA'') '+  coCRLF +
            ' AND CTO.ID_CONTRATO        = CCTO.ID_CONTRATO '+  coCRLF +
            ' AND CTO.ID_EMPRESA         = 2 '+  coCRLF +
            ' AND CC.ID_CONTRATO         = CTO.ID_CONTRATO '+  coCRLF +
            ' AND GENERAL.ID_CREDITO     = CC.ID_CREDITO '+  coCRLF +
            ' AND   M.CVE_MONEDA          = CTO.CVE_MONEDA '+  coCRLF +
            ' AND   PPR.ID_PERSONA        = CC.ID_PROM_ADM '+  coCRLF +
            ' AND   PPRC.ID_PERSONA       = CTO.ID_PERS_ASOCIAD '+  coCRLF +
            ' AND   PCE.ID_PERSONA     (+)= CTO.ID_TITULAR '+  coCRLF +
            ' AND   D.ID_DOMICILIO        = PCE.ID_DOM_FISCAL '+  coCRLF;

            If (Trim(sPromAdmon)<>'') Then
               sSQL3:= sSQL3 + ' AND CC.ID_PROM_ADM ='+ sPromAdmon +  coCRLF;
            If (Trim(sCesion)<>'') Then
               sSQL3:= sSQL3 +' AND CC.ID_CREDITO ='+ sCesion  +  coCRLF;
            If (Trim(sMoneda)<>'') Then
               sSQL3:= sSQL3 +' AND CTO.CVE_MONEDA ='+sMoneda +  coCRLF;
            If (Trim(sAcreditado)<>'') Then
               sSQL3:= sSQL3 +' AND CTO.ID_TITULAR ='+ sAcreditado +  coCRLF;
            If (Trim(sPromAsoc)<>'') Then
               sSQL3:= sSQL3 +' AND CTO.ID_PERS_ASOCIAD ='+ sPromAsoc  +  coCRLF;

{
          If (Trim(sMoneda)<>'') Then
              sSQL3:= sSQL3 + ' AND   CTO.CVE_MONEDA ='+sMoneda +  coCRLF ;
          If (Trim(sAcreditado)<>'') Then
              sSQL3:= sSQL3 + ' AND  CTO.ID_TITULAR ='+ sAcreditado +  coCRLF ;
          If (Trim(sPromAsoc)<>'') Then
              sSQL3:= sSQL3 + ' AND  CTO.ID_PERS_ASOCIAD ='+ sPromAsoc  +  coCRLF ;
          If (Trim(sPromAdmon)<>'') Then
              sSQL3:= sSQL3 + ' AND  CC.ID_PROM_ADM ='+ sPromAdmon +  coCRLF ;
          If (Trim(sCesion)<>'') Then
              sSQL3:= sSQL3 + ' AND   CC.ID_CREDITO ='+ sCesion  +  coCRLF ;
         If (Trim(sGpoProd)<>'') Then
            sSQL3:= sSQL3 + ' AND CPR.CVE_PRODUCTO_GPO ='+ SQLStr( sGpoProd );

        sSQL3:= sSQL3 +
            ' AND   CC.SIT_CREDITO        NOT IN (''LQ'',''CA'')'+ coCRLF +
            ' AND   CC.ID_CREDITO         = GENERAL.ID_CREDITO'+ coCRLF +
            ' AND   CCTO.ID_CONTRATO      = CC.ID_CONTRATO '+ coCRLF +
            ' AND   CCTO.FOL_CONTRATO     = CC.FOL_CONTRATO ' + coCRLF +
            ' AND   CTO.ID_CONTRATO       = CC.ID_CONTRATO '+ coCRLF +
            ' AND   M.CVE_MONEDA          = CTO.CVE_MONEDA '+ coCRLF +
            ' AND   PPR.ID_PERSONA        = CC.ID_PROM_ADM '+ coCRLF +
            ' AND   PPRC.ID_PERSONA       = CTO.ID_PERS_ASOCIAD '+ coCRLF +
            ' AND   CPR.CVE_PRODUCTO_CRE  = CCTO.CVE_PRODUCTO_CRE '+ coCRLF +
            ' AND   PCE.ID_PERSONA     (+)= CTO.ID_TITULAR '+ coCRLF +
            ' AND    CCAC.ID_REG_VIGENTE = 1 '+ coCRLF +
            ' AND    CCAC.ID_CREDITO = GENERAL.ID_CREDITO'+ coCRLF ;


    sSQL3:= sSQL3 +' ORDER BY DESC_MONEDA, CTO.ID_PERS_ASOCIAD, PPR.ID_PERSONA, DESC_L_PRODUCTO, PCE.NOMBRE, CC.ID_CREDITO, GENERAL.TIPO_CARTERA,  GENERAL.SUB_ORDEN, '+  coCRLF ;

    sSQL3 := sSQL3 + '    GENERAL.ACCESORIO, GENERAL.NUM_PERIODO';
    }

//HERJA 07/05/2010
   sSQL3:= sSQL3 +' ORDER BY DESC_MONEDA, CTO.ID_PERS_ASOCIAD, PPR.ID_PERSONA, CCTO.CVE_PRODUCTO_CRE, PCE.NOMBRE, CC.ID_CREDITO,'+ coCRLF +
                  ' GENERAL.TIPO_CARTERA,  GENERAL.SUB_ORDEN, GENERAL.ACCESORIO, GENERAL.NUM_PERIODO'+ coCRLF ;


    Result:= sSQL1 + sSQL2 + sSQL3 + sSQL4 + sSQL5 + sSQL6;

end;



procedure TQRProVema.QRBand1BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
var VLTotalVig       : Double;
    VLIntIVAPro      : Double;
    VLIntIVAProTrans : Double;
    VLComIVAPro      : Double;
    VLTotPro         : Double;
    VLTotalMor       : Double;
    VLFinanAdicGen   : Double;

    VLIntProyFinan   : Double;
    VLInteresFinan   : Double;

    VLBFechaProg     : Boolean;

    Function DameFinanciamiento(sCesion,sFechaIni:String; var InteresProy,Interes : Double; var FProgramada : Boolean ) : Double;
    var
        Qry       : Tquery;
        vlStrSql  : String;
        VLSaldoBase : Double;
        VLFinanAdic : Double;
        VLTasaInteres : Double;
        VLPlazo     : Integer;
        UltimaFVenc : TDateTime;

        VLBFechaProgramada : Boolean;
    begin
        VLSaldoBase := 0;
        VLFinanAdic := 0;
        InteresProy := 0;
        Interes := 0;
        VLTasaInteres := 0;
        VLBFechaProgramada := False;
        FProgramada := False;
        //BUSCA FECHA PROGRAMADA
        vlStrSql := 'SELECT ID_CREDITO FROM CR_FINAN_ADIC WHERE ID_CREDITO = ' + sCesion +
                    '  AND  F_VENCIMIENTO = ' + SQLFecha(StrToDate(sFechaIni ));
        Qry := GetSQLQueryNoNil(vlStrSql, Apli.DataBaseName,  Apli.SessionName, False );
        if Assigned(Qry) and not( Qry.IsEmpty ) then
        begin
            while not Qry.Eof do
            begin
                 VLBFechaProgramada :=  True;
                 FProgramada := True;
                 Qry.Next;
            end;//ends_if
        end;
        if Assigned(Qry) then
        begin
              Qry.Close;        Qry.Free;
        end;

//        if VLBFechaProgramada then
        begin
              //BUSCA SALDO BASE PARA CALCULO DE INTERÉS
              vlStrSql := 'SELECT SDO_VIG_TOTAL FROM CR_CREDITO WHERE ID_CREDITO = ' + sCesion;
              Qry := GetSQLQueryNoNil(vlStrSql, Apli.DataBaseName,  Apli.SessionName, False );
              if Assigned(Qry) and not( Qry.IsEmpty ) then
              begin
                  while not Qry.Eof do
                  begin
                       VLSaldoBase :=  Qry.FieldByName('SDO_VIG_TOTAL').AsFloat;
                      Qry.Next;
                  end;//ends_if
              end;
              if Assigned(Qry) then
              begin
                    Qry.Close;        Qry.Free;
              end;
              //BUSCA LOS PERIODOS DE INTERES
              vlStrSql := '  SELECT NUM_PERIODO, PLAZO, IMP_INTERES_PROY, F_VENCIMIENTO, SIT_INTERES, B_FINAN_ADIC, TASA_APLICADA, ' +
                          ' (IMP_INTERES - IMP_PAGADO) AS IMP_INTERES' +
                          '  FROM CR_INTERES'+
                          '  WHERE 1 = 1'+
                          '  AND   ID_CREDITO = ' + sCesion +
                          '  AND   F_VENCIMIENTO > ' + SQLFecha(Apli.DameFechaEmpresa) +
                          '  AND   F_VENCIMIENTO <= ' + SQLFecha(StrToDate(sFechaIni )) +
                          '  ORDER BY NUM_PERIODO';
              Qry := GetSQLQueryNoNil(vlStrSql, Apli.DataBaseName,  Apli.SessionName, False );
              if Assigned(Qry) and not( Qry.IsEmpty ) then
              begin
                  if VLTasaInteres = 0 then
                       //HERJA 26.08.2010
                       //VLTasaInteres := Qry.FieldByName('TASA_APLICADA').AsFloat;
                       VLTasaInteres := CalculoTasa(StrToInt(sCesion), Qry.FieldByName('NUM_PERIODO').AsInteger);
                  //end if
                  while not Qry.Eof do
                  begin
                       if ((Qry.FieldByName('B_FINAN_ADIC').Asstring  = 'V') and (StrToDate(sFechaIni) > Qry.FieldByName('F_VENCIMIENTO').AsDateTime)) then
                       begin
                            if Qry.FieldByName('SIT_INTERES').Asstring  = 'AC' then
                            begin
                                 VLFinanAdic := VLFinanAdic + Qry.FieldByName('IMP_INTERES_PROY').AsFloat;
                                 VLSaldoBase := VLSaldoBase + Qry.FieldByName('IMP_INTERES_PROY').AsFloat;
                                 Interes := Qry.FieldByName('IMP_INTERES').AsFloat;
                            end
                            else
                            begin
                                 VLPlazo :=  Qry.FieldByName('PLAZO').AsInteger;
                                 VLFinanAdic := VLFinanAdic + ((ROUND(VLSaldoBase * VLTasaInteres/360)/100) * VLPlazo);
                                 VLSaldoBase :=  VLSaldoBase + ((ROUND(VLSaldoBase * VLTasaInteres/360)/100) * VLPlazo);
                            end;
                       end;

                       if StrToDate(sFechaIni) = Qry.FieldByName('F_VENCIMIENTO').AsDateTime then
                       begin
                            VLPlazo :=  Qry.FieldByName('PLAZO').AsInteger;
                            InteresProy := ((ROUND(VLSaldoBase * VLTasaInteres/360)/100) * VLPlazo);
                       end;

                       UltimaFVenc := Qry.FieldByName('F_VENCIMIENTO').AsDateTime;

                       Qry.Next;
                  end;//ends_if

                  if UltimaFVenc < StrToDate(sFechaIni) then
                  begin
                       VLPlazo :=  trunc(StrToDate(sFechaIni) - UltimaFVenc);
                       InteresProy := ((ROUND(VLSaldoBase * VLTasaInteres/360)/100)  * VLPlazo);
                  end;

              end;
              if Assigned(Qry) then
              begin
                    Qry.Close;        Qry.Free;
              end;
        end;
        Result:=       VLFinanAdic;
    end;

begin
     if ((qyProgVenACCESORIO.AsString = 'FINAN') AND  (qyProgVenSIT_PERIODO.AsString = 'AC')) then
     begin
          VLFinanAdicGen := DameFinanciamiento(qyProgVenID_CREDITO.AsString ,VLF_Vencimiento,VLIntProyFinan,VLInteresFinan,VLBFechaProg);
          QRLImporte.Caption := FormatFloat('###,###,###,###,###,##0.00',qyProgVenIMP_BINTER.asFloat + VLFinanAdicGen);
          QRLFegaBinter.Caption := FormatFloat('###,###,###,###,###,##0.00',qyProgVenIMPORTE.asFloat + VLFinanAdicGen);
          QRLTotal.Caption := FormatFloat('###,###,###,###,###,##0.00',qyProgVenIMP_TOTAL.asFloat + VLFinanAdicGen);

          VLImporte := VLImporte + qyProgVenIMP_BINTER.asFloat + VLFinanAdicGen;
          VLImporteBinter := VLImporteBinter + qyProgVenIMPORTE.asFloat + VLFinanAdicGen;
          VLImporteFEGA := VLImporteFEGA + qyProgVenIMP_TOTAL.asFloat + VLFinanAdicGen;

          VLImporteCte := VLImporteCte + qyProgVenIMP_BINTER.asFloat + VLFinanAdicGen;
          VLImporteBinterCte := VLImporteBinterCte + qyProgVenIMPORTE.asFloat + VLFinanAdicGen;
          VLImporteFEGACte := VLImporteFEGACte + qyProgVenIMP_TOTAL.asFloat + VLFinanAdicGen;

          VLImporteProm := VLImporteProm + qyProgVenIMP_BINTER.asFloat + VLFinanAdicGen;
          VLImporteBinterProm := VLImporteBinterProm + qyProgVenIMPORTE.asFloat + VLFinanAdicGen;
          VLImporteFEGAProm := VLImporteFEGAProm + qyProgVenIMP_TOTAL.asFloat + VLFinanAdicGen;

          VLImportePromAs := VLImportePromAs + qyProgVenIMP_BINTER.asFloat + VLFinanAdicGen;
          VLImporteBinterPromAs := VLImporteBinterPromAs + qyProgVenIMPORTE.asFloat + VLFinanAdicGen;
          VLImporteFEGAPromAs := VLImporteFEGAPromAs + qyProgVenIMP_TOTAL.asFloat + VLFinanAdicGen;

          VLImporteTS := VLImporteTS + qyProgVenIMP_BINTER.asFloat + VLFinanAdicGen;
          VLImporteBinterTS := VLImporteBinterTS + qyProgVenIMPORTE.asFloat + VLFinanAdicGen;
          VLImporteFEGATS := VLImporteFEGATS + qyProgVenIMP_TOTAL.asFloat + VLFinanAdicGen;


     end
     else if ((qyProgVenACCESORIO.AsString = 'INTERES') AND  ((qyProgVenSIT_PERIODO.AsString = 'PA') OR (qyProgVenSIT_PERIODO.AsString = 'AC'))) then
     begin
          Intereses(StrToInt(qyProgVenID_CREDITO.AsString), qyProgVenNUM_PERIODO.AsInteger, vlF_Vencimiento);

          VLFinanAdicGen:=0;
          VLFinanAdicGen := DameFinanciamiento(qyProgVenID_CREDITO.AsString ,VLF_Vencimiento,VLIntProyFinan,VLInteresFinan,VLBFechaProg);

          //HERJA 26.08.2010
          if VLFinanAdicGen > 0 then
          begin
             VLIntProyFinan := VGInteresProy;
          end
          else
          begin
             VLIntProyFinan:=VGInteresProy;
             QRDBText19.Caption:= FormatFloat('###,###,###,###,###,##0.00',VGTasaProy);
          end;
          //FIN HERJA 26.08.2010

          QRLImporte.Caption := FormatFloat('###,###,###,###,###,##0.00',qyProgVenIMP_BINTER.asFloat + VLIntProyFinan);
          QRLFegaBinter.Caption := FormatFloat('###,###,###,###,###,##0.00',qyProgVenIMPORTE.asFloat + VLIntProyFinan);
          QRLTotal.Caption := FormatFloat('###,###,###,###,###,##0.00',qyProgVenIMP_TOTAL.asFloat + VLIntProyFinan);

          VLImporte := VLImporte + qyProgVenIMP_BINTER.asFloat + VLIntProyFinan;
          VLImporteBinter := VLImporteBinter + qyProgVenIMPORTE.asFloat + VLIntProyFinan;
          VLImporteFEGA := VLImporteFEGA + qyProgVenIMP_TOTAL.asFloat + VLIntProyFinan;

          VLImporteCte := VLImporteCte + qyProgVenIMP_BINTER.asFloat + VLIntProyFinan;
          VLImporteBinterCte := VLImporteBinterCte + qyProgVenIMPORTE.asFloat + VLIntProyFinan;
          VLImporteFEGACte := VLImporteFEGACte + qyProgVenIMP_TOTAL.asFloat + VLIntProyFinan;

          VLImporteProm := VLImporteProm + qyProgVenIMP_BINTER.asFloat + VLIntProyFinan;
          VLImporteBinterProm := VLImporteBinterProm + qyProgVenIMPORTE.asFloat + VLIntProyFinan;
          VLImporteFEGAProm := VLImporteFEGAProm + qyProgVenIMP_TOTAL.asFloat + VLIntProyFinan;

          VLImportePromAs := VLImportePromAs + qyProgVenIMP_BINTER.asFloat + VLIntProyFinan;
          VLImporteBinterPromAs := VLImporteBinterPromAs + qyProgVenIMPORTE.asFloat + VLIntProyFinan;
          VLImporteFEGAPromAs := VLImporteFEGAPromAs + qyProgVenIMP_TOTAL.asFloat + VLIntProyFinan;

          VLImporteTS := VLImporteTS + qyProgVenIMP_BINTER.asFloat + VLIntProyFinan;
          VLImporteBinterTS := VLImporteBinterTS + qyProgVenIMPORTE.asFloat + VLIntProyFinan;
          VLImporteFEGATS := VLImporteFEGATS + qyProgVenIMP_TOTAL.asFloat + VLIntProyFinan;

     end
     else
     begin
          QRLImporte.Caption := FormatFloat('###,###,###,###,###,##0.00',qyProgVenIMP_BINTER.asFloat);
          QRLFegaBinter.Caption := FormatFloat('###,###,###,###,###,##0.00',qyProgVenIMPORTE.asFloat);
          QRLTotal.Caption := FormatFloat('###,###,###,###,###,##0.00',qyProgVenIMP_TOTAL.asFloat);

          VLImporte := VLImporte + qyProgVenIMP_BINTER.asFloat;
          VLImporteBinter := VLImporteBinter + qyProgVenIMPORTE.asFloat;
          VLImporteFEGA := VLImporteFEGA + qyProgVenIMP_TOTAL.asFloat;

          VLImporteCte := VLImporteCte + qyProgVenIMP_BINTER.asFloat;
          VLImporteBinterCte := VLImporteBinterCte + qyProgVenIMPORTE.asFloat;
          VLImporteFEGACte := VLImporteFEGACte + qyProgVenIMP_TOTAL.asFloat;

          VLImporteProm := VLImporteProm + qyProgVenIMP_BINTER.asFloat;
          VLImporteBinterProm := VLImporteBinterProm + qyProgVenIMPORTE.asFloat;
          VLImporteFEGAProm := VLImporteFEGAProm + qyProgVenIMP_TOTAL.asFloat;

          VLImportePromAs := VLImportePromAs + qyProgVenIMP_BINTER.asFloat;
          VLImporteBinterPromAs := VLImporteBinterPromAs + qyProgVenIMPORTE.asFloat;
          VLImporteFEGAPromAs := VLImporteFEGAPromAs + qyProgVenIMP_TOTAL.asFloat;

          VLImporteTS := VLImporteTS + qyProgVenIMP_BINTER.asFloat;
          VLImporteBinterTS := VLImporteBinterTS + qyProgVenIMPORTE.asFloat;
          VLImporteFEGATS := VLImporteFEGATS + qyProgVenIMP_TOTAL.asFloat;


     end;

//   If sArchivo <>'' Then Begin
     //HERJA
     If (sArchivo <>'')AND(B_1ARCH=FALSE) Then Begin

         Writeln(F,
              qyProgVen.FieldByName('ID_CREDITO').AsString + #09 +
              qyProgVen.FieldByName('ACCESORIO').AsString + #09 +
              qyProgVen.FieldByName('NUM_PERIODO').AsString + #09 +
              qyProgVen.FieldByName('F_INICIO').AsString + #09 +
              qyProgVen.FieldByName('F_VENCIMIENTO').AsString + #09 +
              qyProgVen.FieldByName('F_PROG_PAGO').AsString + #09 +
              qyProgVen.FieldByName('F_PAGO').AsString + #09 +
              qyProgVen.FieldByName('NUM_PERIODO_PER').AsString + #09 +
              qyProgVen.FieldByName('PLAZO').AsString + #09 +
              FormatFloat('0.0000',qyProgVen.FieldByName('TASA_APLICADA').AsFloat) + #09 +
              qyProgVen.FieldByName('SIT_PERIODO').AsString + #09 +
              QRLImporte.Caption + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_FEGA').AsFloat) + #09 +
              QRLFegaBinter.Caption + #09 +
              QRLTotal.Caption + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_IVA').AsFloat) + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('MORATORIOS').AsFloat) + #09 +
              qyProgVen.FieldByName('ID_PROM_ADM').AsString + #09 +
              qyProgVen.FieldByName('NOM_PROMOTOR_ADM').AsString + #09 +
              qyProgVen.FieldByName('ID_PERS_ASOCIAD').AsString + #09 +
              qyProgVen.FieldByName('NOM_PROMOTOR_ASO').AsString + #09 +
              qyProgVen.FieldByName('ID_CONTRATO').AsString + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('SDO_INSOLUTO').AsFloat) + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('SDO_VIG_TOTAL').AsFloat) + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_CREDITO').AsFloat) + #09 +
              qyProgVen.FieldByName('CVE_MONEDA').AsString + #09 +
              qyProgVen.FieldByName('DESC_MONEDA').AsString + #09 +
              qyProgVen.FieldByName('CVE_PRODUCTO_CRE').AsString + #09 +
              qyProgVen.FieldByName('DESC_L_PRODUCTO').AsString + #09 +
              qyProgVen.FieldByName('CUENTA_BANCO').AsString + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('SALDO_AL').AsFloat) + #09 +
              qyProgVen.FieldByName('ID_TITULAR').AsString + #09 +
//              qyProgVen.FieldByName('DESC_POBLAC_EDO').AsString + #09 +
              qyProgVen.FieldByName('NOMBRE').AsString + #09 +
              //HERJA 07/05/2010
              qyProgVen.FieldByName('DIRECCION').AsString + #09 +
              qyProgVen.FieldByName('COLONIA').AsString + #09 +
              qyProgVen.FieldByName('CIUDAD').AsString + #09 +
              qyProgVen.FieldByName('ESTADO').AsString + #09 +
              qyProgVen.FieldByName('PAIS').AsString + #09 +
              qyProgVen.FieldByName('CP').AsString + #09 +
              qyProgVen.FieldByName('TEL_CASA').AsString + #09 +
              qyProgVen.FieldByName('FAX').AsString + #09 +
              qyProgVen.FieldByName('TEL_OFNA').AsString + #09 +
              qyProgVen.FieldByName('E_MAIL').AsString
              );
              //HERJA
              vlinclin:=vlinclin+1
        end;

   //HERJA
   IF vlinclin=vlmaxlin THEN B_1ARCH:=TRUE;

end;

procedure TQRProVema.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
        VLImporte := 0;
        VLImporteBinter := 0;
        VLImporteFEGA := 0;

        VLImporteCte := 0;
        VLImporteBinterCte := 0;
        VLImporteFEGACte := 0;

        VLImporteProm := 0;
        VLImporteBinterProm := 0;
        VLImporteFEGAProm := 0;

        VLImportePromAs := 0;
        VLImporteBinterPromAs := 0;
        VLImporteFEGAPromAs := 0;

        VLImporteTS := 0;
        VLImporteBinterTS := 0;
        VLImporteFEGATS := 0;
end;

procedure TQRProVema.QRFooterCesionBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
        QRLabel1.Caption := FormatFloat('###,###,###,###,###,##0.00',VLImporte);
        QRLabel8.Caption := FormatFloat('###,###,###,###,###,##0.00',VLImporteBinter);
        QRLabel17.Caption := FormatFloat('###,###,###,###,###,##0.00',VLImporteFEGA);
        VLImporte := 0;
        VLImporteBinter := 0;
        VLImporteFEGA := 0;
end;

procedure TQRProVema.QRFooterClienteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
        QRLabel5.Caption := FormatFloat('###,###,###,###,###,##0.00',VLImporteCte);
        QRLabel10.Caption := FormatFloat('###,###,###,###,###,##0.00',VLImporteBinterCte);
        QRLabel19.Caption := FormatFloat('###,###,###,###,###,##0.00',VLImporteFEGACte);
        VLImporteCte := 0;
        VLImporteBinterCte := 0;
        VLImporteFEGACte := 0;
end;

procedure TQRProVema.QRFooterPromotorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
        QRLabel7.Caption := FormatFloat('###,###,###,###,###,##0.00',VLImporteProm);
        QRLabel12.Caption := FormatFloat('###,###,###,###,###,##0.00',VLImporteBinterProm);
        QRLabel25.Caption := FormatFloat('###,###,###,###,###,##0.00',VLImporteFEGAProm);
        VLImporteProm := 0;
        VLImporteBinterProm := 0;
        VLImporteFEGAProm := 0;
end;

procedure TQRProVema.QRBFTIPO_CARTERABeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
        QRLabel26.Caption := FormatFloat('###,###,###,###,###,##0.00',VLImporteTS);
        QRLabel29.Caption := FormatFloat('###,###,###,###,###,##0.00',VLImporteBinterTS);
        QRLabel34.Caption := FormatFloat('###,###,###,###,###,##0.00',VLImporteFEGATS);
        VLImporteTS := 0;
        VLImporteBinterTS := 0;
        VLImporteFEGATS := 0;
end;

procedure TQRProVema.QRBPromAsocBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
        QRLabel40.Caption := FormatFloat('###,###,###,###,###,##0.00',VLImportePromAs);
        QRLabel41.Caption := FormatFloat('###,###,###,###,###,##0.00',VLImporteBinterPromAs);
        QRLabel42.Caption := FormatFloat('###,###,###,###,###,##0.00',VLImporteFEGAPromAs);
        VLImportePromAs := 0;
        VLImporteBinterPromAs := 0;
        VLImporteFEGAPromAs := 0;
end;

end.
