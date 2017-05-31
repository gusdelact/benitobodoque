unit IntQRCOINCV;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  InterApl,IntQRPreview, IntHead, UnSQL2, QRExport;

type
  TQRCarteraVig = class(TQuickRep)
    QCarteVig: TQuery;
    QRBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr6: TQRExpr;
    QRShape1: TQRShape;
    QRExcelFilter1: TQRExcelFilter;
    QRDBText10: TQRDBText;
    QRBand6: TQRBand;
    QRDBText11: TQRDBText;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr15: TQRExpr;
    QRBand5: TQRBand;
    QRShape3: TQRShape;
    QRExpr2: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QCarteVigMONEDA: TStringField;
    QCarteVigACREDITADO: TStringField;
    QCarteVigMERC_OBJ_DET: TStringField;
    QCarteVigPROMOTOR_ASOCIADO: TStringField;
    QCarteVigPROMOTOR_ADMIN: TStringField;
    QCarteVigSALDO_INSOLUTO: TFloatField;
    QCarteVigSALDO_PROMEDIO: TFloatField;
    QCarteVigCOMISIONES: TFloatField;
    QCarteVigMARGEN: TFloatField;
    QCarteVigUTILIDAD: TFloatField;
    QCarteVigMARGEN_P: TFloatField;
    QRShape2: TQRShape;
  private

  public
       Apli : TInterApli;
       Function DameFechaDWHC(PEMes,PEAnio : Integer): Integer;
       Function ArmaQuery(PEMes,PEAnio : Integer;
                          PTipoCar     : String;
                          PCorteMon    : Boolean): String;

  end;

var
  QRCarteraVig: TQRCarteraVig;

Procedure RepCarteraVigente(PEMes,PEAnio : Integer;
                            PEMesTxt : String;
                            pAPli    : TInterApli;
                            PTipoCar : String;
                            PCorteMon, pPreview, Detalle  : Boolean);

implementation

{$R *.DFM}

Procedure RepCarteraVigente(PEMes,PEAnio : Integer;
                            PEMesTxt : String;
                            pAPli     : TInterApli;
                            PTipoCar : String;
                            PCorteMon, pPreview, Detalle  : Boolean);
Var
   QRCarteraVig: TQRCarteraVig;
   Preview     : TIntQRPreview;
begin
   QRCarteraVig:=TQRCarteraVig.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QRCarteraVig);
   Try
      QRCarteraVig.Apli := pApli;
      QRCarteraVig.QRInterEncabezado1.Apli:=pApli;
      QRCarteraVig.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QRCarteraVig.QRInterEncabezado1.NomReporte:='IntQRCOINCV';
      QRCarteraVig.QRInterEncabezado1.Titulo2 := 'Periodo: ' +  PEMesTxt +  ' del ' + IntToStr(PEAnio);

      QRCarteraVig.QCarteVig.Active:=False;
      //<LOLS 10 MAR 2006. SE ASIGNA PARAMETROS DEL APLI>
      QRCarteraVig.QCarteVig.DatabaseName := pAPli.DataBaseName;
      QRCarteraVig.QCarteVig.SessionName  := pAPli.SessionName;
      //</LOLS>

      QRCarteraVig.QCarteVig.SQL.Text:= QRCarteraVig.ArmaQuery(PEMes,PEAnio,PTipoCar,PCorteMon);
      QRCarteraVig.QCarteVig.SQL.SaveToFile('c:\IntQRCOINCV.txt');
      QRCarteraVig.QCarteVig.Active:=True;

      QRCarteraVig.QRBand3.Enabled := Detalle;

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

Function TQRCarteraVig.DameFechaDWHC(PEMes,PEAnio : Integer): Integer;
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


Function    TQRCarteraVig.ArmaQuery(PEMes,PEAnio : Integer;
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
        VlSalida := ' SELECT DimCre.MONEDA, '
     else
        VlSalida := ' SELECT ' + #39 + 'MONEDA INDISTINTA' + #39 + ' AS MONEDA, ';
     //end if;

     VlSalida := VlSalida +
                 '        DimCre.ACREDITADO, ' +
                 '        DimCre.MERC_OBJ_DET, ' +
                 '        DimCre.PROMOTOR_ASOCIADO, ' +
                 '        DimCre.PROMOTOR_ADMIN, ' +
                 '        SUM(Imp_Sdo_K_Vig_VP + ' +
                 '            Imp_Sdo_IO_Imp_VP + ' +
                 '            Imp_Sdo_K_Imp_VP + ' +
                 '            Imp_Int_Corte_VP - ' +
                 '            IMP_INT_COB_ANT_VP)  AS SALDO_INSOLUTO, ' +
                 '        SUM(Imp_SPM_K_VIG_VP + ' +
                 '            Imp_SPM_K_Imp_VP) AS SALDO_PROMEDIO, ' +
                 '        SUM(Imp_Comision_VP) AS COMISIONES, ' +
                 '        ROUND(SUM( IMP_IO_DEV_VP - (1 * (Imp_SPM_K_VIG_VP + Imp_SPM_K_Imp_VP) * ' + VlDiaFinMes + ' / 36000)),2) AS MARGEN, ' +
                 '        ROUND(SUM((IMP_IO_DEV_VP - (1 * (Imp_SPM_K_VIG_VP + Imp_SPM_K_Imp_VP) * ' + VlDiaFinMes + ' / 36000)) + Imp_Comision_VP),2) AS UTILIDAD, ' +
                 '        DECODE(SUM(Imp_SPM_K_VIG_VP + Imp_SPM_K_Imp_VP),0,0, ' +
                 '        ((((  SUM(IMP_IO_DEV_VP - (1 * (Imp_SPM_K_VIG_VP + Imp_SPM_K_Imp_VP) * ' + VlDiaFinMes + ' / 36000)))/(SUM(Imp_SPM_K_VIG_VP + Imp_SPM_K_Imp_VP))) * 36000 ) / ' + VlDiaFinMes  + ')  ' +
                 '        ) MARGEN_P ' +
                 ' FROM  (SELECT * FROM DM_CR_FAC_Credito@dwhc FacCre WHERE FacCre.id_anio_mes = ' + IntToStr(VLFDWHC) + ') FacCre, ';

     if PTipoCar = 'BA' then
         VlSalida := VlSalida +
                     '       (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE DimCre.CVE_TIPO_CARTERA  = ' + #39 + 'BANCAR' + #39 + ') DimCre, '
     else if PTipoCar = 'NB' then
         VlSalida := VlSalida +
                     '       (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE DimCre.CVE_TIPO_CARTERA  <> ' + #39 + 'BANCAR' + #39 + ') DimCre, '
     else
         VlSalida := VlSalida +
                     '       (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre) DimCre, ';
     //end if

     VlSalida := VlSalida +
                 '        DM_CR_DIM_Mes@dwhc DimMes ' +
{ROIM 27/09/2007 SE ELIMINA LA LIGA CON LA TABLA DE FONDEO, YA QUE NO APLICA PARA EL CALCULO DE ESTE REPORTE}
//                 '       (select * from CR_COINCRE_TAS_FON WHERE ID_ANIO_MES = ' + IntToStr(VLFDWHC) + ') TasFon ' +
                 ' WHERE  FacCre.Id_Credito        = DimCre.Id_Credito ' +
                 ' AND    DimMes.Id_Anio_Mes       = FacCre.Id_Anio_Mes ' +
//                 ' AND    TasFon.ID_ANIO_MES       = FacCre.Id_Anio_Mes ' +
//                 ' AND    TasFon.CVE_MERC_OBJ_DET  = DimCre.ID_OLTP_MERC_OBJ_DET ' +
//                 ' AND    TasFon.CVE_ORI_REC_DET   = DimCre.ID_OLTP_ORI_REC_DET ' +
{/ROIM}
                 ' GROUP BY DimCre.MONEDA, ' +
                 '          DimCre.MERC_OBJ_DET, ' +
                 '          DimCre.ACREDITADO, ' +
                 '          DimCre.PROMOTOR_ASOCIADO, ' +
                 '          DimCre.PROMOTOR_ADMIN ' ;


     if PCorteMon then
        VlSalida := VlSalida +
                 ' ORDER BY DimCre.MONEDA, DimCre.MERC_OBJ_DET, DimCre.ACREDITADO, DimCre.PROMOTOR_ASOCIADO,   DimCre.PROMOTOR_ADMIN  '
     else
        VlSalida := VlSalida +
                 ' ORDER BY DimCre.MERC_OBJ_DET, DimCre.ACREDITADO , DimCre.PROMOTOR_ASOCIADO,   DimCre.PROMOTOR_ADMIN ';
     //end if;

     ArmaQuery := VlSalida;

end;

end.
