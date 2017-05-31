unit IntQRCOINRie;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls,IntQRPreview, IntHead,
  QRExport, Db, DBTables, InterApl,UnSQL2;

type
  TQRCarteraRie = class(TQuickRep)
    QRBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QCarteVig: TQuery;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QCarteVigCLAVE_MERCADO_OBJETIVO: TStringField;
    QCarteVigMERCADO_OBJETIVO: TStringField;
    QCarteVigCLAVE_MONEDA: TFloatField;
    QCarteVigMONEDA: TStringField;
    QCarteVigCLAVE_SECTOR: TStringField;
    QCarteVigSECTOR: TStringField;
    QCarteVigCLAVE_TASA: TStringField;
    QCarteVigTASA_CREDITO: TStringField;
    QCarteVigCLAVE_SECTOR_ECO: TStringField;
    QCarteVigSECTOR_ECO: TStringField;
    QCarteVigCAPITAL_VIGENTE: TFloatField;
    QCarteVigSALDO_INSOLUTO: TFloatField;
    QCarteVigID_ACREDITADO: TFloatField;
    QCarteVigACREDITADO: TStringField;
    QCarteVigCREDITO: TStringField;
    QCarteVigDESC_POBLACION: TStringField;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRExcelFilter1: TQRExcelFilter;
    QCarteVigGRUPO_ECO: TStringField;
    QRLabel15: TQRLabel;
    QRDBText15: TQRDBText;
  private
    Apli      : TInterApli;
    Function    DameFechaDWHC(PEMes,PEAnio : Integer): Integer;
    Function    ArmaQuery(PEMes,PEAnio : Integer;
                          PTipoCar     : String;
                          PCorteMon    : Boolean): String;

  public

  end;

var
  QRCarteraRie: TQRCarteraRie;

Procedure RepCarteraRie(PEMes,PEAnio : Integer;
                        PEMesTxt : String;
                        pAPli    : TInterApli;
                        PTipoCar : String;
                        PCorteMon, pPreview, Detalle  : Boolean);


implementation

{$R *.DFM}

Procedure RepCarteraRie(PEMes,PEAnio : Integer;
                        PEMesTxt : String;
                        pAPli    : TInterApli;
                        PTipoCar : String;
                        PCorteMon, pPreview, Detalle  : Boolean);
Var
   QRCarteraRie: TQRCarteraRie;
   Preview     : TIntQRPreview;
begin
   QRCarteraRie:=TQRCarteraRie.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QRCarteraRie);
   Try
      QRCarteraRie.Apli := pApli;
      QRCarteraRie.QRInterEncabezado1.Apli:=pApli;
      QRCarteraRie.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QRCarteraRie.QRInterEncabezado1.NomReporte:='IntQRCOINRie';
      QRCarteraRie.QRInterEncabezado1.Titulo2 := 'Periodo: ' +  PEMesTxt +  ' del ' + IntToStr(PEAnio);

      QRCarteraRie.QCarteVig.Active:=False;
      //<LOLS 10 MAR 2006. SE ASIGNA PARAMETROS DEL APLI>
      QRCarteraRie.QCarteVig.DatabaseName := pAPli.DataBaseName;
      QRCarteraRie.QCarteVig.SessionName  := pAPli.SessionName;
      //</LOLS>

      QRCarteraRie.QCarteVig.SQL.Text:= QRCarteraRie.ArmaQuery(PEMes,PEAnio,PTipoCar,PCorteMon);
      QRCarteraRie.QCarteVig.Active:=True;



      If pPreview Then
         QRCarteraRie.Preview
      Else
         QRCarteraRie.Print;
      //end if

   Finally
      QRCarteraRie.free;
      If Assigned(Preview) Then Preview.Free;
   End;



end;

Function    TQRCarteraRie.ArmaQuery(PEMes,PEAnio : Integer;
                                    PTipoCar     : String;
                                    PCorteMon    : Boolean): String;
var
     VlSalida  : String;
     VLFDWHC   : Integer;
     VlDiaFinMes : String;
begin

     VLFDWHC := DameFechaDWHC(PEMes,PEAnio);

     VlDiaFinMes := FormatDateTime('DD',IncMonth(StrToDate('01'+'/'+IntToStr(PEMes)+'/'+InttoStr(PEAnio)),1)-1);

     VlSalida := VlSalida +

          ' SELECT * FROM ' + #09 +
          ' ( ' + #09 +
          ' SELECT ' + #09 +
          '       DimCre.ID_OLTP_MERC_OBJ_DET AS CLAVE_MERCADO_OBJETIVO, ' + #09 +
          '       DimCre.MERC_OBJ_DET AS MERCADO_OBJETIVO, ' + #09 +
          '       DimCre.ID_OLTP_MONEDA AS CLAVE_MONEDA, ' + #09 +
          '       DimCre.MONEDA, ' + #09 +
          '       PER.CVE_TIPO_SECTOR AS CLAVE_SECTOR, ' + #09 +
          '       SEC.DESC_SECTOR AS SECTOR, ' + #09 +
          '       CICRE.CVE_TASA_REFER AS CLAVE_TASA, ' + #09 +
          '       TI_CICRE.DESC_TASA_INDIC AS TASA_CREDITO, ' + #09 +
          '       SEC_EC.CVE_SECTOR_ECO AS CLAVE_SECTOR_ECO, ' + #09 +
          '       SEC_EC.DESC_SECTOR_ECO AS SECTOR_ECO, ' + #09 +
          '       GE.DESC_GRUPO_ECO AS GRUPO_ECO, ' + #09 +
          '       FacCre.Imp_Sdo_K_Vig_VP CAPITAL_VIGENTE, ' + #09 +
          '      (FacCre.Imp_Sdo_K_Vig_VP + ' + #09 +
          '       FacCre.Imp_Sdo_K_Imp_VP + ' + #09 +
          '       FacCre.IMP_SDO_K_VEN + ' + #09 +
          '       FacCre.Imp_Int_Corte_VP + ' + #09 +
          '       FacCre.Imp_Sdo_IO_Imp_VP + ' + #09 +
          '       FacCre.IMP_INT_DEV_VDO - ' + #09 +
          '       FacCre.IMP_INT_COB_ANT_VP) SALDO_INSOLUTO, ' + #09 +
          '       DimCre.ID_OLTP_ACREDITADO AS ID_ACREDITADO, ' + #09 +
          '       DimCre.ACREDITADO, ' + #09 +
          '       DimCre.CREDITO, ' + #09 +
          '       pob.DESC_POBLACION ' + #09 +
          //<LOLS 16 OCT 2006. SE QUITA LA CONSTANTE 306 PARA EL ANIO MES>
          //' from (SELECT * FROM DM_CR_FAC_Credito@dwhc WHERE ID_ANIO_MES = 306) FacCre, ' + #09 ;
          ' from (SELECT * FROM DM_CR_FAC_Credito@dwhc WHERE ID_ANIO_MES = ' + IntToStr(VLFDWHC) + ') FacCre, ' + #09 ;
          //</LOLS>
     if PTipoCar = 'BA' then
         VlSalida := VlSalida +
                     '       (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE DimCre.CVE_TIPO_CARTERA  = ' + #39 + 'BANCAR' + #39 + ' AND ORIGEN_INFO = ' + #39 + 'ICRE' + #39 + ') DimCre, ' + #09
     else if PTipoCar = 'NB' then
         VlSalida := VlSalida +
                     '       (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE DimCre.CVE_TIPO_CARTERA  <> ' + #39 + 'BANCAR' + #39 + ' AND ORIGEN_INFO = ' + #39 + 'ICRE' + #39 + ') DimCre, ' + #09
     else
         VlSalida := VlSalida +
                     '       (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE ORIGEN_INFO = ' + #39 + 'ICRE' + #39 + ') DimCre, ' + #09;
     //end if
     VlSalida := VlSalida +
          '      (SELECT * FROM PERSONA)  PER, ' + #09 +
          '      (SELECT * FROM SECTOR) SEC, ' + #09 +
          '      (SELECT * FROM CR_CREDITO) CICRE, ' + #09 +
          '      (SELECT * FROM TASA_INDIC_FINAN) TI_CICRE, ' + #09 +
          '      (SELECT * FROM CONTRATO) CONT, ' + #09 +
          '      (SELECT * FROM domicilio) dom, ' + #09 +
          '      (SELECT * FROM poblacion) pob, ' + #09 +
          '      (select * from CR_ACREDITADO) CLI, ' + #09 +
          '      (SELECT * FROM CR_GRUPO_ECO) GE, ' + #09 +
          '      (select * FROM cr_sector_eco) SEC_EC ' + #09 +
          ' where FacCre.ID_CREDITO = DimCre.ID_CREDITO ' + #09 +
          ' AND   PER.ID_PERSONA = DimCre.ID_OLTP_ACREDITADO ' + #09 +
          ' AND   SEC.CVE_SECTOR = PER.CVE_TIPO_SECTOR ' + #09 +
          ' AND   CICRE.ID_CREDITO (+)= DimCre.CREDITO ' + #09 +
          ' AND   TI_CICRE.CVE_TASA_INDICAD (+)= CICRE.CVE_TASA_REFER ' + #09 +
          ' AND   CONT.ID_CONTRATO = CICRE.ID_CONTRATO ' + #09 +
          ' AND   DOM.ID_DOMICILIO = CONT.ID_DOMICILIO ' + #09 +
          ' AND   dom.cve_estado = pob.cve_poblacion ' + #09 +
          ' AND   CLI.ID_ACREDITADO = DimCre.ID_OLTP_ACREDITADO ' + #09 +
          ' AND   SEC_EC.CVE_SECTOR_ECO = CLI.CVE_SECTOR_ECO ' + #09 +
          ' AND   GE.CVE_GRUPO_ECO (+)= CLI.CVE_GRUPO_ECO ' + #09 +
          ' UNION ALL ' + #09 +
          ' SELECT ' + #09 +
          '       DimCre.ID_OLTP_MERC_OBJ_DET AS CLAVE_MERCADO_OBJETIVO, ' + #09 +
          '       DimCre.MERC_OBJ_DET AS MERCADO_OBJETIVO, ' + #09 +
          '       DimCre.ID_OLTP_MONEDA AS CLAVE_MONEDA, ' + #09 +
          '       DimCre.MONEDA, ' + #09 +
          '       PER.CVE_TIPO_SECTOR AS CLAVE_SECTOR, ' + #09 +
          '       SEC.DESC_SECTOR AS SECTOR, ' + #09 +
          '       CCRED.CVE_TASA_REFER AS CLAVE_TASA, ' + #09 +
          '       TI_CCRED.DESC_TASA_INDIC AS TASA_CREDITO, ' + #09 +
          '       SEC_EC.CVE_SECTOR_ECO AS CLAVE_SECTOR_ECO, ' + #09 +
          '       SEC_EC.DESC_SECTOR_ECO AS SECTOR_ECO, ' + #09 +
          //<LOLS 12 OCT 2006. SE INCLUYE DESCRIPCION DE GRUPO ECONOMICO>
          //'       NULL AS GRUPO_ECO, ' + #09 +
          '       GE.DESC_GRUPO AS GRUPO_ECO, ' + #09 +
          //</LOLS>
          '       FacCre.Imp_Sdo_K_Vig_VP CAPITAL_VIGENTE, ' + #09 +
          '      (FacCre.Imp_Sdo_K_Vig_VP + ' + #09 +
          '       FacCre.Imp_Sdo_K_Imp_VP + ' + #09 +
          '       FacCre.IMP_SDO_K_VEN + ' + #09 +
          '       FacCre.Imp_Int_Corte_VP + ' + #09 +
          '       FacCre.Imp_Sdo_IO_Imp_VP + ' + #09 +
          '       FacCre.IMP_INT_DEV_VDO - ' + #09 +
          '       FacCre.IMP_INT_COB_ANT_VP) SALDO_INSOLUTO, ' + #09 +
          '       DimCre.ID_OLTP_ACREDITADO AS ID_ACREDITADO, ' + #09 +
          '       DimCre.ACREDITADO, ' + #09 +
          '       DimCre.CREDITO, ' + #09 +
          '       pob.DESC_POBLACION ' + #09 +
          //<LOLS 16 OCT 2006. SE QUITA LA CONSTANTE 306 PARA EL ANIO MES>
          //' from (SELECT * FROM DM_CR_FAC_Credito@dwhc WHERE ID_ANIO_MES = 306) FacCre, ' + #09 ;
          ' from (SELECT * FROM DM_CR_FAC_Credito@dwhc WHERE ID_ANIO_MES = ' + IntToStr(VLFDWHC) + ') FacCre, ' + #09 ;
          //</LOLS>
     if PTipoCar = 'BA' then
         VlSalida := VlSalida +
                     '       (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE DimCre.CVE_TIPO_CARTERA  = ' + #39 + 'BANCAR' + #39 + ' AND ORIGEN_INFO = ' + #39 + 'INTERCREDITOS' + #39 + ') DimCre, ' + #09
     else if PTipoCar = 'NB' then
         VlSalida := VlSalida +
                     '       (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE DimCre.CVE_TIPO_CARTERA  <> ' + #39 + 'BANCAR' + #39 + ' AND ORIGEN_INFO = ' + #39 + 'INTERCREDITOS' + #39 + ') DimCre, ' + #09
     else
         VlSalida := VlSalida +
                     '       (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE ORIGEN_INFO = ' + #39 + 'INTERCREDITOS' + #39 + ') DimCre, ' + #09;
     //end if
     VlSalida := VlSalida +
          '      (SELECT * FROM PERSONA)  PER, ' + #09 +
          '      (SELECT * FROM SECTOR) SEC, ' + #09 +
          '      (SELECT * FROM CRE_CREDITO) CCRED, ' + #09 +
          '      (SELECT * FROM TASA_INDIC_FINAN) TI_CCRED, ' + #09 +
          '      (SELECT * FROM CONTRATO) CONT, ' + #09 +
          '      (SELECT * FROM domicilio) dom, ' + #09 +
          '      (SELECT * FROM poblacion) pob, ' + #09 +
          '      (select * from cre_cliente) CLI, ' + #09 +
          //<LOLS 12 OCT 2006. SE INCLUYE DESCRIPCION DE GRUPO ECONOMICO>
          '      (SELECT * FROM CRE_GRUPO_EMPR) GE, ' + #13#10 +
          //</LOLS>
          '      (select * FROM cre_sector_eco) SEC_EC ' + #09 +
          ' where FacCre.ID_CREDITO = DimCre.ID_CREDITO ' + #09 +
          ' AND   PER.ID_PERSONA = DimCre.ID_OLTP_ACREDITADO ' + #09 +
          ' AND   SEC.CVE_SECTOR = PER.CVE_TIPO_SECTOR ' + #09 +
          ' AND   CCRED.ID_CREDITO (+)= DimCre.CREDITO ' + #09 +
          ' AND   TI_CCRED.CVE_TASA_INDICAD (+)= CCRED.CVE_TASA_REFER ' + #09 +
          ' AND   CONT.ID_CONTRATO = CCRED.ID_CONTRATO ' + #09 +
          ' AND   DOM.ID_DOMICILIO = CONT.ID_DOMICILIO ' + #09 +
          ' AND   dom.cve_estado = pob.cve_poblacion ' + #09 +
          ' AND   CLI.ID_PERSONA = DimCre.ID_OLTP_ACREDITADO ' + #09 +
          ' AND   SEC_EC.CVE_SECTOR_ECO = CLI.CVE_SECTOR_ECO ' + #09 +
          //<LOLS 12 OCT 2006. SE INCLUYE DESCRIPCION DE GRUPO ECONOMICO>
          ' AND   GE.CVE_GRUPO  (+)= CLI.CVE_GRUPO ' + #09 +
          //</LOLS>
          ' ) ORDER BY  CLAVE_MERCADO_OBJETIVO, ACREDITADO, CREDITO ' + #09 ;
     ArmaQuery := VlSalida;

end;

Function TQRCarteraRie.DameFechaDWHC(PEMes,PEAnio : Integer): Integer;
var vlQry : TQuery;
    vlsql : String;
    VLSalida : Integer;
begin
     VLSalida := 0;
     vlsql:= ' SELECT ID_ANIO_MES ' +
             ' FROM   DM_CR_DIM_Mes@dwhc ' +
             ' WHERE ANIO  = ' + IntToStr(PEAnio) +
             '   AND NUM_MES  = ' + IntToStr(PEMes);

     vlQry := GetSQLQuery(vlsql,Apli.DataBaseName, Apli.SessionName, True );
     try
        if vlQry <> nil then
        Begin
             VLSalida := vlQry.FieldByName('ID_ANIO_MES').AsInteger;
        end
        else
        Begin
             VLSalida := 0;
        end;
     finally
       if vlQry <> nil then
          vlQry.free;
       //end if
     end;
//     VLSalida := 225;
     DameFechaDWHC := VLSalida;
end;


end.
