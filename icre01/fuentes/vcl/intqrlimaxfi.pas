unit IntQrLiMaxFi;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview,QRPrntr, Printers, IntGenCre, UnSQL2;

type
  TQrLiMaxFi = class(TQuickRep)
    QrGpoAutoriazcion: TQRGroup;
    GpoCredito: TQRGroup;
    QRGroupDATOS: TQRGroup;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRL12: TQRLabel;
    QRL15: TQRLabel;
    QRL25: TQRLabel;
    QRL40: TQRLabel;
    QRL30: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    qrlCapBasicoIni: TQRLabel;
    qrlINDICE: TQRLabel;
    qrlCapBasicoFin: TQRLabel;
    qrlLIM_CP_BAS: TQRLabel;
    qrlLIM_MONTO: TQRLabel;
    qrlPCT_EXTENDIDO: TQRLabel;
    qrlSDO_INSOLUTO: TQRLabel;
    qrlPCT_EXCEDE: TQRLabel;
    s1DatosAcred: TQRShape;
    s2DatosAcred: TQRShape;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel9: TQRLabel;
    qrlEXCEDE: TQRLabel;
    qrlTOT_PCT_EXTENDIDO: TQRLabel;
    qrSUM_LIM_MONTO: TQRLabel;
    QRLabel12: TQRLabel;
    qrlSDO_INSOLUTO2: TQRLabel;
    qyQuery: TQuery;
    qyQuerySDO_INSOLUTO: TFloatField;
    QRLabel11: TQRLabel;
  private

  public
     Function  FormaQuery(sFecha, sEmpresa, sRegMin, sExSector : String ): String;
     Procedure ObtLimiteMaxFinan( sFecha, sEmpresa, sCap_Basico, sIndice, sRegMin, sExSector : String; pAPli : TInterApli );
     Function  ObtSumSdoInsol(sFecha, sEmpresa, sRegMin, sExSector : String; pAPli : TInterApli): Double;
     Function  ObtMaxSdoInsol(sFecha, sEmpresa, sRegMin, sExSector : String; pAPli : TInterApli): Double;
  end;

var
  Apli : TInterApli;
  QrLiMaxFi: TQrLiMaxFi;
  sArchivo:String;
  sCapBas :String;
  F: TextFile;

Procedure RepLimMaxFinanc( sFecha, sCap_Basico, sIndice, sRegMin, sEmpresa, sSucursal, sExSector: String;
                           pAPli : TInterApli; pPreview : Boolean);
Implementation

{$R *.DFM}

Procedure RepLimMaxFinanc( sFecha, sCap_Basico, sIndice, sRegMin, sEmpresa, sSucursal, sExSector: String;
                           pAPli : TInterApli; pPreview : Boolean);
Var
    QrLimMaxFin : TQrLiMaxFi;
    Preview     : TIntQRPreview;
    vlFTrim     : String;
Begin

    QrLimMaxFin := TQrLiMaxFi.Create(Nil);
    Preview     := TIntQRPreview.CreatePreview(Application, QrLimMaxFin);
    Apli        := pAPli;
    sCapBas     := sCap_Basico;

    Try
        //ENCABEZADO 1
        QrLimMaxFin.QRInterEncabezado1.Apli:=pApli;
        QrLimMaxFin.QRInterEncabezado1.FechaInfor := StrToDateTime(sFecha);
        QrLimMaxFin.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrLimMaxFin.QRInterEncabezado1.NomReporte:='IntQrLiMaxFi';
        QrLimMaxFin.QRInterEncabezado1.Titulo1:='Límite Máximo de Financiamiento';
        QrLimMaxFin.QRInterEncabezado1.Titulo2:= sFecha;

        //ENCABEZADO 2
        QrLimMaxFin.qrlCapBasicoIni.Caption := FormatFloat('###,###,###,###,##0',Round(StrToFloat(sCap_Basico)));
        QrLimMaxFin.qrSUM_LIM_MONTO.Caption := FormatFloat('###,###,###,###,##0',Round(StrToFloat(sCap_Basico)));
        QrLimMaxFin.qrlINDICE.Caption := sIndice + ' %';
        QrLimMaxFin.ObtLimiteMaxFinan( sFecha, sEmpresa, sCap_Basico, sIndice ,  sRegMin, sExSector, pAPli );

        GetSQLStr('SELECT TO_CHAR('+ SQLFecha(StrToDateTime(sFecha))+ ', ''MON-YY'')FECHA FROM DUAL',
                   pApli.DataBaseName, pApli.SessionName,'FECHA',vlFTrim,False);

        //
        QrLimMaxFin.qyQuery.DatabaseName := pApli.DataBaseName;
        QrLimMaxFin.qyQuery.SessionName := pApli.SessionName;
        QrLimMaxFin.qyQuery.Active:=False;
        QrLimMaxFin.qyQuery.SQL.Text:= QrLimMaxFin.FormaQuery( sFecha, sEmpresa,  sRegMin, sExSector);
        QrLimMaxFin.qyQuery.SQL.SaveToFile('c:\LimMaxFinan.txt');
        QrLimMaxFin.qyQuery.Active:=True;

        If pPreview Then
            QrLimMaxFin.Preview
        Else
            QrLimMaxFin.Print;

    Finally
        QrLimMaxFin.free;
    End;
End;


function TQrLiMaxFi.FormaQuery(sFecha, sEmpresa, sRegMin, sExSector: String): String;
Var
   sSQL :String;
begin
   sSQL := ' SELECT SDO_INSOLUTO'+ coCRLF +
           ' FROM ( ' + FormaQueryLimFin( StrToDateTime(sFecha), sEmpresa, sRegMin, sExSector) + ' ) '+ coCRLF;
   Result:= sSQL;
end;

Procedure TQrLiMaxFi.ObtLimiteMaxFinan( sFecha, sEmpresa, sCap_Basico, sIndice,  sRegMin, sExSector : String; pAPli : TInterApli );
Var SQL     : String;
    vlValor : String;
    vlLimMonto: Double;
    vlPCT_EXT, iPctExc : Double;
Begin
   vlLimMonto := 0;
   vlPCT_EXT := 0;
   SQL:= ' SELECT MIN(TO_NUMBER(VALOR)) VALOR'+ coCRLF +
         ' FROM CR_GRUPO_CLAVE '+ coCRLF +
         ' WHERE CVE_GRUPO_CLAVE = ''LIMFIN'' '+ coCRLF +
         '   AND TO_NUMBER(CVE_REFERENCIA) >= '+ sIndice + coCRLF;
   GetSQLStr(SQL,pApli.DataBaseName, pApli.SessionName,'VALOR',vlValor,False);

   qrlCapBasicoFin.Enabled := True;

   if vlValor > '0' then Begin
      vlLimMonto              := Round( StrToFloat(vlValor)/100 * round(StrToFloat(sCap_Basico)));
      qrlCapBasicoFin.Caption := FormatFloat('###,###,###,###,##0',vlLimMonto);
      qrlLIM_CP_BAS.Caption   := vlValor + ' %';
      qrlLIM_MONTO.Caption    := FormatFloat('###,###,###,###,##0',vlLimMonto);
      qrlSDO_INSOLUTO.Caption := FormatFloat('###,###,###,###,##0',ObtMaxSdoInsol( sFecha, sEmpresa, sRegMin, sExSector, Apli ));
      qrlSDO_INSOLUTO2.Caption:= FormatFloat('###,###,###,###,##0',ObtSumSdoInsol( sFecha, sEmpresa, sRegMin, sExSector, Apli ));
      vlPCT_EXT               := (ObtMaxSdoInsol( sFecha, sEmpresa, sRegMin, sExSector, Apli ) / vlLimMonto) * 100;
      qrlPCT_EXTENDIDO.Caption:= FormatFloat('##0.00',vlPCT_EXT) + ' %';

      qrlPCT_EXCEDE.Caption:= '';

      iPctExc   := 0;
      qrSUM_LIM_MONTO.Caption := FormatFloat('###,###,###,###,##0',StrToFloat(sCapBas));
      iPctExc  := ( ObtSumSdoInsol( sFecha, sEmpresa, sRegMin, sExSector, Apli ) / StrToFloat(sCapBas) ) * 100;
      qrlTOT_PCT_EXTENDIDO.Caption := FormatFloat('##0.00',iPctExc) + ' %';

      qrlEXCEDE.Caption:= '';
      if iPctExc > 100 then
         qrlEXCEDE.Caption:= 'Excede Límite'
      else
         qrlEXCEDE.Caption:= 'No Excede Límite';

      if vlPCT_EXT > 100 then
         qrlPCT_EXCEDE.Caption:= 'Excede Límite'
      else
         qrlPCT_EXCEDE.Caption:= 'No Excede Límite';

      if vlValor = '12' then Begin
         qrlCapBasicoFin.Top := QRL12.Top;
      end
      else if vlValor = '15' then Begin
         qrlCapBasicoFin.Top := QRL15.Top;
      end
      else if vlValor = '25' then Begin
         qrlCapBasicoFin.Top := QRL25.Top;
      end
      else if vlValor = '30' then Begin
         qrlCapBasicoFin.Top := QRL30.Top;
      end
      else if vlValor = '40' then Begin
         qrlCapBasicoFin.Top := QRL40.Top;
      end
      else  Begin
         qrlCapBasicoFin.Enabled := False;
//         qrContorno.Enabled      := False;
      end;
   end;
End;

Function  TQrLiMaxFi.ObtMaxSdoInsol(sFecha, sEmpresa, sRegMin, sExSector : String; pAPli : TInterApli): Double;
Var
    sSQL, vlValor :String;
    iSdoInsol: Double;
Begin
   sSQL := ' SELECT MAX(SDO_INSOLUTO)/1000 VALOR '+ coCRLF +
           ' FROM ( ' + FormaQueryLimFin( StrToDateTime(sFecha), sEmpresa,  sRegMin, sExSector) + ' ) '+ coCRLF;

   GetSQLStr(sSQL,pApli.DataBaseName, pApli.SessionName,'VALOR',vlValor,False);
   if vlValor <> '' then
      iSdoInsol := StrToFloat(vlValor);
   Result:= iSdoInsol;
End;

function TQrLiMaxFi.ObtSumSdoInsol(sFecha, sEmpresa, sRegMin, sExSector : String; pAPli: TInterApli): Double;
Var
    sSQL, vlValor :String;
    iSdoInsol: Double;
Begin
   sSQL := ' SELECT SUM(SDO_INSOLUTO)/1000 VALOR '+ coCRLF +
           ' FROM ( ' + FormaQueryLimFin( StrToDateTime(sFecha), sEmpresa,  sRegMin, sExSector) + ' ) '+ coCRLF;

   GetSQLStr(sSQL,pApli.DataBaseName, pApli.SessionName,'VALOR',vlValor,False);
   if vlValor <> '' then
      iSdoInsol := StrToFloat(vlValor);
   Result:= iSdoInsol;
end;

End.
