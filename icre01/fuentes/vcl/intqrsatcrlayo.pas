unit IntQrSatCrlayo;

interface

uses              
  Windows,  SysUtils,   Messages, Classes,  Graphics, Controls,
  StdCtrls, ExtCtrls,   Forms,    Quickrpt, QRCtrls,  Db, DBTables,
  comctrls, InterApl,   Dialogs,  IntQRPreview, jpeg,

  IntSatConst; // Funciones Comúnes para las constancias

type
  TQRSatCreIntDev = class(TQuickRep)
    Query: TQuery;
    QRDetalle: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRShape4: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel7: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRMemo1: TQRMemo;
    QRMemo3: TQRMemo;
    QRShape12: TQRShape;
    QRMemo4: TQRMemo;
    QRShape13: TQRShape;
    QRMemo5: TQRMemo;
    QRShape14: TQRShape;
    QRMemo6: TQRMemo;
    QRLabel8: TQRLabel;
    QRShape16: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape17: TQRShape;
    QRLabel11: TQRLabel;
    QRShape18: TQRShape;
    QRLabel12: TQRLabel;
    QRShape20: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape21: TQRShape;
    QRLabel15: TQRLabel;
    QRShape22: TQRShape;
    QRLabel16: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
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
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape23: TQRShape;
    QRShape11: TQRShape;
    QRShape24: TQRShape;
    QRShape7: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape1: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRMemo7: TQRMemo;
    QRMemo8: TQRMemo;
    QRShape31: TQRShape;
    QRShape15: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape19: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRMemo10: TQRMemo;
    QRShape37: TQRShape;
    QRBandColumnHeader: TQRBand;
    QRShape25: TQRShape;
    QRLabel17: TQRLabel;
    QueryIMP_INT_PAGADOS: TFloatField;
    QueryPCT_PARTICIPACION: TFloatField;
    QueryF_IMPRESION: TDateField;
    QueryNUM_IMPRESION: TFloatField;
    qrlblNOM_RETENEDOR: TQRLabel;
    QRMemCOPIA: TQRMemo;
    QueryF_AUT_OPERACION: TDateTimeField;
    QueryF_LIQ_BNC: TDateTimeField;
    QueryMES_F_AUT_OPE: TFloatField;
    QueryMES_F_LIQ_BNC: TFloatField;
    QueryF_INI_EJER: TDateTimeField;
    QueryF_FIN_EJER: TDateTimeField;
    QRMemo2: TQRMemo;
    QRMemo9: TQRMemo;
    procedure QRDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepAfterPrint(Sender: TObject);
  private
    vgApli : TInterApli;
    vgImprimePapel : Boolean;
    vgImprimePapelVoBo : Boolean;
    vgCopias : Integer;
  public
    vgParticipacion : Double;
  end;

var
  QRSatCreIntDev: TQRSatCreIntDev;

  vgLeyenda_COPIA_1 : Boolean; //HERJA

function RepConstancias( peSQL, peNOM_RETENEDOR : String; peApli :  TInterApli; pPreview : Boolean;
                         var psCopias : Integer ) : Boolean;

implementation
{$R *.DFM}

function RepConstancias( peSQL, peNOM_RETENEDOR : String; peApli :  TInterApli; pPreview : Boolean;
                         var psCopias : Integer ) : Boolean;
var
    QrSatCreInt : TQRSatCreIntDev;
    QrPreview   : TIntQRPreview;
Begin
    QrSatCreInt := TQRSatCreIntDev.Create(Nil);
    QrPreview   := TIntQRPreview.CreatePreview(Application, QrSatCreInt);
    Try
        QrSatCreInt.vgImprimePapel := False;
        QrSatCreInt.vgImprimePapelVoBo := False;
        QrSatCreInt.vgApli := peApli;
        QrSatCreInt.vgCopias := 0;
//        QrSatCreInt.Query.DatabaseName := 'PCORP';
//        QrSatCreInt.Query.SessionName  := 'Default';
        QrSatCreInt.Query.DatabaseName := QrSatCreInt.vgApli.DataBaseName;
        QrSatCreInt.Query.SessionName  := QrSatCreInt.vgApli.SessionName;
        QrSatCreInt.Query.Close;
        QrSatCreInt.Query.SQL.Clear;
        QrSatCreInt.Query.SQL.Add(peSQL);
        QrSatCreInt.Query.Open;
        QrSatCreInt.qrlblNOM_RETENEDOR.Caption := peNOM_RETENEDOR;
        If Not QrSatCreInt.Query.IsEmpty then
         Begin
          If pPreview Then QrSatCreInt.Preview
          Else QrSatCreInt.Print;
         End
        Else     
          ShowMessage('No hay información disponible');
    Finally
      psCopias := QrSatCreInt.vgCopias;
      Result := QrSatCreInt.vgImprimePapel;
      If Assigned(QrSatCreInt) Then QrSatCreInt.free;
      If Assigned(QrPreview) Then QrPreview.Free;
    End;
End;

{ TQRSatCreIntDev }
procedure TQRSatCreIntDev.QRDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  // Si no ha sido impreso con Anterioridad, entonces...
//  If (Query.FieldByName('F_IMPRESION').IsNull) Then
  if vgLeyenda_COPIA_1 = False then //HERJA
    // NO muestres la leyenda de Copia
    QRMemCOPIA.Font.Color := clWhite
  Else
    // De lo contrario, muestra la leyenda de Copia
    QRMemCOPIA.Font.Color := clInactiveBorder;
end;

procedure TQRSatCreIntDev.QuickRepAfterPrint(Sender: TObject);
begin
 With Query Do
  Begin
  vgCopias := PrinterSettings.Copies;
  vgImprimePapel := True;
  End;
end;

end.


