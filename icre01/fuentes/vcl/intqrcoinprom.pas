unit IntQRCOINProm;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, UnSQL2,
  InterApl,IntQRPreview, IntHead, Db, DBTables, QRExport;

type
  TQRCarteraVigProm = class(TQuickRep)
    QCarteVig: TQuery;
    QRBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRBand2: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel4: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText10: TQRDBText;
    QRGroup1: TQRGroup;
    QRGroup3: TQRGroup;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRExcelFilter1: TQRExcelFilter;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand6: TQRBand;
    QRShape2: TQRShape;
    QRDBText11: TQRDBText;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
  private

  public

       Apli : TInterApli;  
       Function DameFechaDWHC(PEMes,PEAnio : Integer): Integer;
       Function ArmaQuery(PEMes,PEAnio : Integer; PETipoRe : String;
                          PTipoCar     : String;
                          PCorteMon    : Boolean): String;

  end;

var
  QRCarteraVigProm: TQRCarteraVigProm;

Procedure RepCarteraVigenteProm(PEMes,PEAnio : Integer;
                                PEMesTxt : String;
                                PETipoRe : String;
                                pAPli     : TInterApli;
                                PTipoCar : String;
                                PCorteMon, pPreview  : Boolean);

implementation

{$R *.DFM}

Procedure RepCarteraVigenteProm(PEMes,PEAnio : Integer;
                                PEMesTxt : String;
                                PETipoRe : String;
                                pAPli     : TInterApli;
                                PTipoCar : String;
                                PCorteMon, pPreview  : Boolean);
Var
   QRCarteraVigProm: TQRCarteraVigProm;
   Preview     : TIntQRPreview;
begin
   QRCarteraVigProm:=TQRCarteraVigProm.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QRCarteraVigProm);
   Try
      QRCarteraVigProm.Apli := pApli;
      QRCarteraVigProm.QRInterEncabezado1.Apli:=pApli;
      QRCarteraVigProm.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QRCarteraVigProm.QRInterEncabezado1.NomReporte:='IntQRCOINProm';
      QRCarteraVigProm.QRInterEncabezado1.Titulo2 := 'Periodo: ' +  PEMesTxt +  ' del ' + IntToStr(PEAnio);

      QRCarteraVigProm.QCarteVig.Active:=False;
      //<LOLS 10 MAR 2006. SE ASIGNA PARAMETROS DEL APLI>
      QRCarteraVigProm.QCarteVig.DatabaseName := pAPli.DataBaseName;
      QRCarteraVigProm.QCarteVig.SessionName  := pAPli.SessionName;
      //</LOLS>

      QRCarteraVigProm.QCarteVig.SQL.Text:= QRCarteraVigProm.ArmaQuery(PEMes,PEAnio,PETipoRe,PTipoCar,PCorteMon);
      QRCarteraVigProm.QCarteVig.Active:=True;

      if PETipoRe = 'AS' then
      begin
         QRCarteraVigProm.QRLabel3.Caption := 'PROMOTOR ASOCIADO';
      end
      else  if PETipoRe = 'BO' then
      begin
         QRCarteraVigProm.QRLabel3.Caption := 'PROMOTOR BONO';
      end;
      //END IF;
      
      If pPreview Then
         QRCarteraVigProm.Preview
      Else
         QRCarteraVigProm.Print;
      //end if

   Finally
      QRCarteraVigProm.free;
      If Assigned(Preview) Then Preview.Free;
   End;

end;


Function TQRCarteraVigProm.DameFechaDWHC(PEMes,PEAnio : Integer): Integer;
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


Function    TQRCarteraVigProm.ArmaQuery(PEMes,PEAnio : Integer; PETipoRe : String;
                                        PTipoCar     : String;
                                        PCorteMon    : Boolean): String;
var
     VlSalida  : String;
     VLFDWHC   : Integer;
     VlDiaFinMes : String;
begin

     VLFDWHC := DameFechaDWHC(PEMes,PEAnio);

     VlDiaFinMes := FormatDateTime('DD',IncMonth(StrToDate('01'+'/'+IntToStr(PEMes)+'/'+InttoStr(PEAnio)) - 1,1));

     if PCorteMon then
        VlSalida := ' SELECT DimCre.MONEDA, ' + #09
     else
        VlSalida := ' SELECT ' + #39 + 'MONEDA INDISTINTA' + #39 + ' AS MONEDA, ' + #09 ;
     //end if;

       VlSalida :=      VlSalida +
                 '        DimCre.ACREDITADO, ';

     IF PETipoRe = 'AS' THEN
       VlSalida :=      VlSalida +
                   '        DimCre.PROMOTOR_ASOCIADO,';
     //END IF;

     IF PETipoRe = 'BO' THEN
       VlSalida :=      VlSalida +
                   '        DimCre.PROMOTOR_BONO AS PROMOTOR_ASOCIADO,';
     //END IF;

     VlSalida :=      VlSalida +
                 '        DimCre.PROMOTOR_ADMIN,' +
                 '        SUM(Imp_SPM_K_VIG + ' +
                 '            Imp_SPM_K_Imp) AS SALDO_PROMEDIO, ' +
                 '        ROUND(SUM(Imp_Comision + (TasFon.TASA_FONDEO * (Imp_SPM_K_VIG + Imp_SPM_K_Imp) * ' + VlDiaFinMes + ' / 36000)),2) AS UTILIDAD ' +
                 ' FROM  (SELECT * FROM DM_CR_FAC_Credito@dwhc FacCre WHERE FacCre.id_anio_mes = ' + IntToStr(VLFDWHC) + ') FacCre, ';

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
                 '        DM_CR_DIM_Mes@dwhc DimMes, ' +
                 '       (select * from CR_COINCRE_TAS_FON) TasFon ' +
                 ' WHERE  FacCre.Id_Credito        = DimCre.Id_Credito ' +
                 ' AND    DimMes.Id_Anio_Mes       = FacCre.Id_Anio_Mes ' +
                 ' AND    TasFon.ID_ANIO_MES       = FacCre.Id_Anio_Mes ' +
                 ' AND    TasFon.CVE_MERC_OBJ_DET  = DimCre.ID_OLTP_MERC_OBJ_DET ' +
                 ' GROUP BY DimCre.MONEDA, ';

     IF PETipoRe = 'AS' THEN
       VlSalida :=      VlSalida +
                 '          DimCre.PROMOTOR_ASOCIADO, ';
     //END IF;

     IF PETipoRe = 'BO' THEN
       VlSalida :=      VlSalida +
                 '          DimCre.PROMOTOR_BONO, ';
     //END IF;

       VlSalida :=      VlSalida +
                 '          DimCre.PROMOTOR_ADMIN, ' +
                 '          DimCre.ACREDITADO ';

     IF PETipoRe = 'AS' THEN
     begin
         if PCorteMon then
            VlSalida :=      VlSalida +
                 ' ORDER BY DimCre.MONEDA, DimCre.PROMOTOR_ASOCIADO, DimCre.PROMOTOR_ADMIN, DimCre.ACREDITADO '
         else
            VlSalida := VlSalida +
                 ' ORDER BY DimCre.PROMOTOR_ASOCIADO, DimCre.PROMOTOR_ADMIN, DimCre.ACREDITADO ';
         //end if;
     end;

     IF PETipoRe = 'BO' THEN
     begin
         if PCorteMon then
            VlSalida :=      VlSalida +
                 ' ORDER BY DimCre.MONEDA, DimCre.PROMOTOR_BONO, DimCre.PROMOTOR_ADMIN, DimCre.ACREDITADO '
         else
            VlSalida := VlSalida +
                 ' ORDER BY DimCre.PROMOTOR_BONO, DimCre.PROMOTOR_ADMIN, DimCre.ACREDITADO ';
         //end if
     end;

     ArmaQuery := VlSalida;

end;


end.
