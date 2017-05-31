unit IntQRCOINABC;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls,
  InterApl,IntQRPreview,  UnSQL2, Db, DBTables, IntHead, QRExport;

type
  TQRCarteraVigABC = class(TQuickRep)
    QCarteVig: TQuery;
    QRBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel3: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText10: TQRDBText;
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand4: TQRBand;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRShape1: TQRShape;
    QRDBText9: TQRDBText;
    QRBand6: TQRBand;
    QRShape2: TQRShape;
    QRDBText11: TQRDBText;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRGroup3: TQRGroup;
    QRDBText4: TQRDBText;
    QRBand5: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExcelFilter1: TQRExcelFilter;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
  private

  public
       Apli : TInterApli;  
       Function DameFechaDWHC(PEMes,PEAnio : Integer): Integer;
       Function ArmaQuery(PEMes,PEAnio : Integer;
                          PTipoCar     : String;
                          PCorteMon    : Boolean): String;
  end;

var
  QRCarteraVigABC: TQRCarteraVigABC;

Procedure RepCarteraVigenteABC(PEMes,PEAnio : Integer;
                               PEMesTxt : String;
                               pAPli     : TInterApli;
                               PTipoCar : String;
                               PCorteMon, pPreview  : Boolean);

implementation

{$R *.DFM}

Procedure RepCarteraVigenteABC(PEMes,PEAnio : Integer;
                               PEMesTxt : String;
                               pAPli     : TInterApli;
                               PTipoCar : String;
                               PCorteMon, pPreview  : Boolean);
Var
   QRCarteraVig: TQRCarteraVigABC;
   Preview     : TIntQRPreview;
begin
   QRCarteraVig:=TQRCarteraVigABC.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QRCarteraVig);
   Try
      QRCarteraVig.Apli := pApli;
      QRCarteraVig.QRInterEncabezado1.Apli:=pApli;
      QRCarteraVig.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QRCarteraVig.QRInterEncabezado1.NomReporte:='IntQRCOINABC';
      QRCarteraVig.QRInterEncabezado1.Titulo2 := 'Periodo: ' +  PEMesTxt +  ' del ' + IntToStr(PEAnio);

      QRCarteraVig.QCarteVig.Active:=False;
      //<LOLS 10 MAR 2006. SE ASIGNA PARAMETROS DEL APLI>
      QRCarteraVig.QCarteVig.DatabaseName := pAPli.DataBaseName;
      QRCarteraVig.QCarteVig.SessionName  := pAPli.SessionName;
      //</LOLS>

      QRCarteraVig.QCarteVig.SQL.Text:= QRCarteraVig.ArmaQuery(PEMes,PEAnio,PTipoCar,PCorteMon);
      QRCarteraVig.QCarteVig.Active:=True;

      If pPreview Then
         QRCarteraVig.Preview
      Else
         QRCarteraVig.Print;
      //end if

   Finally
      QRCarteraVig.free;
      If Assigned(Preview) Then Preview.Free;
   End;

end;

Function TQRCarteraVigABC.DameFechaDWHC(PEMes,PEAnio : Integer): Integer;
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


Function    TQRCarteraVigABC.ArmaQuery(PEMes,PEAnio : Integer;
                                       PTipoCar     : String;
                                       PCorteMon    : Boolean): String;
var
     VlSalida  : String;
     VLFDWHC   : Integer;
     VlDiaFinMes : String;
begin

     VLFDWHC := DameFechaDWHC(PEMes,PEAnio);

     VlDiaFinMes := FormatDateTime('DD',IncMonth(StrToDate('01'+'/'+IntToStr(PEMes)+'/'+InttoStr(PEAnio)),1)-1);

     if PCorteMon then
        VlSalida := ' SELECT DimCre.MONEDA, ' + #09
     else
        VlSalida := ' SELECT ' + #39 + 'MONEDA INDISTINTA' + #39 + ' AS MONEDA, ' + #09 ;
     //end if;

     VlSalida := VlSalida +
                 '        DimCre.ACREDITADO,' +
                 '        DimCre.PROMOTOR_ADMIN,' +
                 '        DimCre.MERC_OBJ_DET,' +
                 '        SUM(Imp_SPM_K_VIG_VP + ' + #09 +
                 '            Imp_SPM_K_Imp_VP) AS SALDO_PROMEDIO, ' + #09 +
                 '        SUM(Imp_Comision_VP) AS COMISIONES, ' + #09 +
                 '        ROUND(SUM( IMP_IO_DEV_VP - (TasFon.TASA_FONDEO * (Imp_SPM_K_VIG_VP + Imp_SPM_K_Imp_VP) * ' + VlDiaFinMes + ' / 36000)),2) AS MARGEN, ' + #09 +
                 '        ROUND(SUM((IMP_IO_DEV_VP - (TasFon.TASA_FONDEO * (Imp_SPM_K_VIG_VP + Imp_SPM_K_Imp_VP) * ' + VlDiaFinMes + ' / 36000)) + Imp_Comision_VP),2) AS UTILIDAD, ' + #09 +
                 '        DECODE(SUM(Imp_SPM_K_VIG_VP + Imp_SPM_K_Imp_VP),0,0, ' + #09 +
                 '        ((((  SUM(IMP_IO_DEV_VP - (TasFon.TASA_FONDEO * (Imp_SPM_K_VIG_VP + Imp_SPM_K_Imp_VP) * ' + VlDiaFinMes + ' / 36000)))/(SUM(Imp_SPM_K_VIG_VP + Imp_SPM_K_Imp_VP))) * 36000 ) / ' + VlDiaFinMes  + ')  ' +
                 '        ) MARGEN_P ' + #09 +
                 ' FROM  (SELECT * FROM DM_CR_FAC_Credito@dwhc FacCre WHERE FacCre.id_anio_mes = ' + IntToStr(VLFDWHC) + ') FacCre,';
     if PTipoCar = 'BA' then
         VlSalida := VlSalida +
                     '       (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE DimCre.CVE_TIPO_CARTERA  = ' + #39 + 'BANCAR' + #39 + ') DimCre, ' + #09
     else if PTipoCar = 'NB' then
         VlSalida := VlSalida +
                     '       (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE DimCre.CVE_TIPO_CARTERA  <> ' + #39 + 'BANCAR' + #39 + ') DimCre, ' + #09
     else
         VlSalida := VlSalida +
                     '       (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre) DimCre, ' + #09;
     //end if
     VlSalida := VlSalida +
                 '        DM_CR_DIM_Mes@dwhc DimMes,' +
                 '       (select * from CR_COINCRE_TAS_FON) TasFon' +
                 ' WHERE  FacCre.Id_Credito        = DimCre.Id_Credito' +
                 ' AND    DimMes.Id_Anio_Mes       = FacCre.Id_Anio_Mes' +
                 ' AND    TasFon.ID_ANIO_MES       = FacCre.Id_Anio_Mes' +
                 ' AND    TasFon.CVE_MERC_OBJ_DET  = DimCre.ID_OLTP_MERC_OBJ_DET' +
                 ' GROUP BY DimCre.MONEDA, ' +
                 '          DimCre.ACREDITADO,' +
                 '          DimCre.PROMOTOR_ADMIN,' +
                 '          DimCre.MERC_OBJ_DET';
     if PCorteMon then
        VlSalida := VlSalida +
                 ' ORDER BY DimCre.MONEDA, DimCre.MERC_OBJ_DET, DimCre.PROMOTOR_ADMIN, DimCre.ACREDITADO'
     else
        VlSalida := VlSalida +
                 ' ORDER BY DimCre.MERC_OBJ_DET, DimCre.PROMOTOR_ADMIN, DimCre.ACREDITADO';
     //end if;


     ArmaQuery := VlSalida;

end;

end.
