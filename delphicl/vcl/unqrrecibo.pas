unit unqrRecibo;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,IntFrm,Ungene,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, Wwquery;

type
  TqrRecibo = class(TQuickRep)
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    qrlRet_Aper: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLNum_Letra: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel5: TQRLabel;
    QRExpr4: TQRExpr;
    QRShape2: TQRShape;
    qrdbImp_ren1: TQRDBText;
    qrlPlazo_ren1: TQRLabel;
    QRShape3: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText17: TQRDBText;
    instrucciones: TQRLabel;
    qrlImp_ren1: TQRLabel;
    QRExpr5: TQRExpr;
    qrlEstatus: TQRLabel;
    qrlCtte1: TQRLabel;
    qrlCtte1b: TQRLabel;
    qrlCtte2: TQRLabel;
    qrlCtte2b: TQRLabel;
    qrlCtte3: TQRLabel;
    qrlCtte3b: TQRLabel;
    qrlCtte4: TQRLabel;
    qrlCtte4b: TQRLabel;
    qrlRevaluacion: TQRLabel;
    qrlSBC: TQRLabel;
    qreplazo_ren1: TQRExpr;
    qRecibo: TwwQuery;
    ChildBand1: TQRChildBand;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRDBText12: TQRDBText;
    qrlRet_Aper2: TQRLabel;
    QRExpr6: TQRExpr;
    qrsCuadro: TQRShape;
    instrucciones1: TQRLabel;
    qrlImp_ren: TQRLabel;
    qrlplazo_ren: TQRLabel;
    qrdbimp_ren: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLNum_Letra2: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText26: TQRDBText;
    QRExpr9: TQRExpr;
    QRLabel24: TQRLabel;
    QRShape5: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    qrlRevaluacion2: TQRLabel;
    QRExpr10: TQRExpr;
    qrlEstatus2: TQRLabel;
    qrlSBC2: TQRLabel;
    qrlCtte12: TQRLabel;
    qrlCtte12b: TQRLabel;
    qrlCtte22: TQRLabel;
    qrlCtte22b: TQRLabel;
    qrlCtte32: TQRLabel;
    qrlCtte32b: TQRLabel;
    qrlCtte42: TQRLabel;
    qrlCtte42b: TQRLabel;
    qreplazo_ren: TQRExpr;
    ChildBand2: TQRChildBand;
    QRLabel29: TQRLabel;
    QRShape6: TQRShape;
    QRLabel30: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRExpr12: TQRExpr;
    QRLabel12: TQRLabel;
    QRLabel8: TQRLabel;
    qContratante: TwwQuery;
    qContratanteNOMBRE: TStringField;
    qReciboID_CONTRATO: TFloatField;
    qReciboID_PAGARE: TFloatField;
    qReciboNOMBRE: TStringField;
    qReciboF_APERTURA: TDateTimeField;
    qReciboF_VENCIMIENTO: TDateTimeField;
    qReciboIMP_CAPITAL: TFloatField;
    qReciboIMP_INT_VTO: TFloatField;
    qReciboIMP_ISR_VTO: TFloatField;
    qReciboIMP_NETO_VTO: TFloatField;
    qReciboIMP_RENOVAR: TFloatField;
    qReciboTASA_NETA: TFloatField;
    qReciboID_CTO_LIQ: TFloatField;
    qReciboDIAS_PLAZO: TFloatField;
    qReciboCVE_SIT_PAGARE: TStringField;
    qReciboCVE_CORRESP: TStringField;
    qReciboDIAS_PLAZO_RENOV: TFloatField;
    qReciboDESC_PRODUCTO: TStringField;
    qReciboCVE_MONEDA: TFloatField;
    qReciboDESC_MONEDA: TStringField;
    qReciboID_TITULAR: TFloatField;
    qReciboTX_INST_CAJERO: TStringField;
    qReciboCALLE_NUMERO: TStringField;
    qReciboCOLONIA: TStringField;
    qReciboDESC_POBLACION: TStringField;
    qReciboDESC_POBLACION_1: TStringField;
    qReciboDESC_POBLACION_2: TStringField;
    qReciboDESC_POBLACION_3: TStringField;
    qReciboDOMICILIO1: TStringField;
    qReciboDOMICILIO2: TStringField;
    qReciboCODIGO_POSTAL: TStringField;
    qReciboTASA_BRUTA: TFloatField;
    QRExpr11: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
    QRExpr29: TQRExpr;
    qReciboHORA: TStringField;
    QRDBText10: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRExpr30: TQRExpr;
    QRExpr31: TQRExpr;
    qReciboGATREAL: TFloatField;
    QRExpr34: TQRExpr;
    QRExpr32: TQRExpr;
    QRLabel31: TQRLabel;
    QRExpr33: TQRExpr;
    QRLabel32: TQRLabel;
    QRExpr35: TQRExpr;
    qrDBPlazaText: TQRDBText;
    qReciboPLAZA: TStringField;
    QRDBText14: TQRDBText;
  private
     FDataBaseName: String;
     FSessionName: String;
     procedure SetDataBaseName(DataBase:String);
     procedure SetSessionName(Session:String);
  public
     Property DataBaseName:String Read FdataBaseName Write SetDataBaseName;
     Property SessionName:String Read FSessionName Write SetSessionName;
  end;
  Procedure Execute_Recibo(ShowPreview:Boolean; Padre:TInterFrame;
                           CVE_MONEDA:Integer; TIPO_CAMBIO:Real; vgFechaHoy:tDateTime);

var
  qrRecibo: TqrRecibo;

implementation

{$R *.DFM}

Procedure Execute_Recibo(ShowPreview:Boolean; Padre:TInterFrame;
                         CVE_MONEDA:Integer; TIPO_CAMBIO:Real; vgFechaHoy:TdateTime);
var Recibo : tqrRecibo;
    vlCtte : Integer;
begin
  Recibo:= tqrRecibo.Create(Padre);
  Try
    Recibo.DataBaseName :=Padre.DataBaseName;
    Recibo.SessionName  :=Padre.SessionName;
    Recibo.qRecibo.Close;
    Recibo.qRecibo.ParamByName('PARAMETRO1').asInteger := padre.FieldByName('ID_CONTRATO').asInteger;
    Recibo.qRecibo.ParamByName('PARAMETRO2').asInteger := padre.FieldByName('ID_PAGARE').asInteger;
    Recibo.qRecibo.Open;
    Recibo.qContratante.Close;
    Recibo.qContratante.ParamByName ('PARAMETRO1').asInteger := padre.FieldByName('ID_CONTRATO').asInteger;
    Recibo.qContratante.Open;
    Recibo.qrlSBC.Caption  := ' ';
    Recibo.qrlSBC2.Caption := ' ';
    if padre.FieldByName('F_APERTURA').asDateTime > vgFechaHoy then
    begin
      Recibo.qrlSBC.Caption  := '*** DEPOSITO SALVO BUEN COBRO ***';
      Recibo.qrlSBC2.Caption := '*** DEPOSITO SALVO BUEN COBRO ***';
    end;

    Recibo.qrlEstatus.Caption    := ' ';
    Recibo.qrlEstatus2.Caption   := ' ';
    Recibo.qrlImp_ren.Enabled    := True;
    Recibo.qrlImp_ren1.Enabled   := True;
    Recibo.qrdbImp_ren.Enabled   := True;
    Recibo.qrdbImp_ren1.Enabled  := True;
    Recibo.qrlPlazo_ren.Enabled  := True;
    Recibo.qrlPlazo_ren1.Enabled := True;
    Recibo.qreplazo_ren.Enabled  := True;
    Recibo.qreplazo_ren1.Enabled := True;

    if padre.FieldByName('CVE_SIT_PAGARE').asString = 'PA' then
    begin
      Recibo.qrlEstatus.Caption  := 'POR ACTIVAR';
      Recibo.qrlEstatus2.Caption := 'POR ACTIVAR';
    end;

    if padre.FieldByName('CVE_SIT_PAGARE').asString = 'AC' then
    begin
      Recibo.qrlEstatus.Caption  := 'ACTIVO';
      Recibo.qrlEstatus2.Caption := 'ACTIVO';
    end;

    if padre.FieldByName('CVE_SIT_PAGARE').asString = 'CA' then
    begin
      Recibo.qrlEstatus.Caption  := 'CANCELADO';
      Recibo.qrlEstatus2.Caption := 'CANCELADO';
    end;

    Recibo.qrlRet_Aper.Caption   := 'RECIBO DE DEPOSITO DE INVERSION';
    Recibo.qrlRet_Aper2.Caption  := 'RECIBO DE DEPOSITO DE INVERSION';
    Recibo.QRLNum_Letra.Caption  := '(***' + NumLetra(padre.FieldByName('IMP_CAPITAL').asFloat) + '***)';
    Recibo.QRLNum_Letra2.Caption := '(***' + NumLetra(padre.FieldByName('IMP_CAPITAL').asFloat)+ '***)';
    if padre.FieldByName('CVE_SIT_PAGARE').asString = 'VE' then
    begin
      Recibo.qrlEstatus.Caption    := 'VENCIDO';
      Recibo.qrlEstatus2.Caption   := 'VENCIDO';
      Recibo.qrlImp_ren.Enabled    := False;
      Recibo.qrlImp_ren1.Enabled   := False;
      Recibo.qrdbImp_ren.Enabled   := False;
      Recibo.qrdbImp_ren1.Enabled  := False;
      Recibo.qrlPlazo_ren.Enabled  := False;
      Recibo.qrlPlazo_ren1.Enabled := False;
      Recibo.qreplazo_ren.Enabled  := False;
      Recibo.qreplazo_ren1.Enabled := False;
      Recibo.qrlRet_Aper.Caption   := 'RECIBO DE RETIRO DE INVERSION';
      Recibo.qrlRet_Aper2.Caption  := 'RECIBO DE RETIRO DE INVERSION';
      Recibo.QRLNum_Letra.Caption  := '(***' + NumLetra(padre.FieldByName('IMP_NETO_VTO').asFloat) + '***)';
      Recibo.QRLNum_Letra2.Caption := '(***' + NumLetra(padre.FieldByName('IMP_NETO_VTO').asFloat) + '***)';
    end;

    if padre.FieldByName('CVE_SIT_PAGARE').asString = 'RC' then
    begin
      Recibo.qrlEstatus.Caption  := 'RENOVACION CANCELADA';
      Recibo.qrlEstatus2.Caption := 'RENOVACION CANCELADA';
    end;
    Recibo.qrlRevaluacion.Caption  := ' ';
    Recibo.qrlRevaluacion2.Caption := ' ';
    if cve_moneda <> 484 then // cambia etiquetas si es en otra moneda
    begin
      Recibo.QRLNum_Letra.Caption    := ' ';
      Recibo.QRLNum_Letra2.Caption   := ' ';
      Recibo.qrlRevaluacion.Caption  := 'Revaluación al tipo de cambio : ' +
                                         FormatFloat('#.#####0',TIPO_CAMBIO);
      Recibo.qrlRevaluacion2.Caption := 'Revaluación al tipo de cambio : ' +
                                         FormatFloat('#.#####0',TIPO_CAMBIO);
    end;
    // busca hasta 4 contratantes para firma
    vlCtte := 1;
    Recibo.qrlCtte2.Enabled  := False;
    Recibo.qrlCtte2b.Enabled := False;
    Recibo.qrlCtte3.Enabled  := False;
    Recibo.qrlCtte3b.Enabled := False;
    Recibo.qrlCtte4.Enabled  := False;
    Recibo.qrlCtte4b.Enabled := False;

    Recibo.qrlCtte22.Enabled  := False;
    Recibo.qrlCtte22b.Enabled := False;
    Recibo.qrlCtte32.Enabled  := False;
    Recibo.qrlCtte32b.Enabled := False;
    Recibo.qrlCtte42.Enabled  := False;
    Recibo.qrlCtte42b.Enabled := False;

    while not Recibo.qContratante.EOF do
    begin
      if vlCtte = 1 then
      begin
        Recibo.qrlCtte1.Caption   := Recibo.qContratanteNOMBRE.AsString;
        Recibo.qrlCtte1b.Caption  := 'DEPOSITANTE(S) NOMBRE(S) Y FIRMA(S)';
        Recibo.qrlCtte12.Caption  := Recibo.qContratanteNOMBRE.AsString;
        Recibo.qrlCtte12b.Caption := 'DEPOSITANTE(S) NOMBRE(S) Y FIRMA(S)';
      end;

      if vlCtte = 2 then
      begin
        Recibo.qrlCtte2.Caption   := Recibo.qContratanteNOMBRE.AsString;
        Recibo.qrlCtte2b.Caption  := 'DEPOSITANTE(S) NOMBRE(S) Y FIRMA(S)';
        Recibo.qrlCtte22.Caption  := Recibo.qContratanteNOMBRE.AsString;
        Recibo.qrlCtte22b.Caption := 'DEPOSITANTE(S) NOMBRE(S) Y FIRMA(S)';
        Recibo.qrlCtte2.Enabled   := True;
        Recibo.qrlCtte2b.Enabled  := True;
        Recibo.qrlCtte22.Enabled  := True;
        Recibo.qrlCtte22b.Enabled := True;
      end;

      if vlCtte = 3 then
      begin
        Recibo.qrlCtte3.Caption   := Recibo.qContratanteNOMBRE.AsString;
        Recibo.qrlCtte3b.Caption  := 'DEPOSITANTE(S) NOMBRE(S) Y FIRMA(S)';
        Recibo.qrlCtte32.Caption  := Recibo.qContratanteNOMBRE.AsString;
        Recibo.qrlCtte32b.Caption := 'DEPOSITANTE(S) NOMBRE(S) Y FIRMA(S)';
        Recibo.qrlCtte3.Enabled   := True;
        Recibo.qrlCtte3b.Enabled  := True;
        Recibo.qrlCtte32.Enabled  := True;
        Recibo.qrlCtte32b.Enabled := True;
      end;

      if vlCtte = 4 then
      begin
        Recibo.qrlCtte4.Caption   := Recibo.qContratanteNOMBRE.AsString;
        Recibo.qrlCtte4b.Caption  := 'DEPOSITANTE(S) NOMBRE(S) Y FIRMA(S)';
        Recibo.qrlCtte42.Caption  := Recibo.qContratanteNOMBRE.AsString;
        Recibo.qrlCtte42b.Caption := 'DEPOSITANTE(S) NOMBRE(S) Y FIRMA(S)';
        Recibo.qrlCtte4.Enabled   := True;
        Recibo.qrlCtte4b.Enabled  := True;
        Recibo.qrlCtte42.Enabled  := True;
        Recibo.qrlCtte42b.Enabled := True;
      end;

      vlCtte := vlCtte + 1;
      Recibo.qContratante.Next;
    end;
    if ShowPreview then
    begin
      Recibo.Preview;
    end
    else
    begin
      Recibo.Print;
    end;
  Finally
    Recibo.Free;
  end;
end;

Procedure tqrRecibo.SetDataBaseName(DataBase:String);
begin
  qRecibo.DatabaseName := DataBase;
  qContratante.DatabaseName := DataBase;
end;

Procedure tqrRecibo.SetSessionName(Session:String);
begin
  qRecibo.SessionName := Session;
  qContratante.SessionName := Session;
end;



end.
