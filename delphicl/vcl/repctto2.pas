unit RepCtto2;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, IntFrm,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, Wwquery;

type
  TReporteCtto2 = class(TQuickRep)
    qContrato: TwwQuery;
    qContratante: TwwQuery;
    qBeneficiario: TwwQuery;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    lblTipoCuentaTitulo: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    lblTipoCuenta: TQRLabel;
    lblTipoPersona: TQRLabel;
    lblTipoEnvio: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel8: TQRLabel;
    LineaCtte1: TQRShape;
    lblTCtte1: TQRLabel;
    lblCtte1: TQRLabel;
    LineaCtte2: TQRShape;
    lblCtte2: TQRLabel;
    lblTCtte2: TQRLabel;
    lblCtte3: TQRLabel;
    lblTCtte3: TQRLabel;
    lineaCtte3: TQRShape;
    LineaCtte4: TQRShape;
    lblCtte4: TQRLabel;
    lblTCtte4: TQRLabel;
    lblBeneficiarioTitulo: TQRLabel;
    lblBene1: TQRLabel;
    lblPBene1: TQRLabel;
    lblBene2: TQRLabel;
    lblPBene2: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    lblBene3: TQRLabel;
    lblPBene3: TQRLabel;
    lblBene4: TQRLabel;
    lblPBene4: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel14: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel15: TQRLabel;
    QRExpr6: TQRExpr;
    QRLabel16: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText6: TQRDBText;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    lblTipoCuentaTituloB: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    lblTipoCuentaB: TQRLabel;
    lblTipoPersonaB: TQRLabel;
    lblTipoEnvioB: TQRLabel;
    QRLabel24: TQRLabel;
    LineaCtte1B: TQRShape;
    LineaCtte2B: TQRShape;
    lblCtte1B: TQRLabel;
    lblTctte1B: TQRLabel;
    lblCtte2B: TQRLabel;
    lblTctte2B: TQRLabel;
    LineaCtte3B: TQRShape;
    lblCtte3B: TQRLabel;
    lblTctte3B: TQRLabel;
    LineaCtte4B: TQRShape;
    lblCtte4B: TQRLabel;
    lblTctte4B: TQRLabel;
    lblBeneficiarioTituloB: TQRLabel;
    lblBene1B: TQRLabel;
    lblBene2B: TQRLabel;
    lblBene3B: TQRLabel;
    lblBene4B: TQRLabel;
    lblPBene1B: TQRLabel;
    lblPBene2B: TQRLabel;
    lblPBene3B: TQRLabel;
    lblPBene4B: TQRLabel;
    QRShape6: TQRShape;
    QRLabel42: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    procedure TitleBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    FDataBaseName: String;
    FSessionName: String;
    Procedure SetDataBaseName(DataBase: String);
    Procedure SetSessionName(Session: String);
  public
    Property DataBaseName:String Read FDataBaseName Write SetDataBaseName;
    Property SessionName:String Read FSessionName Write SetSessionName;
  end;

Procedure Execute_RepCtto2(ShowPreview:Boolean; Padre:TInterFrame; Id_Contrato:Integer);

implementation

{$R *.DFM}

Procedure Execute_RepCtto2(ShowPreview:Boolean; Padre:TInterFrame; Id_Contrato:Integer);
var
  Reporte: TReporteCtto2;
begin
  Reporte:=TReporteCtto2.Create(Padre);
  Try
    Reporte.DataBaseName:= Padre.DataBaseName;
    Reporte.SessionName := Padre.SessionName;
    Reporte.qContrato.Close;
    Reporte.qContrato.ParamByName('P_ID_CONTRATO').AsInteger := Id_Contrato;
    Reporte.qContrato.Open;
    Reporte.qContratante.Close;
    Reporte.qContratante.ParamByName('P_ID_CONTRATO').AsInteger := Id_Contrato;
    Reporte.qContratante.Open;
    Reporte.qBeneficiario.Close;
    Reporte.qBeneficiario.ParamByName('P_ID_CONTRATO').AsInteger := Id_Contrato;
    Reporte.qBeneficiario.Open;
    if ShowPreview then
       Reporte.Preview
    else
       Reporte.Print;
  Finally
    Reporte.Free;
  end;
end;

procedure TReporteCtto2.SetDataBaseName(DataBase: String);
begin
  qContrato.DatabaseName     := DataBase;
  qContratante.DatabaseName  := DataBase;
  qBeneficiario.DatabaseName := DataBase;
end;

procedure TReporteCtto2.SetSessionName(Session: String);
begin
  qContrato.SessionName 	  := Session;
  qContratante.SessionName  := Session;
  qBeneficiario.SessionName := Session;
end;

procedure TReporteCtto2.TitleBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
Var
  Registro: Integer;
begin   												//	TIPO PERSONA
  if qContrato.FieldByName('CVE_PER_JURIDICA').asString = 'PF' then begin
     lblTipoPersona.Caption := 'PERSONA FISICA';
     lblTipoPersonaB.Caption := 'PERSONA FISICA';
  end
  else
    if qContrato.FieldByName('CVE_PER_JURIDICA').asString = 'PM' then begin
       lblTipoPersona.Caption := 'PERSONA MORAL';
       lblTipoPersonaB.Caption := 'PERSONA MORAL';
  end
  else begin
       lblTipoPersona.Caption := '';
     lblTipoPersonaB.Caption := '';
  end;
//TIPO CORRESPONDENCIA
  if qContrato.fieldByName('CVE_CORRESP').asString = 'RT' then begin
   	lblTipoEnvio.Caption := 'RETENER';
      lblTipoEnvioB.Caption := 'RETENER';
   end
   else if qContrato.fieldByName('CVE_CORRESP').asString = 'CR' then
   begin
   	lblTipoEnvio.Caption := 'CORREO';
      lblTipoEnvioB.Caption := 'CORREO';
   end
	else if qContrato.fieldByName('CVE_CORRESP').asString = 'DH' then
   begin
   	lblTipoEnvio.Caption := 'DHL';
      lblTipoEnvioB.Caption := 'DHL';
   end
   else if qContrato.fieldByName('CVE_CORRESP').asString = 'FX' then
   begin
   	lblTipoEnvio.Caption := 'FEDERAL EXPRESS';
      lblTipoEnvioB.Caption := 'FEDERAL EXPRESS';
   end
   else if qContrato.fieldByName('CVE_CORRESP').asString = 'LQ' then
   begin
   	lblTipoEnvio.Caption := 'LIQUIDACION';
      lblTipoEnvioB.Caption := 'LIQUIDACION';
   end
   else if qContrato.fieldByName('CVE_CORRESP').asString = 'RB' then
   begin
   	lblTipoEnvio.Caption := 'RET. DE BANCO';
      lblTipoEnvioB.Caption := 'RET. DE BANCO';
   end
   else if qContrato.fieldByName('CVE_CORRESP').asString = 'RP' then
   begin
   	lblTipoEnvio.Caption := 'RET. DE CTAS. PROPIAS';
      lblTipoEnvioB.Caption := 'RET. DE CTAS. PROPIAS';
   end
   else if qContrato.fieldByName('CVE_CORRESP').asString = 'RC' then
   begin
   	lblTipoEnvio.Caption := 'RET. DE CTES. MENSAJEROS';
      lblTipoEnvioB.Caption := 'RET. DE CTES. MENSAJEROS';
   end
   else
   begin
   	lblTipoEnvio.Caption := '';
      lblTipoEnvioB.Caption := '';
   end;
   if qContrato.fieldByName('CVE_REGIMEN').asString = 'ID' then
   begin
      lblTipoCuenta.Caption := 'INDIVIDUAL';
      lblTipoCuentaB.Caption := 'INDIVIDUAL';
   end
   else if qContrato.fieldByName('CVE_REGIMEN').asString = 'IN' then
   begin
      lblTipoCuenta.Caption := 'INDISTINTA';
      lblTipoCuentaB.Caption := 'INDISTINTA';
   end
   else if qContrato.fieldByName('CVE_REGIMEN').asString = 'MA' then
   begin
      lblTipoCuenta.Caption := 'MANCOMUNADA';
      lblTipoCuentaB.Caption := 'MANCOMUNADA';
   end
   else
	begin
      lblTipoCuenta.Caption := '';
      lblTipoCuentaB.Caption := '';
   end;


	if qContrato.fieldByName('CVE_TIP_CONTRATO').asString <> 'INPA' then
   begin
   	lblTipoCuentaTitulo.Enabled := True;
      lblTipoCuentaTituloB.Enabled := True;
      lblTipoCuenta.Enabled := True;
      lblTipoCuentaB.Enabled := True;
   end
   else
   begin
   	lblTipoCuentaTitulo.Enabled := False;
      lblTipoCuentaTituloB.Enabled := False;
      lblTipoCuenta.Enabled := False;
      lblTipoCuentaB.Enabled := False;
   end;

   Registro := 1;
   While (not qContratante.EOF) and (Registro<=4)  do
   begin
      case  Registro of
         1: begin
               lblCtte1.Caption  := qContratante.fieldByname('NOMBRE').asString;
               lblTCtte1.Caption := qContratante.fieldByname('DESC_CONTRATANTE').asString;
               lblCtte1B.Caption  := qContratante.fieldByname('NOMBRE').asString;
               lblTCtte1B.Caption := qContratante.fieldByname('DESC_CONTRATANTE').asString;
               lblCtte1.Enabled := True;
               lblTCtte1.Enabled := True;
               LineaCtte1.Enabled := True;
               lblCtte1B.Enabled := True;
               lblTCtte1B.Enabled := True;
               LineaCtte1B.Enabled := True;
         	end;
         2: begin
               lblCtte2.Caption  := qContratante.fieldByname('NOMBRE').asString;
               lblTCtte2.Caption := qContratante.fieldByname('DESC_CONTRATANTE').asString;
               lblCtte2B.Caption  := qContratante.fieldByname('NOMBRE').asString;
               lblTCtte2B.Caption := qContratante.fieldByname('DESC_CONTRATANTE').asString;
               lblCtte2.Enabled := True;
               lblTCtte2.Enabled := True;
               LineaCtte2.Enabled := True;
               lblCtte2B.Enabled := True;
               lblTCtte2B.Enabled := True;
               LineaCtte2B.Enabled := True;
         	end;
         3: begin
         		lblCtte3.Caption  := qContratante.fieldByname('NOMBRE').asString;
               lblTCtte3.Caption := qContratante.fieldByname('DESC_CONTRATANTE').asString;
         		lblCtte3B.Caption  := qContratante.fieldByname('NOMBRE').asString;
               lblTCtte3B.Caption := qContratante.fieldByname('DESC_CONTRATANTE').asString;
               lblCtte3.Enabled := True;
               lblTCtte3.Enabled := True;
               LineaCtte3.Enabled := True;
               lblCtte3B.Enabled := True;
               lblTCtte3B.Enabled := True;
               LineaCtte3B.Enabled := True;
         	end;
         4: begin
         		lblCtte4.Caption  := qContratante.fieldByname('NOMBRE').asString;
               lblTCtte4.Caption := qContratante.fieldByname('DESC_CONTRATANTE').asString;
         		lblCtte4B.Caption  := qContratante.fieldByname('NOMBRE').asString;
               lblTCtte4B.Caption := qContratante.fieldByname('DESC_CONTRATANTE').asString;
               lblCtte4.Enabled := True;
               lblTCtte4.Enabled := True;
               LineaCtte4.Enabled := True;
               lblCtte4B.Enabled := True;
               lblTCtte4B.Enabled := True;
               LineaCtte4B.Enabled := True;
         	end;
      end;
      qContratante.Next;
      Inc(Registro);
   end;
   if qBeneficiario.RecordCount = 0 then begin
      lblBeneficiarioTitulo.Enabled := False;
      lblBeneficiarioTituloB.Enabled := False;
   end
   else begin
      Registro := 1;
      qBeneficiario.First;
      While (not qBeneficiario.EOF) and (Registro<=4) do begin
         case  Registro of
            1: begin
                  lblBene1.Caption  := qBeneficiario.FieldByName('NOMBRE').asString;
                  lblPBene1.Caption := FormatFloat('#.00" %"',qBeneficiario.FieldByName('PCT_BENEFICIO').asfloat);
                  lblBene1B.Caption  := qBeneficiario.FieldByName('NOMBRE').asString;
                  lblPBene1B.Caption := FormatFloat('#.00" %"',qBeneficiario.FieldByName('PCT_BENEFICIO').asfloat);;
                  lblBene1.Enabled := True;
                  lblPBene1.Enabled := True;
                  lblBene1B.Enabled := True;
                  lblPBene1B.Enabled := True;
               end;
            2: begin
                  lblBene2.Caption  := qBeneficiario.FieldByName('NOMBRE').asString;
                  lblPBene2.Caption := FormatFloat('#.00" %"',qBeneficiario.FieldByName('PCT_BENEFICIO').asfloat);
                  lblBene2B.Caption  := qBeneficiario.FieldByName('NOMBRE').asString;
                  lblPBene2B.Caption := FormatFloat('#.00" %"',qBeneficiario.FieldByName('PCT_BENEFICIO').asfloat);
                  lblBene2.Enabled := True;
                  lblPBene2.Enabled := True;
                  lblBene2B.Enabled := True;
                  lblPBene2B.Enabled := True;
               end;
            3: begin
                  lblBene3.Caption  := qBeneficiario.FieldByName('NOMBRE').asString;
                  lblPBene3.Caption := FormatFloat('#.00" %"',qBeneficiario.FieldByName('PCT_BENEFICIO').asfloat);
                  lblBene3B.Caption  := qBeneficiario.FieldByName('NOMBRE').asString;
                  lblPBene3B.Caption := FormatFloat('#.00" %"',qBeneficiario.FieldByName('PCT_BENEFICIO').asfloat);
                  lblBene3.Enabled := True;
                  lblPBene3.Enabled := True;
                  lblBene3B.Enabled := True;
                  lblPBene3B.Enabled := True;
               end;
            4: begin
                  lblBene4.Caption  := qBeneficiario.FieldByName('NOMBRE').asString;
                  lblPBene4.Caption := FormatFloat('#.00" %"',qBeneficiario.FieldByName('PCT_BENEFICIO').asfloat);
                  lblBene4B.Caption  := qBeneficiario.FieldByName('NOMBRE').asString;
                  lblPBene4B.Caption := FormatFloat('#.00" %"',qBeneficiario.FieldByName('PCT_BENEFICIO').asfloat);
                  lblBene4.Enabled := True;
                  lblPBene4.Enabled := True;
                  lblBene4B.Enabled := True;
                  lblPBene4B.Enabled := True;
               end;
         end;
         Application.ProcessMessages;
         qBeneficiario.Next;
         Inc(Registro);
      end;
   end;
end;

end.
