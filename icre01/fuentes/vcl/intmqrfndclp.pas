// Sistema         : Clase de TQrFndCLP
// Fecha de Inicio : 13/06/2014
// Función forma   : Clase de TMFndCLP
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     : ROIM / ROUY
unit IntMQrFndCLP;
interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre, UnSQL2, Dialogs, QRExport,
IntXls,
ComObj
;
type
  TQrFndCLP = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyConsulta: TQuery;
    QRBand4: TQRBand;                  
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel4: TQRLabel;
    QRFooterEntidad: TQRBand;
    QRLMontoDispuesto: TQRLabel;
    QRLInstitucionDescontadora: TQRLabel;
    QRDBTCVE_FND_ENT_DES: TQRDBText;
    QRSHPTitular: TQRShape;
    QRDBTDESC_ENT_DES: TQRDBText;
    QRLFechadeCorte: TQRLabel;
    QRDBTF_CORTE: TQRDBText;
    QRLLinea: TQRLabel;
    QRDBTCVE_TIPO_LINEA: TQRDBText;
    QRLMonto: TQRLabel;
    QRDBTMONTO_LIN: TQRDBText;
    QRLGarantiasOtorg: TQRLabel;
    QRDBTDESC_GARANTIA: TQRDBText;
    qyConsultaGPO_REP: TStringField;
    qyConsultaF_CORTE: TDateTimeField;
    qyConsultaDESC_ENT_DES: TStringField;
    qyConsultaCVE_TIPO_LINEA: TStringField;
    qyConsultaMONTO_LIN: TFloatField;
    qyConsultaDESC_GARANTIA: TStringField;
    qyConsultaCVE_FND_ENT_DES: TStringField;
    qyConsultaTIPO_PLAZO: TFloatField;
    qyConsultaCVE_MONEDA: TFloatField;
    qyConsultaDESC_MONEDA: TStringField;
    qyConsultaF_INI_PER_REP: TDateTimeField;
    qyConsultaF_FIN_PER_REP: TDateTimeField;
    qyConsultaPLAZO_FND: TFloatField;
    qyConsultaPROX_VENC: TFloatField;
    qyConsultaIMP_REDESCONTADO: TFloatField;
    qyConsultaSALDO_INI: TFloatField;
    qyConsultaAMOR_CAP_FA: TFloatField;
    qyConsultaSALDO_FIN: TFloatField;
    qyConsultaAMOR_CAP_FA_VAL: TFloatField;
    qrDetalle: TQRBand;
    qyConsultaDESC_C_ID_SEC: TStringField;
    QREXPTIPO_PLAZO: TQRExpr;
    QRDBTDESC_C_ID_SEC: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBTDESC_MONEDA: TQRDBText;
    QRDBTF_INI_PER_REP: TQRDBText;
    QRDBTF_FIN_PER_REP: TQRDBText;
    QRDBTPLAZO_FND: TQRDBText;
    QRDBTPROX_VENC: TQRDBText;
    QRDBTSALDO_INI: TQRDBText;
    QRDBTAMOR_CAP_FA: TQRDBText;
    QRDBTSALDO_FIN: TQRDBText;
    QRFooterTipoPlazoMon: TQRBand;
    QRLTOTALAMORTIZACION: TQRLabel;
    QREXPAMOR_CAP_FA_VALFoot: TQRExpr;
    QRDBTDESC_C_ID_SECFoot: TQRDBText;
    QRLMontoDisponible: TQRLabel;
    QREXPAMOR_CAP_FA_VALTotal: TQRExpr;
    QREXPMONTODISPONIBLETotal: TQRExpr;
    QREXPTIPO_PLAZOFoot: TQRExpr;
    QRDBTDESC_ENT_DESFoot: TQRDBText;
    QRShape1: TQRShape;
    QRLDivisa: TQRLabel;
    QRLFechaInicio: TQRLabel;
    QRLFechaTermino: TQRLabel;
    QRLPlazoFondeo: TQRLabel;
    QRLProxVenc: TQRLabel;
    QRLSaldoInicial: TQRLabel;
    QRLAmortizacionaCapital: TQRLabel;
    QRLSaldoFinal: TQRLabel;
    procedure QRGroupEntidadBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupEntidadAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRFooterTipoPlazoMonAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRFooterEntidadAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGroupTipoPlazoMonAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrDetalleAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGroupTipoPlazoMonBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
      sSubTipoRep : String;
  public
     {
     vgFechaMesAnt  : TDate;
     }
     Apli : TInterApli;
     function GeneraSQL(sSQLGenCons : String): String;
  end;


var
  QrFndCLP : TQrFndCLP;
  bGenArch : Boolean;
  sArchivo : String;
  F        : TextFile;
  vlExcelApp             : OleVariant;
  vlCol, vlRow           : Integer;
  vlNombreCol            : String;
  vlCeldaGrid            : String;
  vlQRGroupEntidad       : Integer;
  vlQRGroupTipoPlazoMon  : Integer;
  vlqrDetalle            : Integer;
  vlQRFooterTipoPlazoMon : Integer;
  vlQRFooterEntidad      : Integer;
  vlQRGroupEntidadAnt    : Integer;
  vlRowHoja              : Integer;
  vlAcumTPzoAMOR_VAL     : Double;
  vlAcumEDAMOR_VAL       : Double;
  vlMontoDisponible      : Double;

Procedure ReporteFndCortoLargoPlazo(  sSQLGenCons, sFInicio, sNbrArch : String;
                                      pAPli                 : TInterApli;
                                      pPreview              : Boolean);
Implementation
{$R *.DFM}

Procedure ReporteFndCortoLargoPlazo(  sSQLGenCons, sFInicio, sNbrArch : String;
                                      pAPli                 : TInterApli;
                                      pPreview              : Boolean);
Var
   QrFndCLP   : TQrFndCLP;
   Preview    : TIntQRPreview;
Begin
   QrFndCLP   := TQrFndCLP.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrFndCLP);
   QrFndCLP.Apli := pAPli;
   Try
      bGenArch := False;
      sArchivo := sNbrArch;
      QrFndCLP.QRInterEncabezado1.Apli      := pApli;
      QrFndCLP.QRInterEncabezado1.IdEmpresa := pAPli.IdEmpresa;
      QrFndCLP.QRInterEncabezado1.Titulo1   := 'Pasivo a Corto y Largo Plazo al día : ' + sFInicio;
      QrFndCLP.qyConsulta.DatabaseName      := pApli.DataBaseName;
      QrFndCLP.qyConsulta.SessionName       := pApli.SessionName;

      QrFndCLP.qyConsulta.Active := False;
      QrFndCLP.qyConsulta.SQL.Clear;
      QrFndCLP.qyConsulta.SQL.Add(QrFndCLP.GeneraSQL(sSQLGenCons));
      //QrFndCLP.qyConsulta.SQL.SaveToFile('C:\QRY_FND_CLP.CHK.SQL');
      QrFndCLP.qyConsulta.Active := True;

      If (QrFndCLP.qyConsulta.RecordCount > 0) Then
      Begin

         If (Trim(sArchivo) <> '')
         Then
         Begin
            //Inicializa contadores
            vlQRGroupEntidad       := 0;
            vlQRGroupTipoPlazoMon  := 0;
            vlqrDetalle            := 0;
            vlQRFooterTipoPlazoMon := 0;
            vlQRFooterEntidad      := 0;
            vlQRGroupEntidadAnt    := 0;

            //Abre Archivo
            //vlWorkSheets := 1;
            vlExcelApp := CreateOleObject('Excel.Application');
            vlExcelApp.Workbooks.Add;

            Application.ProcessMessages;
         End; //sArchivo <> ''

         If pPreview Then
            QrFndCLP.Preview
         Else
            QrFndCLP.Print;
      End //qyConsulta.RecordCount > 0
      Else
        ShowMessage(CERROR_NOEXISTEN);
   Finally
      If ( Trim(sArchivo) <> '' ) Then
      Begin
         bGenArch := True;
         vlExcelApp.ActiveWorkBook.SaveAs(sArchivo);
         CloseExcelFile(vlExcelApp);
         Application.ProcessMessages;
      End;
      QrFndCLP.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

{ TQrFndCLP }
function TQrFndCLP.GeneraSQL(sSQLGenCons : String): String;
Var
   sSQL : String;
Begin
   sSQL := sSQLGenCons;

   Result:= sSQL;
end;


procedure TQrFndCLP.QRGroupEntidadBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If ( Trim(sArchivo) <> '' ) Then
   Begin
     //Controla ini-fin ED
     vlQRGroupEntidadAnt  := vlQRGroupEntidad;
     vlQRGroupEntidad     := vlQRGroupEntidad + 1;

     //Agrega pestaña por ED
     if  (vlQRGroupEntidad <> vlQRGroupEntidadAnt) then
     begin
       vLExcelApp.Workbooks[1].WorkSheets.Add;
     end;
   End;
end;

procedure TQrFndCLP.QRGroupEntidadAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   If ( Trim(sArchivo) <> '' ) Then
   Begin
     vlExcelApp.Cells[1, 1].Value := QRLInstitucionDescontadora.Caption;
     vlExcelApp.Cells[1, 2].Value := QRDBTCVE_FND_ENT_DES.DataSet.FieldByName('CVE_FND_ENT_DES').AsString;
     vlExcelApp.Cells[1, 3].Value := QRDBTDESC_ENT_DES.DataSet.FieldByName('DESC_ENT_DES').AsString;

     vlExcelApp.Cells[1, 3].Interior.Color := clLtGray;

     vlExcelApp.Cells[2, 1].Value := QRLFechadeCorte.Caption;
     vlExcelApp.Cells[2, 2].Value := QRDBTF_CORTE.DataSet.FieldByName('F_CORTE').AsString;

     vlExcelApp.Cells[3, 1].Value := QRLLinea.Caption;
     vlExcelApp.Cells[3, 2].Value := QRDBTCVE_TIPO_LINEA.DataSet.FieldByName('CVE_TIPO_LINEA').AsString;

     vlExcelApp.Cells[4, 1].Value := QRLMonto.Caption;
     vlExcelApp.Cells[4, 2].Value := QRDBTMONTO_LIN.DataSet.FieldByName('MONTO_LIN').AsString;

     vlExcelApp.Cells[4, 2].NumberFormat := '0,00.00';

     vlExcelApp.Cells[5, 1].Value := QRLGarantiasOtorg.Caption;
     vlExcelApp.Cells[5, 2].Value := QRDBTDESC_GARANTIA.DataSet.FieldByName('DESC_GARANTIA').AsString;

     vlExcelApp.Cells[1, 1].Font.Bold := True;
     vlExcelApp.Cells[2, 1].Font.Bold := True;
     vlExcelApp.Cells[3, 1].Font.Bold := True;
     vlExcelApp.Cells[4, 1].Font.Bold := True;
     vlExcelApp.Cells[5, 1].Font.Bold := True;

     vlRowHoja := 6;

     vlAcumEDAMOR_VAL := 0;
   End;
end;

procedure TQrFndCLP.QRFooterTipoPlazoMonAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   If ( Trim(sArchivo) <> '' ) Then
   Begin
     vlExcelApp.Cells[vlRowHoja, 5].Value := QRLTOTALAMORTIZACION.Caption;
     vlExcelApp.Cells[vlRowHoja, 6].Value := QREXPTIPO_PLAZOFoot.Value.strResult;
     vlExcelApp.Cells[vlRowHoja, 7].Value := QRDBTDESC_C_ID_SECFoot.DataSet.FieldByName('DESC_C_ID_SEC').AsString;
     vlExcelApp.Cells[vlRowHoja, 8].Value := QRDBTDESC_ENT_DESFoot.DataSet.FieldByName('DESC_ENT_DES').AsString;
     vlExcelApp.Cells[vlRowHoja, 9].Value := vlAcumTPzoAMOR_VAL;

     vlExcelApp.Cells[vlRowHoja, 9].NumberFormat := '0,00.00';

     vlExcelApp.Cells[vlRowHoja, 5].Font.Bold := True;
     vlExcelApp.Cells[vlRowHoja, 6].Font.Bold := True;
     vlExcelApp.Cells[vlRowHoja, 7].Font.Bold := True;
     vlExcelApp.Cells[vlRowHoja, 8].Font.Bold := True;
     vlExcelApp.Cells[vlRowHoja, 9].Font.Bold := True;

     vlRowHoja := vlRowHoja + 1;

     vlAcumEDAMOR_VAL := vlAcumEDAMOR_VAL + vlAcumTPzoAMOR_VAL;
   End;
end;

procedure TQrFndCLP.QRFooterEntidadAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   If ( Trim(sArchivo) <> '' ) Then
   Begin
     vlExcelApp.Cells[vlRowHoja, 8].Value := QRLMontoDispuesto.Caption;
     vlExcelApp.Cells[vlRowHoja, 9].Value := vlAcumEDAMOR_VAL;

     vlExcelApp.Cells[vlRowHoja, 9].NumberFormat := '0,00.00';

     vlExcelApp.Cells[vlRowHoja, 8].Font.Bold := True;
     vlExcelApp.Cells[vlRowHoja, 9].Font.Bold := True;

     vlRowHoja := vlRowHoja + 1;

     vlExcelApp.Cells[vlRowHoja, 8].Value := QRLMontoDisponible.Caption;

     vlMontoDisponible :=  qyConsulta.FieldByName('MONTO_LIN').AsFloat - vlAcumEDAMOR_VAL;
     vlExcelApp.Cells[vlRowHoja, 9].Value := vlMontoDisponible;

     vlExcelApp.Cells[vlRowHoja, 9].NumberFormat := '0,00.00';

     vlExcelApp.Cells[vlRowHoja, 8].Font.Bold := True;
     vlExcelApp.Cells[vlRowHoja, 9].Font.Bold := True;

     //Ya no se inicializa porque empieza otra pestaña de excel
   End;
end;

procedure TQrFndCLP.QRGroupTipoPlazoMonAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   If ( Trim(sArchivo) <> '' ) Then
   Begin
     vlExcelApp.Cells[vlRowHoja, 1].Value := QREXPTIPO_PLAZO.Value.strResult;
     vlExcelApp.Cells[vlRowHoja, 2].Value := QRDBTDESC_C_ID_SEC.DataSet.FieldByName('DESC_C_ID_SEC').AsString;
     vlExcelApp.Cells[vlRowHoja, 3].Value := QRLDivisa.Caption;
     vlExcelApp.Cells[vlRowHoja, 4].Value := QRLFechaInicio.Caption;
     vlExcelApp.Cells[vlRowHoja, 5].Value := QRLFechaTermino.Caption;
     vlExcelApp.Cells[vlRowHoja, 6].Value := QRLPlazoFondeo.Caption;
     vlExcelApp.Cells[vlRowHoja, 7].Value := QRLProxVenc.Caption;
     vlExcelApp.Cells[vlRowHoja, 8].Value := QRLSaldoInicial.Caption;
     vlExcelApp.Cells[vlRowHoja, 9].Value := QRLAmortizacionaCapital.Caption;
     vlExcelApp.Cells[vlRowHoja, 10].Value := QRLSaldoFinal.Caption;

     vlExcelApp.Cells[vlRowHoja, 1].Font.Bold := True;
     vlExcelApp.Cells[vlRowHoja, 2].Font.Bold := True;

     vlExcelApp.Cells[vlRowHoja, 3].Interior.Color := clLtGray;
     vlExcelApp.Cells[vlRowHoja, 4].Interior.Color := clLtGray;
     vlExcelApp.Cells[vlRowHoja, 5].Interior.Color := clLtGray;
     vlExcelApp.Cells[vlRowHoja, 6].Interior.Color := clLtGray;
     vlExcelApp.Cells[vlRowHoja, 7].Interior.Color := clLtGray;
     vlExcelApp.Cells[vlRowHoja, 8].Interior.Color := clLtGray;
     vlExcelApp.Cells[vlRowHoja, 9].Interior.Color := clLtGray;
     vlExcelApp.Cells[vlRowHoja, 10].Interior.Color := clLtGray;

     vlRowHoja := vlRowHoja + 1;
   End;
end;

procedure TQrFndCLP.qrDetalleAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   If ( Trim(sArchivo) <> '' ) Then
   Begin
     vlExcelApp.Cells[vlRowHoja, 3].Value := QRDBTDESC_MONEDA.DataSet.FieldByName('DESC_MONEDA').AsString;
     vlExcelApp.Cells[vlRowHoja, 4].Value := QRDBTF_INI_PER_REP.DataSet.FieldByName('F_INI_PER_REP').AsString;
     vlExcelApp.Cells[vlRowHoja, 5].Value := QRDBTF_FIN_PER_REP.DataSet.FieldByName('F_FIN_PER_REP').AsString;
     vlExcelApp.Cells[vlRowHoja, 6].Value := QRDBTPLAZO_FND.DataSet.FieldByName('PLAZO_FND').AsString;
     vlExcelApp.Cells[vlRowHoja, 7].Value := QRDBTPROX_VENC.DataSet.FieldByName('PROX_VENC').AsString;
     vlExcelApp.Cells[vlRowHoja, 8].Value := QRDBTSALDO_INI.DataSet.FieldByName('SALDO_INI').AsString;
     vlExcelApp.Cells[vlRowHoja, 9].Value := QRDBTAMOR_CAP_FA.DataSet.FieldByName('AMOR_CAP_FA').AsString;
     vlExcelApp.Cells[vlRowHoja, 10].Value := QRDBTSALDO_FIN.DataSet.FieldByName('SALDO_FIN').AsString;

     vlExcelApp.Cells[vlRowHoja, 8].NumberFormat := '0,00.00';
     vlExcelApp.Cells[vlRowHoja, 9].NumberFormat := '0,00.00';
     vlExcelApp.Cells[vlRowHoja, 10].NumberFormat := '0,00.00';

     vlRowHoja := vlRowHoja + 1;

     vlAcumTPzoAMOR_VAL := vlAcumTPzoAMOR_VAL + qyConsulta.FieldByName('AMOR_CAP_FA_VAL').AsFloat;
   End;

end;

procedure TQrFndCLP.QRGroupTipoPlazoMonBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If ( Trim(sArchivo) <> '' ) Then
   Begin
    vlAcumTPzoAMOR_VAL := 0;
   End;
end;

End.

