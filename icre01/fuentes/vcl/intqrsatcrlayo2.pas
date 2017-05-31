unit IntQrSatCrlayo2;

interface                

uses
  Windows,  SysUtils,   Messages, Classes,  Graphics, Controls,
  StdCtrls, ExtCtrls,   Forms,    Quickrpt, QRCtrls,  Db, DBTables,
  comctrls, InterApl,   Dialogs,  IntQRPreview, jpeg, QRPrntr, Printers,

  IntSatConst; // Funciones Comúnes para las constancias

type                           
  TQrSatConstancia2 = class(TQuickRep)
    Query: TQuery;
    QueryID_EMPRESA: TFloatField;
    QueryEJERCICIO: TFloatField;
    QueryID_CONTRATO: TFloatField;
    QueryID_CREDITO: TFloatField;
    QuerySDO_PROMEDIO: TFloatField;
    QueryTIPO_REGISTRO: TFloatField;
    QueryCONSECUTIVO: TFloatField;
    QueryCVE_IDENTIFICADOR: TFloatField;
    QueryRFC_CURP: TStringField;
    QueryNOMBRE_TIT: TStringField;
    QueryDOMICILIO: TStringField;
    QueryNUM_REFERENCIA: TStringField;
    QueryNUM_REG_FIDE: TStringField;
    QueryCVE_DEST_CREDITO: TFloatField;
    QueryIMP_INT_NOM_DEV: TFloatField;
    QueryIMP_INT_PAG_ORD: TFloatField;
    QueryIMP_INT_MOR_DEV: TFloatField;
    QueryIMP_INT_MOR_PAG: TFloatField;
    QueryIMP_INT_REAL: TFloatField;
    QuerySDO_CIE_ANIO_ANT: TFloatField;
    QuerySDO_FEC_CONTR: TFloatField;
    QueryF_CONTRATACION: TFloatField;
    QueryPROP_DEDUCIBLE: TFloatField;
    QueryPCT_COP_SOC_CONY: TFloatField;
    QueryNUM_COPROPIET: TFloatField;
    QueryRFC_CURP_COPRO: TStringField;
    QueryNOMBRE_COPRO: TStringField;
    QueryRFC_CURP_CONYU: TStringField;
    QueryNOMBRE_CONYU: TStringField;
    QueryDOMICILIO_INMU: TStringField;
    QuerySALDO_INICIAL: TFloatField;
    QueryEMPRESA: TStringField;
    QueryRFC_EMPRE: TStringField;
    QueryDOM_EMPRE: TStringField;
    QueryREPRESENTANTE: TStringField;
    QueryRFC_REP: TStringField;
    QRBandColumnHeader: TQRBand;
    QueryIMP_INT_PAGADOS: TFloatField;
    QueryPCT_PARTICIPACION: TFloatField;
    QueryF_IMPRESION: TDateField;
    QueryNUM_IMPRESION: TFloatField;
    QRDetalle: TQRBand;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape6: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRMemo7: TQRMemo;
    QRMemo8: TQRMemo;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText17: TQRDBText;
    QRShape18: TQRShape;
    QRLabel9: TQRLabel;
    QRMemCOPIA: TQRMemo;
    qrlblMES_INICIAL: TQRLabel;
    qrlblMES_FINAL: TQRLabel;
    QueryF_AUT_OPERACION: TDateTimeField;
    QueryF_LIQ_BNC: TDateTimeField;
    QueryMES_F_AUT_OPE: TFloatField;
    QueryMES_F_LIQ_BNC: TFloatField;
    QueryF_INI_EJER: TDateTimeField;
    QueryF_FIN_EJER: TDateTimeField;
    QRLabel10: TQRLabel;
    QRMemo2: TQRMemo;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape25: TQRShape;
    QRBand1: TQRBand;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape50: TQRShape;
    QRShape52: TQRShape;
    QRShape2: TQRShape;
    QRShape17: TQRShape;
    QRShape20: TQRShape;
    QRDBText14: TQRDBText;
    QRShape1: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape11: TQRShape;
    QRShape15: TQRShape;
    QRLabel11: TQRLabel;
    QRShape16: TQRShape;
    QRMemo3: TQRMemo;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    qrlblNOM_RETENEDOR: TQRLabel;
    QRShape19: TQRShape;
    QRLabel14: TQRLabel;
    QRMemo4: TQRMemo;
    qrlblCurpRepresentante: TQRLabel;
    QRLabel15: TQRLabel;
    procedure QRDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepAfterPrint(Sender: TObject);
    procedure qrlblMES_INICIALPrint(sender: TObject; var Value: String);
    procedure qrlblMES_FINALPrint(sender: TObject; var Value: String);
    procedure QRLabel15Print(sender: TObject; var Value: String);
  private
    vgApli : TInterApli;
    vgImprimePapel : Boolean;
    vgImprimePapelVoBo : Boolean;
    vgCopias : Integer;
  public

  end;

var
  QrSatConstancia2: TQrSatConstancia2;

    vgLeyenda_COPIA_2 : Boolean; //HERJA

function RepConstancias2( peSQL, peNOM_RETENEDOR, peCURP_REPRESENTANTE : String; peApli :  TInterApli; pPreview : Boolean;
                          var psCopias : Integer; peBManual : Boolean ) : Boolean;

implementation
{$R *.DFM}

{ TQRSatCreIntDev }

function RepConstancias2( peSQL, peNOM_RETENEDOR, peCURP_REPRESENTANTE : String; peApli :  TInterApli; pPreview : Boolean;
                          var psCopias : Integer; peBManual : Boolean ) : Boolean;
var
    QrSatConstancia2 : TQrSatConstancia2;
    QrPreview   : TIntQRPreview;
Begin
    QrSatConstancia2 := TQrSatConstancia2.Create(Nil);
    QrPreview   := TIntQRPreview.CreatePreview(Application, QrSatConstancia2 );
    Try
        QrSatConstancia2.vgApli := peApli;
        QrSatConstancia2.vgImprimePapel := False;
        QrSatConstancia2.vgImprimePapelVoBo := False;
        QrSatConstancia2.vgCopias := 0;
        QrSatConstancia2.Query.DatabaseName := QrSatConstancia2.vgApli.DatabaseName;
        QrSatConstancia2.Query.SessionName  := QrSatConstancia2.vgApli.SessionName;
        QrSatConstancia2.Query.Close;
        QrSatConstancia2.Query.SQL.Clear;
        QrSatConstancia2.Query.SQL.Add(peSQL);
        QrSatConstancia2.Query.Open;
        QrSatConstancia2.qrlblNOM_RETENEDOR.Caption := peNOM_RETENEDOR;
        QrSatConstancia2.qrlblCurpREPRESENTANTE.Caption := peCURP_REPRESENTANTE;

        If peBManual Then QrSatConstancia2.PrinterSettings.OutputBin := Manual
        Else QrSatConstancia2.PrinterSettings.OutputBin := Auto;

        if not QrSatConstancia2.Query.IsEmpty then
        begin
          if pPreview then
            QrSatConstancia2.Preview
          else
            QrSatConstancia2.Print;
          //ends_if
        end else begin
          ShowMessage('No hay información disponible');
        end;
    Finally
      psCopias := QrSatConstancia2.vgCopias;
      Result := QrSatConstancia2.vgImprimePapel;
      If Assigned(QrSatConstancia2) Then QrSatConstancia2.free;
      If Assigned(QrPreview) Then  QrPreview.Free;
    End;     
End;

procedure TQrSatConstancia2.QRDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  // Si no ha sido impreso con Anterioridad, entonces...
  //If (Query.FieldByName('F_IMPRESION').IsNull) Then
  if vgLeyenda_COPIA_2 = False then//HERJA
    // NO muestres la leyenda de Copia
    QRMemCOPIA.Font.Color := clWhite
  Else
    // De lo contrario, muestra la leyenda de Copia
    QRMemCOPIA.Font.Color := clInactiveBorder;
end;

procedure TQrSatConstancia2.QuickRepAfterPrint(Sender: TObject);
begin
 With Query Do
  Begin
  vgCopias := PrinterSettings.Copies;
  vgImprimePapel := True;
  End;
end;

procedure TQrSatConstancia2.qrlblMES_INICIALPrint(sender: TObject;
  var Value: String);
var vlMesInicial : Integer;
begin
 With Query Do
  Begin
  If ( FieldByName('F_AUT_OPERACION').AsDateTime >= FieldByName('F_INI_EJER').AsDateTime  ) Then
    vlMesInicial := FieldByName('MES_F_AUT_OPE').AsInteger
  Else
    vlMesInicial := 1;
  End;
  Value :=  Copy('00',1,2-Length(IntToStr(vlMesInicial))) + IntToStr(vlMesInicial);
end;

procedure TQrSatConstancia2.qrlblMES_FINALPrint(sender: TObject;
  var Value: String);
var vlMesFinal : Integer;
begin
 With Query Do
  Begin
  If ( FieldByName('F_LIQ_BNC').AsDateTime >= FieldByName('F_INI_EJER').AsDateTime  ) Then
    vlMesFinal := FieldByName('MES_F_LIQ_BNC').AsInteger
  Else
    vlMesFinal := 12;
  End;
  Value :=  Copy('00',1,2-Length(IntToStr(vlMesFinal))) + IntToStr(vlMesFinal);
end;

//easa 12feb2010 leyenda con fecha dinamica
procedure TQrSatConstancia2.QRLabel15Print(sender: TObject;
  var Value: String);
var vlstrDia,vlstrMes,vlstrAnio : string;
begin

   vlstrDia  := '31';
   vlstrMes  := '12';
   vlstrAnio := IntToStr(Query.FieldByName('EJERCICIO').AsInteger-1);

  If (Not Query.FieldByName('F_CONTRATACION').IsNull) Then Begin
    vlstrDia  := Copy(Query.FieldByName('F_CONTRATACION').AsString,7,2);
    vlstrMes  := Copy(Query.FieldByName('F_CONTRATACION').AsString,5,2);
    vlstrAnio := Copy(Query.FieldByName('F_CONTRATACION').AsString,1,4);
  End;

  Value :=  'SALDO INSOLUTO AL '+ vlstrDia + '-'+  vlstrMes  + '-'+ vlstrAnio;

end;

end.

