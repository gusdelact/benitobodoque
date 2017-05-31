unit UnRpDiagKYCPM;
//------------------------------------------------------------------------------
//  Diagnóstico de KYC para Personas Morales
//  Realizó  : Carlos A. Mejía Ledón
//  Fecha    : Junio 2004
//  Empresa  : Grupo Financiero Interacciones.
//------------------------------------------------------------------------------

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  InterApl, IntHead, UnGene, DmCttoEstado, UnConKYC;

type
  TqrDiagKYCPM = class(TQuickRep)
    qPersona: TQuery;
    PageHeaderBand1: TQRBand;
    qrieDiagKYCPM: TQRInterEncabezado;
    qContrato: TQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    dsContrato: TDataSource;
    qContratoID_TITULAR: TFloatField;
    QRLabel32: TQRLabel;
    qContratoID_EMPRESA: TFloatField;
    qrmePersObTiene: TQRMemo;
    ColumnHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel8: TQRLabel;
    qDiagPersona: TQuery;
    qrmePersObFalta: TQRMemo;
    qDiagPaisCober: TQuery;
    qDiagPerEmp: TQuery;
    QRLabel2: TQRLabel;
    qrmePerEmpObTiene: TQRMemo;
    qrmePerEmpObFalta: TQRMemo;
    qrchPerEmp: TQRChildBand;
    qrlbTienePaisCober: TQRLabel;
    qrlbFaltaPaisCober: TQRLabel;
    QRLabel7: TQRLabel;
    qrmeCtoObTiene: TQRMemo;
    qrmeCtoObFalta: TQRMemo;
    qDiagCto: TQuery;
    ChildBand1: TQRChildBand;
    qrlbTieneOpera: TQRLabel;
    qrlbFaltaOpera: TQRLabel;
    qCtoOpera: TQuery;
    qDiagRefer: TQuery;
    QRLabel9: TQRLabel;
    qrmeReferDeTiene: TQRMemo;
    qrmeReferDeFalta: TQRMemo;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    qPersonaID_PERSONA: TFloatField;
    qPersonaNOM_RAZON_SOCIAL: TStringField;
    qrlbTotalObTiene: TQRLabel;
    QRLabel5: TQRLabel;
    qrlbTotalObFalta: TQRLabel;
    QRLabel13: TQRLabel;
    qrlbTotalDeTiene: TQRLabel;
    QRLabel15: TQRLabel;
    qrlbTotalDeFalta: TQRLabel;
    QRLabel3: TQRLabel;
    procedure qrchPerEmpBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    vgTotObTiene       : Integer;
    vgTotObFalta       : Integer;
    vgTotDeTiene       : Integer;
    vgTotDeFalta       : Integer;
    vgNumObligatorios  : Integer;
    vgNumDeseables     : Integer;
    vgBTotalCalculados : Boolean;
    procedure Diagnostica(pQuery       : TQuery;
                      var pQRMemoTiene : TQRMemo;
                      var pQRMemoFalta : TQRMemo);
    procedure DiagnosticaNum(pQuery       : TQuery;
                         var pQRMemoTiene : TQRMemo;
                         var pQRMemoFalta : TQRMemo);

  public
    Apli : TInterApli;
  end;

var
  qrDiagDiagKYCPM : TqrDiagKYCPM;
  procedure EXECUTE_RP_DIAGKYCPM(pApli: TInterApli; pVerImprimir: String; pIdContrato : Integer);

implementation

{$R *.DFM}

procedure EXECUTE_RP_DIAGKYCPM(pApli: TInterApli; pVerImprimir: String; pIdContrato : Integer);
var
  qrDiagKYCPM: TqrDiagKYCPM;
begin
  qrDiagKYCPM := TqrDiagKYCPM.Create(Nil);
  with qrDiagKYCPM do
  try
    Apli                  := pApli;
    qrieDiagKYCPM.Apli := Apli;
    //-- Inicializa Variables Globales --//
    vgTotObTiene       := 0;
    vgTotObFalta       := 0;
    vgTotDeTiene       := 0;
    vgTotDeFalta       := 0;
    vgNumObligatorios  := 0;
    vgNumDeseables     := 0;
    vgBTotalCalculados := False;
    //-- Base de Datos y parametros a Queries --//
    qContrato.DatabaseName      := Apli.DataBaseName;
    qContrato.SessionName       := Apli.SessionName;
    qContrato.ParamByName('pIdContrato').AsInteger := pIdContrato;
    qPersona.DatabaseName       := Apli.DataBaseName;
    qPersona.SessionName        := Apli.SessionName;
    qDiagPersona.DatabaseName   := Apli.DataBaseName;
    qDiagPersona.SessionName    := Apli.SessionName;
    qDiagPerEmp.DatabaseName    := Apli.DataBaseName;
    qDiagPerEmp.SessionName     := Apli.SessionName;
    qDiagCto.DatabaseName       := Apli.DataBaseName;
    qDiagCto.SessionName        := Apli.SessionName;
    qDiagRefer.DatabaseName     := Apli.DataBaseName;
    qDiagRefer.SessionName      := Apli.SessionName;
    qDiagPaisCober.DatabaseName := Apli.DataBaseName;
    qDiagPaisCober.SessionName  := Apli.SessionName;
    qCtoOpera.DatabaseName      := Apli.DataBaseName;
    qCtoOpera.SessionName       := Apli.SessionName;

    qContrato.Open;
    if not qContrato.IsEmpty then
    begin
      qrieDiagKYCPM.Titulo2   := 'Contrato ' + IntToStr(pIdContrato);
      qrieDiagKYCPM.IdEmpresa := qContrato.FieldByName('ID_EMPRESA').AsInteger;
      qPersona.Open;
      Diagnostica(qDiagPersona,qrmePersObTiene,qrmePersObFalta);
      Diagnostica(qDiagPerEmp,qrmePerEmpObTiene,qrmePerEmpObFalta);
      Diagnostica(qDiagCto,qrmeCtoObTiene,qrmeCtoObFalta);
      DiagnosticaNum(qDiagRefer,qrmeReferDeTiene,qrmeReferDeFalta);
    end;
    if pVerImprimir = 'Ver' then
      Preview
    else if pVerImprimir = 'Imprimir' then
      Print;
  finally
    qContrato.Close;
    qPersona.Close;
    Free;
  end;
end;

procedure TqrDiagKYCPM.Diagnostica(pQuery       : TQuery;
                                  var pQRMemoTiene : TQRMemo;
                                  var pQRMemoFalta : TQRMemo);
var
  vlContador    : Integer;
  vlContObTiene : Integer;
  vlContObFalta : Integer;
  vlNumCampos   : Integer;
  vlResultado   : String;
begin
  vlContObFalta := -1;
  vlContObTiene := -1;
  pQuery.Close;
  pQuery.Open;
  if not pQuery.IsEmpty then
  begin
    vlNumCampos := pQuery.FieldCount;
    for vlContador := 1 to vlNumCampos do
    begin
      vlResultado := pQuery.Fields.Fields[vlContador-1].AsString;
      //-- OBLIGATORIOS --//
      if Copy(vlResultado,1,1) = cObligatorio then
      begin
        vgNumObligatorios  := vgNumObligatorios + 1;
        //-- Tiene --//
        if Copy(vlResultado,2,1) = cTiene then
        begin
          vgTotObTiene  := vgTotObTiene + 1;
          vlContObTiene := vlContObTiene + 1;
          pQRMemoTiene.Lines.Insert(vlContObTiene, StringReplace(pQuery.Fields.Fields[vlContador-1].FieldName, '_', ' ', [rfReplaceAll]) );
        end
        //-- Falta --//
        else if Copy(vlResultado,2,1) = cFalta then
        begin
          vgTotObFalta  := vgTotObFalta + 1;
          vlContObFalta := vlContObFalta + 1;
          //pQRMemoFalta.Lines.Insert(vlContObFalta,pQuery.Fields.Fields[vlContador-1].FieldName);
          pQRMemoFalta.Lines.Insert(vlContObFalta, StringReplace(pQuery.Fields.Fields[vlContador-1].FieldName, '_', ' ',  [rfReplaceAll]) );
        end;
      end;
    end;
  end;
  pQuery.Close;
  pQuery.Free;
end;

procedure TqrDiagKYCPM.DiagnosticaNum(pQuery       : TQuery;
                                     var pQRMemoTiene : TQRMemo;
                                     var pQRMemoFalta : TQRMemo);
var
  vlContador    : Integer;
  vlContObTiene : Integer;
  vlContObFalta : Integer;
  vlNumCampos   : Integer;
  vlResultado   : String;
begin
  vlContObFalta := -1;
  vlContObTiene := -1;
  pQuery.Close;
  pQuery.Open;
  if not pQuery.IsEmpty then
  begin
    vlNumCampos := pQuery.FieldCount;
    for vlContador := 1 to vlNumCampos do
    begin
      vlResultado := pQuery.Fields.Fields[vlContador-1].AsString;
      //-- DESEABLES --//
      if Copy(vlResultado,1,1) = cDeseable then
      begin
        vgNumDeseables := vgNumDeseables + 1;
        //-- Tiene --//
        if Copy(vlResultado,2,1) <> cFaltaNum then
        begin
          vgTotDeTiene  := vgTotDeTiene + 1;
          vlContObTiene := vlContObTiene + 1;
          pQRMemoTiene.Lines.Insert(vlContObTiene, StringReplace(pQuery.Fields.Fields[vlContador-1].FieldName, '_', ' ', [rfReplaceAll]) + ' (' + Copy(vlResultado,2,1) + ')');
        end
        //-- Falta --//
        else
        begin
          vgTotDeFalta  := vgTotDeFalta + 1;
          vlContObFalta := vlContObFalta + 1;
          pQRMemoFalta.Lines.Insert(vlContObFalta, StringReplace(pQuery.Fields.Fields[vlContador-1].FieldName, '_', ' ', [rfReplaceAll]));
        end;
      end;
    end;
  end;
  pQuery.Close;
  pQuery.Free;
end;

procedure TqrDiagKYCPM.qrchPerEmpBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qDiagPaisCober.Close;
  qDiagPaisCober.Open;
  if not qDiagPaisCober.IsEmpty then
  begin
    if qDiagPaisCober.FieldByName('CVE_COB_GEOG').AsString = 'IN' then
    begin
      PrintBand := True;
      if not vgBTotalCalculados then
        vgNumObligatorios  := vgNumObligatorios + 1;
      if qDiagPaisCober.FieldByName('CVE_POBLACION').AsString = '' then
      begin
        if not vgBTotalCalculados then
          vgTotObFalta := vgTotObFalta + 1;
        qrlbTienePaisCober.Enabled := False;
        qrlbFaltaPaisCober.Enabled := True;
      end
      else
      begin
        if not vgBTotalCalculados then
          vgTotObTiene := vgTotObTiene + 1;
        qrlbTienePaisCober.Enabled := True;
        qrlbFaltaPaisCober.Enabled := False;
      end;
    end
    else
      PrintBand := False;
  end
  else
    PrintBand := False;
  qDiagPaisCober.Close;
end;

procedure TqrDiagKYCPM.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qCtoOpera.Close;
  qCtoOpera.Open;
  if not vgBTotalCalculados then
    vgNumObligatorios  := vgNumObligatorios + 1;
  if qCtoOpera.IsEmpty then
  begin
    if not vgBTotalCalculados then
      vgTotObFalta := vgTotObFalta + 1;
    qrlbTieneOpera.Enabled := False;
    qrlbFaltaOpera.Enabled := True;
  end
  else
  begin
    if not vgBTotalCalculados then
      vgTotObTiene := vgTotObTiene + 1;
    qrlbTieneOpera.Enabled := True;
    qrlbFaltaOpera.Enabled := False;
  end;
  qCtoOpera.Close;
end;

procedure TqrDiagKYCPM.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlbTotalObTiene.Caption := IntToStr(vgTotObTiene) + ' / ' + IntToStr(vgNumObligatorios);
  qrlbTotalObFalta.Caption := IntToStr(vgTotObFalta) + ' / ' + IntToStr(vgNumObligatorios);
  qrlbTotalDeTiene.Caption := IntToStr(vgTotDeTiene) + ' / ' + IntToStr(vgNumDeseables);
  qrlbTotalDeFalta.Caption := IntToStr(vgTotDeFalta) + ' / ' + IntToStr(vgNumDeseables);
  vgBTotalCalculados       := True;
end;

end.
